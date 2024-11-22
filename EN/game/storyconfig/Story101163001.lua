return {
	Play116301001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116301001
		arg_1_1.duration_ = 15

		local var_1_0 = {
			zh = 15,
			ja = 9.266
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
				arg_1_0:Play116301002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "B13c"

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
				local var_4_5 = arg_1_1.bgs_.B13c

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
					if iter_4_0 ~= "B13c" then
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
			local var_4_23 = 0.15

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.266666666666667
			local var_4_27 = 0.733333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			local var_4_30 = "10024ui_story"

			if arg_1_1.actors_[var_4_30] == nil then
				local var_4_31 = Object.Instantiate(Asset.Load("Char/" .. var_4_30), arg_1_1.stage_.transform)

				var_4_31.name = var_4_30
				var_4_31.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_30] = var_4_31

				local var_4_32 = var_4_31:GetComponentInChildren(typeof(CharacterEffect))

				var_4_32.enabled = true

				local var_4_33 = GameObjectTools.GetOrAddComponent(var_4_31, typeof(DynamicBoneHelper))

				if var_4_33 then
					var_4_33:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_32.transform, false)

				arg_1_1.var_[var_4_30 .. "Animator"] = var_4_32.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_30 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_30 .. "LipSync"] = var_4_32.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_34 = arg_1_1.actors_["10024ui_story"].transform
			local var_4_35 = 2

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				arg_1_1.var_.moveOldPos10024ui_story = var_4_34.localPosition
			end

			local var_4_36 = 0.001

			if var_4_35 <= arg_1_1.time_ and arg_1_1.time_ < var_4_35 + var_4_36 then
				local var_4_37 = (arg_1_1.time_ - var_4_35) / var_4_36
				local var_4_38 = Vector3.New(0, -1, -6)

				var_4_34.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10024ui_story, var_4_38, var_4_37)

				local var_4_39 = manager.ui.mainCamera.transform.position - var_4_34.position

				var_4_34.forward = Vector3.New(var_4_39.x, var_4_39.y, var_4_39.z)

				local var_4_40 = var_4_34.localEulerAngles

				var_4_40.z = 0
				var_4_40.x = 0
				var_4_34.localEulerAngles = var_4_40
			end

			if arg_1_1.time_ >= var_4_35 + var_4_36 and arg_1_1.time_ < var_4_35 + var_4_36 + arg_4_0 then
				var_4_34.localPosition = Vector3.New(0, -1, -6)

				local var_4_41 = manager.ui.mainCamera.transform.position - var_4_34.position

				var_4_34.forward = Vector3.New(var_4_41.x, var_4_41.y, var_4_41.z)

				local var_4_42 = var_4_34.localEulerAngles

				var_4_42.z = 0
				var_4_42.x = 0
				var_4_34.localEulerAngles = var_4_42
			end

			local var_4_43 = 2

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_4_44 = 2

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_4_45 = arg_1_1.actors_["10024ui_story"]
			local var_4_46 = 2

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 and arg_1_1.var_.characterEffect10024ui_story == nil then
				arg_1_1.var_.characterEffect10024ui_story = var_4_45:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_47 = 0.2

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				local var_4_48 = (arg_1_1.time_ - var_4_46) / var_4_47

				if arg_1_1.var_.characterEffect10024ui_story then
					arg_1_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 and arg_1_1.var_.characterEffect10024ui_story then
				arg_1_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_4_49 = 2
			local var_4_50 = 1.125

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_51 = arg_1_1:FormatText(StoryNameCfg[332].name)

				arg_1_1.leftNameTxt_.text = var_4_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_52 = arg_1_1:GetWordFromCfg(116301001)
				local var_4_53 = arg_1_1:FormatText(var_4_52.content)

				arg_1_1.text_.text = var_4_53

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_54 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301001", "story_v_out_116301.awb") ~= 0 then
					local var_4_57 = manager.audio:GetVoiceLength("story_v_out_116301", "116301001", "story_v_out_116301.awb") / 1000

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end

					if var_4_52.prefab_name ~= "" and arg_1_1.actors_[var_4_52.prefab_name] ~= nil then
						local var_4_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_52.prefab_name].transform, "story_v_out_116301", "116301001", "story_v_out_116301.awb")

						arg_1_1:RecordAudio("116301001", var_4_58)
						arg_1_1:RecordAudio("116301001", var_4_58)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116301", "116301001", "story_v_out_116301.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116301", "116301001", "story_v_out_116301.awb")
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
	Play116301002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 116301002
		arg_5_1.duration_ = 11.466

		local var_5_0 = {
			zh = 10.033,
			ja = 11.466
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
				arg_5_0:Play116301003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_8_1 = 0

			if var_8_1 < arg_5_1.time_ and arg_5_1.time_ <= var_8_1 + arg_8_0 then
				arg_5_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_1")
			end

			local var_8_2 = 0
			local var_8_3 = 0.975

			if var_8_2 < arg_5_1.time_ and arg_5_1.time_ <= var_8_2 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, true)

				local var_8_4 = arg_5_1:FormatText(StoryNameCfg[332].name)

				arg_5_1.leftNameTxt_.text = var_8_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_1.leftNameTxt_.transform)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1.leftNameTxt_.text)
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_5 = arg_5_1:GetWordFromCfg(116301002)
				local var_8_6 = arg_5_1:FormatText(var_8_5.content)

				arg_5_1.text_.text = var_8_6

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_7 = 39
				local var_8_8 = utf8.len(var_8_6)
				local var_8_9 = var_8_7 <= 0 and var_8_3 or var_8_3 * (var_8_8 / var_8_7)

				if var_8_9 > 0 and var_8_3 < var_8_9 then
					arg_5_1.talkMaxDuration = var_8_9

					if var_8_9 + var_8_2 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_9 + var_8_2
					end
				end

				arg_5_1.text_.text = var_8_6
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301002", "story_v_out_116301.awb") ~= 0 then
					local var_8_10 = manager.audio:GetVoiceLength("story_v_out_116301", "116301002", "story_v_out_116301.awb") / 1000

					if var_8_10 + var_8_2 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_10 + var_8_2
					end

					if var_8_5.prefab_name ~= "" and arg_5_1.actors_[var_8_5.prefab_name] ~= nil then
						local var_8_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_5_1.actors_[var_8_5.prefab_name].transform, "story_v_out_116301", "116301002", "story_v_out_116301.awb")

						arg_5_1:RecordAudio("116301002", var_8_11)
						arg_5_1:RecordAudio("116301002", var_8_11)
					else
						arg_5_1:AudioAction("play", "voice", "story_v_out_116301", "116301002", "story_v_out_116301.awb")
					end

					arg_5_1:RecordHistoryTalkVoice("story_v_out_116301", "116301002", "story_v_out_116301.awb")
				end

				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_12 = math.max(var_8_3, arg_5_1.talkMaxDuration)

			if var_8_2 <= arg_5_1.time_ and arg_5_1.time_ < var_8_2 + var_8_12 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_2) / var_8_12

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_2 + var_8_12 and arg_5_1.time_ < var_8_2 + var_8_12 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play116301003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 116301003
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play116301004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = arg_9_1.actors_["10024ui_story"]
			local var_12_1 = 0

			if var_12_1 < arg_9_1.time_ and arg_9_1.time_ <= var_12_1 + arg_12_0 and arg_9_1.var_.characterEffect10024ui_story == nil then
				arg_9_1.var_.characterEffect10024ui_story = var_12_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_2 = 0.2

			if var_12_1 <= arg_9_1.time_ and arg_9_1.time_ < var_12_1 + var_12_2 then
				local var_12_3 = (arg_9_1.time_ - var_12_1) / var_12_2

				if arg_9_1.var_.characterEffect10024ui_story then
					local var_12_4 = Mathf.Lerp(0, 0.5, var_12_3)

					arg_9_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_9_1.var_.characterEffect10024ui_story.fillRatio = var_12_4
				end
			end

			if arg_9_1.time_ >= var_12_1 + var_12_2 and arg_9_1.time_ < var_12_1 + var_12_2 + arg_12_0 and arg_9_1.var_.characterEffect10024ui_story then
				local var_12_5 = 0.5

				arg_9_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_9_1.var_.characterEffect10024ui_story.fillRatio = var_12_5
			end

			local var_12_6 = 0
			local var_12_7 = 0.95

			if var_12_6 < arg_9_1.time_ and arg_9_1.time_ <= var_12_6 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_8 = arg_9_1:FormatText(StoryNameCfg[7].name)

				arg_9_1.leftNameTxt_.text = var_12_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_9 = arg_9_1:GetWordFromCfg(116301003)
				local var_12_10 = arg_9_1:FormatText(var_12_9.content)

				arg_9_1.text_.text = var_12_10

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_11 = 38
				local var_12_12 = utf8.len(var_12_10)
				local var_12_13 = var_12_11 <= 0 and var_12_7 or var_12_7 * (var_12_12 / var_12_11)

				if var_12_13 > 0 and var_12_7 < var_12_13 then
					arg_9_1.talkMaxDuration = var_12_13

					if var_12_13 + var_12_6 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_13 + var_12_6
					end
				end

				arg_9_1.text_.text = var_12_10
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_14 = math.max(var_12_7, arg_9_1.talkMaxDuration)

			if var_12_6 <= arg_9_1.time_ and arg_9_1.time_ < var_12_6 + var_12_14 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_6) / var_12_14

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_6 + var_12_14 and arg_9_1.time_ < var_12_6 + var_12_14 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play116301004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 116301004
		arg_13_1.duration_ = 5.966

		local var_13_0 = {
			zh = 4.6,
			ja = 5.966
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play116301005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["10024ui_story"]
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 and arg_13_1.var_.characterEffect10024ui_story == nil then
				arg_13_1.var_.characterEffect10024ui_story = var_16_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_2 = 0.2

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2

				if arg_13_1.var_.characterEffect10024ui_story then
					arg_13_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 and arg_13_1.var_.characterEffect10024ui_story then
				arg_13_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_16_4 = 0

			if var_16_4 < arg_13_1.time_ and arg_13_1.time_ <= var_16_4 + arg_16_0 then
				arg_13_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_16_5 = 0
			local var_16_6 = 0.475

			if var_16_5 < arg_13_1.time_ and arg_13_1.time_ <= var_16_5 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_7 = arg_13_1:FormatText(StoryNameCfg[332].name)

				arg_13_1.leftNameTxt_.text = var_16_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_8 = arg_13_1:GetWordFromCfg(116301004)
				local var_16_9 = arg_13_1:FormatText(var_16_8.content)

				arg_13_1.text_.text = var_16_9

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_10 = 19
				local var_16_11 = utf8.len(var_16_9)
				local var_16_12 = var_16_10 <= 0 and var_16_6 or var_16_6 * (var_16_11 / var_16_10)

				if var_16_12 > 0 and var_16_6 < var_16_12 then
					arg_13_1.talkMaxDuration = var_16_12

					if var_16_12 + var_16_5 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_12 + var_16_5
					end
				end

				arg_13_1.text_.text = var_16_9
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301004", "story_v_out_116301.awb") ~= 0 then
					local var_16_13 = manager.audio:GetVoiceLength("story_v_out_116301", "116301004", "story_v_out_116301.awb") / 1000

					if var_16_13 + var_16_5 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_13 + var_16_5
					end

					if var_16_8.prefab_name ~= "" and arg_13_1.actors_[var_16_8.prefab_name] ~= nil then
						local var_16_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_8.prefab_name].transform, "story_v_out_116301", "116301004", "story_v_out_116301.awb")

						arg_13_1:RecordAudio("116301004", var_16_14)
						arg_13_1:RecordAudio("116301004", var_16_14)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_116301", "116301004", "story_v_out_116301.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_116301", "116301004", "story_v_out_116301.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_15 = math.max(var_16_6, arg_13_1.talkMaxDuration)

			if var_16_5 <= arg_13_1.time_ and arg_13_1.time_ < var_16_5 + var_16_15 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_5) / var_16_15

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_5 + var_16_15 and arg_13_1.time_ < var_16_5 + var_16_15 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play116301005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 116301005
		arg_17_1.duration_ = 6.066

		local var_17_0 = {
			zh = 6.066,
			ja = 3.666
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play116301006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024actionlink/10024action462")
			end

			local var_20_2 = 0
			local var_20_3 = 0.65

			if var_20_2 < arg_17_1.time_ and arg_17_1.time_ <= var_20_2 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_4 = arg_17_1:FormatText(StoryNameCfg[332].name)

				arg_17_1.leftNameTxt_.text = var_20_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_5 = arg_17_1:GetWordFromCfg(116301005)
				local var_20_6 = arg_17_1:FormatText(var_20_5.content)

				arg_17_1.text_.text = var_20_6

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_7 = 26
				local var_20_8 = utf8.len(var_20_6)
				local var_20_9 = var_20_7 <= 0 and var_20_3 or var_20_3 * (var_20_8 / var_20_7)

				if var_20_9 > 0 and var_20_3 < var_20_9 then
					arg_17_1.talkMaxDuration = var_20_9

					if var_20_9 + var_20_2 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_9 + var_20_2
					end
				end

				arg_17_1.text_.text = var_20_6
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301005", "story_v_out_116301.awb") ~= 0 then
					local var_20_10 = manager.audio:GetVoiceLength("story_v_out_116301", "116301005", "story_v_out_116301.awb") / 1000

					if var_20_10 + var_20_2 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_10 + var_20_2
					end

					if var_20_5.prefab_name ~= "" and arg_17_1.actors_[var_20_5.prefab_name] ~= nil then
						local var_20_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_5.prefab_name].transform, "story_v_out_116301", "116301005", "story_v_out_116301.awb")

						arg_17_1:RecordAudio("116301005", var_20_11)
						arg_17_1:RecordAudio("116301005", var_20_11)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_116301", "116301005", "story_v_out_116301.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_116301", "116301005", "story_v_out_116301.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_12 = math.max(var_20_3, arg_17_1.talkMaxDuration)

			if var_20_2 <= arg_17_1.time_ and arg_17_1.time_ < var_20_2 + var_20_12 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_2) / var_20_12

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_2 + var_20_12 and arg_17_1.time_ < var_20_2 + var_20_12 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play116301006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 116301006
		arg_21_1.duration_ = 14.2

		local var_21_0 = {
			zh = 14.2,
			ja = 12.733
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
				arg_21_0:Play116301007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_24_1 = 0
			local var_24_2 = 1.5

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_3 = arg_21_1:FormatText(StoryNameCfg[332].name)

				arg_21_1.leftNameTxt_.text = var_24_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_4 = arg_21_1:GetWordFromCfg(116301006)
				local var_24_5 = arg_21_1:FormatText(var_24_4.content)

				arg_21_1.text_.text = var_24_5

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_6 = 60
				local var_24_7 = utf8.len(var_24_5)
				local var_24_8 = var_24_6 <= 0 and var_24_2 or var_24_2 * (var_24_7 / var_24_6)

				if var_24_8 > 0 and var_24_2 < var_24_8 then
					arg_21_1.talkMaxDuration = var_24_8

					if var_24_8 + var_24_1 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_8 + var_24_1
					end
				end

				arg_21_1.text_.text = var_24_5
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301006", "story_v_out_116301.awb") ~= 0 then
					local var_24_9 = manager.audio:GetVoiceLength("story_v_out_116301", "116301006", "story_v_out_116301.awb") / 1000

					if var_24_9 + var_24_1 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_9 + var_24_1
					end

					if var_24_4.prefab_name ~= "" and arg_21_1.actors_[var_24_4.prefab_name] ~= nil then
						local var_24_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_4.prefab_name].transform, "story_v_out_116301", "116301006", "story_v_out_116301.awb")

						arg_21_1:RecordAudio("116301006", var_24_10)
						arg_21_1:RecordAudio("116301006", var_24_10)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_116301", "116301006", "story_v_out_116301.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_116301", "116301006", "story_v_out_116301.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_11 = math.max(var_24_2, arg_21_1.talkMaxDuration)

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_11 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_1) / var_24_11

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_1 + var_24_11 and arg_21_1.time_ < var_24_1 + var_24_11 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play116301007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 116301007
		arg_25_1.duration_ = 9.366

		local var_25_0 = {
			zh = 8.8,
			ja = 9.366
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
				arg_25_0:Play116301008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action2_2")
			end

			local var_28_2 = 0
			local var_28_3 = 0.875

			if var_28_2 < arg_25_1.time_ and arg_25_1.time_ <= var_28_2 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_4 = arg_25_1:FormatText(StoryNameCfg[332].name)

				arg_25_1.leftNameTxt_.text = var_28_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_5 = arg_25_1:GetWordFromCfg(116301007)
				local var_28_6 = arg_25_1:FormatText(var_28_5.content)

				arg_25_1.text_.text = var_28_6

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_7 = 35
				local var_28_8 = utf8.len(var_28_6)
				local var_28_9 = var_28_7 <= 0 and var_28_3 or var_28_3 * (var_28_8 / var_28_7)

				if var_28_9 > 0 and var_28_3 < var_28_9 then
					arg_25_1.talkMaxDuration = var_28_9

					if var_28_9 + var_28_2 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_9 + var_28_2
					end
				end

				arg_25_1.text_.text = var_28_6
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301007", "story_v_out_116301.awb") ~= 0 then
					local var_28_10 = manager.audio:GetVoiceLength("story_v_out_116301", "116301007", "story_v_out_116301.awb") / 1000

					if var_28_10 + var_28_2 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_10 + var_28_2
					end

					if var_28_5.prefab_name ~= "" and arg_25_1.actors_[var_28_5.prefab_name] ~= nil then
						local var_28_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_5.prefab_name].transform, "story_v_out_116301", "116301007", "story_v_out_116301.awb")

						arg_25_1:RecordAudio("116301007", var_28_11)
						arg_25_1:RecordAudio("116301007", var_28_11)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_116301", "116301007", "story_v_out_116301.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_116301", "116301007", "story_v_out_116301.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_12 = math.max(var_28_3, arg_25_1.talkMaxDuration)

			if var_28_2 <= arg_25_1.time_ and arg_25_1.time_ < var_28_2 + var_28_12 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_2) / var_28_12

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_2 + var_28_12 and arg_25_1.time_ < var_28_2 + var_28_12 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play116301008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 116301008
		arg_29_1.duration_ = 15.633

		local var_29_0 = {
			zh = 14,
			ja = 15.633
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
				arg_29_0:Play116301009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_32_1 = 0
			local var_32_2 = 1.325

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_3 = arg_29_1:FormatText(StoryNameCfg[332].name)

				arg_29_1.leftNameTxt_.text = var_32_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_4 = arg_29_1:GetWordFromCfg(116301008)
				local var_32_5 = arg_29_1:FormatText(var_32_4.content)

				arg_29_1.text_.text = var_32_5

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_6 = 53
				local var_32_7 = utf8.len(var_32_5)
				local var_32_8 = var_32_6 <= 0 and var_32_2 or var_32_2 * (var_32_7 / var_32_6)

				if var_32_8 > 0 and var_32_2 < var_32_8 then
					arg_29_1.talkMaxDuration = var_32_8

					if var_32_8 + var_32_1 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_1
					end
				end

				arg_29_1.text_.text = var_32_5
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301008", "story_v_out_116301.awb") ~= 0 then
					local var_32_9 = manager.audio:GetVoiceLength("story_v_out_116301", "116301008", "story_v_out_116301.awb") / 1000

					if var_32_9 + var_32_1 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_9 + var_32_1
					end

					if var_32_4.prefab_name ~= "" and arg_29_1.actors_[var_32_4.prefab_name] ~= nil then
						local var_32_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_4.prefab_name].transform, "story_v_out_116301", "116301008", "story_v_out_116301.awb")

						arg_29_1:RecordAudio("116301008", var_32_10)
						arg_29_1:RecordAudio("116301008", var_32_10)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_116301", "116301008", "story_v_out_116301.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_116301", "116301008", "story_v_out_116301.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_11 = math.max(var_32_2, arg_29_1.talkMaxDuration)

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_11 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_1) / var_32_11

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_1 + var_32_11 and arg_29_1.time_ < var_32_1 + var_32_11 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play116301009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 116301009
		arg_33_1.duration_ = 6.366

		local var_33_0 = {
			zh = 6.366,
			ja = 6.333
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
				arg_33_0:Play116301010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["10024ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect10024ui_story == nil then
				arg_33_1.var_.characterEffect10024ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.2

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect10024ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_33_1.var_.characterEffect10024ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect10024ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_33_1.var_.characterEffect10024ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.65

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[6].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(116301009)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 26
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301009", "story_v_out_116301.awb") ~= 0 then
					local var_36_14 = manager.audio:GetVoiceLength("story_v_out_116301", "116301009", "story_v_out_116301.awb") / 1000

					if var_36_14 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_14 + var_36_6
					end

					if var_36_9.prefab_name ~= "" and arg_33_1.actors_[var_36_9.prefab_name] ~= nil then
						local var_36_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_9.prefab_name].transform, "story_v_out_116301", "116301009", "story_v_out_116301.awb")

						arg_33_1:RecordAudio("116301009", var_36_15)
						arg_33_1:RecordAudio("116301009", var_36_15)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_116301", "116301009", "story_v_out_116301.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_116301", "116301009", "story_v_out_116301.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_16 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_16 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_16

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_16 and arg_33_1.time_ < var_36_6 + var_36_16 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play116301010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 116301010
		arg_37_1.duration_ = 5.866

		local var_37_0 = {
			zh = 5.866,
			ja = 5.7
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
				arg_37_0:Play116301011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.75

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[6].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, true)
				arg_37_1.iconController_:SetSelectedState("hero")

				arg_37_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(116301010)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 30
				local var_40_6 = utf8.len(var_40_4)
				local var_40_7 = var_40_5 <= 0 and var_40_1 or var_40_1 * (var_40_6 / var_40_5)

				if var_40_7 > 0 and var_40_1 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_4
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301010", "story_v_out_116301.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_116301", "116301010", "story_v_out_116301.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_116301", "116301010", "story_v_out_116301.awb")

						arg_37_1:RecordAudio("116301010", var_40_9)
						arg_37_1:RecordAudio("116301010", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_116301", "116301010", "story_v_out_116301.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_116301", "116301010", "story_v_out_116301.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_10 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_10 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_10

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_10 and arg_37_1.time_ < var_40_0 + var_40_10 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play116301011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 116301011
		arg_41_1.duration_ = 13.1

		local var_41_0 = {
			zh = 7.333,
			ja = 13.1
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
				arg_41_0:Play116301012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10024ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect10024ui_story == nil then
				arg_41_1.var_.characterEffect10024ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect10024ui_story then
					arg_41_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect10024ui_story then
				arg_41_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_44_4 = 0

			if var_44_4 < arg_41_1.time_ and arg_41_1.time_ <= var_44_4 + arg_44_0 then
				arg_41_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_44_5 = 0

			if var_44_5 < arg_41_1.time_ and arg_41_1.time_ <= var_44_5 + arg_44_0 then
				arg_41_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_1")
			end

			local var_44_6 = 0
			local var_44_7 = 0.8

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_8 = arg_41_1:FormatText(StoryNameCfg[332].name)

				arg_41_1.leftNameTxt_.text = var_44_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_9 = arg_41_1:GetWordFromCfg(116301011)
				local var_44_10 = arg_41_1:FormatText(var_44_9.content)

				arg_41_1.text_.text = var_44_10

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_11 = 32
				local var_44_12 = utf8.len(var_44_10)
				local var_44_13 = var_44_11 <= 0 and var_44_7 or var_44_7 * (var_44_12 / var_44_11)

				if var_44_13 > 0 and var_44_7 < var_44_13 then
					arg_41_1.talkMaxDuration = var_44_13

					if var_44_13 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_13 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_10
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301011", "story_v_out_116301.awb") ~= 0 then
					local var_44_14 = manager.audio:GetVoiceLength("story_v_out_116301", "116301011", "story_v_out_116301.awb") / 1000

					if var_44_14 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_14 + var_44_6
					end

					if var_44_9.prefab_name ~= "" and arg_41_1.actors_[var_44_9.prefab_name] ~= nil then
						local var_44_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_9.prefab_name].transform, "story_v_out_116301", "116301011", "story_v_out_116301.awb")

						arg_41_1:RecordAudio("116301011", var_44_15)
						arg_41_1:RecordAudio("116301011", var_44_15)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_116301", "116301011", "story_v_out_116301.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_116301", "116301011", "story_v_out_116301.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_16 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_16 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_16

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_16 and arg_41_1.time_ < var_44_6 + var_44_16 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play116301012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 116301012
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play116301013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10024ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos10024ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, 100, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10024ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, 100, 0)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = 0
			local var_48_10 = 0.6

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_11 = arg_45_1:GetWordFromCfg(116301012)
				local var_48_12 = arg_45_1:FormatText(var_48_11.content)

				arg_45_1.text_.text = var_48_12

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_13 = 24
				local var_48_14 = utf8.len(var_48_12)
				local var_48_15 = var_48_13 <= 0 and var_48_10 or var_48_10 * (var_48_14 / var_48_13)

				if var_48_15 > 0 and var_48_10 < var_48_15 then
					arg_45_1.talkMaxDuration = var_48_15

					if var_48_15 + var_48_9 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_15 + var_48_9
					end
				end

				arg_45_1.text_.text = var_48_12
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_16 = math.max(var_48_10, arg_45_1.talkMaxDuration)

			if var_48_9 <= arg_45_1.time_ and arg_45_1.time_ < var_48_9 + var_48_16 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_9) / var_48_16

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_9 + var_48_16 and arg_45_1.time_ < var_48_9 + var_48_16 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play116301013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 116301013
		arg_49_1.duration_ = 9.333

		local var_49_0 = {
			zh = 9.333,
			ja = 6.8
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
				arg_49_0:Play116301014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10024ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect10024ui_story == nil then
				arg_49_1.var_.characterEffect10024ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.2

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect10024ui_story then
					arg_49_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect10024ui_story then
				arg_49_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_52_4 = arg_49_1.actors_["10024ui_story"].transform
			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 then
				arg_49_1.var_.moveOldPos10024ui_story = var_52_4.localPosition
			end

			local var_52_6 = 0.001

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6
				local var_52_8 = Vector3.New(0, -1, -6)

				var_52_4.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10024ui_story, var_52_8, var_52_7)

				local var_52_9 = manager.ui.mainCamera.transform.position - var_52_4.position

				var_52_4.forward = Vector3.New(var_52_9.x, var_52_9.y, var_52_9.z)

				local var_52_10 = var_52_4.localEulerAngles

				var_52_10.z = 0
				var_52_10.x = 0
				var_52_4.localEulerAngles = var_52_10
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 then
				var_52_4.localPosition = Vector3.New(0, -1, -6)

				local var_52_11 = manager.ui.mainCamera.transform.position - var_52_4.position

				var_52_4.forward = Vector3.New(var_52_11.x, var_52_11.y, var_52_11.z)

				local var_52_12 = var_52_4.localEulerAngles

				var_52_12.z = 0
				var_52_12.x = 0
				var_52_4.localEulerAngles = var_52_12
			end

			local var_52_13 = 0

			if var_52_13 < arg_49_1.time_ and arg_49_1.time_ <= var_52_13 + arg_52_0 then
				arg_49_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_52_14 = 0

			if var_52_14 < arg_49_1.time_ and arg_49_1.time_ <= var_52_14 + arg_52_0 then
				arg_49_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_52_15 = 0
			local var_52_16 = 1

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_17 = arg_49_1:FormatText(StoryNameCfg[332].name)

				arg_49_1.leftNameTxt_.text = var_52_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_18 = arg_49_1:GetWordFromCfg(116301013)
				local var_52_19 = arg_49_1:FormatText(var_52_18.content)

				arg_49_1.text_.text = var_52_19

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_20 = 40
				local var_52_21 = utf8.len(var_52_19)
				local var_52_22 = var_52_20 <= 0 and var_52_16 or var_52_16 * (var_52_21 / var_52_20)

				if var_52_22 > 0 and var_52_16 < var_52_22 then
					arg_49_1.talkMaxDuration = var_52_22

					if var_52_22 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_22 + var_52_15
					end
				end

				arg_49_1.text_.text = var_52_19
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301013", "story_v_out_116301.awb") ~= 0 then
					local var_52_23 = manager.audio:GetVoiceLength("story_v_out_116301", "116301013", "story_v_out_116301.awb") / 1000

					if var_52_23 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_23 + var_52_15
					end

					if var_52_18.prefab_name ~= "" and arg_49_1.actors_[var_52_18.prefab_name] ~= nil then
						local var_52_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_18.prefab_name].transform, "story_v_out_116301", "116301013", "story_v_out_116301.awb")

						arg_49_1:RecordAudio("116301013", var_52_24)
						arg_49_1:RecordAudio("116301013", var_52_24)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_116301", "116301013", "story_v_out_116301.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_116301", "116301013", "story_v_out_116301.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_25 = math.max(var_52_16, arg_49_1.talkMaxDuration)

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_25 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_15) / var_52_25

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_15 + var_52_25 and arg_49_1.time_ < var_52_15 + var_52_25 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play116301014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 116301014
		arg_53_1.duration_ = 6.7

		local var_53_0 = {
			zh = 6.7,
			ja = 6.066
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
				arg_53_0:Play116301015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_56_1 = 0
			local var_56_2 = 0.675

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_3 = arg_53_1:FormatText(StoryNameCfg[332].name)

				arg_53_1.leftNameTxt_.text = var_56_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_4 = arg_53_1:GetWordFromCfg(116301014)
				local var_56_5 = arg_53_1:FormatText(var_56_4.content)

				arg_53_1.text_.text = var_56_5

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_6 = 27
				local var_56_7 = utf8.len(var_56_5)
				local var_56_8 = var_56_6 <= 0 and var_56_2 or var_56_2 * (var_56_7 / var_56_6)

				if var_56_8 > 0 and var_56_2 < var_56_8 then
					arg_53_1.talkMaxDuration = var_56_8

					if var_56_8 + var_56_1 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_1
					end
				end

				arg_53_1.text_.text = var_56_5
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301014", "story_v_out_116301.awb") ~= 0 then
					local var_56_9 = manager.audio:GetVoiceLength("story_v_out_116301", "116301014", "story_v_out_116301.awb") / 1000

					if var_56_9 + var_56_1 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_9 + var_56_1
					end

					if var_56_4.prefab_name ~= "" and arg_53_1.actors_[var_56_4.prefab_name] ~= nil then
						local var_56_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_4.prefab_name].transform, "story_v_out_116301", "116301014", "story_v_out_116301.awb")

						arg_53_1:RecordAudio("116301014", var_56_10)
						arg_53_1:RecordAudio("116301014", var_56_10)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_116301", "116301014", "story_v_out_116301.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_116301", "116301014", "story_v_out_116301.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_11 = math.max(var_56_2, arg_53_1.talkMaxDuration)

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_11 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_1) / var_56_11

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_1 + var_56_11 and arg_53_1.time_ < var_56_1 + var_56_11 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play116301015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 116301015
		arg_57_1.duration_ = 13.366

		local var_57_0 = {
			zh = 6,
			ja = 13.366
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
				arg_57_0:Play116301016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10024ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10024ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(-0.7, -1, -6)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10024ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(-0.7, -1, -6)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = "10025ui_story"

			if arg_57_1.actors_[var_60_9] == nil then
				local var_60_10 = Object.Instantiate(Asset.Load("Char/" .. var_60_9), arg_57_1.stage_.transform)

				var_60_10.name = var_60_9
				var_60_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.actors_[var_60_9] = var_60_10

				local var_60_11 = var_60_10:GetComponentInChildren(typeof(CharacterEffect))

				var_60_11.enabled = true

				local var_60_12 = GameObjectTools.GetOrAddComponent(var_60_10, typeof(DynamicBoneHelper))

				if var_60_12 then
					var_60_12:EnableDynamicBone(false)
				end

				arg_57_1:ShowWeapon(var_60_11.transform, false)

				arg_57_1.var_[var_60_9 .. "Animator"] = var_60_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_57_1.var_[var_60_9 .. "Animator"].applyRootMotion = true
				arg_57_1.var_[var_60_9 .. "LipSync"] = var_60_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_60_13 = arg_57_1.actors_["10025ui_story"].transform
			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				arg_57_1.var_.moveOldPos10025ui_story = var_60_13.localPosition
			end

			local var_60_15 = 0.001

			if var_60_14 <= arg_57_1.time_ and arg_57_1.time_ < var_60_14 + var_60_15 then
				local var_60_16 = (arg_57_1.time_ - var_60_14) / var_60_15
				local var_60_17 = Vector3.New(0.7, -1.1, -5.9)

				var_60_13.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10025ui_story, var_60_17, var_60_16)

				local var_60_18 = manager.ui.mainCamera.transform.position - var_60_13.position

				var_60_13.forward = Vector3.New(var_60_18.x, var_60_18.y, var_60_18.z)

				local var_60_19 = var_60_13.localEulerAngles

				var_60_19.z = 0
				var_60_19.x = 0
				var_60_13.localEulerAngles = var_60_19
			end

			if arg_57_1.time_ >= var_60_14 + var_60_15 and arg_57_1.time_ < var_60_14 + var_60_15 + arg_60_0 then
				var_60_13.localPosition = Vector3.New(0.7, -1.1, -5.9)

				local var_60_20 = manager.ui.mainCamera.transform.position - var_60_13.position

				var_60_13.forward = Vector3.New(var_60_20.x, var_60_20.y, var_60_20.z)

				local var_60_21 = var_60_13.localEulerAngles

				var_60_21.z = 0
				var_60_21.x = 0
				var_60_13.localEulerAngles = var_60_21
			end

			local var_60_22 = arg_57_1.actors_["10024ui_story"]
			local var_60_23 = 0

			if var_60_23 < arg_57_1.time_ and arg_57_1.time_ <= var_60_23 + arg_60_0 and arg_57_1.var_.characterEffect10024ui_story == nil then
				arg_57_1.var_.characterEffect10024ui_story = var_60_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_24 = 0.2

			if var_60_23 <= arg_57_1.time_ and arg_57_1.time_ < var_60_23 + var_60_24 then
				local var_60_25 = (arg_57_1.time_ - var_60_23) / var_60_24

				if arg_57_1.var_.characterEffect10024ui_story then
					local var_60_26 = Mathf.Lerp(0, 0.5, var_60_25)

					arg_57_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_57_1.var_.characterEffect10024ui_story.fillRatio = var_60_26
				end
			end

			if arg_57_1.time_ >= var_60_23 + var_60_24 and arg_57_1.time_ < var_60_23 + var_60_24 + arg_60_0 and arg_57_1.var_.characterEffect10024ui_story then
				local var_60_27 = 0.5

				arg_57_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_57_1.var_.characterEffect10024ui_story.fillRatio = var_60_27
			end

			local var_60_28 = arg_57_1.actors_["10025ui_story"]
			local var_60_29 = 0

			if var_60_29 < arg_57_1.time_ and arg_57_1.time_ <= var_60_29 + arg_60_0 and arg_57_1.var_.characterEffect10025ui_story == nil then
				arg_57_1.var_.characterEffect10025ui_story = var_60_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_30 = 0.2

			if var_60_29 <= arg_57_1.time_ and arg_57_1.time_ < var_60_29 + var_60_30 then
				local var_60_31 = (arg_57_1.time_ - var_60_29) / var_60_30

				if arg_57_1.var_.characterEffect10025ui_story then
					arg_57_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_29 + var_60_30 and arg_57_1.time_ < var_60_29 + var_60_30 + arg_60_0 and arg_57_1.var_.characterEffect10025ui_story then
				arg_57_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_60_32 = 0

			if var_60_32 < arg_57_1.time_ and arg_57_1.time_ <= var_60_32 + arg_60_0 then
				arg_57_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action7_1")
			end

			local var_60_33 = 0

			if var_60_33 < arg_57_1.time_ and arg_57_1.time_ <= var_60_33 + arg_60_0 then
				arg_57_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_60_34 = 0
			local var_60_35 = 0.575

			if var_60_34 < arg_57_1.time_ and arg_57_1.time_ <= var_60_34 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_36 = arg_57_1:FormatText(StoryNameCfg[328].name)

				arg_57_1.leftNameTxt_.text = var_60_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_37 = arg_57_1:GetWordFromCfg(116301015)
				local var_60_38 = arg_57_1:FormatText(var_60_37.content)

				arg_57_1.text_.text = var_60_38

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_39 = 23
				local var_60_40 = utf8.len(var_60_38)
				local var_60_41 = var_60_39 <= 0 and var_60_35 or var_60_35 * (var_60_40 / var_60_39)

				if var_60_41 > 0 and var_60_35 < var_60_41 then
					arg_57_1.talkMaxDuration = var_60_41

					if var_60_41 + var_60_34 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_41 + var_60_34
					end
				end

				arg_57_1.text_.text = var_60_38
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301015", "story_v_out_116301.awb") ~= 0 then
					local var_60_42 = manager.audio:GetVoiceLength("story_v_out_116301", "116301015", "story_v_out_116301.awb") / 1000

					if var_60_42 + var_60_34 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_42 + var_60_34
					end

					if var_60_37.prefab_name ~= "" and arg_57_1.actors_[var_60_37.prefab_name] ~= nil then
						local var_60_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_37.prefab_name].transform, "story_v_out_116301", "116301015", "story_v_out_116301.awb")

						arg_57_1:RecordAudio("116301015", var_60_43)
						arg_57_1:RecordAudio("116301015", var_60_43)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_116301", "116301015", "story_v_out_116301.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_116301", "116301015", "story_v_out_116301.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_44 = math.max(var_60_35, arg_57_1.talkMaxDuration)

			if var_60_34 <= arg_57_1.time_ and arg_57_1.time_ < var_60_34 + var_60_44 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_34) / var_60_44

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_34 + var_60_44 and arg_57_1.time_ < var_60_34 + var_60_44 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play116301016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 116301016
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play116301017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10025ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect10025ui_story == nil then
				arg_61_1.var_.characterEffect10025ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.2

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect10025ui_story then
					local var_64_4 = Mathf.Lerp(0, 0.5, var_64_3)

					arg_61_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10025ui_story.fillRatio = var_64_4
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect10025ui_story then
				local var_64_5 = 0.5

				arg_61_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10025ui_story.fillRatio = var_64_5
			end

			local var_64_6 = 0
			local var_64_7 = 0.75

			if var_64_6 < arg_61_1.time_ and arg_61_1.time_ <= var_64_6 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_8 = arg_61_1:GetWordFromCfg(116301016)
				local var_64_9 = arg_61_1:FormatText(var_64_8.content)

				arg_61_1.text_.text = var_64_9

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_10 = 30
				local var_64_11 = utf8.len(var_64_9)
				local var_64_12 = var_64_10 <= 0 and var_64_7 or var_64_7 * (var_64_11 / var_64_10)

				if var_64_12 > 0 and var_64_7 < var_64_12 then
					arg_61_1.talkMaxDuration = var_64_12

					if var_64_12 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_12 + var_64_6
					end
				end

				arg_61_1.text_.text = var_64_9
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_13 = math.max(var_64_7, arg_61_1.talkMaxDuration)

			if var_64_6 <= arg_61_1.time_ and arg_61_1.time_ < var_64_6 + var_64_13 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_6) / var_64_13

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_6 + var_64_13 and arg_61_1.time_ < var_64_6 + var_64_13 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play116301017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 116301017
		arg_65_1.duration_ = 12.266

		local var_65_0 = {
			zh = 7.366,
			ja = 12.266
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
				arg_65_0:Play116301018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10024ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect10024ui_story == nil then
				arg_65_1.var_.characterEffect10024ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect10024ui_story then
					arg_65_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect10024ui_story then
				arg_65_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_68_4 = 0

			if var_68_4 < arg_65_1.time_ and arg_65_1.time_ <= var_68_4 + arg_68_0 then
				arg_65_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_68_5 = 0
			local var_68_6 = 0.675

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_7 = arg_65_1:FormatText(StoryNameCfg[332].name)

				arg_65_1.leftNameTxt_.text = var_68_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_8 = arg_65_1:GetWordFromCfg(116301017)
				local var_68_9 = arg_65_1:FormatText(var_68_8.content)

				arg_65_1.text_.text = var_68_9

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_10 = 27
				local var_68_11 = utf8.len(var_68_9)
				local var_68_12 = var_68_10 <= 0 and var_68_6 or var_68_6 * (var_68_11 / var_68_10)

				if var_68_12 > 0 and var_68_6 < var_68_12 then
					arg_65_1.talkMaxDuration = var_68_12

					if var_68_12 + var_68_5 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_12 + var_68_5
					end
				end

				arg_65_1.text_.text = var_68_9
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301017", "story_v_out_116301.awb") ~= 0 then
					local var_68_13 = manager.audio:GetVoiceLength("story_v_out_116301", "116301017", "story_v_out_116301.awb") / 1000

					if var_68_13 + var_68_5 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_13 + var_68_5
					end

					if var_68_8.prefab_name ~= "" and arg_65_1.actors_[var_68_8.prefab_name] ~= nil then
						local var_68_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_8.prefab_name].transform, "story_v_out_116301", "116301017", "story_v_out_116301.awb")

						arg_65_1:RecordAudio("116301017", var_68_14)
						arg_65_1:RecordAudio("116301017", var_68_14)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_116301", "116301017", "story_v_out_116301.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_116301", "116301017", "story_v_out_116301.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_15 = math.max(var_68_6, arg_65_1.talkMaxDuration)

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_15 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_5) / var_68_15

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_5 + var_68_15 and arg_65_1.time_ < var_68_5 + var_68_15 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play116301018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 116301018
		arg_69_1.duration_ = 12.866

		local var_69_0 = {
			zh = 11.966,
			ja = 12.866
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
				arg_69_0:Play116301019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_1")
			end

			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_72_2 = 0
			local var_72_3 = 1.225

			if var_72_2 < arg_69_1.time_ and arg_69_1.time_ <= var_72_2 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_4 = arg_69_1:FormatText(StoryNameCfg[332].name)

				arg_69_1.leftNameTxt_.text = var_72_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_5 = arg_69_1:GetWordFromCfg(116301018)
				local var_72_6 = arg_69_1:FormatText(var_72_5.content)

				arg_69_1.text_.text = var_72_6

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_7 = 49
				local var_72_8 = utf8.len(var_72_6)
				local var_72_9 = var_72_7 <= 0 and var_72_3 or var_72_3 * (var_72_8 / var_72_7)

				if var_72_9 > 0 and var_72_3 < var_72_9 then
					arg_69_1.talkMaxDuration = var_72_9

					if var_72_9 + var_72_2 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_9 + var_72_2
					end
				end

				arg_69_1.text_.text = var_72_6
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301018", "story_v_out_116301.awb") ~= 0 then
					local var_72_10 = manager.audio:GetVoiceLength("story_v_out_116301", "116301018", "story_v_out_116301.awb") / 1000

					if var_72_10 + var_72_2 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_10 + var_72_2
					end

					if var_72_5.prefab_name ~= "" and arg_69_1.actors_[var_72_5.prefab_name] ~= nil then
						local var_72_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_5.prefab_name].transform, "story_v_out_116301", "116301018", "story_v_out_116301.awb")

						arg_69_1:RecordAudio("116301018", var_72_11)
						arg_69_1:RecordAudio("116301018", var_72_11)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_116301", "116301018", "story_v_out_116301.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_116301", "116301018", "story_v_out_116301.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_12 = math.max(var_72_3, arg_69_1.talkMaxDuration)

			if var_72_2 <= arg_69_1.time_ and arg_69_1.time_ < var_72_2 + var_72_12 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_2) / var_72_12

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_2 + var_72_12 and arg_69_1.time_ < var_72_2 + var_72_12 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play116301019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 116301019
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play116301020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10024ui_story"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos10024ui_story = var_76_0.localPosition
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(0, 100, 0)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10024ui_story, var_76_4, var_76_3)

				local var_76_5 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_5.x, var_76_5.y, var_76_5.z)

				local var_76_6 = var_76_0.localEulerAngles

				var_76_6.z = 0
				var_76_6.x = 0
				var_76_0.localEulerAngles = var_76_6
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(0, 100, 0)

				local var_76_7 = manager.ui.mainCamera.transform.position - var_76_0.position

				var_76_0.forward = Vector3.New(var_76_7.x, var_76_7.y, var_76_7.z)

				local var_76_8 = var_76_0.localEulerAngles

				var_76_8.z = 0
				var_76_8.x = 0
				var_76_0.localEulerAngles = var_76_8
			end

			local var_76_9 = arg_73_1.actors_["10025ui_story"].transform
			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1.var_.moveOldPos10025ui_story = var_76_9.localPosition
			end

			local var_76_11 = 0.001

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_11 then
				local var_76_12 = (arg_73_1.time_ - var_76_10) / var_76_11
				local var_76_13 = Vector3.New(0, 100, 0)

				var_76_9.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10025ui_story, var_76_13, var_76_12)

				local var_76_14 = manager.ui.mainCamera.transform.position - var_76_9.position

				var_76_9.forward = Vector3.New(var_76_14.x, var_76_14.y, var_76_14.z)

				local var_76_15 = var_76_9.localEulerAngles

				var_76_15.z = 0
				var_76_15.x = 0
				var_76_9.localEulerAngles = var_76_15
			end

			if arg_73_1.time_ >= var_76_10 + var_76_11 and arg_73_1.time_ < var_76_10 + var_76_11 + arg_76_0 then
				var_76_9.localPosition = Vector3.New(0, 100, 0)

				local var_76_16 = manager.ui.mainCamera.transform.position - var_76_9.position

				var_76_9.forward = Vector3.New(var_76_16.x, var_76_16.y, var_76_16.z)

				local var_76_17 = var_76_9.localEulerAngles

				var_76_17.z = 0
				var_76_17.x = 0
				var_76_9.localEulerAngles = var_76_17
			end

			local var_76_18 = 0
			local var_76_19 = 1.1

			if var_76_18 < arg_73_1.time_ and arg_73_1.time_ <= var_76_18 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_20 = arg_73_1:GetWordFromCfg(116301019)
				local var_76_21 = arg_73_1:FormatText(var_76_20.content)

				arg_73_1.text_.text = var_76_21

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_22 = 44
				local var_76_23 = utf8.len(var_76_21)
				local var_76_24 = var_76_22 <= 0 and var_76_19 or var_76_19 * (var_76_23 / var_76_22)

				if var_76_24 > 0 and var_76_19 < var_76_24 then
					arg_73_1.talkMaxDuration = var_76_24

					if var_76_24 + var_76_18 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_24 + var_76_18
					end
				end

				arg_73_1.text_.text = var_76_21
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_25 = math.max(var_76_19, arg_73_1.talkMaxDuration)

			if var_76_18 <= arg_73_1.time_ and arg_73_1.time_ < var_76_18 + var_76_25 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_18) / var_76_25

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_18 + var_76_25 and arg_73_1.time_ < var_76_18 + var_76_25 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play116301020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 116301020
		arg_77_1.duration_ = 14.833

		local var_77_0 = {
			zh = 14.833,
			ja = 10.833
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
				arg_77_0:Play116301021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10024ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10024ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(-0.7, -1, -6)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10024ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(-0.7, -1, -6)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["10024ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect10024ui_story == nil then
				arg_77_1.var_.characterEffect10024ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.2

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect10024ui_story then
					arg_77_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect10024ui_story then
				arg_77_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_80_15 = 0
			local var_80_16 = 1.275

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_17 = arg_77_1:FormatText(StoryNameCfg[332].name)

				arg_77_1.leftNameTxt_.text = var_80_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_18 = arg_77_1:GetWordFromCfg(116301020)
				local var_80_19 = arg_77_1:FormatText(var_80_18.content)

				arg_77_1.text_.text = var_80_19

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_20 = 51
				local var_80_21 = utf8.len(var_80_19)
				local var_80_22 = var_80_20 <= 0 and var_80_16 or var_80_16 * (var_80_21 / var_80_20)

				if var_80_22 > 0 and var_80_16 < var_80_22 then
					arg_77_1.talkMaxDuration = var_80_22

					if var_80_22 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_22 + var_80_15
					end
				end

				arg_77_1.text_.text = var_80_19
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301020", "story_v_out_116301.awb") ~= 0 then
					local var_80_23 = manager.audio:GetVoiceLength("story_v_out_116301", "116301020", "story_v_out_116301.awb") / 1000

					if var_80_23 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_15
					end

					if var_80_18.prefab_name ~= "" and arg_77_1.actors_[var_80_18.prefab_name] ~= nil then
						local var_80_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_18.prefab_name].transform, "story_v_out_116301", "116301020", "story_v_out_116301.awb")

						arg_77_1:RecordAudio("116301020", var_80_24)
						arg_77_1:RecordAudio("116301020", var_80_24)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_116301", "116301020", "story_v_out_116301.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_116301", "116301020", "story_v_out_116301.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_25 = math.max(var_80_16, arg_77_1.talkMaxDuration)

			if var_80_15 <= arg_77_1.time_ and arg_77_1.time_ < var_80_15 + var_80_25 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_15) / var_80_25

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_15 + var_80_25 and arg_77_1.time_ < var_80_15 + var_80_25 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play116301021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 116301021
		arg_81_1.duration_ = 10.3

		local var_81_0 = {
			zh = 10.3,
			ja = 5.733
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
				arg_81_0:Play116301022(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = "1184ui_story"

			if arg_81_1.actors_[var_84_0] == nil then
				local var_84_1 = Object.Instantiate(Asset.Load("Char/" .. var_84_0), arg_81_1.stage_.transform)

				var_84_1.name = var_84_0
				var_84_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_81_1.actors_[var_84_0] = var_84_1

				local var_84_2 = var_84_1:GetComponentInChildren(typeof(CharacterEffect))

				var_84_2.enabled = true

				local var_84_3 = GameObjectTools.GetOrAddComponent(var_84_1, typeof(DynamicBoneHelper))

				if var_84_3 then
					var_84_3:EnableDynamicBone(false)
				end

				arg_81_1:ShowWeapon(var_84_2.transform, false)

				arg_81_1.var_[var_84_0 .. "Animator"] = var_84_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_81_1.var_[var_84_0 .. "Animator"].applyRootMotion = true
				arg_81_1.var_[var_84_0 .. "LipSync"] = var_84_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_84_4 = arg_81_1.actors_["1184ui_story"].transform
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 then
				arg_81_1.var_.moveOldPos1184ui_story = var_84_4.localPosition
			end

			local var_84_6 = 0.001

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6
				local var_84_8 = Vector3.New(0.7, -0.97, -6)

				var_84_4.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1184ui_story, var_84_8, var_84_7)

				local var_84_9 = manager.ui.mainCamera.transform.position - var_84_4.position

				var_84_4.forward = Vector3.New(var_84_9.x, var_84_9.y, var_84_9.z)

				local var_84_10 = var_84_4.localEulerAngles

				var_84_10.z = 0
				var_84_10.x = 0
				var_84_4.localEulerAngles = var_84_10
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 then
				var_84_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_84_11 = manager.ui.mainCamera.transform.position - var_84_4.position

				var_84_4.forward = Vector3.New(var_84_11.x, var_84_11.y, var_84_11.z)

				local var_84_12 = var_84_4.localEulerAngles

				var_84_12.z = 0
				var_84_12.x = 0
				var_84_4.localEulerAngles = var_84_12
			end

			local var_84_13 = arg_81_1.actors_["1184ui_story"]
			local var_84_14 = 0

			if var_84_14 < arg_81_1.time_ and arg_81_1.time_ <= var_84_14 + arg_84_0 and arg_81_1.var_.characterEffect1184ui_story == nil then
				arg_81_1.var_.characterEffect1184ui_story = var_84_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_15 = 0.2

			if var_84_14 <= arg_81_1.time_ and arg_81_1.time_ < var_84_14 + var_84_15 then
				local var_84_16 = (arg_81_1.time_ - var_84_14) / var_84_15

				if arg_81_1.var_.characterEffect1184ui_story then
					arg_81_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_14 + var_84_15 and arg_81_1.time_ < var_84_14 + var_84_15 + arg_84_0 and arg_81_1.var_.characterEffect1184ui_story then
				arg_81_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_84_17 = arg_81_1.actors_["10024ui_story"]
			local var_84_18 = 0

			if var_84_18 < arg_81_1.time_ and arg_81_1.time_ <= var_84_18 + arg_84_0 and arg_81_1.var_.characterEffect10024ui_story == nil then
				arg_81_1.var_.characterEffect10024ui_story = var_84_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_19 = 0.2

			if var_84_18 <= arg_81_1.time_ and arg_81_1.time_ < var_84_18 + var_84_19 then
				local var_84_20 = (arg_81_1.time_ - var_84_18) / var_84_19

				if arg_81_1.var_.characterEffect10024ui_story then
					local var_84_21 = Mathf.Lerp(0, 0.5, var_84_20)

					arg_81_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_81_1.var_.characterEffect10024ui_story.fillRatio = var_84_21
				end
			end

			if arg_81_1.time_ >= var_84_18 + var_84_19 and arg_81_1.time_ < var_84_18 + var_84_19 + arg_84_0 and arg_81_1.var_.characterEffect10024ui_story then
				local var_84_22 = 0.5

				arg_81_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_81_1.var_.characterEffect10024ui_story.fillRatio = var_84_22
			end

			local var_84_23 = 0

			if var_84_23 < arg_81_1.time_ and arg_81_1.time_ <= var_84_23 + arg_84_0 then
				arg_81_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_84_24 = 0

			if var_84_24 < arg_81_1.time_ and arg_81_1.time_ <= var_84_24 + arg_84_0 then
				arg_81_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_84_25 = 0
			local var_84_26 = 1.3

			if var_84_25 < arg_81_1.time_ and arg_81_1.time_ <= var_84_25 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_27 = arg_81_1:FormatText(StoryNameCfg[6].name)

				arg_81_1.leftNameTxt_.text = var_84_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_28 = arg_81_1:GetWordFromCfg(116301021)
				local var_84_29 = arg_81_1:FormatText(var_84_28.content)

				arg_81_1.text_.text = var_84_29

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_30 = 52
				local var_84_31 = utf8.len(var_84_29)
				local var_84_32 = var_84_30 <= 0 and var_84_26 or var_84_26 * (var_84_31 / var_84_30)

				if var_84_32 > 0 and var_84_26 < var_84_32 then
					arg_81_1.talkMaxDuration = var_84_32

					if var_84_32 + var_84_25 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_32 + var_84_25
					end
				end

				arg_81_1.text_.text = var_84_29
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301021", "story_v_out_116301.awb") ~= 0 then
					local var_84_33 = manager.audio:GetVoiceLength("story_v_out_116301", "116301021", "story_v_out_116301.awb") / 1000

					if var_84_33 + var_84_25 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_33 + var_84_25
					end

					if var_84_28.prefab_name ~= "" and arg_81_1.actors_[var_84_28.prefab_name] ~= nil then
						local var_84_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_28.prefab_name].transform, "story_v_out_116301", "116301021", "story_v_out_116301.awb")

						arg_81_1:RecordAudio("116301021", var_84_34)
						arg_81_1:RecordAudio("116301021", var_84_34)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_116301", "116301021", "story_v_out_116301.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_116301", "116301021", "story_v_out_116301.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_35 = math.max(var_84_26, arg_81_1.talkMaxDuration)

			if var_84_25 <= arg_81_1.time_ and arg_81_1.time_ < var_84_25 + var_84_35 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_25) / var_84_35

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_25 + var_84_35 and arg_81_1.time_ < var_84_25 + var_84_35 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play116301022 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 116301022
		arg_85_1.duration_ = 6.3

		local var_85_0 = {
			zh = 5.466,
			ja = 6.3
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
				arg_85_0:Play116301023(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action459")
			end

			local var_88_2 = 0
			local var_88_3 = 0.625

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

				local var_88_5 = arg_85_1:GetWordFromCfg(116301022)
				local var_88_6 = arg_85_1:FormatText(var_88_5.content)

				arg_85_1.text_.text = var_88_6

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_7 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301022", "story_v_out_116301.awb") ~= 0 then
					local var_88_10 = manager.audio:GetVoiceLength("story_v_out_116301", "116301022", "story_v_out_116301.awb") / 1000

					if var_88_10 + var_88_2 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_10 + var_88_2
					end

					if var_88_5.prefab_name ~= "" and arg_85_1.actors_[var_88_5.prefab_name] ~= nil then
						local var_88_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_5.prefab_name].transform, "story_v_out_116301", "116301022", "story_v_out_116301.awb")

						arg_85_1:RecordAudio("116301022", var_88_11)
						arg_85_1:RecordAudio("116301022", var_88_11)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_116301", "116301022", "story_v_out_116301.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_116301", "116301022", "story_v_out_116301.awb")
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
	Play116301023 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 116301023
		arg_89_1.duration_ = 5.933

		local var_89_0 = {
			zh = 5.866,
			ja = 5.933
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
				arg_89_0:Play116301024(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1184ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1184ui_story == nil then
				arg_89_1.var_.characterEffect1184ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1184ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1184ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1184ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1184ui_story.fillRatio = var_92_5
			end

			local var_92_6 = arg_89_1.actors_["10024ui_story"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.characterEffect10024ui_story == nil then
				arg_89_1.var_.characterEffect10024ui_story = var_92_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_8 = 0.2

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.characterEffect10024ui_story then
					arg_89_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.characterEffect10024ui_story then
				arg_89_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_92_11 = 0

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_1")
			end

			local var_92_12 = 0
			local var_92_13 = 0.4

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[332].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(116301023)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301023", "story_v_out_116301.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_116301", "116301023", "story_v_out_116301.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_116301", "116301023", "story_v_out_116301.awb")

						arg_89_1:RecordAudio("116301023", var_92_21)
						arg_89_1:RecordAudio("116301023", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_116301", "116301023", "story_v_out_116301.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_116301", "116301023", "story_v_out_116301.awb")
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
	Play116301024 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 116301024
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play116301025(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 1

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				local var_96_2 = "play"
				local var_96_3 = "effect"

				arg_93_1:AudioAction(var_96_2, var_96_3, "se_story_6", "se_story_6_black_fog", "")
			end

			local var_96_4 = arg_93_1.actors_["10024ui_story"].transform
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1.var_.moveOldPos10024ui_story = var_96_4.localPosition
			end

			local var_96_6 = 0.001

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6
				local var_96_8 = Vector3.New(0, 100, 0)

				var_96_4.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10024ui_story, var_96_8, var_96_7)

				local var_96_9 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_9.x, var_96_9.y, var_96_9.z)

				local var_96_10 = var_96_4.localEulerAngles

				var_96_10.z = 0
				var_96_10.x = 0
				var_96_4.localEulerAngles = var_96_10
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 then
				var_96_4.localPosition = Vector3.New(0, 100, 0)

				local var_96_11 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_11.x, var_96_11.y, var_96_11.z)

				local var_96_12 = var_96_4.localEulerAngles

				var_96_12.z = 0
				var_96_12.x = 0
				var_96_4.localEulerAngles = var_96_12
			end

			local var_96_13 = arg_93_1.actors_["1184ui_story"].transform
			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1.var_.moveOldPos1184ui_story = var_96_13.localPosition
			end

			local var_96_15 = 0.001

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_15 then
				local var_96_16 = (arg_93_1.time_ - var_96_14) / var_96_15
				local var_96_17 = Vector3.New(0, 100, 0)

				var_96_13.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1184ui_story, var_96_17, var_96_16)

				local var_96_18 = manager.ui.mainCamera.transform.position - var_96_13.position

				var_96_13.forward = Vector3.New(var_96_18.x, var_96_18.y, var_96_18.z)

				local var_96_19 = var_96_13.localEulerAngles

				var_96_19.z = 0
				var_96_19.x = 0
				var_96_13.localEulerAngles = var_96_19
			end

			if arg_93_1.time_ >= var_96_14 + var_96_15 and arg_93_1.time_ < var_96_14 + var_96_15 + arg_96_0 then
				var_96_13.localPosition = Vector3.New(0, 100, 0)

				local var_96_20 = manager.ui.mainCamera.transform.position - var_96_13.position

				var_96_13.forward = Vector3.New(var_96_20.x, var_96_20.y, var_96_20.z)

				local var_96_21 = var_96_13.localEulerAngles

				var_96_21.z = 0
				var_96_21.x = 0
				var_96_13.localEulerAngles = var_96_21
			end

			local var_96_22 = 0
			local var_96_23 = 1.225

			if var_96_22 < arg_93_1.time_ and arg_93_1.time_ <= var_96_22 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_24 = arg_93_1:GetWordFromCfg(116301024)
				local var_96_25 = arg_93_1:FormatText(var_96_24.content)

				arg_93_1.text_.text = var_96_25

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_26 = 49
				local var_96_27 = utf8.len(var_96_25)
				local var_96_28 = var_96_26 <= 0 and var_96_23 or var_96_23 * (var_96_27 / var_96_26)

				if var_96_28 > 0 and var_96_23 < var_96_28 then
					arg_93_1.talkMaxDuration = var_96_28

					if var_96_28 + var_96_22 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_28 + var_96_22
					end
				end

				arg_93_1.text_.text = var_96_25
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_29 = math.max(var_96_23, arg_93_1.talkMaxDuration)

			if var_96_22 <= arg_93_1.time_ and arg_93_1.time_ < var_96_22 + var_96_29 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_22) / var_96_29

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_22 + var_96_29 and arg_93_1.time_ < var_96_22 + var_96_29 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play116301025 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 116301025
		arg_97_1.duration_ = 6.5

		local var_97_0 = {
			zh = 6.5,
			ja = 3.5
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
				arg_97_0:Play116301026(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10024ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos10024ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, -1, -6)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10024ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, -1, -6)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["10024ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect10024ui_story == nil then
				arg_97_1.var_.characterEffect10024ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.2

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect10024ui_story then
					arg_97_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect10024ui_story then
				arg_97_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action2_1")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_100_15 = 0
			local var_100_16 = 0.6

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[332].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(116301025)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 24
				local var_100_21 = utf8.len(var_100_19)
				local var_100_22 = var_100_20 <= 0 and var_100_16 or var_100_16 * (var_100_21 / var_100_20)

				if var_100_22 > 0 and var_100_16 < var_100_22 then
					arg_97_1.talkMaxDuration = var_100_22

					if var_100_22 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_22 + var_100_15
					end
				end

				arg_97_1.text_.text = var_100_19
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301025", "story_v_out_116301.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_out_116301", "116301025", "story_v_out_116301.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_out_116301", "116301025", "story_v_out_116301.awb")

						arg_97_1:RecordAudio("116301025", var_100_24)
						arg_97_1:RecordAudio("116301025", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_116301", "116301025", "story_v_out_116301.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_116301", "116301025", "story_v_out_116301.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_25 = math.max(var_100_16, arg_97_1.talkMaxDuration)

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_25 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_15) / var_100_25

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_15 + var_100_25 and arg_97_1.time_ < var_100_15 + var_100_25 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play116301026 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 116301026
		arg_101_1.duration_ = 8.466

		local var_101_0 = {
			zh = 8.133,
			ja = 8.466
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
				arg_101_0:Play116301027(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_104_1 = 0
			local var_104_2 = 0.8

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_3 = arg_101_1:FormatText(StoryNameCfg[332].name)

				arg_101_1.leftNameTxt_.text = var_104_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_4 = arg_101_1:GetWordFromCfg(116301026)
				local var_104_5 = arg_101_1:FormatText(var_104_4.content)

				arg_101_1.text_.text = var_104_5

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_6 = 32
				local var_104_7 = utf8.len(var_104_5)
				local var_104_8 = var_104_6 <= 0 and var_104_2 or var_104_2 * (var_104_7 / var_104_6)

				if var_104_8 > 0 and var_104_2 < var_104_8 then
					arg_101_1.talkMaxDuration = var_104_8

					if var_104_8 + var_104_1 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_1
					end
				end

				arg_101_1.text_.text = var_104_5
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301026", "story_v_out_116301.awb") ~= 0 then
					local var_104_9 = manager.audio:GetVoiceLength("story_v_out_116301", "116301026", "story_v_out_116301.awb") / 1000

					if var_104_9 + var_104_1 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_9 + var_104_1
					end

					if var_104_4.prefab_name ~= "" and arg_101_1.actors_[var_104_4.prefab_name] ~= nil then
						local var_104_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_4.prefab_name].transform, "story_v_out_116301", "116301026", "story_v_out_116301.awb")

						arg_101_1:RecordAudio("116301026", var_104_10)
						arg_101_1:RecordAudio("116301026", var_104_10)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_116301", "116301026", "story_v_out_116301.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_116301", "116301026", "story_v_out_116301.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_11 = math.max(var_104_2, arg_101_1.talkMaxDuration)

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_11 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_1) / var_104_11

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_1 + var_104_11 and arg_101_1.time_ < var_104_1 + var_104_11 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play116301027 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 116301027
		arg_105_1.duration_ = 5.1

		local var_105_0 = {
			zh = 5.1,
			ja = 3.033
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
				arg_105_0:Play116301028(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10024ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect10024ui_story == nil then
				arg_105_1.var_.characterEffect10024ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.2

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect10024ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_105_1.var_.characterEffect10024ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect10024ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_105_1.var_.characterEffect10024ui_story.fillRatio = var_108_5
			end

			local var_108_6 = arg_105_1.actors_["10025ui_story"]
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 and arg_105_1.var_.characterEffect10025ui_story == nil then
				arg_105_1.var_.characterEffect10025ui_story = var_108_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_8 = 0.2

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_8 then
				local var_108_9 = (arg_105_1.time_ - var_108_7) / var_108_8

				if arg_105_1.var_.characterEffect10025ui_story then
					arg_105_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_7 + var_108_8 and arg_105_1.time_ < var_108_7 + var_108_8 + arg_108_0 and arg_105_1.var_.characterEffect10025ui_story then
				arg_105_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action7_1")
			end

			local var_108_11 = 0

			if var_108_11 < arg_105_1.time_ and arg_105_1.time_ <= var_108_11 + arg_108_0 then
				arg_105_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_108_12 = 0

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1301cva")
			end

			local var_108_13 = arg_105_1.actors_["10025ui_story"].transform
			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1.var_.moveOldPos10025ui_story = var_108_13.localPosition
			end

			local var_108_15 = 0.001

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_15 then
				local var_108_16 = (arg_105_1.time_ - var_108_14) / var_108_15
				local var_108_17 = Vector3.New(0, -1.1, -5.9)

				var_108_13.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10025ui_story, var_108_17, var_108_16)

				local var_108_18 = manager.ui.mainCamera.transform.position - var_108_13.position

				var_108_13.forward = Vector3.New(var_108_18.x, var_108_18.y, var_108_18.z)

				local var_108_19 = var_108_13.localEulerAngles

				var_108_19.z = 0
				var_108_19.x = 0
				var_108_13.localEulerAngles = var_108_19
			end

			if arg_105_1.time_ >= var_108_14 + var_108_15 and arg_105_1.time_ < var_108_14 + var_108_15 + arg_108_0 then
				var_108_13.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_108_20 = manager.ui.mainCamera.transform.position - var_108_13.position

				var_108_13.forward = Vector3.New(var_108_20.x, var_108_20.y, var_108_20.z)

				local var_108_21 = var_108_13.localEulerAngles

				var_108_21.z = 0
				var_108_21.x = 0
				var_108_13.localEulerAngles = var_108_21
			end

			local var_108_22 = arg_105_1.actors_["10024ui_story"].transform
			local var_108_23 = 0

			if var_108_23 < arg_105_1.time_ and arg_105_1.time_ <= var_108_23 + arg_108_0 then
				arg_105_1.var_.moveOldPos10024ui_story = var_108_22.localPosition
			end

			local var_108_24 = 0.001

			if var_108_23 <= arg_105_1.time_ and arg_105_1.time_ < var_108_23 + var_108_24 then
				local var_108_25 = (arg_105_1.time_ - var_108_23) / var_108_24
				local var_108_26 = Vector3.New(0, 100, 0)

				var_108_22.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10024ui_story, var_108_26, var_108_25)

				local var_108_27 = manager.ui.mainCamera.transform.position - var_108_22.position

				var_108_22.forward = Vector3.New(var_108_27.x, var_108_27.y, var_108_27.z)

				local var_108_28 = var_108_22.localEulerAngles

				var_108_28.z = 0
				var_108_28.x = 0
				var_108_22.localEulerAngles = var_108_28
			end

			if arg_105_1.time_ >= var_108_23 + var_108_24 and arg_105_1.time_ < var_108_23 + var_108_24 + arg_108_0 then
				var_108_22.localPosition = Vector3.New(0, 100, 0)

				local var_108_29 = manager.ui.mainCamera.transform.position - var_108_22.position

				var_108_22.forward = Vector3.New(var_108_29.x, var_108_29.y, var_108_29.z)

				local var_108_30 = var_108_22.localEulerAngles

				var_108_30.z = 0
				var_108_30.x = 0
				var_108_22.localEulerAngles = var_108_30
			end

			local var_108_31 = 0
			local var_108_32 = 0.275

			if var_108_31 < arg_105_1.time_ and arg_105_1.time_ <= var_108_31 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_33 = arg_105_1:FormatText(StoryNameCfg[328].name)

				arg_105_1.leftNameTxt_.text = var_108_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_34 = arg_105_1:GetWordFromCfg(116301027)
				local var_108_35 = arg_105_1:FormatText(var_108_34.content)

				arg_105_1.text_.text = var_108_35

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_36 = 11
				local var_108_37 = utf8.len(var_108_35)
				local var_108_38 = var_108_36 <= 0 and var_108_32 or var_108_32 * (var_108_37 / var_108_36)

				if var_108_38 > 0 and var_108_32 < var_108_38 then
					arg_105_1.talkMaxDuration = var_108_38

					if var_108_38 + var_108_31 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_38 + var_108_31
					end
				end

				arg_105_1.text_.text = var_108_35
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301027", "story_v_out_116301.awb") ~= 0 then
					local var_108_39 = manager.audio:GetVoiceLength("story_v_out_116301", "116301027", "story_v_out_116301.awb") / 1000

					if var_108_39 + var_108_31 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_39 + var_108_31
					end

					if var_108_34.prefab_name ~= "" and arg_105_1.actors_[var_108_34.prefab_name] ~= nil then
						local var_108_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_34.prefab_name].transform, "story_v_out_116301", "116301027", "story_v_out_116301.awb")

						arg_105_1:RecordAudio("116301027", var_108_40)
						arg_105_1:RecordAudio("116301027", var_108_40)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_116301", "116301027", "story_v_out_116301.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_116301", "116301027", "story_v_out_116301.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_41 = math.max(var_108_32, arg_105_1.talkMaxDuration)

			if var_108_31 <= arg_105_1.time_ and arg_105_1.time_ < var_108_31 + var_108_41 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_31) / var_108_41

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_31 + var_108_41 and arg_105_1.time_ < var_108_31 + var_108_41 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play116301028 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 116301028
		arg_109_1.duration_ = 8

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play116301029(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 2
			local var_112_1 = 1

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				local var_112_2 = "play"
				local var_112_3 = "effect"

				arg_109_1:AudioAction(var_112_2, var_112_3, "se_story_9", "se_story_9_black_fog02", "")
			end

			local var_112_4 = arg_109_1.actors_["10024ui_story"].transform
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 then
				arg_109_1.var_.moveOldPos10024ui_story = var_112_4.localPosition
			end

			local var_112_6 = 0.001

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6
				local var_112_8 = Vector3.New(0, 100, 0)

				var_112_4.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10024ui_story, var_112_8, var_112_7)

				local var_112_9 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_9.x, var_112_9.y, var_112_9.z)

				local var_112_10 = var_112_4.localEulerAngles

				var_112_10.z = 0
				var_112_10.x = 0
				var_112_4.localEulerAngles = var_112_10
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 then
				var_112_4.localPosition = Vector3.New(0, 100, 0)

				local var_112_11 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_11.x, var_112_11.y, var_112_11.z)

				local var_112_12 = var_112_4.localEulerAngles

				var_112_12.z = 0
				var_112_12.x = 0
				var_112_4.localEulerAngles = var_112_12
			end

			local var_112_13 = arg_109_1.actors_["10025ui_story"].transform
			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 then
				arg_109_1.var_.moveOldPos10025ui_story = var_112_13.localPosition
			end

			local var_112_15 = 0.001

			if var_112_14 <= arg_109_1.time_ and arg_109_1.time_ < var_112_14 + var_112_15 then
				local var_112_16 = (arg_109_1.time_ - var_112_14) / var_112_15
				local var_112_17 = Vector3.New(0, 100, 0)

				var_112_13.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10025ui_story, var_112_17, var_112_16)

				local var_112_18 = manager.ui.mainCamera.transform.position - var_112_13.position

				var_112_13.forward = Vector3.New(var_112_18.x, var_112_18.y, var_112_18.z)

				local var_112_19 = var_112_13.localEulerAngles

				var_112_19.z = 0
				var_112_19.x = 0
				var_112_13.localEulerAngles = var_112_19
			end

			if arg_109_1.time_ >= var_112_14 + var_112_15 and arg_109_1.time_ < var_112_14 + var_112_15 + arg_112_0 then
				var_112_13.localPosition = Vector3.New(0, 100, 0)

				local var_112_20 = manager.ui.mainCamera.transform.position - var_112_13.position

				var_112_13.forward = Vector3.New(var_112_20.x, var_112_20.y, var_112_20.z)

				local var_112_21 = var_112_13.localEulerAngles

				var_112_21.z = 0
				var_112_21.x = 0
				var_112_13.localEulerAngles = var_112_21
			end

			local var_112_22 = manager.ui.mainCamera.transform
			local var_112_23 = 2

			if var_112_23 < arg_109_1.time_ and arg_109_1.time_ <= var_112_23 + arg_112_0 then
				arg_109_1.var_.shakeOldPos = var_112_22.localPosition
			end

			local var_112_24 = 1

			if var_112_23 <= arg_109_1.time_ and arg_109_1.time_ < var_112_23 + var_112_24 then
				local var_112_25 = (arg_109_1.time_ - var_112_23) / 0.066
				local var_112_26, var_112_27 = math.modf(var_112_25)

				var_112_22.localPosition = Vector3.New(var_112_27 * 0.13, var_112_27 * 0.13, var_112_27 * 0.13) + arg_109_1.var_.shakeOldPos
			end

			if arg_109_1.time_ >= var_112_23 + var_112_24 and arg_109_1.time_ < var_112_23 + var_112_24 + arg_112_0 then
				var_112_22.localPosition = arg_109_1.var_.shakeOldPos
			end

			local var_112_28 = 0

			if var_112_28 < arg_109_1.time_ and arg_109_1.time_ <= var_112_28 + arg_112_0 then
				arg_109_1.mask_.enabled = true
				arg_109_1.mask_.raycastTarget = true

				arg_109_1:SetGaussion(false)
			end

			local var_112_29 = 2

			if var_112_28 <= arg_109_1.time_ and arg_109_1.time_ < var_112_28 + var_112_29 then
				local var_112_30 = (arg_109_1.time_ - var_112_28) / var_112_29
				local var_112_31 = Color.New(0, 0, 0)

				var_112_31.a = Mathf.Lerp(0, 1, var_112_30)
				arg_109_1.mask_.color = var_112_31
			end

			if arg_109_1.time_ >= var_112_28 + var_112_29 and arg_109_1.time_ < var_112_28 + var_112_29 + arg_112_0 then
				local var_112_32 = Color.New(0, 0, 0)

				var_112_32.a = 1
				arg_109_1.mask_.color = var_112_32
			end

			local var_112_33 = 2

			if var_112_33 < arg_109_1.time_ and arg_109_1.time_ <= var_112_33 + arg_112_0 then
				arg_109_1.mask_.enabled = true
				arg_109_1.mask_.raycastTarget = true

				arg_109_1:SetGaussion(false)
			end

			local var_112_34 = 0.75

			if var_112_33 <= arg_109_1.time_ and arg_109_1.time_ < var_112_33 + var_112_34 then
				local var_112_35 = (arg_109_1.time_ - var_112_33) / var_112_34
				local var_112_36 = Color.New(0, 0, 0)

				var_112_36.a = Mathf.Lerp(1, 0, var_112_35)
				arg_109_1.mask_.color = var_112_36
			end

			if arg_109_1.time_ >= var_112_33 + var_112_34 and arg_109_1.time_ < var_112_33 + var_112_34 + arg_112_0 then
				local var_112_37 = Color.New(0, 0, 0)
				local var_112_38 = 0

				arg_109_1.mask_.enabled = false
				var_112_37.a = var_112_38
				arg_109_1.mask_.color = var_112_37
			end

			if arg_109_1.frameCnt_ <= 1 then
				arg_109_1.dialog_:SetActive(false)
			end

			local var_112_39 = 3
			local var_112_40 = 0.9

			if var_112_39 < arg_109_1.time_ and arg_109_1.time_ <= var_112_39 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0

				arg_109_1.dialog_:SetActive(true)

				local var_112_41 = LeanTween.value(arg_109_1.dialog_, 0, 1, 0.3)

				var_112_41:setOnUpdate(LuaHelper.FloatAction(function(arg_113_0)
					arg_109_1.dialogCg_.alpha = arg_113_0
				end))
				var_112_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_109_1.dialog_)
					var_112_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_109_1.duration_ = arg_109_1.duration_ + 0.3

				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_42 = arg_109_1:GetWordFromCfg(116301028)
				local var_112_43 = arg_109_1:FormatText(var_112_42.content)

				arg_109_1.text_.text = var_112_43

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_44 = 36
				local var_112_45 = utf8.len(var_112_43)
				local var_112_46 = var_112_44 <= 0 and var_112_40 or var_112_40 * (var_112_45 / var_112_44)

				if var_112_46 > 0 and var_112_40 < var_112_46 then
					arg_109_1.talkMaxDuration = var_112_46
					var_112_39 = var_112_39 + 0.3

					if var_112_46 + var_112_39 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_46 + var_112_39
					end
				end

				arg_109_1.text_.text = var_112_43
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_47 = var_112_39 + 0.3
			local var_112_48 = math.max(var_112_40, arg_109_1.talkMaxDuration)

			if var_112_47 <= arg_109_1.time_ and arg_109_1.time_ < var_112_47 + var_112_48 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_47) / var_112_48

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_47 + var_112_48 and arg_109_1.time_ < var_112_47 + var_112_48 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play116301029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116301029
		arg_115_1.duration_ = 6.533

		local var_115_0 = {
			zh = 6.533,
			ja = 4.5
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
			arg_115_1.auto_ = false
		end

		function arg_115_1.playNext_(arg_117_0)
			arg_115_1.onStoryFinished_()
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.5

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[332].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4031")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(116301029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 20
				local var_118_6 = utf8.len(var_118_4)
				local var_118_7 = var_118_5 <= 0 and var_118_1 or var_118_1 * (var_118_6 / var_118_5)

				if var_118_7 > 0 and var_118_1 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_4
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116301", "116301029", "story_v_out_116301.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_116301", "116301029", "story_v_out_116301.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_116301", "116301029", "story_v_out_116301.awb")

						arg_115_1:RecordAudio("116301029", var_118_9)
						arg_115_1:RecordAudio("116301029", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_116301", "116301029", "story_v_out_116301.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_116301", "116301029", "story_v_out_116301.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_10 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_10 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_10

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_10 and arg_115_1.time_ < var_118_0 + var_118_10 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13c"
	},
	voices = {
		"story_v_out_116301.awb"
	}
}
