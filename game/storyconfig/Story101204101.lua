return {
	Play120411001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120411001
		arg_1_1.duration_ = 4.266666666666

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120411002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST37"

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
				local var_4_5 = arg_1_1.bgs_.ST37

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
					if iter_4_0 ~= "ST37" then
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

			local var_4_22 = "1029ui_story"

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

			local var_4_26 = arg_1_1.actors_["1029ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1029ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(-0.7, -1.09, -6.2)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1029ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(-0.7, -1.09, -6.2)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = 2

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_4_37 = arg_1_1.actors_["1029ui_story"]
			local var_4_38 = 2

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1029ui_story == nil then
				arg_1_1.var_.characterEffect1029ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.2

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1029ui_story then
					arg_1_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1029ui_story then
				arg_1_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_4_41 = 0
			local var_4_42 = 0.233333333333333

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 0.366666666666667
			local var_4_46 = 0.833333333333333

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.1

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[319].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(120411001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411001", "story_v_out_120411.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_120411", "120411001", "story_v_out_120411.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_120411", "120411001", "story_v_out_120411.awb")

						arg_1_1:RecordAudio("120411001", var_4_59)
						arg_1_1:RecordAudio("120411001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120411", "120411001", "story_v_out_120411.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120411", "120411001", "story_v_out_120411.awb")
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
	Play120411002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120411002
		arg_7_1.duration_ = 6.233

		local var_7_0 = {
			zh = 5.066,
			ja = 6.233
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
				arg_7_0:Play120411003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1029ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect1029ui_story == nil then
				arg_7_1.var_.characterEffect1029ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect1029ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1029ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect1029ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1029ui_story.fillRatio = var_10_5
			end

			local var_10_6 = "1084ui_story"

			if arg_7_1.actors_[var_10_6] == nil then
				local var_10_7 = Object.Instantiate(Asset.Load("Char/" .. var_10_6), arg_7_1.stage_.transform)

				var_10_7.name = var_10_6
				var_10_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_6] = var_10_7

				local var_10_8 = var_10_7:GetComponentInChildren(typeof(CharacterEffect))

				var_10_8.enabled = true

				local var_10_9 = GameObjectTools.GetOrAddComponent(var_10_7, typeof(DynamicBoneHelper))

				if var_10_9 then
					var_10_9:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_8.transform, false)

				arg_7_1.var_[var_10_6 .. "Animator"] = var_10_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_6 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_6 .. "LipSync"] = var_10_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_10 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_10.localPosition
			end

			local var_10_12 = 0.001

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_12 then
				local var_10_13 = (arg_7_1.time_ - var_10_11) / var_10_12
				local var_10_14 = Vector3.New(0.7, -0.97, -6)

				var_10_10.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_14, var_10_13)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_10.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_10.localEulerAngles = var_10_16
			end

			if arg_7_1.time_ >= var_10_11 + var_10_12 and arg_7_1.time_ < var_10_11 + var_10_12 + arg_10_0 then
				var_10_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_10_17 = manager.ui.mainCamera.transform.position - var_10_10.position

				var_10_10.forward = Vector3.New(var_10_17.x, var_10_17.y, var_10_17.z)

				local var_10_18 = var_10_10.localEulerAngles

				var_10_18.z = 0
				var_10_18.x = 0
				var_10_10.localEulerAngles = var_10_18
			end

			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_10_21 = arg_7_1.actors_["1084ui_story"]
			local var_10_22 = 0

			if var_10_22 < arg_7_1.time_ and arg_7_1.time_ <= var_10_22 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_23 = 0.2

			if var_10_22 <= arg_7_1.time_ and arg_7_1.time_ < var_10_22 + var_10_23 then
				local var_10_24 = (arg_7_1.time_ - var_10_22) / var_10_23

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_22 + var_10_23 and arg_7_1.time_ < var_10_22 + var_10_23 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_25 = 0
			local var_10_26 = 0.45

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(120411002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411002", "story_v_out_120411.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_120411", "120411002", "story_v_out_120411.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_120411", "120411002", "story_v_out_120411.awb")

						arg_7_1:RecordAudio("120411002", var_10_34)
						arg_7_1:RecordAudio("120411002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_120411", "120411002", "story_v_out_120411.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_120411", "120411002", "story_v_out_120411.awb")
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
	Play120411003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120411003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play120411004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1084ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_5
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

				local var_14_9 = arg_11_1:GetWordFromCfg(120411003)
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
	Play120411004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120411004
		arg_15_1.duration_ = 1.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play120411005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1029ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1029ui_story == nil then
				arg_15_1.var_.characterEffect1029ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1029ui_story then
					arg_15_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1029ui_story then
				arg_15_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_18_6 = 0
			local var_18_7 = 0.075

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[319].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(120411004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411004", "story_v_out_120411.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_120411", "120411004", "story_v_out_120411.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_120411", "120411004", "story_v_out_120411.awb")

						arg_15_1:RecordAudio("120411004", var_18_15)
						arg_15_1:RecordAudio("120411004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_120411", "120411004", "story_v_out_120411.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_120411", "120411004", "story_v_out_120411.awb")
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
	Play120411005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120411005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play120411006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["1029ui_story"].transform
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1.var_.moveOldPos1029ui_story = var_22_9.localPosition
			end

			local var_22_11 = 0.001

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11
				local var_22_13 = Vector3.New(0, 100, 0)

				var_22_9.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1029ui_story, var_22_13, var_22_12)

				local var_22_14 = manager.ui.mainCamera.transform.position - var_22_9.position

				var_22_9.forward = Vector3.New(var_22_14.x, var_22_14.y, var_22_14.z)

				local var_22_15 = var_22_9.localEulerAngles

				var_22_15.z = 0
				var_22_15.x = 0
				var_22_9.localEulerAngles = var_22_15
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 then
				var_22_9.localPosition = Vector3.New(0, 100, 0)

				local var_22_16 = manager.ui.mainCamera.transform.position - var_22_9.position

				var_22_9.forward = Vector3.New(var_22_16.x, var_22_16.y, var_22_16.z)

				local var_22_17 = var_22_9.localEulerAngles

				var_22_17.z = 0
				var_22_17.x = 0
				var_22_9.localEulerAngles = var_22_17
			end

			local var_22_18 = 0
			local var_22_19 = 1.025

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_20 = arg_19_1:GetWordFromCfg(120411005)
				local var_22_21 = arg_19_1:FormatText(var_22_20.content)

				arg_19_1.text_.text = var_22_21

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_22 = 41
				local var_22_23 = utf8.len(var_22_21)
				local var_22_24 = var_22_22 <= 0 and var_22_19 or var_22_19 * (var_22_23 / var_22_22)

				if var_22_24 > 0 and var_22_19 < var_22_24 then
					arg_19_1.talkMaxDuration = var_22_24

					if var_22_24 + var_22_18 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_24 + var_22_18
					end
				end

				arg_19_1.text_.text = var_22_21
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_25 = math.max(var_22_19, arg_19_1.talkMaxDuration)

			if var_22_18 <= arg_19_1.time_ and arg_19_1.time_ < var_22_18 + var_22_25 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_18) / var_22_25

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_18 + var_22_25 and arg_19_1.time_ < var_22_18 + var_22_25 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120411006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120411006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120411007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.725

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

				local var_26_2 = arg_23_1:GetWordFromCfg(120411006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 29
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
	Play120411007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120411007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play120411008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.65

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[7].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(120411007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 26
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
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_8 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_8 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_8

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_8 and arg_27_1.time_ < var_30_0 + var_30_8 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120411008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120411008
		arg_31_1.duration_ = 4.333

		local var_31_0 = {
			zh = 3.1,
			ja = 4.333
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
				arg_31_0:Play120411009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_34_1 = arg_31_1.actors_["1084ui_story"]
			local var_34_2 = 0

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_3 = 0.2

			if var_34_2 <= arg_31_1.time_ and arg_31_1.time_ < var_34_2 + var_34_3 then
				local var_34_4 = (arg_31_1.time_ - var_34_2) / var_34_3

				if arg_31_1.var_.characterEffect1084ui_story then
					arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_2 + var_34_3 and arg_31_1.time_ < var_34_2 + var_34_3 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story then
				arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_34_5 = arg_31_1.actors_["1084ui_story"].transform
			local var_34_6 = 0

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.var_.moveOldPos1084ui_story = var_34_5.localPosition
			end

			local var_34_7 = 0.001

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_7 then
				local var_34_8 = (arg_31_1.time_ - var_34_6) / var_34_7
				local var_34_9 = Vector3.New(0, -0.97, -6)

				var_34_5.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084ui_story, var_34_9, var_34_8)

				local var_34_10 = manager.ui.mainCamera.transform.position - var_34_5.position

				var_34_5.forward = Vector3.New(var_34_10.x, var_34_10.y, var_34_10.z)

				local var_34_11 = var_34_5.localEulerAngles

				var_34_11.z = 0
				var_34_11.x = 0
				var_34_5.localEulerAngles = var_34_11
			end

			if arg_31_1.time_ >= var_34_6 + var_34_7 and arg_31_1.time_ < var_34_6 + var_34_7 + arg_34_0 then
				var_34_5.localPosition = Vector3.New(0, -0.97, -6)

				local var_34_12 = manager.ui.mainCamera.transform.position - var_34_5.position

				var_34_5.forward = Vector3.New(var_34_12.x, var_34_12.y, var_34_12.z)

				local var_34_13 = var_34_5.localEulerAngles

				var_34_13.z = 0
				var_34_13.x = 0
				var_34_5.localEulerAngles = var_34_13
			end

			local var_34_14 = 0
			local var_34_15 = 0.525

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_16 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_17 = arg_31_1:GetWordFromCfg(120411008)
				local var_34_18 = arg_31_1:FormatText(var_34_17.content)

				arg_31_1.text_.text = var_34_18

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_19 = 21
				local var_34_20 = utf8.len(var_34_18)
				local var_34_21 = var_34_19 <= 0 and var_34_15 or var_34_15 * (var_34_20 / var_34_19)

				if var_34_21 > 0 and var_34_15 < var_34_21 then
					arg_31_1.talkMaxDuration = var_34_21

					if var_34_21 + var_34_14 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_14
					end
				end

				arg_31_1.text_.text = var_34_18
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411008", "story_v_out_120411.awb") ~= 0 then
					local var_34_22 = manager.audio:GetVoiceLength("story_v_out_120411", "120411008", "story_v_out_120411.awb") / 1000

					if var_34_22 + var_34_14 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_22 + var_34_14
					end

					if var_34_17.prefab_name ~= "" and arg_31_1.actors_[var_34_17.prefab_name] ~= nil then
						local var_34_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_17.prefab_name].transform, "story_v_out_120411", "120411008", "story_v_out_120411.awb")

						arg_31_1:RecordAudio("120411008", var_34_23)
						arg_31_1:RecordAudio("120411008", var_34_23)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120411", "120411008", "story_v_out_120411.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120411", "120411008", "story_v_out_120411.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_24 = math.max(var_34_15, arg_31_1.talkMaxDuration)

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_24 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_14) / var_34_24

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_14 + var_34_24 and arg_31_1.time_ < var_34_14 + var_34_24 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120411009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120411009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play120411010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1084ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1084ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1084ui_story.fillRatio = var_38_5
			end

			local var_38_6 = 0
			local var_38_7 = 0.975

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(120411009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 39
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_14 and arg_35_1.time_ < var_38_6 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120411010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120411010
		arg_39_1.duration_ = 2.7

		local var_39_0 = {
			zh = 2.533333333332,
			ja = 2.7
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
				arg_39_0:Play120411011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_42_1 = arg_39_1.actors_["1084ui_story"]
			local var_42_2 = 0

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story == nil then
				arg_39_1.var_.characterEffect1084ui_story = var_42_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_3 = 0.2

			if var_42_2 <= arg_39_1.time_ and arg_39_1.time_ < var_42_2 + var_42_3 then
				local var_42_4 = (arg_39_1.time_ - var_42_2) / var_42_3

				if arg_39_1.var_.characterEffect1084ui_story then
					arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_2 + var_42_3 and arg_39_1.time_ < var_42_2 + var_42_3 + arg_42_0 and arg_39_1.var_.characterEffect1084ui_story then
				arg_39_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_42_6 = 0
			local var_42_7 = 0.35

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[6].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(120411010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411010", "story_v_out_120411.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_120411", "120411010", "story_v_out_120411.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_120411", "120411010", "story_v_out_120411.awb")

						arg_39_1:RecordAudio("120411010", var_42_15)
						arg_39_1:RecordAudio("120411010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_120411", "120411010", "story_v_out_120411.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_120411", "120411010", "story_v_out_120411.awb")
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
	Play120411011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120411011
		arg_43_1.duration_ = 2.4

		local var_43_0 = {
			zh = 2.166,
			ja = 2.4
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
				arg_43_0:Play120411012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1084ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1084ui_story.fillRatio = var_46_5
			end

			local var_46_6 = 0

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_46_7 = arg_43_1.actors_["1029ui_story"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect1029ui_story == nil then
				arg_43_1.var_.characterEffect1029ui_story = var_46_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_9 = 0.2

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.characterEffect1029ui_story then
					arg_43_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.characterEffect1029ui_story then
				arg_43_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_46_11 = arg_43_1.actors_["1029ui_story"].transform
			local var_46_12 = 0

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 then
				arg_43_1.var_.moveOldPos1029ui_story = var_46_11.localPosition
			end

			local var_46_13 = 0.001

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_13 then
				local var_46_14 = (arg_43_1.time_ - var_46_12) / var_46_13
				local var_46_15 = Vector3.New(0, -1.09, -6.2)

				var_46_11.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1029ui_story, var_46_15, var_46_14)

				local var_46_16 = manager.ui.mainCamera.transform.position - var_46_11.position

				var_46_11.forward = Vector3.New(var_46_16.x, var_46_16.y, var_46_16.z)

				local var_46_17 = var_46_11.localEulerAngles

				var_46_17.z = 0
				var_46_17.x = 0
				var_46_11.localEulerAngles = var_46_17
			end

			if arg_43_1.time_ >= var_46_12 + var_46_13 and arg_43_1.time_ < var_46_12 + var_46_13 + arg_46_0 then
				var_46_11.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_46_18 = manager.ui.mainCamera.transform.position - var_46_11.position

				var_46_11.forward = Vector3.New(var_46_18.x, var_46_18.y, var_46_18.z)

				local var_46_19 = var_46_11.localEulerAngles

				var_46_19.z = 0
				var_46_19.x = 0
				var_46_11.localEulerAngles = var_46_19
			end

			local var_46_20 = arg_43_1.actors_["1084ui_story"].transform
			local var_46_21 = 0

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 then
				arg_43_1.var_.moveOldPos1084ui_story = var_46_20.localPosition
			end

			local var_46_22 = 0.001

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_22 then
				local var_46_23 = (arg_43_1.time_ - var_46_21) / var_46_22
				local var_46_24 = Vector3.New(0, 100, 0)

				var_46_20.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1084ui_story, var_46_24, var_46_23)

				local var_46_25 = manager.ui.mainCamera.transform.position - var_46_20.position

				var_46_20.forward = Vector3.New(var_46_25.x, var_46_25.y, var_46_25.z)

				local var_46_26 = var_46_20.localEulerAngles

				var_46_26.z = 0
				var_46_26.x = 0
				var_46_20.localEulerAngles = var_46_26
			end

			if arg_43_1.time_ >= var_46_21 + var_46_22 and arg_43_1.time_ < var_46_21 + var_46_22 + arg_46_0 then
				var_46_20.localPosition = Vector3.New(0, 100, 0)

				local var_46_27 = manager.ui.mainCamera.transform.position - var_46_20.position

				var_46_20.forward = Vector3.New(var_46_27.x, var_46_27.y, var_46_27.z)

				local var_46_28 = var_46_20.localEulerAngles

				var_46_28.z = 0
				var_46_28.x = 0
				var_46_20.localEulerAngles = var_46_28
			end

			local var_46_29 = 0
			local var_46_30 = 0.225

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_31 = arg_43_1:FormatText(StoryNameCfg[319].name)

				arg_43_1.leftNameTxt_.text = var_46_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_32 = arg_43_1:GetWordFromCfg(120411011)
				local var_46_33 = arg_43_1:FormatText(var_46_32.content)

				arg_43_1.text_.text = var_46_33

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_34 = 9
				local var_46_35 = utf8.len(var_46_33)
				local var_46_36 = var_46_34 <= 0 and var_46_30 or var_46_30 * (var_46_35 / var_46_34)

				if var_46_36 > 0 and var_46_30 < var_46_36 then
					arg_43_1.talkMaxDuration = var_46_36

					if var_46_36 + var_46_29 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_36 + var_46_29
					end
				end

				arg_43_1.text_.text = var_46_33
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411011", "story_v_out_120411.awb") ~= 0 then
					local var_46_37 = manager.audio:GetVoiceLength("story_v_out_120411", "120411011", "story_v_out_120411.awb") / 1000

					if var_46_37 + var_46_29 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_37 + var_46_29
					end

					if var_46_32.prefab_name ~= "" and arg_43_1.actors_[var_46_32.prefab_name] ~= nil then
						local var_46_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_32.prefab_name].transform, "story_v_out_120411", "120411011", "story_v_out_120411.awb")

						arg_43_1:RecordAudio("120411011", var_46_38)
						arg_43_1:RecordAudio("120411011", var_46_38)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120411", "120411011", "story_v_out_120411.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120411", "120411011", "story_v_out_120411.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_39 = math.max(var_46_30, arg_43_1.talkMaxDuration)

			if var_46_29 <= arg_43_1.time_ and arg_43_1.time_ < var_46_29 + var_46_39 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_29) / var_46_39

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_29 + var_46_39 and arg_43_1.time_ < var_46_29 + var_46_39 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120411012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120411012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play120411013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1029ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1029ui_story == nil then
				arg_47_1.var_.characterEffect1029ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1029ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1029ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1029ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1029ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.575

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

				local var_50_8 = arg_47_1:GetWordFromCfg(120411012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 23
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
	Play120411013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120411013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120411014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.675

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(120411013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 27
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_8 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_8 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_8

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_8 and arg_51_1.time_ < var_54_0 + var_54_8 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play120411014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120411014
		arg_55_1.duration_ = 4.3

		local var_55_0 = {
			zh = 4.3,
			ja = 4.066
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
				arg_55_0:Play120411015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1029ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story == nil then
				arg_55_1.var_.characterEffect1029ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1029ui_story then
					arg_55_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1029ui_story then
				arg_55_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_58_4 = 0
			local var_58_5 = 0.6

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_6 = arg_55_1:FormatText(StoryNameCfg[319].name)

				arg_55_1.leftNameTxt_.text = var_58_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_7 = arg_55_1:GetWordFromCfg(120411014)
				local var_58_8 = arg_55_1:FormatText(var_58_7.content)

				arg_55_1.text_.text = var_58_8

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_9 = 24
				local var_58_10 = utf8.len(var_58_8)
				local var_58_11 = var_58_9 <= 0 and var_58_5 or var_58_5 * (var_58_10 / var_58_9)

				if var_58_11 > 0 and var_58_5 < var_58_11 then
					arg_55_1.talkMaxDuration = var_58_11

					if var_58_11 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_11 + var_58_4
					end
				end

				arg_55_1.text_.text = var_58_8
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411014", "story_v_out_120411.awb") ~= 0 then
					local var_58_12 = manager.audio:GetVoiceLength("story_v_out_120411", "120411014", "story_v_out_120411.awb") / 1000

					if var_58_12 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_4
					end

					if var_58_7.prefab_name ~= "" and arg_55_1.actors_[var_58_7.prefab_name] ~= nil then
						local var_58_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_7.prefab_name].transform, "story_v_out_120411", "120411014", "story_v_out_120411.awb")

						arg_55_1:RecordAudio("120411014", var_58_13)
						arg_55_1:RecordAudio("120411014", var_58_13)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_120411", "120411014", "story_v_out_120411.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_120411", "120411014", "story_v_out_120411.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_14 = math.max(var_58_5, arg_55_1.talkMaxDuration)

			if var_58_4 <= arg_55_1.time_ and arg_55_1.time_ < var_58_4 + var_58_14 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_4) / var_58_14

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_4 + var_58_14 and arg_55_1.time_ < var_58_4 + var_58_14 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120411015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120411015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play120411016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1029ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1029ui_story == nil then
				arg_59_1.var_.characterEffect1029ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1029ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1029ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1029ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1029ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.075

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(120411015)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 3
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_14 and arg_59_1.time_ < var_62_6 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play120411016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120411016
		arg_63_1.duration_ = 5.466

		local var_63_0 = {
			zh = 5.466,
			ja = 5.433
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
				arg_63_0:Play120411017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1029ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1029ui_story == nil then
				arg_63_1.var_.characterEffect1029ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1029ui_story then
					arg_63_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1029ui_story then
				arg_63_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_66_4 = 0
			local var_66_5 = 0.725

			if var_66_4 < arg_63_1.time_ and arg_63_1.time_ <= var_66_4 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_6 = arg_63_1:FormatText(StoryNameCfg[319].name)

				arg_63_1.leftNameTxt_.text = var_66_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_7 = arg_63_1:GetWordFromCfg(120411016)
				local var_66_8 = arg_63_1:FormatText(var_66_7.content)

				arg_63_1.text_.text = var_66_8

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_9 = 29
				local var_66_10 = utf8.len(var_66_8)
				local var_66_11 = var_66_9 <= 0 and var_66_5 or var_66_5 * (var_66_10 / var_66_9)

				if var_66_11 > 0 and var_66_5 < var_66_11 then
					arg_63_1.talkMaxDuration = var_66_11

					if var_66_11 + var_66_4 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_11 + var_66_4
					end
				end

				arg_63_1.text_.text = var_66_8
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411016", "story_v_out_120411.awb") ~= 0 then
					local var_66_12 = manager.audio:GetVoiceLength("story_v_out_120411", "120411016", "story_v_out_120411.awb") / 1000

					if var_66_12 + var_66_4 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_12 + var_66_4
					end

					if var_66_7.prefab_name ~= "" and arg_63_1.actors_[var_66_7.prefab_name] ~= nil then
						local var_66_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_7.prefab_name].transform, "story_v_out_120411", "120411016", "story_v_out_120411.awb")

						arg_63_1:RecordAudio("120411016", var_66_13)
						arg_63_1:RecordAudio("120411016", var_66_13)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_120411", "120411016", "story_v_out_120411.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_120411", "120411016", "story_v_out_120411.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_14 = math.max(var_66_5, arg_63_1.talkMaxDuration)

			if var_66_4 <= arg_63_1.time_ and arg_63_1.time_ < var_66_4 + var_66_14 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_4) / var_66_14

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_4 + var_66_14 and arg_63_1.time_ < var_66_4 + var_66_14 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120411017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120411017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play120411018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1029ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1029ui_story == nil then
				arg_67_1.var_.characterEffect1029ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1029ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1029ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1029ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1029ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.75

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[7].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(120411017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 30
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
	Play120411018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120411018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play120411019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1.175

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[7].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(120411018)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 47
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_8 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_8 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_8

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_8 and arg_71_1.time_ < var_74_0 + var_74_8 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play120411019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120411019
		arg_75_1.duration_ = 7.066

		local var_75_0 = {
			zh = 3.866,
			ja = 7.066
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
				arg_75_0:Play120411020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1029ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1029ui_story == nil then
				arg_75_1.var_.characterEffect1029ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1029ui_story then
					arg_75_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1029ui_story then
				arg_75_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_78_4 = 0
			local var_78_5 = 0.35

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_6 = arg_75_1:FormatText(StoryNameCfg[319].name)

				arg_75_1.leftNameTxt_.text = var_78_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_7 = arg_75_1:GetWordFromCfg(120411019)
				local var_78_8 = arg_75_1:FormatText(var_78_7.content)

				arg_75_1.text_.text = var_78_8

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_9 = 14
				local var_78_10 = utf8.len(var_78_8)
				local var_78_11 = var_78_9 <= 0 and var_78_5 or var_78_5 * (var_78_10 / var_78_9)

				if var_78_11 > 0 and var_78_5 < var_78_11 then
					arg_75_1.talkMaxDuration = var_78_11

					if var_78_11 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_11 + var_78_4
					end
				end

				arg_75_1.text_.text = var_78_8
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411019", "story_v_out_120411.awb") ~= 0 then
					local var_78_12 = manager.audio:GetVoiceLength("story_v_out_120411", "120411019", "story_v_out_120411.awb") / 1000

					if var_78_12 + var_78_4 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_12 + var_78_4
					end

					if var_78_7.prefab_name ~= "" and arg_75_1.actors_[var_78_7.prefab_name] ~= nil then
						local var_78_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_7.prefab_name].transform, "story_v_out_120411", "120411019", "story_v_out_120411.awb")

						arg_75_1:RecordAudio("120411019", var_78_13)
						arg_75_1:RecordAudio("120411019", var_78_13)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_120411", "120411019", "story_v_out_120411.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_120411", "120411019", "story_v_out_120411.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_14 = math.max(var_78_5, arg_75_1.talkMaxDuration)

			if var_78_4 <= arg_75_1.time_ and arg_75_1.time_ < var_78_4 + var_78_14 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_4) / var_78_14

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_4 + var_78_14 and arg_75_1.time_ < var_78_4 + var_78_14 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play120411020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120411020
		arg_79_1.duration_ = 7.5

		local var_79_0 = {
			zh = 4.4,
			ja = 7.5
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
				arg_79_0:Play120411021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1029ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1029ui_story == nil then
				arg_79_1.var_.characterEffect1029ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1029ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1029ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1029ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1029ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_82_7 = arg_79_1.actors_["1084ui_story"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_9 = 0.2

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_82_12 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_12.localPosition
			end

			local var_82_14 = 0.001

			if var_82_13 <= arg_79_1.time_ and arg_79_1.time_ < var_82_13 + var_82_14 then
				local var_82_15 = (arg_79_1.time_ - var_82_13) / var_82_14
				local var_82_16 = Vector3.New(-0.7, -0.97, -6)

				var_82_12.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_16, var_82_15)

				local var_82_17 = manager.ui.mainCamera.transform.position - var_82_12.position

				var_82_12.forward = Vector3.New(var_82_17.x, var_82_17.y, var_82_17.z)

				local var_82_18 = var_82_12.localEulerAngles

				var_82_18.z = 0
				var_82_18.x = 0
				var_82_12.localEulerAngles = var_82_18
			end

			if arg_79_1.time_ >= var_82_13 + var_82_14 and arg_79_1.time_ < var_82_13 + var_82_14 + arg_82_0 then
				var_82_12.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_82_19 = manager.ui.mainCamera.transform.position - var_82_12.position

				var_82_12.forward = Vector3.New(var_82_19.x, var_82_19.y, var_82_19.z)

				local var_82_20 = var_82_12.localEulerAngles

				var_82_20.z = 0
				var_82_20.x = 0
				var_82_12.localEulerAngles = var_82_20
			end

			local var_82_21 = arg_79_1.actors_["1029ui_story"].transform
			local var_82_22 = 0

			if var_82_22 < arg_79_1.time_ and arg_79_1.time_ <= var_82_22 + arg_82_0 then
				arg_79_1.var_.moveOldPos1029ui_story = var_82_21.localPosition
			end

			local var_82_23 = 0.001

			if var_82_22 <= arg_79_1.time_ and arg_79_1.time_ < var_82_22 + var_82_23 then
				local var_82_24 = (arg_79_1.time_ - var_82_22) / var_82_23
				local var_82_25 = Vector3.New(0.7, -1.09, -6.2)

				var_82_21.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1029ui_story, var_82_25, var_82_24)

				local var_82_26 = manager.ui.mainCamera.transform.position - var_82_21.position

				var_82_21.forward = Vector3.New(var_82_26.x, var_82_26.y, var_82_26.z)

				local var_82_27 = var_82_21.localEulerAngles

				var_82_27.z = 0
				var_82_27.x = 0
				var_82_21.localEulerAngles = var_82_27
			end

			if arg_79_1.time_ >= var_82_22 + var_82_23 and arg_79_1.time_ < var_82_22 + var_82_23 + arg_82_0 then
				var_82_21.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_82_28 = manager.ui.mainCamera.transform.position - var_82_21.position

				var_82_21.forward = Vector3.New(var_82_28.x, var_82_28.y, var_82_28.z)

				local var_82_29 = var_82_21.localEulerAngles

				var_82_29.z = 0
				var_82_29.x = 0
				var_82_21.localEulerAngles = var_82_29
			end

			local var_82_30 = 0
			local var_82_31 = 0.575

			if var_82_30 < arg_79_1.time_ and arg_79_1.time_ <= var_82_30 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_32 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_33 = arg_79_1:GetWordFromCfg(120411020)
				local var_82_34 = arg_79_1:FormatText(var_82_33.content)

				arg_79_1.text_.text = var_82_34

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_35 = 23
				local var_82_36 = utf8.len(var_82_34)
				local var_82_37 = var_82_35 <= 0 and var_82_31 or var_82_31 * (var_82_36 / var_82_35)

				if var_82_37 > 0 and var_82_31 < var_82_37 then
					arg_79_1.talkMaxDuration = var_82_37

					if var_82_37 + var_82_30 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_37 + var_82_30
					end
				end

				arg_79_1.text_.text = var_82_34
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411020", "story_v_out_120411.awb") ~= 0 then
					local var_82_38 = manager.audio:GetVoiceLength("story_v_out_120411", "120411020", "story_v_out_120411.awb") / 1000

					if var_82_38 + var_82_30 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_38 + var_82_30
					end

					if var_82_33.prefab_name ~= "" and arg_79_1.actors_[var_82_33.prefab_name] ~= nil then
						local var_82_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_33.prefab_name].transform, "story_v_out_120411", "120411020", "story_v_out_120411.awb")

						arg_79_1:RecordAudio("120411020", var_82_39)
						arg_79_1:RecordAudio("120411020", var_82_39)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_120411", "120411020", "story_v_out_120411.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_120411", "120411020", "story_v_out_120411.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_40 = math.max(var_82_31, arg_79_1.talkMaxDuration)

			if var_82_30 <= arg_79_1.time_ and arg_79_1.time_ < var_82_30 + var_82_40 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_30) / var_82_40

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_30 + var_82_40 and arg_79_1.time_ < var_82_30 + var_82_40 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play120411021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120411021
		arg_83_1.duration_ = 5.633

		local var_83_0 = {
			zh = 4.9,
			ja = 5.633
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
				arg_83_0:Play120411022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_86_2 = 0
			local var_86_3 = 0.675

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_4 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_5 = arg_83_1:GetWordFromCfg(120411021)
				local var_86_6 = arg_83_1:FormatText(var_86_5.content)

				arg_83_1.text_.text = var_86_6

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_7 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411021", "story_v_out_120411.awb") ~= 0 then
					local var_86_10 = manager.audio:GetVoiceLength("story_v_out_120411", "120411021", "story_v_out_120411.awb") / 1000

					if var_86_10 + var_86_2 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_10 + var_86_2
					end

					if var_86_5.prefab_name ~= "" and arg_83_1.actors_[var_86_5.prefab_name] ~= nil then
						local var_86_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_5.prefab_name].transform, "story_v_out_120411", "120411021", "story_v_out_120411.awb")

						arg_83_1:RecordAudio("120411021", var_86_11)
						arg_83_1:RecordAudio("120411021", var_86_11)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_120411", "120411021", "story_v_out_120411.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_120411", "120411021", "story_v_out_120411.awb")
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
	Play120411022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 120411022
		arg_87_1.duration_ = 12.6

		local var_87_0 = {
			zh = 8.8,
			ja = 12.6
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
				arg_87_0:Play120411023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1029ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1029ui_story == nil then
				arg_87_1.var_.characterEffect1029ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1029ui_story then
					arg_87_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1029ui_story then
				arg_87_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1084ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.2

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect1084ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_9
			end

			local var_90_10 = 0
			local var_90_11 = 1.1

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_12 = arg_87_1:FormatText(StoryNameCfg[319].name)

				arg_87_1.leftNameTxt_.text = var_90_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_13 = arg_87_1:GetWordFromCfg(120411022)
				local var_90_14 = arg_87_1:FormatText(var_90_13.content)

				arg_87_1.text_.text = var_90_14

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_15 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411022", "story_v_out_120411.awb") ~= 0 then
					local var_90_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411022", "story_v_out_120411.awb") / 1000

					if var_90_18 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_18 + var_90_10
					end

					if var_90_13.prefab_name ~= "" and arg_87_1.actors_[var_90_13.prefab_name] ~= nil then
						local var_90_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_13.prefab_name].transform, "story_v_out_120411", "120411022", "story_v_out_120411.awb")

						arg_87_1:RecordAudio("120411022", var_90_19)
						arg_87_1:RecordAudio("120411022", var_90_19)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_120411", "120411022", "story_v_out_120411.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_120411", "120411022", "story_v_out_120411.awb")
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
	Play120411023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 120411023
		arg_91_1.duration_ = 3.033

		local var_91_0 = {
			zh = 3.033,
			ja = 2.533
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
				arg_91_0:Play120411024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.25

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[319].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(120411023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411023", "story_v_out_120411.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411023", "story_v_out_120411.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_120411", "120411023", "story_v_out_120411.awb")

						arg_91_1:RecordAudio("120411023", var_94_9)
						arg_91_1:RecordAudio("120411023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_120411", "120411023", "story_v_out_120411.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_120411", "120411023", "story_v_out_120411.awb")
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
	Play120411024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 120411024
		arg_95_1.duration_ = 0.999999999999

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"

			SetActive(arg_95_1.choicesGo_, true)

			for iter_96_0, iter_96_1 in ipairs(arg_95_1.choices_) do
				local var_96_0 = iter_96_0 <= 3

				SetActive(iter_96_1.go, var_96_0)
			end

			arg_95_1.choices_[1].txt.text = arg_95_1:FormatText(StoryChoiceCfg[383].name)
			arg_95_1.choices_[2].txt.text = arg_95_1:FormatText(StoryChoiceCfg[384].name)
			arg_95_1.choices_[3].txt.text = arg_95_1:FormatText(StoryChoiceCfg[385].name)
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play120411025(arg_95_1)
			end

			if arg_97_0 == 2 then
				arg_95_0:Play120411025(arg_95_1)
			end

			if arg_97_0 == 3 then
				arg_95_0:Play120411025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1029ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1029ui_story == nil then
				arg_95_1.var_.characterEffect1029ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.2

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1029ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1029ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1029ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1029ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.allBtn_.enabled = false
			end

			local var_98_7 = 1

			if arg_95_1.time_ >= var_98_6 + var_98_7 and arg_95_1.time_ < var_98_6 + var_98_7 + arg_98_0 then
				arg_95_1.allBtn_.enabled = true
			end
		end
	end,
	Play120411025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120411025
		arg_99_1.duration_ = 4.866

		local var_99_0 = {
			zh = 4.5,
			ja = 4.866
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
				arg_99_0:Play120411026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_102_1 = arg_99_1.actors_["1029ui_story"]
			local var_102_2 = 0

			if var_102_2 < arg_99_1.time_ and arg_99_1.time_ <= var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1029ui_story == nil then
				arg_99_1.var_.characterEffect1029ui_story = var_102_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_3 = 0.2

			if var_102_2 <= arg_99_1.time_ and arg_99_1.time_ < var_102_2 + var_102_3 then
				local var_102_4 = (arg_99_1.time_ - var_102_2) / var_102_3

				if arg_99_1.var_.characterEffect1029ui_story then
					arg_99_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_2 + var_102_3 and arg_99_1.time_ < var_102_2 + var_102_3 + arg_102_0 and arg_99_1.var_.characterEffect1029ui_story then
				arg_99_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_102_5 = 0
			local var_102_6 = 0.4

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_7 = arg_99_1:FormatText(StoryNameCfg[319].name)

				arg_99_1.leftNameTxt_.text = var_102_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_8 = arg_99_1:GetWordFromCfg(120411025)
				local var_102_9 = arg_99_1:FormatText(var_102_8.content)

				arg_99_1.text_.text = var_102_9

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_10 = 16
				local var_102_11 = utf8.len(var_102_9)
				local var_102_12 = var_102_10 <= 0 and var_102_6 or var_102_6 * (var_102_11 / var_102_10)

				if var_102_12 > 0 and var_102_6 < var_102_12 then
					arg_99_1.talkMaxDuration = var_102_12

					if var_102_12 + var_102_5 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_12 + var_102_5
					end
				end

				arg_99_1.text_.text = var_102_9
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411025", "story_v_out_120411.awb") ~= 0 then
					local var_102_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411025", "story_v_out_120411.awb") / 1000

					if var_102_13 + var_102_5 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_13 + var_102_5
					end

					if var_102_8.prefab_name ~= "" and arg_99_1.actors_[var_102_8.prefab_name] ~= nil then
						local var_102_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_8.prefab_name].transform, "story_v_out_120411", "120411025", "story_v_out_120411.awb")

						arg_99_1:RecordAudio("120411025", var_102_14)
						arg_99_1:RecordAudio("120411025", var_102_14)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_120411", "120411025", "story_v_out_120411.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_120411", "120411025", "story_v_out_120411.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_15 = math.max(var_102_6, arg_99_1.talkMaxDuration)

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_15 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_5) / var_102_15

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_5 + var_102_15 and arg_99_1.time_ < var_102_5 + var_102_15 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play120411026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 120411026
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play120411027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1029ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1029ui_story == nil then
				arg_103_1.var_.characterEffect1029ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1029ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1029ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1029ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1029ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.55

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[7].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(120411026)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 22
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_14 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_14 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_14

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_14 and arg_103_1.time_ < var_106_6 + var_106_14 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play120411027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 120411027
		arg_107_1.duration_ = 7.9

		local var_107_0 = {
			zh = 4.333,
			ja = 7.9
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
				arg_107_0:Play120411028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1084ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story == nil then
				arg_107_1.var_.characterEffect1084ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1084ui_story then
					arg_107_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story then
				arg_107_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_110_4 = 0

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_110_6 = 0
			local var_110_7 = 0.6

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(120411027)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 24
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411027", "story_v_out_120411.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_120411", "120411027", "story_v_out_120411.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_120411", "120411027", "story_v_out_120411.awb")

						arg_107_1:RecordAudio("120411027", var_110_15)
						arg_107_1:RecordAudio("120411027", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_120411", "120411027", "story_v_out_120411.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_120411", "120411027", "story_v_out_120411.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_16 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_16

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_16 and arg_107_1.time_ < var_110_6 + var_110_16 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play120411028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120411028
		arg_111_1.duration_ = 6.333

		local var_111_0 = {
			zh = 5.2,
			ja = 6.333
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
				arg_111_0:Play120411029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1084ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story == nil then
				arg_111_1.var_.characterEffect1084ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1084ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_5
			end

			local var_114_6 = arg_111_1.actors_["1029ui_story"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.characterEffect1029ui_story == nil then
				arg_111_1.var_.characterEffect1029ui_story = var_114_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_8 = 0.2

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.characterEffect1029ui_story then
					arg_111_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.characterEffect1029ui_story then
				arg_111_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_114_10 = 0
			local var_114_11 = 0.5

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_12 = arg_111_1:FormatText(StoryNameCfg[319].name)

				arg_111_1.leftNameTxt_.text = var_114_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_13 = arg_111_1:GetWordFromCfg(120411028)
				local var_114_14 = arg_111_1:FormatText(var_114_13.content)

				arg_111_1.text_.text = var_114_14

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_15 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411028", "story_v_out_120411.awb") ~= 0 then
					local var_114_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411028", "story_v_out_120411.awb") / 1000

					if var_114_18 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_10
					end

					if var_114_13.prefab_name ~= "" and arg_111_1.actors_[var_114_13.prefab_name] ~= nil then
						local var_114_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_13.prefab_name].transform, "story_v_out_120411", "120411028", "story_v_out_120411.awb")

						arg_111_1:RecordAudio("120411028", var_114_19)
						arg_111_1:RecordAudio("120411028", var_114_19)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_120411", "120411028", "story_v_out_120411.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_120411", "120411028", "story_v_out_120411.awb")
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
	Play120411029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120411029
		arg_115_1.duration_ = 10.2

		local var_115_0 = {
			zh = 4.3,
			ja = 10.2
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
				arg_115_0:Play120411030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1084ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story == nil then
				arg_115_1.var_.characterEffect1084ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1084ui_story then
					arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story then
				arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_118_4 = 0

			if var_118_4 < arg_115_1.time_ and arg_115_1.time_ <= var_118_4 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_118_5 = arg_115_1.actors_["1029ui_story"]
			local var_118_6 = 0

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect1029ui_story == nil then
				arg_115_1.var_.characterEffect1029ui_story = var_118_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_7 = 0.2

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_7 then
				local var_118_8 = (arg_115_1.time_ - var_118_6) / var_118_7

				if arg_115_1.var_.characterEffect1029ui_story then
					local var_118_9 = Mathf.Lerp(0, 0.5, var_118_8)

					arg_115_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1029ui_story.fillRatio = var_118_9
				end
			end

			if arg_115_1.time_ >= var_118_6 + var_118_7 and arg_115_1.time_ < var_118_6 + var_118_7 + arg_118_0 and arg_115_1.var_.characterEffect1029ui_story then
				local var_118_10 = 0.5

				arg_115_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1029ui_story.fillRatio = var_118_10
			end

			local var_118_11 = 0
			local var_118_12 = 0.575

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_13 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_14 = arg_115_1:GetWordFromCfg(120411029)
				local var_118_15 = arg_115_1:FormatText(var_118_14.content)

				arg_115_1.text_.text = var_118_15

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_16 = 23
				local var_118_17 = utf8.len(var_118_15)
				local var_118_18 = var_118_16 <= 0 and var_118_12 or var_118_12 * (var_118_17 / var_118_16)

				if var_118_18 > 0 and var_118_12 < var_118_18 then
					arg_115_1.talkMaxDuration = var_118_18

					if var_118_18 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_18 + var_118_11
					end
				end

				arg_115_1.text_.text = var_118_15
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411029", "story_v_out_120411.awb") ~= 0 then
					local var_118_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411029", "story_v_out_120411.awb") / 1000

					if var_118_19 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_11
					end

					if var_118_14.prefab_name ~= "" and arg_115_1.actors_[var_118_14.prefab_name] ~= nil then
						local var_118_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_14.prefab_name].transform, "story_v_out_120411", "120411029", "story_v_out_120411.awb")

						arg_115_1:RecordAudio("120411029", var_118_20)
						arg_115_1:RecordAudio("120411029", var_118_20)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120411", "120411029", "story_v_out_120411.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120411", "120411029", "story_v_out_120411.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_21 = math.max(var_118_12, arg_115_1.talkMaxDuration)

			if var_118_11 <= arg_115_1.time_ and arg_115_1.time_ < var_118_11 + var_118_21 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_11) / var_118_21

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_11 + var_118_21 and arg_115_1.time_ < var_118_11 + var_118_21 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play120411030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120411030
		arg_119_1.duration_ = 8.433

		local var_119_0 = {
			zh = 5.333,
			ja = 8.433
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
				arg_119_0:Play120411031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1029ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1029ui_story == nil then
				arg_119_1.var_.characterEffect1029ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1029ui_story then
					arg_119_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1029ui_story then
				arg_119_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["1084ui_story"]
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story == nil then
				arg_119_1.var_.characterEffect1084ui_story = var_122_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_6 = 0.2

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6

				if arg_119_1.var_.characterEffect1084ui_story then
					local var_122_8 = Mathf.Lerp(0, 0.5, var_122_7)

					arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_8
				end
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story then
				local var_122_9 = 0.5

				arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_9
			end

			local var_122_10 = 0
			local var_122_11 = 0.625

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_12 = arg_119_1:FormatText(StoryNameCfg[319].name)

				arg_119_1.leftNameTxt_.text = var_122_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_13 = arg_119_1:GetWordFromCfg(120411030)
				local var_122_14 = arg_119_1:FormatText(var_122_13.content)

				arg_119_1.text_.text = var_122_14

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_15 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411030", "story_v_out_120411.awb") ~= 0 then
					local var_122_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411030", "story_v_out_120411.awb") / 1000

					if var_122_18 + var_122_10 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_10
					end

					if var_122_13.prefab_name ~= "" and arg_119_1.actors_[var_122_13.prefab_name] ~= nil then
						local var_122_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_13.prefab_name].transform, "story_v_out_120411", "120411030", "story_v_out_120411.awb")

						arg_119_1:RecordAudio("120411030", var_122_19)
						arg_119_1:RecordAudio("120411030", var_122_19)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120411", "120411030", "story_v_out_120411.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120411", "120411030", "story_v_out_120411.awb")
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
	Play120411031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120411031
		arg_123_1.duration_ = 10.9

		local var_123_0 = {
			zh = 9.4,
			ja = 10.9
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
				arg_123_0:Play120411032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.975

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[319].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(120411031)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411031", "story_v_out_120411.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411031", "story_v_out_120411.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_120411", "120411031", "story_v_out_120411.awb")

						arg_123_1:RecordAudio("120411031", var_126_9)
						arg_123_1:RecordAudio("120411031", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_120411", "120411031", "story_v_out_120411.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_120411", "120411031", "story_v_out_120411.awb")
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
	Play120411032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120411032
		arg_127_1.duration_ = 7.366

		local var_127_0 = {
			zh = 4.966,
			ja = 7.366
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
				arg_127_0:Play120411033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1084ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story == nil then
				arg_127_1.var_.characterEffect1084ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.2

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1084ui_story then
					arg_127_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1084ui_story then
				arg_127_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_130_4 = 0

			if var_130_4 < arg_127_1.time_ and arg_127_1.time_ <= var_130_4 + arg_130_0 then
				arg_127_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_130_5 = arg_127_1.actors_["1029ui_story"]
			local var_130_6 = 0

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1029ui_story == nil then
				arg_127_1.var_.characterEffect1029ui_story = var_130_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_7 = 0.2

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_7 then
				local var_130_8 = (arg_127_1.time_ - var_130_6) / var_130_7

				if arg_127_1.var_.characterEffect1029ui_story then
					local var_130_9 = Mathf.Lerp(0, 0.5, var_130_8)

					arg_127_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1029ui_story.fillRatio = var_130_9
				end
			end

			if arg_127_1.time_ >= var_130_6 + var_130_7 and arg_127_1.time_ < var_130_6 + var_130_7 + arg_130_0 and arg_127_1.var_.characterEffect1029ui_story then
				local var_130_10 = 0.5

				arg_127_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1029ui_story.fillRatio = var_130_10
			end

			local var_130_11 = 0

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4127")
			end

			local var_130_12 = 0
			local var_130_13 = 0.625

			if var_130_12 < arg_127_1.time_ and arg_127_1.time_ <= var_130_12 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_14 = arg_127_1:FormatText(StoryNameCfg[6].name)

				arg_127_1.leftNameTxt_.text = var_130_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_15 = arg_127_1:GetWordFromCfg(120411032)
				local var_130_16 = arg_127_1:FormatText(var_130_15.content)

				arg_127_1.text_.text = var_130_16

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_17 = 25
				local var_130_18 = utf8.len(var_130_16)
				local var_130_19 = var_130_17 <= 0 and var_130_13 or var_130_13 * (var_130_18 / var_130_17)

				if var_130_19 > 0 and var_130_13 < var_130_19 then
					arg_127_1.talkMaxDuration = var_130_19

					if var_130_19 + var_130_12 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_19 + var_130_12
					end
				end

				arg_127_1.text_.text = var_130_16
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411032", "story_v_out_120411.awb") ~= 0 then
					local var_130_20 = manager.audio:GetVoiceLength("story_v_out_120411", "120411032", "story_v_out_120411.awb") / 1000

					if var_130_20 + var_130_12 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_20 + var_130_12
					end

					if var_130_15.prefab_name ~= "" and arg_127_1.actors_[var_130_15.prefab_name] ~= nil then
						local var_130_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_15.prefab_name].transform, "story_v_out_120411", "120411032", "story_v_out_120411.awb")

						arg_127_1:RecordAudio("120411032", var_130_21)
						arg_127_1:RecordAudio("120411032", var_130_21)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_120411", "120411032", "story_v_out_120411.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_120411", "120411032", "story_v_out_120411.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_22 = math.max(var_130_13, arg_127_1.talkMaxDuration)

			if var_130_12 <= arg_127_1.time_ and arg_127_1.time_ < var_130_12 + var_130_22 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_12) / var_130_22

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_12 + var_130_22 and arg_127_1.time_ < var_130_12 + var_130_22 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120411033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120411033
		arg_131_1.duration_ = 11.833

		local var_131_0 = {
			zh = 6.3,
			ja = 11.833
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
				arg_131_0:Play120411034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.9

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[6].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(120411033)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 37
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411033", "story_v_out_120411.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411033", "story_v_out_120411.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_120411", "120411033", "story_v_out_120411.awb")

						arg_131_1:RecordAudio("120411033", var_134_9)
						arg_131_1:RecordAudio("120411033", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_120411", "120411033", "story_v_out_120411.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_120411", "120411033", "story_v_out_120411.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120411034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120411034
		arg_135_1.duration_ = 9.9

		local var_135_0 = {
			zh = 4.766,
			ja = 9.9
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
				arg_135_0:Play120411035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1029ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1029ui_story == nil then
				arg_135_1.var_.characterEffect1029ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.2

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1029ui_story then
					arg_135_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1029ui_story then
				arg_135_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_138_4 = arg_135_1.actors_["1084ui_story"]
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story == nil then
				arg_135_1.var_.characterEffect1084ui_story = var_138_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_6 = 0.2

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6

				if arg_135_1.var_.characterEffect1084ui_story then
					local var_138_8 = Mathf.Lerp(0, 0.5, var_138_7)

					arg_135_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1084ui_story.fillRatio = var_138_8
				end
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story then
				local var_138_9 = 0.5

				arg_135_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1084ui_story.fillRatio = var_138_9
			end

			local var_138_10 = 0
			local var_138_11 = 0.55

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_12 = arg_135_1:FormatText(StoryNameCfg[319].name)

				arg_135_1.leftNameTxt_.text = var_138_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_13 = arg_135_1:GetWordFromCfg(120411034)
				local var_138_14 = arg_135_1:FormatText(var_138_13.content)

				arg_135_1.text_.text = var_138_14

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_15 = 22
				local var_138_16 = utf8.len(var_138_14)
				local var_138_17 = var_138_15 <= 0 and var_138_11 or var_138_11 * (var_138_16 / var_138_15)

				if var_138_17 > 0 and var_138_11 < var_138_17 then
					arg_135_1.talkMaxDuration = var_138_17

					if var_138_17 + var_138_10 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_17 + var_138_10
					end
				end

				arg_135_1.text_.text = var_138_14
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411034", "story_v_out_120411.awb") ~= 0 then
					local var_138_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411034", "story_v_out_120411.awb") / 1000

					if var_138_18 + var_138_10 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_18 + var_138_10
					end

					if var_138_13.prefab_name ~= "" and arg_135_1.actors_[var_138_13.prefab_name] ~= nil then
						local var_138_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_13.prefab_name].transform, "story_v_out_120411", "120411034", "story_v_out_120411.awb")

						arg_135_1:RecordAudio("120411034", var_138_19)
						arg_135_1:RecordAudio("120411034", var_138_19)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_120411", "120411034", "story_v_out_120411.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_120411", "120411034", "story_v_out_120411.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_20 = math.max(var_138_11, arg_135_1.talkMaxDuration)

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_20 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_10) / var_138_20

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_10 + var_138_20 and arg_135_1.time_ < var_138_10 + var_138_20 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play120411035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120411035
		arg_139_1.duration_ = 8.666

		local var_139_0 = {
			zh = 6.2,
			ja = 8.666
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
				arg_139_0:Play120411036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.575

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[319].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(120411035)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 23
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411035", "story_v_out_120411.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411035", "story_v_out_120411.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_120411", "120411035", "story_v_out_120411.awb")

						arg_139_1:RecordAudio("120411035", var_142_9)
						arg_139_1:RecordAudio("120411035", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_120411", "120411035", "story_v_out_120411.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_120411", "120411035", "story_v_out_120411.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120411036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120411036
		arg_143_1.duration_ = 2.366666666666

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play120411037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1029ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1029ui_story == nil then
				arg_143_1.var_.characterEffect1029ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1029ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1029ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1029ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1029ui_story.fillRatio = var_146_5
			end

			local var_146_6 = arg_143_1.actors_["1084ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect1084ui_story == nil then
				arg_143_1.var_.characterEffect1084ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.2

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect1084ui_story then
					arg_143_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect1084ui_story then
				arg_143_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4713")
			end

			local var_146_11 = 0

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				arg_143_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_146_12 = 0
			local var_146_13 = 0.075

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[6].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(120411036)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411036", "story_v_out_120411.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_out_120411", "120411036", "story_v_out_120411.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_out_120411", "120411036", "story_v_out_120411.awb")

						arg_143_1:RecordAudio("120411036", var_146_21)
						arg_143_1:RecordAudio("120411036", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_120411", "120411036", "story_v_out_120411.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_120411", "120411036", "story_v_out_120411.awb")
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
	Play120411037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120411037
		arg_147_1.duration_ = 7.633

		local var_147_0 = {
			zh = 5.6,
			ja = 7.633
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
				arg_147_0:Play120411038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1029ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1029ui_story == nil then
				arg_147_1.var_.characterEffect1029ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.2

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1029ui_story then
					arg_147_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1029ui_story then
				arg_147_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_150_4 = arg_147_1.actors_["1084ui_story"]
			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story == nil then
				arg_147_1.var_.characterEffect1084ui_story = var_150_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_6 = 0.2

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6

				if arg_147_1.var_.characterEffect1084ui_story then
					local var_150_8 = Mathf.Lerp(0, 0.5, var_150_7)

					arg_147_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1084ui_story.fillRatio = var_150_8
				end
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story then
				local var_150_9 = 0.5

				arg_147_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1084ui_story.fillRatio = var_150_9
			end

			local var_150_10 = 0
			local var_150_11 = 0.625

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_12 = arg_147_1:FormatText(StoryNameCfg[319].name)

				arg_147_1.leftNameTxt_.text = var_150_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_13 = arg_147_1:GetWordFromCfg(120411037)
				local var_150_14 = arg_147_1:FormatText(var_150_13.content)

				arg_147_1.text_.text = var_150_14

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_15 = 25
				local var_150_16 = utf8.len(var_150_14)
				local var_150_17 = var_150_15 <= 0 and var_150_11 or var_150_11 * (var_150_16 / var_150_15)

				if var_150_17 > 0 and var_150_11 < var_150_17 then
					arg_147_1.talkMaxDuration = var_150_17

					if var_150_17 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_17 + var_150_10
					end
				end

				arg_147_1.text_.text = var_150_14
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411037", "story_v_out_120411.awb") ~= 0 then
					local var_150_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411037", "story_v_out_120411.awb") / 1000

					if var_150_18 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_10
					end

					if var_150_13.prefab_name ~= "" and arg_147_1.actors_[var_150_13.prefab_name] ~= nil then
						local var_150_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_13.prefab_name].transform, "story_v_out_120411", "120411037", "story_v_out_120411.awb")

						arg_147_1:RecordAudio("120411037", var_150_19)
						arg_147_1:RecordAudio("120411037", var_150_19)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120411", "120411037", "story_v_out_120411.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120411", "120411037", "story_v_out_120411.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_20 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_20 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_10) / var_150_20

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_10 + var_150_20 and arg_147_1.time_ < var_150_10 + var_150_20 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play120411038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120411038
		arg_151_1.duration_ = 13.066

		local var_151_0 = {
			zh = 7.966,
			ja = 13.066
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
				arg_151_0:Play120411039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.925

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[319].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(120411038)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411038", "story_v_out_120411.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411038", "story_v_out_120411.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_120411", "120411038", "story_v_out_120411.awb")

						arg_151_1:RecordAudio("120411038", var_154_9)
						arg_151_1:RecordAudio("120411038", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120411", "120411038", "story_v_out_120411.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120411", "120411038", "story_v_out_120411.awb")
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
	Play120411039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120411039
		arg_155_1.duration_ = 12.7

		local var_155_0 = {
			zh = 8.833,
			ja = 12.7
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
				arg_155_0:Play120411040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.9

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[319].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(120411039)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411039", "story_v_out_120411.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411039", "story_v_out_120411.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_120411", "120411039", "story_v_out_120411.awb")

						arg_155_1:RecordAudio("120411039", var_158_9)
						arg_155_1:RecordAudio("120411039", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_120411", "120411039", "story_v_out_120411.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_120411", "120411039", "story_v_out_120411.awb")
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
	Play120411040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120411040
		arg_159_1.duration_ = 13.133

		local var_159_0 = {
			zh = 9.533,
			ja = 13.133
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
				arg_159_0:Play120411041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.125

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[319].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(120411040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411040", "story_v_out_120411.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411040", "story_v_out_120411.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_120411", "120411040", "story_v_out_120411.awb")

						arg_159_1:RecordAudio("120411040", var_162_9)
						arg_159_1:RecordAudio("120411040", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120411", "120411040", "story_v_out_120411.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120411", "120411040", "story_v_out_120411.awb")
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
	Play120411041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120411041
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play120411042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1029ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1029ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, 100, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1029ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, 100, 0)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1084ui_story"].transform
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1.var_.moveOldPos1084ui_story = var_166_9.localPosition
			end

			local var_166_11 = 0.001

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11
				local var_166_13 = Vector3.New(0, 100, 0)

				var_166_9.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1084ui_story, var_166_13, var_166_12)

				local var_166_14 = manager.ui.mainCamera.transform.position - var_166_9.position

				var_166_9.forward = Vector3.New(var_166_14.x, var_166_14.y, var_166_14.z)

				local var_166_15 = var_166_9.localEulerAngles

				var_166_15.z = 0
				var_166_15.x = 0
				var_166_9.localEulerAngles = var_166_15
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 then
				var_166_9.localPosition = Vector3.New(0, 100, 0)

				local var_166_16 = manager.ui.mainCamera.transform.position - var_166_9.position

				var_166_9.forward = Vector3.New(var_166_16.x, var_166_16.y, var_166_16.z)

				local var_166_17 = var_166_9.localEulerAngles

				var_166_17.z = 0
				var_166_17.x = 0
				var_166_9.localEulerAngles = var_166_17
			end

			local var_166_18 = 0
			local var_166_19 = 0.775

			if var_166_18 < arg_163_1.time_ and arg_163_1.time_ <= var_166_18 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_20 = arg_163_1:GetWordFromCfg(120411041)
				local var_166_21 = arg_163_1:FormatText(var_166_20.content)

				arg_163_1.text_.text = var_166_21

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_22 = 31
				local var_166_23 = utf8.len(var_166_21)
				local var_166_24 = var_166_22 <= 0 and var_166_19 or var_166_19 * (var_166_23 / var_166_22)

				if var_166_24 > 0 and var_166_19 < var_166_24 then
					arg_163_1.talkMaxDuration = var_166_24

					if var_166_24 + var_166_18 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_24 + var_166_18
					end
				end

				arg_163_1.text_.text = var_166_21
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_25 = math.max(var_166_19, arg_163_1.talkMaxDuration)

			if var_166_18 <= arg_163_1.time_ and arg_163_1.time_ < var_166_18 + var_166_25 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_18) / var_166_25

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_18 + var_166_25 and arg_163_1.time_ < var_166_18 + var_166_25 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120411042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120411042
		arg_167_1.duration_ = 3.4

		local var_167_0 = {
			zh = 2.1,
			ja = 3.4
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
				arg_167_0:Play120411043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1029ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1029ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, -1.09, -6.2)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1029ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = 0

			if var_170_9 < arg_167_1.time_ and arg_167_1.time_ <= var_170_9 + arg_170_0 then
				arg_167_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_170_11 = arg_167_1.actors_["1029ui_story"]
			local var_170_12 = 0

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 and arg_167_1.var_.characterEffect1029ui_story == nil then
				arg_167_1.var_.characterEffect1029ui_story = var_170_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_13 = 0.2

			if var_170_12 <= arg_167_1.time_ and arg_167_1.time_ < var_170_12 + var_170_13 then
				local var_170_14 = (arg_167_1.time_ - var_170_12) / var_170_13

				if arg_167_1.var_.characterEffect1029ui_story then
					arg_167_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_12 + var_170_13 and arg_167_1.time_ < var_170_12 + var_170_13 + arg_170_0 and arg_167_1.var_.characterEffect1029ui_story then
				arg_167_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_170_15 = 0
			local var_170_16 = 0.25

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_17 = arg_167_1:FormatText(StoryNameCfg[319].name)

				arg_167_1.leftNameTxt_.text = var_170_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_18 = arg_167_1:GetWordFromCfg(120411042)
				local var_170_19 = arg_167_1:FormatText(var_170_18.content)

				arg_167_1.text_.text = var_170_19

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_20 = 10
				local var_170_21 = utf8.len(var_170_19)
				local var_170_22 = var_170_20 <= 0 and var_170_16 or var_170_16 * (var_170_21 / var_170_20)

				if var_170_22 > 0 and var_170_16 < var_170_22 then
					arg_167_1.talkMaxDuration = var_170_22

					if var_170_22 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_22 + var_170_15
					end
				end

				arg_167_1.text_.text = var_170_19
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411042", "story_v_out_120411.awb") ~= 0 then
					local var_170_23 = manager.audio:GetVoiceLength("story_v_out_120411", "120411042", "story_v_out_120411.awb") / 1000

					if var_170_23 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_23 + var_170_15
					end

					if var_170_18.prefab_name ~= "" and arg_167_1.actors_[var_170_18.prefab_name] ~= nil then
						local var_170_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_18.prefab_name].transform, "story_v_out_120411", "120411042", "story_v_out_120411.awb")

						arg_167_1:RecordAudio("120411042", var_170_24)
						arg_167_1:RecordAudio("120411042", var_170_24)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120411", "120411042", "story_v_out_120411.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120411", "120411042", "story_v_out_120411.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_25 = math.max(var_170_16, arg_167_1.talkMaxDuration)

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_25 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_15) / var_170_25

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_15 + var_170_25 and arg_167_1.time_ < var_170_15 + var_170_25 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120411043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120411043
		arg_171_1.duration_ = 8.033

		local var_171_0 = {
			zh = 8.033,
			ja = 6.866
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
				arg_171_0:Play120411044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.775

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[319].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(120411043)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 31
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411043", "story_v_out_120411.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411043", "story_v_out_120411.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_120411", "120411043", "story_v_out_120411.awb")

						arg_171_1:RecordAudio("120411043", var_174_9)
						arg_171_1:RecordAudio("120411043", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120411", "120411043", "story_v_out_120411.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120411", "120411043", "story_v_out_120411.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play120411044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120411044
		arg_175_1.duration_ = 13.7

		local var_175_0 = {
			zh = 10.4,
			ja = 13.7
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
				arg_175_0:Play120411045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 1.4

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[319].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(120411044)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 54
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411044", "story_v_out_120411.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411044", "story_v_out_120411.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_120411", "120411044", "story_v_out_120411.awb")

						arg_175_1:RecordAudio("120411044", var_178_9)
						arg_175_1:RecordAudio("120411044", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120411", "120411044", "story_v_out_120411.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120411", "120411044", "story_v_out_120411.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120411045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120411045
		arg_179_1.duration_ = 0.199999999999

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"

			SetActive(arg_179_1.choicesGo_, true)

			for iter_180_0, iter_180_1 in ipairs(arg_179_1.choices_) do
				local var_180_0 = iter_180_0 <= 1

				SetActive(iter_180_1.go, var_180_0)
			end

			arg_179_1.choices_[1].txt.text = arg_179_1:FormatText(StoryChoiceCfg[386].name)
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play120411046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1029ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1029ui_story == nil then
				arg_179_1.var_.characterEffect1029ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1029ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1029ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1029ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1029ui_story.fillRatio = var_182_5
			end
		end
	end,
	Play120411046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120411046
		arg_183_1.duration_ = 8.466

		local var_183_0 = {
			zh = 7.5,
			ja = 8.466
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
				arg_183_0:Play120411047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1029ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1029ui_story == nil then
				arg_183_1.var_.characterEffect1029ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1029ui_story then
					arg_183_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1029ui_story then
				arg_183_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_186_4 = 0
			local var_186_5 = 0.775

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_6 = arg_183_1:FormatText(StoryNameCfg[319].name)

				arg_183_1.leftNameTxt_.text = var_186_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_7 = arg_183_1:GetWordFromCfg(120411046)
				local var_186_8 = arg_183_1:FormatText(var_186_7.content)

				arg_183_1.text_.text = var_186_8

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_9 = 31
				local var_186_10 = utf8.len(var_186_8)
				local var_186_11 = var_186_9 <= 0 and var_186_5 or var_186_5 * (var_186_10 / var_186_9)

				if var_186_11 > 0 and var_186_5 < var_186_11 then
					arg_183_1.talkMaxDuration = var_186_11

					if var_186_11 + var_186_4 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_11 + var_186_4
					end
				end

				arg_183_1.text_.text = var_186_8
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411046", "story_v_out_120411.awb") ~= 0 then
					local var_186_12 = manager.audio:GetVoiceLength("story_v_out_120411", "120411046", "story_v_out_120411.awb") / 1000

					if var_186_12 + var_186_4 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_12 + var_186_4
					end

					if var_186_7.prefab_name ~= "" and arg_183_1.actors_[var_186_7.prefab_name] ~= nil then
						local var_186_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_7.prefab_name].transform, "story_v_out_120411", "120411046", "story_v_out_120411.awb")

						arg_183_1:RecordAudio("120411046", var_186_13)
						arg_183_1:RecordAudio("120411046", var_186_13)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120411", "120411046", "story_v_out_120411.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120411", "120411046", "story_v_out_120411.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_14 = math.max(var_186_5, arg_183_1.talkMaxDuration)

			if var_186_4 <= arg_183_1.time_ and arg_183_1.time_ < var_186_4 + var_186_14 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_4) / var_186_14

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_4 + var_186_14 and arg_183_1.time_ < var_186_4 + var_186_14 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120411047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120411047
		arg_187_1.duration_ = 5

		local var_187_0 = {
			zh = 4.5,
			ja = 5
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
				arg_187_0:Play120411048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_190_1 = 0
			local var_190_2 = 0.35

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_3 = arg_187_1:FormatText(StoryNameCfg[319].name)

				arg_187_1.leftNameTxt_.text = var_190_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_4 = arg_187_1:GetWordFromCfg(120411047)
				local var_190_5 = arg_187_1:FormatText(var_190_4.content)

				arg_187_1.text_.text = var_190_5

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_6 = 14
				local var_190_7 = utf8.len(var_190_5)
				local var_190_8 = var_190_6 <= 0 and var_190_2 or var_190_2 * (var_190_7 / var_190_6)

				if var_190_8 > 0 and var_190_2 < var_190_8 then
					arg_187_1.talkMaxDuration = var_190_8

					if var_190_8 + var_190_1 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_1
					end
				end

				arg_187_1.text_.text = var_190_5
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411047", "story_v_out_120411.awb") ~= 0 then
					local var_190_9 = manager.audio:GetVoiceLength("story_v_out_120411", "120411047", "story_v_out_120411.awb") / 1000

					if var_190_9 + var_190_1 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_9 + var_190_1
					end

					if var_190_4.prefab_name ~= "" and arg_187_1.actors_[var_190_4.prefab_name] ~= nil then
						local var_190_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_4.prefab_name].transform, "story_v_out_120411", "120411047", "story_v_out_120411.awb")

						arg_187_1:RecordAudio("120411047", var_190_10)
						arg_187_1:RecordAudio("120411047", var_190_10)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120411", "120411047", "story_v_out_120411.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120411", "120411047", "story_v_out_120411.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_11 = math.max(var_190_2, arg_187_1.talkMaxDuration)

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_11 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_1) / var_190_11

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_1 + var_190_11 and arg_187_1.time_ < var_190_1 + var_190_11 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120411048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120411048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120411049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1029ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1029ui_story == nil then
				arg_191_1.var_.characterEffect1029ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1029ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1029ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1029ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1029ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.15

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(120411048)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 6
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120411049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120411049
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play120411050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1029ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1029ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, 100, 0)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1029ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, 100, 0)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = 0
			local var_198_10 = 1

			if var_198_9 < arg_195_1.time_ and arg_195_1.time_ <= var_198_9 + arg_198_0 then
				local var_198_11 = "play"
				local var_198_12 = "effect"

				arg_195_1:AudioAction(var_198_11, var_198_12, "se_story_120_04", "se_story_120_04_knock", "")
			end

			local var_198_13 = arg_195_1.actors_["1084ui_story"].transform
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1.var_.moveOldPos1084ui_story = var_198_13.localPosition
			end

			local var_198_15 = 0.001

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15
				local var_198_17 = Vector3.New(0, 100, 0)

				var_198_13.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1084ui_story, var_198_17, var_198_16)

				local var_198_18 = manager.ui.mainCamera.transform.position - var_198_13.position

				var_198_13.forward = Vector3.New(var_198_18.x, var_198_18.y, var_198_18.z)

				local var_198_19 = var_198_13.localEulerAngles

				var_198_19.z = 0
				var_198_19.x = 0
				var_198_13.localEulerAngles = var_198_19
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 then
				var_198_13.localPosition = Vector3.New(0, 100, 0)

				local var_198_20 = manager.ui.mainCamera.transform.position - var_198_13.position

				var_198_13.forward = Vector3.New(var_198_20.x, var_198_20.y, var_198_20.z)

				local var_198_21 = var_198_13.localEulerAngles

				var_198_21.z = 0
				var_198_21.x = 0
				var_198_13.localEulerAngles = var_198_21
			end

			local var_198_22 = 0
			local var_198_23 = 0.1

			if var_198_22 < arg_195_1.time_ and arg_195_1.time_ <= var_198_22 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_24 = arg_195_1:GetWordFromCfg(120411049)
				local var_198_25 = arg_195_1:FormatText(var_198_24.content)

				arg_195_1.text_.text = var_198_25

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_26 = 4
				local var_198_27 = utf8.len(var_198_25)
				local var_198_28 = var_198_26 <= 0 and var_198_23 or var_198_23 * (var_198_27 / var_198_26)

				if var_198_28 > 0 and var_198_23 < var_198_28 then
					arg_195_1.talkMaxDuration = var_198_28

					if var_198_28 + var_198_22 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_28 + var_198_22
					end
				end

				arg_195_1.text_.text = var_198_25
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_29 = math.max(var_198_23, arg_195_1.talkMaxDuration)

			if var_198_22 <= arg_195_1.time_ and arg_195_1.time_ < var_198_22 + var_198_29 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_22) / var_198_29

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_22 + var_198_29 and arg_195_1.time_ < var_198_22 + var_198_29 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120411050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120411050
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play120411051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.825

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

				local var_202_2 = arg_199_1:GetWordFromCfg(120411050)
				local var_202_3 = arg_199_1:FormatText(var_202_2.content)

				arg_199_1.text_.text = var_202_3

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_4 = 33
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
	Play120411051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120411051
		arg_203_1.duration_ = 7

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play120411052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 1

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				local var_206_2 = "play"
				local var_206_3 = "effect"

				arg_203_1:AudioAction(var_206_2, var_206_3, "se_story_16", "se_story_16_door06", "")
			end

			local var_206_4 = 0

			if var_206_4 < arg_203_1.time_ and arg_203_1.time_ <= var_206_4 + arg_206_0 then
				arg_203_1.mask_.enabled = true
				arg_203_1.mask_.raycastTarget = true

				arg_203_1:SetGaussion(false)
			end

			local var_206_5 = 2

			if var_206_4 <= arg_203_1.time_ and arg_203_1.time_ < var_206_4 + var_206_5 then
				local var_206_6 = (arg_203_1.time_ - var_206_4) / var_206_5
				local var_206_7 = Color.New(0, 0, 0)

				var_206_7.a = Mathf.Lerp(0, 1, var_206_6)
				arg_203_1.mask_.color = var_206_7
			end

			if arg_203_1.time_ >= var_206_4 + var_206_5 and arg_203_1.time_ < var_206_4 + var_206_5 + arg_206_0 then
				local var_206_8 = Color.New(0, 0, 0)

				var_206_8.a = 1
				arg_203_1.mask_.color = var_206_8
			end

			local var_206_9 = 2

			if var_206_9 < arg_203_1.time_ and arg_203_1.time_ <= var_206_9 + arg_206_0 then
				arg_203_1.mask_.enabled = true
				arg_203_1.mask_.raycastTarget = true

				arg_203_1:SetGaussion(false)
			end

			local var_206_10 = 2

			if var_206_9 <= arg_203_1.time_ and arg_203_1.time_ < var_206_9 + var_206_10 then
				local var_206_11 = (arg_203_1.time_ - var_206_9) / var_206_10
				local var_206_12 = Color.New(0, 0, 0)

				var_206_12.a = Mathf.Lerp(1, 0, var_206_11)
				arg_203_1.mask_.color = var_206_12
			end

			if arg_203_1.time_ >= var_206_9 + var_206_10 and arg_203_1.time_ < var_206_9 + var_206_10 + arg_206_0 then
				local var_206_13 = Color.New(0, 0, 0)
				local var_206_14 = 0

				arg_203_1.mask_.enabled = false
				var_206_13.a = var_206_14
				arg_203_1.mask_.color = var_206_13
			end

			local var_206_15 = "1076ui_story"

			if arg_203_1.actors_[var_206_15] == nil then
				local var_206_16 = Object.Instantiate(Asset.Load("Char/" .. var_206_15), arg_203_1.stage_.transform)

				var_206_16.name = var_206_15
				var_206_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_203_1.actors_[var_206_15] = var_206_16

				local var_206_17 = var_206_16:GetComponentInChildren(typeof(CharacterEffect))

				var_206_17.enabled = true

				local var_206_18 = GameObjectTools.GetOrAddComponent(var_206_16, typeof(DynamicBoneHelper))

				if var_206_18 then
					var_206_18:EnableDynamicBone(false)
				end

				arg_203_1:ShowWeapon(var_206_17.transform, false)

				arg_203_1.var_[var_206_15 .. "Animator"] = var_206_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_203_1.var_[var_206_15 .. "Animator"].applyRootMotion = true
				arg_203_1.var_[var_206_15 .. "LipSync"] = var_206_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_206_19 = arg_203_1.actors_["1076ui_story"].transform
			local var_206_20 = 2

			if var_206_20 < arg_203_1.time_ and arg_203_1.time_ <= var_206_20 + arg_206_0 then
				arg_203_1.var_.moveOldPos1076ui_story = var_206_19.localPosition
			end

			local var_206_21 = 0.001

			if var_206_20 <= arg_203_1.time_ and arg_203_1.time_ < var_206_20 + var_206_21 then
				local var_206_22 = (arg_203_1.time_ - var_206_20) / var_206_21
				local var_206_23 = Vector3.New(0, -1.06, -6.2)

				var_206_19.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1076ui_story, var_206_23, var_206_22)

				local var_206_24 = manager.ui.mainCamera.transform.position - var_206_19.position

				var_206_19.forward = Vector3.New(var_206_24.x, var_206_24.y, var_206_24.z)

				local var_206_25 = var_206_19.localEulerAngles

				var_206_25.z = 0
				var_206_25.x = 0
				var_206_19.localEulerAngles = var_206_25
			end

			if arg_203_1.time_ >= var_206_20 + var_206_21 and arg_203_1.time_ < var_206_20 + var_206_21 + arg_206_0 then
				var_206_19.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_206_26 = manager.ui.mainCamera.transform.position - var_206_19.position

				var_206_19.forward = Vector3.New(var_206_26.x, var_206_26.y, var_206_26.z)

				local var_206_27 = var_206_19.localEulerAngles

				var_206_27.z = 0
				var_206_27.x = 0
				var_206_19.localEulerAngles = var_206_27
			end

			local var_206_28 = 2

			if var_206_28 < arg_203_1.time_ and arg_203_1.time_ <= var_206_28 + arg_206_0 then
				arg_203_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_206_29 = 2

			if var_206_29 < arg_203_1.time_ and arg_203_1.time_ <= var_206_29 + arg_206_0 then
				arg_203_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_206_30 = arg_203_1.actors_["1076ui_story"]
			local var_206_31 = 2

			if var_206_31 < arg_203_1.time_ and arg_203_1.time_ <= var_206_31 + arg_206_0 and arg_203_1.var_.characterEffect1076ui_story == nil then
				arg_203_1.var_.characterEffect1076ui_story = var_206_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_32 = 0.0166666666666667

			if var_206_31 <= arg_203_1.time_ and arg_203_1.time_ < var_206_31 + var_206_32 then
				local var_206_33 = (arg_203_1.time_ - var_206_31) / var_206_32

				if arg_203_1.var_.characterEffect1076ui_story then
					local var_206_34 = Mathf.Lerp(0, 0.5, var_206_33)

					arg_203_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1076ui_story.fillRatio = var_206_34
				end
			end

			if arg_203_1.time_ >= var_206_31 + var_206_32 and arg_203_1.time_ < var_206_31 + var_206_32 + arg_206_0 and arg_203_1.var_.characterEffect1076ui_story then
				local var_206_35 = 0.5

				arg_203_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1076ui_story.fillRatio = var_206_35
			end

			if arg_203_1.frameCnt_ <= 1 then
				arg_203_1.dialog_:SetActive(false)
			end

			local var_206_36 = 2
			local var_206_37 = 0.05

			if var_206_36 < arg_203_1.time_ and arg_203_1.time_ <= var_206_36 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0

				arg_203_1.dialog_:SetActive(true)

				local var_206_38 = LeanTween.value(arg_203_1.dialog_, 0, 1, 0.3)

				var_206_38:setOnUpdate(LuaHelper.FloatAction(function(arg_207_0)
					arg_203_1.dialogCg_.alpha = arg_207_0
				end))
				var_206_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_203_1.dialog_)
					var_206_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_203_1.duration_ = arg_203_1.duration_ + 0.3

				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_39 = arg_203_1:GetWordFromCfg(120411051)
				local var_206_40 = arg_203_1:FormatText(var_206_39.content)

				arg_203_1.text_.text = var_206_40

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_41 = 2
				local var_206_42 = utf8.len(var_206_40)
				local var_206_43 = var_206_41 <= 0 and var_206_37 or var_206_37 * (var_206_42 / var_206_41)

				if var_206_43 > 0 and var_206_37 < var_206_43 then
					arg_203_1.talkMaxDuration = var_206_43
					var_206_36 = var_206_36 + 0.3

					if var_206_43 + var_206_36 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_43 + var_206_36
					end
				end

				arg_203_1.text_.text = var_206_40
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_44 = var_206_36 + 0.3
			local var_206_45 = math.max(var_206_37, arg_203_1.talkMaxDuration)

			if var_206_44 <= arg_203_1.time_ and arg_203_1.time_ < var_206_44 + var_206_45 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_44) / var_206_45

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_44 + var_206_45 and arg_203_1.time_ < var_206_44 + var_206_45 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120411052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 120411052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play120411053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.125

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[7].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(120411052)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 5
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
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_8 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_8 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_8

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_8 and arg_209_1.time_ < var_212_0 + var_212_8 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play120411053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 120411053
		arg_213_1.duration_ = 3

		local var_213_0 = {
			zh = 2.366,
			ja = 3
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
				arg_213_0:Play120411054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1076ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1076ui_story == nil then
				arg_213_1.var_.characterEffect1076ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1076ui_story then
					arg_213_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1076ui_story then
				arg_213_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_216_4 = 0
			local var_216_5 = 0.45

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_6 = arg_213_1:FormatText(StoryNameCfg[389].name)

				arg_213_1.leftNameTxt_.text = var_216_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_7 = arg_213_1:GetWordFromCfg(120411053)
				local var_216_8 = arg_213_1:FormatText(var_216_7.content)

				arg_213_1.text_.text = var_216_8

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_9 = 18
				local var_216_10 = utf8.len(var_216_8)
				local var_216_11 = var_216_9 <= 0 and var_216_5 or var_216_5 * (var_216_10 / var_216_9)

				if var_216_11 > 0 and var_216_5 < var_216_11 then
					arg_213_1.talkMaxDuration = var_216_11

					if var_216_11 + var_216_4 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_11 + var_216_4
					end
				end

				arg_213_1.text_.text = var_216_8
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411053", "story_v_out_120411.awb") ~= 0 then
					local var_216_12 = manager.audio:GetVoiceLength("story_v_out_120411", "120411053", "story_v_out_120411.awb") / 1000

					if var_216_12 + var_216_4 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_4
					end

					if var_216_7.prefab_name ~= "" and arg_213_1.actors_[var_216_7.prefab_name] ~= nil then
						local var_216_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_7.prefab_name].transform, "story_v_out_120411", "120411053", "story_v_out_120411.awb")

						arg_213_1:RecordAudio("120411053", var_216_13)
						arg_213_1:RecordAudio("120411053", var_216_13)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_120411", "120411053", "story_v_out_120411.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_120411", "120411053", "story_v_out_120411.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_14 = math.max(var_216_5, arg_213_1.talkMaxDuration)

			if var_216_4 <= arg_213_1.time_ and arg_213_1.time_ < var_216_4 + var_216_14 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_4) / var_216_14

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_4 + var_216_14 and arg_213_1.time_ < var_216_4 + var_216_14 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play120411054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 120411054
		arg_217_1.duration_ = 2.066

		local var_217_0 = {
			zh = 1.999999999999,
			ja = 2.066
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
				arg_217_0:Play120411055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1076ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1076ui_story == nil then
				arg_217_1.var_.characterEffect1076ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1076ui_story then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1076ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1076ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1076ui_story.fillRatio = var_220_5
			end

			local var_220_6 = 0

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_220_7 = arg_217_1.actors_["1076ui_story"].transform
			local var_220_8 = 0

			if var_220_8 < arg_217_1.time_ and arg_217_1.time_ <= var_220_8 + arg_220_0 then
				arg_217_1.var_.moveOldPos1076ui_story = var_220_7.localPosition
			end

			local var_220_9 = 0.001

			if var_220_8 <= arg_217_1.time_ and arg_217_1.time_ < var_220_8 + var_220_9 then
				local var_220_10 = (arg_217_1.time_ - var_220_8) / var_220_9
				local var_220_11 = Vector3.New(-0.7, -1.06, -6.2)

				var_220_7.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1076ui_story, var_220_11, var_220_10)

				local var_220_12 = manager.ui.mainCamera.transform.position - var_220_7.position

				var_220_7.forward = Vector3.New(var_220_12.x, var_220_12.y, var_220_12.z)

				local var_220_13 = var_220_7.localEulerAngles

				var_220_13.z = 0
				var_220_13.x = 0
				var_220_7.localEulerAngles = var_220_13
			end

			if arg_217_1.time_ >= var_220_8 + var_220_9 and arg_217_1.time_ < var_220_8 + var_220_9 + arg_220_0 then
				var_220_7.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_220_14 = manager.ui.mainCamera.transform.position - var_220_7.position

				var_220_7.forward = Vector3.New(var_220_14.x, var_220_14.y, var_220_14.z)

				local var_220_15 = var_220_7.localEulerAngles

				var_220_15.z = 0
				var_220_15.x = 0
				var_220_7.localEulerAngles = var_220_15
			end

			local var_220_16 = arg_217_1.actors_["1084ui_story"].transform
			local var_220_17 = 0

			if var_220_17 < arg_217_1.time_ and arg_217_1.time_ <= var_220_17 + arg_220_0 then
				arg_217_1.var_.moveOldPos1084ui_story = var_220_16.localPosition
			end

			local var_220_18 = 0.001

			if var_220_17 <= arg_217_1.time_ and arg_217_1.time_ < var_220_17 + var_220_18 then
				local var_220_19 = (arg_217_1.time_ - var_220_17) / var_220_18
				local var_220_20 = Vector3.New(0.7, -0.97, -6)

				var_220_16.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1084ui_story, var_220_20, var_220_19)

				local var_220_21 = manager.ui.mainCamera.transform.position - var_220_16.position

				var_220_16.forward = Vector3.New(var_220_21.x, var_220_21.y, var_220_21.z)

				local var_220_22 = var_220_16.localEulerAngles

				var_220_22.z = 0
				var_220_22.x = 0
				var_220_16.localEulerAngles = var_220_22
			end

			if arg_217_1.time_ >= var_220_17 + var_220_18 and arg_217_1.time_ < var_220_17 + var_220_18 + arg_220_0 then
				var_220_16.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_220_23 = manager.ui.mainCamera.transform.position - var_220_16.position

				var_220_16.forward = Vector3.New(var_220_23.x, var_220_23.y, var_220_23.z)

				local var_220_24 = var_220_16.localEulerAngles

				var_220_24.z = 0
				var_220_24.x = 0
				var_220_16.localEulerAngles = var_220_24
			end

			local var_220_25 = 0

			if var_220_25 < arg_217_1.time_ and arg_217_1.time_ <= var_220_25 + arg_220_0 then
				arg_217_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_220_26 = 0

			if var_220_26 < arg_217_1.time_ and arg_217_1.time_ <= var_220_26 + arg_220_0 then
				arg_217_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_220_27 = arg_217_1.actors_["1084ui_story"]
			local var_220_28 = 0

			if var_220_28 < arg_217_1.time_ and arg_217_1.time_ <= var_220_28 + arg_220_0 and arg_217_1.var_.characterEffect1084ui_story == nil then
				arg_217_1.var_.characterEffect1084ui_story = var_220_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_29 = 0.2

			if var_220_28 <= arg_217_1.time_ and arg_217_1.time_ < var_220_28 + var_220_29 then
				local var_220_30 = (arg_217_1.time_ - var_220_28) / var_220_29

				if arg_217_1.var_.characterEffect1084ui_story then
					arg_217_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_28 + var_220_29 and arg_217_1.time_ < var_220_28 + var_220_29 + arg_220_0 and arg_217_1.var_.characterEffect1084ui_story then
				arg_217_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_220_31 = 0
			local var_220_32 = 0.125

			if var_220_31 < arg_217_1.time_ and arg_217_1.time_ <= var_220_31 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_33 = arg_217_1:FormatText(StoryNameCfg[6].name)

				arg_217_1.leftNameTxt_.text = var_220_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_34 = arg_217_1:GetWordFromCfg(120411054)
				local var_220_35 = arg_217_1:FormatText(var_220_34.content)

				arg_217_1.text_.text = var_220_35

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_36 = 5
				local var_220_37 = utf8.len(var_220_35)
				local var_220_38 = var_220_36 <= 0 and var_220_32 or var_220_32 * (var_220_37 / var_220_36)

				if var_220_38 > 0 and var_220_32 < var_220_38 then
					arg_217_1.talkMaxDuration = var_220_38

					if var_220_38 + var_220_31 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_38 + var_220_31
					end
				end

				arg_217_1.text_.text = var_220_35
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411054", "story_v_out_120411.awb") ~= 0 then
					local var_220_39 = manager.audio:GetVoiceLength("story_v_out_120411", "120411054", "story_v_out_120411.awb") / 1000

					if var_220_39 + var_220_31 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_39 + var_220_31
					end

					if var_220_34.prefab_name ~= "" and arg_217_1.actors_[var_220_34.prefab_name] ~= nil then
						local var_220_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_34.prefab_name].transform, "story_v_out_120411", "120411054", "story_v_out_120411.awb")

						arg_217_1:RecordAudio("120411054", var_220_40)
						arg_217_1:RecordAudio("120411054", var_220_40)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_120411", "120411054", "story_v_out_120411.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_120411", "120411054", "story_v_out_120411.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_41 = math.max(var_220_32, arg_217_1.talkMaxDuration)

			if var_220_31 <= arg_217_1.time_ and arg_217_1.time_ < var_220_31 + var_220_41 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_31) / var_220_41

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_31 + var_220_41 and arg_217_1.time_ < var_220_31 + var_220_41 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play120411055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 120411055
		arg_221_1.duration_ = 2.666

		local var_221_0 = {
			zh = 1.466,
			ja = 2.666
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play120411056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1084ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story == nil then
				arg_221_1.var_.characterEffect1084ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.2

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1084ui_story then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1084ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1084ui_story.fillRatio = var_224_5
			end

			local var_224_6 = arg_221_1.actors_["1076ui_story"]
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 and arg_221_1.var_.characterEffect1076ui_story == nil then
				arg_221_1.var_.characterEffect1076ui_story = var_224_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_8 = 0.2

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_8 then
				local var_224_9 = (arg_221_1.time_ - var_224_7) / var_224_8

				if arg_221_1.var_.characterEffect1076ui_story then
					arg_221_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_7 + var_224_8 and arg_221_1.time_ < var_224_7 + var_224_8 + arg_224_0 and arg_221_1.var_.characterEffect1076ui_story then
				arg_221_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_224_10 = 0
			local var_224_11 = 0.2

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_12 = arg_221_1:FormatText(StoryNameCfg[389].name)

				arg_221_1.leftNameTxt_.text = var_224_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_13 = arg_221_1:GetWordFromCfg(120411055)
				local var_224_14 = arg_221_1:FormatText(var_224_13.content)

				arg_221_1.text_.text = var_224_14

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_15 = 8
				local var_224_16 = utf8.len(var_224_14)
				local var_224_17 = var_224_15 <= 0 and var_224_11 or var_224_11 * (var_224_16 / var_224_15)

				if var_224_17 > 0 and var_224_11 < var_224_17 then
					arg_221_1.talkMaxDuration = var_224_17

					if var_224_17 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_17 + var_224_10
					end
				end

				arg_221_1.text_.text = var_224_14
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411055", "story_v_out_120411.awb") ~= 0 then
					local var_224_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411055", "story_v_out_120411.awb") / 1000

					if var_224_18 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_18 + var_224_10
					end

					if var_224_13.prefab_name ~= "" and arg_221_1.actors_[var_224_13.prefab_name] ~= nil then
						local var_224_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_13.prefab_name].transform, "story_v_out_120411", "120411055", "story_v_out_120411.awb")

						arg_221_1:RecordAudio("120411055", var_224_19)
						arg_221_1:RecordAudio("120411055", var_224_19)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_120411", "120411055", "story_v_out_120411.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_120411", "120411055", "story_v_out_120411.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_20 = math.max(var_224_11, arg_221_1.talkMaxDuration)

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_20 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_10) / var_224_20

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_10 + var_224_20 and arg_221_1.time_ < var_224_10 + var_224_20 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play120411056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 120411056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play120411057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1076ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1076ui_story == nil then
				arg_225_1.var_.characterEffect1076ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.2

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1076ui_story then
					local var_228_4 = Mathf.Lerp(0, 0.5, var_228_3)

					arg_225_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1076ui_story.fillRatio = var_228_4
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1076ui_story then
				local var_228_5 = 0.5

				arg_225_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1076ui_story.fillRatio = var_228_5
			end

			local var_228_6 = 0
			local var_228_7 = 0.325

			if var_228_6 < arg_225_1.time_ and arg_225_1.time_ <= var_228_6 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_8 = arg_225_1:FormatText(StoryNameCfg[7].name)

				arg_225_1.leftNameTxt_.text = var_228_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_9 = arg_225_1:GetWordFromCfg(120411056)
				local var_228_10 = arg_225_1:FormatText(var_228_9.content)

				arg_225_1.text_.text = var_228_10

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_11 = 13
				local var_228_12 = utf8.len(var_228_10)
				local var_228_13 = var_228_11 <= 0 and var_228_7 or var_228_7 * (var_228_12 / var_228_11)

				if var_228_13 > 0 and var_228_7 < var_228_13 then
					arg_225_1.talkMaxDuration = var_228_13

					if var_228_13 + var_228_6 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_13 + var_228_6
					end
				end

				arg_225_1.text_.text = var_228_10
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_14 = math.max(var_228_7, arg_225_1.talkMaxDuration)

			if var_228_6 <= arg_225_1.time_ and arg_225_1.time_ < var_228_6 + var_228_14 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_6) / var_228_14

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_6 + var_228_14 and arg_225_1.time_ < var_228_6 + var_228_14 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play120411057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 120411057
		arg_229_1.duration_ = 5.866

		local var_229_0 = {
			zh = 3.933,
			ja = 5.866
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
				arg_229_0:Play120411058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1084ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1084ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, 100, 0)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1084ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, 100, 0)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["1029ui_story"].transform
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 then
				arg_229_1.var_.moveOldPos1029ui_story = var_232_9.localPosition
			end

			local var_232_11 = 0.001

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11
				local var_232_13 = Vector3.New(0.7, -1.09, -6.2)

				var_232_9.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1029ui_story, var_232_13, var_232_12)

				local var_232_14 = manager.ui.mainCamera.transform.position - var_232_9.position

				var_232_9.forward = Vector3.New(var_232_14.x, var_232_14.y, var_232_14.z)

				local var_232_15 = var_232_9.localEulerAngles

				var_232_15.z = 0
				var_232_15.x = 0
				var_232_9.localEulerAngles = var_232_15
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 then
				var_232_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_232_16 = manager.ui.mainCamera.transform.position - var_232_9.position

				var_232_9.forward = Vector3.New(var_232_16.x, var_232_16.y, var_232_16.z)

				local var_232_17 = var_232_9.localEulerAngles

				var_232_17.z = 0
				var_232_17.x = 0
				var_232_9.localEulerAngles = var_232_17
			end

			local var_232_18 = 0

			if var_232_18 < arg_229_1.time_ and arg_229_1.time_ <= var_232_18 + arg_232_0 then
				arg_229_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_1")
			end

			local var_232_19 = 0

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_232_20 = arg_229_1.actors_["1029ui_story"]
			local var_232_21 = 0

			if var_232_21 < arg_229_1.time_ and arg_229_1.time_ <= var_232_21 + arg_232_0 and arg_229_1.var_.characterEffect1029ui_story == nil then
				arg_229_1.var_.characterEffect1029ui_story = var_232_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_22 = 0.2

			if var_232_21 <= arg_229_1.time_ and arg_229_1.time_ < var_232_21 + var_232_22 then
				local var_232_23 = (arg_229_1.time_ - var_232_21) / var_232_22

				if arg_229_1.var_.characterEffect1029ui_story then
					arg_229_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_21 + var_232_22 and arg_229_1.time_ < var_232_21 + var_232_22 + arg_232_0 and arg_229_1.var_.characterEffect1029ui_story then
				arg_229_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_232_24 = 0
			local var_232_25 = 0.525

			if var_232_24 < arg_229_1.time_ and arg_229_1.time_ <= var_232_24 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_26 = arg_229_1:FormatText(StoryNameCfg[319].name)

				arg_229_1.leftNameTxt_.text = var_232_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_27 = arg_229_1:GetWordFromCfg(120411057)
				local var_232_28 = arg_229_1:FormatText(var_232_27.content)

				arg_229_1.text_.text = var_232_28

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_29 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411057", "story_v_out_120411.awb") ~= 0 then
					local var_232_32 = manager.audio:GetVoiceLength("story_v_out_120411", "120411057", "story_v_out_120411.awb") / 1000

					if var_232_32 + var_232_24 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_32 + var_232_24
					end

					if var_232_27.prefab_name ~= "" and arg_229_1.actors_[var_232_27.prefab_name] ~= nil then
						local var_232_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_27.prefab_name].transform, "story_v_out_120411", "120411057", "story_v_out_120411.awb")

						arg_229_1:RecordAudio("120411057", var_232_33)
						arg_229_1:RecordAudio("120411057", var_232_33)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_120411", "120411057", "story_v_out_120411.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_120411", "120411057", "story_v_out_120411.awb")
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
	Play120411058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 120411058
		arg_233_1.duration_ = 7.5

		local var_233_0 = {
			zh = 5.166,
			ja = 7.5
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
				arg_233_0:Play120411059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1076ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1076ui_story == nil then
				arg_233_1.var_.characterEffect1076ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.2

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1076ui_story then
					arg_233_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1076ui_story then
				arg_233_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_236_4 = arg_233_1.actors_["1029ui_story"]
			local var_236_5 = 0

			if var_236_5 < arg_233_1.time_ and arg_233_1.time_ <= var_236_5 + arg_236_0 and arg_233_1.var_.characterEffect1029ui_story == nil then
				arg_233_1.var_.characterEffect1029ui_story = var_236_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_6 = 0.2

			if var_236_5 <= arg_233_1.time_ and arg_233_1.time_ < var_236_5 + var_236_6 then
				local var_236_7 = (arg_233_1.time_ - var_236_5) / var_236_6

				if arg_233_1.var_.characterEffect1029ui_story then
					local var_236_8 = Mathf.Lerp(0, 0.5, var_236_7)

					arg_233_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1029ui_story.fillRatio = var_236_8
				end
			end

			if arg_233_1.time_ >= var_236_5 + var_236_6 and arg_233_1.time_ < var_236_5 + var_236_6 + arg_236_0 and arg_233_1.var_.characterEffect1029ui_story then
				local var_236_9 = 0.5

				arg_233_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1029ui_story.fillRatio = var_236_9
			end

			local var_236_10 = 0
			local var_236_11 = 0.6

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_12 = arg_233_1:FormatText(StoryNameCfg[389].name)

				arg_233_1.leftNameTxt_.text = var_236_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_13 = arg_233_1:GetWordFromCfg(120411058)
				local var_236_14 = arg_233_1:FormatText(var_236_13.content)

				arg_233_1.text_.text = var_236_14

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_15 = 23
				local var_236_16 = utf8.len(var_236_14)
				local var_236_17 = var_236_15 <= 0 and var_236_11 or var_236_11 * (var_236_16 / var_236_15)

				if var_236_17 > 0 and var_236_11 < var_236_17 then
					arg_233_1.talkMaxDuration = var_236_17

					if var_236_17 + var_236_10 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_17 + var_236_10
					end
				end

				arg_233_1.text_.text = var_236_14
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411058", "story_v_out_120411.awb") ~= 0 then
					local var_236_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411058", "story_v_out_120411.awb") / 1000

					if var_236_18 + var_236_10 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_18 + var_236_10
					end

					if var_236_13.prefab_name ~= "" and arg_233_1.actors_[var_236_13.prefab_name] ~= nil then
						local var_236_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_13.prefab_name].transform, "story_v_out_120411", "120411058", "story_v_out_120411.awb")

						arg_233_1:RecordAudio("120411058", var_236_19)
						arg_233_1:RecordAudio("120411058", var_236_19)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_120411", "120411058", "story_v_out_120411.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_120411", "120411058", "story_v_out_120411.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_20 = math.max(var_236_11, arg_233_1.talkMaxDuration)

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_20 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_10) / var_236_20

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_10 + var_236_20 and arg_233_1.time_ < var_236_10 + var_236_20 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play120411059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 120411059
		arg_237_1.duration_ = 8.1

		local var_237_0 = {
			zh = 6.6,
			ja = 8.1
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
				arg_237_0:Play120411060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1076ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1076ui_story == nil then
				arg_237_1.var_.characterEffect1076ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1076ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1076ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1076ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1076ui_story.fillRatio = var_240_5
			end

			local var_240_6 = arg_237_1.actors_["1029ui_story"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.characterEffect1029ui_story == nil then
				arg_237_1.var_.characterEffect1029ui_story = var_240_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_8 = 0.2

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.characterEffect1029ui_story then
					arg_237_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.characterEffect1029ui_story then
				arg_237_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_240_10 = 0
			local var_240_11 = 0.725

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_12 = arg_237_1:FormatText(StoryNameCfg[319].name)

				arg_237_1.leftNameTxt_.text = var_240_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_13 = arg_237_1:GetWordFromCfg(120411059)
				local var_240_14 = arg_237_1:FormatText(var_240_13.content)

				arg_237_1.text_.text = var_240_14

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_15 = 28
				local var_240_16 = utf8.len(var_240_14)
				local var_240_17 = var_240_15 <= 0 and var_240_11 or var_240_11 * (var_240_16 / var_240_15)

				if var_240_17 > 0 and var_240_11 < var_240_17 then
					arg_237_1.talkMaxDuration = var_240_17

					if var_240_17 + var_240_10 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_17 + var_240_10
					end
				end

				arg_237_1.text_.text = var_240_14
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411059", "story_v_out_120411.awb") ~= 0 then
					local var_240_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411059", "story_v_out_120411.awb") / 1000

					if var_240_18 + var_240_10 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_18 + var_240_10
					end

					if var_240_13.prefab_name ~= "" and arg_237_1.actors_[var_240_13.prefab_name] ~= nil then
						local var_240_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_13.prefab_name].transform, "story_v_out_120411", "120411059", "story_v_out_120411.awb")

						arg_237_1:RecordAudio("120411059", var_240_19)
						arg_237_1:RecordAudio("120411059", var_240_19)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_120411", "120411059", "story_v_out_120411.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_120411", "120411059", "story_v_out_120411.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_20 = math.max(var_240_11, arg_237_1.talkMaxDuration)

			if var_240_10 <= arg_237_1.time_ and arg_237_1.time_ < var_240_10 + var_240_20 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_10) / var_240_20

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_10 + var_240_20 and arg_237_1.time_ < var_240_10 + var_240_20 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play120411060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 120411060
		arg_241_1.duration_ = 5.633

		local var_241_0 = {
			zh = 5.333,
			ja = 5.633
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play120411061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.7

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_2 = arg_241_1:FormatText(StoryNameCfg[319].name)

				arg_241_1.leftNameTxt_.text = var_244_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_3 = arg_241_1:GetWordFromCfg(120411060)
				local var_244_4 = arg_241_1:FormatText(var_244_3.content)

				arg_241_1.text_.text = var_244_4

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_5 = 28
				local var_244_6 = utf8.len(var_244_4)
				local var_244_7 = var_244_5 <= 0 and var_244_1 or var_244_1 * (var_244_6 / var_244_5)

				if var_244_7 > 0 and var_244_1 < var_244_7 then
					arg_241_1.talkMaxDuration = var_244_7

					if var_244_7 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_7 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_4
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411060", "story_v_out_120411.awb") ~= 0 then
					local var_244_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411060", "story_v_out_120411.awb") / 1000

					if var_244_8 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_0
					end

					if var_244_3.prefab_name ~= "" and arg_241_1.actors_[var_244_3.prefab_name] ~= nil then
						local var_244_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_3.prefab_name].transform, "story_v_out_120411", "120411060", "story_v_out_120411.awb")

						arg_241_1:RecordAudio("120411060", var_244_9)
						arg_241_1:RecordAudio("120411060", var_244_9)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_120411", "120411060", "story_v_out_120411.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_120411", "120411060", "story_v_out_120411.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_10 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_10 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_10

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_10 and arg_241_1.time_ < var_244_0 + var_244_10 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play120411061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 120411061
		arg_245_1.duration_ = 2.966

		local var_245_0 = {
			zh = 2.966,
			ja = 2.333
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
				arg_245_0:Play120411062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1076ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1076ui_story == nil then
				arg_245_1.var_.characterEffect1076ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1076ui_story then
					arg_245_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1076ui_story then
				arg_245_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_248_4 = arg_245_1.actors_["1029ui_story"]
			local var_248_5 = 0

			if var_248_5 < arg_245_1.time_ and arg_245_1.time_ <= var_248_5 + arg_248_0 and arg_245_1.var_.characterEffect1029ui_story == nil then
				arg_245_1.var_.characterEffect1029ui_story = var_248_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_6 = 0.2

			if var_248_5 <= arg_245_1.time_ and arg_245_1.time_ < var_248_5 + var_248_6 then
				local var_248_7 = (arg_245_1.time_ - var_248_5) / var_248_6

				if arg_245_1.var_.characterEffect1029ui_story then
					local var_248_8 = Mathf.Lerp(0, 0.5, var_248_7)

					arg_245_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1029ui_story.fillRatio = var_248_8
				end
			end

			if arg_245_1.time_ >= var_248_5 + var_248_6 and arg_245_1.time_ < var_248_5 + var_248_6 + arg_248_0 and arg_245_1.var_.characterEffect1029ui_story then
				local var_248_9 = 0.5

				arg_245_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1029ui_story.fillRatio = var_248_9
			end

			local var_248_10 = 0
			local var_248_11 = 0.275

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_12 = arg_245_1:FormatText(StoryNameCfg[389].name)

				arg_245_1.leftNameTxt_.text = var_248_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_13 = arg_245_1:GetWordFromCfg(120411061)
				local var_248_14 = arg_245_1:FormatText(var_248_13.content)

				arg_245_1.text_.text = var_248_14

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_15 = 11
				local var_248_16 = utf8.len(var_248_14)
				local var_248_17 = var_248_15 <= 0 and var_248_11 or var_248_11 * (var_248_16 / var_248_15)

				if var_248_17 > 0 and var_248_11 < var_248_17 then
					arg_245_1.talkMaxDuration = var_248_17

					if var_248_17 + var_248_10 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_17 + var_248_10
					end
				end

				arg_245_1.text_.text = var_248_14
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411061", "story_v_out_120411.awb") ~= 0 then
					local var_248_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411061", "story_v_out_120411.awb") / 1000

					if var_248_18 + var_248_10 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_18 + var_248_10
					end

					if var_248_13.prefab_name ~= "" and arg_245_1.actors_[var_248_13.prefab_name] ~= nil then
						local var_248_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_13.prefab_name].transform, "story_v_out_120411", "120411061", "story_v_out_120411.awb")

						arg_245_1:RecordAudio("120411061", var_248_19)
						arg_245_1:RecordAudio("120411061", var_248_19)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_120411", "120411061", "story_v_out_120411.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_120411", "120411061", "story_v_out_120411.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_20 = math.max(var_248_11, arg_245_1.talkMaxDuration)

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_20 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_10) / var_248_20

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_10 + var_248_20 and arg_245_1.time_ < var_248_10 + var_248_20 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play120411062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 120411062
		arg_249_1.duration_ = 6.8

		local var_249_0 = {
			zh = 3.166,
			ja = 6.8
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
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play120411063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.375

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[389].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(120411062)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 15
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411062", "story_v_out_120411.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411062", "story_v_out_120411.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_120411", "120411062", "story_v_out_120411.awb")

						arg_249_1:RecordAudio("120411062", var_252_9)
						arg_249_1:RecordAudio("120411062", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_120411", "120411062", "story_v_out_120411.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_120411", "120411062", "story_v_out_120411.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_10 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_10 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_10

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_10 and arg_249_1.time_ < var_252_0 + var_252_10 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play120411063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 120411063
		arg_253_1.duration_ = 11.533

		local var_253_0 = {
			zh = 5.033,
			ja = 11.533
		}
		local var_253_1 = manager.audio:GetLocalizationFlag()

		if var_253_0[var_253_1] ~= nil then
			arg_253_1.duration_ = var_253_0[var_253_1]
		end

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play120411064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1076ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1076ui_story == nil then
				arg_253_1.var_.characterEffect1076ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1076ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1076ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1076ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1076ui_story.fillRatio = var_256_5
			end

			local var_256_6 = arg_253_1.actors_["1029ui_story"]
			local var_256_7 = 0

			if var_256_7 < arg_253_1.time_ and arg_253_1.time_ <= var_256_7 + arg_256_0 and arg_253_1.var_.characterEffect1029ui_story == nil then
				arg_253_1.var_.characterEffect1029ui_story = var_256_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_8 = 0.2

			if var_256_7 <= arg_253_1.time_ and arg_253_1.time_ < var_256_7 + var_256_8 then
				local var_256_9 = (arg_253_1.time_ - var_256_7) / var_256_8

				if arg_253_1.var_.characterEffect1029ui_story then
					arg_253_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_7 + var_256_8 and arg_253_1.time_ < var_256_7 + var_256_8 + arg_256_0 and arg_253_1.var_.characterEffect1029ui_story then
				arg_253_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 then
				arg_253_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_2")
			end

			local var_256_11 = 0
			local var_256_12 = 0.55

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_13 = arg_253_1:FormatText(StoryNameCfg[319].name)

				arg_253_1.leftNameTxt_.text = var_256_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_14 = arg_253_1:GetWordFromCfg(120411063)
				local var_256_15 = arg_253_1:FormatText(var_256_14.content)

				arg_253_1.text_.text = var_256_15

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_16 = 22
				local var_256_17 = utf8.len(var_256_15)
				local var_256_18 = var_256_16 <= 0 and var_256_12 or var_256_12 * (var_256_17 / var_256_16)

				if var_256_18 > 0 and var_256_12 < var_256_18 then
					arg_253_1.talkMaxDuration = var_256_18

					if var_256_18 + var_256_11 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_18 + var_256_11
					end
				end

				arg_253_1.text_.text = var_256_15
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411063", "story_v_out_120411.awb") ~= 0 then
					local var_256_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411063", "story_v_out_120411.awb") / 1000

					if var_256_19 + var_256_11 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_19 + var_256_11
					end

					if var_256_14.prefab_name ~= "" and arg_253_1.actors_[var_256_14.prefab_name] ~= nil then
						local var_256_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_14.prefab_name].transform, "story_v_out_120411", "120411063", "story_v_out_120411.awb")

						arg_253_1:RecordAudio("120411063", var_256_20)
						arg_253_1:RecordAudio("120411063", var_256_20)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_120411", "120411063", "story_v_out_120411.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_120411", "120411063", "story_v_out_120411.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_21 = math.max(var_256_12, arg_253_1.talkMaxDuration)

			if var_256_11 <= arg_253_1.time_ and arg_253_1.time_ < var_256_11 + var_256_21 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_11) / var_256_21

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_11 + var_256_21 and arg_253_1.time_ < var_256_11 + var_256_21 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play120411064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 120411064
		arg_257_1.duration_ = 7.766

		local var_257_0 = {
			zh = 3.866,
			ja = 7.766
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play120411065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1076ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1076ui_story == nil then
				arg_257_1.var_.characterEffect1076ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.2

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1076ui_story then
					arg_257_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1076ui_story then
				arg_257_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_260_4 = arg_257_1.actors_["1029ui_story"]
			local var_260_5 = 0

			if var_260_5 < arg_257_1.time_ and arg_257_1.time_ <= var_260_5 + arg_260_0 and arg_257_1.var_.characterEffect1029ui_story == nil then
				arg_257_1.var_.characterEffect1029ui_story = var_260_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_6 = 0.2

			if var_260_5 <= arg_257_1.time_ and arg_257_1.time_ < var_260_5 + var_260_6 then
				local var_260_7 = (arg_257_1.time_ - var_260_5) / var_260_6

				if arg_257_1.var_.characterEffect1029ui_story then
					local var_260_8 = Mathf.Lerp(0, 0.5, var_260_7)

					arg_257_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1029ui_story.fillRatio = var_260_8
				end
			end

			if arg_257_1.time_ >= var_260_5 + var_260_6 and arg_257_1.time_ < var_260_5 + var_260_6 + arg_260_0 and arg_257_1.var_.characterEffect1029ui_story then
				local var_260_9 = 0.5

				arg_257_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1029ui_story.fillRatio = var_260_9
			end

			local var_260_10 = 0
			local var_260_11 = 0.35

			if var_260_10 < arg_257_1.time_ and arg_257_1.time_ <= var_260_10 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_12 = arg_257_1:FormatText(StoryNameCfg[389].name)

				arg_257_1.leftNameTxt_.text = var_260_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_13 = arg_257_1:GetWordFromCfg(120411064)
				local var_260_14 = arg_257_1:FormatText(var_260_13.content)

				arg_257_1.text_.text = var_260_14

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_15 = 14
				local var_260_16 = utf8.len(var_260_14)
				local var_260_17 = var_260_15 <= 0 and var_260_11 or var_260_11 * (var_260_16 / var_260_15)

				if var_260_17 > 0 and var_260_11 < var_260_17 then
					arg_257_1.talkMaxDuration = var_260_17

					if var_260_17 + var_260_10 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_17 + var_260_10
					end
				end

				arg_257_1.text_.text = var_260_14
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411064", "story_v_out_120411.awb") ~= 0 then
					local var_260_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411064", "story_v_out_120411.awb") / 1000

					if var_260_18 + var_260_10 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_18 + var_260_10
					end

					if var_260_13.prefab_name ~= "" and arg_257_1.actors_[var_260_13.prefab_name] ~= nil then
						local var_260_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_13.prefab_name].transform, "story_v_out_120411", "120411064", "story_v_out_120411.awb")

						arg_257_1:RecordAudio("120411064", var_260_19)
						arg_257_1:RecordAudio("120411064", var_260_19)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_120411", "120411064", "story_v_out_120411.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_120411", "120411064", "story_v_out_120411.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_20 = math.max(var_260_11, arg_257_1.talkMaxDuration)

			if var_260_10 <= arg_257_1.time_ and arg_257_1.time_ < var_260_10 + var_260_20 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_10) / var_260_20

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_10 + var_260_20 and arg_257_1.time_ < var_260_10 + var_260_20 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play120411065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 120411065
		arg_261_1.duration_ = 5.766

		local var_261_0 = {
			zh = 3.933,
			ja = 5.766
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
				arg_261_0:Play120411066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1076ui_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.characterEffect1076ui_story == nil then
				arg_261_1.var_.characterEffect1076ui_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.2

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.characterEffect1076ui_story then
					local var_264_4 = Mathf.Lerp(0, 0.5, var_264_3)

					arg_261_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1076ui_story.fillRatio = var_264_4
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.characterEffect1076ui_story then
				local var_264_5 = 0.5

				arg_261_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1076ui_story.fillRatio = var_264_5
			end

			local var_264_6 = arg_261_1.actors_["1029ui_story"]
			local var_264_7 = 0

			if var_264_7 < arg_261_1.time_ and arg_261_1.time_ <= var_264_7 + arg_264_0 and arg_261_1.var_.characterEffect1029ui_story == nil then
				arg_261_1.var_.characterEffect1029ui_story = var_264_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_8 = 0.2

			if var_264_7 <= arg_261_1.time_ and arg_261_1.time_ < var_264_7 + var_264_8 then
				local var_264_9 = (arg_261_1.time_ - var_264_7) / var_264_8

				if arg_261_1.var_.characterEffect1029ui_story then
					arg_261_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_7 + var_264_8 and arg_261_1.time_ < var_264_7 + var_264_8 + arg_264_0 and arg_261_1.var_.characterEffect1029ui_story then
				arg_261_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_264_10 = 0
			local var_264_11 = 0.25

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_12 = arg_261_1:FormatText(StoryNameCfg[319].name)

				arg_261_1.leftNameTxt_.text = var_264_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_13 = arg_261_1:GetWordFromCfg(120411065)
				local var_264_14 = arg_261_1:FormatText(var_264_13.content)

				arg_261_1.text_.text = var_264_14

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_15 = 10
				local var_264_16 = utf8.len(var_264_14)
				local var_264_17 = var_264_15 <= 0 and var_264_11 or var_264_11 * (var_264_16 / var_264_15)

				if var_264_17 > 0 and var_264_11 < var_264_17 then
					arg_261_1.talkMaxDuration = var_264_17

					if var_264_17 + var_264_10 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_17 + var_264_10
					end
				end

				arg_261_1.text_.text = var_264_14
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411065", "story_v_out_120411.awb") ~= 0 then
					local var_264_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411065", "story_v_out_120411.awb") / 1000

					if var_264_18 + var_264_10 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_18 + var_264_10
					end

					if var_264_13.prefab_name ~= "" and arg_261_1.actors_[var_264_13.prefab_name] ~= nil then
						local var_264_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_13.prefab_name].transform, "story_v_out_120411", "120411065", "story_v_out_120411.awb")

						arg_261_1:RecordAudio("120411065", var_264_19)
						arg_261_1:RecordAudio("120411065", var_264_19)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_120411", "120411065", "story_v_out_120411.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_120411", "120411065", "story_v_out_120411.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_20 = math.max(var_264_11, arg_261_1.talkMaxDuration)

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_20 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_10) / var_264_20

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_10 + var_264_20 and arg_261_1.time_ < var_264_10 + var_264_20 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play120411066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 120411066
		arg_265_1.duration_ = 9

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play120411067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = "J05f"

			if arg_265_1.bgs_[var_268_0] == nil then
				local var_268_1 = Object.Instantiate(arg_265_1.paintGo_)

				var_268_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_268_0)
				var_268_1.name = var_268_0
				var_268_1.transform.parent = arg_265_1.stage_.transform
				var_268_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_265_1.bgs_[var_268_0] = var_268_1
			end

			local var_268_2 = 2

			if var_268_2 < arg_265_1.time_ and arg_265_1.time_ <= var_268_2 + arg_268_0 then
				local var_268_3 = manager.ui.mainCamera.transform.localPosition
				local var_268_4 = Vector3.New(0, 0, 10) + Vector3.New(var_268_3.x, var_268_3.y, 0)
				local var_268_5 = arg_265_1.bgs_.J05f

				var_268_5.transform.localPosition = var_268_4
				var_268_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_268_6 = var_268_5:GetComponent("SpriteRenderer")

				if var_268_6 and var_268_6.sprite then
					local var_268_7 = (var_268_5.transform.localPosition - var_268_3).z
					local var_268_8 = manager.ui.mainCameraCom_
					local var_268_9 = 2 * var_268_7 * Mathf.Tan(var_268_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_268_10 = var_268_9 * var_268_8.aspect
					local var_268_11 = var_268_6.sprite.bounds.size.x
					local var_268_12 = var_268_6.sprite.bounds.size.y
					local var_268_13 = var_268_10 / var_268_11
					local var_268_14 = var_268_9 / var_268_12
					local var_268_15 = var_268_14 < var_268_13 and var_268_13 or var_268_14

					var_268_5.transform.localScale = Vector3.New(var_268_15, var_268_15, 0)
				end

				for iter_268_0, iter_268_1 in pairs(arg_265_1.bgs_) do
					if iter_268_0 ~= "J05f" then
						iter_268_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_268_16 = 0

			if var_268_16 < arg_265_1.time_ and arg_265_1.time_ <= var_268_16 + arg_268_0 then
				arg_265_1.mask_.enabled = true
				arg_265_1.mask_.raycastTarget = true

				arg_265_1:SetGaussion(false)
			end

			local var_268_17 = 2

			if var_268_16 <= arg_265_1.time_ and arg_265_1.time_ < var_268_16 + var_268_17 then
				local var_268_18 = (arg_265_1.time_ - var_268_16) / var_268_17
				local var_268_19 = Color.New(0, 0, 0)

				var_268_19.a = Mathf.Lerp(0, 1, var_268_18)
				arg_265_1.mask_.color = var_268_19
			end

			if arg_265_1.time_ >= var_268_16 + var_268_17 and arg_265_1.time_ < var_268_16 + var_268_17 + arg_268_0 then
				local var_268_20 = Color.New(0, 0, 0)

				var_268_20.a = 1
				arg_265_1.mask_.color = var_268_20
			end

			local var_268_21 = 2

			if var_268_21 < arg_265_1.time_ and arg_265_1.time_ <= var_268_21 + arg_268_0 then
				arg_265_1.mask_.enabled = true
				arg_265_1.mask_.raycastTarget = true

				arg_265_1:SetGaussion(false)
			end

			local var_268_22 = 2

			if var_268_21 <= arg_265_1.time_ and arg_265_1.time_ < var_268_21 + var_268_22 then
				local var_268_23 = (arg_265_1.time_ - var_268_21) / var_268_22
				local var_268_24 = Color.New(0, 0, 0)

				var_268_24.a = Mathf.Lerp(1, 0, var_268_23)
				arg_265_1.mask_.color = var_268_24
			end

			if arg_265_1.time_ >= var_268_21 + var_268_22 and arg_265_1.time_ < var_268_21 + var_268_22 + arg_268_0 then
				local var_268_25 = Color.New(0, 0, 0)
				local var_268_26 = 0

				arg_265_1.mask_.enabled = false
				var_268_25.a = var_268_26
				arg_265_1.mask_.color = var_268_25
			end

			local var_268_27 = arg_265_1.actors_["1029ui_story"].transform
			local var_268_28 = 1.966

			if var_268_28 < arg_265_1.time_ and arg_265_1.time_ <= var_268_28 + arg_268_0 then
				arg_265_1.var_.moveOldPos1029ui_story = var_268_27.localPosition
			end

			local var_268_29 = 0.001

			if var_268_28 <= arg_265_1.time_ and arg_265_1.time_ < var_268_28 + var_268_29 then
				local var_268_30 = (arg_265_1.time_ - var_268_28) / var_268_29
				local var_268_31 = Vector3.New(0, 100, 0)

				var_268_27.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1029ui_story, var_268_31, var_268_30)

				local var_268_32 = manager.ui.mainCamera.transform.position - var_268_27.position

				var_268_27.forward = Vector3.New(var_268_32.x, var_268_32.y, var_268_32.z)

				local var_268_33 = var_268_27.localEulerAngles

				var_268_33.z = 0
				var_268_33.x = 0
				var_268_27.localEulerAngles = var_268_33
			end

			if arg_265_1.time_ >= var_268_28 + var_268_29 and arg_265_1.time_ < var_268_28 + var_268_29 + arg_268_0 then
				var_268_27.localPosition = Vector3.New(0, 100, 0)

				local var_268_34 = manager.ui.mainCamera.transform.position - var_268_27.position

				var_268_27.forward = Vector3.New(var_268_34.x, var_268_34.y, var_268_34.z)

				local var_268_35 = var_268_27.localEulerAngles

				var_268_35.z = 0
				var_268_35.x = 0
				var_268_27.localEulerAngles = var_268_35
			end

			local var_268_36 = arg_265_1.actors_["1076ui_story"].transform
			local var_268_37 = 1.966

			if var_268_37 < arg_265_1.time_ and arg_265_1.time_ <= var_268_37 + arg_268_0 then
				arg_265_1.var_.moveOldPos1076ui_story = var_268_36.localPosition
			end

			local var_268_38 = 0.001

			if var_268_37 <= arg_265_1.time_ and arg_265_1.time_ < var_268_37 + var_268_38 then
				local var_268_39 = (arg_265_1.time_ - var_268_37) / var_268_38
				local var_268_40 = Vector3.New(0, 100, 0)

				var_268_36.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1076ui_story, var_268_40, var_268_39)

				local var_268_41 = manager.ui.mainCamera.transform.position - var_268_36.position

				var_268_36.forward = Vector3.New(var_268_41.x, var_268_41.y, var_268_41.z)

				local var_268_42 = var_268_36.localEulerAngles

				var_268_42.z = 0
				var_268_42.x = 0
				var_268_36.localEulerAngles = var_268_42
			end

			if arg_265_1.time_ >= var_268_37 + var_268_38 and arg_265_1.time_ < var_268_37 + var_268_38 + arg_268_0 then
				var_268_36.localPosition = Vector3.New(0, 100, 0)

				local var_268_43 = manager.ui.mainCamera.transform.position - var_268_36.position

				var_268_36.forward = Vector3.New(var_268_43.x, var_268_43.y, var_268_43.z)

				local var_268_44 = var_268_36.localEulerAngles

				var_268_44.z = 0
				var_268_44.x = 0
				var_268_36.localEulerAngles = var_268_44
			end

			local var_268_45 = 0.466666666666667
			local var_268_46 = 1

			if var_268_45 < arg_265_1.time_ and arg_265_1.time_ <= var_268_45 + arg_268_0 then
				local var_268_47 = "play"
				local var_268_48 = "music"

				arg_265_1:AudioAction(var_268_47, var_268_48, "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu.awb")
			end

			local var_268_49 = 0
			local var_268_50 = 0.466666666666667

			if var_268_49 < arg_265_1.time_ and arg_265_1.time_ <= var_268_49 + arg_268_0 then
				local var_268_51 = "play"
				local var_268_52 = "music"

				arg_265_1:AudioAction(var_268_51, var_268_52, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_265_1.frameCnt_ <= 1 then
				arg_265_1.dialog_:SetActive(false)
			end

			local var_268_53 = 4
			local var_268_54 = 1.125

			if var_268_53 < arg_265_1.time_ and arg_265_1.time_ <= var_268_53 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0

				arg_265_1.dialog_:SetActive(true)

				local var_268_55 = LeanTween.value(arg_265_1.dialog_, 0, 1, 0.3)

				var_268_55:setOnUpdate(LuaHelper.FloatAction(function(arg_269_0)
					arg_265_1.dialogCg_.alpha = arg_269_0
				end))
				var_268_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_265_1.dialog_)
					var_268_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_265_1.duration_ = arg_265_1.duration_ + 0.3

				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_56 = arg_265_1:GetWordFromCfg(120411066)
				local var_268_57 = arg_265_1:FormatText(var_268_56.content)

				arg_265_1.text_.text = var_268_57

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_58 = 45
				local var_268_59 = utf8.len(var_268_57)
				local var_268_60 = var_268_58 <= 0 and var_268_54 or var_268_54 * (var_268_59 / var_268_58)

				if var_268_60 > 0 and var_268_54 < var_268_60 then
					arg_265_1.talkMaxDuration = var_268_60
					var_268_53 = var_268_53 + 0.3

					if var_268_60 + var_268_53 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_60 + var_268_53
					end
				end

				arg_265_1.text_.text = var_268_57
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_61 = var_268_53 + 0.3
			local var_268_62 = math.max(var_268_54, arg_265_1.talkMaxDuration)

			if var_268_61 <= arg_265_1.time_ and arg_265_1.time_ < var_268_61 + var_268_62 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_61) / var_268_62

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_61 + var_268_62 and arg_265_1.time_ < var_268_61 + var_268_62 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play120411067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 120411067
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play120411068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1.45

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_2 = arg_271_1:GetWordFromCfg(120411067)
				local var_274_3 = arg_271_1:FormatText(var_274_2.content)

				arg_271_1.text_.text = var_274_3

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_4 = 58
				local var_274_5 = utf8.len(var_274_3)
				local var_274_6 = var_274_4 <= 0 and var_274_1 or var_274_1 * (var_274_5 / var_274_4)

				if var_274_6 > 0 and var_274_1 < var_274_6 then
					arg_271_1.talkMaxDuration = var_274_6

					if var_274_6 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_6 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_3
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_7 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_7 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_7

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_7 and arg_271_1.time_ < var_274_0 + var_274_7 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play120411068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 120411068
		arg_275_1.duration_ = 1.633

		local var_275_0 = {
			zh = 0.999999999999,
			ja = 1.633
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
				arg_275_0:Play120411069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 0.05

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_2 = arg_275_1:FormatText(StoryNameCfg[378].name)

				arg_275_1.leftNameTxt_.text = var_278_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, true)
				arg_275_1.iconController_:SetSelectedState("hero")

				arg_275_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_3 = arg_275_1:GetWordFromCfg(120411068)
				local var_278_4 = arg_275_1:FormatText(var_278_3.content)

				arg_275_1.text_.text = var_278_4

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_5 = 2
				local var_278_6 = utf8.len(var_278_4)
				local var_278_7 = var_278_5 <= 0 and var_278_1 or var_278_1 * (var_278_6 / var_278_5)

				if var_278_7 > 0 and var_278_1 < var_278_7 then
					arg_275_1.talkMaxDuration = var_278_7

					if var_278_7 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_7 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_4
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411068", "story_v_out_120411.awb") ~= 0 then
					local var_278_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411068", "story_v_out_120411.awb") / 1000

					if var_278_8 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_8 + var_278_0
					end

					if var_278_3.prefab_name ~= "" and arg_275_1.actors_[var_278_3.prefab_name] ~= nil then
						local var_278_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_3.prefab_name].transform, "story_v_out_120411", "120411068", "story_v_out_120411.awb")

						arg_275_1:RecordAudio("120411068", var_278_9)
						arg_275_1:RecordAudio("120411068", var_278_9)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_120411", "120411068", "story_v_out_120411.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_120411", "120411068", "story_v_out_120411.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_10 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_10 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_10

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_10 and arg_275_1.time_ < var_278_0 + var_278_10 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play120411069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 120411069
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play120411070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 1.075

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_2 = arg_279_1:GetWordFromCfg(120411069)
				local var_282_3 = arg_279_1:FormatText(var_282_2.content)

				arg_279_1.text_.text = var_282_3

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_4 = 43
				local var_282_5 = utf8.len(var_282_3)
				local var_282_6 = var_282_4 <= 0 and var_282_1 or var_282_1 * (var_282_5 / var_282_4)

				if var_282_6 > 0 and var_282_1 < var_282_6 then
					arg_279_1.talkMaxDuration = var_282_6

					if var_282_6 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_6 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_3
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_7 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_7 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_7

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_7 and arg_279_1.time_ < var_282_0 + var_282_7 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play120411070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 120411070
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play120411071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.775

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_2 = arg_283_1:GetWordFromCfg(120411070)
				local var_286_3 = arg_283_1:FormatText(var_286_2.content)

				arg_283_1.text_.text = var_286_3

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_4 = 31
				local var_286_5 = utf8.len(var_286_3)
				local var_286_6 = var_286_4 <= 0 and var_286_1 or var_286_1 * (var_286_5 / var_286_4)

				if var_286_6 > 0 and var_286_1 < var_286_6 then
					arg_283_1.talkMaxDuration = var_286_6

					if var_286_6 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_6 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_3
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_7 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_7 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_7

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_7 and arg_283_1.time_ < var_286_0 + var_286_7 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play120411071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 120411071
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play120411072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.75

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

				local var_290_2 = arg_287_1:GetWordFromCfg(120411071)
				local var_290_3 = arg_287_1:FormatText(var_290_2.content)

				arg_287_1.text_.text = var_290_3

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_4 = 30
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
	Play120411072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 120411072
		arg_291_1.duration_ = 3.866

		local var_291_0 = {
			zh = 2.4,
			ja = 3.866
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play120411073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.1

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_2 = arg_291_1:FormatText(StoryNameCfg[378].name)

				arg_291_1.leftNameTxt_.text = var_294_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, true)
				arg_291_1.iconController_:SetSelectedState("hero")

				arg_291_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_3 = arg_291_1:GetWordFromCfg(120411072)
				local var_294_4 = arg_291_1:FormatText(var_294_3.content)

				arg_291_1.text_.text = var_294_4

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_5 = 4
				local var_294_6 = utf8.len(var_294_4)
				local var_294_7 = var_294_5 <= 0 and var_294_1 or var_294_1 * (var_294_6 / var_294_5)

				if var_294_7 > 0 and var_294_1 < var_294_7 then
					arg_291_1.talkMaxDuration = var_294_7

					if var_294_7 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_7 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_4
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411072", "story_v_out_120411.awb") ~= 0 then
					local var_294_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411072", "story_v_out_120411.awb") / 1000

					if var_294_8 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_8 + var_294_0
					end

					if var_294_3.prefab_name ~= "" and arg_291_1.actors_[var_294_3.prefab_name] ~= nil then
						local var_294_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_3.prefab_name].transform, "story_v_out_120411", "120411072", "story_v_out_120411.awb")

						arg_291_1:RecordAudio("120411072", var_294_9)
						arg_291_1:RecordAudio("120411072", var_294_9)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_120411", "120411072", "story_v_out_120411.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_120411", "120411072", "story_v_out_120411.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_10 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_10 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_10

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_10 and arg_291_1.time_ < var_294_0 + var_294_10 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play120411073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 120411073
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play120411074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 0.9

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

				local var_298_2 = arg_295_1:GetWordFromCfg(120411073)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 36
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
	Play120411074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 120411074
		arg_299_1.duration_ = 7.966

		local var_299_0 = {
			zh = 7.966,
			ja = 7.333
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
				arg_299_0:Play120411075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = "1069ui_story"

			if arg_299_1.actors_[var_302_0] == nil then
				local var_302_1 = Object.Instantiate(Asset.Load("Char/" .. var_302_0), arg_299_1.stage_.transform)

				var_302_1.name = var_302_0
				var_302_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_299_1.actors_[var_302_0] = var_302_1

				local var_302_2 = var_302_1:GetComponentInChildren(typeof(CharacterEffect))

				var_302_2.enabled = true

				local var_302_3 = GameObjectTools.GetOrAddComponent(var_302_1, typeof(DynamicBoneHelper))

				if var_302_3 then
					var_302_3:EnableDynamicBone(false)
				end

				arg_299_1:ShowWeapon(var_302_2.transform, false)

				arg_299_1.var_[var_302_0 .. "Animator"] = var_302_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_299_1.var_[var_302_0 .. "Animator"].applyRootMotion = true
				arg_299_1.var_[var_302_0 .. "LipSync"] = var_302_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_302_4 = arg_299_1.actors_["1069ui_story"].transform
			local var_302_5 = 0

			if var_302_5 < arg_299_1.time_ and arg_299_1.time_ <= var_302_5 + arg_302_0 then
				arg_299_1.var_.moveOldPos1069ui_story = var_302_4.localPosition
			end

			local var_302_6 = 0.001

			if var_302_5 <= arg_299_1.time_ and arg_299_1.time_ < var_302_5 + var_302_6 then
				local var_302_7 = (arg_299_1.time_ - var_302_5) / var_302_6
				local var_302_8 = Vector3.New(-0.7, -1, -6)

				var_302_4.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1069ui_story, var_302_8, var_302_7)

				local var_302_9 = manager.ui.mainCamera.transform.position - var_302_4.position

				var_302_4.forward = Vector3.New(var_302_9.x, var_302_9.y, var_302_9.z)

				local var_302_10 = var_302_4.localEulerAngles

				var_302_10.z = 0
				var_302_10.x = 0
				var_302_4.localEulerAngles = var_302_10
			end

			if arg_299_1.time_ >= var_302_5 + var_302_6 and arg_299_1.time_ < var_302_5 + var_302_6 + arg_302_0 then
				var_302_4.localPosition = Vector3.New(-0.7, -1, -6)

				local var_302_11 = manager.ui.mainCamera.transform.position - var_302_4.position

				var_302_4.forward = Vector3.New(var_302_11.x, var_302_11.y, var_302_11.z)

				local var_302_12 = var_302_4.localEulerAngles

				var_302_12.z = 0
				var_302_12.x = 0
				var_302_4.localEulerAngles = var_302_12
			end

			local var_302_13 = 0

			if var_302_13 < arg_299_1.time_ and arg_299_1.time_ <= var_302_13 + arg_302_0 then
				arg_299_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 then
				arg_299_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_302_15 = arg_299_1.actors_["1069ui_story"]
			local var_302_16 = 0

			if var_302_16 < arg_299_1.time_ and arg_299_1.time_ <= var_302_16 + arg_302_0 and arg_299_1.var_.characterEffect1069ui_story == nil then
				arg_299_1.var_.characterEffect1069ui_story = var_302_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_17 = 0.2

			if var_302_16 <= arg_299_1.time_ and arg_299_1.time_ < var_302_16 + var_302_17 then
				local var_302_18 = (arg_299_1.time_ - var_302_16) / var_302_17

				if arg_299_1.var_.characterEffect1069ui_story then
					arg_299_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_16 + var_302_17 and arg_299_1.time_ < var_302_16 + var_302_17 + arg_302_0 and arg_299_1.var_.characterEffect1069ui_story then
				arg_299_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_302_19 = "1071ui_story"

			if arg_299_1.actors_[var_302_19] == nil then
				local var_302_20 = Object.Instantiate(Asset.Load("Char/" .. var_302_19), arg_299_1.stage_.transform)

				var_302_20.name = var_302_19
				var_302_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_299_1.actors_[var_302_19] = var_302_20

				local var_302_21 = var_302_20:GetComponentInChildren(typeof(CharacterEffect))

				var_302_21.enabled = true

				local var_302_22 = GameObjectTools.GetOrAddComponent(var_302_20, typeof(DynamicBoneHelper))

				if var_302_22 then
					var_302_22:EnableDynamicBone(false)
				end

				arg_299_1:ShowWeapon(var_302_21.transform, false)

				arg_299_1.var_[var_302_19 .. "Animator"] = var_302_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_299_1.var_[var_302_19 .. "Animator"].applyRootMotion = true
				arg_299_1.var_[var_302_19 .. "LipSync"] = var_302_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_302_23 = 0

			if var_302_23 < arg_299_1.time_ and arg_299_1.time_ <= var_302_23 + arg_302_0 then
				arg_299_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_302_24 = 0
			local var_302_25 = 1.025

			if var_302_24 < arg_299_1.time_ and arg_299_1.time_ <= var_302_24 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_26 = arg_299_1:FormatText(StoryNameCfg[378].name)

				arg_299_1.leftNameTxt_.text = var_302_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_27 = arg_299_1:GetWordFromCfg(120411074)
				local var_302_28 = arg_299_1:FormatText(var_302_27.content)

				arg_299_1.text_.text = var_302_28

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_29 = 41
				local var_302_30 = utf8.len(var_302_28)
				local var_302_31 = var_302_29 <= 0 and var_302_25 or var_302_25 * (var_302_30 / var_302_29)

				if var_302_31 > 0 and var_302_25 < var_302_31 then
					arg_299_1.talkMaxDuration = var_302_31

					if var_302_31 + var_302_24 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_31 + var_302_24
					end
				end

				arg_299_1.text_.text = var_302_28
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411074", "story_v_out_120411.awb") ~= 0 then
					local var_302_32 = manager.audio:GetVoiceLength("story_v_out_120411", "120411074", "story_v_out_120411.awb") / 1000

					if var_302_32 + var_302_24 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_32 + var_302_24
					end

					if var_302_27.prefab_name ~= "" and arg_299_1.actors_[var_302_27.prefab_name] ~= nil then
						local var_302_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_27.prefab_name].transform, "story_v_out_120411", "120411074", "story_v_out_120411.awb")

						arg_299_1:RecordAudio("120411074", var_302_33)
						arg_299_1:RecordAudio("120411074", var_302_33)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_120411", "120411074", "story_v_out_120411.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_120411", "120411074", "story_v_out_120411.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_34 = math.max(var_302_25, arg_299_1.talkMaxDuration)

			if var_302_24 <= arg_299_1.time_ and arg_299_1.time_ < var_302_24 + var_302_34 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_24) / var_302_34

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_24 + var_302_34 and arg_299_1.time_ < var_302_24 + var_302_34 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play120411075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 120411075
		arg_303_1.duration_ = 4.133

		local var_303_0 = {
			zh = 3.933,
			ja = 4.133
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
				arg_303_0:Play120411076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1069ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1069ui_story == nil then
				arg_303_1.var_.characterEffect1069ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1069ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1069ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1069ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1069ui_story.fillRatio = var_306_5
			end

			local var_306_6 = arg_303_1.actors_["1071ui_story"].transform
			local var_306_7 = 0

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 then
				arg_303_1.var_.moveOldPos1071ui_story = var_306_6.localPosition
			end

			local var_306_8 = 0.001

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_8 then
				local var_306_9 = (arg_303_1.time_ - var_306_7) / var_306_8
				local var_306_10 = Vector3.New(0.7, -1.05, -6.2)

				var_306_6.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1071ui_story, var_306_10, var_306_9)

				local var_306_11 = manager.ui.mainCamera.transform.position - var_306_6.position

				var_306_6.forward = Vector3.New(var_306_11.x, var_306_11.y, var_306_11.z)

				local var_306_12 = var_306_6.localEulerAngles

				var_306_12.z = 0
				var_306_12.x = 0
				var_306_6.localEulerAngles = var_306_12
			end

			if arg_303_1.time_ >= var_306_7 + var_306_8 and arg_303_1.time_ < var_306_7 + var_306_8 + arg_306_0 then
				var_306_6.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_306_13 = manager.ui.mainCamera.transform.position - var_306_6.position

				var_306_6.forward = Vector3.New(var_306_13.x, var_306_13.y, var_306_13.z)

				local var_306_14 = var_306_6.localEulerAngles

				var_306_14.z = 0
				var_306_14.x = 0
				var_306_6.localEulerAngles = var_306_14
			end

			local var_306_15 = arg_303_1.actors_["1071ui_story"]
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story == nil then
				arg_303_1.var_.characterEffect1071ui_story = var_306_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_17 = 0.2

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17

				if arg_303_1.var_.characterEffect1071ui_story then
					arg_303_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story then
				arg_303_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_306_19 = 0

			if var_306_19 < arg_303_1.time_ and arg_303_1.time_ <= var_306_19 + arg_306_0 then
				arg_303_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_306_20 = 0
			local var_306_21 = 0.45

			if var_306_20 < arg_303_1.time_ and arg_303_1.time_ <= var_306_20 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_22 = arg_303_1:FormatText(StoryNameCfg[384].name)

				arg_303_1.leftNameTxt_.text = var_306_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_23 = arg_303_1:GetWordFromCfg(120411075)
				local var_306_24 = arg_303_1:FormatText(var_306_23.content)

				arg_303_1.text_.text = var_306_24

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_25 = 18
				local var_306_26 = utf8.len(var_306_24)
				local var_306_27 = var_306_25 <= 0 and var_306_21 or var_306_21 * (var_306_26 / var_306_25)

				if var_306_27 > 0 and var_306_21 < var_306_27 then
					arg_303_1.talkMaxDuration = var_306_27

					if var_306_27 + var_306_20 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_27 + var_306_20
					end
				end

				arg_303_1.text_.text = var_306_24
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411075", "story_v_out_120411.awb") ~= 0 then
					local var_306_28 = manager.audio:GetVoiceLength("story_v_out_120411", "120411075", "story_v_out_120411.awb") / 1000

					if var_306_28 + var_306_20 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_28 + var_306_20
					end

					if var_306_23.prefab_name ~= "" and arg_303_1.actors_[var_306_23.prefab_name] ~= nil then
						local var_306_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_23.prefab_name].transform, "story_v_out_120411", "120411075", "story_v_out_120411.awb")

						arg_303_1:RecordAudio("120411075", var_306_29)
						arg_303_1:RecordAudio("120411075", var_306_29)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_120411", "120411075", "story_v_out_120411.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_120411", "120411075", "story_v_out_120411.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_30 = math.max(var_306_21, arg_303_1.talkMaxDuration)

			if var_306_20 <= arg_303_1.time_ and arg_303_1.time_ < var_306_20 + var_306_30 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_20) / var_306_30

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_20 + var_306_30 and arg_303_1.time_ < var_306_20 + var_306_30 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play120411076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 120411076
		arg_307_1.duration_ = 6.6

		local var_307_0 = {
			zh = 6.6,
			ja = 5.333
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
				arg_307_0:Play120411077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.75

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_2 = arg_307_1:FormatText(StoryNameCfg[384].name)

				arg_307_1.leftNameTxt_.text = var_310_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_3 = arg_307_1:GetWordFromCfg(120411076)
				local var_310_4 = arg_307_1:FormatText(var_310_3.content)

				arg_307_1.text_.text = var_310_4

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411076", "story_v_out_120411.awb") ~= 0 then
					local var_310_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411076", "story_v_out_120411.awb") / 1000

					if var_310_8 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_8 + var_310_0
					end

					if var_310_3.prefab_name ~= "" and arg_307_1.actors_[var_310_3.prefab_name] ~= nil then
						local var_310_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_3.prefab_name].transform, "story_v_out_120411", "120411076", "story_v_out_120411.awb")

						arg_307_1:RecordAudio("120411076", var_310_9)
						arg_307_1:RecordAudio("120411076", var_310_9)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_120411", "120411076", "story_v_out_120411.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_120411", "120411076", "story_v_out_120411.awb")
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
	Play120411077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 120411077
		arg_311_1.duration_ = 9.1

		local var_311_0 = {
			zh = 3.6,
			ja = 9.1
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play120411078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1069ui_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.characterEffect1069ui_story == nil then
				arg_311_1.var_.characterEffect1069ui_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.2

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect1069ui_story then
					arg_311_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1069ui_story then
				arg_311_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_314_4 = arg_311_1.actors_["1071ui_story"]
			local var_314_5 = 0

			if var_314_5 < arg_311_1.time_ and arg_311_1.time_ <= var_314_5 + arg_314_0 and arg_311_1.var_.characterEffect1071ui_story == nil then
				arg_311_1.var_.characterEffect1071ui_story = var_314_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_6 = 0.2

			if var_314_5 <= arg_311_1.time_ and arg_311_1.time_ < var_314_5 + var_314_6 then
				local var_314_7 = (arg_311_1.time_ - var_314_5) / var_314_6

				if arg_311_1.var_.characterEffect1071ui_story then
					local var_314_8 = Mathf.Lerp(0, 0.5, var_314_7)

					arg_311_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1071ui_story.fillRatio = var_314_8
				end
			end

			if arg_311_1.time_ >= var_314_5 + var_314_6 and arg_311_1.time_ < var_314_5 + var_314_6 + arg_314_0 and arg_311_1.var_.characterEffect1071ui_story then
				local var_314_9 = 0.5

				arg_311_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1071ui_story.fillRatio = var_314_9
			end

			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 then
				arg_311_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_314_11 = 0
			local var_314_12 = 0.4

			if var_314_11 < arg_311_1.time_ and arg_311_1.time_ <= var_314_11 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_13 = arg_311_1:FormatText(StoryNameCfg[378].name)

				arg_311_1.leftNameTxt_.text = var_314_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_14 = arg_311_1:GetWordFromCfg(120411077)
				local var_314_15 = arg_311_1:FormatText(var_314_14.content)

				arg_311_1.text_.text = var_314_15

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_16 = 16
				local var_314_17 = utf8.len(var_314_15)
				local var_314_18 = var_314_16 <= 0 and var_314_12 or var_314_12 * (var_314_17 / var_314_16)

				if var_314_18 > 0 and var_314_12 < var_314_18 then
					arg_311_1.talkMaxDuration = var_314_18

					if var_314_18 + var_314_11 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_18 + var_314_11
					end
				end

				arg_311_1.text_.text = var_314_15
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411077", "story_v_out_120411.awb") ~= 0 then
					local var_314_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411077", "story_v_out_120411.awb") / 1000

					if var_314_19 + var_314_11 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_19 + var_314_11
					end

					if var_314_14.prefab_name ~= "" and arg_311_1.actors_[var_314_14.prefab_name] ~= nil then
						local var_314_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_14.prefab_name].transform, "story_v_out_120411", "120411077", "story_v_out_120411.awb")

						arg_311_1:RecordAudio("120411077", var_314_20)
						arg_311_1:RecordAudio("120411077", var_314_20)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_120411", "120411077", "story_v_out_120411.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_120411", "120411077", "story_v_out_120411.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_21 = math.max(var_314_12, arg_311_1.talkMaxDuration)

			if var_314_11 <= arg_311_1.time_ and arg_311_1.time_ < var_314_11 + var_314_21 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_11) / var_314_21

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_11 + var_314_21 and arg_311_1.time_ < var_314_11 + var_314_21 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play120411078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 120411078
		arg_315_1.duration_ = 9.866

		local var_315_0 = {
			zh = 5.966,
			ja = 9.866
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
				arg_315_0:Play120411079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_318_1 = 0
			local var_318_2 = 0.8

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_3 = arg_315_1:FormatText(StoryNameCfg[378].name)

				arg_315_1.leftNameTxt_.text = var_318_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_4 = arg_315_1:GetWordFromCfg(120411078)
				local var_318_5 = arg_315_1:FormatText(var_318_4.content)

				arg_315_1.text_.text = var_318_5

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_6 = 32
				local var_318_7 = utf8.len(var_318_5)
				local var_318_8 = var_318_6 <= 0 and var_318_2 or var_318_2 * (var_318_7 / var_318_6)

				if var_318_8 > 0 and var_318_2 < var_318_8 then
					arg_315_1.talkMaxDuration = var_318_8

					if var_318_8 + var_318_1 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_8 + var_318_1
					end
				end

				arg_315_1.text_.text = var_318_5
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411078", "story_v_out_120411.awb") ~= 0 then
					local var_318_9 = manager.audio:GetVoiceLength("story_v_out_120411", "120411078", "story_v_out_120411.awb") / 1000

					if var_318_9 + var_318_1 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_9 + var_318_1
					end

					if var_318_4.prefab_name ~= "" and arg_315_1.actors_[var_318_4.prefab_name] ~= nil then
						local var_318_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_4.prefab_name].transform, "story_v_out_120411", "120411078", "story_v_out_120411.awb")

						arg_315_1:RecordAudio("120411078", var_318_10)
						arg_315_1:RecordAudio("120411078", var_318_10)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_120411", "120411078", "story_v_out_120411.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_120411", "120411078", "story_v_out_120411.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_11 = math.max(var_318_2, arg_315_1.talkMaxDuration)

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_11 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_1) / var_318_11

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_1 + var_318_11 and arg_315_1.time_ < var_318_1 + var_318_11 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play120411079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 120411079
		arg_319_1.duration_ = 5.133

		local var_319_0 = {
			zh = 4.033,
			ja = 5.133
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
				arg_319_0:Play120411080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1069ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1069ui_story == nil then
				arg_319_1.var_.characterEffect1069ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.2

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1069ui_story then
					local var_322_4 = Mathf.Lerp(0, 0.5, var_322_3)

					arg_319_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1069ui_story.fillRatio = var_322_4
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1069ui_story then
				local var_322_5 = 0.5

				arg_319_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1069ui_story.fillRatio = var_322_5
			end

			local var_322_6 = arg_319_1.actors_["1071ui_story"]
			local var_322_7 = 0

			if var_322_7 < arg_319_1.time_ and arg_319_1.time_ <= var_322_7 + arg_322_0 and arg_319_1.var_.characterEffect1071ui_story == nil then
				arg_319_1.var_.characterEffect1071ui_story = var_322_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_8 = 0.2

			if var_322_7 <= arg_319_1.time_ and arg_319_1.time_ < var_322_7 + var_322_8 then
				local var_322_9 = (arg_319_1.time_ - var_322_7) / var_322_8

				if arg_319_1.var_.characterEffect1071ui_story then
					arg_319_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_7 + var_322_8 and arg_319_1.time_ < var_322_7 + var_322_8 + arg_322_0 and arg_319_1.var_.characterEffect1071ui_story then
				arg_319_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_322_10 = 0
			local var_322_11 = 0.55

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_12 = arg_319_1:FormatText(StoryNameCfg[384].name)

				arg_319_1.leftNameTxt_.text = var_322_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_13 = arg_319_1:GetWordFromCfg(120411079)
				local var_322_14 = arg_319_1:FormatText(var_322_13.content)

				arg_319_1.text_.text = var_322_14

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_15 = 22
				local var_322_16 = utf8.len(var_322_14)
				local var_322_17 = var_322_15 <= 0 and var_322_11 or var_322_11 * (var_322_16 / var_322_15)

				if var_322_17 > 0 and var_322_11 < var_322_17 then
					arg_319_1.talkMaxDuration = var_322_17

					if var_322_17 + var_322_10 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_17 + var_322_10
					end
				end

				arg_319_1.text_.text = var_322_14
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411079", "story_v_out_120411.awb") ~= 0 then
					local var_322_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411079", "story_v_out_120411.awb") / 1000

					if var_322_18 + var_322_10 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_18 + var_322_10
					end

					if var_322_13.prefab_name ~= "" and arg_319_1.actors_[var_322_13.prefab_name] ~= nil then
						local var_322_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_13.prefab_name].transform, "story_v_out_120411", "120411079", "story_v_out_120411.awb")

						arg_319_1:RecordAudio("120411079", var_322_19)
						arg_319_1:RecordAudio("120411079", var_322_19)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_120411", "120411079", "story_v_out_120411.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_120411", "120411079", "story_v_out_120411.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_20 = math.max(var_322_11, arg_319_1.talkMaxDuration)

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_20 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_10) / var_322_20

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_10 + var_322_20 and arg_319_1.time_ < var_322_10 + var_322_20 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play120411080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 120411080
		arg_323_1.duration_ = 4.1

		local var_323_0 = {
			zh = 3.366,
			ja = 4.1
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play120411081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1069ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1069ui_story == nil then
				arg_323_1.var_.characterEffect1069ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.2

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1069ui_story then
					arg_323_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1069ui_story then
				arg_323_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_326_4 = arg_323_1.actors_["1071ui_story"]
			local var_326_5 = 0

			if var_326_5 < arg_323_1.time_ and arg_323_1.time_ <= var_326_5 + arg_326_0 and arg_323_1.var_.characterEffect1071ui_story == nil then
				arg_323_1.var_.characterEffect1071ui_story = var_326_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_6 = 0.2

			if var_326_5 <= arg_323_1.time_ and arg_323_1.time_ < var_326_5 + var_326_6 then
				local var_326_7 = (arg_323_1.time_ - var_326_5) / var_326_6

				if arg_323_1.var_.characterEffect1071ui_story then
					local var_326_8 = Mathf.Lerp(0, 0.5, var_326_7)

					arg_323_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1071ui_story.fillRatio = var_326_8
				end
			end

			if arg_323_1.time_ >= var_326_5 + var_326_6 and arg_323_1.time_ < var_326_5 + var_326_6 + arg_326_0 and arg_323_1.var_.characterEffect1071ui_story then
				local var_326_9 = 0.5

				arg_323_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1071ui_story.fillRatio = var_326_9
			end

			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 then
				arg_323_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_2")
			end

			local var_326_11 = 0
			local var_326_12 = 0.425

			if var_326_11 < arg_323_1.time_ and arg_323_1.time_ <= var_326_11 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_13 = arg_323_1:FormatText(StoryNameCfg[378].name)

				arg_323_1.leftNameTxt_.text = var_326_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_14 = arg_323_1:GetWordFromCfg(120411080)
				local var_326_15 = arg_323_1:FormatText(var_326_14.content)

				arg_323_1.text_.text = var_326_15

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_16 = 17
				local var_326_17 = utf8.len(var_326_15)
				local var_326_18 = var_326_16 <= 0 and var_326_12 or var_326_12 * (var_326_17 / var_326_16)

				if var_326_18 > 0 and var_326_12 < var_326_18 then
					arg_323_1.talkMaxDuration = var_326_18

					if var_326_18 + var_326_11 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_18 + var_326_11
					end
				end

				arg_323_1.text_.text = var_326_15
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411080", "story_v_out_120411.awb") ~= 0 then
					local var_326_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411080", "story_v_out_120411.awb") / 1000

					if var_326_19 + var_326_11 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_19 + var_326_11
					end

					if var_326_14.prefab_name ~= "" and arg_323_1.actors_[var_326_14.prefab_name] ~= nil then
						local var_326_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_14.prefab_name].transform, "story_v_out_120411", "120411080", "story_v_out_120411.awb")

						arg_323_1:RecordAudio("120411080", var_326_20)
						arg_323_1:RecordAudio("120411080", var_326_20)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_120411", "120411080", "story_v_out_120411.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_120411", "120411080", "story_v_out_120411.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_21 = math.max(var_326_12, arg_323_1.talkMaxDuration)

			if var_326_11 <= arg_323_1.time_ and arg_323_1.time_ < var_326_11 + var_326_21 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_11) / var_326_21

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_11 + var_326_21 and arg_323_1.time_ < var_326_11 + var_326_21 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play120411081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 120411081
		arg_327_1.duration_ = 3.333

		local var_327_0 = {
			zh = 2.7,
			ja = 3.333
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play120411082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.3

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[378].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(120411081)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 12
				local var_330_6 = utf8.len(var_330_4)
				local var_330_7 = var_330_5 <= 0 and var_330_1 or var_330_1 * (var_330_6 / var_330_5)

				if var_330_7 > 0 and var_330_1 < var_330_7 then
					arg_327_1.talkMaxDuration = var_330_7

					if var_330_7 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_7 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_4
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411081", "story_v_out_120411.awb") ~= 0 then
					local var_330_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411081", "story_v_out_120411.awb") / 1000

					if var_330_8 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_8 + var_330_0
					end

					if var_330_3.prefab_name ~= "" and arg_327_1.actors_[var_330_3.prefab_name] ~= nil then
						local var_330_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_3.prefab_name].transform, "story_v_out_120411", "120411081", "story_v_out_120411.awb")

						arg_327_1:RecordAudio("120411081", var_330_9)
						arg_327_1:RecordAudio("120411081", var_330_9)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_120411", "120411081", "story_v_out_120411.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_120411", "120411081", "story_v_out_120411.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_10 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_10 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_10

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_10 and arg_327_1.time_ < var_330_0 + var_330_10 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play120411082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 120411082
		arg_331_1.duration_ = 7.566

		local var_331_0 = {
			zh = 4.333,
			ja = 7.566
		}
		local var_331_1 = manager.audio:GetLocalizationFlag()

		if var_331_0[var_331_1] ~= nil then
			arg_331_1.duration_ = var_331_0[var_331_1]
		end

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play120411083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1069ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1069ui_story == nil then
				arg_331_1.var_.characterEffect1069ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1069ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1069ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1069ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1069ui_story.fillRatio = var_334_5
			end

			local var_334_6 = arg_331_1.actors_["1071ui_story"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story == nil then
				arg_331_1.var_.characterEffect1071ui_story = var_334_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_8 = 0.2

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.characterEffect1071ui_story then
					arg_331_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story then
				arg_331_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action423")
			end

			local var_334_11 = 0
			local var_334_12 = 0.525

			if var_334_11 < arg_331_1.time_ and arg_331_1.time_ <= var_334_11 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_13 = arg_331_1:FormatText(StoryNameCfg[384].name)

				arg_331_1.leftNameTxt_.text = var_334_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_14 = arg_331_1:GetWordFromCfg(120411082)
				local var_334_15 = arg_331_1:FormatText(var_334_14.content)

				arg_331_1.text_.text = var_334_15

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_16 = 21
				local var_334_17 = utf8.len(var_334_15)
				local var_334_18 = var_334_16 <= 0 and var_334_12 or var_334_12 * (var_334_17 / var_334_16)

				if var_334_18 > 0 and var_334_12 < var_334_18 then
					arg_331_1.talkMaxDuration = var_334_18

					if var_334_18 + var_334_11 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_18 + var_334_11
					end
				end

				arg_331_1.text_.text = var_334_15
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411082", "story_v_out_120411.awb") ~= 0 then
					local var_334_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411082", "story_v_out_120411.awb") / 1000

					if var_334_19 + var_334_11 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_19 + var_334_11
					end

					if var_334_14.prefab_name ~= "" and arg_331_1.actors_[var_334_14.prefab_name] ~= nil then
						local var_334_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_14.prefab_name].transform, "story_v_out_120411", "120411082", "story_v_out_120411.awb")

						arg_331_1:RecordAudio("120411082", var_334_20)
						arg_331_1:RecordAudio("120411082", var_334_20)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_120411", "120411082", "story_v_out_120411.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_120411", "120411082", "story_v_out_120411.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_21 = math.max(var_334_12, arg_331_1.talkMaxDuration)

			if var_334_11 <= arg_331_1.time_ and arg_331_1.time_ < var_334_11 + var_334_21 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_11) / var_334_21

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_11 + var_334_21 and arg_331_1.time_ < var_334_11 + var_334_21 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play120411083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 120411083
		arg_335_1.duration_ = 7.6

		local var_335_0 = {
			zh = 7.6,
			ja = 7.533
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
				arg_335_0:Play120411084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.85

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[384].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(120411083)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 34
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411083", "story_v_out_120411.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411083", "story_v_out_120411.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_120411", "120411083", "story_v_out_120411.awb")

						arg_335_1:RecordAudio("120411083", var_338_9)
						arg_335_1:RecordAudio("120411083", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_120411", "120411083", "story_v_out_120411.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_120411", "120411083", "story_v_out_120411.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play120411084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 120411084
		arg_339_1.duration_ = 7.133

		local var_339_0 = {
			zh = 5.166,
			ja = 7.133
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
				arg_339_0:Play120411085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1071ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect1071ui_story == nil then
				arg_339_1.var_.characterEffect1071ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.2

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect1071ui_story then
					local var_342_4 = Mathf.Lerp(0, 0.5, var_342_3)

					arg_339_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1071ui_story.fillRatio = var_342_4
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect1071ui_story then
				local var_342_5 = 0.5

				arg_339_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1071ui_story.fillRatio = var_342_5
			end

			local var_342_6 = arg_339_1.actors_["1069ui_story"]
			local var_342_7 = 0

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 and arg_339_1.var_.characterEffect1069ui_story == nil then
				arg_339_1.var_.characterEffect1069ui_story = var_342_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_8 = 0.2

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_8 then
				local var_342_9 = (arg_339_1.time_ - var_342_7) / var_342_8

				if arg_339_1.var_.characterEffect1069ui_story then
					arg_339_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_7 + var_342_8 and arg_339_1.time_ < var_342_7 + var_342_8 + arg_342_0 and arg_339_1.var_.characterEffect1069ui_story then
				arg_339_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_342_10 = 0
			local var_342_11 = 0.475

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_12 = arg_339_1:FormatText(StoryNameCfg[378].name)

				arg_339_1.leftNameTxt_.text = var_342_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_13 = arg_339_1:GetWordFromCfg(120411084)
				local var_342_14 = arg_339_1:FormatText(var_342_13.content)

				arg_339_1.text_.text = var_342_14

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_15 = 19
				local var_342_16 = utf8.len(var_342_14)
				local var_342_17 = var_342_15 <= 0 and var_342_11 or var_342_11 * (var_342_16 / var_342_15)

				if var_342_17 > 0 and var_342_11 < var_342_17 then
					arg_339_1.talkMaxDuration = var_342_17

					if var_342_17 + var_342_10 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_17 + var_342_10
					end
				end

				arg_339_1.text_.text = var_342_14
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411084", "story_v_out_120411.awb") ~= 0 then
					local var_342_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411084", "story_v_out_120411.awb") / 1000

					if var_342_18 + var_342_10 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_18 + var_342_10
					end

					if var_342_13.prefab_name ~= "" and arg_339_1.actors_[var_342_13.prefab_name] ~= nil then
						local var_342_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_13.prefab_name].transform, "story_v_out_120411", "120411084", "story_v_out_120411.awb")

						arg_339_1:RecordAudio("120411084", var_342_19)
						arg_339_1:RecordAudio("120411084", var_342_19)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_120411", "120411084", "story_v_out_120411.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_120411", "120411084", "story_v_out_120411.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_20 = math.max(var_342_11, arg_339_1.talkMaxDuration)

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_20 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_10) / var_342_20

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_10 + var_342_20 and arg_339_1.time_ < var_342_10 + var_342_20 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play120411085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 120411085
		arg_343_1.duration_ = 9.166

		local var_343_0 = {
			zh = 6.966,
			ja = 9.166
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
				arg_343_0:Play120411086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1071ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1071ui_story == nil then
				arg_343_1.var_.characterEffect1071ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.2

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1071ui_story then
					arg_343_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1071ui_story then
				arg_343_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_346_4 = 0

			if var_346_4 < arg_343_1.time_ and arg_343_1.time_ <= var_346_4 + arg_346_0 then
				arg_343_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_2")
			end

			local var_346_5 = arg_343_1.actors_["1069ui_story"]
			local var_346_6 = 0

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 and arg_343_1.var_.characterEffect1069ui_story == nil then
				arg_343_1.var_.characterEffect1069ui_story = var_346_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_7 = 0.2

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_7 then
				local var_346_8 = (arg_343_1.time_ - var_346_6) / var_346_7

				if arg_343_1.var_.characterEffect1069ui_story then
					local var_346_9 = Mathf.Lerp(0, 0.5, var_346_8)

					arg_343_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1069ui_story.fillRatio = var_346_9
				end
			end

			if arg_343_1.time_ >= var_346_6 + var_346_7 and arg_343_1.time_ < var_346_6 + var_346_7 + arg_346_0 and arg_343_1.var_.characterEffect1069ui_story then
				local var_346_10 = 0.5

				arg_343_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1069ui_story.fillRatio = var_346_10
			end

			local var_346_11 = 0
			local var_346_12 = 0.7

			if var_346_11 < arg_343_1.time_ and arg_343_1.time_ <= var_346_11 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_13 = arg_343_1:FormatText(StoryNameCfg[384].name)

				arg_343_1.leftNameTxt_.text = var_346_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_14 = arg_343_1:GetWordFromCfg(120411085)
				local var_346_15 = arg_343_1:FormatText(var_346_14.content)

				arg_343_1.text_.text = var_346_15

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_16 = 28
				local var_346_17 = utf8.len(var_346_15)
				local var_346_18 = var_346_16 <= 0 and var_346_12 or var_346_12 * (var_346_17 / var_346_16)

				if var_346_18 > 0 and var_346_12 < var_346_18 then
					arg_343_1.talkMaxDuration = var_346_18

					if var_346_18 + var_346_11 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_18 + var_346_11
					end
				end

				arg_343_1.text_.text = var_346_15
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411085", "story_v_out_120411.awb") ~= 0 then
					local var_346_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411085", "story_v_out_120411.awb") / 1000

					if var_346_19 + var_346_11 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_19 + var_346_11
					end

					if var_346_14.prefab_name ~= "" and arg_343_1.actors_[var_346_14.prefab_name] ~= nil then
						local var_346_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_14.prefab_name].transform, "story_v_out_120411", "120411085", "story_v_out_120411.awb")

						arg_343_1:RecordAudio("120411085", var_346_20)
						arg_343_1:RecordAudio("120411085", var_346_20)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_120411", "120411085", "story_v_out_120411.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_120411", "120411085", "story_v_out_120411.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_21 = math.max(var_346_12, arg_343_1.talkMaxDuration)

			if var_346_11 <= arg_343_1.time_ and arg_343_1.time_ < var_346_11 + var_346_21 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_11) / var_346_21

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_11 + var_346_21 and arg_343_1.time_ < var_346_11 + var_346_21 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play120411086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 120411086
		arg_347_1.duration_ = 7

		local var_347_0 = {
			zh = 2.866,
			ja = 7
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
				arg_347_0:Play120411087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1071ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1071ui_story == nil then
				arg_347_1.var_.characterEffect1071ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.2

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1071ui_story then
					local var_350_4 = Mathf.Lerp(0, 0.5, var_350_3)

					arg_347_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1071ui_story.fillRatio = var_350_4
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1071ui_story then
				local var_350_5 = 0.5

				arg_347_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1071ui_story.fillRatio = var_350_5
			end

			local var_350_6 = arg_347_1.actors_["1069ui_story"]
			local var_350_7 = 0

			if var_350_7 < arg_347_1.time_ and arg_347_1.time_ <= var_350_7 + arg_350_0 and arg_347_1.var_.characterEffect1069ui_story == nil then
				arg_347_1.var_.characterEffect1069ui_story = var_350_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_8 = 0.2

			if var_350_7 <= arg_347_1.time_ and arg_347_1.time_ < var_350_7 + var_350_8 then
				local var_350_9 = (arg_347_1.time_ - var_350_7) / var_350_8

				if arg_347_1.var_.characterEffect1069ui_story then
					arg_347_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_7 + var_350_8 and arg_347_1.time_ < var_350_7 + var_350_8 + arg_350_0 and arg_347_1.var_.characterEffect1069ui_story then
				arg_347_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 then
				arg_347_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_350_11 = 0
			local var_350_12 = 0.25

			if var_350_11 < arg_347_1.time_ and arg_347_1.time_ <= var_350_11 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_13 = arg_347_1:FormatText(StoryNameCfg[378].name)

				arg_347_1.leftNameTxt_.text = var_350_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_14 = arg_347_1:GetWordFromCfg(120411086)
				local var_350_15 = arg_347_1:FormatText(var_350_14.content)

				arg_347_1.text_.text = var_350_15

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_16 = 10
				local var_350_17 = utf8.len(var_350_15)
				local var_350_18 = var_350_16 <= 0 and var_350_12 or var_350_12 * (var_350_17 / var_350_16)

				if var_350_18 > 0 and var_350_12 < var_350_18 then
					arg_347_1.talkMaxDuration = var_350_18

					if var_350_18 + var_350_11 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_18 + var_350_11
					end
				end

				arg_347_1.text_.text = var_350_15
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411086", "story_v_out_120411.awb") ~= 0 then
					local var_350_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411086", "story_v_out_120411.awb") / 1000

					if var_350_19 + var_350_11 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_19 + var_350_11
					end

					if var_350_14.prefab_name ~= "" and arg_347_1.actors_[var_350_14.prefab_name] ~= nil then
						local var_350_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_14.prefab_name].transform, "story_v_out_120411", "120411086", "story_v_out_120411.awb")

						arg_347_1:RecordAudio("120411086", var_350_20)
						arg_347_1:RecordAudio("120411086", var_350_20)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_120411", "120411086", "story_v_out_120411.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_120411", "120411086", "story_v_out_120411.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_21 = math.max(var_350_12, arg_347_1.talkMaxDuration)

			if var_350_11 <= arg_347_1.time_ and arg_347_1.time_ < var_350_11 + var_350_21 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_11) / var_350_21

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_11 + var_350_21 and arg_347_1.time_ < var_350_11 + var_350_21 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play120411087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 120411087
		arg_351_1.duration_ = 5.566

		local var_351_0 = {
			zh = 5.566,
			ja = 5.433
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
				arg_351_0:Play120411088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1069ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect1069ui_story == nil then
				arg_351_1.var_.characterEffect1069ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.2

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect1069ui_story then
					local var_354_4 = Mathf.Lerp(0, 0.5, var_354_3)

					arg_351_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1069ui_story.fillRatio = var_354_4
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect1069ui_story then
				local var_354_5 = 0.5

				arg_351_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1069ui_story.fillRatio = var_354_5
			end

			local var_354_6 = arg_351_1.actors_["1071ui_story"]
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 and arg_351_1.var_.characterEffect1071ui_story == nil then
				arg_351_1.var_.characterEffect1071ui_story = var_354_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_8 = 0.2

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8

				if arg_351_1.var_.characterEffect1071ui_story then
					arg_351_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 and arg_351_1.var_.characterEffect1071ui_story then
				arg_351_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_354_10 = 0
			local var_354_11 = 0.575

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_12 = arg_351_1:FormatText(StoryNameCfg[384].name)

				arg_351_1.leftNameTxt_.text = var_354_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_13 = arg_351_1:GetWordFromCfg(120411087)
				local var_354_14 = arg_351_1:FormatText(var_354_13.content)

				arg_351_1.text_.text = var_354_14

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_15 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411087", "story_v_out_120411.awb") ~= 0 then
					local var_354_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411087", "story_v_out_120411.awb") / 1000

					if var_354_18 + var_354_10 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_18 + var_354_10
					end

					if var_354_13.prefab_name ~= "" and arg_351_1.actors_[var_354_13.prefab_name] ~= nil then
						local var_354_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_13.prefab_name].transform, "story_v_out_120411", "120411087", "story_v_out_120411.awb")

						arg_351_1:RecordAudio("120411087", var_354_19)
						arg_351_1:RecordAudio("120411087", var_354_19)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_120411", "120411087", "story_v_out_120411.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_120411", "120411087", "story_v_out_120411.awb")
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
	Play120411088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 120411088
		arg_355_1.duration_ = 7.6

		local var_355_0 = {
			zh = 6,
			ja = 7.6
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play120411089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0
			local var_358_1 = 0.85

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_2 = arg_355_1:FormatText(StoryNameCfg[384].name)

				arg_355_1.leftNameTxt_.text = var_358_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_3 = arg_355_1:GetWordFromCfg(120411088)
				local var_358_4 = arg_355_1:FormatText(var_358_3.content)

				arg_355_1.text_.text = var_358_4

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411088", "story_v_out_120411.awb") ~= 0 then
					local var_358_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411088", "story_v_out_120411.awb") / 1000

					if var_358_8 + var_358_0 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_8 + var_358_0
					end

					if var_358_3.prefab_name ~= "" and arg_355_1.actors_[var_358_3.prefab_name] ~= nil then
						local var_358_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_3.prefab_name].transform, "story_v_out_120411", "120411088", "story_v_out_120411.awb")

						arg_355_1:RecordAudio("120411088", var_358_9)
						arg_355_1:RecordAudio("120411088", var_358_9)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_120411", "120411088", "story_v_out_120411.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_120411", "120411088", "story_v_out_120411.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_10 = math.max(var_358_1, arg_355_1.talkMaxDuration)

			if var_358_0 <= arg_355_1.time_ and arg_355_1.time_ < var_358_0 + var_358_10 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_0) / var_358_10

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_0 + var_358_10 and arg_355_1.time_ < var_358_0 + var_358_10 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play120411089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 120411089
		arg_359_1.duration_ = 4.933

		local var_359_0 = {
			zh = 4.933,
			ja = 4.533
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
				arg_359_0:Play120411090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1071ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1071ui_story == nil then
				arg_359_1.var_.characterEffect1071ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.2

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1071ui_story then
					local var_362_4 = Mathf.Lerp(0, 0.5, var_362_3)

					arg_359_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1071ui_story.fillRatio = var_362_4
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1071ui_story then
				local var_362_5 = 0.5

				arg_359_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1071ui_story.fillRatio = var_362_5
			end

			local var_362_6 = arg_359_1.actors_["1069ui_story"]
			local var_362_7 = 0

			if var_362_7 < arg_359_1.time_ and arg_359_1.time_ <= var_362_7 + arg_362_0 and arg_359_1.var_.characterEffect1069ui_story == nil then
				arg_359_1.var_.characterEffect1069ui_story = var_362_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_8 = 0.2

			if var_362_7 <= arg_359_1.time_ and arg_359_1.time_ < var_362_7 + var_362_8 then
				local var_362_9 = (arg_359_1.time_ - var_362_7) / var_362_8

				if arg_359_1.var_.characterEffect1069ui_story then
					arg_359_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_7 + var_362_8 and arg_359_1.time_ < var_362_7 + var_362_8 + arg_362_0 and arg_359_1.var_.characterEffect1069ui_story then
				arg_359_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 then
				arg_359_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_362_11 = 0
			local var_362_12 = 0.65

			if var_362_11 < arg_359_1.time_ and arg_359_1.time_ <= var_362_11 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_13 = arg_359_1:FormatText(StoryNameCfg[378].name)

				arg_359_1.leftNameTxt_.text = var_362_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_14 = arg_359_1:GetWordFromCfg(120411089)
				local var_362_15 = arg_359_1:FormatText(var_362_14.content)

				arg_359_1.text_.text = var_362_15

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_16 = 26
				local var_362_17 = utf8.len(var_362_15)
				local var_362_18 = var_362_16 <= 0 and var_362_12 or var_362_12 * (var_362_17 / var_362_16)

				if var_362_18 > 0 and var_362_12 < var_362_18 then
					arg_359_1.talkMaxDuration = var_362_18

					if var_362_18 + var_362_11 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_18 + var_362_11
					end
				end

				arg_359_1.text_.text = var_362_15
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411089", "story_v_out_120411.awb") ~= 0 then
					local var_362_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411089", "story_v_out_120411.awb") / 1000

					if var_362_19 + var_362_11 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_19 + var_362_11
					end

					if var_362_14.prefab_name ~= "" and arg_359_1.actors_[var_362_14.prefab_name] ~= nil then
						local var_362_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_14.prefab_name].transform, "story_v_out_120411", "120411089", "story_v_out_120411.awb")

						arg_359_1:RecordAudio("120411089", var_362_20)
						arg_359_1:RecordAudio("120411089", var_362_20)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_120411", "120411089", "story_v_out_120411.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_120411", "120411089", "story_v_out_120411.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_21 = math.max(var_362_12, arg_359_1.talkMaxDuration)

			if var_362_11 <= arg_359_1.time_ and arg_359_1.time_ < var_362_11 + var_362_21 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_11) / var_362_21

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_11 + var_362_21 and arg_359_1.time_ < var_362_11 + var_362_21 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play120411090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 120411090
		arg_363_1.duration_ = 11.933

		local var_363_0 = {
			zh = 7.5,
			ja = 11.933
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
				arg_363_0:Play120411091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1071ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1071ui_story == nil then
				arg_363_1.var_.characterEffect1071ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.2

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1071ui_story then
					arg_363_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1071ui_story then
				arg_363_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_366_4 = 0

			if var_366_4 < arg_363_1.time_ and arg_363_1.time_ <= var_366_4 + arg_366_0 then
				arg_363_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_1")
			end

			local var_366_5 = arg_363_1.actors_["1069ui_story"]
			local var_366_6 = 0

			if var_366_6 < arg_363_1.time_ and arg_363_1.time_ <= var_366_6 + arg_366_0 and arg_363_1.var_.characterEffect1069ui_story == nil then
				arg_363_1.var_.characterEffect1069ui_story = var_366_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_7 = 0.2

			if var_366_6 <= arg_363_1.time_ and arg_363_1.time_ < var_366_6 + var_366_7 then
				local var_366_8 = (arg_363_1.time_ - var_366_6) / var_366_7

				if arg_363_1.var_.characterEffect1069ui_story then
					local var_366_9 = Mathf.Lerp(0, 0.5, var_366_8)

					arg_363_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1069ui_story.fillRatio = var_366_9
				end
			end

			if arg_363_1.time_ >= var_366_6 + var_366_7 and arg_363_1.time_ < var_366_6 + var_366_7 + arg_366_0 and arg_363_1.var_.characterEffect1069ui_story then
				local var_366_10 = 0.5

				arg_363_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1069ui_story.fillRatio = var_366_10
			end

			local var_366_11 = 0
			local var_366_12 = 0.8

			if var_366_11 < arg_363_1.time_ and arg_363_1.time_ <= var_366_11 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_13 = arg_363_1:FormatText(StoryNameCfg[384].name)

				arg_363_1.leftNameTxt_.text = var_366_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_14 = arg_363_1:GetWordFromCfg(120411090)
				local var_366_15 = arg_363_1:FormatText(var_366_14.content)

				arg_363_1.text_.text = var_366_15

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_16 = 32
				local var_366_17 = utf8.len(var_366_15)
				local var_366_18 = var_366_16 <= 0 and var_366_12 or var_366_12 * (var_366_17 / var_366_16)

				if var_366_18 > 0 and var_366_12 < var_366_18 then
					arg_363_1.talkMaxDuration = var_366_18

					if var_366_18 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_11
					end
				end

				arg_363_1.text_.text = var_366_15
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411090", "story_v_out_120411.awb") ~= 0 then
					local var_366_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411090", "story_v_out_120411.awb") / 1000

					if var_366_19 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_19 + var_366_11
					end

					if var_366_14.prefab_name ~= "" and arg_363_1.actors_[var_366_14.prefab_name] ~= nil then
						local var_366_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_14.prefab_name].transform, "story_v_out_120411", "120411090", "story_v_out_120411.awb")

						arg_363_1:RecordAudio("120411090", var_366_20)
						arg_363_1:RecordAudio("120411090", var_366_20)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_120411", "120411090", "story_v_out_120411.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_120411", "120411090", "story_v_out_120411.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_21 = math.max(var_366_12, arg_363_1.talkMaxDuration)

			if var_366_11 <= arg_363_1.time_ and arg_363_1.time_ < var_366_11 + var_366_21 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_11) / var_366_21

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_11 + var_366_21 and arg_363_1.time_ < var_366_11 + var_366_21 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play120411091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 120411091
		arg_367_1.duration_ = 13.6

		local var_367_0 = {
			zh = 13.433,
			ja = 13.6
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
				arg_367_0:Play120411092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0
			local var_370_1 = 1.55

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_2 = arg_367_1:FormatText(StoryNameCfg[384].name)

				arg_367_1.leftNameTxt_.text = var_370_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_3 = arg_367_1:GetWordFromCfg(120411091)
				local var_370_4 = arg_367_1:FormatText(var_370_3.content)

				arg_367_1.text_.text = var_370_4

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_5 = 62
				local var_370_6 = utf8.len(var_370_4)
				local var_370_7 = var_370_5 <= 0 and var_370_1 or var_370_1 * (var_370_6 / var_370_5)

				if var_370_7 > 0 and var_370_1 < var_370_7 then
					arg_367_1.talkMaxDuration = var_370_7

					if var_370_7 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_7 + var_370_0
					end
				end

				arg_367_1.text_.text = var_370_4
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411091", "story_v_out_120411.awb") ~= 0 then
					local var_370_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411091", "story_v_out_120411.awb") / 1000

					if var_370_8 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_8 + var_370_0
					end

					if var_370_3.prefab_name ~= "" and arg_367_1.actors_[var_370_3.prefab_name] ~= nil then
						local var_370_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_3.prefab_name].transform, "story_v_out_120411", "120411091", "story_v_out_120411.awb")

						arg_367_1:RecordAudio("120411091", var_370_9)
						arg_367_1:RecordAudio("120411091", var_370_9)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_120411", "120411091", "story_v_out_120411.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_120411", "120411091", "story_v_out_120411.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_10 = math.max(var_370_1, arg_367_1.talkMaxDuration)

			if var_370_0 <= arg_367_1.time_ and arg_367_1.time_ < var_370_0 + var_370_10 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_0) / var_370_10

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_0 + var_370_10 and arg_367_1.time_ < var_370_0 + var_370_10 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play120411092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 120411092
		arg_371_1.duration_ = 4.933

		local var_371_0 = {
			zh = 3.833,
			ja = 4.933
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
				arg_371_0:Play120411093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1071ui_story"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.characterEffect1071ui_story == nil then
				arg_371_1.var_.characterEffect1071ui_story = var_374_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_2 = 0.2

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.characterEffect1071ui_story then
					local var_374_4 = Mathf.Lerp(0, 0.5, var_374_3)

					arg_371_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_371_1.var_.characterEffect1071ui_story.fillRatio = var_374_4
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.characterEffect1071ui_story then
				local var_374_5 = 0.5

				arg_371_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_371_1.var_.characterEffect1071ui_story.fillRatio = var_374_5
			end

			local var_374_6 = arg_371_1.actors_["1069ui_story"]
			local var_374_7 = 0

			if var_374_7 < arg_371_1.time_ and arg_371_1.time_ <= var_374_7 + arg_374_0 and arg_371_1.var_.characterEffect1069ui_story == nil then
				arg_371_1.var_.characterEffect1069ui_story = var_374_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_8 = 0.2

			if var_374_7 <= arg_371_1.time_ and arg_371_1.time_ < var_374_7 + var_374_8 then
				local var_374_9 = (arg_371_1.time_ - var_374_7) / var_374_8

				if arg_371_1.var_.characterEffect1069ui_story then
					arg_371_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_371_1.time_ >= var_374_7 + var_374_8 and arg_371_1.time_ < var_374_7 + var_374_8 + arg_374_0 and arg_371_1.var_.characterEffect1069ui_story then
				arg_371_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 then
				arg_371_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_374_11 = 0
			local var_374_12 = 0.375

			if var_374_11 < arg_371_1.time_ and arg_371_1.time_ <= var_374_11 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_13 = arg_371_1:FormatText(StoryNameCfg[378].name)

				arg_371_1.leftNameTxt_.text = var_374_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_14 = arg_371_1:GetWordFromCfg(120411092)
				local var_374_15 = arg_371_1:FormatText(var_374_14.content)

				arg_371_1.text_.text = var_374_15

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_16 = 15
				local var_374_17 = utf8.len(var_374_15)
				local var_374_18 = var_374_16 <= 0 and var_374_12 or var_374_12 * (var_374_17 / var_374_16)

				if var_374_18 > 0 and var_374_12 < var_374_18 then
					arg_371_1.talkMaxDuration = var_374_18

					if var_374_18 + var_374_11 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_18 + var_374_11
					end
				end

				arg_371_1.text_.text = var_374_15
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411092", "story_v_out_120411.awb") ~= 0 then
					local var_374_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411092", "story_v_out_120411.awb") / 1000

					if var_374_19 + var_374_11 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_19 + var_374_11
					end

					if var_374_14.prefab_name ~= "" and arg_371_1.actors_[var_374_14.prefab_name] ~= nil then
						local var_374_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_14.prefab_name].transform, "story_v_out_120411", "120411092", "story_v_out_120411.awb")

						arg_371_1:RecordAudio("120411092", var_374_20)
						arg_371_1:RecordAudio("120411092", var_374_20)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_120411", "120411092", "story_v_out_120411.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_120411", "120411092", "story_v_out_120411.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_21 = math.max(var_374_12, arg_371_1.talkMaxDuration)

			if var_374_11 <= arg_371_1.time_ and arg_371_1.time_ < var_374_11 + var_374_21 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_11) / var_374_21

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_11 + var_374_21 and arg_371_1.time_ < var_374_11 + var_374_21 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play120411093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 120411093
		arg_375_1.duration_ = 8.2

		local var_375_0 = {
			zh = 5.233,
			ja = 8.2
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
				arg_375_0:Play120411094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1071ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and arg_375_1.var_.characterEffect1071ui_story == nil then
				arg_375_1.var_.characterEffect1071ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.2

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect1071ui_story then
					arg_375_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and arg_375_1.var_.characterEffect1071ui_story then
				arg_375_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_378_4 = 0

			if var_378_4 < arg_375_1.time_ and arg_375_1.time_ <= var_378_4 + arg_378_0 then
				arg_375_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action463")
			end

			local var_378_5 = arg_375_1.actors_["1069ui_story"]
			local var_378_6 = 0

			if var_378_6 < arg_375_1.time_ and arg_375_1.time_ <= var_378_6 + arg_378_0 and arg_375_1.var_.characterEffect1069ui_story == nil then
				arg_375_1.var_.characterEffect1069ui_story = var_378_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_7 = 0.2

			if var_378_6 <= arg_375_1.time_ and arg_375_1.time_ < var_378_6 + var_378_7 then
				local var_378_8 = (arg_375_1.time_ - var_378_6) / var_378_7

				if arg_375_1.var_.characterEffect1069ui_story then
					local var_378_9 = Mathf.Lerp(0, 0.5, var_378_8)

					arg_375_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1069ui_story.fillRatio = var_378_9
				end
			end

			if arg_375_1.time_ >= var_378_6 + var_378_7 and arg_375_1.time_ < var_378_6 + var_378_7 + arg_378_0 and arg_375_1.var_.characterEffect1069ui_story then
				local var_378_10 = 0.5

				arg_375_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1069ui_story.fillRatio = var_378_10
			end

			local var_378_11 = 0
			local var_378_12 = 0.65

			if var_378_11 < arg_375_1.time_ and arg_375_1.time_ <= var_378_11 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_13 = arg_375_1:FormatText(StoryNameCfg[384].name)

				arg_375_1.leftNameTxt_.text = var_378_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_14 = arg_375_1:GetWordFromCfg(120411093)
				local var_378_15 = arg_375_1:FormatText(var_378_14.content)

				arg_375_1.text_.text = var_378_15

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_16 = 26
				local var_378_17 = utf8.len(var_378_15)
				local var_378_18 = var_378_16 <= 0 and var_378_12 or var_378_12 * (var_378_17 / var_378_16)

				if var_378_18 > 0 and var_378_12 < var_378_18 then
					arg_375_1.talkMaxDuration = var_378_18

					if var_378_18 + var_378_11 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_18 + var_378_11
					end
				end

				arg_375_1.text_.text = var_378_15
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411093", "story_v_out_120411.awb") ~= 0 then
					local var_378_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411093", "story_v_out_120411.awb") / 1000

					if var_378_19 + var_378_11 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_19 + var_378_11
					end

					if var_378_14.prefab_name ~= "" and arg_375_1.actors_[var_378_14.prefab_name] ~= nil then
						local var_378_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_14.prefab_name].transform, "story_v_out_120411", "120411093", "story_v_out_120411.awb")

						arg_375_1:RecordAudio("120411093", var_378_20)
						arg_375_1:RecordAudio("120411093", var_378_20)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_120411", "120411093", "story_v_out_120411.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_120411", "120411093", "story_v_out_120411.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_21 = math.max(var_378_12, arg_375_1.talkMaxDuration)

			if var_378_11 <= arg_375_1.time_ and arg_375_1.time_ < var_378_11 + var_378_21 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_11) / var_378_21

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_11 + var_378_21 and arg_375_1.time_ < var_378_11 + var_378_21 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play120411094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 120411094
		arg_379_1.duration_ = 4.533

		local var_379_0 = {
			zh = 4.533,
			ja = 3.966
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
				arg_379_0:Play120411095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0
			local var_382_1 = 0.55

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_2 = arg_379_1:FormatText(StoryNameCfg[384].name)

				arg_379_1.leftNameTxt_.text = var_382_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_3 = arg_379_1:GetWordFromCfg(120411094)
				local var_382_4 = arg_379_1:FormatText(var_382_3.content)

				arg_379_1.text_.text = var_382_4

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_5 = 22
				local var_382_6 = utf8.len(var_382_4)
				local var_382_7 = var_382_5 <= 0 and var_382_1 or var_382_1 * (var_382_6 / var_382_5)

				if var_382_7 > 0 and var_382_1 < var_382_7 then
					arg_379_1.talkMaxDuration = var_382_7

					if var_382_7 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_7 + var_382_0
					end
				end

				arg_379_1.text_.text = var_382_4
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411094", "story_v_out_120411.awb") ~= 0 then
					local var_382_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411094", "story_v_out_120411.awb") / 1000

					if var_382_8 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_8 + var_382_0
					end

					if var_382_3.prefab_name ~= "" and arg_379_1.actors_[var_382_3.prefab_name] ~= nil then
						local var_382_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_3.prefab_name].transform, "story_v_out_120411", "120411094", "story_v_out_120411.awb")

						arg_379_1:RecordAudio("120411094", var_382_9)
						arg_379_1:RecordAudio("120411094", var_382_9)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_120411", "120411094", "story_v_out_120411.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_120411", "120411094", "story_v_out_120411.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_10 = math.max(var_382_1, arg_379_1.talkMaxDuration)

			if var_382_0 <= arg_379_1.time_ and arg_379_1.time_ < var_382_0 + var_382_10 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_0) / var_382_10

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_0 + var_382_10 and arg_379_1.time_ < var_382_0 + var_382_10 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play120411095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 120411095
		arg_383_1.duration_ = 10.3

		local var_383_0 = {
			zh = 8.8,
			ja = 10.3
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
				arg_383_0:Play120411096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1071ui_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and arg_383_1.var_.characterEffect1071ui_story == nil then
				arg_383_1.var_.characterEffect1071ui_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.2

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect1071ui_story then
					local var_386_4 = Mathf.Lerp(0, 0.5, var_386_3)

					arg_383_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_383_1.var_.characterEffect1071ui_story.fillRatio = var_386_4
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and arg_383_1.var_.characterEffect1071ui_story then
				local var_386_5 = 0.5

				arg_383_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_383_1.var_.characterEffect1071ui_story.fillRatio = var_386_5
			end

			local var_386_6 = arg_383_1.actors_["1069ui_story"]
			local var_386_7 = 0

			if var_386_7 < arg_383_1.time_ and arg_383_1.time_ <= var_386_7 + arg_386_0 and arg_383_1.var_.characterEffect1069ui_story == nil then
				arg_383_1.var_.characterEffect1069ui_story = var_386_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_8 = 0.2

			if var_386_7 <= arg_383_1.time_ and arg_383_1.time_ < var_386_7 + var_386_8 then
				local var_386_9 = (arg_383_1.time_ - var_386_7) / var_386_8

				if arg_383_1.var_.characterEffect1069ui_story then
					arg_383_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_383_1.time_ >= var_386_7 + var_386_8 and arg_383_1.time_ < var_386_7 + var_386_8 + arg_386_0 and arg_383_1.var_.characterEffect1069ui_story then
				arg_383_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_386_10 = 0

			if var_386_10 < arg_383_1.time_ and arg_383_1.time_ <= var_386_10 + arg_386_0 then
				arg_383_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_2")
			end

			local var_386_11 = 0
			local var_386_12 = 0.825

			if var_386_11 < arg_383_1.time_ and arg_383_1.time_ <= var_386_11 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_13 = arg_383_1:FormatText(StoryNameCfg[378].name)

				arg_383_1.leftNameTxt_.text = var_386_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_14 = arg_383_1:GetWordFromCfg(120411095)
				local var_386_15 = arg_383_1:FormatText(var_386_14.content)

				arg_383_1.text_.text = var_386_15

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_16 = 33
				local var_386_17 = utf8.len(var_386_15)
				local var_386_18 = var_386_16 <= 0 and var_386_12 or var_386_12 * (var_386_17 / var_386_16)

				if var_386_18 > 0 and var_386_12 < var_386_18 then
					arg_383_1.talkMaxDuration = var_386_18

					if var_386_18 + var_386_11 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_18 + var_386_11
					end
				end

				arg_383_1.text_.text = var_386_15
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411095", "story_v_out_120411.awb") ~= 0 then
					local var_386_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411095", "story_v_out_120411.awb") / 1000

					if var_386_19 + var_386_11 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_19 + var_386_11
					end

					if var_386_14.prefab_name ~= "" and arg_383_1.actors_[var_386_14.prefab_name] ~= nil then
						local var_386_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_14.prefab_name].transform, "story_v_out_120411", "120411095", "story_v_out_120411.awb")

						arg_383_1:RecordAudio("120411095", var_386_20)
						arg_383_1:RecordAudio("120411095", var_386_20)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_120411", "120411095", "story_v_out_120411.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_120411", "120411095", "story_v_out_120411.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_21 = math.max(var_386_12, arg_383_1.talkMaxDuration)

			if var_386_11 <= arg_383_1.time_ and arg_383_1.time_ < var_386_11 + var_386_21 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_11) / var_386_21

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_11 + var_386_21 and arg_383_1.time_ < var_386_11 + var_386_21 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play120411096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 120411096
		arg_387_1.duration_ = 6.6

		local var_387_0 = {
			zh = 4.3,
			ja = 6.6
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
				arg_387_0:Play120411097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.6

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[378].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(120411096)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 24
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411096", "story_v_out_120411.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411096", "story_v_out_120411.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_120411", "120411096", "story_v_out_120411.awb")

						arg_387_1:RecordAudio("120411096", var_390_9)
						arg_387_1:RecordAudio("120411096", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_120411", "120411096", "story_v_out_120411.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_120411", "120411096", "story_v_out_120411.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play120411097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 120411097
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play120411098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1069ui_story"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1069ui_story = var_394_0.localPosition
			end

			local var_394_2 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2
				local var_394_4 = Vector3.New(0, 100, 0)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1069ui_story, var_394_4, var_394_3)

				local var_394_5 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_5.x, var_394_5.y, var_394_5.z)

				local var_394_6 = var_394_0.localEulerAngles

				var_394_6.z = 0
				var_394_6.x = 0
				var_394_0.localEulerAngles = var_394_6
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, 100, 0)

				local var_394_7 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_7.x, var_394_7.y, var_394_7.z)

				local var_394_8 = var_394_0.localEulerAngles

				var_394_8.z = 0
				var_394_8.x = 0
				var_394_0.localEulerAngles = var_394_8
			end

			local var_394_9 = arg_391_1.actors_["1071ui_story"].transform
			local var_394_10 = 0

			if var_394_10 < arg_391_1.time_ and arg_391_1.time_ <= var_394_10 + arg_394_0 then
				arg_391_1.var_.moveOldPos1071ui_story = var_394_9.localPosition
			end

			local var_394_11 = 0.001

			if var_394_10 <= arg_391_1.time_ and arg_391_1.time_ < var_394_10 + var_394_11 then
				local var_394_12 = (arg_391_1.time_ - var_394_10) / var_394_11
				local var_394_13 = Vector3.New(0, 100, 0)

				var_394_9.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1071ui_story, var_394_13, var_394_12)

				local var_394_14 = manager.ui.mainCamera.transform.position - var_394_9.position

				var_394_9.forward = Vector3.New(var_394_14.x, var_394_14.y, var_394_14.z)

				local var_394_15 = var_394_9.localEulerAngles

				var_394_15.z = 0
				var_394_15.x = 0
				var_394_9.localEulerAngles = var_394_15
			end

			if arg_391_1.time_ >= var_394_10 + var_394_11 and arg_391_1.time_ < var_394_10 + var_394_11 + arg_394_0 then
				var_394_9.localPosition = Vector3.New(0, 100, 0)

				local var_394_16 = manager.ui.mainCamera.transform.position - var_394_9.position

				var_394_9.forward = Vector3.New(var_394_16.x, var_394_16.y, var_394_16.z)

				local var_394_17 = var_394_9.localEulerAngles

				var_394_17.z = 0
				var_394_17.x = 0
				var_394_9.localEulerAngles = var_394_17
			end

			local var_394_18 = 0
			local var_394_19 = 0.825

			if var_394_18 < arg_391_1.time_ and arg_391_1.time_ <= var_394_18 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_20 = arg_391_1:GetWordFromCfg(120411097)
				local var_394_21 = arg_391_1:FormatText(var_394_20.content)

				arg_391_1.text_.text = var_394_21

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_22 = 33
				local var_394_23 = utf8.len(var_394_21)
				local var_394_24 = var_394_22 <= 0 and var_394_19 or var_394_19 * (var_394_23 / var_394_22)

				if var_394_24 > 0 and var_394_19 < var_394_24 then
					arg_391_1.talkMaxDuration = var_394_24

					if var_394_24 + var_394_18 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_24 + var_394_18
					end
				end

				arg_391_1.text_.text = var_394_21
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_25 = math.max(var_394_19, arg_391_1.talkMaxDuration)

			if var_394_18 <= arg_391_1.time_ and arg_391_1.time_ < var_394_18 + var_394_25 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_18) / var_394_25

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_18 + var_394_25 and arg_391_1.time_ < var_394_18 + var_394_25 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play120411098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 120411098
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play120411099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 0
			local var_398_1 = 1.25

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, false)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_2 = arg_395_1:GetWordFromCfg(120411098)
				local var_398_3 = arg_395_1:FormatText(var_398_2.content)

				arg_395_1.text_.text = var_398_3

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_4 = 50
				local var_398_5 = utf8.len(var_398_3)
				local var_398_6 = var_398_4 <= 0 and var_398_1 or var_398_1 * (var_398_5 / var_398_4)

				if var_398_6 > 0 and var_398_1 < var_398_6 then
					arg_395_1.talkMaxDuration = var_398_6

					if var_398_6 + var_398_0 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_6 + var_398_0
					end
				end

				arg_395_1.text_.text = var_398_3
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_7 = math.max(var_398_1, arg_395_1.talkMaxDuration)

			if var_398_0 <= arg_395_1.time_ and arg_395_1.time_ < var_398_0 + var_398_7 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_0) / var_398_7

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_0 + var_398_7 and arg_395_1.time_ < var_398_0 + var_398_7 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play120411099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 120411099
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play120411100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 0.775

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_2 = arg_399_1:GetWordFromCfg(120411099)
				local var_402_3 = arg_399_1:FormatText(var_402_2.content)

				arg_399_1.text_.text = var_402_3

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_4 = 31
				local var_402_5 = utf8.len(var_402_3)
				local var_402_6 = var_402_4 <= 0 and var_402_1 or var_402_1 * (var_402_5 / var_402_4)

				if var_402_6 > 0 and var_402_1 < var_402_6 then
					arg_399_1.talkMaxDuration = var_402_6

					if var_402_6 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_6 + var_402_0
					end
				end

				arg_399_1.text_.text = var_402_3
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_7 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_7 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_7

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_7 and arg_399_1.time_ < var_402_0 + var_402_7 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play120411100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 120411100
		arg_403_1.duration_ = 9.433

		local var_403_0 = {
			zh = 8.3,
			ja = 9.433
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
				arg_403_0:Play120411101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1069ui_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos1069ui_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(-0.7, -1, -6)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1069ui_story, var_406_4, var_406_3)

				local var_406_5 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_5.x, var_406_5.y, var_406_5.z)

				local var_406_6 = var_406_0.localEulerAngles

				var_406_6.z = 0
				var_406_6.x = 0
				var_406_0.localEulerAngles = var_406_6
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(-0.7, -1, -6)

				local var_406_7 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_7.x, var_406_7.y, var_406_7.z)

				local var_406_8 = var_406_0.localEulerAngles

				var_406_8.z = 0
				var_406_8.x = 0
				var_406_0.localEulerAngles = var_406_8
			end

			local var_406_9 = arg_403_1.actors_["1071ui_story"].transform
			local var_406_10 = 0

			if var_406_10 < arg_403_1.time_ and arg_403_1.time_ <= var_406_10 + arg_406_0 then
				arg_403_1.var_.moveOldPos1071ui_story = var_406_9.localPosition
			end

			local var_406_11 = 0.001

			if var_406_10 <= arg_403_1.time_ and arg_403_1.time_ < var_406_10 + var_406_11 then
				local var_406_12 = (arg_403_1.time_ - var_406_10) / var_406_11
				local var_406_13 = Vector3.New(0.7, -1.05, -6.2)

				var_406_9.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1071ui_story, var_406_13, var_406_12)

				local var_406_14 = manager.ui.mainCamera.transform.position - var_406_9.position

				var_406_9.forward = Vector3.New(var_406_14.x, var_406_14.y, var_406_14.z)

				local var_406_15 = var_406_9.localEulerAngles

				var_406_15.z = 0
				var_406_15.x = 0
				var_406_9.localEulerAngles = var_406_15
			end

			if arg_403_1.time_ >= var_406_10 + var_406_11 and arg_403_1.time_ < var_406_10 + var_406_11 + arg_406_0 then
				var_406_9.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_406_16 = manager.ui.mainCamera.transform.position - var_406_9.position

				var_406_9.forward = Vector3.New(var_406_16.x, var_406_16.y, var_406_16.z)

				local var_406_17 = var_406_9.localEulerAngles

				var_406_17.z = 0
				var_406_17.x = 0
				var_406_9.localEulerAngles = var_406_17
			end

			local var_406_18 = arg_403_1.actors_["1071ui_story"]
			local var_406_19 = 0

			if var_406_19 < arg_403_1.time_ and arg_403_1.time_ <= var_406_19 + arg_406_0 and arg_403_1.var_.characterEffect1071ui_story == nil then
				arg_403_1.var_.characterEffect1071ui_story = var_406_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_20 = 0.2

			if var_406_19 <= arg_403_1.time_ and arg_403_1.time_ < var_406_19 + var_406_20 then
				local var_406_21 = (arg_403_1.time_ - var_406_19) / var_406_20

				if arg_403_1.var_.characterEffect1071ui_story then
					local var_406_22 = Mathf.Lerp(0, 0.5, var_406_21)

					arg_403_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1071ui_story.fillRatio = var_406_22
				end
			end

			if arg_403_1.time_ >= var_406_19 + var_406_20 and arg_403_1.time_ < var_406_19 + var_406_20 + arg_406_0 and arg_403_1.var_.characterEffect1071ui_story then
				local var_406_23 = 0.5

				arg_403_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1071ui_story.fillRatio = var_406_23
			end

			local var_406_24 = 0

			if var_406_24 < arg_403_1.time_ and arg_403_1.time_ <= var_406_24 + arg_406_0 then
				arg_403_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_406_25 = arg_403_1.actors_["1069ui_story"]
			local var_406_26 = 0

			if var_406_26 < arg_403_1.time_ and arg_403_1.time_ <= var_406_26 + arg_406_0 and arg_403_1.var_.characterEffect1069ui_story == nil then
				arg_403_1.var_.characterEffect1069ui_story = var_406_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_27 = 0.2

			if var_406_26 <= arg_403_1.time_ and arg_403_1.time_ < var_406_26 + var_406_27 then
				local var_406_28 = (arg_403_1.time_ - var_406_26) / var_406_27

				if arg_403_1.var_.characterEffect1069ui_story then
					arg_403_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_403_1.time_ >= var_406_26 + var_406_27 and arg_403_1.time_ < var_406_26 + var_406_27 + arg_406_0 and arg_403_1.var_.characterEffect1069ui_story then
				arg_403_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_406_29 = 0

			if var_406_29 < arg_403_1.time_ and arg_403_1.time_ <= var_406_29 + arg_406_0 then
				arg_403_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_406_30 = 0

			if var_406_30 < arg_403_1.time_ and arg_403_1.time_ <= var_406_30 + arg_406_0 then
				arg_403_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_406_31 = 0
			local var_406_32 = 0.85

			if var_406_31 < arg_403_1.time_ and arg_403_1.time_ <= var_406_31 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_33 = arg_403_1:FormatText(StoryNameCfg[378].name)

				arg_403_1.leftNameTxt_.text = var_406_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_34 = arg_403_1:GetWordFromCfg(120411100)
				local var_406_35 = arg_403_1:FormatText(var_406_34.content)

				arg_403_1.text_.text = var_406_35

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_36 = 34
				local var_406_37 = utf8.len(var_406_35)
				local var_406_38 = var_406_36 <= 0 and var_406_32 or var_406_32 * (var_406_37 / var_406_36)

				if var_406_38 > 0 and var_406_32 < var_406_38 then
					arg_403_1.talkMaxDuration = var_406_38

					if var_406_38 + var_406_31 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_38 + var_406_31
					end
				end

				arg_403_1.text_.text = var_406_35
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411100", "story_v_out_120411.awb") ~= 0 then
					local var_406_39 = manager.audio:GetVoiceLength("story_v_out_120411", "120411100", "story_v_out_120411.awb") / 1000

					if var_406_39 + var_406_31 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_39 + var_406_31
					end

					if var_406_34.prefab_name ~= "" and arg_403_1.actors_[var_406_34.prefab_name] ~= nil then
						local var_406_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_34.prefab_name].transform, "story_v_out_120411", "120411100", "story_v_out_120411.awb")

						arg_403_1:RecordAudio("120411100", var_406_40)
						arg_403_1:RecordAudio("120411100", var_406_40)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_120411", "120411100", "story_v_out_120411.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_120411", "120411100", "story_v_out_120411.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_41 = math.max(var_406_32, arg_403_1.talkMaxDuration)

			if var_406_31 <= arg_403_1.time_ and arg_403_1.time_ < var_406_31 + var_406_41 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_31) / var_406_41

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_31 + var_406_41 and arg_403_1.time_ < var_406_31 + var_406_41 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play120411101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 120411101
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play120411102(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1069ui_story"].transform
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 then
				arg_407_1.var_.moveOldPos1069ui_story = var_410_0.localPosition
			end

			local var_410_2 = 0.001

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2
				local var_410_4 = Vector3.New(0, 100, 0)

				var_410_0.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1069ui_story, var_410_4, var_410_3)

				local var_410_5 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_5.x, var_410_5.y, var_410_5.z)

				local var_410_6 = var_410_0.localEulerAngles

				var_410_6.z = 0
				var_410_6.x = 0
				var_410_0.localEulerAngles = var_410_6
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 then
				var_410_0.localPosition = Vector3.New(0, 100, 0)

				local var_410_7 = manager.ui.mainCamera.transform.position - var_410_0.position

				var_410_0.forward = Vector3.New(var_410_7.x, var_410_7.y, var_410_7.z)

				local var_410_8 = var_410_0.localEulerAngles

				var_410_8.z = 0
				var_410_8.x = 0
				var_410_0.localEulerAngles = var_410_8
			end

			local var_410_9 = arg_407_1.actors_["1071ui_story"].transform
			local var_410_10 = 0

			if var_410_10 < arg_407_1.time_ and arg_407_1.time_ <= var_410_10 + arg_410_0 then
				arg_407_1.var_.moveOldPos1071ui_story = var_410_9.localPosition
			end

			local var_410_11 = 0.001

			if var_410_10 <= arg_407_1.time_ and arg_407_1.time_ < var_410_10 + var_410_11 then
				local var_410_12 = (arg_407_1.time_ - var_410_10) / var_410_11
				local var_410_13 = Vector3.New(0, 100, 0)

				var_410_9.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1071ui_story, var_410_13, var_410_12)

				local var_410_14 = manager.ui.mainCamera.transform.position - var_410_9.position

				var_410_9.forward = Vector3.New(var_410_14.x, var_410_14.y, var_410_14.z)

				local var_410_15 = var_410_9.localEulerAngles

				var_410_15.z = 0
				var_410_15.x = 0
				var_410_9.localEulerAngles = var_410_15
			end

			if arg_407_1.time_ >= var_410_10 + var_410_11 and arg_407_1.time_ < var_410_10 + var_410_11 + arg_410_0 then
				var_410_9.localPosition = Vector3.New(0, 100, 0)

				local var_410_16 = manager.ui.mainCamera.transform.position - var_410_9.position

				var_410_9.forward = Vector3.New(var_410_16.x, var_410_16.y, var_410_16.z)

				local var_410_17 = var_410_9.localEulerAngles

				var_410_17.z = 0
				var_410_17.x = 0
				var_410_9.localEulerAngles = var_410_17
			end

			local var_410_18 = "J05f_blur"

			if arg_407_1.bgs_[var_410_18] == nil then
				local var_410_19 = Object.Instantiate(arg_407_1.blurPaintGo_)
				local var_410_20 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_410_18)

				var_410_19:GetComponent("SpriteRenderer").sprite = var_410_20
				var_410_19.name = var_410_18
				var_410_19.transform.parent = arg_407_1.stage_.transform
				var_410_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_407_1.bgs_[var_410_18] = var_410_19
			end

			local var_410_21 = 0
			local var_410_22 = arg_407_1.bgs_[var_410_18]

			if var_410_21 < arg_407_1.time_ and arg_407_1.time_ <= var_410_21 + arg_410_0 then
				local var_410_23 = manager.ui.mainCamera.transform.localPosition
				local var_410_24 = Vector3.New(0, 0, 10) + Vector3.New(var_410_23.x, var_410_23.y, 0)

				var_410_22.transform.localPosition = var_410_24
				var_410_22.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_410_25 = var_410_22:GetComponent("SpriteRenderer")

				if var_410_25 and var_410_25.sprite then
					local var_410_26 = (var_410_22.transform.localPosition - var_410_23).z
					local var_410_27 = manager.ui.mainCameraCom_
					local var_410_28 = 2 * var_410_26 * Mathf.Tan(var_410_27.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_410_29 = var_410_28 * var_410_27.aspect
					local var_410_30 = var_410_25.sprite.bounds.size.x
					local var_410_31 = var_410_25.sprite.bounds.size.y
					local var_410_32 = var_410_29 / var_410_30
					local var_410_33 = var_410_28 / var_410_31
					local var_410_34 = var_410_33 < var_410_32 and var_410_32 or var_410_33

					var_410_22.transform.localScale = Vector3.New(var_410_34, var_410_34, 0)
				end
			end

			local var_410_35 = 5

			if var_410_21 <= arg_407_1.time_ and arg_407_1.time_ < var_410_21 + var_410_35 then
				local var_410_36 = (arg_407_1.time_ - var_410_21) / var_410_35
				local var_410_37 = Color.New(1, 1, 1)

				var_410_37.a = Mathf.Lerp(0, 1, var_410_36)

				var_410_22:GetComponent("SpriteRenderer").material:SetColor("_Color", var_410_37)
			end

			local var_410_38 = 0
			local var_410_39 = 0.875

			if var_410_38 < arg_407_1.time_ and arg_407_1.time_ <= var_410_38 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, false)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_40 = arg_407_1:GetWordFromCfg(120411101)
				local var_410_41 = arg_407_1:FormatText(var_410_40.content)

				arg_407_1.text_.text = var_410_41

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_42 = 35
				local var_410_43 = utf8.len(var_410_41)
				local var_410_44 = var_410_42 <= 0 and var_410_39 or var_410_39 * (var_410_43 / var_410_42)

				if var_410_44 > 0 and var_410_39 < var_410_44 then
					arg_407_1.talkMaxDuration = var_410_44

					if var_410_44 + var_410_38 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_44 + var_410_38
					end
				end

				arg_407_1.text_.text = var_410_41
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_45 = math.max(var_410_39, arg_407_1.talkMaxDuration)

			if var_410_38 <= arg_407_1.time_ and arg_407_1.time_ < var_410_38 + var_410_45 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_38) / var_410_45

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_38 + var_410_45 and arg_407_1.time_ < var_410_38 + var_410_45 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play120411102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 120411102
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play120411103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.65

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, false)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_2 = arg_411_1:GetWordFromCfg(120411102)
				local var_414_3 = arg_411_1:FormatText(var_414_2.content)

				arg_411_1.text_.text = var_414_3

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_4 = 26
				local var_414_5 = utf8.len(var_414_3)
				local var_414_6 = var_414_4 <= 0 and var_414_1 or var_414_1 * (var_414_5 / var_414_4)

				if var_414_6 > 0 and var_414_1 < var_414_6 then
					arg_411_1.talkMaxDuration = var_414_6

					if var_414_6 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_6 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_3
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_7 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_7 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_7

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_7 and arg_411_1.time_ < var_414_0 + var_414_7 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play120411103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 120411103
		arg_415_1.duration_ = 4.999999999999

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play120411104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = manager.ui.mainCamera.transform
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.var_.shakeOldPos = var_418_0.localPosition
			end

			local var_418_2 = 0.6

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / 0.066
				local var_418_4, var_418_5 = math.modf(var_418_3)

				var_418_0.localPosition = Vector3.New(var_418_5 * 0.13, var_418_5 * 0.13, var_418_5 * 0.13) + arg_415_1.var_.shakeOldPos
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 then
				var_418_0.localPosition = arg_415_1.var_.shakeOldPos
			end

			local var_418_6 = "J05f_blur"

			if arg_415_1.bgs_[var_418_6] == nil then
				local var_418_7 = Object.Instantiate(arg_415_1.blurPaintGo_)
				local var_418_8 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_418_6)

				var_418_7:GetComponent("SpriteRenderer").sprite = var_418_8
				var_418_7.name = var_418_6
				var_418_7.transform.parent = arg_415_1.stage_.transform
				var_418_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_415_1.bgs_[var_418_6] = var_418_7
			end

			local var_418_9 = 0
			local var_418_10 = arg_415_1.bgs_[var_418_6]

			if var_418_9 < arg_415_1.time_ and arg_415_1.time_ <= var_418_9 + arg_418_0 then
				local var_418_11 = manager.ui.mainCamera.transform.localPosition
				local var_418_12 = Vector3.New(0, 0, 10) + Vector3.New(var_418_11.x, var_418_11.y, 0)

				var_418_10.transform.localPosition = var_418_12
				var_418_10.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_418_13 = var_418_10:GetComponent("SpriteRenderer")

				if var_418_13 and var_418_13.sprite then
					local var_418_14 = (var_418_10.transform.localPosition - var_418_11).z
					local var_418_15 = manager.ui.mainCameraCom_
					local var_418_16 = 2 * var_418_14 * Mathf.Tan(var_418_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_418_17 = var_418_16 * var_418_15.aspect
					local var_418_18 = var_418_13.sprite.bounds.size.x
					local var_418_19 = var_418_13.sprite.bounds.size.y
					local var_418_20 = var_418_17 / var_418_18
					local var_418_21 = var_418_16 / var_418_19
					local var_418_22 = var_418_21 < var_418_20 and var_418_20 or var_418_21

					var_418_10.transform.localScale = Vector3.New(var_418_22, var_418_22, 0)
				end
			end

			local var_418_23 = 1.5

			if var_418_9 <= arg_415_1.time_ and arg_415_1.time_ < var_418_9 + var_418_23 then
				local var_418_24 = (arg_415_1.time_ - var_418_9) / var_418_23
				local var_418_25 = Color.New(1, 1, 1)

				var_418_25.a = Mathf.Lerp(1, 0, var_418_24)

				var_418_10:GetComponent("SpriteRenderer").material:SetColor("_Color", var_418_25)
			end

			if arg_415_1.frameCnt_ <= 1 then
				arg_415_1.dialog_:SetActive(false)
			end

			local var_418_26 = 1
			local var_418_27 = 0.075

			if var_418_26 < arg_415_1.time_ and arg_415_1.time_ <= var_418_26 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0

				arg_415_1.dialog_:SetActive(true)

				local var_418_28 = LeanTween.value(arg_415_1.dialog_, 0, 1, 0.3)

				var_418_28:setOnUpdate(LuaHelper.FloatAction(function(arg_419_0)
					arg_415_1.dialogCg_.alpha = arg_419_0
				end))
				var_418_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_415_1.dialog_)
					var_418_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_415_1.duration_ = arg_415_1.duration_ + 0.3

				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_29 = arg_415_1:FormatText(StoryNameCfg[378].name)

				arg_415_1.leftNameTxt_.text = var_418_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, true)
				arg_415_1.iconController_:SetSelectedState("hero")

				arg_415_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_30 = arg_415_1:GetWordFromCfg(120411103)
				local var_418_31 = arg_415_1:FormatText(var_418_30.content)

				arg_415_1.text_.text = var_418_31

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_32 = 3
				local var_418_33 = utf8.len(var_418_31)
				local var_418_34 = var_418_32 <= 0 and var_418_27 or var_418_27 * (var_418_33 / var_418_32)

				if var_418_34 > 0 and var_418_27 < var_418_34 then
					arg_415_1.talkMaxDuration = var_418_34
					var_418_26 = var_418_26 + 0.3

					if var_418_34 + var_418_26 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_34 + var_418_26
					end
				end

				arg_415_1.text_.text = var_418_31
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411103", "story_v_out_120411.awb") ~= 0 then
					local var_418_35 = manager.audio:GetVoiceLength("story_v_out_120411", "120411103", "story_v_out_120411.awb") / 1000

					if var_418_35 + var_418_26 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_35 + var_418_26
					end

					if var_418_30.prefab_name ~= "" and arg_415_1.actors_[var_418_30.prefab_name] ~= nil then
						local var_418_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_30.prefab_name].transform, "story_v_out_120411", "120411103", "story_v_out_120411.awb")

						arg_415_1:RecordAudio("120411103", var_418_36)
						arg_415_1:RecordAudio("120411103", var_418_36)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_120411", "120411103", "story_v_out_120411.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_120411", "120411103", "story_v_out_120411.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_37 = var_418_26 + 0.3
			local var_418_38 = math.max(var_418_27, arg_415_1.talkMaxDuration)

			if var_418_37 <= arg_415_1.time_ and arg_415_1.time_ < var_418_37 + var_418_38 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_37) / var_418_38

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_37 + var_418_38 and arg_415_1.time_ < var_418_37 + var_418_38 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play120411104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 120411104
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play120411105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = 0
			local var_424_1 = 0.95

			if var_424_0 < arg_421_1.time_ and arg_421_1.time_ <= var_424_0 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_2 = arg_421_1:GetWordFromCfg(120411104)
				local var_424_3 = arg_421_1:FormatText(var_424_2.content)

				arg_421_1.text_.text = var_424_3

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_4 = 38
				local var_424_5 = utf8.len(var_424_3)
				local var_424_6 = var_424_4 <= 0 and var_424_1 or var_424_1 * (var_424_5 / var_424_4)

				if var_424_6 > 0 and var_424_1 < var_424_6 then
					arg_421_1.talkMaxDuration = var_424_6

					if var_424_6 + var_424_0 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_6 + var_424_0
					end
				end

				arg_421_1.text_.text = var_424_3
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_7 = math.max(var_424_1, arg_421_1.talkMaxDuration)

			if var_424_0 <= arg_421_1.time_ and arg_421_1.time_ < var_424_0 + var_424_7 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_0) / var_424_7

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_0 + var_424_7 and arg_421_1.time_ < var_424_0 + var_424_7 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play120411105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 120411105
		arg_425_1.duration_ = 11.1

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play120411106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.mask_.enabled = true
				arg_425_1.mask_.raycastTarget = true

				arg_425_1:SetGaussion(false)
			end

			local var_428_1 = 3

			if var_428_0 <= arg_425_1.time_ and arg_425_1.time_ < var_428_0 + var_428_1 then
				local var_428_2 = (arg_425_1.time_ - var_428_0) / var_428_1
				local var_428_3 = Color.New(0, 0, 0)

				var_428_3.a = Mathf.Lerp(0, 1, var_428_2)
				arg_425_1.mask_.color = var_428_3
			end

			if arg_425_1.time_ >= var_428_0 + var_428_1 and arg_425_1.time_ < var_428_0 + var_428_1 + arg_428_0 then
				local var_428_4 = Color.New(0, 0, 0)

				var_428_4.a = 1
				arg_425_1.mask_.color = var_428_4
			end

			local var_428_5 = 3

			if var_428_5 < arg_425_1.time_ and arg_425_1.time_ <= var_428_5 + arg_428_0 then
				arg_425_1.mask_.enabled = true
				arg_425_1.mask_.raycastTarget = true

				arg_425_1:SetGaussion(false)
			end

			local var_428_6 = 3.1

			if var_428_5 <= arg_425_1.time_ and arg_425_1.time_ < var_428_5 + var_428_6 then
				local var_428_7 = (arg_425_1.time_ - var_428_5) / var_428_6
				local var_428_8 = Color.New(0, 0, 0)

				var_428_8.a = Mathf.Lerp(1, 0, var_428_7)
				arg_425_1.mask_.color = var_428_8
			end

			if arg_425_1.time_ >= var_428_5 + var_428_6 and arg_425_1.time_ < var_428_5 + var_428_6 + arg_428_0 then
				local var_428_9 = Color.New(0, 0, 0)
				local var_428_10 = 0

				arg_425_1.mask_.enabled = false
				var_428_9.a = var_428_10
				arg_425_1.mask_.color = var_428_9
			end

			local var_428_11 = "ST29"

			if arg_425_1.bgs_[var_428_11] == nil then
				local var_428_12 = Object.Instantiate(arg_425_1.paintGo_)

				var_428_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_428_11)
				var_428_12.name = var_428_11
				var_428_12.transform.parent = arg_425_1.stage_.transform
				var_428_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_425_1.bgs_[var_428_11] = var_428_12
			end

			local var_428_13 = 3

			if var_428_13 < arg_425_1.time_ and arg_425_1.time_ <= var_428_13 + arg_428_0 then
				local var_428_14 = manager.ui.mainCamera.transform.localPosition
				local var_428_15 = Vector3.New(0, 0, 10) + Vector3.New(var_428_14.x, var_428_14.y, 0)
				local var_428_16 = arg_425_1.bgs_.ST29

				var_428_16.transform.localPosition = var_428_15
				var_428_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_428_17 = var_428_16:GetComponent("SpriteRenderer")

				if var_428_17 and var_428_17.sprite then
					local var_428_18 = (var_428_16.transform.localPosition - var_428_14).z
					local var_428_19 = manager.ui.mainCameraCom_
					local var_428_20 = 2 * var_428_18 * Mathf.Tan(var_428_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_428_21 = var_428_20 * var_428_19.aspect
					local var_428_22 = var_428_17.sprite.bounds.size.x
					local var_428_23 = var_428_17.sprite.bounds.size.y
					local var_428_24 = var_428_21 / var_428_22
					local var_428_25 = var_428_20 / var_428_23
					local var_428_26 = var_428_25 < var_428_24 and var_428_24 or var_428_25

					var_428_16.transform.localScale = Vector3.New(var_428_26, var_428_26, 0)
				end

				for iter_428_0, iter_428_1 in pairs(arg_425_1.bgs_) do
					if iter_428_0 ~= "ST29" then
						iter_428_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_425_1.frameCnt_ <= 1 then
				arg_425_1.dialog_:SetActive(false)
			end

			local var_428_27 = 6.1
			local var_428_28 = 1.775

			if var_428_27 < arg_425_1.time_ and arg_425_1.time_ <= var_428_27 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0

				arg_425_1.dialog_:SetActive(true)

				local var_428_29 = LeanTween.value(arg_425_1.dialog_, 0, 1, 0.3)

				var_428_29:setOnUpdate(LuaHelper.FloatAction(function(arg_429_0)
					arg_425_1.dialogCg_.alpha = arg_429_0
				end))
				var_428_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_425_1.dialog_)
					var_428_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_425_1.duration_ = arg_425_1.duration_ + 0.3

				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_30 = arg_425_1:GetWordFromCfg(120411105)
				local var_428_31 = arg_425_1:FormatText(var_428_30.content)

				arg_425_1.text_.text = var_428_31

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_32 = 71
				local var_428_33 = utf8.len(var_428_31)
				local var_428_34 = var_428_32 <= 0 and var_428_28 or var_428_28 * (var_428_33 / var_428_32)

				if var_428_34 > 0 and var_428_28 < var_428_34 then
					arg_425_1.talkMaxDuration = var_428_34
					var_428_27 = var_428_27 + 0.3

					if var_428_34 + var_428_27 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_34 + var_428_27
					end
				end

				arg_425_1.text_.text = var_428_31
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_35 = var_428_27 + 0.3
			local var_428_36 = math.max(var_428_28, arg_425_1.talkMaxDuration)

			if var_428_35 <= arg_425_1.time_ and arg_425_1.time_ < var_428_35 + var_428_36 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_35) / var_428_36

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_35 + var_428_36 and arg_425_1.time_ < var_428_35 + var_428_36 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play120411106 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 120411106
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play120411107(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 0
			local var_434_1 = 1.425

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_2 = arg_431_1:GetWordFromCfg(120411106)
				local var_434_3 = arg_431_1:FormatText(var_434_2.content)

				arg_431_1.text_.text = var_434_3

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_4 = 57
				local var_434_5 = utf8.len(var_434_3)
				local var_434_6 = var_434_4 <= 0 and var_434_1 or var_434_1 * (var_434_5 / var_434_4)

				if var_434_6 > 0 and var_434_1 < var_434_6 then
					arg_431_1.talkMaxDuration = var_434_6

					if var_434_6 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_6 + var_434_0
					end
				end

				arg_431_1.text_.text = var_434_3
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_7 = math.max(var_434_1, arg_431_1.talkMaxDuration)

			if var_434_0 <= arg_431_1.time_ and arg_431_1.time_ < var_434_0 + var_434_7 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_0) / var_434_7

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_0 + var_434_7 and arg_431_1.time_ < var_434_0 + var_434_7 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play120411107 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 120411107
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play120411108(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.7

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_2 = arg_435_1:GetWordFromCfg(120411107)
				local var_438_3 = arg_435_1:FormatText(var_438_2.content)

				arg_435_1.text_.text = var_438_3

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_4 = 28
				local var_438_5 = utf8.len(var_438_3)
				local var_438_6 = var_438_4 <= 0 and var_438_1 or var_438_1 * (var_438_5 / var_438_4)

				if var_438_6 > 0 and var_438_1 < var_438_6 then
					arg_435_1.talkMaxDuration = var_438_6

					if var_438_6 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_6 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_3
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_7 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_7 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_7

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_7 and arg_435_1.time_ < var_438_0 + var_438_7 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play120411108 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 120411108
		arg_439_1.duration_ = 5

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play120411109(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.6

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, false)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_2 = arg_439_1:GetWordFromCfg(120411108)
				local var_442_3 = arg_439_1:FormatText(var_442_2.content)

				arg_439_1.text_.text = var_442_3

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_4 = 24
				local var_442_5 = utf8.len(var_442_3)
				local var_442_6 = var_442_4 <= 0 and var_442_1 or var_442_1 * (var_442_5 / var_442_4)

				if var_442_6 > 0 and var_442_1 < var_442_6 then
					arg_439_1.talkMaxDuration = var_442_6

					if var_442_6 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_6 + var_442_0
					end
				end

				arg_439_1.text_.text = var_442_3
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)
				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_7 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_7 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_7

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_7 and arg_439_1.time_ < var_442_0 + var_442_7 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play120411109 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 120411109
		arg_443_1.duration_ = 2.533333333332

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play120411110(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1076ui_story"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos1076ui_story = var_446_0.localPosition
			end

			local var_446_2 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2
				local var_446_4 = Vector3.New(0, -1.06, -6.2)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1076ui_story, var_446_4, var_446_3)

				local var_446_5 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_5.x, var_446_5.y, var_446_5.z)

				local var_446_6 = var_446_0.localEulerAngles

				var_446_6.z = 0
				var_446_6.x = 0
				var_446_0.localEulerAngles = var_446_6
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_446_7 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_7.x, var_446_7.y, var_446_7.z)

				local var_446_8 = var_446_0.localEulerAngles

				var_446_8.z = 0
				var_446_8.x = 0
				var_446_0.localEulerAngles = var_446_8
			end

			local var_446_9 = 0

			if var_446_9 < arg_443_1.time_ and arg_443_1.time_ <= var_446_9 + arg_446_0 then
				arg_443_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_446_10 = 0

			if var_446_10 < arg_443_1.time_ and arg_443_1.time_ <= var_446_10 + arg_446_0 then
				arg_443_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_446_11 = arg_443_1.actors_["1076ui_story"]
			local var_446_12 = 0

			if var_446_12 < arg_443_1.time_ and arg_443_1.time_ <= var_446_12 + arg_446_0 and arg_443_1.var_.characterEffect1076ui_story == nil then
				arg_443_1.var_.characterEffect1076ui_story = var_446_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_13 = 0.2

			if var_446_12 <= arg_443_1.time_ and arg_443_1.time_ < var_446_12 + var_446_13 then
				local var_446_14 = (arg_443_1.time_ - var_446_12) / var_446_13

				if arg_443_1.var_.characterEffect1076ui_story then
					arg_443_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_443_1.time_ >= var_446_12 + var_446_13 and arg_443_1.time_ < var_446_12 + var_446_13 + arg_446_0 and arg_443_1.var_.characterEffect1076ui_story then
				arg_443_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_446_15 = 0
			local var_446_16 = 0.225

			if var_446_15 < arg_443_1.time_ and arg_443_1.time_ <= var_446_15 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_17 = arg_443_1:FormatText(StoryNameCfg[389].name)

				arg_443_1.leftNameTxt_.text = var_446_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_18 = arg_443_1:GetWordFromCfg(120411109)
				local var_446_19 = arg_443_1:FormatText(var_446_18.content)

				arg_443_1.text_.text = var_446_19

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_20 = 9
				local var_446_21 = utf8.len(var_446_19)
				local var_446_22 = var_446_20 <= 0 and var_446_16 or var_446_16 * (var_446_21 / var_446_20)

				if var_446_22 > 0 and var_446_16 < var_446_22 then
					arg_443_1.talkMaxDuration = var_446_22

					if var_446_22 + var_446_15 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_22 + var_446_15
					end
				end

				arg_443_1.text_.text = var_446_19
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411109", "story_v_out_120411.awb") ~= 0 then
					local var_446_23 = manager.audio:GetVoiceLength("story_v_out_120411", "120411109", "story_v_out_120411.awb") / 1000

					if var_446_23 + var_446_15 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_23 + var_446_15
					end

					if var_446_18.prefab_name ~= "" and arg_443_1.actors_[var_446_18.prefab_name] ~= nil then
						local var_446_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_18.prefab_name].transform, "story_v_out_120411", "120411109", "story_v_out_120411.awb")

						arg_443_1:RecordAudio("120411109", var_446_24)
						arg_443_1:RecordAudio("120411109", var_446_24)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_120411", "120411109", "story_v_out_120411.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_120411", "120411109", "story_v_out_120411.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_25 = math.max(var_446_16, arg_443_1.talkMaxDuration)

			if var_446_15 <= arg_443_1.time_ and arg_443_1.time_ < var_446_15 + var_446_25 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_15) / var_446_25

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_15 + var_446_25 and arg_443_1.time_ < var_446_15 + var_446_25 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play120411110 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 120411110
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play120411111(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1076ui_story"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 and arg_447_1.var_.characterEffect1076ui_story == nil then
				arg_447_1.var_.characterEffect1076ui_story = var_450_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_2 = 0.2

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2

				if arg_447_1.var_.characterEffect1076ui_story then
					local var_450_4 = Mathf.Lerp(0, 0.5, var_450_3)

					arg_447_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_447_1.var_.characterEffect1076ui_story.fillRatio = var_450_4
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 and arg_447_1.var_.characterEffect1076ui_story then
				local var_450_5 = 0.5

				arg_447_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_447_1.var_.characterEffect1076ui_story.fillRatio = var_450_5
			end

			local var_450_6 = 0
			local var_450_7 = 0.625

			if var_450_6 < arg_447_1.time_ and arg_447_1.time_ <= var_450_6 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_8 = arg_447_1:FormatText(StoryNameCfg[7].name)

				arg_447_1.leftNameTxt_.text = var_450_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_9 = arg_447_1:GetWordFromCfg(120411110)
				local var_450_10 = arg_447_1:FormatText(var_450_9.content)

				arg_447_1.text_.text = var_450_10

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_11 = 25
				local var_450_12 = utf8.len(var_450_10)
				local var_450_13 = var_450_11 <= 0 and var_450_7 or var_450_7 * (var_450_12 / var_450_11)

				if var_450_13 > 0 and var_450_7 < var_450_13 then
					arg_447_1.talkMaxDuration = var_450_13

					if var_450_13 + var_450_6 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_13 + var_450_6
					end
				end

				arg_447_1.text_.text = var_450_10
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_14 = math.max(var_450_7, arg_447_1.talkMaxDuration)

			if var_450_6 <= arg_447_1.time_ and arg_447_1.time_ < var_450_6 + var_450_14 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_6) / var_450_14

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_6 + var_450_14 and arg_447_1.time_ < var_450_6 + var_450_14 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play120411111 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 120411111
		arg_451_1.duration_ = 11.733

		local var_451_0 = {
			zh = 5.8,
			ja = 11.733
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play120411112(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1076ui_story"]
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 and arg_451_1.var_.characterEffect1076ui_story == nil then
				arg_451_1.var_.characterEffect1076ui_story = var_454_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_2 = 0.2

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2

				if arg_451_1.var_.characterEffect1076ui_story then
					arg_451_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 and arg_451_1.var_.characterEffect1076ui_story then
				arg_451_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_454_4 = 0

			if var_454_4 < arg_451_1.time_ and arg_451_1.time_ <= var_454_4 + arg_454_0 then
				arg_451_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action5_1")
			end

			local var_454_5 = 0
			local var_454_6 = 0.525

			if var_454_5 < arg_451_1.time_ and arg_451_1.time_ <= var_454_5 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_7 = arg_451_1:FormatText(StoryNameCfg[389].name)

				arg_451_1.leftNameTxt_.text = var_454_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_8 = arg_451_1:GetWordFromCfg(120411111)
				local var_454_9 = arg_451_1:FormatText(var_454_8.content)

				arg_451_1.text_.text = var_454_9

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_10 = 21
				local var_454_11 = utf8.len(var_454_9)
				local var_454_12 = var_454_10 <= 0 and var_454_6 or var_454_6 * (var_454_11 / var_454_10)

				if var_454_12 > 0 and var_454_6 < var_454_12 then
					arg_451_1.talkMaxDuration = var_454_12

					if var_454_12 + var_454_5 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_12 + var_454_5
					end
				end

				arg_451_1.text_.text = var_454_9
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411111", "story_v_out_120411.awb") ~= 0 then
					local var_454_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411111", "story_v_out_120411.awb") / 1000

					if var_454_13 + var_454_5 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_13 + var_454_5
					end

					if var_454_8.prefab_name ~= "" and arg_451_1.actors_[var_454_8.prefab_name] ~= nil then
						local var_454_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_8.prefab_name].transform, "story_v_out_120411", "120411111", "story_v_out_120411.awb")

						arg_451_1:RecordAudio("120411111", var_454_14)
						arg_451_1:RecordAudio("120411111", var_454_14)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_120411", "120411111", "story_v_out_120411.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_120411", "120411111", "story_v_out_120411.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_15 = math.max(var_454_6, arg_451_1.talkMaxDuration)

			if var_454_5 <= arg_451_1.time_ and arg_451_1.time_ < var_454_5 + var_454_15 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_5) / var_454_15

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_5 + var_454_15 and arg_451_1.time_ < var_454_5 + var_454_15 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play120411112 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 120411112
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play120411113(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1076ui_story"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 and arg_455_1.var_.characterEffect1076ui_story == nil then
				arg_455_1.var_.characterEffect1076ui_story = var_458_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_2 = 0.2

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2

				if arg_455_1.var_.characterEffect1076ui_story then
					local var_458_4 = Mathf.Lerp(0, 0.5, var_458_3)

					arg_455_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_455_1.var_.characterEffect1076ui_story.fillRatio = var_458_4
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 and arg_455_1.var_.characterEffect1076ui_story then
				local var_458_5 = 0.5

				arg_455_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_455_1.var_.characterEffect1076ui_story.fillRatio = var_458_5
			end

			local var_458_6 = 0
			local var_458_7 = 0.925

			if var_458_6 < arg_455_1.time_ and arg_455_1.time_ <= var_458_6 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_8 = arg_455_1:FormatText(StoryNameCfg[7].name)

				arg_455_1.leftNameTxt_.text = var_458_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_9 = arg_455_1:GetWordFromCfg(120411112)
				local var_458_10 = arg_455_1:FormatText(var_458_9.content)

				arg_455_1.text_.text = var_458_10

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_11 = 37
				local var_458_12 = utf8.len(var_458_10)
				local var_458_13 = var_458_11 <= 0 and var_458_7 or var_458_7 * (var_458_12 / var_458_11)

				if var_458_13 > 0 and var_458_7 < var_458_13 then
					arg_455_1.talkMaxDuration = var_458_13

					if var_458_13 + var_458_6 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_13 + var_458_6
					end
				end

				arg_455_1.text_.text = var_458_10
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_14 = math.max(var_458_7, arg_455_1.talkMaxDuration)

			if var_458_6 <= arg_455_1.time_ and arg_455_1.time_ < var_458_6 + var_458_14 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_6) / var_458_14

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_6 + var_458_14 and arg_455_1.time_ < var_458_6 + var_458_14 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play120411113 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 120411113
		arg_459_1.duration_ = 8.633

		local var_459_0 = {
			zh = 8.3,
			ja = 8.633
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
				arg_459_0:Play120411114(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1076ui_story"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and arg_459_1.var_.characterEffect1076ui_story == nil then
				arg_459_1.var_.characterEffect1076ui_story = var_462_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_2 = 0.2

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.characterEffect1076ui_story then
					arg_459_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and arg_459_1.var_.characterEffect1076ui_story then
				arg_459_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_462_4 = 0

			if var_462_4 < arg_459_1.time_ and arg_459_1.time_ <= var_462_4 + arg_462_0 then
				arg_459_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076actionlink/1076action456")
			end

			local var_462_5 = 0
			local var_462_6 = 0.625

			if var_462_5 < arg_459_1.time_ and arg_459_1.time_ <= var_462_5 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_7 = arg_459_1:FormatText(StoryNameCfg[389].name)

				arg_459_1.leftNameTxt_.text = var_462_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_8 = arg_459_1:GetWordFromCfg(120411113)
				local var_462_9 = arg_459_1:FormatText(var_462_8.content)

				arg_459_1.text_.text = var_462_9

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_10 = 24
				local var_462_11 = utf8.len(var_462_9)
				local var_462_12 = var_462_10 <= 0 and var_462_6 or var_462_6 * (var_462_11 / var_462_10)

				if var_462_12 > 0 and var_462_6 < var_462_12 then
					arg_459_1.talkMaxDuration = var_462_12

					if var_462_12 + var_462_5 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_12 + var_462_5
					end
				end

				arg_459_1.text_.text = var_462_9
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411113", "story_v_out_120411.awb") ~= 0 then
					local var_462_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411113", "story_v_out_120411.awb") / 1000

					if var_462_13 + var_462_5 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_13 + var_462_5
					end

					if var_462_8.prefab_name ~= "" and arg_459_1.actors_[var_462_8.prefab_name] ~= nil then
						local var_462_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_8.prefab_name].transform, "story_v_out_120411", "120411113", "story_v_out_120411.awb")

						arg_459_1:RecordAudio("120411113", var_462_14)
						arg_459_1:RecordAudio("120411113", var_462_14)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_120411", "120411113", "story_v_out_120411.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_120411", "120411113", "story_v_out_120411.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_15 = math.max(var_462_6, arg_459_1.talkMaxDuration)

			if var_462_5 <= arg_459_1.time_ and arg_459_1.time_ < var_462_5 + var_462_15 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_5) / var_462_15

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_5 + var_462_15 and arg_459_1.time_ < var_462_5 + var_462_15 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play120411114 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 120411114
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play120411115(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1076ui_story"].transform
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.var_.moveOldPos1076ui_story = var_466_0.localPosition
			end

			local var_466_2 = 0.001

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2
				local var_466_4 = Vector3.New(0, 100, 0)

				var_466_0.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos1076ui_story, var_466_4, var_466_3)

				local var_466_5 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_5.x, var_466_5.y, var_466_5.z)

				local var_466_6 = var_466_0.localEulerAngles

				var_466_6.z = 0
				var_466_6.x = 0
				var_466_0.localEulerAngles = var_466_6
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 then
				var_466_0.localPosition = Vector3.New(0, 100, 0)

				local var_466_7 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_7.x, var_466_7.y, var_466_7.z)

				local var_466_8 = var_466_0.localEulerAngles

				var_466_8.z = 0
				var_466_8.x = 0
				var_466_0.localEulerAngles = var_466_8
			end

			local var_466_9 = 0
			local var_466_10 = 1.25

			if var_466_9 < arg_463_1.time_ and arg_463_1.time_ <= var_466_9 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, false)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_11 = arg_463_1:GetWordFromCfg(120411114)
				local var_466_12 = arg_463_1:FormatText(var_466_11.content)

				arg_463_1.text_.text = var_466_12

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_13 = 50
				local var_466_14 = utf8.len(var_466_12)
				local var_466_15 = var_466_13 <= 0 and var_466_10 or var_466_10 * (var_466_14 / var_466_13)

				if var_466_15 > 0 and var_466_10 < var_466_15 then
					arg_463_1.talkMaxDuration = var_466_15

					if var_466_15 + var_466_9 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_15 + var_466_9
					end
				end

				arg_463_1.text_.text = var_466_12
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_16 = math.max(var_466_10, arg_463_1.talkMaxDuration)

			if var_466_9 <= arg_463_1.time_ and arg_463_1.time_ < var_466_9 + var_466_16 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_9) / var_466_16

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_9 + var_466_16 and arg_463_1.time_ < var_466_9 + var_466_16 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play120411115 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 120411115
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play120411116(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.95

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_2 = arg_467_1:GetWordFromCfg(120411115)
				local var_470_3 = arg_467_1:FormatText(var_470_2.content)

				arg_467_1.text_.text = var_470_3

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_4 = 38
				local var_470_5 = utf8.len(var_470_3)
				local var_470_6 = var_470_4 <= 0 and var_470_1 or var_470_1 * (var_470_5 / var_470_4)

				if var_470_6 > 0 and var_470_1 < var_470_6 then
					arg_467_1.talkMaxDuration = var_470_6

					if var_470_6 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_6 + var_470_0
					end
				end

				arg_467_1.text_.text = var_470_3
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_7 = math.max(var_470_1, arg_467_1.talkMaxDuration)

			if var_470_0 <= arg_467_1.time_ and arg_467_1.time_ < var_470_0 + var_470_7 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_0) / var_470_7

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_0 + var_470_7 and arg_467_1.time_ < var_470_0 + var_470_7 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play120411116 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 120411116
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play120411117(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 0.975

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_2 = arg_471_1:GetWordFromCfg(120411116)
				local var_474_3 = arg_471_1:FormatText(var_474_2.content)

				arg_471_1.text_.text = var_474_3

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_4 = 39
				local var_474_5 = utf8.len(var_474_3)
				local var_474_6 = var_474_4 <= 0 and var_474_1 or var_474_1 * (var_474_5 / var_474_4)

				if var_474_6 > 0 and var_474_1 < var_474_6 then
					arg_471_1.talkMaxDuration = var_474_6

					if var_474_6 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_6 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_3
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_7 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_7 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_7

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_7 and arg_471_1.time_ < var_474_0 + var_474_7 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play120411117 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 120411117
		arg_475_1.duration_ = 14.333

		local var_475_0 = {
			zh = 10.4,
			ja = 14.333
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
				arg_475_0:Play120411118(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 1.35

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[379].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, true)
				arg_475_1.iconController_:SetSelectedState("hero")

				arg_475_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(120411117)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 54
				local var_478_6 = utf8.len(var_478_4)
				local var_478_7 = var_478_5 <= 0 and var_478_1 or var_478_1 * (var_478_6 / var_478_5)

				if var_478_7 > 0 and var_478_1 < var_478_7 then
					arg_475_1.talkMaxDuration = var_478_7

					if var_478_7 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_7 + var_478_0
					end
				end

				arg_475_1.text_.text = var_478_4
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411117", "story_v_out_120411.awb") ~= 0 then
					local var_478_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411117", "story_v_out_120411.awb") / 1000

					if var_478_8 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_8 + var_478_0
					end

					if var_478_3.prefab_name ~= "" and arg_475_1.actors_[var_478_3.prefab_name] ~= nil then
						local var_478_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_3.prefab_name].transform, "story_v_out_120411", "120411117", "story_v_out_120411.awb")

						arg_475_1:RecordAudio("120411117", var_478_9)
						arg_475_1:RecordAudio("120411117", var_478_9)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_120411", "120411117", "story_v_out_120411.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_120411", "120411117", "story_v_out_120411.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_10 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_10 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_10

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_10 and arg_475_1.time_ < var_478_0 + var_478_10 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play120411118 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 120411118
		arg_479_1.duration_ = 8.066

		local var_479_0 = {
			zh = 7,
			ja = 8.066
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
				arg_479_0:Play120411119(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0
			local var_482_1 = 0.825

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_2 = arg_479_1:FormatText(StoryNameCfg[379].name)

				arg_479_1.leftNameTxt_.text = var_482_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, true)
				arg_479_1.iconController_:SetSelectedState("hero")

				arg_479_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_3 = arg_479_1:GetWordFromCfg(120411118)
				local var_482_4 = arg_479_1:FormatText(var_482_3.content)

				arg_479_1.text_.text = var_482_4

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_5 = 33
				local var_482_6 = utf8.len(var_482_4)
				local var_482_7 = var_482_5 <= 0 and var_482_1 or var_482_1 * (var_482_6 / var_482_5)

				if var_482_7 > 0 and var_482_1 < var_482_7 then
					arg_479_1.talkMaxDuration = var_482_7

					if var_482_7 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_7 + var_482_0
					end
				end

				arg_479_1.text_.text = var_482_4
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411118", "story_v_out_120411.awb") ~= 0 then
					local var_482_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411118", "story_v_out_120411.awb") / 1000

					if var_482_8 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_8 + var_482_0
					end

					if var_482_3.prefab_name ~= "" and arg_479_1.actors_[var_482_3.prefab_name] ~= nil then
						local var_482_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_3.prefab_name].transform, "story_v_out_120411", "120411118", "story_v_out_120411.awb")

						arg_479_1:RecordAudio("120411118", var_482_9)
						arg_479_1:RecordAudio("120411118", var_482_9)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_120411", "120411118", "story_v_out_120411.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_120411", "120411118", "story_v_out_120411.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_10 = math.max(var_482_1, arg_479_1.talkMaxDuration)

			if var_482_0 <= arg_479_1.time_ and arg_479_1.time_ < var_482_0 + var_482_10 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_0) / var_482_10

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_0 + var_482_10 and arg_479_1.time_ < var_482_0 + var_482_10 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play120411119 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 120411119
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play120411120(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1076ui_story"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos1076ui_story = var_486_0.localPosition
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(0, -1.06, -6.2)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1076ui_story, var_486_4, var_486_3)

				local var_486_5 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_5.x, var_486_5.y, var_486_5.z)

				local var_486_6 = var_486_0.localEulerAngles

				var_486_6.z = 0
				var_486_6.x = 0
				var_486_0.localEulerAngles = var_486_6
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_486_7 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_7.x, var_486_7.y, var_486_7.z)

				local var_486_8 = var_486_0.localEulerAngles

				var_486_8.z = 0
				var_486_8.x = 0
				var_486_0.localEulerAngles = var_486_8
			end

			local var_486_9 = arg_483_1.actors_["1076ui_story"]
			local var_486_10 = 0

			if var_486_10 < arg_483_1.time_ and arg_483_1.time_ <= var_486_10 + arg_486_0 and arg_483_1.var_.characterEffect1076ui_story == nil then
				arg_483_1.var_.characterEffect1076ui_story = var_486_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_11 = 0.0166666666666667

			if var_486_10 <= arg_483_1.time_ and arg_483_1.time_ < var_486_10 + var_486_11 then
				local var_486_12 = (arg_483_1.time_ - var_486_10) / var_486_11

				if arg_483_1.var_.characterEffect1076ui_story then
					local var_486_13 = Mathf.Lerp(0, 0.5, var_486_12)

					arg_483_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1076ui_story.fillRatio = var_486_13
				end
			end

			if arg_483_1.time_ >= var_486_10 + var_486_11 and arg_483_1.time_ < var_486_10 + var_486_11 + arg_486_0 and arg_483_1.var_.characterEffect1076ui_story then
				local var_486_14 = 0.5

				arg_483_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1076ui_story.fillRatio = var_486_14
			end

			local var_486_15 = 0

			if var_486_15 < arg_483_1.time_ and arg_483_1.time_ <= var_486_15 + arg_486_0 then
				arg_483_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_486_16 = 0
			local var_486_17 = 0.475

			if var_486_16 < arg_483_1.time_ and arg_483_1.time_ <= var_486_16 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_18 = arg_483_1:GetWordFromCfg(120411119)
				local var_486_19 = arg_483_1:FormatText(var_486_18.content)

				arg_483_1.text_.text = var_486_19

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_20 = 19
				local var_486_21 = utf8.len(var_486_19)
				local var_486_22 = var_486_20 <= 0 and var_486_17 or var_486_17 * (var_486_21 / var_486_20)

				if var_486_22 > 0 and var_486_17 < var_486_22 then
					arg_483_1.talkMaxDuration = var_486_22

					if var_486_22 + var_486_16 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_22 + var_486_16
					end
				end

				arg_483_1.text_.text = var_486_19
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_23 = math.max(var_486_17, arg_483_1.talkMaxDuration)

			if var_486_16 <= arg_483_1.time_ and arg_483_1.time_ < var_486_16 + var_486_23 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_16) / var_486_23

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_16 + var_486_23 and arg_483_1.time_ < var_486_16 + var_486_23 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play120411120 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 120411120
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play120411121(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 0.375

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

				local var_490_3 = arg_487_1:GetWordFromCfg(120411120)
				local var_490_4 = arg_487_1:FormatText(var_490_3.content)

				arg_487_1.text_.text = var_490_4

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_5 = 15
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
	Play120411121 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 120411121
		arg_491_1.duration_ = 1.999999999999

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play120411122(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1076ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect1076ui_story == nil then
				arg_491_1.var_.characterEffect1076ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.2

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect1076ui_story then
					arg_491_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1076ui_story then
				arg_491_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_494_4 = 0

			if var_494_4 < arg_491_1.time_ and arg_491_1.time_ <= var_494_4 + arg_494_0 then
				arg_491_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_494_5 = 0
			local var_494_6 = 0.05

			if var_494_5 < arg_491_1.time_ and arg_491_1.time_ <= var_494_5 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_7 = arg_491_1:FormatText(StoryNameCfg[389].name)

				arg_491_1.leftNameTxt_.text = var_494_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_8 = arg_491_1:GetWordFromCfg(120411121)
				local var_494_9 = arg_491_1:FormatText(var_494_8.content)

				arg_491_1.text_.text = var_494_9

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_10 = 2
				local var_494_11 = utf8.len(var_494_9)
				local var_494_12 = var_494_10 <= 0 and var_494_6 or var_494_6 * (var_494_11 / var_494_10)

				if var_494_12 > 0 and var_494_6 < var_494_12 then
					arg_491_1.talkMaxDuration = var_494_12

					if var_494_12 + var_494_5 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_12 + var_494_5
					end
				end

				arg_491_1.text_.text = var_494_9
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411121", "story_v_out_120411.awb") ~= 0 then
					local var_494_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411121", "story_v_out_120411.awb") / 1000

					if var_494_13 + var_494_5 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_13 + var_494_5
					end

					if var_494_8.prefab_name ~= "" and arg_491_1.actors_[var_494_8.prefab_name] ~= nil then
						local var_494_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_8.prefab_name].transform, "story_v_out_120411", "120411121", "story_v_out_120411.awb")

						arg_491_1:RecordAudio("120411121", var_494_14)
						arg_491_1:RecordAudio("120411121", var_494_14)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_120411", "120411121", "story_v_out_120411.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_120411", "120411121", "story_v_out_120411.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_15 = math.max(var_494_6, arg_491_1.talkMaxDuration)

			if var_494_5 <= arg_491_1.time_ and arg_491_1.time_ < var_494_5 + var_494_15 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_5) / var_494_15

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_5 + var_494_15 and arg_491_1.time_ < var_494_5 + var_494_15 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play120411122 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 120411122
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play120411123(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1076ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1076ui_story == nil then
				arg_495_1.var_.characterEffect1076ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.2

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1076ui_story then
					local var_498_4 = Mathf.Lerp(0, 0.5, var_498_3)

					arg_495_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_495_1.var_.characterEffect1076ui_story.fillRatio = var_498_4
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1076ui_story then
				local var_498_5 = 0.5

				arg_495_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_495_1.var_.characterEffect1076ui_story.fillRatio = var_498_5
			end

			local var_498_6 = 0
			local var_498_7 = 0.95

			if var_498_6 < arg_495_1.time_ and arg_495_1.time_ <= var_498_6 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, false)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_8 = arg_495_1:GetWordFromCfg(120411122)
				local var_498_9 = arg_495_1:FormatText(var_498_8.content)

				arg_495_1.text_.text = var_498_9

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_10 = 38
				local var_498_11 = utf8.len(var_498_9)
				local var_498_12 = var_498_10 <= 0 and var_498_7 or var_498_7 * (var_498_11 / var_498_10)

				if var_498_12 > 0 and var_498_7 < var_498_12 then
					arg_495_1.talkMaxDuration = var_498_12

					if var_498_12 + var_498_6 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_12 + var_498_6
					end
				end

				arg_495_1.text_.text = var_498_9
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_13 = math.max(var_498_7, arg_495_1.talkMaxDuration)

			if var_498_6 <= arg_495_1.time_ and arg_495_1.time_ < var_498_6 + var_498_13 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_6) / var_498_13

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_6 + var_498_13 and arg_495_1.time_ < var_498_6 + var_498_13 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play120411123 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 120411123
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play120411124(arg_499_1)
			end
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

				local var_502_2 = arg_499_1:GetWordFromCfg(120411123)
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
	Play120411124 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 120411124
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play120411125(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 0.15

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_2 = arg_503_1:FormatText(StoryNameCfg[7].name)

				arg_503_1.leftNameTxt_.text = var_506_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_3 = arg_503_1:GetWordFromCfg(120411124)
				local var_506_4 = arg_503_1:FormatText(var_506_3.content)

				arg_503_1.text_.text = var_506_4

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_5 = 6
				local var_506_6 = utf8.len(var_506_4)
				local var_506_7 = var_506_5 <= 0 and var_506_1 or var_506_1 * (var_506_6 / var_506_5)

				if var_506_7 > 0 and var_506_1 < var_506_7 then
					arg_503_1.talkMaxDuration = var_506_7

					if var_506_7 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_7 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_4
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_8 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_8 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_8

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_8 and arg_503_1.time_ < var_506_0 + var_506_8 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play120411125 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 120411125
		arg_507_1.duration_ = 4

		local var_507_0 = {
			zh = 1.999999999999,
			ja = 4
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
				arg_507_0:Play120411126(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1076ui_story"]
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 and arg_507_1.var_.characterEffect1076ui_story == nil then
				arg_507_1.var_.characterEffect1076ui_story = var_510_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_2 = 0.2

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2

				if arg_507_1.var_.characterEffect1076ui_story then
					arg_507_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 and arg_507_1.var_.characterEffect1076ui_story then
				arg_507_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_510_4 = 0

			if var_510_4 < arg_507_1.time_ and arg_507_1.time_ <= var_510_4 + arg_510_0 then
				arg_507_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_510_5 = 0
			local var_510_6 = 0.075

			if var_510_5 < arg_507_1.time_ and arg_507_1.time_ <= var_510_5 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_7 = arg_507_1:FormatText(StoryNameCfg[389].name)

				arg_507_1.leftNameTxt_.text = var_510_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_8 = arg_507_1:GetWordFromCfg(120411125)
				local var_510_9 = arg_507_1:FormatText(var_510_8.content)

				arg_507_1.text_.text = var_510_9

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_10 = 3
				local var_510_11 = utf8.len(var_510_9)
				local var_510_12 = var_510_10 <= 0 and var_510_6 or var_510_6 * (var_510_11 / var_510_10)

				if var_510_12 > 0 and var_510_6 < var_510_12 then
					arg_507_1.talkMaxDuration = var_510_12

					if var_510_12 + var_510_5 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_12 + var_510_5
					end
				end

				arg_507_1.text_.text = var_510_9
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411125", "story_v_out_120411.awb") ~= 0 then
					local var_510_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411125", "story_v_out_120411.awb") / 1000

					if var_510_13 + var_510_5 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_13 + var_510_5
					end

					if var_510_8.prefab_name ~= "" and arg_507_1.actors_[var_510_8.prefab_name] ~= nil then
						local var_510_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_8.prefab_name].transform, "story_v_out_120411", "120411125", "story_v_out_120411.awb")

						arg_507_1:RecordAudio("120411125", var_510_14)
						arg_507_1:RecordAudio("120411125", var_510_14)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_120411", "120411125", "story_v_out_120411.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_120411", "120411125", "story_v_out_120411.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_15 = math.max(var_510_6, arg_507_1.talkMaxDuration)

			if var_510_5 <= arg_507_1.time_ and arg_507_1.time_ < var_510_5 + var_510_15 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_5) / var_510_15

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_5 + var_510_15 and arg_507_1.time_ < var_510_5 + var_510_15 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play120411126 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 120411126
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play120411127(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1076ui_story"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 and arg_511_1.var_.characterEffect1076ui_story == nil then
				arg_511_1.var_.characterEffect1076ui_story = var_514_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_2 = 0.2

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2

				if arg_511_1.var_.characterEffect1076ui_story then
					local var_514_4 = Mathf.Lerp(0, 0.5, var_514_3)

					arg_511_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_511_1.var_.characterEffect1076ui_story.fillRatio = var_514_4
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 and arg_511_1.var_.characterEffect1076ui_story then
				local var_514_5 = 0.5

				arg_511_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_511_1.var_.characterEffect1076ui_story.fillRatio = var_514_5
			end

			local var_514_6 = 0
			local var_514_7 = 0.575

			if var_514_6 < arg_511_1.time_ and arg_511_1.time_ <= var_514_6 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_8 = arg_511_1:FormatText(StoryNameCfg[7].name)

				arg_511_1.leftNameTxt_.text = var_514_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_9 = arg_511_1:GetWordFromCfg(120411126)
				local var_514_10 = arg_511_1:FormatText(var_514_9.content)

				arg_511_1.text_.text = var_514_10

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_11 = 23
				local var_514_12 = utf8.len(var_514_10)
				local var_514_13 = var_514_11 <= 0 and var_514_7 or var_514_7 * (var_514_12 / var_514_11)

				if var_514_13 > 0 and var_514_7 < var_514_13 then
					arg_511_1.talkMaxDuration = var_514_13

					if var_514_13 + var_514_6 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_13 + var_514_6
					end
				end

				arg_511_1.text_.text = var_514_10
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_14 = math.max(var_514_7, arg_511_1.talkMaxDuration)

			if var_514_6 <= arg_511_1.time_ and arg_511_1.time_ < var_514_6 + var_514_14 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_6) / var_514_14

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_6 + var_514_14 and arg_511_1.time_ < var_514_6 + var_514_14 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play120411127 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 120411127
		arg_515_1.duration_ = 2.7

		local var_515_0 = {
			zh = 2.133,
			ja = 2.7
		}
		local var_515_1 = manager.audio:GetLocalizationFlag()

		if var_515_0[var_515_1] ~= nil then
			arg_515_1.duration_ = var_515_0[var_515_1]
		end

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play120411128(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1076ui_story"]
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 and arg_515_1.var_.characterEffect1076ui_story == nil then
				arg_515_1.var_.characterEffect1076ui_story = var_518_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_2 = 0.2

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2

				if arg_515_1.var_.characterEffect1076ui_story then
					arg_515_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 and arg_515_1.var_.characterEffect1076ui_story then
				arg_515_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_518_4 = 0

			if var_518_4 < arg_515_1.time_ and arg_515_1.time_ <= var_518_4 + arg_518_0 then
				arg_515_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_518_5 = 0
			local var_518_6 = 0.275

			if var_518_5 < arg_515_1.time_ and arg_515_1.time_ <= var_518_5 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_7 = arg_515_1:FormatText(StoryNameCfg[389].name)

				arg_515_1.leftNameTxt_.text = var_518_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_8 = arg_515_1:GetWordFromCfg(120411127)
				local var_518_9 = arg_515_1:FormatText(var_518_8.content)

				arg_515_1.text_.text = var_518_9

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_10 = 11
				local var_518_11 = utf8.len(var_518_9)
				local var_518_12 = var_518_10 <= 0 and var_518_6 or var_518_6 * (var_518_11 / var_518_10)

				if var_518_12 > 0 and var_518_6 < var_518_12 then
					arg_515_1.talkMaxDuration = var_518_12

					if var_518_12 + var_518_5 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_12 + var_518_5
					end
				end

				arg_515_1.text_.text = var_518_9
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411127", "story_v_out_120411.awb") ~= 0 then
					local var_518_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411127", "story_v_out_120411.awb") / 1000

					if var_518_13 + var_518_5 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_13 + var_518_5
					end

					if var_518_8.prefab_name ~= "" and arg_515_1.actors_[var_518_8.prefab_name] ~= nil then
						local var_518_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_8.prefab_name].transform, "story_v_out_120411", "120411127", "story_v_out_120411.awb")

						arg_515_1:RecordAudio("120411127", var_518_14)
						arg_515_1:RecordAudio("120411127", var_518_14)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_120411", "120411127", "story_v_out_120411.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_120411", "120411127", "story_v_out_120411.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_15 = math.max(var_518_6, arg_515_1.talkMaxDuration)

			if var_518_5 <= arg_515_1.time_ and arg_515_1.time_ < var_518_5 + var_518_15 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_5) / var_518_15

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_5 + var_518_15 and arg_515_1.time_ < var_518_5 + var_518_15 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play120411128 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 120411128
		arg_519_1.duration_ = 8.533

		local var_519_0 = {
			zh = 6.7,
			ja = 8.533
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
				arg_519_0:Play120411129(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_522_1 = 0
			local var_522_2 = 0.7

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_3 = arg_519_1:FormatText(StoryNameCfg[389].name)

				arg_519_1.leftNameTxt_.text = var_522_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_4 = arg_519_1:GetWordFromCfg(120411128)
				local var_522_5 = arg_519_1:FormatText(var_522_4.content)

				arg_519_1.text_.text = var_522_5

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_6 = 28
				local var_522_7 = utf8.len(var_522_5)
				local var_522_8 = var_522_6 <= 0 and var_522_2 or var_522_2 * (var_522_7 / var_522_6)

				if var_522_8 > 0 and var_522_2 < var_522_8 then
					arg_519_1.talkMaxDuration = var_522_8

					if var_522_8 + var_522_1 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_8 + var_522_1
					end
				end

				arg_519_1.text_.text = var_522_5
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411128", "story_v_out_120411.awb") ~= 0 then
					local var_522_9 = manager.audio:GetVoiceLength("story_v_out_120411", "120411128", "story_v_out_120411.awb") / 1000

					if var_522_9 + var_522_1 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_9 + var_522_1
					end

					if var_522_4.prefab_name ~= "" and arg_519_1.actors_[var_522_4.prefab_name] ~= nil then
						local var_522_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_4.prefab_name].transform, "story_v_out_120411", "120411128", "story_v_out_120411.awb")

						arg_519_1:RecordAudio("120411128", var_522_10)
						arg_519_1:RecordAudio("120411128", var_522_10)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_120411", "120411128", "story_v_out_120411.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_120411", "120411128", "story_v_out_120411.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_11 = math.max(var_522_2, arg_519_1.talkMaxDuration)

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_11 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_1) / var_522_11

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_1 + var_522_11 and arg_519_1.time_ < var_522_1 + var_522_11 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play120411129 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 120411129
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play120411130(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1076ui_story"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and arg_523_1.var_.characterEffect1076ui_story == nil then
				arg_523_1.var_.characterEffect1076ui_story = var_526_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_526_2 = 0.2

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.characterEffect1076ui_story then
					local var_526_4 = Mathf.Lerp(0, 0.5, var_526_3)

					arg_523_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_523_1.var_.characterEffect1076ui_story.fillRatio = var_526_4
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and arg_523_1.var_.characterEffect1076ui_story then
				local var_526_5 = 0.5

				arg_523_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_523_1.var_.characterEffect1076ui_story.fillRatio = var_526_5
			end

			local var_526_6 = 0
			local var_526_7 = 0.15

			if var_526_6 < arg_523_1.time_ and arg_523_1.time_ <= var_526_6 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_8 = arg_523_1:FormatText(StoryNameCfg[7].name)

				arg_523_1.leftNameTxt_.text = var_526_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_9 = arg_523_1:GetWordFromCfg(120411129)
				local var_526_10 = arg_523_1:FormatText(var_526_9.content)

				arg_523_1.text_.text = var_526_10

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_11 = 6
				local var_526_12 = utf8.len(var_526_10)
				local var_526_13 = var_526_11 <= 0 and var_526_7 or var_526_7 * (var_526_12 / var_526_11)

				if var_526_13 > 0 and var_526_7 < var_526_13 then
					arg_523_1.talkMaxDuration = var_526_13

					if var_526_13 + var_526_6 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_13 + var_526_6
					end
				end

				arg_523_1.text_.text = var_526_10
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_14 = math.max(var_526_7, arg_523_1.talkMaxDuration)

			if var_526_6 <= arg_523_1.time_ and arg_523_1.time_ < var_526_6 + var_526_14 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_6) / var_526_14

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_6 + var_526_14 and arg_523_1.time_ < var_526_6 + var_526_14 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play120411130 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 120411130
		arg_527_1.duration_ = 1.266

		local var_527_0 = {
			zh = 0.999999999999,
			ja = 1.266
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
				arg_527_0:Play120411131(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["1076ui_story"]
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 and arg_527_1.var_.characterEffect1076ui_story == nil then
				arg_527_1.var_.characterEffect1076ui_story = var_530_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_530_2 = 0.2

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2

				if arg_527_1.var_.characterEffect1076ui_story then
					arg_527_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 and arg_527_1.var_.characterEffect1076ui_story then
				arg_527_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_530_4 = 0
			local var_530_5 = 0.05

			if var_530_4 < arg_527_1.time_ and arg_527_1.time_ <= var_530_4 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_6 = arg_527_1:FormatText(StoryNameCfg[389].name)

				arg_527_1.leftNameTxt_.text = var_530_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_7 = arg_527_1:GetWordFromCfg(120411130)
				local var_530_8 = arg_527_1:FormatText(var_530_7.content)

				arg_527_1.text_.text = var_530_8

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_9 = 2
				local var_530_10 = utf8.len(var_530_8)
				local var_530_11 = var_530_9 <= 0 and var_530_5 or var_530_5 * (var_530_10 / var_530_9)

				if var_530_11 > 0 and var_530_5 < var_530_11 then
					arg_527_1.talkMaxDuration = var_530_11

					if var_530_11 + var_530_4 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_11 + var_530_4
					end
				end

				arg_527_1.text_.text = var_530_8
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411130", "story_v_out_120411.awb") ~= 0 then
					local var_530_12 = manager.audio:GetVoiceLength("story_v_out_120411", "120411130", "story_v_out_120411.awb") / 1000

					if var_530_12 + var_530_4 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_12 + var_530_4
					end

					if var_530_7.prefab_name ~= "" and arg_527_1.actors_[var_530_7.prefab_name] ~= nil then
						local var_530_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_7.prefab_name].transform, "story_v_out_120411", "120411130", "story_v_out_120411.awb")

						arg_527_1:RecordAudio("120411130", var_530_13)
						arg_527_1:RecordAudio("120411130", var_530_13)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_out_120411", "120411130", "story_v_out_120411.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_out_120411", "120411130", "story_v_out_120411.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_14 = math.max(var_530_5, arg_527_1.talkMaxDuration)

			if var_530_4 <= arg_527_1.time_ and arg_527_1.time_ < var_530_4 + var_530_14 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_4) / var_530_14

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_4 + var_530_14 and arg_527_1.time_ < var_530_4 + var_530_14 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play120411131 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 120411131
		arg_531_1.duration_ = 5

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play120411132(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1076ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.characterEffect1076ui_story == nil then
				arg_531_1.var_.characterEffect1076ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.2

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1076ui_story then
					local var_534_4 = Mathf.Lerp(0, 0.5, var_534_3)

					arg_531_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_531_1.var_.characterEffect1076ui_story.fillRatio = var_534_4
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.characterEffect1076ui_story then
				local var_534_5 = 0.5

				arg_531_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_531_1.var_.characterEffect1076ui_story.fillRatio = var_534_5
			end

			local var_534_6 = 0
			local var_534_7 = 0.625

			if var_534_6 < arg_531_1.time_ and arg_531_1.time_ <= var_534_6 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_8 = arg_531_1:FormatText(StoryNameCfg[7].name)

				arg_531_1.leftNameTxt_.text = var_534_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_9 = arg_531_1:GetWordFromCfg(120411131)
				local var_534_10 = arg_531_1:FormatText(var_534_9.content)

				arg_531_1.text_.text = var_534_10

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_11 = 25
				local var_534_12 = utf8.len(var_534_10)
				local var_534_13 = var_534_11 <= 0 and var_534_7 or var_534_7 * (var_534_12 / var_534_11)

				if var_534_13 > 0 and var_534_7 < var_534_13 then
					arg_531_1.talkMaxDuration = var_534_13

					if var_534_13 + var_534_6 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_13 + var_534_6
					end
				end

				arg_531_1.text_.text = var_534_10
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_14 = math.max(var_534_7, arg_531_1.talkMaxDuration)

			if var_534_6 <= arg_531_1.time_ and arg_531_1.time_ < var_534_6 + var_534_14 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_6) / var_534_14

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_6 + var_534_14 and arg_531_1.time_ < var_534_6 + var_534_14 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play120411132 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 120411132
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play120411133(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1076ui_story"].transform
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				arg_535_1.var_.moveOldPos1076ui_story = var_538_0.localPosition
			end

			local var_538_2 = 0.001

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2
				local var_538_4 = Vector3.New(0, 100, 0)

				var_538_0.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos1076ui_story, var_538_4, var_538_3)

				local var_538_5 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_5.x, var_538_5.y, var_538_5.z)

				local var_538_6 = var_538_0.localEulerAngles

				var_538_6.z = 0
				var_538_6.x = 0
				var_538_0.localEulerAngles = var_538_6
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 then
				var_538_0.localPosition = Vector3.New(0, 100, 0)

				local var_538_7 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_7.x, var_538_7.y, var_538_7.z)

				local var_538_8 = var_538_0.localEulerAngles

				var_538_8.z = 0
				var_538_8.x = 0
				var_538_0.localEulerAngles = var_538_8
			end

			local var_538_9 = 0
			local var_538_10 = 1.325

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

				local var_538_11 = arg_535_1:GetWordFromCfg(120411132)
				local var_538_12 = arg_535_1:FormatText(var_538_11.content)

				arg_535_1.text_.text = var_538_12

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_13 = 53
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
	Play120411133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 120411133
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play120411134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 0.725

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

				local var_542_2 = arg_539_1:GetWordFromCfg(120411133)
				local var_542_3 = arg_539_1:FormatText(var_542_2.content)

				arg_539_1.text_.text = var_542_3

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_4 = 29
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
	Play120411134 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 120411134
		arg_543_1.duration_ = 5.2

		local var_543_0 = {
			zh = 3.133,
			ja = 5.2
		}
		local var_543_1 = manager.audio:GetLocalizationFlag()

		if var_543_0[var_543_1] ~= nil then
			arg_543_1.duration_ = var_543_0[var_543_1]
		end

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play120411135(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 0.4

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_2 = arg_543_1:FormatText(StoryNameCfg[397].name)

				arg_543_1.leftNameTxt_.text = var_546_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_3 = arg_543_1:GetWordFromCfg(120411134)
				local var_546_4 = arg_543_1:FormatText(var_546_3.content)

				arg_543_1.text_.text = var_546_4

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_5 = 16
				local var_546_6 = utf8.len(var_546_4)
				local var_546_7 = var_546_5 <= 0 and var_546_1 or var_546_1 * (var_546_6 / var_546_5)

				if var_546_7 > 0 and var_546_1 < var_546_7 then
					arg_543_1.talkMaxDuration = var_546_7

					if var_546_7 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_7 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_4
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411134", "story_v_out_120411.awb") ~= 0 then
					local var_546_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411134", "story_v_out_120411.awb") / 1000

					if var_546_8 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_8 + var_546_0
					end

					if var_546_3.prefab_name ~= "" and arg_543_1.actors_[var_546_3.prefab_name] ~= nil then
						local var_546_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_3.prefab_name].transform, "story_v_out_120411", "120411134", "story_v_out_120411.awb")

						arg_543_1:RecordAudio("120411134", var_546_9)
						arg_543_1:RecordAudio("120411134", var_546_9)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_120411", "120411134", "story_v_out_120411.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_120411", "120411134", "story_v_out_120411.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_10 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_10 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_10

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_10 and arg_543_1.time_ < var_546_0 + var_546_10 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play120411135 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 120411135
		arg_547_1.duration_ = 4.6

		local var_547_0 = {
			zh = 3.8,
			ja = 4.6
		}
		local var_547_1 = manager.audio:GetLocalizationFlag()

		if var_547_0[var_547_1] ~= nil then
			arg_547_1.duration_ = var_547_0[var_547_1]
		end

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play120411136(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.475

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[398].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(120411135)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 19
				local var_550_6 = utf8.len(var_550_4)
				local var_550_7 = var_550_5 <= 0 and var_550_1 or var_550_1 * (var_550_6 / var_550_5)

				if var_550_7 > 0 and var_550_1 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_4
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411135", "story_v_out_120411.awb") ~= 0 then
					local var_550_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411135", "story_v_out_120411.awb") / 1000

					if var_550_8 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_8 + var_550_0
					end

					if var_550_3.prefab_name ~= "" and arg_547_1.actors_[var_550_3.prefab_name] ~= nil then
						local var_550_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_3.prefab_name].transform, "story_v_out_120411", "120411135", "story_v_out_120411.awb")

						arg_547_1:RecordAudio("120411135", var_550_9)
						arg_547_1:RecordAudio("120411135", var_550_9)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_120411", "120411135", "story_v_out_120411.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_120411", "120411135", "story_v_out_120411.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_10 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_10 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_10

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_10 and arg_547_1.time_ < var_550_0 + var_550_10 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play120411136 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 120411136
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play120411137(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.85

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_2 = arg_551_1:GetWordFromCfg(120411136)
				local var_554_3 = arg_551_1:FormatText(var_554_2.content)

				arg_551_1.text_.text = var_554_3

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_4 = 34
				local var_554_5 = utf8.len(var_554_3)
				local var_554_6 = var_554_4 <= 0 and var_554_1 or var_554_1 * (var_554_5 / var_554_4)

				if var_554_6 > 0 and var_554_1 < var_554_6 then
					arg_551_1.talkMaxDuration = var_554_6

					if var_554_6 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_6 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_3
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_7 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_7 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_7

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_7 and arg_551_1.time_ < var_554_0 + var_554_7 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play120411137 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 120411137
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play120411138(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 1.575

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

				local var_558_2 = arg_555_1:GetWordFromCfg(120411137)
				local var_558_3 = arg_555_1:FormatText(var_558_2.content)

				arg_555_1.text_.text = var_558_3

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_4 = 63
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
	Play120411138 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 120411138
		arg_559_1.duration_ = 3.9

		local var_559_0 = {
			zh = 3.9,
			ja = 3.833
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
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play120411139(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = manager.ui.mainCamera.transform
			local var_562_1 = 1

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 then
				arg_559_1.var_.shakeOldPos = var_562_0.localPosition
			end

			local var_562_2 = 0.6

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / 0.066
				local var_562_4, var_562_5 = math.modf(var_562_3)

				var_562_0.localPosition = Vector3.New(var_562_5 * 0.13, var_562_5 * 0.13, var_562_5 * 0.13) + arg_559_1.var_.shakeOldPos
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 then
				var_562_0.localPosition = arg_559_1.var_.shakeOldPos
			end

			local var_562_6 = 0

			if var_562_6 < arg_559_1.time_ and arg_559_1.time_ <= var_562_6 + arg_562_0 then
				arg_559_1.allBtn_.enabled = false
			end

			local var_562_7 = 1.6

			if arg_559_1.time_ >= var_562_6 + var_562_7 and arg_559_1.time_ < var_562_6 + var_562_7 + arg_562_0 then
				arg_559_1.allBtn_.enabled = true
			end

			local var_562_8 = 0
			local var_562_9 = 0.5

			if var_562_8 < arg_559_1.time_ and arg_559_1.time_ <= var_562_8 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_10 = arg_559_1:FormatText(StoryNameCfg[379].name)

				arg_559_1.leftNameTxt_.text = var_562_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, true)
				arg_559_1.iconController_:SetSelectedState("hero")

				arg_559_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_11 = arg_559_1:GetWordFromCfg(120411138)
				local var_562_12 = arg_559_1:FormatText(var_562_11.content)

				arg_559_1.text_.text = var_562_12

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_13 = 20
				local var_562_14 = utf8.len(var_562_12)
				local var_562_15 = var_562_13 <= 0 and var_562_9 or var_562_9 * (var_562_14 / var_562_13)

				if var_562_15 > 0 and var_562_9 < var_562_15 then
					arg_559_1.talkMaxDuration = var_562_15

					if var_562_15 + var_562_8 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_15 + var_562_8
					end
				end

				arg_559_1.text_.text = var_562_12
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411138", "story_v_out_120411.awb") ~= 0 then
					local var_562_16 = manager.audio:GetVoiceLength("story_v_out_120411", "120411138", "story_v_out_120411.awb") / 1000

					if var_562_16 + var_562_8 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_16 + var_562_8
					end

					if var_562_11.prefab_name ~= "" and arg_559_1.actors_[var_562_11.prefab_name] ~= nil then
						local var_562_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_11.prefab_name].transform, "story_v_out_120411", "120411138", "story_v_out_120411.awb")

						arg_559_1:RecordAudio("120411138", var_562_17)
						arg_559_1:RecordAudio("120411138", var_562_17)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_out_120411", "120411138", "story_v_out_120411.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_out_120411", "120411138", "story_v_out_120411.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_18 = math.max(var_562_9, arg_559_1.talkMaxDuration)

			if var_562_8 <= arg_559_1.time_ and arg_559_1.time_ < var_562_8 + var_562_18 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_8) / var_562_18

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_8 + var_562_18 and arg_559_1.time_ < var_562_8 + var_562_18 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play120411139 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 120411139
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play120411140(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 1.25

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_2 = arg_563_1:GetWordFromCfg(120411139)
				local var_566_3 = arg_563_1:FormatText(var_566_2.content)

				arg_563_1.text_.text = var_566_3

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_4 = 50
				local var_566_5 = utf8.len(var_566_3)
				local var_566_6 = var_566_4 <= 0 and var_566_1 or var_566_1 * (var_566_5 / var_566_4)

				if var_566_6 > 0 and var_566_1 < var_566_6 then
					arg_563_1.talkMaxDuration = var_566_6

					if var_566_6 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_6 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_3
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_7 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_7 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_7

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_7 and arg_563_1.time_ < var_566_0 + var_566_7 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play120411140 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 120411140
		arg_567_1.duration_ = 2.166

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play120411141(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["1069ui_story"].transform
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 then
				arg_567_1.var_.moveOldPos1069ui_story = var_570_0.localPosition
			end

			local var_570_2 = 0.001

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2
				local var_570_4 = Vector3.New(0, -1, -6)

				var_570_0.localPosition = Vector3.Lerp(arg_567_1.var_.moveOldPos1069ui_story, var_570_4, var_570_3)

				local var_570_5 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_5.x, var_570_5.y, var_570_5.z)

				local var_570_6 = var_570_0.localEulerAngles

				var_570_6.z = 0
				var_570_6.x = 0
				var_570_0.localEulerAngles = var_570_6
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 then
				var_570_0.localPosition = Vector3.New(0, -1, -6)

				local var_570_7 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_7.x, var_570_7.y, var_570_7.z)

				local var_570_8 = var_570_0.localEulerAngles

				var_570_8.z = 0
				var_570_8.x = 0
				var_570_0.localEulerAngles = var_570_8
			end

			local var_570_9 = 0.6
			local var_570_10 = 0.266666666666667

			if var_570_9 < arg_567_1.time_ and arg_567_1.time_ <= var_570_9 + arg_570_0 then
				local var_570_11 = "play"
				local var_570_12 = "effect"

				arg_567_1:AudioAction(var_570_11, var_570_12, "se_story_120_04", "se_story_120_04_porcelain_break", "")
			end

			local var_570_13 = arg_567_1.actors_["1069ui_story"]
			local var_570_14 = 0

			if var_570_14 < arg_567_1.time_ and arg_567_1.time_ <= var_570_14 + arg_570_0 and arg_567_1.var_.characterEffect1069ui_story == nil then
				arg_567_1.var_.characterEffect1069ui_story = var_570_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_570_15 = 0.2

			if var_570_14 <= arg_567_1.time_ and arg_567_1.time_ < var_570_14 + var_570_15 then
				local var_570_16 = (arg_567_1.time_ - var_570_14) / var_570_15

				if arg_567_1.var_.characterEffect1069ui_story then
					arg_567_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_567_1.time_ >= var_570_14 + var_570_15 and arg_567_1.time_ < var_570_14 + var_570_15 + arg_570_0 and arg_567_1.var_.characterEffect1069ui_story then
				arg_567_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_570_17 = 0

			if var_570_17 < arg_567_1.time_ and arg_567_1.time_ <= var_570_17 + arg_570_0 then
				arg_567_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action5_1")
			end

			local var_570_18 = 0
			local var_570_19 = 0.2

			if var_570_18 < arg_567_1.time_ and arg_567_1.time_ <= var_570_18 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_20 = arg_567_1:FormatText(StoryNameCfg[378].name)

				arg_567_1.leftNameTxt_.text = var_570_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_21 = arg_567_1:GetWordFromCfg(120411140)
				local var_570_22 = arg_567_1:FormatText(var_570_21.content)

				arg_567_1.text_.text = var_570_22

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_23 = 8
				local var_570_24 = utf8.len(var_570_22)
				local var_570_25 = var_570_23 <= 0 and var_570_19 or var_570_19 * (var_570_24 / var_570_23)

				if var_570_25 > 0 and var_570_19 < var_570_25 then
					arg_567_1.talkMaxDuration = var_570_25

					if var_570_25 + var_570_18 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_25 + var_570_18
					end
				end

				arg_567_1.text_.text = var_570_22
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411140", "story_v_out_120411.awb") ~= 0 then
					local var_570_26 = manager.audio:GetVoiceLength("story_v_out_120411", "120411140", "story_v_out_120411.awb") / 1000

					if var_570_26 + var_570_18 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_26 + var_570_18
					end

					if var_570_21.prefab_name ~= "" and arg_567_1.actors_[var_570_21.prefab_name] ~= nil then
						local var_570_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_21.prefab_name].transform, "story_v_out_120411", "120411140", "story_v_out_120411.awb")

						arg_567_1:RecordAudio("120411140", var_570_27)
						arg_567_1:RecordAudio("120411140", var_570_27)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_out_120411", "120411140", "story_v_out_120411.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_out_120411", "120411140", "story_v_out_120411.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_28 = math.max(var_570_19, arg_567_1.talkMaxDuration)

			if var_570_18 <= arg_567_1.time_ and arg_567_1.time_ < var_570_18 + var_570_28 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_18) / var_570_28

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_18 + var_570_28 and arg_567_1.time_ < var_570_18 + var_570_28 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play120411141 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 120411141
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play120411142(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1069ui_story"].transform
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 then
				arg_571_1.var_.moveOldPos1069ui_story = var_574_0.localPosition
			end

			local var_574_2 = 0.001

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2
				local var_574_4 = Vector3.New(0, 100, 0)

				var_574_0.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1069ui_story, var_574_4, var_574_3)

				local var_574_5 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_5.x, var_574_5.y, var_574_5.z)

				local var_574_6 = var_574_0.localEulerAngles

				var_574_6.z = 0
				var_574_6.x = 0
				var_574_0.localEulerAngles = var_574_6
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 then
				var_574_0.localPosition = Vector3.New(0, 100, 0)

				local var_574_7 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_7.x, var_574_7.y, var_574_7.z)

				local var_574_8 = var_574_0.localEulerAngles

				var_574_8.z = 0
				var_574_8.x = 0
				var_574_0.localEulerAngles = var_574_8
			end

			local var_574_9 = 0
			local var_574_10 = 1.65

			if var_574_9 < arg_571_1.time_ and arg_571_1.time_ <= var_574_9 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_11 = arg_571_1:GetWordFromCfg(120411141)
				local var_574_12 = arg_571_1:FormatText(var_574_11.content)

				arg_571_1.text_.text = var_574_12

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_13 = 66
				local var_574_14 = utf8.len(var_574_12)
				local var_574_15 = var_574_13 <= 0 and var_574_10 or var_574_10 * (var_574_14 / var_574_13)

				if var_574_15 > 0 and var_574_10 < var_574_15 then
					arg_571_1.talkMaxDuration = var_574_15

					if var_574_15 + var_574_9 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_15 + var_574_9
					end
				end

				arg_571_1.text_.text = var_574_12
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_16 = math.max(var_574_10, arg_571_1.talkMaxDuration)

			if var_574_9 <= arg_571_1.time_ and arg_571_1.time_ < var_574_9 + var_574_16 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_9) / var_574_16

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_9 + var_574_16 and arg_571_1.time_ < var_574_9 + var_574_16 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play120411142 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 120411142
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play120411143(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = 0
			local var_578_1 = 1.075

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

				local var_578_2 = arg_575_1:GetWordFromCfg(120411142)
				local var_578_3 = arg_575_1:FormatText(var_578_2.content)

				arg_575_1.text_.text = var_578_3

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_4 = 43
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
	Play120411143 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 120411143
		arg_579_1.duration_ = 4.733

		local var_579_0 = {
			zh = 4.733,
			ja = 3.266
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
				arg_579_0:Play120411144(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = "1072ui_story"

			if arg_579_1.actors_[var_582_0] == nil then
				local var_582_1 = Object.Instantiate(Asset.Load("Char/" .. var_582_0), arg_579_1.stage_.transform)

				var_582_1.name = var_582_0
				var_582_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_579_1.actors_[var_582_0] = var_582_1

				local var_582_2 = var_582_1:GetComponentInChildren(typeof(CharacterEffect))

				var_582_2.enabled = true

				local var_582_3 = GameObjectTools.GetOrAddComponent(var_582_1, typeof(DynamicBoneHelper))

				if var_582_3 then
					var_582_3:EnableDynamicBone(false)
				end

				arg_579_1:ShowWeapon(var_582_2.transform, false)

				arg_579_1.var_[var_582_0 .. "Animator"] = var_582_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_579_1.var_[var_582_0 .. "Animator"].applyRootMotion = true
				arg_579_1.var_[var_582_0 .. "LipSync"] = var_582_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_582_4 = arg_579_1.actors_["1072ui_story"].transform
			local var_582_5 = 0

			if var_582_5 < arg_579_1.time_ and arg_579_1.time_ <= var_582_5 + arg_582_0 then
				arg_579_1.var_.moveOldPos1072ui_story = var_582_4.localPosition
			end

			local var_582_6 = 0.001

			if var_582_5 <= arg_579_1.time_ and arg_579_1.time_ < var_582_5 + var_582_6 then
				local var_582_7 = (arg_579_1.time_ - var_582_5) / var_582_6
				local var_582_8 = Vector3.New(0, -0.71, -6)

				var_582_4.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos1072ui_story, var_582_8, var_582_7)

				local var_582_9 = manager.ui.mainCamera.transform.position - var_582_4.position

				var_582_4.forward = Vector3.New(var_582_9.x, var_582_9.y, var_582_9.z)

				local var_582_10 = var_582_4.localEulerAngles

				var_582_10.z = 0
				var_582_10.x = 0
				var_582_4.localEulerAngles = var_582_10
			end

			if arg_579_1.time_ >= var_582_5 + var_582_6 and arg_579_1.time_ < var_582_5 + var_582_6 + arg_582_0 then
				var_582_4.localPosition = Vector3.New(0, -0.71, -6)

				local var_582_11 = manager.ui.mainCamera.transform.position - var_582_4.position

				var_582_4.forward = Vector3.New(var_582_11.x, var_582_11.y, var_582_11.z)

				local var_582_12 = var_582_4.localEulerAngles

				var_582_12.z = 0
				var_582_12.x = 0
				var_582_4.localEulerAngles = var_582_12
			end

			local var_582_13 = 0

			if var_582_13 < arg_579_1.time_ and arg_579_1.time_ <= var_582_13 + arg_582_0 then
				arg_579_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action8_1")
			end

			local var_582_14 = 0

			if var_582_14 < arg_579_1.time_ and arg_579_1.time_ <= var_582_14 + arg_582_0 then
				arg_579_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_582_15 = arg_579_1.actors_["1072ui_story"]
			local var_582_16 = 0

			if var_582_16 < arg_579_1.time_ and arg_579_1.time_ <= var_582_16 + arg_582_0 and arg_579_1.var_.characterEffect1072ui_story == nil then
				arg_579_1.var_.characterEffect1072ui_story = var_582_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_17 = 0.2

			if var_582_16 <= arg_579_1.time_ and arg_579_1.time_ < var_582_16 + var_582_17 then
				local var_582_18 = (arg_579_1.time_ - var_582_16) / var_582_17

				if arg_579_1.var_.characterEffect1072ui_story then
					arg_579_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_16 + var_582_17 and arg_579_1.time_ < var_582_16 + var_582_17 + arg_582_0 and arg_579_1.var_.characterEffect1072ui_story then
				arg_579_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_582_19 = 0
			local var_582_20 = 0.2

			if var_582_19 < arg_579_1.time_ and arg_579_1.time_ <= var_582_19 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_21 = arg_579_1:FormatText(StoryNameCfg[379].name)

				arg_579_1.leftNameTxt_.text = var_582_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_22 = arg_579_1:GetWordFromCfg(120411143)
				local var_582_23 = arg_579_1:FormatText(var_582_22.content)

				arg_579_1.text_.text = var_582_23

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_24 = 8
				local var_582_25 = utf8.len(var_582_23)
				local var_582_26 = var_582_24 <= 0 and var_582_20 or var_582_20 * (var_582_25 / var_582_24)

				if var_582_26 > 0 and var_582_20 < var_582_26 then
					arg_579_1.talkMaxDuration = var_582_26

					if var_582_26 + var_582_19 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_26 + var_582_19
					end
				end

				arg_579_1.text_.text = var_582_23
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411143", "story_v_out_120411.awb") ~= 0 then
					local var_582_27 = manager.audio:GetVoiceLength("story_v_out_120411", "120411143", "story_v_out_120411.awb") / 1000

					if var_582_27 + var_582_19 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_27 + var_582_19
					end

					if var_582_22.prefab_name ~= "" and arg_579_1.actors_[var_582_22.prefab_name] ~= nil then
						local var_582_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_22.prefab_name].transform, "story_v_out_120411", "120411143", "story_v_out_120411.awb")

						arg_579_1:RecordAudio("120411143", var_582_28)
						arg_579_1:RecordAudio("120411143", var_582_28)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_out_120411", "120411143", "story_v_out_120411.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_out_120411", "120411143", "story_v_out_120411.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_29 = math.max(var_582_20, arg_579_1.talkMaxDuration)

			if var_582_19 <= arg_579_1.time_ and arg_579_1.time_ < var_582_19 + var_582_29 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_19) / var_582_29

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_19 + var_582_29 and arg_579_1.time_ < var_582_19 + var_582_29 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play120411144 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 120411144
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play120411145(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1072ui_story"]
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 and arg_583_1.var_.characterEffect1072ui_story == nil then
				arg_583_1.var_.characterEffect1072ui_story = var_586_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_2 = 0.2

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2

				if arg_583_1.var_.characterEffect1072ui_story then
					local var_586_4 = Mathf.Lerp(0, 0.5, var_586_3)

					arg_583_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_583_1.var_.characterEffect1072ui_story.fillRatio = var_586_4
				end
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 and arg_583_1.var_.characterEffect1072ui_story then
				local var_586_5 = 0.5

				arg_583_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_583_1.var_.characterEffect1072ui_story.fillRatio = var_586_5
			end

			local var_586_6 = 0
			local var_586_7 = 0.825

			if var_586_6 < arg_583_1.time_ and arg_583_1.time_ <= var_586_6 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, false)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_8 = arg_583_1:GetWordFromCfg(120411144)
				local var_586_9 = arg_583_1:FormatText(var_586_8.content)

				arg_583_1.text_.text = var_586_9

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_10 = 33
				local var_586_11 = utf8.len(var_586_9)
				local var_586_12 = var_586_10 <= 0 and var_586_7 or var_586_7 * (var_586_11 / var_586_10)

				if var_586_12 > 0 and var_586_7 < var_586_12 then
					arg_583_1.talkMaxDuration = var_586_12

					if var_586_12 + var_586_6 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_12 + var_586_6
					end
				end

				arg_583_1.text_.text = var_586_9
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_13 = math.max(var_586_7, arg_583_1.talkMaxDuration)

			if var_586_6 <= arg_583_1.time_ and arg_583_1.time_ < var_586_6 + var_586_13 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_6) / var_586_13

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_6 + var_586_13 and arg_583_1.time_ < var_586_6 + var_586_13 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play120411145 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 120411145
		arg_587_1.duration_ = 5

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play120411146(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = 0
			local var_590_1 = 0.65

			if var_590_0 < arg_587_1.time_ and arg_587_1.time_ <= var_590_0 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, false)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_2 = arg_587_1:GetWordFromCfg(120411145)
				local var_590_3 = arg_587_1:FormatText(var_590_2.content)

				arg_587_1.text_.text = var_590_3

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_4 = 26
				local var_590_5 = utf8.len(var_590_3)
				local var_590_6 = var_590_4 <= 0 and var_590_1 or var_590_1 * (var_590_5 / var_590_4)

				if var_590_6 > 0 and var_590_1 < var_590_6 then
					arg_587_1.talkMaxDuration = var_590_6

					if var_590_6 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_6 + var_590_0
					end
				end

				arg_587_1.text_.text = var_590_3
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)
				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_7 = math.max(var_590_1, arg_587_1.talkMaxDuration)

			if var_590_0 <= arg_587_1.time_ and arg_587_1.time_ < var_590_0 + var_590_7 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_0) / var_590_7

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_0 + var_590_7 and arg_587_1.time_ < var_590_0 + var_590_7 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play120411146 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 120411146
		arg_591_1.duration_ = 7.8

		local var_591_0 = {
			zh = 7.8,
			ja = 6.8
		}
		local var_591_1 = manager.audio:GetLocalizationFlag()

		if var_591_0[var_591_1] ~= nil then
			arg_591_1.duration_ = var_591_0[var_591_1]
		end

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play120411147(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["1072ui_story"].transform
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 then
				arg_591_1.var_.moveOldPos1072ui_story = var_594_0.localPosition
			end

			local var_594_2 = 0.001

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2
				local var_594_4 = Vector3.New(0, 100, 0)

				var_594_0.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1072ui_story, var_594_4, var_594_3)

				local var_594_5 = manager.ui.mainCamera.transform.position - var_594_0.position

				var_594_0.forward = Vector3.New(var_594_5.x, var_594_5.y, var_594_5.z)

				local var_594_6 = var_594_0.localEulerAngles

				var_594_6.z = 0
				var_594_6.x = 0
				var_594_0.localEulerAngles = var_594_6
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 then
				var_594_0.localPosition = Vector3.New(0, 100, 0)

				local var_594_7 = manager.ui.mainCamera.transform.position - var_594_0.position

				var_594_0.forward = Vector3.New(var_594_7.x, var_594_7.y, var_594_7.z)

				local var_594_8 = var_594_0.localEulerAngles

				var_594_8.z = 0
				var_594_8.x = 0
				var_594_0.localEulerAngles = var_594_8
			end

			local var_594_9 = 0

			if var_594_9 < arg_591_1.time_ and arg_591_1.time_ <= var_594_9 + arg_594_0 then
				arg_591_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_1")
			end

			local var_594_10 = arg_591_1.actors_["1071ui_story"]
			local var_594_11 = 0

			if var_594_11 < arg_591_1.time_ and arg_591_1.time_ <= var_594_11 + arg_594_0 and arg_591_1.var_.characterEffect1071ui_story == nil then
				arg_591_1.var_.characterEffect1071ui_story = var_594_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_12 = 0.2

			if var_594_11 <= arg_591_1.time_ and arg_591_1.time_ < var_594_11 + var_594_12 then
				local var_594_13 = (arg_591_1.time_ - var_594_11) / var_594_12

				if arg_591_1.var_.characterEffect1071ui_story then
					arg_591_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_591_1.time_ >= var_594_11 + var_594_12 and arg_591_1.time_ < var_594_11 + var_594_12 + arg_594_0 and arg_591_1.var_.characterEffect1071ui_story then
				arg_591_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_594_14 = arg_591_1.actors_["1071ui_story"].transform
			local var_594_15 = 0

			if var_594_15 < arg_591_1.time_ and arg_591_1.time_ <= var_594_15 + arg_594_0 then
				arg_591_1.var_.moveOldPos1071ui_story = var_594_14.localPosition
			end

			local var_594_16 = 0.001

			if var_594_15 <= arg_591_1.time_ and arg_591_1.time_ < var_594_15 + var_594_16 then
				local var_594_17 = (arg_591_1.time_ - var_594_15) / var_594_16
				local var_594_18 = Vector3.New(-0.7, -1.05, -6.2)

				var_594_14.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1071ui_story, var_594_18, var_594_17)

				local var_594_19 = manager.ui.mainCamera.transform.position - var_594_14.position

				var_594_14.forward = Vector3.New(var_594_19.x, var_594_19.y, var_594_19.z)

				local var_594_20 = var_594_14.localEulerAngles

				var_594_20.z = 0
				var_594_20.x = 0
				var_594_14.localEulerAngles = var_594_20
			end

			if arg_591_1.time_ >= var_594_15 + var_594_16 and arg_591_1.time_ < var_594_15 + var_594_16 + arg_594_0 then
				var_594_14.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_594_21 = manager.ui.mainCamera.transform.position - var_594_14.position

				var_594_14.forward = Vector3.New(var_594_21.x, var_594_21.y, var_594_21.z)

				local var_594_22 = var_594_14.localEulerAngles

				var_594_22.z = 0
				var_594_22.x = 0
				var_594_14.localEulerAngles = var_594_22
			end

			local var_594_23 = 0
			local var_594_24 = 0.625

			if var_594_23 < arg_591_1.time_ and arg_591_1.time_ <= var_594_23 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_25 = arg_591_1:FormatText(StoryNameCfg[384].name)

				arg_591_1.leftNameTxt_.text = var_594_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_26 = arg_591_1:GetWordFromCfg(120411146)
				local var_594_27 = arg_591_1:FormatText(var_594_26.content)

				arg_591_1.text_.text = var_594_27

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_28 = 25
				local var_594_29 = utf8.len(var_594_27)
				local var_594_30 = var_594_28 <= 0 and var_594_24 or var_594_24 * (var_594_29 / var_594_28)

				if var_594_30 > 0 and var_594_24 < var_594_30 then
					arg_591_1.talkMaxDuration = var_594_30

					if var_594_30 + var_594_23 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_30 + var_594_23
					end
				end

				arg_591_1.text_.text = var_594_27
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411146", "story_v_out_120411.awb") ~= 0 then
					local var_594_31 = manager.audio:GetVoiceLength("story_v_out_120411", "120411146", "story_v_out_120411.awb") / 1000

					if var_594_31 + var_594_23 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_31 + var_594_23
					end

					if var_594_26.prefab_name ~= "" and arg_591_1.actors_[var_594_26.prefab_name] ~= nil then
						local var_594_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_26.prefab_name].transform, "story_v_out_120411", "120411146", "story_v_out_120411.awb")

						arg_591_1:RecordAudio("120411146", var_594_32)
						arg_591_1:RecordAudio("120411146", var_594_32)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_out_120411", "120411146", "story_v_out_120411.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_out_120411", "120411146", "story_v_out_120411.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_33 = math.max(var_594_24, arg_591_1.talkMaxDuration)

			if var_594_23 <= arg_591_1.time_ and arg_591_1.time_ < var_594_23 + var_594_33 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_23) / var_594_33

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_23 + var_594_33 and arg_591_1.time_ < var_594_23 + var_594_33 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play120411147 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 120411147
		arg_595_1.duration_ = 5.3

		local var_595_0 = {
			zh = 2.4,
			ja = 5.3
		}
		local var_595_1 = manager.audio:GetLocalizationFlag()

		if var_595_0[var_595_1] ~= nil then
			arg_595_1.duration_ = var_595_0[var_595_1]
		end

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play120411148(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1071ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect1071ui_story == nil then
				arg_595_1.var_.characterEffect1071ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.2

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1071ui_story then
					local var_598_4 = Mathf.Lerp(0, 0.5, var_598_3)

					arg_595_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_595_1.var_.characterEffect1071ui_story.fillRatio = var_598_4
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect1071ui_story then
				local var_598_5 = 0.5

				arg_595_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_595_1.var_.characterEffect1071ui_story.fillRatio = var_598_5
			end

			local var_598_6 = arg_595_1.actors_["1069ui_story"].transform
			local var_598_7 = 0

			if var_598_7 < arg_595_1.time_ and arg_595_1.time_ <= var_598_7 + arg_598_0 then
				arg_595_1.var_.moveOldPos1069ui_story = var_598_6.localPosition
			end

			local var_598_8 = 0.001

			if var_598_7 <= arg_595_1.time_ and arg_595_1.time_ < var_598_7 + var_598_8 then
				local var_598_9 = (arg_595_1.time_ - var_598_7) / var_598_8
				local var_598_10 = Vector3.New(0.7, -1, -6)

				var_598_6.localPosition = Vector3.Lerp(arg_595_1.var_.moveOldPos1069ui_story, var_598_10, var_598_9)

				local var_598_11 = manager.ui.mainCamera.transform.position - var_598_6.position

				var_598_6.forward = Vector3.New(var_598_11.x, var_598_11.y, var_598_11.z)

				local var_598_12 = var_598_6.localEulerAngles

				var_598_12.z = 0
				var_598_12.x = 0
				var_598_6.localEulerAngles = var_598_12
			end

			if arg_595_1.time_ >= var_598_7 + var_598_8 and arg_595_1.time_ < var_598_7 + var_598_8 + arg_598_0 then
				var_598_6.localPosition = Vector3.New(0.7, -1, -6)

				local var_598_13 = manager.ui.mainCamera.transform.position - var_598_6.position

				var_598_6.forward = Vector3.New(var_598_13.x, var_598_13.y, var_598_13.z)

				local var_598_14 = var_598_6.localEulerAngles

				var_598_14.z = 0
				var_598_14.x = 0
				var_598_6.localEulerAngles = var_598_14
			end

			local var_598_15 = arg_595_1.actors_["1069ui_story"]
			local var_598_16 = 0

			if var_598_16 < arg_595_1.time_ and arg_595_1.time_ <= var_598_16 + arg_598_0 and arg_595_1.var_.characterEffect1069ui_story == nil then
				arg_595_1.var_.characterEffect1069ui_story = var_598_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_17 = 0.2

			if var_598_16 <= arg_595_1.time_ and arg_595_1.time_ < var_598_16 + var_598_17 then
				local var_598_18 = (arg_595_1.time_ - var_598_16) / var_598_17

				if arg_595_1.var_.characterEffect1069ui_story then
					arg_595_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_595_1.time_ >= var_598_16 + var_598_17 and arg_595_1.time_ < var_598_16 + var_598_17 + arg_598_0 and arg_595_1.var_.characterEffect1069ui_story then
				arg_595_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_598_19 = 0

			if var_598_19 < arg_595_1.time_ and arg_595_1.time_ <= var_598_19 + arg_598_0 then
				arg_595_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_598_20 = 0

			if var_598_20 < arg_595_1.time_ and arg_595_1.time_ <= var_598_20 + arg_598_0 then
				arg_595_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_598_21 = 0
			local var_598_22 = 0.2

			if var_598_21 < arg_595_1.time_ and arg_595_1.time_ <= var_598_21 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_23 = arg_595_1:FormatText(StoryNameCfg[378].name)

				arg_595_1.leftNameTxt_.text = var_598_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_24 = arg_595_1:GetWordFromCfg(120411147)
				local var_598_25 = arg_595_1:FormatText(var_598_24.content)

				arg_595_1.text_.text = var_598_25

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_26 = 8
				local var_598_27 = utf8.len(var_598_25)
				local var_598_28 = var_598_26 <= 0 and var_598_22 or var_598_22 * (var_598_27 / var_598_26)

				if var_598_28 > 0 and var_598_22 < var_598_28 then
					arg_595_1.talkMaxDuration = var_598_28

					if var_598_28 + var_598_21 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_28 + var_598_21
					end
				end

				arg_595_1.text_.text = var_598_25
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411147", "story_v_out_120411.awb") ~= 0 then
					local var_598_29 = manager.audio:GetVoiceLength("story_v_out_120411", "120411147", "story_v_out_120411.awb") / 1000

					if var_598_29 + var_598_21 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_29 + var_598_21
					end

					if var_598_24.prefab_name ~= "" and arg_595_1.actors_[var_598_24.prefab_name] ~= nil then
						local var_598_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_24.prefab_name].transform, "story_v_out_120411", "120411147", "story_v_out_120411.awb")

						arg_595_1:RecordAudio("120411147", var_598_30)
						arg_595_1:RecordAudio("120411147", var_598_30)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_out_120411", "120411147", "story_v_out_120411.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_out_120411", "120411147", "story_v_out_120411.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_31 = math.max(var_598_22, arg_595_1.talkMaxDuration)

			if var_598_21 <= arg_595_1.time_ and arg_595_1.time_ < var_598_21 + var_598_31 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_21) / var_598_31

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_21 + var_598_31 and arg_595_1.time_ < var_598_21 + var_598_31 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play120411148 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 120411148
		arg_599_1.duration_ = 10.2

		local var_599_0 = {
			zh = 8.633,
			ja = 10.2
		}
		local var_599_1 = manager.audio:GetLocalizationFlag()

		if var_599_0[var_599_1] ~= nil then
			arg_599_1.duration_ = var_599_0[var_599_1]
		end

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play120411149(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1069ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and arg_599_1.var_.characterEffect1069ui_story == nil then
				arg_599_1.var_.characterEffect1069ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.2

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect1069ui_story then
					local var_602_4 = Mathf.Lerp(0, 0.5, var_602_3)

					arg_599_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_599_1.var_.characterEffect1069ui_story.fillRatio = var_602_4
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and arg_599_1.var_.characterEffect1069ui_story then
				local var_602_5 = 0.5

				arg_599_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_599_1.var_.characterEffect1069ui_story.fillRatio = var_602_5
			end

			local var_602_6 = 0

			if var_602_6 < arg_599_1.time_ and arg_599_1.time_ <= var_602_6 + arg_602_0 then
				arg_599_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_2")
			end

			local var_602_7 = arg_599_1.actors_["1071ui_story"]
			local var_602_8 = 0

			if var_602_8 < arg_599_1.time_ and arg_599_1.time_ <= var_602_8 + arg_602_0 and arg_599_1.var_.characterEffect1071ui_story == nil then
				arg_599_1.var_.characterEffect1071ui_story = var_602_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_9 = 0.2

			if var_602_8 <= arg_599_1.time_ and arg_599_1.time_ < var_602_8 + var_602_9 then
				local var_602_10 = (arg_599_1.time_ - var_602_8) / var_602_9

				if arg_599_1.var_.characterEffect1071ui_story then
					arg_599_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_599_1.time_ >= var_602_8 + var_602_9 and arg_599_1.time_ < var_602_8 + var_602_9 + arg_602_0 and arg_599_1.var_.characterEffect1071ui_story then
				arg_599_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_602_11 = 0
			local var_602_12 = 0.875

			if var_602_11 < arg_599_1.time_ and arg_599_1.time_ <= var_602_11 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_13 = arg_599_1:FormatText(StoryNameCfg[384].name)

				arg_599_1.leftNameTxt_.text = var_602_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_14 = arg_599_1:GetWordFromCfg(120411148)
				local var_602_15 = arg_599_1:FormatText(var_602_14.content)

				arg_599_1.text_.text = var_602_15

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_16 = 35
				local var_602_17 = utf8.len(var_602_15)
				local var_602_18 = var_602_16 <= 0 and var_602_12 or var_602_12 * (var_602_17 / var_602_16)

				if var_602_18 > 0 and var_602_12 < var_602_18 then
					arg_599_1.talkMaxDuration = var_602_18

					if var_602_18 + var_602_11 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_18 + var_602_11
					end
				end

				arg_599_1.text_.text = var_602_15
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411148", "story_v_out_120411.awb") ~= 0 then
					local var_602_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411148", "story_v_out_120411.awb") / 1000

					if var_602_19 + var_602_11 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_19 + var_602_11
					end

					if var_602_14.prefab_name ~= "" and arg_599_1.actors_[var_602_14.prefab_name] ~= nil then
						local var_602_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_14.prefab_name].transform, "story_v_out_120411", "120411148", "story_v_out_120411.awb")

						arg_599_1:RecordAudio("120411148", var_602_20)
						arg_599_1:RecordAudio("120411148", var_602_20)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_120411", "120411148", "story_v_out_120411.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_120411", "120411148", "story_v_out_120411.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_21 = math.max(var_602_12, arg_599_1.talkMaxDuration)

			if var_602_11 <= arg_599_1.time_ and arg_599_1.time_ < var_602_11 + var_602_21 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_11) / var_602_21

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_11 + var_602_21 and arg_599_1.time_ < var_602_11 + var_602_21 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play120411149 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 120411149
		arg_603_1.duration_ = 11.033

		local var_603_0 = {
			zh = 7.566,
			ja = 11.033
		}
		local var_603_1 = manager.audio:GetLocalizationFlag()

		if var_603_0[var_603_1] ~= nil then
			arg_603_1.duration_ = var_603_0[var_603_1]
		end

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play120411150(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.725

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[384].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(120411149)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 29
				local var_606_6 = utf8.len(var_606_4)
				local var_606_7 = var_606_5 <= 0 and var_606_1 or var_606_1 * (var_606_6 / var_606_5)

				if var_606_7 > 0 and var_606_1 < var_606_7 then
					arg_603_1.talkMaxDuration = var_606_7

					if var_606_7 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_7 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_4
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411149", "story_v_out_120411.awb") ~= 0 then
					local var_606_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411149", "story_v_out_120411.awb") / 1000

					if var_606_8 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_8 + var_606_0
					end

					if var_606_3.prefab_name ~= "" and arg_603_1.actors_[var_606_3.prefab_name] ~= nil then
						local var_606_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_3.prefab_name].transform, "story_v_out_120411", "120411149", "story_v_out_120411.awb")

						arg_603_1:RecordAudio("120411149", var_606_9)
						arg_603_1:RecordAudio("120411149", var_606_9)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_out_120411", "120411149", "story_v_out_120411.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_out_120411", "120411149", "story_v_out_120411.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_10 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_10 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_10

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_10 and arg_603_1.time_ < var_606_0 + var_606_10 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play120411150 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 120411150
		arg_607_1.duration_ = 1.999999999999

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play120411151(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1069ui_story"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and arg_607_1.var_.characterEffect1069ui_story == nil then
				arg_607_1.var_.characterEffect1069ui_story = var_610_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_2 = 0.2

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.characterEffect1069ui_story then
					local var_610_4 = Mathf.Lerp(0, 0.5, var_610_3)

					arg_607_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_607_1.var_.characterEffect1069ui_story.fillRatio = var_610_4
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and arg_607_1.var_.characterEffect1069ui_story then
				local var_610_5 = 0.5

				arg_607_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_607_1.var_.characterEffect1069ui_story.fillRatio = var_610_5
			end

			local var_610_6 = arg_607_1.actors_["1071ui_story"].transform
			local var_610_7 = 0

			if var_610_7 < arg_607_1.time_ and arg_607_1.time_ <= var_610_7 + arg_610_0 then
				arg_607_1.var_.moveOldPos1071ui_story = var_610_6.localPosition
			end

			local var_610_8 = 0.001

			if var_610_7 <= arg_607_1.time_ and arg_607_1.time_ < var_610_7 + var_610_8 then
				local var_610_9 = (arg_607_1.time_ - var_610_7) / var_610_8
				local var_610_10 = Vector3.New(0, 100, 0)

				var_610_6.localPosition = Vector3.Lerp(arg_607_1.var_.moveOldPos1071ui_story, var_610_10, var_610_9)

				local var_610_11 = manager.ui.mainCamera.transform.position - var_610_6.position

				var_610_6.forward = Vector3.New(var_610_11.x, var_610_11.y, var_610_11.z)

				local var_610_12 = var_610_6.localEulerAngles

				var_610_12.z = 0
				var_610_12.x = 0
				var_610_6.localEulerAngles = var_610_12
			end

			if arg_607_1.time_ >= var_610_7 + var_610_8 and arg_607_1.time_ < var_610_7 + var_610_8 + arg_610_0 then
				var_610_6.localPosition = Vector3.New(0, 100, 0)

				local var_610_13 = manager.ui.mainCamera.transform.position - var_610_6.position

				var_610_6.forward = Vector3.New(var_610_13.x, var_610_13.y, var_610_13.z)

				local var_610_14 = var_610_6.localEulerAngles

				var_610_14.z = 0
				var_610_14.x = 0
				var_610_6.localEulerAngles = var_610_14
			end

			local var_610_15 = arg_607_1.actors_["1069ui_story"].transform
			local var_610_16 = 0

			if var_610_16 < arg_607_1.time_ and arg_607_1.time_ <= var_610_16 + arg_610_0 then
				arg_607_1.var_.moveOldPos1069ui_story = var_610_15.localPosition
			end

			local var_610_17 = 0.001

			if var_610_16 <= arg_607_1.time_ and arg_607_1.time_ < var_610_16 + var_610_17 then
				local var_610_18 = (arg_607_1.time_ - var_610_16) / var_610_17
				local var_610_19 = Vector3.New(0, 100, 0)

				var_610_15.localPosition = Vector3.Lerp(arg_607_1.var_.moveOldPos1069ui_story, var_610_19, var_610_18)

				local var_610_20 = manager.ui.mainCamera.transform.position - var_610_15.position

				var_610_15.forward = Vector3.New(var_610_20.x, var_610_20.y, var_610_20.z)

				local var_610_21 = var_610_15.localEulerAngles

				var_610_21.z = 0
				var_610_21.x = 0
				var_610_15.localEulerAngles = var_610_21
			end

			if arg_607_1.time_ >= var_610_16 + var_610_17 and arg_607_1.time_ < var_610_16 + var_610_17 + arg_610_0 then
				var_610_15.localPosition = Vector3.New(0, 100, 0)

				local var_610_22 = manager.ui.mainCamera.transform.position - var_610_15.position

				var_610_15.forward = Vector3.New(var_610_22.x, var_610_22.y, var_610_22.z)

				local var_610_23 = var_610_15.localEulerAngles

				var_610_23.z = 0
				var_610_23.x = 0
				var_610_15.localEulerAngles = var_610_23
			end

			local var_610_24 = arg_607_1.actors_["1076ui_story"].transform
			local var_610_25 = 0

			if var_610_25 < arg_607_1.time_ and arg_607_1.time_ <= var_610_25 + arg_610_0 then
				arg_607_1.var_.moveOldPos1076ui_story = var_610_24.localPosition
			end

			local var_610_26 = 0.001

			if var_610_25 <= arg_607_1.time_ and arg_607_1.time_ < var_610_25 + var_610_26 then
				local var_610_27 = (arg_607_1.time_ - var_610_25) / var_610_26
				local var_610_28 = Vector3.New(0, -1.06, -6.2)

				var_610_24.localPosition = Vector3.Lerp(arg_607_1.var_.moveOldPos1076ui_story, var_610_28, var_610_27)

				local var_610_29 = manager.ui.mainCamera.transform.position - var_610_24.position

				var_610_24.forward = Vector3.New(var_610_29.x, var_610_29.y, var_610_29.z)

				local var_610_30 = var_610_24.localEulerAngles

				var_610_30.z = 0
				var_610_30.x = 0
				var_610_24.localEulerAngles = var_610_30
			end

			if arg_607_1.time_ >= var_610_25 + var_610_26 and arg_607_1.time_ < var_610_25 + var_610_26 + arg_610_0 then
				var_610_24.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_610_31 = manager.ui.mainCamera.transform.position - var_610_24.position

				var_610_24.forward = Vector3.New(var_610_31.x, var_610_31.y, var_610_31.z)

				local var_610_32 = var_610_24.localEulerAngles

				var_610_32.z = 0
				var_610_32.x = 0
				var_610_24.localEulerAngles = var_610_32
			end

			local var_610_33 = 0

			if var_610_33 < arg_607_1.time_ and arg_607_1.time_ <= var_610_33 + arg_610_0 then
				arg_607_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action6_1")
			end

			local var_610_34 = arg_607_1.actors_["1076ui_story"]
			local var_610_35 = 0

			if var_610_35 < arg_607_1.time_ and arg_607_1.time_ <= var_610_35 + arg_610_0 and arg_607_1.var_.characterEffect1076ui_story == nil then
				arg_607_1.var_.characterEffect1076ui_story = var_610_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_36 = 0.2

			if var_610_35 <= arg_607_1.time_ and arg_607_1.time_ < var_610_35 + var_610_36 then
				local var_610_37 = (arg_607_1.time_ - var_610_35) / var_610_36

				if arg_607_1.var_.characterEffect1076ui_story then
					arg_607_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_607_1.time_ >= var_610_35 + var_610_36 and arg_607_1.time_ < var_610_35 + var_610_36 + arg_610_0 and arg_607_1.var_.characterEffect1076ui_story then
				arg_607_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_610_38 = 0
			local var_610_39 = 0.05

			if var_610_38 < arg_607_1.time_ and arg_607_1.time_ <= var_610_38 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_40 = arg_607_1:FormatText(StoryNameCfg[389].name)

				arg_607_1.leftNameTxt_.text = var_610_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_41 = arg_607_1:GetWordFromCfg(120411150)
				local var_610_42 = arg_607_1:FormatText(var_610_41.content)

				arg_607_1.text_.text = var_610_42

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_43 = 2
				local var_610_44 = utf8.len(var_610_42)
				local var_610_45 = var_610_43 <= 0 and var_610_39 or var_610_39 * (var_610_44 / var_610_43)

				if var_610_45 > 0 and var_610_39 < var_610_45 then
					arg_607_1.talkMaxDuration = var_610_45

					if var_610_45 + var_610_38 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_45 + var_610_38
					end
				end

				arg_607_1.text_.text = var_610_42
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411150", "story_v_out_120411.awb") ~= 0 then
					local var_610_46 = manager.audio:GetVoiceLength("story_v_out_120411", "120411150", "story_v_out_120411.awb") / 1000

					if var_610_46 + var_610_38 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_46 + var_610_38
					end

					if var_610_41.prefab_name ~= "" and arg_607_1.actors_[var_610_41.prefab_name] ~= nil then
						local var_610_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_41.prefab_name].transform, "story_v_out_120411", "120411150", "story_v_out_120411.awb")

						arg_607_1:RecordAudio("120411150", var_610_47)
						arg_607_1:RecordAudio("120411150", var_610_47)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_120411", "120411150", "story_v_out_120411.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_120411", "120411150", "story_v_out_120411.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_48 = math.max(var_610_39, arg_607_1.talkMaxDuration)

			if var_610_38 <= arg_607_1.time_ and arg_607_1.time_ < var_610_38 + var_610_48 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_38) / var_610_48

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_38 + var_610_48 and arg_607_1.time_ < var_610_38 + var_610_48 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play120411151 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 120411151
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play120411152(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1076ui_story"].transform
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 then
				arg_611_1.var_.moveOldPos1076ui_story = var_614_0.localPosition
			end

			local var_614_2 = 0.001

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2
				local var_614_4 = Vector3.New(0, 100, 0)

				var_614_0.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1076ui_story, var_614_4, var_614_3)

				local var_614_5 = manager.ui.mainCamera.transform.position - var_614_0.position

				var_614_0.forward = Vector3.New(var_614_5.x, var_614_5.y, var_614_5.z)

				local var_614_6 = var_614_0.localEulerAngles

				var_614_6.z = 0
				var_614_6.x = 0
				var_614_0.localEulerAngles = var_614_6
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 then
				var_614_0.localPosition = Vector3.New(0, 100, 0)

				local var_614_7 = manager.ui.mainCamera.transform.position - var_614_0.position

				var_614_0.forward = Vector3.New(var_614_7.x, var_614_7.y, var_614_7.z)

				local var_614_8 = var_614_0.localEulerAngles

				var_614_8.z = 0
				var_614_8.x = 0
				var_614_0.localEulerAngles = var_614_8
			end

			local var_614_9 = 0
			local var_614_10 = 1.475

			if var_614_9 < arg_611_1.time_ and arg_611_1.time_ <= var_614_9 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_11 = arg_611_1:GetWordFromCfg(120411151)
				local var_614_12 = arg_611_1:FormatText(var_614_11.content)

				arg_611_1.text_.text = var_614_12

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_13 = 59
				local var_614_14 = utf8.len(var_614_12)
				local var_614_15 = var_614_13 <= 0 and var_614_10 or var_614_10 * (var_614_14 / var_614_13)

				if var_614_15 > 0 and var_614_10 < var_614_15 then
					arg_611_1.talkMaxDuration = var_614_15

					if var_614_15 + var_614_9 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_15 + var_614_9
					end
				end

				arg_611_1.text_.text = var_614_12
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_16 = math.max(var_614_10, arg_611_1.talkMaxDuration)

			if var_614_9 <= arg_611_1.time_ and arg_611_1.time_ < var_614_9 + var_614_16 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_9) / var_614_16

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_9 + var_614_16 and arg_611_1.time_ < var_614_9 + var_614_16 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play120411152 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 120411152
		arg_615_1.duration_ = 9.5

		local var_615_0 = {
			zh = 3.9,
			ja = 9.5
		}
		local var_615_1 = manager.audio:GetLocalizationFlag()

		if var_615_0[var_615_1] ~= nil then
			arg_615_1.duration_ = var_615_0[var_615_1]
		end

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play120411153(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = arg_615_1.actors_["1069ui_story"]
			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 and arg_615_1.var_.characterEffect1069ui_story == nil then
				arg_615_1.var_.characterEffect1069ui_story = var_618_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_2 = 0.2

			if var_618_1 <= arg_615_1.time_ and arg_615_1.time_ < var_618_1 + var_618_2 then
				local var_618_3 = (arg_615_1.time_ - var_618_1) / var_618_2

				if arg_615_1.var_.characterEffect1069ui_story then
					arg_615_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_615_1.time_ >= var_618_1 + var_618_2 and arg_615_1.time_ < var_618_1 + var_618_2 + arg_618_0 and arg_615_1.var_.characterEffect1069ui_story then
				arg_615_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_618_4 = arg_615_1.actors_["1071ui_story"].transform
			local var_618_5 = 0

			if var_618_5 < arg_615_1.time_ and arg_615_1.time_ <= var_618_5 + arg_618_0 then
				arg_615_1.var_.moveOldPos1071ui_story = var_618_4.localPosition
			end

			local var_618_6 = 0.001

			if var_618_5 <= arg_615_1.time_ and arg_615_1.time_ < var_618_5 + var_618_6 then
				local var_618_7 = (arg_615_1.time_ - var_618_5) / var_618_6
				local var_618_8 = Vector3.New(-0.7, -1.05, -6.2)

				var_618_4.localPosition = Vector3.Lerp(arg_615_1.var_.moveOldPos1071ui_story, var_618_8, var_618_7)

				local var_618_9 = manager.ui.mainCamera.transform.position - var_618_4.position

				var_618_4.forward = Vector3.New(var_618_9.x, var_618_9.y, var_618_9.z)

				local var_618_10 = var_618_4.localEulerAngles

				var_618_10.z = 0
				var_618_10.x = 0
				var_618_4.localEulerAngles = var_618_10
			end

			if arg_615_1.time_ >= var_618_5 + var_618_6 and arg_615_1.time_ < var_618_5 + var_618_6 + arg_618_0 then
				var_618_4.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_618_11 = manager.ui.mainCamera.transform.position - var_618_4.position

				var_618_4.forward = Vector3.New(var_618_11.x, var_618_11.y, var_618_11.z)

				local var_618_12 = var_618_4.localEulerAngles

				var_618_12.z = 0
				var_618_12.x = 0
				var_618_4.localEulerAngles = var_618_12
			end

			local var_618_13 = arg_615_1.actors_["1069ui_story"].transform
			local var_618_14 = 0

			if var_618_14 < arg_615_1.time_ and arg_615_1.time_ <= var_618_14 + arg_618_0 then
				arg_615_1.var_.moveOldPos1069ui_story = var_618_13.localPosition
			end

			local var_618_15 = 0.001

			if var_618_14 <= arg_615_1.time_ and arg_615_1.time_ < var_618_14 + var_618_15 then
				local var_618_16 = (arg_615_1.time_ - var_618_14) / var_618_15
				local var_618_17 = Vector3.New(0.7, -1, -6)

				var_618_13.localPosition = Vector3.Lerp(arg_615_1.var_.moveOldPos1069ui_story, var_618_17, var_618_16)

				local var_618_18 = manager.ui.mainCamera.transform.position - var_618_13.position

				var_618_13.forward = Vector3.New(var_618_18.x, var_618_18.y, var_618_18.z)

				local var_618_19 = var_618_13.localEulerAngles

				var_618_19.z = 0
				var_618_19.x = 0
				var_618_13.localEulerAngles = var_618_19
			end

			if arg_615_1.time_ >= var_618_14 + var_618_15 and arg_615_1.time_ < var_618_14 + var_618_15 + arg_618_0 then
				var_618_13.localPosition = Vector3.New(0.7, -1, -6)

				local var_618_20 = manager.ui.mainCamera.transform.position - var_618_13.position

				var_618_13.forward = Vector3.New(var_618_20.x, var_618_20.y, var_618_20.z)

				local var_618_21 = var_618_13.localEulerAngles

				var_618_21.z = 0
				var_618_21.x = 0
				var_618_13.localEulerAngles = var_618_21
			end

			local var_618_22 = arg_615_1.actors_["1071ui_story"]
			local var_618_23 = 0

			if var_618_23 < arg_615_1.time_ and arg_615_1.time_ <= var_618_23 + arg_618_0 and arg_615_1.var_.characterEffect1071ui_story == nil then
				arg_615_1.var_.characterEffect1071ui_story = var_618_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_24 = 0.0166666666666667

			if var_618_23 <= arg_615_1.time_ and arg_615_1.time_ < var_618_23 + var_618_24 then
				local var_618_25 = (arg_615_1.time_ - var_618_23) / var_618_24

				if arg_615_1.var_.characterEffect1071ui_story then
					local var_618_26 = Mathf.Lerp(0, 0.5, var_618_25)

					arg_615_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_615_1.var_.characterEffect1071ui_story.fillRatio = var_618_26
				end
			end

			if arg_615_1.time_ >= var_618_23 + var_618_24 and arg_615_1.time_ < var_618_23 + var_618_24 + arg_618_0 and arg_615_1.var_.characterEffect1071ui_story then
				local var_618_27 = 0.5

				arg_615_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_615_1.var_.characterEffect1071ui_story.fillRatio = var_618_27
			end

			local var_618_28 = 0
			local var_618_29 = 0.425

			if var_618_28 < arg_615_1.time_ and arg_615_1.time_ <= var_618_28 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_30 = arg_615_1:FormatText(StoryNameCfg[378].name)

				arg_615_1.leftNameTxt_.text = var_618_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_31 = arg_615_1:GetWordFromCfg(120411152)
				local var_618_32 = arg_615_1:FormatText(var_618_31.content)

				arg_615_1.text_.text = var_618_32

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_33 = 17
				local var_618_34 = utf8.len(var_618_32)
				local var_618_35 = var_618_33 <= 0 and var_618_29 or var_618_29 * (var_618_34 / var_618_33)

				if var_618_35 > 0 and var_618_29 < var_618_35 then
					arg_615_1.talkMaxDuration = var_618_35

					if var_618_35 + var_618_28 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_35 + var_618_28
					end
				end

				arg_615_1.text_.text = var_618_32
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411152", "story_v_out_120411.awb") ~= 0 then
					local var_618_36 = manager.audio:GetVoiceLength("story_v_out_120411", "120411152", "story_v_out_120411.awb") / 1000

					if var_618_36 + var_618_28 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_36 + var_618_28
					end

					if var_618_31.prefab_name ~= "" and arg_615_1.actors_[var_618_31.prefab_name] ~= nil then
						local var_618_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_31.prefab_name].transform, "story_v_out_120411", "120411152", "story_v_out_120411.awb")

						arg_615_1:RecordAudio("120411152", var_618_37)
						arg_615_1:RecordAudio("120411152", var_618_37)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_120411", "120411152", "story_v_out_120411.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_120411", "120411152", "story_v_out_120411.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_38 = math.max(var_618_29, arg_615_1.talkMaxDuration)

			if var_618_28 <= arg_615_1.time_ and arg_615_1.time_ < var_618_28 + var_618_38 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_28) / var_618_38

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_28 + var_618_38 and arg_615_1.time_ < var_618_28 + var_618_38 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play120411153 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 120411153
		arg_619_1.duration_ = 5.666

		local var_619_0 = {
			zh = 1.999999999999,
			ja = 5.666
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play120411154(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = arg_619_1.actors_["1071ui_story"].transform
			local var_622_1 = 0

			if var_622_1 < arg_619_1.time_ and arg_619_1.time_ <= var_622_1 + arg_622_0 then
				arg_619_1.var_.moveOldPos1071ui_story = var_622_0.localPosition
			end

			local var_622_2 = 0.001

			if var_622_1 <= arg_619_1.time_ and arg_619_1.time_ < var_622_1 + var_622_2 then
				local var_622_3 = (arg_619_1.time_ - var_622_1) / var_622_2
				local var_622_4 = Vector3.New(0, 100, 0)

				var_622_0.localPosition = Vector3.Lerp(arg_619_1.var_.moveOldPos1071ui_story, var_622_4, var_622_3)

				local var_622_5 = manager.ui.mainCamera.transform.position - var_622_0.position

				var_622_0.forward = Vector3.New(var_622_5.x, var_622_5.y, var_622_5.z)

				local var_622_6 = var_622_0.localEulerAngles

				var_622_6.z = 0
				var_622_6.x = 0
				var_622_0.localEulerAngles = var_622_6
			end

			if arg_619_1.time_ >= var_622_1 + var_622_2 and arg_619_1.time_ < var_622_1 + var_622_2 + arg_622_0 then
				var_622_0.localPosition = Vector3.New(0, 100, 0)

				local var_622_7 = manager.ui.mainCamera.transform.position - var_622_0.position

				var_622_0.forward = Vector3.New(var_622_7.x, var_622_7.y, var_622_7.z)

				local var_622_8 = var_622_0.localEulerAngles

				var_622_8.z = 0
				var_622_8.x = 0
				var_622_0.localEulerAngles = var_622_8
			end

			local var_622_9 = arg_619_1.actors_["1072ui_story"].transform
			local var_622_10 = 0

			if var_622_10 < arg_619_1.time_ and arg_619_1.time_ <= var_622_10 + arg_622_0 then
				arg_619_1.var_.moveOldPos1072ui_story = var_622_9.localPosition
			end

			local var_622_11 = 0.001

			if var_622_10 <= arg_619_1.time_ and arg_619_1.time_ < var_622_10 + var_622_11 then
				local var_622_12 = (arg_619_1.time_ - var_622_10) / var_622_11
				local var_622_13 = Vector3.New(-0.7, -0.71, -6)

				var_622_9.localPosition = Vector3.Lerp(arg_619_1.var_.moveOldPos1072ui_story, var_622_13, var_622_12)

				local var_622_14 = manager.ui.mainCamera.transform.position - var_622_9.position

				var_622_9.forward = Vector3.New(var_622_14.x, var_622_14.y, var_622_14.z)

				local var_622_15 = var_622_9.localEulerAngles

				var_622_15.z = 0
				var_622_15.x = 0
				var_622_9.localEulerAngles = var_622_15
			end

			if arg_619_1.time_ >= var_622_10 + var_622_11 and arg_619_1.time_ < var_622_10 + var_622_11 + arg_622_0 then
				var_622_9.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_622_16 = manager.ui.mainCamera.transform.position - var_622_9.position

				var_622_9.forward = Vector3.New(var_622_16.x, var_622_16.y, var_622_16.z)

				local var_622_17 = var_622_9.localEulerAngles

				var_622_17.z = 0
				var_622_17.x = 0
				var_622_9.localEulerAngles = var_622_17
			end

			local var_622_18 = 0

			if var_622_18 < arg_619_1.time_ and arg_619_1.time_ <= var_622_18 + arg_622_0 then
				arg_619_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_622_19 = 0

			if var_622_19 < arg_619_1.time_ and arg_619_1.time_ <= var_622_19 + arg_622_0 then
				arg_619_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_622_20 = arg_619_1.actors_["1072ui_story"]
			local var_622_21 = 0

			if var_622_21 < arg_619_1.time_ and arg_619_1.time_ <= var_622_21 + arg_622_0 and arg_619_1.var_.characterEffect1072ui_story == nil then
				arg_619_1.var_.characterEffect1072ui_story = var_622_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_622_22 = 0.2

			if var_622_21 <= arg_619_1.time_ and arg_619_1.time_ < var_622_21 + var_622_22 then
				local var_622_23 = (arg_619_1.time_ - var_622_21) / var_622_22

				if arg_619_1.var_.characterEffect1072ui_story then
					arg_619_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_619_1.time_ >= var_622_21 + var_622_22 and arg_619_1.time_ < var_622_21 + var_622_22 + arg_622_0 and arg_619_1.var_.characterEffect1072ui_story then
				arg_619_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_622_24 = arg_619_1.actors_["1069ui_story"]
			local var_622_25 = 0

			if var_622_25 < arg_619_1.time_ and arg_619_1.time_ <= var_622_25 + arg_622_0 and arg_619_1.var_.characterEffect1069ui_story == nil then
				arg_619_1.var_.characterEffect1069ui_story = var_622_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_622_26 = 0.2

			if var_622_25 <= arg_619_1.time_ and arg_619_1.time_ < var_622_25 + var_622_26 then
				local var_622_27 = (arg_619_1.time_ - var_622_25) / var_622_26

				if arg_619_1.var_.characterEffect1069ui_story then
					local var_622_28 = Mathf.Lerp(0, 0.5, var_622_27)

					arg_619_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_619_1.var_.characterEffect1069ui_story.fillRatio = var_622_28
				end
			end

			if arg_619_1.time_ >= var_622_25 + var_622_26 and arg_619_1.time_ < var_622_25 + var_622_26 + arg_622_0 and arg_619_1.var_.characterEffect1069ui_story then
				local var_622_29 = 0.5

				arg_619_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_619_1.var_.characterEffect1069ui_story.fillRatio = var_622_29
			end

			local var_622_30 = 0
			local var_622_31 = 0.15

			if var_622_30 < arg_619_1.time_ and arg_619_1.time_ <= var_622_30 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_32 = arg_619_1:FormatText(StoryNameCfg[379].name)

				arg_619_1.leftNameTxt_.text = var_622_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_33 = arg_619_1:GetWordFromCfg(120411153)
				local var_622_34 = arg_619_1:FormatText(var_622_33.content)

				arg_619_1.text_.text = var_622_34

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_35 = 6
				local var_622_36 = utf8.len(var_622_34)
				local var_622_37 = var_622_35 <= 0 and var_622_31 or var_622_31 * (var_622_36 / var_622_35)

				if var_622_37 > 0 and var_622_31 < var_622_37 then
					arg_619_1.talkMaxDuration = var_622_37

					if var_622_37 + var_622_30 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_37 + var_622_30
					end
				end

				arg_619_1.text_.text = var_622_34
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411153", "story_v_out_120411.awb") ~= 0 then
					local var_622_38 = manager.audio:GetVoiceLength("story_v_out_120411", "120411153", "story_v_out_120411.awb") / 1000

					if var_622_38 + var_622_30 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_38 + var_622_30
					end

					if var_622_33.prefab_name ~= "" and arg_619_1.actors_[var_622_33.prefab_name] ~= nil then
						local var_622_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_33.prefab_name].transform, "story_v_out_120411", "120411153", "story_v_out_120411.awb")

						arg_619_1:RecordAudio("120411153", var_622_39)
						arg_619_1:RecordAudio("120411153", var_622_39)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_120411", "120411153", "story_v_out_120411.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_120411", "120411153", "story_v_out_120411.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_40 = math.max(var_622_31, arg_619_1.talkMaxDuration)

			if var_622_30 <= arg_619_1.time_ and arg_619_1.time_ < var_622_30 + var_622_40 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_30) / var_622_40

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_30 + var_622_40 and arg_619_1.time_ < var_622_30 + var_622_40 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play120411154 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 120411154
		arg_623_1.duration_ = 13.866

		local var_623_0 = {
			zh = 7.366,
			ja = 13.866
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play120411155(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1072ui_story"]
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 and arg_623_1.var_.characterEffect1072ui_story == nil then
				arg_623_1.var_.characterEffect1072ui_story = var_626_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_2 = 0.2

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2

				if arg_623_1.var_.characterEffect1072ui_story then
					local var_626_4 = Mathf.Lerp(0, 0.5, var_626_3)

					arg_623_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_623_1.var_.characterEffect1072ui_story.fillRatio = var_626_4
				end
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 and arg_623_1.var_.characterEffect1072ui_story then
				local var_626_5 = 0.5

				arg_623_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_623_1.var_.characterEffect1072ui_story.fillRatio = var_626_5
			end

			local var_626_6 = arg_623_1.actors_["1069ui_story"].transform
			local var_626_7 = 0

			if var_626_7 < arg_623_1.time_ and arg_623_1.time_ <= var_626_7 + arg_626_0 then
				arg_623_1.var_.moveOldPos1069ui_story = var_626_6.localPosition
			end

			local var_626_8 = 0.001

			if var_626_7 <= arg_623_1.time_ and arg_623_1.time_ < var_626_7 + var_626_8 then
				local var_626_9 = (arg_623_1.time_ - var_626_7) / var_626_8
				local var_626_10 = Vector3.New(0, 100, 0)

				var_626_6.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1069ui_story, var_626_10, var_626_9)

				local var_626_11 = manager.ui.mainCamera.transform.position - var_626_6.position

				var_626_6.forward = Vector3.New(var_626_11.x, var_626_11.y, var_626_11.z)

				local var_626_12 = var_626_6.localEulerAngles

				var_626_12.z = 0
				var_626_12.x = 0
				var_626_6.localEulerAngles = var_626_12
			end

			if arg_623_1.time_ >= var_626_7 + var_626_8 and arg_623_1.time_ < var_626_7 + var_626_8 + arg_626_0 then
				var_626_6.localPosition = Vector3.New(0, 100, 0)

				local var_626_13 = manager.ui.mainCamera.transform.position - var_626_6.position

				var_626_6.forward = Vector3.New(var_626_13.x, var_626_13.y, var_626_13.z)

				local var_626_14 = var_626_6.localEulerAngles

				var_626_14.z = 0
				var_626_14.x = 0
				var_626_6.localEulerAngles = var_626_14
			end

			local var_626_15 = arg_623_1.actors_["1072ui_story"].transform
			local var_626_16 = 0

			if var_626_16 < arg_623_1.time_ and arg_623_1.time_ <= var_626_16 + arg_626_0 then
				arg_623_1.var_.moveOldPos1072ui_story = var_626_15.localPosition
			end

			local var_626_17 = 0.001

			if var_626_16 <= arg_623_1.time_ and arg_623_1.time_ < var_626_16 + var_626_17 then
				local var_626_18 = (arg_623_1.time_ - var_626_16) / var_626_17
				local var_626_19 = Vector3.New(0, 100, 0)

				var_626_15.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1072ui_story, var_626_19, var_626_18)

				local var_626_20 = manager.ui.mainCamera.transform.position - var_626_15.position

				var_626_15.forward = Vector3.New(var_626_20.x, var_626_20.y, var_626_20.z)

				local var_626_21 = var_626_15.localEulerAngles

				var_626_21.z = 0
				var_626_21.x = 0
				var_626_15.localEulerAngles = var_626_21
			end

			if arg_623_1.time_ >= var_626_16 + var_626_17 and arg_623_1.time_ < var_626_16 + var_626_17 + arg_626_0 then
				var_626_15.localPosition = Vector3.New(0, 100, 0)

				local var_626_22 = manager.ui.mainCamera.transform.position - var_626_15.position

				var_626_15.forward = Vector3.New(var_626_22.x, var_626_22.y, var_626_22.z)

				local var_626_23 = var_626_15.localEulerAngles

				var_626_23.z = 0
				var_626_23.x = 0
				var_626_15.localEulerAngles = var_626_23
			end

			local var_626_24 = arg_623_1.actors_["1076ui_story"].transform
			local var_626_25 = 0

			if var_626_25 < arg_623_1.time_ and arg_623_1.time_ <= var_626_25 + arg_626_0 then
				arg_623_1.var_.moveOldPos1076ui_story = var_626_24.localPosition
			end

			local var_626_26 = 0.001

			if var_626_25 <= arg_623_1.time_ and arg_623_1.time_ < var_626_25 + var_626_26 then
				local var_626_27 = (arg_623_1.time_ - var_626_25) / var_626_26
				local var_626_28 = Vector3.New(0, -1.06, -6.2)

				var_626_24.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1076ui_story, var_626_28, var_626_27)

				local var_626_29 = manager.ui.mainCamera.transform.position - var_626_24.position

				var_626_24.forward = Vector3.New(var_626_29.x, var_626_29.y, var_626_29.z)

				local var_626_30 = var_626_24.localEulerAngles

				var_626_30.z = 0
				var_626_30.x = 0
				var_626_24.localEulerAngles = var_626_30
			end

			if arg_623_1.time_ >= var_626_25 + var_626_26 and arg_623_1.time_ < var_626_25 + var_626_26 + arg_626_0 then
				var_626_24.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_626_31 = manager.ui.mainCamera.transform.position - var_626_24.position

				var_626_24.forward = Vector3.New(var_626_31.x, var_626_31.y, var_626_31.z)

				local var_626_32 = var_626_24.localEulerAngles

				var_626_32.z = 0
				var_626_32.x = 0
				var_626_24.localEulerAngles = var_626_32
			end

			local var_626_33 = arg_623_1.actors_["1076ui_story"]
			local var_626_34 = 0

			if var_626_34 < arg_623_1.time_ and arg_623_1.time_ <= var_626_34 + arg_626_0 and arg_623_1.var_.characterEffect1076ui_story == nil then
				arg_623_1.var_.characterEffect1076ui_story = var_626_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_35 = 0.2

			if var_626_34 <= arg_623_1.time_ and arg_623_1.time_ < var_626_34 + var_626_35 then
				local var_626_36 = (arg_623_1.time_ - var_626_34) / var_626_35

				if arg_623_1.var_.characterEffect1076ui_story then
					arg_623_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_34 + var_626_35 and arg_623_1.time_ < var_626_34 + var_626_35 + arg_626_0 and arg_623_1.var_.characterEffect1076ui_story then
				arg_623_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_626_37 = 0

			if var_626_37 < arg_623_1.time_ and arg_623_1.time_ <= var_626_37 + arg_626_0 then
				arg_623_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_626_38 = 0
			local var_626_39 = 0.625

			if var_626_38 < arg_623_1.time_ and arg_623_1.time_ <= var_626_38 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_40 = arg_623_1:FormatText(StoryNameCfg[389].name)

				arg_623_1.leftNameTxt_.text = var_626_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_41 = arg_623_1:GetWordFromCfg(120411154)
				local var_626_42 = arg_623_1:FormatText(var_626_41.content)

				arg_623_1.text_.text = var_626_42

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_43 = 25
				local var_626_44 = utf8.len(var_626_42)
				local var_626_45 = var_626_43 <= 0 and var_626_39 or var_626_39 * (var_626_44 / var_626_43)

				if var_626_45 > 0 and var_626_39 < var_626_45 then
					arg_623_1.talkMaxDuration = var_626_45

					if var_626_45 + var_626_38 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_45 + var_626_38
					end
				end

				arg_623_1.text_.text = var_626_42
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411154", "story_v_out_120411.awb") ~= 0 then
					local var_626_46 = manager.audio:GetVoiceLength("story_v_out_120411", "120411154", "story_v_out_120411.awb") / 1000

					if var_626_46 + var_626_38 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_46 + var_626_38
					end

					if var_626_41.prefab_name ~= "" and arg_623_1.actors_[var_626_41.prefab_name] ~= nil then
						local var_626_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_41.prefab_name].transform, "story_v_out_120411", "120411154", "story_v_out_120411.awb")

						arg_623_1:RecordAudio("120411154", var_626_47)
						arg_623_1:RecordAudio("120411154", var_626_47)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_120411", "120411154", "story_v_out_120411.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_120411", "120411154", "story_v_out_120411.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_48 = math.max(var_626_39, arg_623_1.talkMaxDuration)

			if var_626_38 <= arg_623_1.time_ and arg_623_1.time_ < var_626_38 + var_626_48 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_38) / var_626_48

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_38 + var_626_48 and arg_623_1.time_ < var_626_38 + var_626_48 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play120411155 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 120411155
		arg_627_1.duration_ = 7.066

		local var_627_0 = {
			zh = 5.066,
			ja = 7.066
		}
		local var_627_1 = manager.audio:GetLocalizationFlag()

		if var_627_0[var_627_1] ~= nil then
			arg_627_1.duration_ = var_627_0[var_627_1]
		end

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play120411156(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1069ui_story"]
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 and arg_627_1.var_.characterEffect1069ui_story == nil then
				arg_627_1.var_.characterEffect1069ui_story = var_630_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_2 = 0.2

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2

				if arg_627_1.var_.characterEffect1069ui_story then
					arg_627_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 and arg_627_1.var_.characterEffect1069ui_story then
				arg_627_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_630_4 = 0

			if var_630_4 < arg_627_1.time_ and arg_627_1.time_ <= var_630_4 + arg_630_0 then
				arg_627_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_630_5 = arg_627_1.actors_["1069ui_story"].transform
			local var_630_6 = 0

			if var_630_6 < arg_627_1.time_ and arg_627_1.time_ <= var_630_6 + arg_630_0 then
				arg_627_1.var_.moveOldPos1069ui_story = var_630_5.localPosition
			end

			local var_630_7 = 0.001

			if var_630_6 <= arg_627_1.time_ and arg_627_1.time_ < var_630_6 + var_630_7 then
				local var_630_8 = (arg_627_1.time_ - var_630_6) / var_630_7
				local var_630_9 = Vector3.New(0, -1, -6)

				var_630_5.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1069ui_story, var_630_9, var_630_8)

				local var_630_10 = manager.ui.mainCamera.transform.position - var_630_5.position

				var_630_5.forward = Vector3.New(var_630_10.x, var_630_10.y, var_630_10.z)

				local var_630_11 = var_630_5.localEulerAngles

				var_630_11.z = 0
				var_630_11.x = 0
				var_630_5.localEulerAngles = var_630_11
			end

			if arg_627_1.time_ >= var_630_6 + var_630_7 and arg_627_1.time_ < var_630_6 + var_630_7 + arg_630_0 then
				var_630_5.localPosition = Vector3.New(0, -1, -6)

				local var_630_12 = manager.ui.mainCamera.transform.position - var_630_5.position

				var_630_5.forward = Vector3.New(var_630_12.x, var_630_12.y, var_630_12.z)

				local var_630_13 = var_630_5.localEulerAngles

				var_630_13.z = 0
				var_630_13.x = 0
				var_630_5.localEulerAngles = var_630_13
			end

			local var_630_14 = arg_627_1.actors_["1076ui_story"].transform
			local var_630_15 = 0

			if var_630_15 < arg_627_1.time_ and arg_627_1.time_ <= var_630_15 + arg_630_0 then
				arg_627_1.var_.moveOldPos1076ui_story = var_630_14.localPosition
			end

			local var_630_16 = 0.001

			if var_630_15 <= arg_627_1.time_ and arg_627_1.time_ < var_630_15 + var_630_16 then
				local var_630_17 = (arg_627_1.time_ - var_630_15) / var_630_16
				local var_630_18 = Vector3.New(0, 100, 0)

				var_630_14.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1076ui_story, var_630_18, var_630_17)

				local var_630_19 = manager.ui.mainCamera.transform.position - var_630_14.position

				var_630_14.forward = Vector3.New(var_630_19.x, var_630_19.y, var_630_19.z)

				local var_630_20 = var_630_14.localEulerAngles

				var_630_20.z = 0
				var_630_20.x = 0
				var_630_14.localEulerAngles = var_630_20
			end

			if arg_627_1.time_ >= var_630_15 + var_630_16 and arg_627_1.time_ < var_630_15 + var_630_16 + arg_630_0 then
				var_630_14.localPosition = Vector3.New(0, 100, 0)

				local var_630_21 = manager.ui.mainCamera.transform.position - var_630_14.position

				var_630_14.forward = Vector3.New(var_630_21.x, var_630_21.y, var_630_21.z)

				local var_630_22 = var_630_14.localEulerAngles

				var_630_22.z = 0
				var_630_22.x = 0
				var_630_14.localEulerAngles = var_630_22
			end

			local var_630_23 = 0

			if var_630_23 < arg_627_1.time_ and arg_627_1.time_ <= var_630_23 + arg_630_0 then
				arg_627_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_630_24 = 0
			local var_630_25 = 0.725

			if var_630_24 < arg_627_1.time_ and arg_627_1.time_ <= var_630_24 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_26 = arg_627_1:FormatText(StoryNameCfg[378].name)

				arg_627_1.leftNameTxt_.text = var_630_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_27 = arg_627_1:GetWordFromCfg(120411155)
				local var_630_28 = arg_627_1:FormatText(var_630_27.content)

				arg_627_1.text_.text = var_630_28

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_29 = 29
				local var_630_30 = utf8.len(var_630_28)
				local var_630_31 = var_630_29 <= 0 and var_630_25 or var_630_25 * (var_630_30 / var_630_29)

				if var_630_31 > 0 and var_630_25 < var_630_31 then
					arg_627_1.talkMaxDuration = var_630_31

					if var_630_31 + var_630_24 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_31 + var_630_24
					end
				end

				arg_627_1.text_.text = var_630_28
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411155", "story_v_out_120411.awb") ~= 0 then
					local var_630_32 = manager.audio:GetVoiceLength("story_v_out_120411", "120411155", "story_v_out_120411.awb") / 1000

					if var_630_32 + var_630_24 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_32 + var_630_24
					end

					if var_630_27.prefab_name ~= "" and arg_627_1.actors_[var_630_27.prefab_name] ~= nil then
						local var_630_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_27.prefab_name].transform, "story_v_out_120411", "120411155", "story_v_out_120411.awb")

						arg_627_1:RecordAudio("120411155", var_630_33)
						arg_627_1:RecordAudio("120411155", var_630_33)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_120411", "120411155", "story_v_out_120411.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_120411", "120411155", "story_v_out_120411.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_34 = math.max(var_630_25, arg_627_1.talkMaxDuration)

			if var_630_24 <= arg_627_1.time_ and arg_627_1.time_ < var_630_24 + var_630_34 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_24) / var_630_34

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_24 + var_630_34 and arg_627_1.time_ < var_630_24 + var_630_34 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play120411156 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 120411156
		arg_631_1.duration_ = 6.1

		local var_631_0 = {
			zh = 3.466,
			ja = 6.1
		}
		local var_631_1 = manager.audio:GetLocalizationFlag()

		if var_631_0[var_631_1] ~= nil then
			arg_631_1.duration_ = var_631_0[var_631_1]
		end

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play120411157(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1072ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect1072ui_story == nil then
				arg_631_1.var_.characterEffect1072ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.2

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1072ui_story then
					arg_631_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect1072ui_story then
				arg_631_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_634_4 = arg_631_1.actors_["1069ui_story"]
			local var_634_5 = 0

			if var_634_5 < arg_631_1.time_ and arg_631_1.time_ <= var_634_5 + arg_634_0 and arg_631_1.var_.characterEffect1069ui_story == nil then
				arg_631_1.var_.characterEffect1069ui_story = var_634_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_6 = 0.2

			if var_634_5 <= arg_631_1.time_ and arg_631_1.time_ < var_634_5 + var_634_6 then
				local var_634_7 = (arg_631_1.time_ - var_634_5) / var_634_6

				if arg_631_1.var_.characterEffect1069ui_story then
					local var_634_8 = Mathf.Lerp(0, 0.5, var_634_7)

					arg_631_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_631_1.var_.characterEffect1069ui_story.fillRatio = var_634_8
				end
			end

			if arg_631_1.time_ >= var_634_5 + var_634_6 and arg_631_1.time_ < var_634_5 + var_634_6 + arg_634_0 and arg_631_1.var_.characterEffect1069ui_story then
				local var_634_9 = 0.5

				arg_631_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_631_1.var_.characterEffect1069ui_story.fillRatio = var_634_9
			end

			local var_634_10 = 0

			if var_634_10 < arg_631_1.time_ and arg_631_1.time_ <= var_634_10 + arg_634_0 then
				arg_631_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_634_11 = 0

			if var_634_11 < arg_631_1.time_ and arg_631_1.time_ <= var_634_11 + arg_634_0 then
				arg_631_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_1")
			end

			local var_634_12 = arg_631_1.actors_["1072ui_story"].transform
			local var_634_13 = 0

			if var_634_13 < arg_631_1.time_ and arg_631_1.time_ <= var_634_13 + arg_634_0 then
				arg_631_1.var_.moveOldPos1072ui_story = var_634_12.localPosition
			end

			local var_634_14 = 0.001

			if var_634_13 <= arg_631_1.time_ and arg_631_1.time_ < var_634_13 + var_634_14 then
				local var_634_15 = (arg_631_1.time_ - var_634_13) / var_634_14
				local var_634_16 = Vector3.New(0, -0.71, -6)

				var_634_12.localPosition = Vector3.Lerp(arg_631_1.var_.moveOldPos1072ui_story, var_634_16, var_634_15)

				local var_634_17 = manager.ui.mainCamera.transform.position - var_634_12.position

				var_634_12.forward = Vector3.New(var_634_17.x, var_634_17.y, var_634_17.z)

				local var_634_18 = var_634_12.localEulerAngles

				var_634_18.z = 0
				var_634_18.x = 0
				var_634_12.localEulerAngles = var_634_18
			end

			if arg_631_1.time_ >= var_634_13 + var_634_14 and arg_631_1.time_ < var_634_13 + var_634_14 + arg_634_0 then
				var_634_12.localPosition = Vector3.New(0, -0.71, -6)

				local var_634_19 = manager.ui.mainCamera.transform.position - var_634_12.position

				var_634_12.forward = Vector3.New(var_634_19.x, var_634_19.y, var_634_19.z)

				local var_634_20 = var_634_12.localEulerAngles

				var_634_20.z = 0
				var_634_20.x = 0
				var_634_12.localEulerAngles = var_634_20
			end

			local var_634_21 = arg_631_1.actors_["1069ui_story"].transform
			local var_634_22 = 0

			if var_634_22 < arg_631_1.time_ and arg_631_1.time_ <= var_634_22 + arg_634_0 then
				arg_631_1.var_.moveOldPos1069ui_story = var_634_21.localPosition
			end

			local var_634_23 = 0.001

			if var_634_22 <= arg_631_1.time_ and arg_631_1.time_ < var_634_22 + var_634_23 then
				local var_634_24 = (arg_631_1.time_ - var_634_22) / var_634_23
				local var_634_25 = Vector3.New(0, 100, 0)

				var_634_21.localPosition = Vector3.Lerp(arg_631_1.var_.moveOldPos1069ui_story, var_634_25, var_634_24)

				local var_634_26 = manager.ui.mainCamera.transform.position - var_634_21.position

				var_634_21.forward = Vector3.New(var_634_26.x, var_634_26.y, var_634_26.z)

				local var_634_27 = var_634_21.localEulerAngles

				var_634_27.z = 0
				var_634_27.x = 0
				var_634_21.localEulerAngles = var_634_27
			end

			if arg_631_1.time_ >= var_634_22 + var_634_23 and arg_631_1.time_ < var_634_22 + var_634_23 + arg_634_0 then
				var_634_21.localPosition = Vector3.New(0, 100, 0)

				local var_634_28 = manager.ui.mainCamera.transform.position - var_634_21.position

				var_634_21.forward = Vector3.New(var_634_28.x, var_634_28.y, var_634_28.z)

				local var_634_29 = var_634_21.localEulerAngles

				var_634_29.z = 0
				var_634_29.x = 0
				var_634_21.localEulerAngles = var_634_29
			end

			local var_634_30 = 0
			local var_634_31 = 0.375

			if var_634_30 < arg_631_1.time_ and arg_631_1.time_ <= var_634_30 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_32 = arg_631_1:FormatText(StoryNameCfg[379].name)

				arg_631_1.leftNameTxt_.text = var_634_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_33 = arg_631_1:GetWordFromCfg(120411156)
				local var_634_34 = arg_631_1:FormatText(var_634_33.content)

				arg_631_1.text_.text = var_634_34

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_35 = 15
				local var_634_36 = utf8.len(var_634_34)
				local var_634_37 = var_634_35 <= 0 and var_634_31 or var_634_31 * (var_634_36 / var_634_35)

				if var_634_37 > 0 and var_634_31 < var_634_37 then
					arg_631_1.talkMaxDuration = var_634_37

					if var_634_37 + var_634_30 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_37 + var_634_30
					end
				end

				arg_631_1.text_.text = var_634_34
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411156", "story_v_out_120411.awb") ~= 0 then
					local var_634_38 = manager.audio:GetVoiceLength("story_v_out_120411", "120411156", "story_v_out_120411.awb") / 1000

					if var_634_38 + var_634_30 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_38 + var_634_30
					end

					if var_634_33.prefab_name ~= "" and arg_631_1.actors_[var_634_33.prefab_name] ~= nil then
						local var_634_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_33.prefab_name].transform, "story_v_out_120411", "120411156", "story_v_out_120411.awb")

						arg_631_1:RecordAudio("120411156", var_634_39)
						arg_631_1:RecordAudio("120411156", var_634_39)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_120411", "120411156", "story_v_out_120411.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_120411", "120411156", "story_v_out_120411.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_40 = math.max(var_634_31, arg_631_1.talkMaxDuration)

			if var_634_30 <= arg_631_1.time_ and arg_631_1.time_ < var_634_30 + var_634_40 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_30) / var_634_40

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_30 + var_634_40 and arg_631_1.time_ < var_634_30 + var_634_40 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play120411157 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 120411157
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play120411158(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1072ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.characterEffect1072ui_story == nil then
				arg_635_1.var_.characterEffect1072ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.2

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1072ui_story then
					local var_638_4 = Mathf.Lerp(0, 0.5, var_638_3)

					arg_635_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1072ui_story.fillRatio = var_638_4
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.characterEffect1072ui_story then
				local var_638_5 = 0.5

				arg_635_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1072ui_story.fillRatio = var_638_5
			end

			local var_638_6 = 0
			local var_638_7 = 1.325

			if var_638_6 < arg_635_1.time_ and arg_635_1.time_ <= var_638_6 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, false)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_8 = arg_635_1:GetWordFromCfg(120411157)
				local var_638_9 = arg_635_1:FormatText(var_638_8.content)

				arg_635_1.text_.text = var_638_9

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_10 = 53
				local var_638_11 = utf8.len(var_638_9)
				local var_638_12 = var_638_10 <= 0 and var_638_7 or var_638_7 * (var_638_11 / var_638_10)

				if var_638_12 > 0 and var_638_7 < var_638_12 then
					arg_635_1.talkMaxDuration = var_638_12

					if var_638_12 + var_638_6 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_12 + var_638_6
					end
				end

				arg_635_1.text_.text = var_638_9
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_13 = math.max(var_638_7, arg_635_1.talkMaxDuration)

			if var_638_6 <= arg_635_1.time_ and arg_635_1.time_ < var_638_6 + var_638_13 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_6) / var_638_13

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_6 + var_638_13 and arg_635_1.time_ < var_638_6 + var_638_13 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play120411158 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 120411158
		arg_639_1.duration_ = 11.666

		local var_639_0 = {
			zh = 9.4,
			ja = 11.666
		}
		local var_639_1 = manager.audio:GetLocalizationFlag()

		if var_639_0[var_639_1] ~= nil then
			arg_639_1.duration_ = var_639_0[var_639_1]
		end

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play120411159(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["1072ui_story"]
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 and arg_639_1.var_.characterEffect1072ui_story == nil then
				arg_639_1.var_.characterEffect1072ui_story = var_642_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_2 = 0.2

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2

				if arg_639_1.var_.characterEffect1072ui_story then
					arg_639_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 and arg_639_1.var_.characterEffect1072ui_story then
				arg_639_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_642_4 = 0

			if var_642_4 < arg_639_1.time_ and arg_639_1.time_ <= var_642_4 + arg_642_0 then
				arg_639_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_2")
			end

			local var_642_5 = 0
			local var_642_6 = 1.05

			if var_642_5 < arg_639_1.time_ and arg_639_1.time_ <= var_642_5 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_7 = arg_639_1:FormatText(StoryNameCfg[379].name)

				arg_639_1.leftNameTxt_.text = var_642_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_8 = arg_639_1:GetWordFromCfg(120411158)
				local var_642_9 = arg_639_1:FormatText(var_642_8.content)

				arg_639_1.text_.text = var_642_9

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_10 = 42
				local var_642_11 = utf8.len(var_642_9)
				local var_642_12 = var_642_10 <= 0 and var_642_6 or var_642_6 * (var_642_11 / var_642_10)

				if var_642_12 > 0 and var_642_6 < var_642_12 then
					arg_639_1.talkMaxDuration = var_642_12

					if var_642_12 + var_642_5 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_12 + var_642_5
					end
				end

				arg_639_1.text_.text = var_642_9
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411158", "story_v_out_120411.awb") ~= 0 then
					local var_642_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411158", "story_v_out_120411.awb") / 1000

					if var_642_13 + var_642_5 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_13 + var_642_5
					end

					if var_642_8.prefab_name ~= "" and arg_639_1.actors_[var_642_8.prefab_name] ~= nil then
						local var_642_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_8.prefab_name].transform, "story_v_out_120411", "120411158", "story_v_out_120411.awb")

						arg_639_1:RecordAudio("120411158", var_642_14)
						arg_639_1:RecordAudio("120411158", var_642_14)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_120411", "120411158", "story_v_out_120411.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_120411", "120411158", "story_v_out_120411.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_15 = math.max(var_642_6, arg_639_1.talkMaxDuration)

			if var_642_5 <= arg_639_1.time_ and arg_639_1.time_ < var_642_5 + var_642_15 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_5) / var_642_15

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_5 + var_642_15 and arg_639_1.time_ < var_642_5 + var_642_15 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play120411159 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 120411159
		arg_643_1.duration_ = 0.999999999999

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play120411160(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 0.05

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_2 = arg_643_1:FormatText(StoryNameCfg[379].name)

				arg_643_1.leftNameTxt_.text = var_646_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_3 = arg_643_1:GetWordFromCfg(120411159)
				local var_646_4 = arg_643_1:FormatText(var_646_3.content)

				arg_643_1.text_.text = var_646_4

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_5 = 2
				local var_646_6 = utf8.len(var_646_4)
				local var_646_7 = var_646_5 <= 0 and var_646_1 or var_646_1 * (var_646_6 / var_646_5)

				if var_646_7 > 0 and var_646_1 < var_646_7 then
					arg_643_1.talkMaxDuration = var_646_7

					if var_646_7 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_7 + var_646_0
					end
				end

				arg_643_1.text_.text = var_646_4
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411159", "story_v_out_120411.awb") ~= 0 then
					local var_646_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411159", "story_v_out_120411.awb") / 1000

					if var_646_8 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_8 + var_646_0
					end

					if var_646_3.prefab_name ~= "" and arg_643_1.actors_[var_646_3.prefab_name] ~= nil then
						local var_646_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_3.prefab_name].transform, "story_v_out_120411", "120411159", "story_v_out_120411.awb")

						arg_643_1:RecordAudio("120411159", var_646_9)
						arg_643_1:RecordAudio("120411159", var_646_9)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_120411", "120411159", "story_v_out_120411.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_120411", "120411159", "story_v_out_120411.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_10 = math.max(var_646_1, arg_643_1.talkMaxDuration)

			if var_646_0 <= arg_643_1.time_ and arg_643_1.time_ < var_646_0 + var_646_10 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_0) / var_646_10

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_0 + var_646_10 and arg_643_1.time_ < var_646_0 + var_646_10 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play120411160 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 120411160
		arg_647_1.duration_ = 3.2

		local var_647_0 = {
			zh = 2.7,
			ja = 3.2
		}
		local var_647_1 = manager.audio:GetLocalizationFlag()

		if var_647_0[var_647_1] ~= nil then
			arg_647_1.duration_ = var_647_0[var_647_1]
		end

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play120411161(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = 0

			if var_650_0 < arg_647_1.time_ and arg_647_1.time_ <= var_650_0 + arg_650_0 then
				arg_647_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_1")
			end

			local var_650_1 = 0
			local var_650_2 = 0.275

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_3 = arg_647_1:FormatText(StoryNameCfg[379].name)

				arg_647_1.leftNameTxt_.text = var_650_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_4 = arg_647_1:GetWordFromCfg(120411160)
				local var_650_5 = arg_647_1:FormatText(var_650_4.content)

				arg_647_1.text_.text = var_650_5

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_6 = 11
				local var_650_7 = utf8.len(var_650_5)
				local var_650_8 = var_650_6 <= 0 and var_650_2 or var_650_2 * (var_650_7 / var_650_6)

				if var_650_8 > 0 and var_650_2 < var_650_8 then
					arg_647_1.talkMaxDuration = var_650_8

					if var_650_8 + var_650_1 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_8 + var_650_1
					end
				end

				arg_647_1.text_.text = var_650_5
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411160", "story_v_out_120411.awb") ~= 0 then
					local var_650_9 = manager.audio:GetVoiceLength("story_v_out_120411", "120411160", "story_v_out_120411.awb") / 1000

					if var_650_9 + var_650_1 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_9 + var_650_1
					end

					if var_650_4.prefab_name ~= "" and arg_647_1.actors_[var_650_4.prefab_name] ~= nil then
						local var_650_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_4.prefab_name].transform, "story_v_out_120411", "120411160", "story_v_out_120411.awb")

						arg_647_1:RecordAudio("120411160", var_650_10)
						arg_647_1:RecordAudio("120411160", var_650_10)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_120411", "120411160", "story_v_out_120411.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_120411", "120411160", "story_v_out_120411.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_11 = math.max(var_650_2, arg_647_1.talkMaxDuration)

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_11 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_1) / var_650_11

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_1 + var_650_11 and arg_647_1.time_ < var_650_1 + var_650_11 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play120411161 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 120411161
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play120411162(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1072ui_story"].transform
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 then
				arg_651_1.var_.moveOldPos1072ui_story = var_654_0.localPosition
			end

			local var_654_2 = 0.001

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2
				local var_654_4 = Vector3.New(0, 100, 0)

				var_654_0.localPosition = Vector3.Lerp(arg_651_1.var_.moveOldPos1072ui_story, var_654_4, var_654_3)

				local var_654_5 = manager.ui.mainCamera.transform.position - var_654_0.position

				var_654_0.forward = Vector3.New(var_654_5.x, var_654_5.y, var_654_5.z)

				local var_654_6 = var_654_0.localEulerAngles

				var_654_6.z = 0
				var_654_6.x = 0
				var_654_0.localEulerAngles = var_654_6
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 then
				var_654_0.localPosition = Vector3.New(0, 100, 0)

				local var_654_7 = manager.ui.mainCamera.transform.position - var_654_0.position

				var_654_0.forward = Vector3.New(var_654_7.x, var_654_7.y, var_654_7.z)

				local var_654_8 = var_654_0.localEulerAngles

				var_654_8.z = 0
				var_654_8.x = 0
				var_654_0.localEulerAngles = var_654_8
			end

			local var_654_9 = 0
			local var_654_10 = 1.2

			if var_654_9 < arg_651_1.time_ and arg_651_1.time_ <= var_654_9 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_11 = arg_651_1:GetWordFromCfg(120411161)
				local var_654_12 = arg_651_1:FormatText(var_654_11.content)

				arg_651_1.text_.text = var_654_12

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_13 = 48
				local var_654_14 = utf8.len(var_654_12)
				local var_654_15 = var_654_13 <= 0 and var_654_10 or var_654_10 * (var_654_14 / var_654_13)

				if var_654_15 > 0 and var_654_10 < var_654_15 then
					arg_651_1.talkMaxDuration = var_654_15

					if var_654_15 + var_654_9 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_15 + var_654_9
					end
				end

				arg_651_1.text_.text = var_654_12
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_16 = math.max(var_654_10, arg_651_1.talkMaxDuration)

			if var_654_9 <= arg_651_1.time_ and arg_651_1.time_ < var_654_9 + var_654_16 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_9) / var_654_16

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_9 + var_654_16 and arg_651_1.time_ < var_654_9 + var_654_16 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play120411162 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 120411162
		arg_655_1.duration_ = 5.366

		local var_655_0 = {
			zh = 3.533,
			ja = 5.366
		}
		local var_655_1 = manager.audio:GetLocalizationFlag()

		if var_655_0[var_655_1] ~= nil then
			arg_655_1.duration_ = var_655_0[var_655_1]
		end

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play120411163(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1071ui_story"].transform
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 then
				arg_655_1.var_.moveOldPos1071ui_story = var_658_0.localPosition
			end

			local var_658_2 = 0.001

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_2 then
				local var_658_3 = (arg_655_1.time_ - var_658_1) / var_658_2
				local var_658_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_658_0.localPosition = Vector3.Lerp(arg_655_1.var_.moveOldPos1071ui_story, var_658_4, var_658_3)

				local var_658_5 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_5.x, var_658_5.y, var_658_5.z)

				local var_658_6 = var_658_0.localEulerAngles

				var_658_6.z = 0
				var_658_6.x = 0
				var_658_0.localEulerAngles = var_658_6
			end

			if arg_655_1.time_ >= var_658_1 + var_658_2 and arg_655_1.time_ < var_658_1 + var_658_2 + arg_658_0 then
				var_658_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_658_7 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_7.x, var_658_7.y, var_658_7.z)

				local var_658_8 = var_658_0.localEulerAngles

				var_658_8.z = 0
				var_658_8.x = 0
				var_658_0.localEulerAngles = var_658_8
			end

			local var_658_9 = 0

			if var_658_9 < arg_655_1.time_ and arg_655_1.time_ <= var_658_9 + arg_658_0 then
				arg_655_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_658_10 = arg_655_1.actors_["1071ui_story"]
			local var_658_11 = 0

			if var_658_11 < arg_655_1.time_ and arg_655_1.time_ <= var_658_11 + arg_658_0 and arg_655_1.var_.characterEffect1071ui_story == nil then
				arg_655_1.var_.characterEffect1071ui_story = var_658_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_12 = 0.2

			if var_658_11 <= arg_655_1.time_ and arg_655_1.time_ < var_658_11 + var_658_12 then
				local var_658_13 = (arg_655_1.time_ - var_658_11) / var_658_12

				if arg_655_1.var_.characterEffect1071ui_story then
					arg_655_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_655_1.time_ >= var_658_11 + var_658_12 and arg_655_1.time_ < var_658_11 + var_658_12 + arg_658_0 and arg_655_1.var_.characterEffect1071ui_story then
				arg_655_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_658_14 = 0
			local var_658_15 = 0.35

			if var_658_14 < arg_655_1.time_ and arg_655_1.time_ <= var_658_14 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_16 = arg_655_1:FormatText(StoryNameCfg[384].name)

				arg_655_1.leftNameTxt_.text = var_658_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_17 = arg_655_1:GetWordFromCfg(120411162)
				local var_658_18 = arg_655_1:FormatText(var_658_17.content)

				arg_655_1.text_.text = var_658_18

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_19 = 14
				local var_658_20 = utf8.len(var_658_18)
				local var_658_21 = var_658_19 <= 0 and var_658_15 or var_658_15 * (var_658_20 / var_658_19)

				if var_658_21 > 0 and var_658_15 < var_658_21 then
					arg_655_1.talkMaxDuration = var_658_21

					if var_658_21 + var_658_14 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_21 + var_658_14
					end
				end

				arg_655_1.text_.text = var_658_18
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411162", "story_v_out_120411.awb") ~= 0 then
					local var_658_22 = manager.audio:GetVoiceLength("story_v_out_120411", "120411162", "story_v_out_120411.awb") / 1000

					if var_658_22 + var_658_14 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_22 + var_658_14
					end

					if var_658_17.prefab_name ~= "" and arg_655_1.actors_[var_658_17.prefab_name] ~= nil then
						local var_658_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_17.prefab_name].transform, "story_v_out_120411", "120411162", "story_v_out_120411.awb")

						arg_655_1:RecordAudio("120411162", var_658_23)
						arg_655_1:RecordAudio("120411162", var_658_23)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_out_120411", "120411162", "story_v_out_120411.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_out_120411", "120411162", "story_v_out_120411.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_24 = math.max(var_658_15, arg_655_1.talkMaxDuration)

			if var_658_14 <= arg_655_1.time_ and arg_655_1.time_ < var_658_14 + var_658_24 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_14) / var_658_24

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_14 + var_658_24 and arg_655_1.time_ < var_658_14 + var_658_24 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play120411163 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 120411163
		arg_659_1.duration_ = 6.7

		local var_659_0 = {
			zh = 2.9,
			ja = 6.7
		}
		local var_659_1 = manager.audio:GetLocalizationFlag()

		if var_659_0[var_659_1] ~= nil then
			arg_659_1.duration_ = var_659_0[var_659_1]
		end

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play120411164(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				arg_659_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_662_1 = arg_659_1.actors_["1076ui_story"]
			local var_662_2 = 0

			if var_662_2 < arg_659_1.time_ and arg_659_1.time_ <= var_662_2 + arg_662_0 and arg_659_1.var_.characterEffect1076ui_story == nil then
				arg_659_1.var_.characterEffect1076ui_story = var_662_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_3 = 0.2

			if var_662_2 <= arg_659_1.time_ and arg_659_1.time_ < var_662_2 + var_662_3 then
				local var_662_4 = (arg_659_1.time_ - var_662_2) / var_662_3

				if arg_659_1.var_.characterEffect1076ui_story then
					arg_659_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_2 + var_662_3 and arg_659_1.time_ < var_662_2 + var_662_3 + arg_662_0 and arg_659_1.var_.characterEffect1076ui_story then
				arg_659_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_662_5 = arg_659_1.actors_["1076ui_story"].transform
			local var_662_6 = 0

			if var_662_6 < arg_659_1.time_ and arg_659_1.time_ <= var_662_6 + arg_662_0 then
				arg_659_1.var_.moveOldPos1076ui_story = var_662_5.localPosition
			end

			local var_662_7 = 0.001

			if var_662_6 <= arg_659_1.time_ and arg_659_1.time_ < var_662_6 + var_662_7 then
				local var_662_8 = (arg_659_1.time_ - var_662_6) / var_662_7
				local var_662_9 = Vector3.New(0.7, -1.06, -6.2)

				var_662_5.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos1076ui_story, var_662_9, var_662_8)

				local var_662_10 = manager.ui.mainCamera.transform.position - var_662_5.position

				var_662_5.forward = Vector3.New(var_662_10.x, var_662_10.y, var_662_10.z)

				local var_662_11 = var_662_5.localEulerAngles

				var_662_11.z = 0
				var_662_11.x = 0
				var_662_5.localEulerAngles = var_662_11
			end

			if arg_659_1.time_ >= var_662_6 + var_662_7 and arg_659_1.time_ < var_662_6 + var_662_7 + arg_662_0 then
				var_662_5.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_662_12 = manager.ui.mainCamera.transform.position - var_662_5.position

				var_662_5.forward = Vector3.New(var_662_12.x, var_662_12.y, var_662_12.z)

				local var_662_13 = var_662_5.localEulerAngles

				var_662_13.z = 0
				var_662_13.x = 0
				var_662_5.localEulerAngles = var_662_13
			end

			local var_662_14 = arg_659_1.actors_["1071ui_story"]
			local var_662_15 = 0

			if var_662_15 < arg_659_1.time_ and arg_659_1.time_ <= var_662_15 + arg_662_0 and arg_659_1.var_.characterEffect1071ui_story == nil then
				arg_659_1.var_.characterEffect1071ui_story = var_662_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_16 = 0.2

			if var_662_15 <= arg_659_1.time_ and arg_659_1.time_ < var_662_15 + var_662_16 then
				local var_662_17 = (arg_659_1.time_ - var_662_15) / var_662_16

				if arg_659_1.var_.characterEffect1071ui_story then
					local var_662_18 = Mathf.Lerp(0, 0.5, var_662_17)

					arg_659_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_659_1.var_.characterEffect1071ui_story.fillRatio = var_662_18
				end
			end

			if arg_659_1.time_ >= var_662_15 + var_662_16 and arg_659_1.time_ < var_662_15 + var_662_16 + arg_662_0 and arg_659_1.var_.characterEffect1071ui_story then
				local var_662_19 = 0.5

				arg_659_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_659_1.var_.characterEffect1071ui_story.fillRatio = var_662_19
			end

			local var_662_20 = 0
			local var_662_21 = 0.225

			if var_662_20 < arg_659_1.time_ and arg_659_1.time_ <= var_662_20 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_22 = arg_659_1:FormatText(StoryNameCfg[389].name)

				arg_659_1.leftNameTxt_.text = var_662_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_23 = arg_659_1:GetWordFromCfg(120411163)
				local var_662_24 = arg_659_1:FormatText(var_662_23.content)

				arg_659_1.text_.text = var_662_24

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_25 = 9
				local var_662_26 = utf8.len(var_662_24)
				local var_662_27 = var_662_25 <= 0 and var_662_21 or var_662_21 * (var_662_26 / var_662_25)

				if var_662_27 > 0 and var_662_21 < var_662_27 then
					arg_659_1.talkMaxDuration = var_662_27

					if var_662_27 + var_662_20 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_27 + var_662_20
					end
				end

				arg_659_1.text_.text = var_662_24
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411163", "story_v_out_120411.awb") ~= 0 then
					local var_662_28 = manager.audio:GetVoiceLength("story_v_out_120411", "120411163", "story_v_out_120411.awb") / 1000

					if var_662_28 + var_662_20 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_28 + var_662_20
					end

					if var_662_23.prefab_name ~= "" and arg_659_1.actors_[var_662_23.prefab_name] ~= nil then
						local var_662_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_23.prefab_name].transform, "story_v_out_120411", "120411163", "story_v_out_120411.awb")

						arg_659_1:RecordAudio("120411163", var_662_29)
						arg_659_1:RecordAudio("120411163", var_662_29)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_120411", "120411163", "story_v_out_120411.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_120411", "120411163", "story_v_out_120411.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_30 = math.max(var_662_21, arg_659_1.talkMaxDuration)

			if var_662_20 <= arg_659_1.time_ and arg_659_1.time_ < var_662_20 + var_662_30 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_20) / var_662_30

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_20 + var_662_30 and arg_659_1.time_ < var_662_20 + var_662_30 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play120411164 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 120411164
		arg_663_1.duration_ = 7.8

		local var_663_0 = {
			zh = 4.3,
			ja = 7.8
		}
		local var_663_1 = manager.audio:GetLocalizationFlag()

		if var_663_0[var_663_1] ~= nil then
			arg_663_1.duration_ = var_663_0[var_663_1]
		end

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play120411165(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1076ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1076ui_story == nil then
				arg_663_1.var_.characterEffect1076ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.2

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1076ui_story then
					local var_666_4 = Mathf.Lerp(0, 0.5, var_666_3)

					arg_663_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_663_1.var_.characterEffect1076ui_story.fillRatio = var_666_4
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1076ui_story then
				local var_666_5 = 0.5

				arg_663_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_663_1.var_.characterEffect1076ui_story.fillRatio = var_666_5
			end

			local var_666_6 = arg_663_1.actors_["1071ui_story"]
			local var_666_7 = 0

			if var_666_7 < arg_663_1.time_ and arg_663_1.time_ <= var_666_7 + arg_666_0 and arg_663_1.var_.characterEffect1071ui_story == nil then
				arg_663_1.var_.characterEffect1071ui_story = var_666_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_8 = 0.2

			if var_666_7 <= arg_663_1.time_ and arg_663_1.time_ < var_666_7 + var_666_8 then
				local var_666_9 = (arg_663_1.time_ - var_666_7) / var_666_8

				if arg_663_1.var_.characterEffect1071ui_story then
					arg_663_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_663_1.time_ >= var_666_7 + var_666_8 and arg_663_1.time_ < var_666_7 + var_666_8 + arg_666_0 and arg_663_1.var_.characterEffect1071ui_story then
				arg_663_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_666_10 = 0

			if var_666_10 < arg_663_1.time_ and arg_663_1.time_ <= var_666_10 + arg_666_0 then
				arg_663_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_666_11 = 0
			local var_666_12 = 0.425

			if var_666_11 < arg_663_1.time_ and arg_663_1.time_ <= var_666_11 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_13 = arg_663_1:FormatText(StoryNameCfg[384].name)

				arg_663_1.leftNameTxt_.text = var_666_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_14 = arg_663_1:GetWordFromCfg(120411164)
				local var_666_15 = arg_663_1:FormatText(var_666_14.content)

				arg_663_1.text_.text = var_666_15

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_16 = 17
				local var_666_17 = utf8.len(var_666_15)
				local var_666_18 = var_666_16 <= 0 and var_666_12 or var_666_12 * (var_666_17 / var_666_16)

				if var_666_18 > 0 and var_666_12 < var_666_18 then
					arg_663_1.talkMaxDuration = var_666_18

					if var_666_18 + var_666_11 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_18 + var_666_11
					end
				end

				arg_663_1.text_.text = var_666_15
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411164", "story_v_out_120411.awb") ~= 0 then
					local var_666_19 = manager.audio:GetVoiceLength("story_v_out_120411", "120411164", "story_v_out_120411.awb") / 1000

					if var_666_19 + var_666_11 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_19 + var_666_11
					end

					if var_666_14.prefab_name ~= "" and arg_663_1.actors_[var_666_14.prefab_name] ~= nil then
						local var_666_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_14.prefab_name].transform, "story_v_out_120411", "120411164", "story_v_out_120411.awb")

						arg_663_1:RecordAudio("120411164", var_666_20)
						arg_663_1:RecordAudio("120411164", var_666_20)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_120411", "120411164", "story_v_out_120411.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_120411", "120411164", "story_v_out_120411.awb")
				end

				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_21 = math.max(var_666_12, arg_663_1.talkMaxDuration)

			if var_666_11 <= arg_663_1.time_ and arg_663_1.time_ < var_666_11 + var_666_21 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_11) / var_666_21

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_11 + var_666_21 and arg_663_1.time_ < var_666_11 + var_666_21 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play120411165 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 120411165
		arg_667_1.duration_ = 8.4

		local var_667_0 = {
			zh = 4.066,
			ja = 8.4
		}
		local var_667_1 = manager.audio:GetLocalizationFlag()

		if var_667_0[var_667_1] ~= nil then
			arg_667_1.duration_ = var_667_0[var_667_1]
		end

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play120411166(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action7_1")
			end

			local var_670_1 = 0
			local var_670_2 = 0.45

			if var_670_1 < arg_667_1.time_ and arg_667_1.time_ <= var_670_1 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_3 = arg_667_1:FormatText(StoryNameCfg[384].name)

				arg_667_1.leftNameTxt_.text = var_670_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_4 = arg_667_1:GetWordFromCfg(120411165)
				local var_670_5 = arg_667_1:FormatText(var_670_4.content)

				arg_667_1.text_.text = var_670_5

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_6 = 18
				local var_670_7 = utf8.len(var_670_5)
				local var_670_8 = var_670_6 <= 0 and var_670_2 or var_670_2 * (var_670_7 / var_670_6)

				if var_670_8 > 0 and var_670_2 < var_670_8 then
					arg_667_1.talkMaxDuration = var_670_8

					if var_670_8 + var_670_1 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_8 + var_670_1
					end
				end

				arg_667_1.text_.text = var_670_5
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411165", "story_v_out_120411.awb") ~= 0 then
					local var_670_9 = manager.audio:GetVoiceLength("story_v_out_120411", "120411165", "story_v_out_120411.awb") / 1000

					if var_670_9 + var_670_1 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_9 + var_670_1
					end

					if var_670_4.prefab_name ~= "" and arg_667_1.actors_[var_670_4.prefab_name] ~= nil then
						local var_670_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_4.prefab_name].transform, "story_v_out_120411", "120411165", "story_v_out_120411.awb")

						arg_667_1:RecordAudio("120411165", var_670_10)
						arg_667_1:RecordAudio("120411165", var_670_10)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_120411", "120411165", "story_v_out_120411.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_120411", "120411165", "story_v_out_120411.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_11 = math.max(var_670_2, arg_667_1.talkMaxDuration)

			if var_670_1 <= arg_667_1.time_ and arg_667_1.time_ < var_670_1 + var_670_11 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_1) / var_670_11

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_1 + var_670_11 and arg_667_1.time_ < var_670_1 + var_670_11 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play120411166 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 120411166
		arg_671_1.duration_ = 7

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play120411167(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.mask_.enabled = true
				arg_671_1.mask_.raycastTarget = true

				arg_671_1:SetGaussion(false)
			end

			local var_674_1 = 2

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_1 then
				local var_674_2 = (arg_671_1.time_ - var_674_0) / var_674_1
				local var_674_3 = Color.New(1, 1, 1)

				var_674_3.a = Mathf.Lerp(1, 0, var_674_2)
				arg_671_1.mask_.color = var_674_3
			end

			if arg_671_1.time_ >= var_674_0 + var_674_1 and arg_671_1.time_ < var_674_0 + var_674_1 + arg_674_0 then
				local var_674_4 = Color.New(1, 1, 1)
				local var_674_5 = 0

				arg_671_1.mask_.enabled = false
				var_674_4.a = var_674_5
				arg_671_1.mask_.color = var_674_4
			end

			local var_674_6 = "XH0203"

			if arg_671_1.bgs_[var_674_6] == nil then
				local var_674_7 = Object.Instantiate(arg_671_1.paintGo_)

				var_674_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_674_6)
				var_674_7.name = var_674_6
				var_674_7.transform.parent = arg_671_1.stage_.transform
				var_674_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_671_1.bgs_[var_674_6] = var_674_7
			end

			local var_674_8 = 0

			if var_674_8 < arg_671_1.time_ and arg_671_1.time_ <= var_674_8 + arg_674_0 then
				local var_674_9 = manager.ui.mainCamera.transform.localPosition
				local var_674_10 = Vector3.New(0, 0, 10) + Vector3.New(var_674_9.x, var_674_9.y, 0)
				local var_674_11 = arg_671_1.bgs_.XH0203

				var_674_11.transform.localPosition = var_674_10
				var_674_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_674_12 = var_674_11:GetComponent("SpriteRenderer")

				if var_674_12 and var_674_12.sprite then
					local var_674_13 = (var_674_11.transform.localPosition - var_674_9).z
					local var_674_14 = manager.ui.mainCameraCom_
					local var_674_15 = 2 * var_674_13 * Mathf.Tan(var_674_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_674_16 = var_674_15 * var_674_14.aspect
					local var_674_17 = var_674_12.sprite.bounds.size.x
					local var_674_18 = var_674_12.sprite.bounds.size.y
					local var_674_19 = var_674_16 / var_674_17
					local var_674_20 = var_674_15 / var_674_18
					local var_674_21 = var_674_20 < var_674_19 and var_674_19 or var_674_20

					var_674_11.transform.localScale = Vector3.New(var_674_21, var_674_21, 0)
				end

				for iter_674_0, iter_674_1 in pairs(arg_671_1.bgs_) do
					if iter_674_0 ~= "XH0203" then
						iter_674_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_674_22 = arg_671_1.actors_["1071ui_story"].transform
			local var_674_23 = 0

			if var_674_23 < arg_671_1.time_ and arg_671_1.time_ <= var_674_23 + arg_674_0 then
				arg_671_1.var_.moveOldPos1071ui_story = var_674_22.localPosition
			end

			local var_674_24 = 0.001

			if var_674_23 <= arg_671_1.time_ and arg_671_1.time_ < var_674_23 + var_674_24 then
				local var_674_25 = (arg_671_1.time_ - var_674_23) / var_674_24
				local var_674_26 = Vector3.New(0, 100, 0)

				var_674_22.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos1071ui_story, var_674_26, var_674_25)

				local var_674_27 = manager.ui.mainCamera.transform.position - var_674_22.position

				var_674_22.forward = Vector3.New(var_674_27.x, var_674_27.y, var_674_27.z)

				local var_674_28 = var_674_22.localEulerAngles

				var_674_28.z = 0
				var_674_28.x = 0
				var_674_22.localEulerAngles = var_674_28
			end

			if arg_671_1.time_ >= var_674_23 + var_674_24 and arg_671_1.time_ < var_674_23 + var_674_24 + arg_674_0 then
				var_674_22.localPosition = Vector3.New(0, 100, 0)

				local var_674_29 = manager.ui.mainCamera.transform.position - var_674_22.position

				var_674_22.forward = Vector3.New(var_674_29.x, var_674_29.y, var_674_29.z)

				local var_674_30 = var_674_22.localEulerAngles

				var_674_30.z = 0
				var_674_30.x = 0
				var_674_22.localEulerAngles = var_674_30
			end

			local var_674_31 = arg_671_1.actors_["1076ui_story"].transform
			local var_674_32 = 0

			if var_674_32 < arg_671_1.time_ and arg_671_1.time_ <= var_674_32 + arg_674_0 then
				arg_671_1.var_.moveOldPos1076ui_story = var_674_31.localPosition
			end

			local var_674_33 = 0.001

			if var_674_32 <= arg_671_1.time_ and arg_671_1.time_ < var_674_32 + var_674_33 then
				local var_674_34 = (arg_671_1.time_ - var_674_32) / var_674_33
				local var_674_35 = Vector3.New(0, 100, 0)

				var_674_31.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos1076ui_story, var_674_35, var_674_34)

				local var_674_36 = manager.ui.mainCamera.transform.position - var_674_31.position

				var_674_31.forward = Vector3.New(var_674_36.x, var_674_36.y, var_674_36.z)

				local var_674_37 = var_674_31.localEulerAngles

				var_674_37.z = 0
				var_674_37.x = 0
				var_674_31.localEulerAngles = var_674_37
			end

			if arg_671_1.time_ >= var_674_32 + var_674_33 and arg_671_1.time_ < var_674_32 + var_674_33 + arg_674_0 then
				var_674_31.localPosition = Vector3.New(0, 100, 0)

				local var_674_38 = manager.ui.mainCamera.transform.position - var_674_31.position

				var_674_31.forward = Vector3.New(var_674_38.x, var_674_38.y, var_674_38.z)

				local var_674_39 = var_674_31.localEulerAngles

				var_674_39.z = 0
				var_674_39.x = 0
				var_674_31.localEulerAngles = var_674_39
			end

			local var_674_40 = arg_671_1.bgs_.XH0203.transform
			local var_674_41 = 0

			if var_674_41 < arg_671_1.time_ and arg_671_1.time_ <= var_674_41 + arg_674_0 then
				arg_671_1.var_.moveOldPosXH0203 = var_674_40.localPosition
			end

			local var_674_42 = 0.001

			if var_674_41 <= arg_671_1.time_ and arg_671_1.time_ < var_674_41 + var_674_42 then
				local var_674_43 = (arg_671_1.time_ - var_674_41) / var_674_42
				local var_674_44 = Vector3.New(0, 1, 9.5)

				var_674_40.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPosXH0203, var_674_44, var_674_43)
			end

			if arg_671_1.time_ >= var_674_41 + var_674_42 and arg_671_1.time_ < var_674_41 + var_674_42 + arg_674_0 then
				var_674_40.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_674_45 = arg_671_1.bgs_.XH0203.transform
			local var_674_46 = 0.034

			if var_674_46 < arg_671_1.time_ and arg_671_1.time_ <= var_674_46 + arg_674_0 then
				arg_671_1.var_.moveOldPosXH0203 = var_674_45.localPosition
			end

			local var_674_47 = 3.5

			if var_674_46 <= arg_671_1.time_ and arg_671_1.time_ < var_674_46 + var_674_47 then
				local var_674_48 = (arg_671_1.time_ - var_674_46) / var_674_47
				local var_674_49 = Vector3.New(0, 1, 10)

				var_674_45.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPosXH0203, var_674_49, var_674_48)
			end

			if arg_671_1.time_ >= var_674_46 + var_674_47 and arg_671_1.time_ < var_674_46 + var_674_47 + arg_674_0 then
				var_674_45.localPosition = Vector3.New(0, 1, 10)
			end

			local var_674_50 = 2

			if var_674_50 < arg_671_1.time_ and arg_671_1.time_ <= var_674_50 + arg_674_0 then
				arg_671_1.allBtn_.enabled = false
			end

			local var_674_51 = 1.534

			if arg_671_1.time_ >= var_674_50 + var_674_51 and arg_671_1.time_ < var_674_50 + var_674_51 + arg_674_0 then
				arg_671_1.allBtn_.enabled = true
			end

			if arg_671_1.frameCnt_ <= 1 then
				arg_671_1.dialog_:SetActive(false)
			end

			local var_674_52 = 2
			local var_674_53 = 0.55

			if var_674_52 < arg_671_1.time_ and arg_671_1.time_ <= var_674_52 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0

				arg_671_1.dialog_:SetActive(true)

				local var_674_54 = LeanTween.value(arg_671_1.dialog_, 0, 1, 0.3)

				var_674_54:setOnUpdate(LuaHelper.FloatAction(function(arg_675_0)
					arg_671_1.dialogCg_.alpha = arg_675_0
				end))
				var_674_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_671_1.dialog_)
					var_674_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_671_1.duration_ = arg_671_1.duration_ + 0.3

				SetActive(arg_671_1.leftNameGo_, false)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_55 = arg_671_1:GetWordFromCfg(120411166)
				local var_674_56 = arg_671_1:FormatText(var_674_55.content)

				arg_671_1.text_.text = var_674_56

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_57 = 22
				local var_674_58 = utf8.len(var_674_56)
				local var_674_59 = var_674_57 <= 0 and var_674_53 or var_674_53 * (var_674_58 / var_674_57)

				if var_674_59 > 0 and var_674_53 < var_674_59 then
					arg_671_1.talkMaxDuration = var_674_59
					var_674_52 = var_674_52 + 0.3

					if var_674_59 + var_674_52 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_59 + var_674_52
					end
				end

				arg_671_1.text_.text = var_674_56
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)
				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_60 = var_674_52 + 0.3
			local var_674_61 = math.max(var_674_53, arg_671_1.talkMaxDuration)

			if var_674_60 <= arg_671_1.time_ and arg_671_1.time_ < var_674_60 + var_674_61 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_60) / var_674_61

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_60 + var_674_61 and arg_671_1.time_ < var_674_60 + var_674_61 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play120411167 = function(arg_677_0, arg_677_1)
		arg_677_1.time_ = 0
		arg_677_1.frameCnt_ = 0
		arg_677_1.state_ = "playing"
		arg_677_1.curTalkId_ = 120411167
		arg_677_1.duration_ = 4.833

		local var_677_0 = {
			zh = 3.366,
			ja = 4.833
		}
		local var_677_1 = manager.audio:GetLocalizationFlag()

		if var_677_0[var_677_1] ~= nil then
			arg_677_1.duration_ = var_677_0[var_677_1]
		end

		SetActive(arg_677_1.tipsGo_, false)

		function arg_677_1.onSingleLineFinish_()
			arg_677_1.onSingleLineUpdate_ = nil
			arg_677_1.onSingleLineFinish_ = nil
			arg_677_1.state_ = "waiting"
		end

		function arg_677_1.playNext_(arg_679_0)
			if arg_679_0 == 1 then
				arg_677_0:Play120411168(arg_677_1)
			end
		end

		function arg_677_1.onSingleLineUpdate_(arg_680_0)
			local var_680_0 = manager.ui.mainCamera.transform
			local var_680_1 = 0

			if var_680_1 < arg_677_1.time_ and arg_677_1.time_ <= var_680_1 + arg_680_0 then
				arg_677_1.var_.shakeOldPos = var_680_0.localPosition
			end

			local var_680_2 = 1

			if var_680_1 <= arg_677_1.time_ and arg_677_1.time_ < var_680_1 + var_680_2 then
				local var_680_3 = (arg_677_1.time_ - var_680_1) / 0.066
				local var_680_4, var_680_5 = math.modf(var_680_3)

				var_680_0.localPosition = Vector3.New(var_680_5 * 0.13, var_680_5 * 0.13, var_680_5 * 0.13) + arg_677_1.var_.shakeOldPos
			end

			if arg_677_1.time_ >= var_680_1 + var_680_2 and arg_677_1.time_ < var_680_1 + var_680_2 + arg_680_0 then
				var_680_0.localPosition = arg_677_1.var_.shakeOldPos
			end

			local var_680_6 = 0

			if var_680_6 < arg_677_1.time_ and arg_677_1.time_ <= var_680_6 + arg_680_0 then
				arg_677_1.allBtn_.enabled = false
			end

			local var_680_7 = 1

			if arg_677_1.time_ >= var_680_6 + var_680_7 and arg_677_1.time_ < var_680_6 + var_680_7 + arg_680_0 then
				arg_677_1.allBtn_.enabled = true
			end

			local var_680_8 = 0
			local var_680_9 = 0.3

			if var_680_8 < arg_677_1.time_ and arg_677_1.time_ <= var_680_8 + arg_680_0 then
				arg_677_1.talkMaxDuration = 0
				arg_677_1.dialogCg_.alpha = 1

				arg_677_1.dialog_:SetActive(true)
				SetActive(arg_677_1.leftNameGo_, true)

				local var_680_10 = arg_677_1:FormatText(StoryNameCfg[378].name)

				arg_677_1.leftNameTxt_.text = var_680_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_677_1.leftNameTxt_.transform)

				arg_677_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_677_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_677_1:RecordName(arg_677_1.leftNameTxt_.text)
				SetActive(arg_677_1.iconTrs_.gameObject, false)
				arg_677_1.callingController_:SetSelectedState("normal")

				local var_680_11 = arg_677_1:GetWordFromCfg(120411167)
				local var_680_12 = arg_677_1:FormatText(var_680_11.content)

				arg_677_1.text_.text = var_680_12

				LuaForUtil.ClearLinePrefixSymbol(arg_677_1.text_)

				local var_680_13 = 12
				local var_680_14 = utf8.len(var_680_12)
				local var_680_15 = var_680_13 <= 0 and var_680_9 or var_680_9 * (var_680_14 / var_680_13)

				if var_680_15 > 0 and var_680_9 < var_680_15 then
					arg_677_1.talkMaxDuration = var_680_15

					if var_680_15 + var_680_8 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_15 + var_680_8
					end
				end

				arg_677_1.text_.text = var_680_12
				arg_677_1.typewritter.percent = 0

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411167", "story_v_out_120411.awb") ~= 0 then
					local var_680_16 = manager.audio:GetVoiceLength("story_v_out_120411", "120411167", "story_v_out_120411.awb") / 1000

					if var_680_16 + var_680_8 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_16 + var_680_8
					end

					if var_680_11.prefab_name ~= "" and arg_677_1.actors_[var_680_11.prefab_name] ~= nil then
						local var_680_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_677_1.actors_[var_680_11.prefab_name].transform, "story_v_out_120411", "120411167", "story_v_out_120411.awb")

						arg_677_1:RecordAudio("120411167", var_680_17)
						arg_677_1:RecordAudio("120411167", var_680_17)
					else
						arg_677_1:AudioAction("play", "voice", "story_v_out_120411", "120411167", "story_v_out_120411.awb")
					end

					arg_677_1:RecordHistoryTalkVoice("story_v_out_120411", "120411167", "story_v_out_120411.awb")
				end

				arg_677_1:RecordContent(arg_677_1.text_.text)
			end

			local var_680_18 = math.max(var_680_9, arg_677_1.talkMaxDuration)

			if var_680_8 <= arg_677_1.time_ and arg_677_1.time_ < var_680_8 + var_680_18 then
				arg_677_1.typewritter.percent = (arg_677_1.time_ - var_680_8) / var_680_18

				arg_677_1.typewritter:SetDirty()
			end

			if arg_677_1.time_ >= var_680_8 + var_680_18 and arg_677_1.time_ < var_680_8 + var_680_18 + arg_680_0 then
				arg_677_1.typewritter.percent = 1

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(true)
			end
		end
	end,
	Play120411168 = function(arg_681_0, arg_681_1)
		arg_681_1.time_ = 0
		arg_681_1.frameCnt_ = 0
		arg_681_1.state_ = "playing"
		arg_681_1.curTalkId_ = 120411168
		arg_681_1.duration_ = 5

		SetActive(arg_681_1.tipsGo_, false)

		function arg_681_1.onSingleLineFinish_()
			arg_681_1.onSingleLineUpdate_ = nil
			arg_681_1.onSingleLineFinish_ = nil
			arg_681_1.state_ = "waiting"
		end

		function arg_681_1.playNext_(arg_683_0)
			if arg_683_0 == 1 then
				arg_681_0:Play120411169(arg_681_1)
			end
		end

		function arg_681_1.onSingleLineUpdate_(arg_684_0)
			local var_684_0 = 0
			local var_684_1 = 0.775

			if var_684_0 < arg_681_1.time_ and arg_681_1.time_ <= var_684_0 + arg_684_0 then
				arg_681_1.talkMaxDuration = 0
				arg_681_1.dialogCg_.alpha = 1

				arg_681_1.dialog_:SetActive(true)
				SetActive(arg_681_1.leftNameGo_, false)

				arg_681_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_681_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_681_1:RecordName(arg_681_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_681_1.iconTrs_.gameObject, false)
				arg_681_1.callingController_:SetSelectedState("normal")

				local var_684_2 = arg_681_1:GetWordFromCfg(120411168)
				local var_684_3 = arg_681_1:FormatText(var_684_2.content)

				arg_681_1.text_.text = var_684_3

				LuaForUtil.ClearLinePrefixSymbol(arg_681_1.text_)

				local var_684_4 = 31
				local var_684_5 = utf8.len(var_684_3)
				local var_684_6 = var_684_4 <= 0 and var_684_1 or var_684_1 * (var_684_5 / var_684_4)

				if var_684_6 > 0 and var_684_1 < var_684_6 then
					arg_681_1.talkMaxDuration = var_684_6

					if var_684_6 + var_684_0 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_6 + var_684_0
					end
				end

				arg_681_1.text_.text = var_684_3
				arg_681_1.typewritter.percent = 0

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(false)
				arg_681_1:RecordContent(arg_681_1.text_.text)
			end

			local var_684_7 = math.max(var_684_1, arg_681_1.talkMaxDuration)

			if var_684_0 <= arg_681_1.time_ and arg_681_1.time_ < var_684_0 + var_684_7 then
				arg_681_1.typewritter.percent = (arg_681_1.time_ - var_684_0) / var_684_7

				arg_681_1.typewritter:SetDirty()
			end

			if arg_681_1.time_ >= var_684_0 + var_684_7 and arg_681_1.time_ < var_684_0 + var_684_7 + arg_684_0 then
				arg_681_1.typewritter.percent = 1

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(true)
			end
		end
	end,
	Play120411169 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 120411169
		arg_685_1.duration_ = 4.766

		local var_685_0 = {
			zh = 4.766,
			ja = 4.7
		}
		local var_685_1 = manager.audio:GetLocalizationFlag()

		if var_685_0[var_685_1] ~= nil then
			arg_685_1.duration_ = var_685_0[var_685_1]
		end

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
		end

		function arg_685_1.playNext_(arg_687_0)
			if arg_687_0 == 1 then
				arg_685_0:Play120411170(arg_685_1)
			end
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = 0
			local var_688_1 = 0.475

			if var_688_0 < arg_685_1.time_ and arg_685_1.time_ <= var_688_0 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, true)

				local var_688_2 = arg_685_1:FormatText(StoryNameCfg[389].name)

				arg_685_1.leftNameTxt_.text = var_688_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_685_1.leftNameTxt_.transform)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1.leftNameTxt_.text)
				SetActive(arg_685_1.iconTrs_.gameObject, false)
				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_3 = arg_685_1:GetWordFromCfg(120411169)
				local var_688_4 = arg_685_1:FormatText(var_688_3.content)

				arg_685_1.text_.text = var_688_4

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_5 = 19
				local var_688_6 = utf8.len(var_688_4)
				local var_688_7 = var_688_5 <= 0 and var_688_1 or var_688_1 * (var_688_6 / var_688_5)

				if var_688_7 > 0 and var_688_1 < var_688_7 then
					arg_685_1.talkMaxDuration = var_688_7

					if var_688_7 + var_688_0 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_7 + var_688_0
					end
				end

				arg_685_1.text_.text = var_688_4
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411169", "story_v_out_120411.awb") ~= 0 then
					local var_688_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411169", "story_v_out_120411.awb") / 1000

					if var_688_8 + var_688_0 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_8 + var_688_0
					end

					if var_688_3.prefab_name ~= "" and arg_685_1.actors_[var_688_3.prefab_name] ~= nil then
						local var_688_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_685_1.actors_[var_688_3.prefab_name].transform, "story_v_out_120411", "120411169", "story_v_out_120411.awb")

						arg_685_1:RecordAudio("120411169", var_688_9)
						arg_685_1:RecordAudio("120411169", var_688_9)
					else
						arg_685_1:AudioAction("play", "voice", "story_v_out_120411", "120411169", "story_v_out_120411.awb")
					end

					arg_685_1:RecordHistoryTalkVoice("story_v_out_120411", "120411169", "story_v_out_120411.awb")
				end

				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_10 = math.max(var_688_1, arg_685_1.talkMaxDuration)

			if var_688_0 <= arg_685_1.time_ and arg_685_1.time_ < var_688_0 + var_688_10 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_0) / var_688_10

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_0 + var_688_10 and arg_685_1.time_ < var_688_0 + var_688_10 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	Play120411170 = function(arg_689_0, arg_689_1)
		arg_689_1.time_ = 0
		arg_689_1.frameCnt_ = 0
		arg_689_1.state_ = "playing"
		arg_689_1.curTalkId_ = 120411170
		arg_689_1.duration_ = 5

		SetActive(arg_689_1.tipsGo_, false)

		function arg_689_1.onSingleLineFinish_()
			arg_689_1.onSingleLineUpdate_ = nil
			arg_689_1.onSingleLineFinish_ = nil
			arg_689_1.state_ = "waiting"
		end

		function arg_689_1.playNext_(arg_691_0)
			if arg_691_0 == 1 then
				arg_689_0:Play120411171(arg_689_1)
			end
		end

		function arg_689_1.onSingleLineUpdate_(arg_692_0)
			local var_692_0 = 0
			local var_692_1 = 0.3

			if var_692_0 < arg_689_1.time_ and arg_689_1.time_ <= var_692_0 + arg_692_0 then
				arg_689_1.talkMaxDuration = 0
				arg_689_1.dialogCg_.alpha = 1

				arg_689_1.dialog_:SetActive(true)
				SetActive(arg_689_1.leftNameGo_, true)

				local var_692_2 = arg_689_1:FormatText(StoryNameCfg[7].name)

				arg_689_1.leftNameTxt_.text = var_692_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_689_1.leftNameTxt_.transform)

				arg_689_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_689_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_689_1:RecordName(arg_689_1.leftNameTxt_.text)
				SetActive(arg_689_1.iconTrs_.gameObject, false)
				arg_689_1.callingController_:SetSelectedState("normal")

				local var_692_3 = arg_689_1:GetWordFromCfg(120411170)
				local var_692_4 = arg_689_1:FormatText(var_692_3.content)

				arg_689_1.text_.text = var_692_4

				LuaForUtil.ClearLinePrefixSymbol(arg_689_1.text_)

				local var_692_5 = 12
				local var_692_6 = utf8.len(var_692_4)
				local var_692_7 = var_692_5 <= 0 and var_692_1 or var_692_1 * (var_692_6 / var_692_5)

				if var_692_7 > 0 and var_692_1 < var_692_7 then
					arg_689_1.talkMaxDuration = var_692_7

					if var_692_7 + var_692_0 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_7 + var_692_0
					end
				end

				arg_689_1.text_.text = var_692_4
				arg_689_1.typewritter.percent = 0

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(false)
				arg_689_1:RecordContent(arg_689_1.text_.text)
			end

			local var_692_8 = math.max(var_692_1, arg_689_1.talkMaxDuration)

			if var_692_0 <= arg_689_1.time_ and arg_689_1.time_ < var_692_0 + var_692_8 then
				arg_689_1.typewritter.percent = (arg_689_1.time_ - var_692_0) / var_692_8

				arg_689_1.typewritter:SetDirty()
			end

			if arg_689_1.time_ >= var_692_0 + var_692_8 and arg_689_1.time_ < var_692_0 + var_692_8 + arg_692_0 then
				arg_689_1.typewritter.percent = 1

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(true)
			end
		end
	end,
	Play120411171 = function(arg_693_0, arg_693_1)
		arg_693_1.time_ = 0
		arg_693_1.frameCnt_ = 0
		arg_693_1.state_ = "playing"
		arg_693_1.curTalkId_ = 120411171
		arg_693_1.duration_ = 5

		SetActive(arg_693_1.tipsGo_, false)

		function arg_693_1.onSingleLineFinish_()
			arg_693_1.onSingleLineUpdate_ = nil
			arg_693_1.onSingleLineFinish_ = nil
			arg_693_1.state_ = "waiting"
		end

		function arg_693_1.playNext_(arg_695_0)
			if arg_695_0 == 1 then
				arg_693_0:Play120411172(arg_693_1)
			end
		end

		function arg_693_1.onSingleLineUpdate_(arg_696_0)
			local var_696_0 = 0
			local var_696_1 = 0.575

			if var_696_0 < arg_693_1.time_ and arg_693_1.time_ <= var_696_0 + arg_696_0 then
				arg_693_1.talkMaxDuration = 0
				arg_693_1.dialogCg_.alpha = 1

				arg_693_1.dialog_:SetActive(true)
				SetActive(arg_693_1.leftNameGo_, false)

				arg_693_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_693_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_693_1:RecordName(arg_693_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_693_1.iconTrs_.gameObject, false)
				arg_693_1.callingController_:SetSelectedState("normal")

				local var_696_2 = arg_693_1:GetWordFromCfg(120411171)
				local var_696_3 = arg_693_1:FormatText(var_696_2.content)

				arg_693_1.text_.text = var_696_3

				LuaForUtil.ClearLinePrefixSymbol(arg_693_1.text_)

				local var_696_4 = 23
				local var_696_5 = utf8.len(var_696_3)
				local var_696_6 = var_696_4 <= 0 and var_696_1 or var_696_1 * (var_696_5 / var_696_4)

				if var_696_6 > 0 and var_696_1 < var_696_6 then
					arg_693_1.talkMaxDuration = var_696_6

					if var_696_6 + var_696_0 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_6 + var_696_0
					end
				end

				arg_693_1.text_.text = var_696_3
				arg_693_1.typewritter.percent = 0

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(false)
				arg_693_1:RecordContent(arg_693_1.text_.text)
			end

			local var_696_7 = math.max(var_696_1, arg_693_1.talkMaxDuration)

			if var_696_0 <= arg_693_1.time_ and arg_693_1.time_ < var_696_0 + var_696_7 then
				arg_693_1.typewritter.percent = (arg_693_1.time_ - var_696_0) / var_696_7

				arg_693_1.typewritter:SetDirty()
			end

			if arg_693_1.time_ >= var_696_0 + var_696_7 and arg_693_1.time_ < var_696_0 + var_696_7 + arg_696_0 then
				arg_693_1.typewritter.percent = 1

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(true)
			end
		end
	end,
	Play120411172 = function(arg_697_0, arg_697_1)
		arg_697_1.time_ = 0
		arg_697_1.frameCnt_ = 0
		arg_697_1.state_ = "playing"
		arg_697_1.curTalkId_ = 120411172
		arg_697_1.duration_ = 3.4

		local var_697_0 = {
			zh = 2.1,
			ja = 3.4
		}
		local var_697_1 = manager.audio:GetLocalizationFlag()

		if var_697_0[var_697_1] ~= nil then
			arg_697_1.duration_ = var_697_0[var_697_1]
		end

		SetActive(arg_697_1.tipsGo_, false)

		function arg_697_1.onSingleLineFinish_()
			arg_697_1.onSingleLineUpdate_ = nil
			arg_697_1.onSingleLineFinish_ = nil
			arg_697_1.state_ = "waiting"
		end

		function arg_697_1.playNext_(arg_699_0)
			if arg_699_0 == 1 then
				arg_697_0:Play120411173(arg_697_1)
			end
		end

		function arg_697_1.onSingleLineUpdate_(arg_700_0)
			local var_700_0 = 0
			local var_700_1 = 0.25

			if var_700_0 < arg_697_1.time_ and arg_697_1.time_ <= var_700_0 + arg_700_0 then
				arg_697_1.talkMaxDuration = 0
				arg_697_1.dialogCg_.alpha = 1

				arg_697_1.dialog_:SetActive(true)
				SetActive(arg_697_1.leftNameGo_, true)

				local var_700_2 = arg_697_1:FormatText(StoryNameCfg[389].name)

				arg_697_1.leftNameTxt_.text = var_700_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_697_1.leftNameTxt_.transform)

				arg_697_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_697_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_697_1:RecordName(arg_697_1.leftNameTxt_.text)
				SetActive(arg_697_1.iconTrs_.gameObject, false)
				arg_697_1.callingController_:SetSelectedState("normal")

				local var_700_3 = arg_697_1:GetWordFromCfg(120411172)
				local var_700_4 = arg_697_1:FormatText(var_700_3.content)

				arg_697_1.text_.text = var_700_4

				LuaForUtil.ClearLinePrefixSymbol(arg_697_1.text_)

				local var_700_5 = 10
				local var_700_6 = utf8.len(var_700_4)
				local var_700_7 = var_700_5 <= 0 and var_700_1 or var_700_1 * (var_700_6 / var_700_5)

				if var_700_7 > 0 and var_700_1 < var_700_7 then
					arg_697_1.talkMaxDuration = var_700_7

					if var_700_7 + var_700_0 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_7 + var_700_0
					end
				end

				arg_697_1.text_.text = var_700_4
				arg_697_1.typewritter.percent = 0

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411172", "story_v_out_120411.awb") ~= 0 then
					local var_700_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411172", "story_v_out_120411.awb") / 1000

					if var_700_8 + var_700_0 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_8 + var_700_0
					end

					if var_700_3.prefab_name ~= "" and arg_697_1.actors_[var_700_3.prefab_name] ~= nil then
						local var_700_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_697_1.actors_[var_700_3.prefab_name].transform, "story_v_out_120411", "120411172", "story_v_out_120411.awb")

						arg_697_1:RecordAudio("120411172", var_700_9)
						arg_697_1:RecordAudio("120411172", var_700_9)
					else
						arg_697_1:AudioAction("play", "voice", "story_v_out_120411", "120411172", "story_v_out_120411.awb")
					end

					arg_697_1:RecordHistoryTalkVoice("story_v_out_120411", "120411172", "story_v_out_120411.awb")
				end

				arg_697_1:RecordContent(arg_697_1.text_.text)
			end

			local var_700_10 = math.max(var_700_1, arg_697_1.talkMaxDuration)

			if var_700_0 <= arg_697_1.time_ and arg_697_1.time_ < var_700_0 + var_700_10 then
				arg_697_1.typewritter.percent = (arg_697_1.time_ - var_700_0) / var_700_10

				arg_697_1.typewritter:SetDirty()
			end

			if arg_697_1.time_ >= var_700_0 + var_700_10 and arg_697_1.time_ < var_700_0 + var_700_10 + arg_700_0 then
				arg_697_1.typewritter.percent = 1

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(true)
			end
		end
	end,
	Play120411173 = function(arg_701_0, arg_701_1)
		arg_701_1.time_ = 0
		arg_701_1.frameCnt_ = 0
		arg_701_1.state_ = "playing"
		arg_701_1.curTalkId_ = 120411173
		arg_701_1.duration_ = 7.7

		local var_701_0 = {
			zh = 4.1,
			ja = 7.7
		}
		local var_701_1 = manager.audio:GetLocalizationFlag()

		if var_701_0[var_701_1] ~= nil then
			arg_701_1.duration_ = var_701_0[var_701_1]
		end

		SetActive(arg_701_1.tipsGo_, false)

		function arg_701_1.onSingleLineFinish_()
			arg_701_1.onSingleLineUpdate_ = nil
			arg_701_1.onSingleLineFinish_ = nil
			arg_701_1.state_ = "waiting"
		end

		function arg_701_1.playNext_(arg_703_0)
			if arg_703_0 == 1 then
				arg_701_0:Play120411174(arg_701_1)
			end
		end

		function arg_701_1.onSingleLineUpdate_(arg_704_0)
			local var_704_0 = 0
			local var_704_1 = 0.25

			if var_704_0 < arg_701_1.time_ and arg_701_1.time_ <= var_704_0 + arg_704_0 then
				arg_701_1.talkMaxDuration = 0
				arg_701_1.dialogCg_.alpha = 1

				arg_701_1.dialog_:SetActive(true)
				SetActive(arg_701_1.leftNameGo_, true)

				local var_704_2 = arg_701_1:FormatText(StoryNameCfg[379].name)

				arg_701_1.leftNameTxt_.text = var_704_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_701_1.leftNameTxt_.transform)

				arg_701_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_701_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_701_1:RecordName(arg_701_1.leftNameTxt_.text)
				SetActive(arg_701_1.iconTrs_.gameObject, false)
				arg_701_1.callingController_:SetSelectedState("normal")

				local var_704_3 = arg_701_1:GetWordFromCfg(120411173)
				local var_704_4 = arg_701_1:FormatText(var_704_3.content)

				arg_701_1.text_.text = var_704_4

				LuaForUtil.ClearLinePrefixSymbol(arg_701_1.text_)

				local var_704_5 = 10
				local var_704_6 = utf8.len(var_704_4)
				local var_704_7 = var_704_5 <= 0 and var_704_1 or var_704_1 * (var_704_6 / var_704_5)

				if var_704_7 > 0 and var_704_1 < var_704_7 then
					arg_701_1.talkMaxDuration = var_704_7

					if var_704_7 + var_704_0 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_7 + var_704_0
					end
				end

				arg_701_1.text_.text = var_704_4
				arg_701_1.typewritter.percent = 0

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411173", "story_v_out_120411.awb") ~= 0 then
					local var_704_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411173", "story_v_out_120411.awb") / 1000

					if var_704_8 + var_704_0 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_8 + var_704_0
					end

					if var_704_3.prefab_name ~= "" and arg_701_1.actors_[var_704_3.prefab_name] ~= nil then
						local var_704_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_701_1.actors_[var_704_3.prefab_name].transform, "story_v_out_120411", "120411173", "story_v_out_120411.awb")

						arg_701_1:RecordAudio("120411173", var_704_9)
						arg_701_1:RecordAudio("120411173", var_704_9)
					else
						arg_701_1:AudioAction("play", "voice", "story_v_out_120411", "120411173", "story_v_out_120411.awb")
					end

					arg_701_1:RecordHistoryTalkVoice("story_v_out_120411", "120411173", "story_v_out_120411.awb")
				end

				arg_701_1:RecordContent(arg_701_1.text_.text)
			end

			local var_704_10 = math.max(var_704_1, arg_701_1.talkMaxDuration)

			if var_704_0 <= arg_701_1.time_ and arg_701_1.time_ < var_704_0 + var_704_10 then
				arg_701_1.typewritter.percent = (arg_701_1.time_ - var_704_0) / var_704_10

				arg_701_1.typewritter:SetDirty()
			end

			if arg_701_1.time_ >= var_704_0 + var_704_10 and arg_701_1.time_ < var_704_0 + var_704_10 + arg_704_0 then
				arg_701_1.typewritter.percent = 1

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(true)
			end
		end
	end,
	Play120411174 = function(arg_705_0, arg_705_1)
		arg_705_1.time_ = 0
		arg_705_1.frameCnt_ = 0
		arg_705_1.state_ = "playing"
		arg_705_1.curTalkId_ = 120411174
		arg_705_1.duration_ = 3.4

		local var_705_0 = {
			zh = 2.766,
			ja = 3.4
		}
		local var_705_1 = manager.audio:GetLocalizationFlag()

		if var_705_0[var_705_1] ~= nil then
			arg_705_1.duration_ = var_705_0[var_705_1]
		end

		SetActive(arg_705_1.tipsGo_, false)

		function arg_705_1.onSingleLineFinish_()
			arg_705_1.onSingleLineUpdate_ = nil
			arg_705_1.onSingleLineFinish_ = nil
			arg_705_1.state_ = "waiting"
		end

		function arg_705_1.playNext_(arg_707_0)
			if arg_707_0 == 1 then
				arg_705_0:Play120411175(arg_705_1)
			end
		end

		function arg_705_1.onSingleLineUpdate_(arg_708_0)
			local var_708_0 = 0
			local var_708_1 = 0.25

			if var_708_0 < arg_705_1.time_ and arg_705_1.time_ <= var_708_0 + arg_708_0 then
				arg_705_1.talkMaxDuration = 0
				arg_705_1.dialogCg_.alpha = 1

				arg_705_1.dialog_:SetActive(true)
				SetActive(arg_705_1.leftNameGo_, true)

				local var_708_2 = arg_705_1:FormatText(StoryNameCfg[389].name)

				arg_705_1.leftNameTxt_.text = var_708_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_705_1.leftNameTxt_.transform)

				arg_705_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_705_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_705_1:RecordName(arg_705_1.leftNameTxt_.text)
				SetActive(arg_705_1.iconTrs_.gameObject, false)
				arg_705_1.callingController_:SetSelectedState("normal")

				local var_708_3 = arg_705_1:GetWordFromCfg(120411174)
				local var_708_4 = arg_705_1:FormatText(var_708_3.content)

				arg_705_1.text_.text = var_708_4

				LuaForUtil.ClearLinePrefixSymbol(arg_705_1.text_)

				local var_708_5 = 10
				local var_708_6 = utf8.len(var_708_4)
				local var_708_7 = var_708_5 <= 0 and var_708_1 or var_708_1 * (var_708_6 / var_708_5)

				if var_708_7 > 0 and var_708_1 < var_708_7 then
					arg_705_1.talkMaxDuration = var_708_7

					if var_708_7 + var_708_0 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_7 + var_708_0
					end
				end

				arg_705_1.text_.text = var_708_4
				arg_705_1.typewritter.percent = 0

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411174", "story_v_out_120411.awb") ~= 0 then
					local var_708_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411174", "story_v_out_120411.awb") / 1000

					if var_708_8 + var_708_0 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_8 + var_708_0
					end

					if var_708_3.prefab_name ~= "" and arg_705_1.actors_[var_708_3.prefab_name] ~= nil then
						local var_708_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_705_1.actors_[var_708_3.prefab_name].transform, "story_v_out_120411", "120411174", "story_v_out_120411.awb")

						arg_705_1:RecordAudio("120411174", var_708_9)
						arg_705_1:RecordAudio("120411174", var_708_9)
					else
						arg_705_1:AudioAction("play", "voice", "story_v_out_120411", "120411174", "story_v_out_120411.awb")
					end

					arg_705_1:RecordHistoryTalkVoice("story_v_out_120411", "120411174", "story_v_out_120411.awb")
				end

				arg_705_1:RecordContent(arg_705_1.text_.text)
			end

			local var_708_10 = math.max(var_708_1, arg_705_1.talkMaxDuration)

			if var_708_0 <= arg_705_1.time_ and arg_705_1.time_ < var_708_0 + var_708_10 then
				arg_705_1.typewritter.percent = (arg_705_1.time_ - var_708_0) / var_708_10

				arg_705_1.typewritter:SetDirty()
			end

			if arg_705_1.time_ >= var_708_0 + var_708_10 and arg_705_1.time_ < var_708_0 + var_708_10 + arg_708_0 then
				arg_705_1.typewritter.percent = 1

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(true)
			end
		end
	end,
	Play120411175 = function(arg_709_0, arg_709_1)
		arg_709_1.time_ = 0
		arg_709_1.frameCnt_ = 0
		arg_709_1.state_ = "playing"
		arg_709_1.curTalkId_ = 120411175
		arg_709_1.duration_ = 4.1

		local var_709_0 = {
			zh = 4.1,
			ja = 2.9
		}
		local var_709_1 = manager.audio:GetLocalizationFlag()

		if var_709_0[var_709_1] ~= nil then
			arg_709_1.duration_ = var_709_0[var_709_1]
		end

		SetActive(arg_709_1.tipsGo_, false)

		function arg_709_1.onSingleLineFinish_()
			arg_709_1.onSingleLineUpdate_ = nil
			arg_709_1.onSingleLineFinish_ = nil
			arg_709_1.state_ = "waiting"
		end

		function arg_709_1.playNext_(arg_711_0)
			if arg_711_0 == 1 then
				arg_709_0:Play120411176(arg_709_1)
			end
		end

		function arg_709_1.onSingleLineUpdate_(arg_712_0)
			local var_712_0 = 0
			local var_712_1 = 0.225

			if var_712_0 < arg_709_1.time_ and arg_709_1.time_ <= var_712_0 + arg_712_0 then
				arg_709_1.talkMaxDuration = 0
				arg_709_1.dialogCg_.alpha = 1

				arg_709_1.dialog_:SetActive(true)
				SetActive(arg_709_1.leftNameGo_, true)

				local var_712_2 = arg_709_1:FormatText(StoryNameCfg[379].name)

				arg_709_1.leftNameTxt_.text = var_712_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_709_1.leftNameTxt_.transform)

				arg_709_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_709_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_709_1:RecordName(arg_709_1.leftNameTxt_.text)
				SetActive(arg_709_1.iconTrs_.gameObject, false)
				arg_709_1.callingController_:SetSelectedState("normal")

				local var_712_3 = arg_709_1:GetWordFromCfg(120411175)
				local var_712_4 = arg_709_1:FormatText(var_712_3.content)

				arg_709_1.text_.text = var_712_4

				LuaForUtil.ClearLinePrefixSymbol(arg_709_1.text_)

				local var_712_5 = 9
				local var_712_6 = utf8.len(var_712_4)
				local var_712_7 = var_712_5 <= 0 and var_712_1 or var_712_1 * (var_712_6 / var_712_5)

				if var_712_7 > 0 and var_712_1 < var_712_7 then
					arg_709_1.talkMaxDuration = var_712_7

					if var_712_7 + var_712_0 > arg_709_1.duration_ then
						arg_709_1.duration_ = var_712_7 + var_712_0
					end
				end

				arg_709_1.text_.text = var_712_4
				arg_709_1.typewritter.percent = 0

				arg_709_1.typewritter:SetDirty()
				arg_709_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411175", "story_v_out_120411.awb") ~= 0 then
					local var_712_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411175", "story_v_out_120411.awb") / 1000

					if var_712_8 + var_712_0 > arg_709_1.duration_ then
						arg_709_1.duration_ = var_712_8 + var_712_0
					end

					if var_712_3.prefab_name ~= "" and arg_709_1.actors_[var_712_3.prefab_name] ~= nil then
						local var_712_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_709_1.actors_[var_712_3.prefab_name].transform, "story_v_out_120411", "120411175", "story_v_out_120411.awb")

						arg_709_1:RecordAudio("120411175", var_712_9)
						arg_709_1:RecordAudio("120411175", var_712_9)
					else
						arg_709_1:AudioAction("play", "voice", "story_v_out_120411", "120411175", "story_v_out_120411.awb")
					end

					arg_709_1:RecordHistoryTalkVoice("story_v_out_120411", "120411175", "story_v_out_120411.awb")
				end

				arg_709_1:RecordContent(arg_709_1.text_.text)
			end

			local var_712_10 = math.max(var_712_1, arg_709_1.talkMaxDuration)

			if var_712_0 <= arg_709_1.time_ and arg_709_1.time_ < var_712_0 + var_712_10 then
				arg_709_1.typewritter.percent = (arg_709_1.time_ - var_712_0) / var_712_10

				arg_709_1.typewritter:SetDirty()
			end

			if arg_709_1.time_ >= var_712_0 + var_712_10 and arg_709_1.time_ < var_712_0 + var_712_10 + arg_712_0 then
				arg_709_1.typewritter.percent = 1

				arg_709_1.typewritter:SetDirty()
				arg_709_1:ShowNextGo(true)
			end
		end
	end,
	Play120411176 = function(arg_713_0, arg_713_1)
		arg_713_1.time_ = 0
		arg_713_1.frameCnt_ = 0
		arg_713_1.state_ = "playing"
		arg_713_1.curTalkId_ = 120411176
		arg_713_1.duration_ = 5.2

		local var_713_0 = {
			zh = 2.766,
			ja = 5.2
		}
		local var_713_1 = manager.audio:GetLocalizationFlag()

		if var_713_0[var_713_1] ~= nil then
			arg_713_1.duration_ = var_713_0[var_713_1]
		end

		SetActive(arg_713_1.tipsGo_, false)

		function arg_713_1.onSingleLineFinish_()
			arg_713_1.onSingleLineUpdate_ = nil
			arg_713_1.onSingleLineFinish_ = nil
			arg_713_1.state_ = "waiting"
		end

		function arg_713_1.playNext_(arg_715_0)
			if arg_715_0 == 1 then
				arg_713_0:Play120411177(arg_713_1)
			end
		end

		function arg_713_1.onSingleLineUpdate_(arg_716_0)
			local var_716_0 = 0
			local var_716_1 = 0.325

			if var_716_0 < arg_713_1.time_ and arg_713_1.time_ <= var_716_0 + arg_716_0 then
				arg_713_1.talkMaxDuration = 0
				arg_713_1.dialogCg_.alpha = 1

				arg_713_1.dialog_:SetActive(true)
				SetActive(arg_713_1.leftNameGo_, true)

				local var_716_2 = arg_713_1:FormatText(StoryNameCfg[379].name)

				arg_713_1.leftNameTxt_.text = var_716_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_713_1.leftNameTxt_.transform)

				arg_713_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_713_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_713_1:RecordName(arg_713_1.leftNameTxt_.text)
				SetActive(arg_713_1.iconTrs_.gameObject, false)
				arg_713_1.callingController_:SetSelectedState("normal")

				local var_716_3 = arg_713_1:GetWordFromCfg(120411176)
				local var_716_4 = arg_713_1:FormatText(var_716_3.content)

				arg_713_1.text_.text = var_716_4

				LuaForUtil.ClearLinePrefixSymbol(arg_713_1.text_)

				local var_716_5 = 13
				local var_716_6 = utf8.len(var_716_4)
				local var_716_7 = var_716_5 <= 0 and var_716_1 or var_716_1 * (var_716_6 / var_716_5)

				if var_716_7 > 0 and var_716_1 < var_716_7 then
					arg_713_1.talkMaxDuration = var_716_7

					if var_716_7 + var_716_0 > arg_713_1.duration_ then
						arg_713_1.duration_ = var_716_7 + var_716_0
					end
				end

				arg_713_1.text_.text = var_716_4
				arg_713_1.typewritter.percent = 0

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411176", "story_v_out_120411.awb") ~= 0 then
					local var_716_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411176", "story_v_out_120411.awb") / 1000

					if var_716_8 + var_716_0 > arg_713_1.duration_ then
						arg_713_1.duration_ = var_716_8 + var_716_0
					end

					if var_716_3.prefab_name ~= "" and arg_713_1.actors_[var_716_3.prefab_name] ~= nil then
						local var_716_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_713_1.actors_[var_716_3.prefab_name].transform, "story_v_out_120411", "120411176", "story_v_out_120411.awb")

						arg_713_1:RecordAudio("120411176", var_716_9)
						arg_713_1:RecordAudio("120411176", var_716_9)
					else
						arg_713_1:AudioAction("play", "voice", "story_v_out_120411", "120411176", "story_v_out_120411.awb")
					end

					arg_713_1:RecordHistoryTalkVoice("story_v_out_120411", "120411176", "story_v_out_120411.awb")
				end

				arg_713_1:RecordContent(arg_713_1.text_.text)
			end

			local var_716_10 = math.max(var_716_1, arg_713_1.talkMaxDuration)

			if var_716_0 <= arg_713_1.time_ and arg_713_1.time_ < var_716_0 + var_716_10 then
				arg_713_1.typewritter.percent = (arg_713_1.time_ - var_716_0) / var_716_10

				arg_713_1.typewritter:SetDirty()
			end

			if arg_713_1.time_ >= var_716_0 + var_716_10 and arg_713_1.time_ < var_716_0 + var_716_10 + arg_716_0 then
				arg_713_1.typewritter.percent = 1

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(true)
			end
		end
	end,
	Play120411177 = function(arg_717_0, arg_717_1)
		arg_717_1.time_ = 0
		arg_717_1.frameCnt_ = 0
		arg_717_1.state_ = "playing"
		arg_717_1.curTalkId_ = 120411177
		arg_717_1.duration_ = 5

		SetActive(arg_717_1.tipsGo_, false)

		function arg_717_1.onSingleLineFinish_()
			arg_717_1.onSingleLineUpdate_ = nil
			arg_717_1.onSingleLineFinish_ = nil
			arg_717_1.state_ = "waiting"
		end

		function arg_717_1.playNext_(arg_719_0)
			if arg_719_0 == 1 then
				arg_717_0:Play120411178(arg_717_1)
			end
		end

		function arg_717_1.onSingleLineUpdate_(arg_720_0)
			local var_720_0 = 0
			local var_720_1 = 1

			if var_720_0 < arg_717_1.time_ and arg_717_1.time_ <= var_720_0 + arg_720_0 then
				arg_717_1.talkMaxDuration = 0
				arg_717_1.dialogCg_.alpha = 1

				arg_717_1.dialog_:SetActive(true)
				SetActive(arg_717_1.leftNameGo_, false)

				arg_717_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_717_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_717_1:RecordName(arg_717_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_717_1.iconTrs_.gameObject, false)
				arg_717_1.callingController_:SetSelectedState("normal")

				local var_720_2 = arg_717_1:GetWordFromCfg(120411177)
				local var_720_3 = arg_717_1:FormatText(var_720_2.content)

				arg_717_1.text_.text = var_720_3

				LuaForUtil.ClearLinePrefixSymbol(arg_717_1.text_)

				local var_720_4 = 40
				local var_720_5 = utf8.len(var_720_3)
				local var_720_6 = var_720_4 <= 0 and var_720_1 or var_720_1 * (var_720_5 / var_720_4)

				if var_720_6 > 0 and var_720_1 < var_720_6 then
					arg_717_1.talkMaxDuration = var_720_6

					if var_720_6 + var_720_0 > arg_717_1.duration_ then
						arg_717_1.duration_ = var_720_6 + var_720_0
					end
				end

				arg_717_1.text_.text = var_720_3
				arg_717_1.typewritter.percent = 0

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(false)
				arg_717_1:RecordContent(arg_717_1.text_.text)
			end

			local var_720_7 = math.max(var_720_1, arg_717_1.talkMaxDuration)

			if var_720_0 <= arg_717_1.time_ and arg_717_1.time_ < var_720_0 + var_720_7 then
				arg_717_1.typewritter.percent = (arg_717_1.time_ - var_720_0) / var_720_7

				arg_717_1.typewritter:SetDirty()
			end

			if arg_717_1.time_ >= var_720_0 + var_720_7 and arg_717_1.time_ < var_720_0 + var_720_7 + arg_720_0 then
				arg_717_1.typewritter.percent = 1

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(true)
			end
		end
	end,
	Play120411178 = function(arg_721_0, arg_721_1)
		arg_721_1.time_ = 0
		arg_721_1.frameCnt_ = 0
		arg_721_1.state_ = "playing"
		arg_721_1.curTalkId_ = 120411178
		arg_721_1.duration_ = 9

		SetActive(arg_721_1.tipsGo_, false)

		function arg_721_1.onSingleLineFinish_()
			arg_721_1.onSingleLineUpdate_ = nil
			arg_721_1.onSingleLineFinish_ = nil
			arg_721_1.state_ = "waiting"
		end

		function arg_721_1.playNext_(arg_723_0)
			if arg_723_0 == 1 then
				arg_721_0:Play120411179(arg_721_1)
			end
		end

		function arg_721_1.onSingleLineUpdate_(arg_724_0)
			local var_724_0 = 2

			if var_724_0 < arg_721_1.time_ and arg_721_1.time_ <= var_724_0 + arg_724_0 then
				local var_724_1 = manager.ui.mainCamera.transform.localPosition
				local var_724_2 = Vector3.New(0, 0, 10) + Vector3.New(var_724_1.x, var_724_1.y, 0)
				local var_724_3 = arg_721_1.bgs_.ST29

				var_724_3.transform.localPosition = var_724_2
				var_724_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_724_4 = var_724_3:GetComponent("SpriteRenderer")

				if var_724_4 and var_724_4.sprite then
					local var_724_5 = (var_724_3.transform.localPosition - var_724_1).z
					local var_724_6 = manager.ui.mainCameraCom_
					local var_724_7 = 2 * var_724_5 * Mathf.Tan(var_724_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_724_8 = var_724_7 * var_724_6.aspect
					local var_724_9 = var_724_4.sprite.bounds.size.x
					local var_724_10 = var_724_4.sprite.bounds.size.y
					local var_724_11 = var_724_8 / var_724_9
					local var_724_12 = var_724_7 / var_724_10
					local var_724_13 = var_724_12 < var_724_11 and var_724_11 or var_724_12

					var_724_3.transform.localScale = Vector3.New(var_724_13, var_724_13, 0)
				end

				for iter_724_0, iter_724_1 in pairs(arg_721_1.bgs_) do
					if iter_724_0 ~= "ST29" then
						iter_724_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_724_14 = 0

			if var_724_14 < arg_721_1.time_ and arg_721_1.time_ <= var_724_14 + arg_724_0 then
				arg_721_1.mask_.enabled = true
				arg_721_1.mask_.raycastTarget = true

				arg_721_1:SetGaussion(false)
			end

			local var_724_15 = 2

			if var_724_14 <= arg_721_1.time_ and arg_721_1.time_ < var_724_14 + var_724_15 then
				local var_724_16 = (arg_721_1.time_ - var_724_14) / var_724_15
				local var_724_17 = Color.New(0, 0, 0)

				var_724_17.a = Mathf.Lerp(0, 1, var_724_16)
				arg_721_1.mask_.color = var_724_17
			end

			if arg_721_1.time_ >= var_724_14 + var_724_15 and arg_721_1.time_ < var_724_14 + var_724_15 + arg_724_0 then
				local var_724_18 = Color.New(0, 0, 0)

				var_724_18.a = 1
				arg_721_1.mask_.color = var_724_18
			end

			local var_724_19 = 2

			if var_724_19 < arg_721_1.time_ and arg_721_1.time_ <= var_724_19 + arg_724_0 then
				arg_721_1.mask_.enabled = true
				arg_721_1.mask_.raycastTarget = true

				arg_721_1:SetGaussion(false)
			end

			local var_724_20 = 2

			if var_724_19 <= arg_721_1.time_ and arg_721_1.time_ < var_724_19 + var_724_20 then
				local var_724_21 = (arg_721_1.time_ - var_724_19) / var_724_20
				local var_724_22 = Color.New(0, 0, 0)

				var_724_22.a = Mathf.Lerp(1, 0, var_724_21)
				arg_721_1.mask_.color = var_724_22
			end

			if arg_721_1.time_ >= var_724_19 + var_724_20 and arg_721_1.time_ < var_724_19 + var_724_20 + arg_724_0 then
				local var_724_23 = Color.New(0, 0, 0)
				local var_724_24 = 0

				arg_721_1.mask_.enabled = false
				var_724_23.a = var_724_24
				arg_721_1.mask_.color = var_724_23
			end

			if arg_721_1.frameCnt_ <= 1 then
				arg_721_1.dialog_:SetActive(false)
			end

			local var_724_25 = 4
			local var_724_26 = 0.85

			if var_724_25 < arg_721_1.time_ and arg_721_1.time_ <= var_724_25 + arg_724_0 then
				arg_721_1.talkMaxDuration = 0

				arg_721_1.dialog_:SetActive(true)

				local var_724_27 = LeanTween.value(arg_721_1.dialog_, 0, 1, 0.3)

				var_724_27:setOnUpdate(LuaHelper.FloatAction(function(arg_725_0)
					arg_721_1.dialogCg_.alpha = arg_725_0
				end))
				var_724_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_721_1.dialog_)
					var_724_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_721_1.duration_ = arg_721_1.duration_ + 0.3

				SetActive(arg_721_1.leftNameGo_, false)

				arg_721_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_721_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_721_1:RecordName(arg_721_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_721_1.iconTrs_.gameObject, false)
				arg_721_1.callingController_:SetSelectedState("normal")

				local var_724_28 = arg_721_1:GetWordFromCfg(120411178)
				local var_724_29 = arg_721_1:FormatText(var_724_28.content)

				arg_721_1.text_.text = var_724_29

				LuaForUtil.ClearLinePrefixSymbol(arg_721_1.text_)

				local var_724_30 = 34
				local var_724_31 = utf8.len(var_724_29)
				local var_724_32 = var_724_30 <= 0 and var_724_26 or var_724_26 * (var_724_31 / var_724_30)

				if var_724_32 > 0 and var_724_26 < var_724_32 then
					arg_721_1.talkMaxDuration = var_724_32
					var_724_25 = var_724_25 + 0.3

					if var_724_32 + var_724_25 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_32 + var_724_25
					end
				end

				arg_721_1.text_.text = var_724_29
				arg_721_1.typewritter.percent = 0

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(false)
				arg_721_1:RecordContent(arg_721_1.text_.text)
			end

			local var_724_33 = var_724_25 + 0.3
			local var_724_34 = math.max(var_724_26, arg_721_1.talkMaxDuration)

			if var_724_33 <= arg_721_1.time_ and arg_721_1.time_ < var_724_33 + var_724_34 then
				arg_721_1.typewritter.percent = (arg_721_1.time_ - var_724_33) / var_724_34

				arg_721_1.typewritter:SetDirty()
			end

			if arg_721_1.time_ >= var_724_33 + var_724_34 and arg_721_1.time_ < var_724_33 + var_724_34 + arg_724_0 then
				arg_721_1.typewritter.percent = 1

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(true)
			end
		end
	end,
	Play120411179 = function(arg_727_0, arg_727_1)
		arg_727_1.time_ = 0
		arg_727_1.frameCnt_ = 0
		arg_727_1.state_ = "playing"
		arg_727_1.curTalkId_ = 120411179
		arg_727_1.duration_ = 5

		SetActive(arg_727_1.tipsGo_, false)

		function arg_727_1.onSingleLineFinish_()
			arg_727_1.onSingleLineUpdate_ = nil
			arg_727_1.onSingleLineFinish_ = nil
			arg_727_1.state_ = "waiting"
		end

		function arg_727_1.playNext_(arg_729_0)
			if arg_729_0 == 1 then
				arg_727_0:Play120411180(arg_727_1)
			end
		end

		function arg_727_1.onSingleLineUpdate_(arg_730_0)
			local var_730_0 = 0
			local var_730_1 = 0.725

			if var_730_0 < arg_727_1.time_ and arg_727_1.time_ <= var_730_0 + arg_730_0 then
				arg_727_1.talkMaxDuration = 0
				arg_727_1.dialogCg_.alpha = 1

				arg_727_1.dialog_:SetActive(true)
				SetActive(arg_727_1.leftNameGo_, false)

				arg_727_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_727_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_727_1:RecordName(arg_727_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_727_1.iconTrs_.gameObject, false)
				arg_727_1.callingController_:SetSelectedState("normal")

				local var_730_2 = arg_727_1:GetWordFromCfg(120411179)
				local var_730_3 = arg_727_1:FormatText(var_730_2.content)

				arg_727_1.text_.text = var_730_3

				LuaForUtil.ClearLinePrefixSymbol(arg_727_1.text_)

				local var_730_4 = 29
				local var_730_5 = utf8.len(var_730_3)
				local var_730_6 = var_730_4 <= 0 and var_730_1 or var_730_1 * (var_730_5 / var_730_4)

				if var_730_6 > 0 and var_730_1 < var_730_6 then
					arg_727_1.talkMaxDuration = var_730_6

					if var_730_6 + var_730_0 > arg_727_1.duration_ then
						arg_727_1.duration_ = var_730_6 + var_730_0
					end
				end

				arg_727_1.text_.text = var_730_3
				arg_727_1.typewritter.percent = 0

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(false)
				arg_727_1:RecordContent(arg_727_1.text_.text)
			end

			local var_730_7 = math.max(var_730_1, arg_727_1.talkMaxDuration)

			if var_730_0 <= arg_727_1.time_ and arg_727_1.time_ < var_730_0 + var_730_7 then
				arg_727_1.typewritter.percent = (arg_727_1.time_ - var_730_0) / var_730_7

				arg_727_1.typewritter:SetDirty()
			end

			if arg_727_1.time_ >= var_730_0 + var_730_7 and arg_727_1.time_ < var_730_0 + var_730_7 + arg_730_0 then
				arg_727_1.typewritter.percent = 1

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(true)
			end
		end
	end,
	Play120411180 = function(arg_731_0, arg_731_1)
		arg_731_1.time_ = 0
		arg_731_1.frameCnt_ = 0
		arg_731_1.state_ = "playing"
		arg_731_1.curTalkId_ = 120411180
		arg_731_1.duration_ = 4

		local var_731_0 = {
			zh = 3.566,
			ja = 4
		}
		local var_731_1 = manager.audio:GetLocalizationFlag()

		if var_731_0[var_731_1] ~= nil then
			arg_731_1.duration_ = var_731_0[var_731_1]
		end

		SetActive(arg_731_1.tipsGo_, false)

		function arg_731_1.onSingleLineFinish_()
			arg_731_1.onSingleLineUpdate_ = nil
			arg_731_1.onSingleLineFinish_ = nil
			arg_731_1.state_ = "waiting"
		end

		function arg_731_1.playNext_(arg_733_0)
			if arg_733_0 == 1 then
				arg_731_0:Play120411181(arg_731_1)
			end
		end

		function arg_731_1.onSingleLineUpdate_(arg_734_0)
			local var_734_0 = arg_731_1.actors_["1072ui_story"].transform
			local var_734_1 = 0

			if var_734_1 < arg_731_1.time_ and arg_731_1.time_ <= var_734_1 + arg_734_0 then
				arg_731_1.var_.moveOldPos1072ui_story = var_734_0.localPosition
			end

			local var_734_2 = 0.001

			if var_734_1 <= arg_731_1.time_ and arg_731_1.time_ < var_734_1 + var_734_2 then
				local var_734_3 = (arg_731_1.time_ - var_734_1) / var_734_2
				local var_734_4 = Vector3.New(0, -0.71, -6)

				var_734_0.localPosition = Vector3.Lerp(arg_731_1.var_.moveOldPos1072ui_story, var_734_4, var_734_3)

				local var_734_5 = manager.ui.mainCamera.transform.position - var_734_0.position

				var_734_0.forward = Vector3.New(var_734_5.x, var_734_5.y, var_734_5.z)

				local var_734_6 = var_734_0.localEulerAngles

				var_734_6.z = 0
				var_734_6.x = 0
				var_734_0.localEulerAngles = var_734_6
			end

			if arg_731_1.time_ >= var_734_1 + var_734_2 and arg_731_1.time_ < var_734_1 + var_734_2 + arg_734_0 then
				var_734_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_734_7 = manager.ui.mainCamera.transform.position - var_734_0.position

				var_734_0.forward = Vector3.New(var_734_7.x, var_734_7.y, var_734_7.z)

				local var_734_8 = var_734_0.localEulerAngles

				var_734_8.z = 0
				var_734_8.x = 0
				var_734_0.localEulerAngles = var_734_8
			end

			local var_734_9 = 0

			if var_734_9 < arg_731_1.time_ and arg_731_1.time_ <= var_734_9 + arg_734_0 then
				arg_731_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_734_10 = 0

			if var_734_10 < arg_731_1.time_ and arg_731_1.time_ <= var_734_10 + arg_734_0 then
				arg_731_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_734_11 = arg_731_1.actors_["1072ui_story"]
			local var_734_12 = 0

			if var_734_12 < arg_731_1.time_ and arg_731_1.time_ <= var_734_12 + arg_734_0 and arg_731_1.var_.characterEffect1072ui_story == nil then
				arg_731_1.var_.characterEffect1072ui_story = var_734_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_734_13 = 0.2

			if var_734_12 <= arg_731_1.time_ and arg_731_1.time_ < var_734_12 + var_734_13 then
				local var_734_14 = (arg_731_1.time_ - var_734_12) / var_734_13

				if arg_731_1.var_.characterEffect1072ui_story then
					arg_731_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_731_1.time_ >= var_734_12 + var_734_13 and arg_731_1.time_ < var_734_12 + var_734_13 + arg_734_0 and arg_731_1.var_.characterEffect1072ui_story then
				arg_731_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_734_15 = 0
			local var_734_16 = 0.475

			if var_734_15 < arg_731_1.time_ and arg_731_1.time_ <= var_734_15 + arg_734_0 then
				arg_731_1.talkMaxDuration = 0
				arg_731_1.dialogCg_.alpha = 1

				arg_731_1.dialog_:SetActive(true)
				SetActive(arg_731_1.leftNameGo_, true)

				local var_734_17 = arg_731_1:FormatText(StoryNameCfg[379].name)

				arg_731_1.leftNameTxt_.text = var_734_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_731_1.leftNameTxt_.transform)

				arg_731_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_731_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_731_1:RecordName(arg_731_1.leftNameTxt_.text)
				SetActive(arg_731_1.iconTrs_.gameObject, false)
				arg_731_1.callingController_:SetSelectedState("normal")

				local var_734_18 = arg_731_1:GetWordFromCfg(120411180)
				local var_734_19 = arg_731_1:FormatText(var_734_18.content)

				arg_731_1.text_.text = var_734_19

				LuaForUtil.ClearLinePrefixSymbol(arg_731_1.text_)

				local var_734_20 = 19
				local var_734_21 = utf8.len(var_734_19)
				local var_734_22 = var_734_20 <= 0 and var_734_16 or var_734_16 * (var_734_21 / var_734_20)

				if var_734_22 > 0 and var_734_16 < var_734_22 then
					arg_731_1.talkMaxDuration = var_734_22

					if var_734_22 + var_734_15 > arg_731_1.duration_ then
						arg_731_1.duration_ = var_734_22 + var_734_15
					end
				end

				arg_731_1.text_.text = var_734_19
				arg_731_1.typewritter.percent = 0

				arg_731_1.typewritter:SetDirty()
				arg_731_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411180", "story_v_out_120411.awb") ~= 0 then
					local var_734_23 = manager.audio:GetVoiceLength("story_v_out_120411", "120411180", "story_v_out_120411.awb") / 1000

					if var_734_23 + var_734_15 > arg_731_1.duration_ then
						arg_731_1.duration_ = var_734_23 + var_734_15
					end

					if var_734_18.prefab_name ~= "" and arg_731_1.actors_[var_734_18.prefab_name] ~= nil then
						local var_734_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_731_1.actors_[var_734_18.prefab_name].transform, "story_v_out_120411", "120411180", "story_v_out_120411.awb")

						arg_731_1:RecordAudio("120411180", var_734_24)
						arg_731_1:RecordAudio("120411180", var_734_24)
					else
						arg_731_1:AudioAction("play", "voice", "story_v_out_120411", "120411180", "story_v_out_120411.awb")
					end

					arg_731_1:RecordHistoryTalkVoice("story_v_out_120411", "120411180", "story_v_out_120411.awb")
				end

				arg_731_1:RecordContent(arg_731_1.text_.text)
			end

			local var_734_25 = math.max(var_734_16, arg_731_1.talkMaxDuration)

			if var_734_15 <= arg_731_1.time_ and arg_731_1.time_ < var_734_15 + var_734_25 then
				arg_731_1.typewritter.percent = (arg_731_1.time_ - var_734_15) / var_734_25

				arg_731_1.typewritter:SetDirty()
			end

			if arg_731_1.time_ >= var_734_15 + var_734_25 and arg_731_1.time_ < var_734_15 + var_734_25 + arg_734_0 then
				arg_731_1.typewritter.percent = 1

				arg_731_1.typewritter:SetDirty()
				arg_731_1:ShowNextGo(true)
			end
		end
	end,
	Play120411181 = function(arg_735_0, arg_735_1)
		arg_735_1.time_ = 0
		arg_735_1.frameCnt_ = 0
		arg_735_1.state_ = "playing"
		arg_735_1.curTalkId_ = 120411181
		arg_735_1.duration_ = 6.333

		local var_735_0 = {
			zh = 4.666,
			ja = 6.333
		}
		local var_735_1 = manager.audio:GetLocalizationFlag()

		if var_735_0[var_735_1] ~= nil then
			arg_735_1.duration_ = var_735_0[var_735_1]
		end

		SetActive(arg_735_1.tipsGo_, false)

		function arg_735_1.onSingleLineFinish_()
			arg_735_1.onSingleLineUpdate_ = nil
			arg_735_1.onSingleLineFinish_ = nil
			arg_735_1.state_ = "waiting"
		end

		function arg_735_1.playNext_(arg_737_0)
			if arg_737_0 == 1 then
				arg_735_0:Play120411182(arg_735_1)
			end
		end

		function arg_735_1.onSingleLineUpdate_(arg_738_0)
			local var_738_0 = 0
			local var_738_1 = 0.9

			if var_738_0 < arg_735_1.time_ and arg_735_1.time_ <= var_738_0 + arg_738_0 then
				arg_735_1.talkMaxDuration = 0
				arg_735_1.dialogCg_.alpha = 1

				arg_735_1.dialog_:SetActive(true)
				SetActive(arg_735_1.leftNameGo_, true)

				local var_738_2 = arg_735_1:FormatText(StoryNameCfg[379].name)

				arg_735_1.leftNameTxt_.text = var_738_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_735_1.leftNameTxt_.transform)

				arg_735_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_735_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_735_1:RecordName(arg_735_1.leftNameTxt_.text)
				SetActive(arg_735_1.iconTrs_.gameObject, false)
				arg_735_1.callingController_:SetSelectedState("normal")

				local var_738_3 = arg_735_1:GetWordFromCfg(120411181)
				local var_738_4 = arg_735_1:FormatText(var_738_3.content)

				arg_735_1.text_.text = var_738_4

				LuaForUtil.ClearLinePrefixSymbol(arg_735_1.text_)

				local var_738_5 = 36
				local var_738_6 = utf8.len(var_738_4)
				local var_738_7 = var_738_5 <= 0 and var_738_1 or var_738_1 * (var_738_6 / var_738_5)

				if var_738_7 > 0 and var_738_1 < var_738_7 then
					arg_735_1.talkMaxDuration = var_738_7

					if var_738_7 + var_738_0 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_7 + var_738_0
					end
				end

				arg_735_1.text_.text = var_738_4
				arg_735_1.typewritter.percent = 0

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411181", "story_v_out_120411.awb") ~= 0 then
					local var_738_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411181", "story_v_out_120411.awb") / 1000

					if var_738_8 + var_738_0 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_8 + var_738_0
					end

					if var_738_3.prefab_name ~= "" and arg_735_1.actors_[var_738_3.prefab_name] ~= nil then
						local var_738_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_735_1.actors_[var_738_3.prefab_name].transform, "story_v_out_120411", "120411181", "story_v_out_120411.awb")

						arg_735_1:RecordAudio("120411181", var_738_9)
						arg_735_1:RecordAudio("120411181", var_738_9)
					else
						arg_735_1:AudioAction("play", "voice", "story_v_out_120411", "120411181", "story_v_out_120411.awb")
					end

					arg_735_1:RecordHistoryTalkVoice("story_v_out_120411", "120411181", "story_v_out_120411.awb")
				end

				arg_735_1:RecordContent(arg_735_1.text_.text)
			end

			local var_738_10 = math.max(var_738_1, arg_735_1.talkMaxDuration)

			if var_738_0 <= arg_735_1.time_ and arg_735_1.time_ < var_738_0 + var_738_10 then
				arg_735_1.typewritter.percent = (arg_735_1.time_ - var_738_0) / var_738_10

				arg_735_1.typewritter:SetDirty()
			end

			if arg_735_1.time_ >= var_738_0 + var_738_10 and arg_735_1.time_ < var_738_0 + var_738_10 + arg_738_0 then
				arg_735_1.typewritter.percent = 1

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(true)
			end
		end
	end,
	Play120411182 = function(arg_739_0, arg_739_1)
		arg_739_1.time_ = 0
		arg_739_1.frameCnt_ = 0
		arg_739_1.state_ = "playing"
		arg_739_1.curTalkId_ = 120411182
		arg_739_1.duration_ = 5

		SetActive(arg_739_1.tipsGo_, false)

		function arg_739_1.onSingleLineFinish_()
			arg_739_1.onSingleLineUpdate_ = nil
			arg_739_1.onSingleLineFinish_ = nil
			arg_739_1.state_ = "waiting"
		end

		function arg_739_1.playNext_(arg_741_0)
			if arg_741_0 == 1 then
				arg_739_0:Play120411183(arg_739_1)
			end
		end

		function arg_739_1.onSingleLineUpdate_(arg_742_0)
			local var_742_0 = arg_739_1.actors_["1072ui_story"]
			local var_742_1 = 0

			if var_742_1 < arg_739_1.time_ and arg_739_1.time_ <= var_742_1 + arg_742_0 and arg_739_1.var_.characterEffect1072ui_story == nil then
				arg_739_1.var_.characterEffect1072ui_story = var_742_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_742_2 = 0.2

			if var_742_1 <= arg_739_1.time_ and arg_739_1.time_ < var_742_1 + var_742_2 then
				local var_742_3 = (arg_739_1.time_ - var_742_1) / var_742_2

				if arg_739_1.var_.characterEffect1072ui_story then
					local var_742_4 = Mathf.Lerp(0, 0.5, var_742_3)

					arg_739_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_739_1.var_.characterEffect1072ui_story.fillRatio = var_742_4
				end
			end

			if arg_739_1.time_ >= var_742_1 + var_742_2 and arg_739_1.time_ < var_742_1 + var_742_2 + arg_742_0 and arg_739_1.var_.characterEffect1072ui_story then
				local var_742_5 = 0.5

				arg_739_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_739_1.var_.characterEffect1072ui_story.fillRatio = var_742_5
			end

			local var_742_6 = 0
			local var_742_7 = 0.3

			if var_742_6 < arg_739_1.time_ and arg_739_1.time_ <= var_742_6 + arg_742_0 then
				arg_739_1.talkMaxDuration = 0
				arg_739_1.dialogCg_.alpha = 1

				arg_739_1.dialog_:SetActive(true)
				SetActive(arg_739_1.leftNameGo_, true)

				local var_742_8 = arg_739_1:FormatText(StoryNameCfg[7].name)

				arg_739_1.leftNameTxt_.text = var_742_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_739_1.leftNameTxt_.transform)

				arg_739_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_739_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_739_1:RecordName(arg_739_1.leftNameTxt_.text)
				SetActive(arg_739_1.iconTrs_.gameObject, false)
				arg_739_1.callingController_:SetSelectedState("normal")

				local var_742_9 = arg_739_1:GetWordFromCfg(120411182)
				local var_742_10 = arg_739_1:FormatText(var_742_9.content)

				arg_739_1.text_.text = var_742_10

				LuaForUtil.ClearLinePrefixSymbol(arg_739_1.text_)

				local var_742_11 = 12
				local var_742_12 = utf8.len(var_742_10)
				local var_742_13 = var_742_11 <= 0 and var_742_7 or var_742_7 * (var_742_12 / var_742_11)

				if var_742_13 > 0 and var_742_7 < var_742_13 then
					arg_739_1.talkMaxDuration = var_742_13

					if var_742_13 + var_742_6 > arg_739_1.duration_ then
						arg_739_1.duration_ = var_742_13 + var_742_6
					end
				end

				arg_739_1.text_.text = var_742_10
				arg_739_1.typewritter.percent = 0

				arg_739_1.typewritter:SetDirty()
				arg_739_1:ShowNextGo(false)
				arg_739_1:RecordContent(arg_739_1.text_.text)
			end

			local var_742_14 = math.max(var_742_7, arg_739_1.talkMaxDuration)

			if var_742_6 <= arg_739_1.time_ and arg_739_1.time_ < var_742_6 + var_742_14 then
				arg_739_1.typewritter.percent = (arg_739_1.time_ - var_742_6) / var_742_14

				arg_739_1.typewritter:SetDirty()
			end

			if arg_739_1.time_ >= var_742_6 + var_742_14 and arg_739_1.time_ < var_742_6 + var_742_14 + arg_742_0 then
				arg_739_1.typewritter.percent = 1

				arg_739_1.typewritter:SetDirty()
				arg_739_1:ShowNextGo(true)
			end
		end
	end,
	Play120411183 = function(arg_743_0, arg_743_1)
		arg_743_1.time_ = 0
		arg_743_1.frameCnt_ = 0
		arg_743_1.state_ = "playing"
		arg_743_1.curTalkId_ = 120411183
		arg_743_1.duration_ = 13.8

		local var_743_0 = {
			zh = 6.333,
			ja = 13.8
		}
		local var_743_1 = manager.audio:GetLocalizationFlag()

		if var_743_0[var_743_1] ~= nil then
			arg_743_1.duration_ = var_743_0[var_743_1]
		end

		SetActive(arg_743_1.tipsGo_, false)

		function arg_743_1.onSingleLineFinish_()
			arg_743_1.onSingleLineUpdate_ = nil
			arg_743_1.onSingleLineFinish_ = nil
			arg_743_1.state_ = "waiting"
		end

		function arg_743_1.playNext_(arg_745_0)
			if arg_745_0 == 1 then
				arg_743_0:Play120411184(arg_743_1)
			end
		end

		function arg_743_1.onSingleLineUpdate_(arg_746_0)
			local var_746_0 = arg_743_1.actors_["1072ui_story"]
			local var_746_1 = 0

			if var_746_1 < arg_743_1.time_ and arg_743_1.time_ <= var_746_1 + arg_746_0 and arg_743_1.var_.characterEffect1072ui_story == nil then
				arg_743_1.var_.characterEffect1072ui_story = var_746_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_746_2 = 0.2

			if var_746_1 <= arg_743_1.time_ and arg_743_1.time_ < var_746_1 + var_746_2 then
				local var_746_3 = (arg_743_1.time_ - var_746_1) / var_746_2

				if arg_743_1.var_.characterEffect1072ui_story then
					arg_743_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_743_1.time_ >= var_746_1 + var_746_2 and arg_743_1.time_ < var_746_1 + var_746_2 + arg_746_0 and arg_743_1.var_.characterEffect1072ui_story then
				arg_743_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_746_4 = 0

			if var_746_4 < arg_743_1.time_ and arg_743_1.time_ <= var_746_4 + arg_746_0 then
				arg_743_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_2")
			end

			local var_746_5 = 0

			if var_746_5 < arg_743_1.time_ and arg_743_1.time_ <= var_746_5 + arg_746_0 then
				arg_743_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_746_6 = 0
			local var_746_7 = 0.75

			if var_746_6 < arg_743_1.time_ and arg_743_1.time_ <= var_746_6 + arg_746_0 then
				arg_743_1.talkMaxDuration = 0
				arg_743_1.dialogCg_.alpha = 1

				arg_743_1.dialog_:SetActive(true)
				SetActive(arg_743_1.leftNameGo_, true)

				local var_746_8 = arg_743_1:FormatText(StoryNameCfg[379].name)

				arg_743_1.leftNameTxt_.text = var_746_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_743_1.leftNameTxt_.transform)

				arg_743_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_743_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_743_1:RecordName(arg_743_1.leftNameTxt_.text)
				SetActive(arg_743_1.iconTrs_.gameObject, false)
				arg_743_1.callingController_:SetSelectedState("normal")

				local var_746_9 = arg_743_1:GetWordFromCfg(120411183)
				local var_746_10 = arg_743_1:FormatText(var_746_9.content)

				arg_743_1.text_.text = var_746_10

				LuaForUtil.ClearLinePrefixSymbol(arg_743_1.text_)

				local var_746_11 = 29
				local var_746_12 = utf8.len(var_746_10)
				local var_746_13 = var_746_11 <= 0 and var_746_7 or var_746_7 * (var_746_12 / var_746_11)

				if var_746_13 > 0 and var_746_7 < var_746_13 then
					arg_743_1.talkMaxDuration = var_746_13

					if var_746_13 + var_746_6 > arg_743_1.duration_ then
						arg_743_1.duration_ = var_746_13 + var_746_6
					end
				end

				arg_743_1.text_.text = var_746_10
				arg_743_1.typewritter.percent = 0

				arg_743_1.typewritter:SetDirty()
				arg_743_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411183", "story_v_out_120411.awb") ~= 0 then
					local var_746_14 = manager.audio:GetVoiceLength("story_v_out_120411", "120411183", "story_v_out_120411.awb") / 1000

					if var_746_14 + var_746_6 > arg_743_1.duration_ then
						arg_743_1.duration_ = var_746_14 + var_746_6
					end

					if var_746_9.prefab_name ~= "" and arg_743_1.actors_[var_746_9.prefab_name] ~= nil then
						local var_746_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_743_1.actors_[var_746_9.prefab_name].transform, "story_v_out_120411", "120411183", "story_v_out_120411.awb")

						arg_743_1:RecordAudio("120411183", var_746_15)
						arg_743_1:RecordAudio("120411183", var_746_15)
					else
						arg_743_1:AudioAction("play", "voice", "story_v_out_120411", "120411183", "story_v_out_120411.awb")
					end

					arg_743_1:RecordHistoryTalkVoice("story_v_out_120411", "120411183", "story_v_out_120411.awb")
				end

				arg_743_1:RecordContent(arg_743_1.text_.text)
			end

			local var_746_16 = math.max(var_746_7, arg_743_1.talkMaxDuration)

			if var_746_6 <= arg_743_1.time_ and arg_743_1.time_ < var_746_6 + var_746_16 then
				arg_743_1.typewritter.percent = (arg_743_1.time_ - var_746_6) / var_746_16

				arg_743_1.typewritter:SetDirty()
			end

			if arg_743_1.time_ >= var_746_6 + var_746_16 and arg_743_1.time_ < var_746_6 + var_746_16 + arg_746_0 then
				arg_743_1.typewritter.percent = 1

				arg_743_1.typewritter:SetDirty()
				arg_743_1:ShowNextGo(true)
			end
		end
	end,
	Play120411184 = function(arg_747_0, arg_747_1)
		arg_747_1.time_ = 0
		arg_747_1.frameCnt_ = 0
		arg_747_1.state_ = "playing"
		arg_747_1.curTalkId_ = 120411184
		arg_747_1.duration_ = 13.7

		local var_747_0 = {
			zh = 9.833,
			ja = 13.7
		}
		local var_747_1 = manager.audio:GetLocalizationFlag()

		if var_747_0[var_747_1] ~= nil then
			arg_747_1.duration_ = var_747_0[var_747_1]
		end

		SetActive(arg_747_1.tipsGo_, false)

		function arg_747_1.onSingleLineFinish_()
			arg_747_1.onSingleLineUpdate_ = nil
			arg_747_1.onSingleLineFinish_ = nil
			arg_747_1.state_ = "waiting"
		end

		function arg_747_1.playNext_(arg_749_0)
			if arg_749_0 == 1 then
				arg_747_0:Play120411185(arg_747_1)
			end
		end

		function arg_747_1.onSingleLineUpdate_(arg_750_0)
			local var_750_0 = 0
			local var_750_1 = 1.175

			if var_750_0 < arg_747_1.time_ and arg_747_1.time_ <= var_750_0 + arg_750_0 then
				arg_747_1.talkMaxDuration = 0
				arg_747_1.dialogCg_.alpha = 1

				arg_747_1.dialog_:SetActive(true)
				SetActive(arg_747_1.leftNameGo_, true)

				local var_750_2 = arg_747_1:FormatText(StoryNameCfg[379].name)

				arg_747_1.leftNameTxt_.text = var_750_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_747_1.leftNameTxt_.transform)

				arg_747_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_747_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_747_1:RecordName(arg_747_1.leftNameTxt_.text)
				SetActive(arg_747_1.iconTrs_.gameObject, false)
				arg_747_1.callingController_:SetSelectedState("normal")

				local var_750_3 = arg_747_1:GetWordFromCfg(120411184)
				local var_750_4 = arg_747_1:FormatText(var_750_3.content)

				arg_747_1.text_.text = var_750_4

				LuaForUtil.ClearLinePrefixSymbol(arg_747_1.text_)

				local var_750_5 = 47
				local var_750_6 = utf8.len(var_750_4)
				local var_750_7 = var_750_5 <= 0 and var_750_1 or var_750_1 * (var_750_6 / var_750_5)

				if var_750_7 > 0 and var_750_1 < var_750_7 then
					arg_747_1.talkMaxDuration = var_750_7

					if var_750_7 + var_750_0 > arg_747_1.duration_ then
						arg_747_1.duration_ = var_750_7 + var_750_0
					end
				end

				arg_747_1.text_.text = var_750_4
				arg_747_1.typewritter.percent = 0

				arg_747_1.typewritter:SetDirty()
				arg_747_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411184", "story_v_out_120411.awb") ~= 0 then
					local var_750_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411184", "story_v_out_120411.awb") / 1000

					if var_750_8 + var_750_0 > arg_747_1.duration_ then
						arg_747_1.duration_ = var_750_8 + var_750_0
					end

					if var_750_3.prefab_name ~= "" and arg_747_1.actors_[var_750_3.prefab_name] ~= nil then
						local var_750_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_747_1.actors_[var_750_3.prefab_name].transform, "story_v_out_120411", "120411184", "story_v_out_120411.awb")

						arg_747_1:RecordAudio("120411184", var_750_9)
						arg_747_1:RecordAudio("120411184", var_750_9)
					else
						arg_747_1:AudioAction("play", "voice", "story_v_out_120411", "120411184", "story_v_out_120411.awb")
					end

					arg_747_1:RecordHistoryTalkVoice("story_v_out_120411", "120411184", "story_v_out_120411.awb")
				end

				arg_747_1:RecordContent(arg_747_1.text_.text)
			end

			local var_750_10 = math.max(var_750_1, arg_747_1.talkMaxDuration)

			if var_750_0 <= arg_747_1.time_ and arg_747_1.time_ < var_750_0 + var_750_10 then
				arg_747_1.typewritter.percent = (arg_747_1.time_ - var_750_0) / var_750_10

				arg_747_1.typewritter:SetDirty()
			end

			if arg_747_1.time_ >= var_750_0 + var_750_10 and arg_747_1.time_ < var_750_0 + var_750_10 + arg_750_0 then
				arg_747_1.typewritter.percent = 1

				arg_747_1.typewritter:SetDirty()
				arg_747_1:ShowNextGo(true)
			end
		end
	end,
	Play120411185 = function(arg_751_0, arg_751_1)
		arg_751_1.time_ = 0
		arg_751_1.frameCnt_ = 0
		arg_751_1.state_ = "playing"
		arg_751_1.curTalkId_ = 120411185
		arg_751_1.duration_ = 5

		SetActive(arg_751_1.tipsGo_, false)

		function arg_751_1.onSingleLineFinish_()
			arg_751_1.onSingleLineUpdate_ = nil
			arg_751_1.onSingleLineFinish_ = nil
			arg_751_1.state_ = "waiting"
		end

		function arg_751_1.playNext_(arg_753_0)
			if arg_753_0 == 1 then
				arg_751_0:Play120411186(arg_751_1)
			end
		end

		function arg_751_1.onSingleLineUpdate_(arg_754_0)
			local var_754_0 = arg_751_1.actors_["1072ui_story"]
			local var_754_1 = 0

			if var_754_1 < arg_751_1.time_ and arg_751_1.time_ <= var_754_1 + arg_754_0 and arg_751_1.var_.characterEffect1072ui_story == nil then
				arg_751_1.var_.characterEffect1072ui_story = var_754_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_754_2 = 0.2

			if var_754_1 <= arg_751_1.time_ and arg_751_1.time_ < var_754_1 + var_754_2 then
				local var_754_3 = (arg_751_1.time_ - var_754_1) / var_754_2

				if arg_751_1.var_.characterEffect1072ui_story then
					local var_754_4 = Mathf.Lerp(0, 0.5, var_754_3)

					arg_751_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_751_1.var_.characterEffect1072ui_story.fillRatio = var_754_4
				end
			end

			if arg_751_1.time_ >= var_754_1 + var_754_2 and arg_751_1.time_ < var_754_1 + var_754_2 + arg_754_0 and arg_751_1.var_.characterEffect1072ui_story then
				local var_754_5 = 0.5

				arg_751_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_751_1.var_.characterEffect1072ui_story.fillRatio = var_754_5
			end

			local var_754_6 = 0
			local var_754_7 = 0.4

			if var_754_6 < arg_751_1.time_ and arg_751_1.time_ <= var_754_6 + arg_754_0 then
				arg_751_1.talkMaxDuration = 0
				arg_751_1.dialogCg_.alpha = 1

				arg_751_1.dialog_:SetActive(true)
				SetActive(arg_751_1.leftNameGo_, false)

				arg_751_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_751_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_751_1:RecordName(arg_751_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_751_1.iconTrs_.gameObject, false)
				arg_751_1.callingController_:SetSelectedState("normal")

				local var_754_8 = arg_751_1:GetWordFromCfg(120411185)
				local var_754_9 = arg_751_1:FormatText(var_754_8.content)

				arg_751_1.text_.text = var_754_9

				LuaForUtil.ClearLinePrefixSymbol(arg_751_1.text_)

				local var_754_10 = 16
				local var_754_11 = utf8.len(var_754_9)
				local var_754_12 = var_754_10 <= 0 and var_754_7 or var_754_7 * (var_754_11 / var_754_10)

				if var_754_12 > 0 and var_754_7 < var_754_12 then
					arg_751_1.talkMaxDuration = var_754_12

					if var_754_12 + var_754_6 > arg_751_1.duration_ then
						arg_751_1.duration_ = var_754_12 + var_754_6
					end
				end

				arg_751_1.text_.text = var_754_9
				arg_751_1.typewritter.percent = 0

				arg_751_1.typewritter:SetDirty()
				arg_751_1:ShowNextGo(false)
				arg_751_1:RecordContent(arg_751_1.text_.text)
			end

			local var_754_13 = math.max(var_754_7, arg_751_1.talkMaxDuration)

			if var_754_6 <= arg_751_1.time_ and arg_751_1.time_ < var_754_6 + var_754_13 then
				arg_751_1.typewritter.percent = (arg_751_1.time_ - var_754_6) / var_754_13

				arg_751_1.typewritter:SetDirty()
			end

			if arg_751_1.time_ >= var_754_6 + var_754_13 and arg_751_1.time_ < var_754_6 + var_754_13 + arg_754_0 then
				arg_751_1.typewritter.percent = 1

				arg_751_1.typewritter:SetDirty()
				arg_751_1:ShowNextGo(true)
			end
		end
	end,
	Play120411186 = function(arg_755_0, arg_755_1)
		arg_755_1.time_ = 0
		arg_755_1.frameCnt_ = 0
		arg_755_1.state_ = "playing"
		arg_755_1.curTalkId_ = 120411186
		arg_755_1.duration_ = 5.766

		local var_755_0 = {
			zh = 1.999999999999,
			ja = 5.766
		}
		local var_755_1 = manager.audio:GetLocalizationFlag()

		if var_755_0[var_755_1] ~= nil then
			arg_755_1.duration_ = var_755_0[var_755_1]
		end

		SetActive(arg_755_1.tipsGo_, false)

		function arg_755_1.onSingleLineFinish_()
			arg_755_1.onSingleLineUpdate_ = nil
			arg_755_1.onSingleLineFinish_ = nil
			arg_755_1.state_ = "waiting"
		end

		function arg_755_1.playNext_(arg_757_0)
			if arg_757_0 == 1 then
				arg_755_0:Play120411187(arg_755_1)
			end
		end

		function arg_755_1.onSingleLineUpdate_(arg_758_0)
			local var_758_0 = arg_755_1.actors_["1072ui_story"].transform
			local var_758_1 = 0

			if var_758_1 < arg_755_1.time_ and arg_755_1.time_ <= var_758_1 + arg_758_0 then
				arg_755_1.var_.moveOldPos1072ui_story = var_758_0.localPosition
			end

			local var_758_2 = 0.001

			if var_758_1 <= arg_755_1.time_ and arg_755_1.time_ < var_758_1 + var_758_2 then
				local var_758_3 = (arg_755_1.time_ - var_758_1) / var_758_2
				local var_758_4 = Vector3.New(-0.7, -0.71, -6)

				var_758_0.localPosition = Vector3.Lerp(arg_755_1.var_.moveOldPos1072ui_story, var_758_4, var_758_3)

				local var_758_5 = manager.ui.mainCamera.transform.position - var_758_0.position

				var_758_0.forward = Vector3.New(var_758_5.x, var_758_5.y, var_758_5.z)

				local var_758_6 = var_758_0.localEulerAngles

				var_758_6.z = 0
				var_758_6.x = 0
				var_758_0.localEulerAngles = var_758_6
			end

			if arg_755_1.time_ >= var_758_1 + var_758_2 and arg_755_1.time_ < var_758_1 + var_758_2 + arg_758_0 then
				var_758_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_758_7 = manager.ui.mainCamera.transform.position - var_758_0.position

				var_758_0.forward = Vector3.New(var_758_7.x, var_758_7.y, var_758_7.z)

				local var_758_8 = var_758_0.localEulerAngles

				var_758_8.z = 0
				var_758_8.x = 0
				var_758_0.localEulerAngles = var_758_8
			end

			local var_758_9 = arg_755_1.actors_["1072ui_story"]
			local var_758_10 = 0

			if var_758_10 < arg_755_1.time_ and arg_755_1.time_ <= var_758_10 + arg_758_0 and arg_755_1.var_.characterEffect1072ui_story == nil then
				arg_755_1.var_.characterEffect1072ui_story = var_758_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_758_11 = 0.2

			if var_758_10 <= arg_755_1.time_ and arg_755_1.time_ < var_758_10 + var_758_11 then
				local var_758_12 = (arg_755_1.time_ - var_758_10) / var_758_11

				if arg_755_1.var_.characterEffect1072ui_story then
					arg_755_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_755_1.time_ >= var_758_10 + var_758_11 and arg_755_1.time_ < var_758_10 + var_758_11 + arg_758_0 and arg_755_1.var_.characterEffect1072ui_story then
				arg_755_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_758_13 = arg_755_1.actors_["1076ui_story"].transform
			local var_758_14 = 0

			if var_758_14 < arg_755_1.time_ and arg_755_1.time_ <= var_758_14 + arg_758_0 then
				arg_755_1.var_.moveOldPos1076ui_story = var_758_13.localPosition
			end

			local var_758_15 = 0.001

			if var_758_14 <= arg_755_1.time_ and arg_755_1.time_ < var_758_14 + var_758_15 then
				local var_758_16 = (arg_755_1.time_ - var_758_14) / var_758_15
				local var_758_17 = Vector3.New(0.7, -1.06, -6.2)

				var_758_13.localPosition = Vector3.Lerp(arg_755_1.var_.moveOldPos1076ui_story, var_758_17, var_758_16)

				local var_758_18 = manager.ui.mainCamera.transform.position - var_758_13.position

				var_758_13.forward = Vector3.New(var_758_18.x, var_758_18.y, var_758_18.z)

				local var_758_19 = var_758_13.localEulerAngles

				var_758_19.z = 0
				var_758_19.x = 0
				var_758_13.localEulerAngles = var_758_19
			end

			if arg_755_1.time_ >= var_758_14 + var_758_15 and arg_755_1.time_ < var_758_14 + var_758_15 + arg_758_0 then
				var_758_13.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_758_20 = manager.ui.mainCamera.transform.position - var_758_13.position

				var_758_13.forward = Vector3.New(var_758_20.x, var_758_20.y, var_758_20.z)

				local var_758_21 = var_758_13.localEulerAngles

				var_758_21.z = 0
				var_758_21.x = 0
				var_758_13.localEulerAngles = var_758_21
			end

			local var_758_22 = 0

			if var_758_22 < arg_755_1.time_ and arg_755_1.time_ <= var_758_22 + arg_758_0 then
				arg_755_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_758_23 = arg_755_1.actors_["1076ui_story"]
			local var_758_24 = 0

			if var_758_24 < arg_755_1.time_ and arg_755_1.time_ <= var_758_24 + arg_758_0 and arg_755_1.var_.characterEffect1076ui_story == nil then
				arg_755_1.var_.characterEffect1076ui_story = var_758_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_758_25 = 0.0166666666666667

			if var_758_24 <= arg_755_1.time_ and arg_755_1.time_ < var_758_24 + var_758_25 then
				local var_758_26 = (arg_755_1.time_ - var_758_24) / var_758_25

				if arg_755_1.var_.characterEffect1076ui_story then
					local var_758_27 = Mathf.Lerp(0, 0.5, var_758_26)

					arg_755_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_755_1.var_.characterEffect1076ui_story.fillRatio = var_758_27
				end
			end

			if arg_755_1.time_ >= var_758_24 + var_758_25 and arg_755_1.time_ < var_758_24 + var_758_25 + arg_758_0 and arg_755_1.var_.characterEffect1076ui_story then
				local var_758_28 = 0.5

				arg_755_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_755_1.var_.characterEffect1076ui_story.fillRatio = var_758_28
			end

			local var_758_29 = 0
			local var_758_30 = 0.15

			if var_758_29 < arg_755_1.time_ and arg_755_1.time_ <= var_758_29 + arg_758_0 then
				arg_755_1.talkMaxDuration = 0
				arg_755_1.dialogCg_.alpha = 1

				arg_755_1.dialog_:SetActive(true)
				SetActive(arg_755_1.leftNameGo_, true)

				local var_758_31 = arg_755_1:FormatText(StoryNameCfg[379].name)

				arg_755_1.leftNameTxt_.text = var_758_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_755_1.leftNameTxt_.transform)

				arg_755_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_755_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_755_1:RecordName(arg_755_1.leftNameTxt_.text)
				SetActive(arg_755_1.iconTrs_.gameObject, false)
				arg_755_1.callingController_:SetSelectedState("normal")

				local var_758_32 = arg_755_1:GetWordFromCfg(120411186)
				local var_758_33 = arg_755_1:FormatText(var_758_32.content)

				arg_755_1.text_.text = var_758_33

				LuaForUtil.ClearLinePrefixSymbol(arg_755_1.text_)

				local var_758_34 = 6
				local var_758_35 = utf8.len(var_758_33)
				local var_758_36 = var_758_34 <= 0 and var_758_30 or var_758_30 * (var_758_35 / var_758_34)

				if var_758_36 > 0 and var_758_30 < var_758_36 then
					arg_755_1.talkMaxDuration = var_758_36

					if var_758_36 + var_758_29 > arg_755_1.duration_ then
						arg_755_1.duration_ = var_758_36 + var_758_29
					end
				end

				arg_755_1.text_.text = var_758_33
				arg_755_1.typewritter.percent = 0

				arg_755_1.typewritter:SetDirty()
				arg_755_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411186", "story_v_out_120411.awb") ~= 0 then
					local var_758_37 = manager.audio:GetVoiceLength("story_v_out_120411", "120411186", "story_v_out_120411.awb") / 1000

					if var_758_37 + var_758_29 > arg_755_1.duration_ then
						arg_755_1.duration_ = var_758_37 + var_758_29
					end

					if var_758_32.prefab_name ~= "" and arg_755_1.actors_[var_758_32.prefab_name] ~= nil then
						local var_758_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_755_1.actors_[var_758_32.prefab_name].transform, "story_v_out_120411", "120411186", "story_v_out_120411.awb")

						arg_755_1:RecordAudio("120411186", var_758_38)
						arg_755_1:RecordAudio("120411186", var_758_38)
					else
						arg_755_1:AudioAction("play", "voice", "story_v_out_120411", "120411186", "story_v_out_120411.awb")
					end

					arg_755_1:RecordHistoryTalkVoice("story_v_out_120411", "120411186", "story_v_out_120411.awb")
				end

				arg_755_1:RecordContent(arg_755_1.text_.text)
			end

			local var_758_39 = math.max(var_758_30, arg_755_1.talkMaxDuration)

			if var_758_29 <= arg_755_1.time_ and arg_755_1.time_ < var_758_29 + var_758_39 then
				arg_755_1.typewritter.percent = (arg_755_1.time_ - var_758_29) / var_758_39

				arg_755_1.typewritter:SetDirty()
			end

			if arg_755_1.time_ >= var_758_29 + var_758_39 and arg_755_1.time_ < var_758_29 + var_758_39 + arg_758_0 then
				arg_755_1.typewritter.percent = 1

				arg_755_1.typewritter:SetDirty()
				arg_755_1:ShowNextGo(true)
			end
		end
	end,
	Play120411187 = function(arg_759_0, arg_759_1)
		arg_759_1.time_ = 0
		arg_759_1.frameCnt_ = 0
		arg_759_1.state_ = "playing"
		arg_759_1.curTalkId_ = 120411187
		arg_759_1.duration_ = 5

		SetActive(arg_759_1.tipsGo_, false)

		function arg_759_1.onSingleLineFinish_()
			arg_759_1.onSingleLineUpdate_ = nil
			arg_759_1.onSingleLineFinish_ = nil
			arg_759_1.state_ = "waiting"
		end

		function arg_759_1.playNext_(arg_761_0)
			if arg_761_0 == 1 then
				arg_759_0:Play120411188(arg_759_1)
			end
		end

		function arg_759_1.onSingleLineUpdate_(arg_762_0)
			local var_762_0 = arg_759_1.actors_["1072ui_story"]
			local var_762_1 = 0

			if var_762_1 < arg_759_1.time_ and arg_759_1.time_ <= var_762_1 + arg_762_0 and arg_759_1.var_.characterEffect1072ui_story == nil then
				arg_759_1.var_.characterEffect1072ui_story = var_762_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_762_2 = 0.2

			if var_762_1 <= arg_759_1.time_ and arg_759_1.time_ < var_762_1 + var_762_2 then
				local var_762_3 = (arg_759_1.time_ - var_762_1) / var_762_2

				if arg_759_1.var_.characterEffect1072ui_story then
					local var_762_4 = Mathf.Lerp(0, 0.5, var_762_3)

					arg_759_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_759_1.var_.characterEffect1072ui_story.fillRatio = var_762_4
				end
			end

			if arg_759_1.time_ >= var_762_1 + var_762_2 and arg_759_1.time_ < var_762_1 + var_762_2 + arg_762_0 and arg_759_1.var_.characterEffect1072ui_story then
				local var_762_5 = 0.5

				arg_759_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_759_1.var_.characterEffect1072ui_story.fillRatio = var_762_5
			end

			local var_762_6 = 0
			local var_762_7 = 0.125

			if var_762_6 < arg_759_1.time_ and arg_759_1.time_ <= var_762_6 + arg_762_0 then
				arg_759_1.talkMaxDuration = 0
				arg_759_1.dialogCg_.alpha = 1

				arg_759_1.dialog_:SetActive(true)
				SetActive(arg_759_1.leftNameGo_, true)

				local var_762_8 = arg_759_1:FormatText(StoryNameCfg[7].name)

				arg_759_1.leftNameTxt_.text = var_762_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_759_1.leftNameTxt_.transform)

				arg_759_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_759_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_759_1:RecordName(arg_759_1.leftNameTxt_.text)
				SetActive(arg_759_1.iconTrs_.gameObject, false)
				arg_759_1.callingController_:SetSelectedState("normal")

				local var_762_9 = arg_759_1:GetWordFromCfg(120411187)
				local var_762_10 = arg_759_1:FormatText(var_762_9.content)

				arg_759_1.text_.text = var_762_10

				LuaForUtil.ClearLinePrefixSymbol(arg_759_1.text_)

				local var_762_11 = 5
				local var_762_12 = utf8.len(var_762_10)
				local var_762_13 = var_762_11 <= 0 and var_762_7 or var_762_7 * (var_762_12 / var_762_11)

				if var_762_13 > 0 and var_762_7 < var_762_13 then
					arg_759_1.talkMaxDuration = var_762_13

					if var_762_13 + var_762_6 > arg_759_1.duration_ then
						arg_759_1.duration_ = var_762_13 + var_762_6
					end
				end

				arg_759_1.text_.text = var_762_10
				arg_759_1.typewritter.percent = 0

				arg_759_1.typewritter:SetDirty()
				arg_759_1:ShowNextGo(false)
				arg_759_1:RecordContent(arg_759_1.text_.text)
			end

			local var_762_14 = math.max(var_762_7, arg_759_1.talkMaxDuration)

			if var_762_6 <= arg_759_1.time_ and arg_759_1.time_ < var_762_6 + var_762_14 then
				arg_759_1.typewritter.percent = (arg_759_1.time_ - var_762_6) / var_762_14

				arg_759_1.typewritter:SetDirty()
			end

			if arg_759_1.time_ >= var_762_6 + var_762_14 and arg_759_1.time_ < var_762_6 + var_762_14 + arg_762_0 then
				arg_759_1.typewritter.percent = 1

				arg_759_1.typewritter:SetDirty()
				arg_759_1:ShowNextGo(true)
			end
		end
	end,
	Play120411188 = function(arg_763_0, arg_763_1)
		arg_763_1.time_ = 0
		arg_763_1.frameCnt_ = 0
		arg_763_1.state_ = "playing"
		arg_763_1.curTalkId_ = 120411188
		arg_763_1.duration_ = 1.999999999999

		SetActive(arg_763_1.tipsGo_, false)

		function arg_763_1.onSingleLineFinish_()
			arg_763_1.onSingleLineUpdate_ = nil
			arg_763_1.onSingleLineFinish_ = nil
			arg_763_1.state_ = "waiting"
		end

		function arg_763_1.playNext_(arg_765_0)
			if arg_765_0 == 1 then
				arg_763_0:Play120411189(arg_763_1)
			end
		end

		function arg_763_1.onSingleLineUpdate_(arg_766_0)
			local var_766_0 = arg_763_1.actors_["1076ui_story"]
			local var_766_1 = 0

			if var_766_1 < arg_763_1.time_ and arg_763_1.time_ <= var_766_1 + arg_766_0 and arg_763_1.var_.characterEffect1076ui_story == nil then
				arg_763_1.var_.characterEffect1076ui_story = var_766_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_766_2 = 0.2

			if var_766_1 <= arg_763_1.time_ and arg_763_1.time_ < var_766_1 + var_766_2 then
				local var_766_3 = (arg_763_1.time_ - var_766_1) / var_766_2

				if arg_763_1.var_.characterEffect1076ui_story then
					arg_763_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_763_1.time_ >= var_766_1 + var_766_2 and arg_763_1.time_ < var_766_1 + var_766_2 + arg_766_0 and arg_763_1.var_.characterEffect1076ui_story then
				arg_763_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_766_4 = 0

			if var_766_4 < arg_763_1.time_ and arg_763_1.time_ <= var_766_4 + arg_766_0 then
				arg_763_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_766_5 = 0
			local var_766_6 = 0.05

			if var_766_5 < arg_763_1.time_ and arg_763_1.time_ <= var_766_5 + arg_766_0 then
				arg_763_1.talkMaxDuration = 0
				arg_763_1.dialogCg_.alpha = 1

				arg_763_1.dialog_:SetActive(true)
				SetActive(arg_763_1.leftNameGo_, true)

				local var_766_7 = arg_763_1:FormatText(StoryNameCfg[389].name)

				arg_763_1.leftNameTxt_.text = var_766_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_763_1.leftNameTxt_.transform)

				arg_763_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_763_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_763_1:RecordName(arg_763_1.leftNameTxt_.text)
				SetActive(arg_763_1.iconTrs_.gameObject, false)
				arg_763_1.callingController_:SetSelectedState("normal")

				local var_766_8 = arg_763_1:GetWordFromCfg(120411188)
				local var_766_9 = arg_763_1:FormatText(var_766_8.content)

				arg_763_1.text_.text = var_766_9

				LuaForUtil.ClearLinePrefixSymbol(arg_763_1.text_)

				local var_766_10 = 2
				local var_766_11 = utf8.len(var_766_9)
				local var_766_12 = var_766_10 <= 0 and var_766_6 or var_766_6 * (var_766_11 / var_766_10)

				if var_766_12 > 0 and var_766_6 < var_766_12 then
					arg_763_1.talkMaxDuration = var_766_12

					if var_766_12 + var_766_5 > arg_763_1.duration_ then
						arg_763_1.duration_ = var_766_12 + var_766_5
					end
				end

				arg_763_1.text_.text = var_766_9
				arg_763_1.typewritter.percent = 0

				arg_763_1.typewritter:SetDirty()
				arg_763_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411188", "story_v_out_120411.awb") ~= 0 then
					local var_766_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411188", "story_v_out_120411.awb") / 1000

					if var_766_13 + var_766_5 > arg_763_1.duration_ then
						arg_763_1.duration_ = var_766_13 + var_766_5
					end

					if var_766_8.prefab_name ~= "" and arg_763_1.actors_[var_766_8.prefab_name] ~= nil then
						local var_766_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_763_1.actors_[var_766_8.prefab_name].transform, "story_v_out_120411", "120411188", "story_v_out_120411.awb")

						arg_763_1:RecordAudio("120411188", var_766_14)
						arg_763_1:RecordAudio("120411188", var_766_14)
					else
						arg_763_1:AudioAction("play", "voice", "story_v_out_120411", "120411188", "story_v_out_120411.awb")
					end

					arg_763_1:RecordHistoryTalkVoice("story_v_out_120411", "120411188", "story_v_out_120411.awb")
				end

				arg_763_1:RecordContent(arg_763_1.text_.text)
			end

			local var_766_15 = math.max(var_766_6, arg_763_1.talkMaxDuration)

			if var_766_5 <= arg_763_1.time_ and arg_763_1.time_ < var_766_5 + var_766_15 then
				arg_763_1.typewritter.percent = (arg_763_1.time_ - var_766_5) / var_766_15

				arg_763_1.typewritter:SetDirty()
			end

			if arg_763_1.time_ >= var_766_5 + var_766_15 and arg_763_1.time_ < var_766_5 + var_766_15 + arg_766_0 then
				arg_763_1.typewritter.percent = 1

				arg_763_1.typewritter:SetDirty()
				arg_763_1:ShowNextGo(true)
			end
		end
	end,
	Play120411189 = function(arg_767_0, arg_767_1)
		arg_767_1.time_ = 0
		arg_767_1.frameCnt_ = 0
		arg_767_1.state_ = "playing"
		arg_767_1.curTalkId_ = 120411189
		arg_767_1.duration_ = 4.3

		local var_767_0 = {
			zh = 4.1,
			ja = 4.3
		}
		local var_767_1 = manager.audio:GetLocalizationFlag()

		if var_767_0[var_767_1] ~= nil then
			arg_767_1.duration_ = var_767_0[var_767_1]
		end

		SetActive(arg_767_1.tipsGo_, false)

		function arg_767_1.onSingleLineFinish_()
			arg_767_1.onSingleLineUpdate_ = nil
			arg_767_1.onSingleLineFinish_ = nil
			arg_767_1.state_ = "waiting"
		end

		function arg_767_1.playNext_(arg_769_0)
			if arg_769_0 == 1 then
				arg_767_0:Play120411190(arg_767_1)
			end
		end

		function arg_767_1.onSingleLineUpdate_(arg_770_0)
			local var_770_0 = arg_767_1.actors_["1072ui_story"]
			local var_770_1 = 0

			if var_770_1 < arg_767_1.time_ and arg_767_1.time_ <= var_770_1 + arg_770_0 and arg_767_1.var_.characterEffect1072ui_story == nil then
				arg_767_1.var_.characterEffect1072ui_story = var_770_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_770_2 = 0.2

			if var_770_1 <= arg_767_1.time_ and arg_767_1.time_ < var_770_1 + var_770_2 then
				local var_770_3 = (arg_767_1.time_ - var_770_1) / var_770_2

				if arg_767_1.var_.characterEffect1072ui_story then
					arg_767_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_767_1.time_ >= var_770_1 + var_770_2 and arg_767_1.time_ < var_770_1 + var_770_2 + arg_770_0 and arg_767_1.var_.characterEffect1072ui_story then
				arg_767_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_770_4 = arg_767_1.actors_["1076ui_story"]
			local var_770_5 = 0

			if var_770_5 < arg_767_1.time_ and arg_767_1.time_ <= var_770_5 + arg_770_0 and arg_767_1.var_.characterEffect1076ui_story == nil then
				arg_767_1.var_.characterEffect1076ui_story = var_770_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_770_6 = 0.2

			if var_770_5 <= arg_767_1.time_ and arg_767_1.time_ < var_770_5 + var_770_6 then
				local var_770_7 = (arg_767_1.time_ - var_770_5) / var_770_6

				if arg_767_1.var_.characterEffect1076ui_story then
					local var_770_8 = Mathf.Lerp(0, 0.5, var_770_7)

					arg_767_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_767_1.var_.characterEffect1076ui_story.fillRatio = var_770_8
				end
			end

			if arg_767_1.time_ >= var_770_5 + var_770_6 and arg_767_1.time_ < var_770_5 + var_770_6 + arg_770_0 and arg_767_1.var_.characterEffect1076ui_story then
				local var_770_9 = 0.5

				arg_767_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_767_1.var_.characterEffect1076ui_story.fillRatio = var_770_9
			end

			local var_770_10 = 0
			local var_770_11 = 0.75

			if var_770_10 < arg_767_1.time_ and arg_767_1.time_ <= var_770_10 + arg_770_0 then
				arg_767_1.talkMaxDuration = 0
				arg_767_1.dialogCg_.alpha = 1

				arg_767_1.dialog_:SetActive(true)
				SetActive(arg_767_1.leftNameGo_, true)

				local var_770_12 = arg_767_1:FormatText(StoryNameCfg[379].name)

				arg_767_1.leftNameTxt_.text = var_770_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_767_1.leftNameTxt_.transform)

				arg_767_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_767_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_767_1:RecordName(arg_767_1.leftNameTxt_.text)
				SetActive(arg_767_1.iconTrs_.gameObject, false)
				arg_767_1.callingController_:SetSelectedState("normal")

				local var_770_13 = arg_767_1:GetWordFromCfg(120411189)
				local var_770_14 = arg_767_1:FormatText(var_770_13.content)

				arg_767_1.text_.text = var_770_14

				LuaForUtil.ClearLinePrefixSymbol(arg_767_1.text_)

				local var_770_15 = 30
				local var_770_16 = utf8.len(var_770_14)
				local var_770_17 = var_770_15 <= 0 and var_770_11 or var_770_11 * (var_770_16 / var_770_15)

				if var_770_17 > 0 and var_770_11 < var_770_17 then
					arg_767_1.talkMaxDuration = var_770_17

					if var_770_17 + var_770_10 > arg_767_1.duration_ then
						arg_767_1.duration_ = var_770_17 + var_770_10
					end
				end

				arg_767_1.text_.text = var_770_14
				arg_767_1.typewritter.percent = 0

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411189", "story_v_out_120411.awb") ~= 0 then
					local var_770_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411189", "story_v_out_120411.awb") / 1000

					if var_770_18 + var_770_10 > arg_767_1.duration_ then
						arg_767_1.duration_ = var_770_18 + var_770_10
					end

					if var_770_13.prefab_name ~= "" and arg_767_1.actors_[var_770_13.prefab_name] ~= nil then
						local var_770_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_767_1.actors_[var_770_13.prefab_name].transform, "story_v_out_120411", "120411189", "story_v_out_120411.awb")

						arg_767_1:RecordAudio("120411189", var_770_19)
						arg_767_1:RecordAudio("120411189", var_770_19)
					else
						arg_767_1:AudioAction("play", "voice", "story_v_out_120411", "120411189", "story_v_out_120411.awb")
					end

					arg_767_1:RecordHistoryTalkVoice("story_v_out_120411", "120411189", "story_v_out_120411.awb")
				end

				arg_767_1:RecordContent(arg_767_1.text_.text)
			end

			local var_770_20 = math.max(var_770_11, arg_767_1.talkMaxDuration)

			if var_770_10 <= arg_767_1.time_ and arg_767_1.time_ < var_770_10 + var_770_20 then
				arg_767_1.typewritter.percent = (arg_767_1.time_ - var_770_10) / var_770_20

				arg_767_1.typewritter:SetDirty()
			end

			if arg_767_1.time_ >= var_770_10 + var_770_20 and arg_767_1.time_ < var_770_10 + var_770_20 + arg_770_0 then
				arg_767_1.typewritter.percent = 1

				arg_767_1.typewritter:SetDirty()
				arg_767_1:ShowNextGo(true)
			end
		end
	end,
	Play120411190 = function(arg_771_0, arg_771_1)
		arg_771_1.time_ = 0
		arg_771_1.frameCnt_ = 0
		arg_771_1.state_ = "playing"
		arg_771_1.curTalkId_ = 120411190
		arg_771_1.duration_ = 8.1

		local var_771_0 = {
			zh = 2.166,
			ja = 8.1
		}
		local var_771_1 = manager.audio:GetLocalizationFlag()

		if var_771_0[var_771_1] ~= nil then
			arg_771_1.duration_ = var_771_0[var_771_1]
		end

		SetActive(arg_771_1.tipsGo_, false)

		function arg_771_1.onSingleLineFinish_()
			arg_771_1.onSingleLineUpdate_ = nil
			arg_771_1.onSingleLineFinish_ = nil
			arg_771_1.state_ = "waiting"
		end

		function arg_771_1.playNext_(arg_773_0)
			if arg_773_0 == 1 then
				arg_771_0:Play120411191(arg_771_1)
			end
		end

		function arg_771_1.onSingleLineUpdate_(arg_774_0)
			local var_774_0 = 0
			local var_774_1 = 0.2

			if var_774_0 < arg_771_1.time_ and arg_771_1.time_ <= var_774_0 + arg_774_0 then
				arg_771_1.talkMaxDuration = 0
				arg_771_1.dialogCg_.alpha = 1

				arg_771_1.dialog_:SetActive(true)
				SetActive(arg_771_1.leftNameGo_, true)

				local var_774_2 = arg_771_1:FormatText(StoryNameCfg[379].name)

				arg_771_1.leftNameTxt_.text = var_774_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_771_1.leftNameTxt_.transform)

				arg_771_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_771_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_771_1:RecordName(arg_771_1.leftNameTxt_.text)
				SetActive(arg_771_1.iconTrs_.gameObject, false)
				arg_771_1.callingController_:SetSelectedState("normal")

				local var_774_3 = arg_771_1:GetWordFromCfg(120411190)
				local var_774_4 = arg_771_1:FormatText(var_774_3.content)

				arg_771_1.text_.text = var_774_4

				LuaForUtil.ClearLinePrefixSymbol(arg_771_1.text_)

				local var_774_5 = 8
				local var_774_6 = utf8.len(var_774_4)
				local var_774_7 = var_774_5 <= 0 and var_774_1 or var_774_1 * (var_774_6 / var_774_5)

				if var_774_7 > 0 and var_774_1 < var_774_7 then
					arg_771_1.talkMaxDuration = var_774_7

					if var_774_7 + var_774_0 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_7 + var_774_0
					end
				end

				arg_771_1.text_.text = var_774_4
				arg_771_1.typewritter.percent = 0

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411190", "story_v_out_120411.awb") ~= 0 then
					local var_774_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411190", "story_v_out_120411.awb") / 1000

					if var_774_8 + var_774_0 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_8 + var_774_0
					end

					if var_774_3.prefab_name ~= "" and arg_771_1.actors_[var_774_3.prefab_name] ~= nil then
						local var_774_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_771_1.actors_[var_774_3.prefab_name].transform, "story_v_out_120411", "120411190", "story_v_out_120411.awb")

						arg_771_1:RecordAudio("120411190", var_774_9)
						arg_771_1:RecordAudio("120411190", var_774_9)
					else
						arg_771_1:AudioAction("play", "voice", "story_v_out_120411", "120411190", "story_v_out_120411.awb")
					end

					arg_771_1:RecordHistoryTalkVoice("story_v_out_120411", "120411190", "story_v_out_120411.awb")
				end

				arg_771_1:RecordContent(arg_771_1.text_.text)
			end

			local var_774_10 = math.max(var_774_1, arg_771_1.talkMaxDuration)

			if var_774_0 <= arg_771_1.time_ and arg_771_1.time_ < var_774_0 + var_774_10 then
				arg_771_1.typewritter.percent = (arg_771_1.time_ - var_774_0) / var_774_10

				arg_771_1.typewritter:SetDirty()
			end

			if arg_771_1.time_ >= var_774_0 + var_774_10 and arg_771_1.time_ < var_774_0 + var_774_10 + arg_774_0 then
				arg_771_1.typewritter.percent = 1

				arg_771_1.typewritter:SetDirty()
				arg_771_1:ShowNextGo(true)
			end
		end
	end,
	Play120411191 = function(arg_775_0, arg_775_1)
		arg_775_1.time_ = 0
		arg_775_1.frameCnt_ = 0
		arg_775_1.state_ = "playing"
		arg_775_1.curTalkId_ = 120411191
		arg_775_1.duration_ = 5

		SetActive(arg_775_1.tipsGo_, false)

		function arg_775_1.onSingleLineFinish_()
			arg_775_1.onSingleLineUpdate_ = nil
			arg_775_1.onSingleLineFinish_ = nil
			arg_775_1.state_ = "waiting"
		end

		function arg_775_1.playNext_(arg_777_0)
			if arg_777_0 == 1 then
				arg_775_0:Play120411192(arg_775_1)
			end
		end

		function arg_775_1.onSingleLineUpdate_(arg_778_0)
			local var_778_0 = arg_775_1.actors_["1072ui_story"]
			local var_778_1 = 0

			if var_778_1 < arg_775_1.time_ and arg_775_1.time_ <= var_778_1 + arg_778_0 and arg_775_1.var_.characterEffect1072ui_story == nil then
				arg_775_1.var_.characterEffect1072ui_story = var_778_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_778_2 = 0.2

			if var_778_1 <= arg_775_1.time_ and arg_775_1.time_ < var_778_1 + var_778_2 then
				local var_778_3 = (arg_775_1.time_ - var_778_1) / var_778_2

				if arg_775_1.var_.characterEffect1072ui_story then
					local var_778_4 = Mathf.Lerp(0, 0.5, var_778_3)

					arg_775_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_775_1.var_.characterEffect1072ui_story.fillRatio = var_778_4
				end
			end

			if arg_775_1.time_ >= var_778_1 + var_778_2 and arg_775_1.time_ < var_778_1 + var_778_2 + arg_778_0 and arg_775_1.var_.characterEffect1072ui_story then
				local var_778_5 = 0.5

				arg_775_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_775_1.var_.characterEffect1072ui_story.fillRatio = var_778_5
			end

			local var_778_6 = 0
			local var_778_7 = 0.05

			if var_778_6 < arg_775_1.time_ and arg_775_1.time_ <= var_778_6 + arg_778_0 then
				arg_775_1.talkMaxDuration = 0
				arg_775_1.dialogCg_.alpha = 1

				arg_775_1.dialog_:SetActive(true)
				SetActive(arg_775_1.leftNameGo_, true)

				local var_778_8 = arg_775_1:FormatText(StoryNameCfg[7].name)

				arg_775_1.leftNameTxt_.text = var_778_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_775_1.leftNameTxt_.transform)

				arg_775_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_775_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_775_1:RecordName(arg_775_1.leftNameTxt_.text)
				SetActive(arg_775_1.iconTrs_.gameObject, false)
				arg_775_1.callingController_:SetSelectedState("normal")

				local var_778_9 = arg_775_1:GetWordFromCfg(120411191)
				local var_778_10 = arg_775_1:FormatText(var_778_9.content)

				arg_775_1.text_.text = var_778_10

				LuaForUtil.ClearLinePrefixSymbol(arg_775_1.text_)

				local var_778_11 = 2
				local var_778_12 = utf8.len(var_778_10)
				local var_778_13 = var_778_11 <= 0 and var_778_7 or var_778_7 * (var_778_12 / var_778_11)

				if var_778_13 > 0 and var_778_7 < var_778_13 then
					arg_775_1.talkMaxDuration = var_778_13

					if var_778_13 + var_778_6 > arg_775_1.duration_ then
						arg_775_1.duration_ = var_778_13 + var_778_6
					end
				end

				arg_775_1.text_.text = var_778_10
				arg_775_1.typewritter.percent = 0

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(false)
				arg_775_1:RecordContent(arg_775_1.text_.text)
			end

			local var_778_14 = math.max(var_778_7, arg_775_1.talkMaxDuration)

			if var_778_6 <= arg_775_1.time_ and arg_775_1.time_ < var_778_6 + var_778_14 then
				arg_775_1.typewritter.percent = (arg_775_1.time_ - var_778_6) / var_778_14

				arg_775_1.typewritter:SetDirty()
			end

			if arg_775_1.time_ >= var_778_6 + var_778_14 and arg_775_1.time_ < var_778_6 + var_778_14 + arg_778_0 then
				arg_775_1.typewritter.percent = 1

				arg_775_1.typewritter:SetDirty()
				arg_775_1:ShowNextGo(true)
			end
		end
	end,
	Play120411192 = function(arg_779_0, arg_779_1)
		arg_779_1.time_ = 0
		arg_779_1.frameCnt_ = 0
		arg_779_1.state_ = "playing"
		arg_779_1.curTalkId_ = 120411192
		arg_779_1.duration_ = 7.566

		local var_779_0 = {
			zh = 4.5,
			ja = 7.566
		}
		local var_779_1 = manager.audio:GetLocalizationFlag()

		if var_779_0[var_779_1] ~= nil then
			arg_779_1.duration_ = var_779_0[var_779_1]
		end

		SetActive(arg_779_1.tipsGo_, false)

		function arg_779_1.onSingleLineFinish_()
			arg_779_1.onSingleLineUpdate_ = nil
			arg_779_1.onSingleLineFinish_ = nil
			arg_779_1.state_ = "waiting"
		end

		function arg_779_1.playNext_(arg_781_0)
			if arg_781_0 == 1 then
				arg_779_0:Play120411193(arg_779_1)
			end
		end

		function arg_779_1.onSingleLineUpdate_(arg_782_0)
			local var_782_0 = arg_779_1.actors_["1076ui_story"]
			local var_782_1 = 0

			if var_782_1 < arg_779_1.time_ and arg_779_1.time_ <= var_782_1 + arg_782_0 and arg_779_1.var_.characterEffect1076ui_story == nil then
				arg_779_1.var_.characterEffect1076ui_story = var_782_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_782_2 = 0.2

			if var_782_1 <= arg_779_1.time_ and arg_779_1.time_ < var_782_1 + var_782_2 then
				local var_782_3 = (arg_779_1.time_ - var_782_1) / var_782_2

				if arg_779_1.var_.characterEffect1076ui_story then
					arg_779_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_779_1.time_ >= var_782_1 + var_782_2 and arg_779_1.time_ < var_782_1 + var_782_2 + arg_782_0 and arg_779_1.var_.characterEffect1076ui_story then
				arg_779_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_782_4 = 0

			if var_782_4 < arg_779_1.time_ and arg_779_1.time_ <= var_782_4 + arg_782_0 then
				arg_779_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action4_1")
			end

			local var_782_5 = 0
			local var_782_6 = 0.475

			if var_782_5 < arg_779_1.time_ and arg_779_1.time_ <= var_782_5 + arg_782_0 then
				arg_779_1.talkMaxDuration = 0
				arg_779_1.dialogCg_.alpha = 1

				arg_779_1.dialog_:SetActive(true)
				SetActive(arg_779_1.leftNameGo_, true)

				local var_782_7 = arg_779_1:FormatText(StoryNameCfg[389].name)

				arg_779_1.leftNameTxt_.text = var_782_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_779_1.leftNameTxt_.transform)

				arg_779_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_779_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_779_1:RecordName(arg_779_1.leftNameTxt_.text)
				SetActive(arg_779_1.iconTrs_.gameObject, false)
				arg_779_1.callingController_:SetSelectedState("normal")

				local var_782_8 = arg_779_1:GetWordFromCfg(120411192)
				local var_782_9 = arg_779_1:FormatText(var_782_8.content)

				arg_779_1.text_.text = var_782_9

				LuaForUtil.ClearLinePrefixSymbol(arg_779_1.text_)

				local var_782_10 = 19
				local var_782_11 = utf8.len(var_782_9)
				local var_782_12 = var_782_10 <= 0 and var_782_6 or var_782_6 * (var_782_11 / var_782_10)

				if var_782_12 > 0 and var_782_6 < var_782_12 then
					arg_779_1.talkMaxDuration = var_782_12

					if var_782_12 + var_782_5 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_12 + var_782_5
					end
				end

				arg_779_1.text_.text = var_782_9
				arg_779_1.typewritter.percent = 0

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411192", "story_v_out_120411.awb") ~= 0 then
					local var_782_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411192", "story_v_out_120411.awb") / 1000

					if var_782_13 + var_782_5 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_13 + var_782_5
					end

					if var_782_8.prefab_name ~= "" and arg_779_1.actors_[var_782_8.prefab_name] ~= nil then
						local var_782_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_779_1.actors_[var_782_8.prefab_name].transform, "story_v_out_120411", "120411192", "story_v_out_120411.awb")

						arg_779_1:RecordAudio("120411192", var_782_14)
						arg_779_1:RecordAudio("120411192", var_782_14)
					else
						arg_779_1:AudioAction("play", "voice", "story_v_out_120411", "120411192", "story_v_out_120411.awb")
					end

					arg_779_1:RecordHistoryTalkVoice("story_v_out_120411", "120411192", "story_v_out_120411.awb")
				end

				arg_779_1:RecordContent(arg_779_1.text_.text)
			end

			local var_782_15 = math.max(var_782_6, arg_779_1.talkMaxDuration)

			if var_782_5 <= arg_779_1.time_ and arg_779_1.time_ < var_782_5 + var_782_15 then
				arg_779_1.typewritter.percent = (arg_779_1.time_ - var_782_5) / var_782_15

				arg_779_1.typewritter:SetDirty()
			end

			if arg_779_1.time_ >= var_782_5 + var_782_15 and arg_779_1.time_ < var_782_5 + var_782_15 + arg_782_0 then
				arg_779_1.typewritter.percent = 1

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(true)
			end
		end
	end,
	Play120411193 = function(arg_783_0, arg_783_1)
		arg_783_1.time_ = 0
		arg_783_1.frameCnt_ = 0
		arg_783_1.state_ = "playing"
		arg_783_1.curTalkId_ = 120411193
		arg_783_1.duration_ = 8.6

		local var_783_0 = {
			zh = 6.066,
			ja = 8.6
		}
		local var_783_1 = manager.audio:GetLocalizationFlag()

		if var_783_0[var_783_1] ~= nil then
			arg_783_1.duration_ = var_783_0[var_783_1]
		end

		SetActive(arg_783_1.tipsGo_, false)

		function arg_783_1.onSingleLineFinish_()
			arg_783_1.onSingleLineUpdate_ = nil
			arg_783_1.onSingleLineFinish_ = nil
			arg_783_1.state_ = "waiting"
		end

		function arg_783_1.playNext_(arg_785_0)
			if arg_785_0 == 1 then
				arg_783_0:Play120411194(arg_783_1)
			end
		end

		function arg_783_1.onSingleLineUpdate_(arg_786_0)
			local var_786_0 = 0

			if var_786_0 < arg_783_1.time_ and arg_783_1.time_ <= var_786_0 + arg_786_0 then
				arg_783_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action4_2")
			end

			local var_786_1 = 0

			if var_786_1 < arg_783_1.time_ and arg_783_1.time_ <= var_786_1 + arg_786_0 then
				arg_783_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_786_2 = 0
			local var_786_3 = 0.675

			if var_786_2 < arg_783_1.time_ and arg_783_1.time_ <= var_786_2 + arg_786_0 then
				arg_783_1.talkMaxDuration = 0
				arg_783_1.dialogCg_.alpha = 1

				arg_783_1.dialog_:SetActive(true)
				SetActive(arg_783_1.leftNameGo_, true)

				local var_786_4 = arg_783_1:FormatText(StoryNameCfg[389].name)

				arg_783_1.leftNameTxt_.text = var_786_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_783_1.leftNameTxt_.transform)

				arg_783_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_783_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_783_1:RecordName(arg_783_1.leftNameTxt_.text)
				SetActive(arg_783_1.iconTrs_.gameObject, false)
				arg_783_1.callingController_:SetSelectedState("normal")

				local var_786_5 = arg_783_1:GetWordFromCfg(120411193)
				local var_786_6 = arg_783_1:FormatText(var_786_5.content)

				arg_783_1.text_.text = var_786_6

				LuaForUtil.ClearLinePrefixSymbol(arg_783_1.text_)

				local var_786_7 = 27
				local var_786_8 = utf8.len(var_786_6)
				local var_786_9 = var_786_7 <= 0 and var_786_3 or var_786_3 * (var_786_8 / var_786_7)

				if var_786_9 > 0 and var_786_3 < var_786_9 then
					arg_783_1.talkMaxDuration = var_786_9

					if var_786_9 + var_786_2 > arg_783_1.duration_ then
						arg_783_1.duration_ = var_786_9 + var_786_2
					end
				end

				arg_783_1.text_.text = var_786_6
				arg_783_1.typewritter.percent = 0

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411193", "story_v_out_120411.awb") ~= 0 then
					local var_786_10 = manager.audio:GetVoiceLength("story_v_out_120411", "120411193", "story_v_out_120411.awb") / 1000

					if var_786_10 + var_786_2 > arg_783_1.duration_ then
						arg_783_1.duration_ = var_786_10 + var_786_2
					end

					if var_786_5.prefab_name ~= "" and arg_783_1.actors_[var_786_5.prefab_name] ~= nil then
						local var_786_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_783_1.actors_[var_786_5.prefab_name].transform, "story_v_out_120411", "120411193", "story_v_out_120411.awb")

						arg_783_1:RecordAudio("120411193", var_786_11)
						arg_783_1:RecordAudio("120411193", var_786_11)
					else
						arg_783_1:AudioAction("play", "voice", "story_v_out_120411", "120411193", "story_v_out_120411.awb")
					end

					arg_783_1:RecordHistoryTalkVoice("story_v_out_120411", "120411193", "story_v_out_120411.awb")
				end

				arg_783_1:RecordContent(arg_783_1.text_.text)
			end

			local var_786_12 = math.max(var_786_3, arg_783_1.talkMaxDuration)

			if var_786_2 <= arg_783_1.time_ and arg_783_1.time_ < var_786_2 + var_786_12 then
				arg_783_1.typewritter.percent = (arg_783_1.time_ - var_786_2) / var_786_12

				arg_783_1.typewritter:SetDirty()
			end

			if arg_783_1.time_ >= var_786_2 + var_786_12 and arg_783_1.time_ < var_786_2 + var_786_12 + arg_786_0 then
				arg_783_1.typewritter.percent = 1

				arg_783_1.typewritter:SetDirty()
				arg_783_1:ShowNextGo(true)
			end
		end
	end,
	Play120411194 = function(arg_787_0, arg_787_1)
		arg_787_1.time_ = 0
		arg_787_1.frameCnt_ = 0
		arg_787_1.state_ = "playing"
		arg_787_1.curTalkId_ = 120411194
		arg_787_1.duration_ = 6.3

		local var_787_0 = {
			zh = 3.866,
			ja = 6.3
		}
		local var_787_1 = manager.audio:GetLocalizationFlag()

		if var_787_0[var_787_1] ~= nil then
			arg_787_1.duration_ = var_787_0[var_787_1]
		end

		SetActive(arg_787_1.tipsGo_, false)

		function arg_787_1.onSingleLineFinish_()
			arg_787_1.onSingleLineUpdate_ = nil
			arg_787_1.onSingleLineFinish_ = nil
			arg_787_1.state_ = "waiting"
		end

		function arg_787_1.playNext_(arg_789_0)
			if arg_789_0 == 1 then
				arg_787_0:Play120411195(arg_787_1)
			end
		end

		function arg_787_1.onSingleLineUpdate_(arg_790_0)
			local var_790_0 = arg_787_1.actors_["1076ui_story"]
			local var_790_1 = 0

			if var_790_1 < arg_787_1.time_ and arg_787_1.time_ <= var_790_1 + arg_790_0 and arg_787_1.var_.characterEffect1076ui_story == nil then
				arg_787_1.var_.characterEffect1076ui_story = var_790_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_790_2 = 0.2

			if var_790_1 <= arg_787_1.time_ and arg_787_1.time_ < var_790_1 + var_790_2 then
				local var_790_3 = (arg_787_1.time_ - var_790_1) / var_790_2

				if arg_787_1.var_.characterEffect1076ui_story then
					local var_790_4 = Mathf.Lerp(0, 0.5, var_790_3)

					arg_787_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_787_1.var_.characterEffect1076ui_story.fillRatio = var_790_4
				end
			end

			if arg_787_1.time_ >= var_790_1 + var_790_2 and arg_787_1.time_ < var_790_1 + var_790_2 + arg_790_0 and arg_787_1.var_.characterEffect1076ui_story then
				local var_790_5 = 0.5

				arg_787_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_787_1.var_.characterEffect1076ui_story.fillRatio = var_790_5
			end

			local var_790_6 = arg_787_1.actors_["1072ui_story"]
			local var_790_7 = 0

			if var_790_7 < arg_787_1.time_ and arg_787_1.time_ <= var_790_7 + arg_790_0 and arg_787_1.var_.characterEffect1072ui_story == nil then
				arg_787_1.var_.characterEffect1072ui_story = var_790_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_790_8 = 0.2

			if var_790_7 <= arg_787_1.time_ and arg_787_1.time_ < var_790_7 + var_790_8 then
				local var_790_9 = (arg_787_1.time_ - var_790_7) / var_790_8

				if arg_787_1.var_.characterEffect1072ui_story then
					arg_787_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_787_1.time_ >= var_790_7 + var_790_8 and arg_787_1.time_ < var_790_7 + var_790_8 + arg_790_0 and arg_787_1.var_.characterEffect1072ui_story then
				arg_787_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_790_10 = 0
			local var_790_11 = 0.375

			if var_790_10 < arg_787_1.time_ and arg_787_1.time_ <= var_790_10 + arg_790_0 then
				arg_787_1.talkMaxDuration = 0
				arg_787_1.dialogCg_.alpha = 1

				arg_787_1.dialog_:SetActive(true)
				SetActive(arg_787_1.leftNameGo_, true)

				local var_790_12 = arg_787_1:FormatText(StoryNameCfg[379].name)

				arg_787_1.leftNameTxt_.text = var_790_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_787_1.leftNameTxt_.transform)

				arg_787_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_787_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_787_1:RecordName(arg_787_1.leftNameTxt_.text)
				SetActive(arg_787_1.iconTrs_.gameObject, false)
				arg_787_1.callingController_:SetSelectedState("normal")

				local var_790_13 = arg_787_1:GetWordFromCfg(120411194)
				local var_790_14 = arg_787_1:FormatText(var_790_13.content)

				arg_787_1.text_.text = var_790_14

				LuaForUtil.ClearLinePrefixSymbol(arg_787_1.text_)

				local var_790_15 = 15
				local var_790_16 = utf8.len(var_790_14)
				local var_790_17 = var_790_15 <= 0 and var_790_11 or var_790_11 * (var_790_16 / var_790_15)

				if var_790_17 > 0 and var_790_11 < var_790_17 then
					arg_787_1.talkMaxDuration = var_790_17

					if var_790_17 + var_790_10 > arg_787_1.duration_ then
						arg_787_1.duration_ = var_790_17 + var_790_10
					end
				end

				arg_787_1.text_.text = var_790_14
				arg_787_1.typewritter.percent = 0

				arg_787_1.typewritter:SetDirty()
				arg_787_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411194", "story_v_out_120411.awb") ~= 0 then
					local var_790_18 = manager.audio:GetVoiceLength("story_v_out_120411", "120411194", "story_v_out_120411.awb") / 1000

					if var_790_18 + var_790_10 > arg_787_1.duration_ then
						arg_787_1.duration_ = var_790_18 + var_790_10
					end

					if var_790_13.prefab_name ~= "" and arg_787_1.actors_[var_790_13.prefab_name] ~= nil then
						local var_790_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_787_1.actors_[var_790_13.prefab_name].transform, "story_v_out_120411", "120411194", "story_v_out_120411.awb")

						arg_787_1:RecordAudio("120411194", var_790_19)
						arg_787_1:RecordAudio("120411194", var_790_19)
					else
						arg_787_1:AudioAction("play", "voice", "story_v_out_120411", "120411194", "story_v_out_120411.awb")
					end

					arg_787_1:RecordHistoryTalkVoice("story_v_out_120411", "120411194", "story_v_out_120411.awb")
				end

				arg_787_1:RecordContent(arg_787_1.text_.text)
			end

			local var_790_20 = math.max(var_790_11, arg_787_1.talkMaxDuration)

			if var_790_10 <= arg_787_1.time_ and arg_787_1.time_ < var_790_10 + var_790_20 then
				arg_787_1.typewritter.percent = (arg_787_1.time_ - var_790_10) / var_790_20

				arg_787_1.typewritter:SetDirty()
			end

			if arg_787_1.time_ >= var_790_10 + var_790_20 and arg_787_1.time_ < var_790_10 + var_790_20 + arg_790_0 then
				arg_787_1.typewritter.percent = 1

				arg_787_1.typewritter:SetDirty()
				arg_787_1:ShowNextGo(true)
			end
		end
	end,
	Play120411195 = function(arg_791_0, arg_791_1)
		arg_791_1.time_ = 0
		arg_791_1.frameCnt_ = 0
		arg_791_1.state_ = "playing"
		arg_791_1.curTalkId_ = 120411195
		arg_791_1.duration_ = 11.9

		local var_791_0 = {
			zh = 5.933,
			ja = 11.9
		}
		local var_791_1 = manager.audio:GetLocalizationFlag()

		if var_791_0[var_791_1] ~= nil then
			arg_791_1.duration_ = var_791_0[var_791_1]
		end

		SetActive(arg_791_1.tipsGo_, false)

		function arg_791_1.onSingleLineFinish_()
			arg_791_1.onSingleLineUpdate_ = nil
			arg_791_1.onSingleLineFinish_ = nil
			arg_791_1.state_ = "waiting"
		end

		function arg_791_1.playNext_(arg_793_0)
			if arg_793_0 == 1 then
				arg_791_0:Play120411196(arg_791_1)
			end
		end

		function arg_791_1.onSingleLineUpdate_(arg_794_0)
			local var_794_0 = 0
			local var_794_1 = 0.825

			if var_794_0 < arg_791_1.time_ and arg_791_1.time_ <= var_794_0 + arg_794_0 then
				arg_791_1.talkMaxDuration = 0
				arg_791_1.dialogCg_.alpha = 1

				arg_791_1.dialog_:SetActive(true)
				SetActive(arg_791_1.leftNameGo_, true)

				local var_794_2 = arg_791_1:FormatText(StoryNameCfg[379].name)

				arg_791_1.leftNameTxt_.text = var_794_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_791_1.leftNameTxt_.transform)

				arg_791_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_791_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_791_1:RecordName(arg_791_1.leftNameTxt_.text)
				SetActive(arg_791_1.iconTrs_.gameObject, false)
				arg_791_1.callingController_:SetSelectedState("normal")

				local var_794_3 = arg_791_1:GetWordFromCfg(120411195)
				local var_794_4 = arg_791_1:FormatText(var_794_3.content)

				arg_791_1.text_.text = var_794_4

				LuaForUtil.ClearLinePrefixSymbol(arg_791_1.text_)

				local var_794_5 = 34
				local var_794_6 = utf8.len(var_794_4)
				local var_794_7 = var_794_5 <= 0 and var_794_1 or var_794_1 * (var_794_6 / var_794_5)

				if var_794_7 > 0 and var_794_1 < var_794_7 then
					arg_791_1.talkMaxDuration = var_794_7

					if var_794_7 + var_794_0 > arg_791_1.duration_ then
						arg_791_1.duration_ = var_794_7 + var_794_0
					end
				end

				arg_791_1.text_.text = var_794_4
				arg_791_1.typewritter.percent = 0

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411195", "story_v_out_120411.awb") ~= 0 then
					local var_794_8 = manager.audio:GetVoiceLength("story_v_out_120411", "120411195", "story_v_out_120411.awb") / 1000

					if var_794_8 + var_794_0 > arg_791_1.duration_ then
						arg_791_1.duration_ = var_794_8 + var_794_0
					end

					if var_794_3.prefab_name ~= "" and arg_791_1.actors_[var_794_3.prefab_name] ~= nil then
						local var_794_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_791_1.actors_[var_794_3.prefab_name].transform, "story_v_out_120411", "120411195", "story_v_out_120411.awb")

						arg_791_1:RecordAudio("120411195", var_794_9)
						arg_791_1:RecordAudio("120411195", var_794_9)
					else
						arg_791_1:AudioAction("play", "voice", "story_v_out_120411", "120411195", "story_v_out_120411.awb")
					end

					arg_791_1:RecordHistoryTalkVoice("story_v_out_120411", "120411195", "story_v_out_120411.awb")
				end

				arg_791_1:RecordContent(arg_791_1.text_.text)
			end

			local var_794_10 = math.max(var_794_1, arg_791_1.talkMaxDuration)

			if var_794_0 <= arg_791_1.time_ and arg_791_1.time_ < var_794_0 + var_794_10 then
				arg_791_1.typewritter.percent = (arg_791_1.time_ - var_794_0) / var_794_10

				arg_791_1.typewritter:SetDirty()
			end

			if arg_791_1.time_ >= var_794_0 + var_794_10 and arg_791_1.time_ < var_794_0 + var_794_10 + arg_794_0 then
				arg_791_1.typewritter.percent = 1

				arg_791_1.typewritter:SetDirty()
				arg_791_1:ShowNextGo(true)
			end
		end
	end,
	Play120411196 = function(arg_795_0, arg_795_1)
		arg_795_1.time_ = 0
		arg_795_1.frameCnt_ = 0
		arg_795_1.state_ = "playing"
		arg_795_1.curTalkId_ = 120411196
		arg_795_1.duration_ = 5

		SetActive(arg_795_1.tipsGo_, false)

		function arg_795_1.onSingleLineFinish_()
			arg_795_1.onSingleLineUpdate_ = nil
			arg_795_1.onSingleLineFinish_ = nil
			arg_795_1.state_ = "waiting"
		end

		function arg_795_1.playNext_(arg_797_0)
			if arg_797_0 == 1 then
				arg_795_0:Play120411197(arg_795_1)
			end
		end

		function arg_795_1.onSingleLineUpdate_(arg_798_0)
			local var_798_0 = arg_795_1.actors_["1072ui_story"]
			local var_798_1 = 0

			if var_798_1 < arg_795_1.time_ and arg_795_1.time_ <= var_798_1 + arg_798_0 and arg_795_1.var_.characterEffect1072ui_story == nil then
				arg_795_1.var_.characterEffect1072ui_story = var_798_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_798_2 = 0.2

			if var_798_1 <= arg_795_1.time_ and arg_795_1.time_ < var_798_1 + var_798_2 then
				local var_798_3 = (arg_795_1.time_ - var_798_1) / var_798_2

				if arg_795_1.var_.characterEffect1072ui_story then
					local var_798_4 = Mathf.Lerp(0, 0.5, var_798_3)

					arg_795_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_795_1.var_.characterEffect1072ui_story.fillRatio = var_798_4
				end
			end

			if arg_795_1.time_ >= var_798_1 + var_798_2 and arg_795_1.time_ < var_798_1 + var_798_2 + arg_798_0 and arg_795_1.var_.characterEffect1072ui_story then
				local var_798_5 = 0.5

				arg_795_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_795_1.var_.characterEffect1072ui_story.fillRatio = var_798_5
			end

			local var_798_6 = 0
			local var_798_7 = 1.375

			if var_798_6 < arg_795_1.time_ and arg_795_1.time_ <= var_798_6 + arg_798_0 then
				arg_795_1.talkMaxDuration = 0
				arg_795_1.dialogCg_.alpha = 1

				arg_795_1.dialog_:SetActive(true)
				SetActive(arg_795_1.leftNameGo_, false)

				arg_795_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_795_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_795_1:RecordName(arg_795_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_795_1.iconTrs_.gameObject, false)
				arg_795_1.callingController_:SetSelectedState("normal")

				local var_798_8 = arg_795_1:GetWordFromCfg(120411196)
				local var_798_9 = arg_795_1:FormatText(var_798_8.content)

				arg_795_1.text_.text = var_798_9

				LuaForUtil.ClearLinePrefixSymbol(arg_795_1.text_)

				local var_798_10 = 55
				local var_798_11 = utf8.len(var_798_9)
				local var_798_12 = var_798_10 <= 0 and var_798_7 or var_798_7 * (var_798_11 / var_798_10)

				if var_798_12 > 0 and var_798_7 < var_798_12 then
					arg_795_1.talkMaxDuration = var_798_12

					if var_798_12 + var_798_6 > arg_795_1.duration_ then
						arg_795_1.duration_ = var_798_12 + var_798_6
					end
				end

				arg_795_1.text_.text = var_798_9
				arg_795_1.typewritter.percent = 0

				arg_795_1.typewritter:SetDirty()
				arg_795_1:ShowNextGo(false)
				arg_795_1:RecordContent(arg_795_1.text_.text)
			end

			local var_798_13 = math.max(var_798_7, arg_795_1.talkMaxDuration)

			if var_798_6 <= arg_795_1.time_ and arg_795_1.time_ < var_798_6 + var_798_13 then
				arg_795_1.typewritter.percent = (arg_795_1.time_ - var_798_6) / var_798_13

				arg_795_1.typewritter:SetDirty()
			end

			if arg_795_1.time_ >= var_798_6 + var_798_13 and arg_795_1.time_ < var_798_6 + var_798_13 + arg_798_0 then
				arg_795_1.typewritter.percent = 1

				arg_795_1.typewritter:SetDirty()
				arg_795_1:ShowNextGo(true)
			end
		end
	end,
	Play120411197 = function(arg_799_0, arg_799_1)
		arg_799_1.time_ = 0
		arg_799_1.frameCnt_ = 0
		arg_799_1.state_ = "playing"
		arg_799_1.curTalkId_ = 120411197
		arg_799_1.duration_ = 5

		SetActive(arg_799_1.tipsGo_, false)

		function arg_799_1.onSingleLineFinish_()
			arg_799_1.onSingleLineUpdate_ = nil
			arg_799_1.onSingleLineFinish_ = nil
			arg_799_1.state_ = "waiting"
		end

		function arg_799_1.playNext_(arg_801_0)
			if arg_801_0 == 1 then
				arg_799_0:Play120411198(arg_799_1)
			end
		end

		function arg_799_1.onSingleLineUpdate_(arg_802_0)
			local var_802_0 = 0
			local var_802_1 = 0.6

			if var_802_0 < arg_799_1.time_ and arg_799_1.time_ <= var_802_0 + arg_802_0 then
				arg_799_1.talkMaxDuration = 0
				arg_799_1.dialogCg_.alpha = 1

				arg_799_1.dialog_:SetActive(true)
				SetActive(arg_799_1.leftNameGo_, true)

				local var_802_2 = arg_799_1:FormatText(StoryNameCfg[7].name)

				arg_799_1.leftNameTxt_.text = var_802_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_799_1.leftNameTxt_.transform)

				arg_799_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_799_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_799_1:RecordName(arg_799_1.leftNameTxt_.text)
				SetActive(arg_799_1.iconTrs_.gameObject, false)
				arg_799_1.callingController_:SetSelectedState("normal")

				local var_802_3 = arg_799_1:GetWordFromCfg(120411197)
				local var_802_4 = arg_799_1:FormatText(var_802_3.content)

				arg_799_1.text_.text = var_802_4

				LuaForUtil.ClearLinePrefixSymbol(arg_799_1.text_)

				local var_802_5 = 24
				local var_802_6 = utf8.len(var_802_4)
				local var_802_7 = var_802_5 <= 0 and var_802_1 or var_802_1 * (var_802_6 / var_802_5)

				if var_802_7 > 0 and var_802_1 < var_802_7 then
					arg_799_1.talkMaxDuration = var_802_7

					if var_802_7 + var_802_0 > arg_799_1.duration_ then
						arg_799_1.duration_ = var_802_7 + var_802_0
					end
				end

				arg_799_1.text_.text = var_802_4
				arg_799_1.typewritter.percent = 0

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(false)
				arg_799_1:RecordContent(arg_799_1.text_.text)
			end

			local var_802_8 = math.max(var_802_1, arg_799_1.talkMaxDuration)

			if var_802_0 <= arg_799_1.time_ and arg_799_1.time_ < var_802_0 + var_802_8 then
				arg_799_1.typewritter.percent = (arg_799_1.time_ - var_802_0) / var_802_8

				arg_799_1.typewritter:SetDirty()
			end

			if arg_799_1.time_ >= var_802_0 + var_802_8 and arg_799_1.time_ < var_802_0 + var_802_8 + arg_802_0 then
				arg_799_1.typewritter.percent = 1

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(true)
			end
		end
	end,
	Play120411198 = function(arg_803_0, arg_803_1)
		arg_803_1.time_ = 0
		arg_803_1.frameCnt_ = 0
		arg_803_1.state_ = "playing"
		arg_803_1.curTalkId_ = 120411198
		arg_803_1.duration_ = 5.433

		local var_803_0 = {
			zh = 2.466,
			ja = 5.433
		}
		local var_803_1 = manager.audio:GetLocalizationFlag()

		if var_803_0[var_803_1] ~= nil then
			arg_803_1.duration_ = var_803_0[var_803_1]
		end

		SetActive(arg_803_1.tipsGo_, false)

		function arg_803_1.onSingleLineFinish_()
			arg_803_1.onSingleLineUpdate_ = nil
			arg_803_1.onSingleLineFinish_ = nil
			arg_803_1.state_ = "waiting"
		end

		function arg_803_1.playNext_(arg_805_0)
			if arg_805_0 == 1 then
				arg_803_0:Play120411199(arg_803_1)
			end
		end

		function arg_803_1.onSingleLineUpdate_(arg_806_0)
			local var_806_0 = arg_803_1.actors_["1072ui_story"]
			local var_806_1 = 0

			if var_806_1 < arg_803_1.time_ and arg_803_1.time_ <= var_806_1 + arg_806_0 and arg_803_1.var_.characterEffect1072ui_story == nil then
				arg_803_1.var_.characterEffect1072ui_story = var_806_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_806_2 = 0.2

			if var_806_1 <= arg_803_1.time_ and arg_803_1.time_ < var_806_1 + var_806_2 then
				local var_806_3 = (arg_803_1.time_ - var_806_1) / var_806_2

				if arg_803_1.var_.characterEffect1072ui_story then
					arg_803_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_803_1.time_ >= var_806_1 + var_806_2 and arg_803_1.time_ < var_806_1 + var_806_2 + arg_806_0 and arg_803_1.var_.characterEffect1072ui_story then
				arg_803_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_806_4 = 0

			if var_806_4 < arg_803_1.time_ and arg_803_1.time_ <= var_806_4 + arg_806_0 then
				arg_803_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action2_1")
			end

			local var_806_5 = 0
			local var_806_6 = 0.275

			if var_806_5 < arg_803_1.time_ and arg_803_1.time_ <= var_806_5 + arg_806_0 then
				arg_803_1.talkMaxDuration = 0
				arg_803_1.dialogCg_.alpha = 1

				arg_803_1.dialog_:SetActive(true)
				SetActive(arg_803_1.leftNameGo_, true)

				local var_806_7 = arg_803_1:FormatText(StoryNameCfg[379].name)

				arg_803_1.leftNameTxt_.text = var_806_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_803_1.leftNameTxt_.transform)

				arg_803_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_803_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_803_1:RecordName(arg_803_1.leftNameTxt_.text)
				SetActive(arg_803_1.iconTrs_.gameObject, false)
				arg_803_1.callingController_:SetSelectedState("normal")

				local var_806_8 = arg_803_1:GetWordFromCfg(120411198)
				local var_806_9 = arg_803_1:FormatText(var_806_8.content)

				arg_803_1.text_.text = var_806_9

				LuaForUtil.ClearLinePrefixSymbol(arg_803_1.text_)

				local var_806_10 = 11
				local var_806_11 = utf8.len(var_806_9)
				local var_806_12 = var_806_10 <= 0 and var_806_6 or var_806_6 * (var_806_11 / var_806_10)

				if var_806_12 > 0 and var_806_6 < var_806_12 then
					arg_803_1.talkMaxDuration = var_806_12

					if var_806_12 + var_806_5 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_12 + var_806_5
					end
				end

				arg_803_1.text_.text = var_806_9
				arg_803_1.typewritter.percent = 0

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120411", "120411198", "story_v_out_120411.awb") ~= 0 then
					local var_806_13 = manager.audio:GetVoiceLength("story_v_out_120411", "120411198", "story_v_out_120411.awb") / 1000

					if var_806_13 + var_806_5 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_13 + var_806_5
					end

					if var_806_8.prefab_name ~= "" and arg_803_1.actors_[var_806_8.prefab_name] ~= nil then
						local var_806_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_803_1.actors_[var_806_8.prefab_name].transform, "story_v_out_120411", "120411198", "story_v_out_120411.awb")

						arg_803_1:RecordAudio("120411198", var_806_14)
						arg_803_1:RecordAudio("120411198", var_806_14)
					else
						arg_803_1:AudioAction("play", "voice", "story_v_out_120411", "120411198", "story_v_out_120411.awb")
					end

					arg_803_1:RecordHistoryTalkVoice("story_v_out_120411", "120411198", "story_v_out_120411.awb")
				end

				arg_803_1:RecordContent(arg_803_1.text_.text)
			end

			local var_806_15 = math.max(var_806_6, arg_803_1.talkMaxDuration)

			if var_806_5 <= arg_803_1.time_ and arg_803_1.time_ < var_806_5 + var_806_15 then
				arg_803_1.typewritter.percent = (arg_803_1.time_ - var_806_5) / var_806_15

				arg_803_1.typewritter:SetDirty()
			end

			if arg_803_1.time_ >= var_806_5 + var_806_15 and arg_803_1.time_ < var_806_5 + var_806_15 + arg_806_0 then
				arg_803_1.typewritter.percent = 1

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(true)
			end
		end
	end,
	Play120411199 = function(arg_807_0, arg_807_1)
		arg_807_1.time_ = 0
		arg_807_1.frameCnt_ = 0
		arg_807_1.state_ = "playing"
		arg_807_1.curTalkId_ = 120411199
		arg_807_1.duration_ = 5

		SetActive(arg_807_1.tipsGo_, false)

		function arg_807_1.onSingleLineFinish_()
			arg_807_1.onSingleLineUpdate_ = nil
			arg_807_1.onSingleLineFinish_ = nil
			arg_807_1.state_ = "waiting"
			arg_807_1.auto_ = false
		end

		function arg_807_1.playNext_(arg_809_0)
			arg_807_1.onStoryFinished_()
		end

		function arg_807_1.onSingleLineUpdate_(arg_810_0)
			local var_810_0 = arg_807_1.actors_["1072ui_story"].transform
			local var_810_1 = 0

			if var_810_1 < arg_807_1.time_ and arg_807_1.time_ <= var_810_1 + arg_810_0 then
				arg_807_1.var_.moveOldPos1072ui_story = var_810_0.localPosition
			end

			local var_810_2 = 0.001

			if var_810_1 <= arg_807_1.time_ and arg_807_1.time_ < var_810_1 + var_810_2 then
				local var_810_3 = (arg_807_1.time_ - var_810_1) / var_810_2
				local var_810_4 = Vector3.New(0, 100, 0)

				var_810_0.localPosition = Vector3.Lerp(arg_807_1.var_.moveOldPos1072ui_story, var_810_4, var_810_3)

				local var_810_5 = manager.ui.mainCamera.transform.position - var_810_0.position

				var_810_0.forward = Vector3.New(var_810_5.x, var_810_5.y, var_810_5.z)

				local var_810_6 = var_810_0.localEulerAngles

				var_810_6.z = 0
				var_810_6.x = 0
				var_810_0.localEulerAngles = var_810_6
			end

			if arg_807_1.time_ >= var_810_1 + var_810_2 and arg_807_1.time_ < var_810_1 + var_810_2 + arg_810_0 then
				var_810_0.localPosition = Vector3.New(0, 100, 0)

				local var_810_7 = manager.ui.mainCamera.transform.position - var_810_0.position

				var_810_0.forward = Vector3.New(var_810_7.x, var_810_7.y, var_810_7.z)

				local var_810_8 = var_810_0.localEulerAngles

				var_810_8.z = 0
				var_810_8.x = 0
				var_810_0.localEulerAngles = var_810_8
			end

			local var_810_9 = arg_807_1.actors_["1076ui_story"].transform
			local var_810_10 = 0

			if var_810_10 < arg_807_1.time_ and arg_807_1.time_ <= var_810_10 + arg_810_0 then
				arg_807_1.var_.moveOldPos1076ui_story = var_810_9.localPosition
			end

			local var_810_11 = 0.001

			if var_810_10 <= arg_807_1.time_ and arg_807_1.time_ < var_810_10 + var_810_11 then
				local var_810_12 = (arg_807_1.time_ - var_810_10) / var_810_11
				local var_810_13 = Vector3.New(0, 100, 0)

				var_810_9.localPosition = Vector3.Lerp(arg_807_1.var_.moveOldPos1076ui_story, var_810_13, var_810_12)

				local var_810_14 = manager.ui.mainCamera.transform.position - var_810_9.position

				var_810_9.forward = Vector3.New(var_810_14.x, var_810_14.y, var_810_14.z)

				local var_810_15 = var_810_9.localEulerAngles

				var_810_15.z = 0
				var_810_15.x = 0
				var_810_9.localEulerAngles = var_810_15
			end

			if arg_807_1.time_ >= var_810_10 + var_810_11 and arg_807_1.time_ < var_810_10 + var_810_11 + arg_810_0 then
				var_810_9.localPosition = Vector3.New(0, 100, 0)

				local var_810_16 = manager.ui.mainCamera.transform.position - var_810_9.position

				var_810_9.forward = Vector3.New(var_810_16.x, var_810_16.y, var_810_16.z)

				local var_810_17 = var_810_9.localEulerAngles

				var_810_17.z = 0
				var_810_17.x = 0
				var_810_9.localEulerAngles = var_810_17
			end

			local var_810_18 = 0
			local var_810_19 = 0.575

			if var_810_18 < arg_807_1.time_ and arg_807_1.time_ <= var_810_18 + arg_810_0 then
				arg_807_1.talkMaxDuration = 0
				arg_807_1.dialogCg_.alpha = 1

				arg_807_1.dialog_:SetActive(true)
				SetActive(arg_807_1.leftNameGo_, false)

				arg_807_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_807_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_807_1:RecordName(arg_807_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_807_1.iconTrs_.gameObject, false)
				arg_807_1.callingController_:SetSelectedState("normal")

				local var_810_20 = arg_807_1:GetWordFromCfg(120411199)
				local var_810_21 = arg_807_1:FormatText(var_810_20.content)

				arg_807_1.text_.text = var_810_21

				LuaForUtil.ClearLinePrefixSymbol(arg_807_1.text_)

				local var_810_22 = 23
				local var_810_23 = utf8.len(var_810_21)
				local var_810_24 = var_810_22 <= 0 and var_810_19 or var_810_19 * (var_810_23 / var_810_22)

				if var_810_24 > 0 and var_810_19 < var_810_24 then
					arg_807_1.talkMaxDuration = var_810_24

					if var_810_24 + var_810_18 > arg_807_1.duration_ then
						arg_807_1.duration_ = var_810_24 + var_810_18
					end
				end

				arg_807_1.text_.text = var_810_21
				arg_807_1.typewritter.percent = 0

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(false)
				arg_807_1:RecordContent(arg_807_1.text_.text)
			end

			local var_810_25 = math.max(var_810_19, arg_807_1.talkMaxDuration)

			if var_810_18 <= arg_807_1.time_ and arg_807_1.time_ < var_810_18 + var_810_25 then
				arg_807_1.typewritter.percent = (arg_807_1.time_ - var_810_18) / var_810_25

				arg_807_1.typewritter:SetDirty()
			end

			if arg_807_1.time_ >= var_810_18 + var_810_25 and arg_807_1.time_ < var_810_18 + var_810_25 + arg_810_0 then
				arg_807_1.typewritter.percent = 1

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J05f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST29",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0203"
	},
	voices = {
		"story_v_out_120411.awb"
	}
}
