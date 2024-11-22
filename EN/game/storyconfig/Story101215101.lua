return {
	Play121511001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 121511001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play121511002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J12f"

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
				local var_4_5 = arg_1_1.bgs_.J12f

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
					if iter_4_0 ~= "J12f" then
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

			local var_4_22 = "1075ui_story"

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

			local var_4_26 = arg_1_1.actors_["1075ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1075ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -1.055, -6.16)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1075ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1075ui_story"]
			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1075ui_story == nil then
				arg_1_1.var_.characterEffect1075ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1075ui_story then
					local var_4_39 = Mathf.Lerp(0, 0.5, var_4_38)

					arg_1_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_1_1.var_.characterEffect1075ui_story.fillRatio = var_4_39
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1075ui_story then
				local var_4_40 = 0.5

				arg_1_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_1_1.var_.characterEffect1075ui_story.fillRatio = var_4_40
			end

			local var_4_41 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_4_43 = 0
			local var_4_44 = 0.0666666666666667

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 0.1
			local var_4_48 = 1

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "effect"

				arg_1_1:AudioAction(var_4_49, var_4_50, "se_story_121_04", "se_story_121_04_harbor_loop", "")
			end

			local var_4_51 = 2
			local var_4_52 = 0.15

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_53 = arg_1_1:FormatText(StoryNameCfg[7].name)

				arg_1_1.leftNameTxt_.text = var_4_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_54 = arg_1_1:GetWordFromCfg(121511001)
				local var_4_55 = arg_1_1:FormatText(var_4_54.content)

				arg_1_1.text_.text = var_4_55

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_56 = 6
				local var_4_57 = utf8.len(var_4_55)
				local var_4_58 = var_4_56 <= 0 and var_4_52 or var_4_52 * (var_4_57 / var_4_56)

				if var_4_58 > 0 and var_4_52 < var_4_58 then
					arg_1_1.talkMaxDuration = var_4_58

					if var_4_58 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_51
					end
				end

				arg_1_1.text_.text = var_4_55
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_59 = math.max(var_4_52, arg_1_1.talkMaxDuration)

			if var_4_51 <= arg_1_1.time_ and arg_1_1.time_ < var_4_51 + var_4_59 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_51) / var_4_59

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_51 + var_4_59 and arg_1_1.time_ < var_4_51 + var_4_59 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play121511002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 121511002
		arg_5_1.duration_ = 6.866

		local var_5_0 = {
			ja = 6.866,
			ko = 5.7,
			zh = 5.7
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
				arg_5_0:Play121511003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = arg_5_1.actors_["1075ui_story"]
			local var_8_1 = 0

			if var_8_1 < arg_5_1.time_ and arg_5_1.time_ <= var_8_1 + arg_8_0 and arg_5_1.var_.characterEffect1075ui_story == nil then
				arg_5_1.var_.characterEffect1075ui_story = var_8_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_2 = 0.200000002980232

			if var_8_1 <= arg_5_1.time_ and arg_5_1.time_ < var_8_1 + var_8_2 then
				local var_8_3 = (arg_5_1.time_ - var_8_1) / var_8_2

				if arg_5_1.var_.characterEffect1075ui_story then
					arg_5_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_5_1.time_ >= var_8_1 + var_8_2 and arg_5_1.time_ < var_8_1 + var_8_2 + arg_8_0 and arg_5_1.var_.characterEffect1075ui_story then
				arg_5_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_8_4 = 0

			if var_8_4 < arg_5_1.time_ and arg_5_1.time_ <= var_8_4 + arg_8_0 then
				arg_5_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_8_5 = 0

			if var_8_5 < arg_5_1.time_ and arg_5_1.time_ <= var_8_5 + arg_8_0 then
				arg_5_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_8_6 = 0
			local var_8_7 = 0.55

			if var_8_6 < arg_5_1.time_ and arg_5_1.time_ <= var_8_6 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, true)

				local var_8_8 = arg_5_1:FormatText(StoryNameCfg[381].name)

				arg_5_1.leftNameTxt_.text = var_8_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_1.leftNameTxt_.transform)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1.leftNameTxt_.text)
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_9 = arg_5_1:GetWordFromCfg(121511002)
				local var_8_10 = arg_5_1:FormatText(var_8_9.content)

				arg_5_1.text_.text = var_8_10

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_11 = 22
				local var_8_12 = utf8.len(var_8_10)
				local var_8_13 = var_8_11 <= 0 and var_8_7 or var_8_7 * (var_8_12 / var_8_11)

				if var_8_13 > 0 and var_8_7 < var_8_13 then
					arg_5_1.talkMaxDuration = var_8_13

					if var_8_13 + var_8_6 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_13 + var_8_6
					end
				end

				arg_5_1.text_.text = var_8_10
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511002", "story_v_out_121511.awb") ~= 0 then
					local var_8_14 = manager.audio:GetVoiceLength("story_v_out_121511", "121511002", "story_v_out_121511.awb") / 1000

					if var_8_14 + var_8_6 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_14 + var_8_6
					end

					if var_8_9.prefab_name ~= "" and arg_5_1.actors_[var_8_9.prefab_name] ~= nil then
						local var_8_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_5_1.actors_[var_8_9.prefab_name].transform, "story_v_out_121511", "121511002", "story_v_out_121511.awb")

						arg_5_1:RecordAudio("121511002", var_8_15)
						arg_5_1:RecordAudio("121511002", var_8_15)
					else
						arg_5_1:AudioAction("play", "voice", "story_v_out_121511", "121511002", "story_v_out_121511.awb")
					end

					arg_5_1:RecordHistoryTalkVoice("story_v_out_121511", "121511002", "story_v_out_121511.awb")
				end

				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_16 = math.max(var_8_7, arg_5_1.talkMaxDuration)

			if var_8_6 <= arg_5_1.time_ and arg_5_1.time_ < var_8_6 + var_8_16 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_6) / var_8_16

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_6 + var_8_16 and arg_5_1.time_ < var_8_6 + var_8_16 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play121511003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 121511003
		arg_9_1.duration_ = 14.166

		local var_9_0 = {
			ja = 10.2,
			ko = 14.166,
			zh = 14.166
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
				arg_9_0:Play121511004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_12_1 = 0

			if var_12_1 < arg_9_1.time_ and arg_9_1.time_ <= var_12_1 + arg_12_0 then
				arg_9_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_12_2 = 0
			local var_12_3 = 1.45

			if var_12_2 < arg_9_1.time_ and arg_9_1.time_ <= var_12_2 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_4 = arg_9_1:FormatText(StoryNameCfg[381].name)

				arg_9_1.leftNameTxt_.text = var_12_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_5 = arg_9_1:GetWordFromCfg(121511003)
				local var_12_6 = arg_9_1:FormatText(var_12_5.content)

				arg_9_1.text_.text = var_12_6

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_7 = 59
				local var_12_8 = utf8.len(var_12_6)
				local var_12_9 = var_12_7 <= 0 and var_12_3 or var_12_3 * (var_12_8 / var_12_7)

				if var_12_9 > 0 and var_12_3 < var_12_9 then
					arg_9_1.talkMaxDuration = var_12_9

					if var_12_9 + var_12_2 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_9 + var_12_2
					end
				end

				arg_9_1.text_.text = var_12_6
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511003", "story_v_out_121511.awb") ~= 0 then
					local var_12_10 = manager.audio:GetVoiceLength("story_v_out_121511", "121511003", "story_v_out_121511.awb") / 1000

					if var_12_10 + var_12_2 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_10 + var_12_2
					end

					if var_12_5.prefab_name ~= "" and arg_9_1.actors_[var_12_5.prefab_name] ~= nil then
						local var_12_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_5.prefab_name].transform, "story_v_out_121511", "121511003", "story_v_out_121511.awb")

						arg_9_1:RecordAudio("121511003", var_12_11)
						arg_9_1:RecordAudio("121511003", var_12_11)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_121511", "121511003", "story_v_out_121511.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_121511", "121511003", "story_v_out_121511.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_12 = math.max(var_12_3, arg_9_1.talkMaxDuration)

			if var_12_2 <= arg_9_1.time_ and arg_9_1.time_ < var_12_2 + var_12_12 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_2) / var_12_12

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_2 + var_12_12 and arg_9_1.time_ < var_12_2 + var_12_12 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play121511004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 121511004
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play121511005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1075ui_story"].transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos1075ui_story = var_16_0.localPosition
			end

			local var_16_2 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2
				local var_16_4 = Vector3.New(0, 100, 0)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1075ui_story, var_16_4, var_16_3)

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

			local var_16_9 = arg_13_1.actors_["1075ui_story"]
			local var_16_10 = 0

			if var_16_10 < arg_13_1.time_ and arg_13_1.time_ <= var_16_10 + arg_16_0 and arg_13_1.var_.characterEffect1075ui_story == nil then
				arg_13_1.var_.characterEffect1075ui_story = var_16_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_11 = 0.200000002980232

			if var_16_10 <= arg_13_1.time_ and arg_13_1.time_ < var_16_10 + var_16_11 then
				local var_16_12 = (arg_13_1.time_ - var_16_10) / var_16_11

				if arg_13_1.var_.characterEffect1075ui_story then
					local var_16_13 = Mathf.Lerp(0, 0.5, var_16_12)

					arg_13_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_13_1.var_.characterEffect1075ui_story.fillRatio = var_16_13
				end
			end

			if arg_13_1.time_ >= var_16_10 + var_16_11 and arg_13_1.time_ < var_16_10 + var_16_11 + arg_16_0 and arg_13_1.var_.characterEffect1075ui_story then
				local var_16_14 = 0.5

				arg_13_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_13_1.var_.characterEffect1075ui_story.fillRatio = var_16_14
			end

			local var_16_15 = 0
			local var_16_16 = 0.75

			if var_16_15 < arg_13_1.time_ and arg_13_1.time_ <= var_16_15 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_17 = arg_13_1:GetWordFromCfg(121511004)
				local var_16_18 = arg_13_1:FormatText(var_16_17.content)

				arg_13_1.text_.text = var_16_18

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_19 = 30
				local var_16_20 = utf8.len(var_16_18)
				local var_16_21 = var_16_19 <= 0 and var_16_16 or var_16_16 * (var_16_20 / var_16_19)

				if var_16_21 > 0 and var_16_16 < var_16_21 then
					arg_13_1.talkMaxDuration = var_16_21

					if var_16_21 + var_16_15 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_21 + var_16_15
					end
				end

				arg_13_1.text_.text = var_16_18
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_22 = math.max(var_16_16, arg_13_1.talkMaxDuration)

			if var_16_15 <= arg_13_1.time_ and arg_13_1.time_ < var_16_15 + var_16_22 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_15) / var_16_22

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_15 + var_16_22 and arg_13_1.time_ < var_16_15 + var_16_22 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play121511005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 121511005
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play121511006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 1.225

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

				local var_20_2 = arg_17_1:GetWordFromCfg(121511005)
				local var_20_3 = arg_17_1:FormatText(var_20_2.content)

				arg_17_1.text_.text = var_20_3

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_4 = 49
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
	Play121511006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 121511006
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play121511007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.6

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[7].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_3 = arg_21_1:GetWordFromCfg(121511006)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 24
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
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_8 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_8 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_8

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_8 and arg_21_1.time_ < var_24_0 + var_24_8 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play121511007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 121511007
		arg_25_1.duration_ = 4.866

		local var_25_0 = {
			ja = 4.866,
			ko = 4.666,
			zh = 4.666
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
				arg_25_0:Play121511008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1075ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos1075ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0, -1.055, -6.16)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1075ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["1075ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.characterEffect1075ui_story == nil then
				arg_25_1.var_.characterEffect1075ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect1075ui_story then
					arg_25_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.characterEffect1075ui_story then
				arg_25_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				arg_25_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_28_15 = 0
			local var_28_16 = 0.45

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_17 = arg_25_1:FormatText(StoryNameCfg[381].name)

				arg_25_1.leftNameTxt_.text = var_28_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_18 = arg_25_1:GetWordFromCfg(121511007)
				local var_28_19 = arg_25_1:FormatText(var_28_18.content)

				arg_25_1.text_.text = var_28_19

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_20 = 18
				local var_28_21 = utf8.len(var_28_19)
				local var_28_22 = var_28_20 <= 0 and var_28_16 or var_28_16 * (var_28_21 / var_28_20)

				if var_28_22 > 0 and var_28_16 < var_28_22 then
					arg_25_1.talkMaxDuration = var_28_22

					if var_28_22 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_22 + var_28_15
					end
				end

				arg_25_1.text_.text = var_28_19
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511007", "story_v_out_121511.awb") ~= 0 then
					local var_28_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511007", "story_v_out_121511.awb") / 1000

					if var_28_23 + var_28_15 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_23 + var_28_15
					end

					if var_28_18.prefab_name ~= "" and arg_25_1.actors_[var_28_18.prefab_name] ~= nil then
						local var_28_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_18.prefab_name].transform, "story_v_out_121511", "121511007", "story_v_out_121511.awb")

						arg_25_1:RecordAudio("121511007", var_28_24)
						arg_25_1:RecordAudio("121511007", var_28_24)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_121511", "121511007", "story_v_out_121511.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_121511", "121511007", "story_v_out_121511.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_25 = math.max(var_28_16, arg_25_1.talkMaxDuration)

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_25 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_15) / var_28_25

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_15 + var_28_25 and arg_25_1.time_ < var_28_15 + var_28_25 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play121511008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 121511008
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play121511009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1075ui_story"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.characterEffect1075ui_story == nil then
				arg_29_1.var_.characterEffect1075ui_story = var_32_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_2 = 0.200000002980232

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.characterEffect1075ui_story then
					local var_32_4 = Mathf.Lerp(0, 0.5, var_32_3)

					arg_29_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1075ui_story.fillRatio = var_32_4
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.characterEffect1075ui_story then
				local var_32_5 = 0.5

				arg_29_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1075ui_story.fillRatio = var_32_5
			end

			local var_32_6 = 0
			local var_32_7 = 0.35

			if var_32_6 < arg_29_1.time_ and arg_29_1.time_ <= var_32_6 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_8 = arg_29_1:GetWordFromCfg(121511008)
				local var_32_9 = arg_29_1:FormatText(var_32_8.content)

				arg_29_1.text_.text = var_32_9

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_10 = 14
				local var_32_11 = utf8.len(var_32_9)
				local var_32_12 = var_32_10 <= 0 and var_32_7 or var_32_7 * (var_32_11 / var_32_10)

				if var_32_12 > 0 and var_32_7 < var_32_12 then
					arg_29_1.talkMaxDuration = var_32_12

					if var_32_12 + var_32_6 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_12 + var_32_6
					end
				end

				arg_29_1.text_.text = var_32_9
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_13 = math.max(var_32_7, arg_29_1.talkMaxDuration)

			if var_32_6 <= arg_29_1.time_ and arg_29_1.time_ < var_32_6 + var_32_13 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_6) / var_32_13

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_6 + var_32_13 and arg_29_1.time_ < var_32_6 + var_32_13 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play121511009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 121511009
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play121511010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1075ui_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos1075ui_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(0, 100, 0)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1075ui_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(0, 100, 0)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["1075ui_story"]
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 and arg_33_1.var_.characterEffect1075ui_story == nil then
				arg_33_1.var_.characterEffect1075ui_story = var_36_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_11 = 0.200000002980232

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11

				if arg_33_1.var_.characterEffect1075ui_story then
					local var_36_13 = Mathf.Lerp(0, 0.5, var_36_12)

					arg_33_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1075ui_story.fillRatio = var_36_13
				end
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 and arg_33_1.var_.characterEffect1075ui_story then
				local var_36_14 = 0.5

				arg_33_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1075ui_story.fillRatio = var_36_14
			end

			local var_36_15 = 0
			local var_36_16 = 1.05

			if var_36_15 < arg_33_1.time_ and arg_33_1.time_ <= var_36_15 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_17 = arg_33_1:GetWordFromCfg(121511009)
				local var_36_18 = arg_33_1:FormatText(var_36_17.content)

				arg_33_1.text_.text = var_36_18

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_19 = 42
				local var_36_20 = utf8.len(var_36_18)
				local var_36_21 = var_36_19 <= 0 and var_36_16 or var_36_16 * (var_36_20 / var_36_19)

				if var_36_21 > 0 and var_36_16 < var_36_21 then
					arg_33_1.talkMaxDuration = var_36_21

					if var_36_21 + var_36_15 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_21 + var_36_15
					end
				end

				arg_33_1.text_.text = var_36_18
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_22 = math.max(var_36_16, arg_33_1.talkMaxDuration)

			if var_36_15 <= arg_33_1.time_ and arg_33_1.time_ < var_36_15 + var_36_22 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_15) / var_36_22

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_15 + var_36_22 and arg_33_1.time_ < var_36_15 + var_36_22 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play121511010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 121511010
		arg_37_1.duration_ = 5.4

		local var_37_0 = {
			ja = 5.033,
			ko = 5.4,
			zh = 5.4
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
				arg_37_0:Play121511011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = "1184ui_story"

			if arg_37_1.actors_[var_40_0] == nil then
				local var_40_1 = Object.Instantiate(Asset.Load("Char/" .. var_40_0), arg_37_1.stage_.transform)

				var_40_1.name = var_40_0
				var_40_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.actors_[var_40_0] = var_40_1

				local var_40_2 = var_40_1:GetComponentInChildren(typeof(CharacterEffect))

				var_40_2.enabled = true

				local var_40_3 = GameObjectTools.GetOrAddComponent(var_40_1, typeof(DynamicBoneHelper))

				if var_40_3 then
					var_40_3:EnableDynamicBone(false)
				end

				arg_37_1:ShowWeapon(var_40_2.transform, false)

				arg_37_1.var_[var_40_0 .. "Animator"] = var_40_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_37_1.var_[var_40_0 .. "Animator"].applyRootMotion = true
				arg_37_1.var_[var_40_0 .. "LipSync"] = var_40_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_40_4 = arg_37_1.actors_["1184ui_story"].transform
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 then
				arg_37_1.var_.moveOldPos1184ui_story = var_40_4.localPosition
			end

			local var_40_6 = 0.001

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6
				local var_40_8 = Vector3.New(0, -0.97, -6)

				var_40_4.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1184ui_story, var_40_8, var_40_7)

				local var_40_9 = manager.ui.mainCamera.transform.position - var_40_4.position

				var_40_4.forward = Vector3.New(var_40_9.x, var_40_9.y, var_40_9.z)

				local var_40_10 = var_40_4.localEulerAngles

				var_40_10.z = 0
				var_40_10.x = 0
				var_40_4.localEulerAngles = var_40_10
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 then
				var_40_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_40_11 = manager.ui.mainCamera.transform.position - var_40_4.position

				var_40_4.forward = Vector3.New(var_40_11.x, var_40_11.y, var_40_11.z)

				local var_40_12 = var_40_4.localEulerAngles

				var_40_12.z = 0
				var_40_12.x = 0
				var_40_4.localEulerAngles = var_40_12
			end

			local var_40_13 = arg_37_1.actors_["1184ui_story"]
			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 and arg_37_1.var_.characterEffect1184ui_story == nil then
				arg_37_1.var_.characterEffect1184ui_story = var_40_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_15 = 0.200000002980232

			if var_40_14 <= arg_37_1.time_ and arg_37_1.time_ < var_40_14 + var_40_15 then
				local var_40_16 = (arg_37_1.time_ - var_40_14) / var_40_15

				if arg_37_1.var_.characterEffect1184ui_story then
					arg_37_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_14 + var_40_15 and arg_37_1.time_ < var_40_14 + var_40_15 + arg_40_0 and arg_37_1.var_.characterEffect1184ui_story then
				arg_37_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_40_17 = 0

			if var_40_17 < arg_37_1.time_ and arg_37_1.time_ <= var_40_17 + arg_40_0 then
				arg_37_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_40_18 = 0

			if var_40_18 < arg_37_1.time_ and arg_37_1.time_ <= var_40_18 + arg_40_0 then
				arg_37_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_40_19 = 0
			local var_40_20 = 0.7

			if var_40_19 < arg_37_1.time_ and arg_37_1.time_ <= var_40_19 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_21 = arg_37_1:FormatText(StoryNameCfg[6].name)

				arg_37_1.leftNameTxt_.text = var_40_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_22 = arg_37_1:GetWordFromCfg(121511010)
				local var_40_23 = arg_37_1:FormatText(var_40_22.content)

				arg_37_1.text_.text = var_40_23

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_24 = 28
				local var_40_25 = utf8.len(var_40_23)
				local var_40_26 = var_40_24 <= 0 and var_40_20 or var_40_20 * (var_40_25 / var_40_24)

				if var_40_26 > 0 and var_40_20 < var_40_26 then
					arg_37_1.talkMaxDuration = var_40_26

					if var_40_26 + var_40_19 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_26 + var_40_19
					end
				end

				arg_37_1.text_.text = var_40_23
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511010", "story_v_out_121511.awb") ~= 0 then
					local var_40_27 = manager.audio:GetVoiceLength("story_v_out_121511", "121511010", "story_v_out_121511.awb") / 1000

					if var_40_27 + var_40_19 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_27 + var_40_19
					end

					if var_40_22.prefab_name ~= "" and arg_37_1.actors_[var_40_22.prefab_name] ~= nil then
						local var_40_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_22.prefab_name].transform, "story_v_out_121511", "121511010", "story_v_out_121511.awb")

						arg_37_1:RecordAudio("121511010", var_40_28)
						arg_37_1:RecordAudio("121511010", var_40_28)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_121511", "121511010", "story_v_out_121511.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_121511", "121511010", "story_v_out_121511.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_29 = math.max(var_40_20, arg_37_1.talkMaxDuration)

			if var_40_19 <= arg_37_1.time_ and arg_37_1.time_ < var_40_19 + var_40_29 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_19) / var_40_29

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_19 + var_40_29 and arg_37_1.time_ < var_40_19 + var_40_29 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play121511011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 121511011
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play121511012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1184ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1184ui_story == nil then
				arg_41_1.var_.characterEffect1184ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1184ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1184ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1184ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1184ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0
			local var_44_7 = 0.525

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_8 = arg_41_1:FormatText(StoryNameCfg[7].name)

				arg_41_1.leftNameTxt_.text = var_44_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_9 = arg_41_1:GetWordFromCfg(121511011)
				local var_44_10 = arg_41_1:FormatText(var_44_9.content)

				arg_41_1.text_.text = var_44_10

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_11 = 21
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
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_14 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_14 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_14

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_14 and arg_41_1.time_ < var_44_6 + var_44_14 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play121511012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 121511012
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play121511013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.925

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[7].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(121511012)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 37
				local var_48_6 = utf8.len(var_48_4)
				local var_48_7 = var_48_5 <= 0 and var_48_1 or var_48_1 * (var_48_6 / var_48_5)

				if var_48_7 > 0 and var_48_1 < var_48_7 then
					arg_45_1.talkMaxDuration = var_48_7

					if var_48_7 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_7 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_4
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_8 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_8 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_8

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_8 and arg_45_1.time_ < var_48_0 + var_48_8 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play121511013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 121511013
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play121511014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1184ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1184ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, 100, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1184ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, 100, 0)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1184ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1184ui_story == nil then
				arg_49_1.var_.characterEffect1184ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1184ui_story then
					local var_52_13 = Mathf.Lerp(0, 0.5, var_52_12)

					arg_49_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1184ui_story.fillRatio = var_52_13
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and arg_49_1.var_.characterEffect1184ui_story then
				local var_52_14 = 0.5

				arg_49_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1184ui_story.fillRatio = var_52_14
			end

			local var_52_15 = 0
			local var_52_16 = 0.8

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_17 = arg_49_1:GetWordFromCfg(121511013)
				local var_52_18 = arg_49_1:FormatText(var_52_17.content)

				arg_49_1.text_.text = var_52_18

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_19 = 32
				local var_52_20 = utf8.len(var_52_18)
				local var_52_21 = var_52_19 <= 0 and var_52_16 or var_52_16 * (var_52_20 / var_52_19)

				if var_52_21 > 0 and var_52_16 < var_52_21 then
					arg_49_1.talkMaxDuration = var_52_21

					if var_52_21 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_21 + var_52_15
					end
				end

				arg_49_1.text_.text = var_52_18
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_22 = math.max(var_52_16, arg_49_1.talkMaxDuration)

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_22 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_15) / var_52_22

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_15 + var_52_22 and arg_49_1.time_ < var_52_15 + var_52_22 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play121511014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 121511014
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play121511015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.0666666666666667

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				local var_56_2 = "play"
				local var_56_3 = "music"

				arg_53_1:AudioAction(var_56_2, var_56_3, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_56_4 = 0.0666666666666667
			local var_56_5 = 0.333333333333333

			if var_56_4 < arg_53_1.time_ and arg_53_1.time_ <= var_56_4 + arg_56_0 then
				local var_56_6 = "play"
				local var_56_7 = "effect"

				arg_53_1:AudioAction(var_56_6, var_56_7, "se_story_121_04", "se_story_121_04_message1", "")
			end

			local var_56_8 = 0
			local var_56_9 = 1.225

			if var_56_8 < arg_53_1.time_ and arg_53_1.time_ <= var_56_8 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_10 = arg_53_1:GetWordFromCfg(121511014)
				local var_56_11 = arg_53_1:FormatText(var_56_10.content)

				arg_53_1.text_.text = var_56_11

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_12 = 49
				local var_56_13 = utf8.len(var_56_11)
				local var_56_14 = var_56_12 <= 0 and var_56_9 or var_56_9 * (var_56_13 / var_56_12)

				if var_56_14 > 0 and var_56_9 < var_56_14 then
					arg_53_1.talkMaxDuration = var_56_14

					if var_56_14 + var_56_8 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_14 + var_56_8
					end
				end

				arg_53_1.text_.text = var_56_11
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_15 = math.max(var_56_9, arg_53_1.talkMaxDuration)

			if var_56_8 <= arg_53_1.time_ and arg_53_1.time_ < var_56_8 + var_56_15 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_8) / var_56_15

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_8 + var_56_15 and arg_53_1.time_ < var_56_8 + var_56_15 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play121511015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 121511015
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play121511016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.55

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[7].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(121511015)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 22
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
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_8 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_8 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_8

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_8 and arg_57_1.time_ < var_60_0 + var_60_8 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play121511016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 121511016
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play121511017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.925

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(121511016)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 37
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_7 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_7 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_7

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_7 and arg_61_1.time_ < var_64_0 + var_64_7 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play121511017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 121511017
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play121511018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.633333333333333

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				local var_68_2 = "play"
				local var_68_3 = "effect"

				arg_65_1:AudioAction(var_68_2, var_68_3, "se_story_121_04", "se_story_121_04_message2", "")
			end

			local var_68_4 = 0
			local var_68_5 = 1.15

			if var_68_4 < arg_65_1.time_ and arg_65_1.time_ <= var_68_4 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_6 = arg_65_1:GetWordFromCfg(121511017)
				local var_68_7 = arg_65_1:FormatText(var_68_6.content)

				arg_65_1.text_.text = var_68_7

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_8 = 46
				local var_68_9 = utf8.len(var_68_7)
				local var_68_10 = var_68_8 <= 0 and var_68_5 or var_68_5 * (var_68_9 / var_68_8)

				if var_68_10 > 0 and var_68_5 < var_68_10 then
					arg_65_1.talkMaxDuration = var_68_10

					if var_68_10 + var_68_4 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_10 + var_68_4
					end
				end

				arg_65_1.text_.text = var_68_7
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_11 = math.max(var_68_5, arg_65_1.talkMaxDuration)

			if var_68_4 <= arg_65_1.time_ and arg_65_1.time_ < var_68_4 + var_68_11 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_4) / var_68_11

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_4 + var_68_11 and arg_65_1.time_ < var_68_4 + var_68_11 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play121511018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 121511018
		arg_69_1.duration_ = 13.7

		local var_69_0 = {
			ja = 13.7,
			ko = 13.1,
			zh = 13.1
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
				arg_69_0:Play121511019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1184ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1184ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, -0.97, -6)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1184ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = arg_69_1.actors_["1184ui_story"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect1184ui_story == nil then
				arg_69_1.var_.characterEffect1184ui_story = var_72_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_11 = 0.200000002980232

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.characterEffect1184ui_story then
					arg_69_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.characterEffect1184ui_story then
				arg_69_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_72_15 = 0
			local var_72_16 = 1.275

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_17 = arg_69_1:FormatText(StoryNameCfg[6].name)

				arg_69_1.leftNameTxt_.text = var_72_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_18 = arg_69_1:GetWordFromCfg(121511018)
				local var_72_19 = arg_69_1:FormatText(var_72_18.content)

				arg_69_1.text_.text = var_72_19

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_20 = 51
				local var_72_21 = utf8.len(var_72_19)
				local var_72_22 = var_72_20 <= 0 and var_72_16 or var_72_16 * (var_72_21 / var_72_20)

				if var_72_22 > 0 and var_72_16 < var_72_22 then
					arg_69_1.talkMaxDuration = var_72_22

					if var_72_22 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_22 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_19
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511018", "story_v_out_121511.awb") ~= 0 then
					local var_72_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511018", "story_v_out_121511.awb") / 1000

					if var_72_23 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_23 + var_72_15
					end

					if var_72_18.prefab_name ~= "" and arg_69_1.actors_[var_72_18.prefab_name] ~= nil then
						local var_72_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_18.prefab_name].transform, "story_v_out_121511", "121511018", "story_v_out_121511.awb")

						arg_69_1:RecordAudio("121511018", var_72_24)
						arg_69_1:RecordAudio("121511018", var_72_24)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_121511", "121511018", "story_v_out_121511.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_121511", "121511018", "story_v_out_121511.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_25 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_25

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_25 and arg_69_1.time_ < var_72_15 + var_72_25 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play121511019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 121511019
		arg_73_1.duration_ = 7.566

		local var_73_0 = {
			ja = 7.566,
			ko = 6.6,
			zh = 6.6
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
				arg_73_0:Play121511020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4136")
			end

			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_76_2 = 0
			local var_76_3 = 0.725

			if var_76_2 < arg_73_1.time_ and arg_73_1.time_ <= var_76_2 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_4 = arg_73_1:FormatText(StoryNameCfg[6].name)

				arg_73_1.leftNameTxt_.text = var_76_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_5 = arg_73_1:GetWordFromCfg(121511019)
				local var_76_6 = arg_73_1:FormatText(var_76_5.content)

				arg_73_1.text_.text = var_76_6

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_7 = 29
				local var_76_8 = utf8.len(var_76_6)
				local var_76_9 = var_76_7 <= 0 and var_76_3 or var_76_3 * (var_76_8 / var_76_7)

				if var_76_9 > 0 and var_76_3 < var_76_9 then
					arg_73_1.talkMaxDuration = var_76_9

					if var_76_9 + var_76_2 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_9 + var_76_2
					end
				end

				arg_73_1.text_.text = var_76_6
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511019", "story_v_out_121511.awb") ~= 0 then
					local var_76_10 = manager.audio:GetVoiceLength("story_v_out_121511", "121511019", "story_v_out_121511.awb") / 1000

					if var_76_10 + var_76_2 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_10 + var_76_2
					end

					if var_76_5.prefab_name ~= "" and arg_73_1.actors_[var_76_5.prefab_name] ~= nil then
						local var_76_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_5.prefab_name].transform, "story_v_out_121511", "121511019", "story_v_out_121511.awb")

						arg_73_1:RecordAudio("121511019", var_76_11)
						arg_73_1:RecordAudio("121511019", var_76_11)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_121511", "121511019", "story_v_out_121511.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_121511", "121511019", "story_v_out_121511.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_12 = math.max(var_76_3, arg_73_1.talkMaxDuration)

			if var_76_2 <= arg_73_1.time_ and arg_73_1.time_ < var_76_2 + var_76_12 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_2) / var_76_12

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_2 + var_76_12 and arg_73_1.time_ < var_76_2 + var_76_12 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play121511020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 121511020
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play121511021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1184ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos1184ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, 100, 0)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1184ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, 100, 0)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["1184ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect1184ui_story == nil then
				arg_77_1.var_.characterEffect1184ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.200000002980232

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect1184ui_story then
					local var_80_13 = Mathf.Lerp(0, 0.5, var_80_12)

					arg_77_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1184ui_story.fillRatio = var_80_13
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect1184ui_story then
				local var_80_14 = 0.5

				arg_77_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1184ui_story.fillRatio = var_80_14
			end

			local var_80_15 = 0
			local var_80_16 = 0.7

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_17 = arg_77_1:GetWordFromCfg(121511020)
				local var_80_18 = arg_77_1:FormatText(var_80_17.content)

				arg_77_1.text_.text = var_80_18

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_19 = 28
				local var_80_20 = utf8.len(var_80_18)
				local var_80_21 = var_80_19 <= 0 and var_80_16 or var_80_16 * (var_80_20 / var_80_19)

				if var_80_21 > 0 and var_80_16 < var_80_21 then
					arg_77_1.talkMaxDuration = var_80_21

					if var_80_21 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_21 + var_80_15
					end
				end

				arg_77_1.text_.text = var_80_18
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_22 = math.max(var_80_16, arg_77_1.talkMaxDuration)

			if var_80_15 <= arg_77_1.time_ and arg_77_1.time_ < var_80_15 + var_80_22 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_15) / var_80_22

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_15 + var_80_22 and arg_77_1.time_ < var_80_15 + var_80_22 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play121511021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 121511021
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play121511022(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.05

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_2 = arg_81_1:GetWordFromCfg(121511021)
				local var_84_3 = arg_81_1:FormatText(var_84_2.content)

				arg_81_1.text_.text = var_84_3

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_4 = 42
				local var_84_5 = utf8.len(var_84_3)
				local var_84_6 = var_84_4 <= 0 and var_84_1 or var_84_1 * (var_84_5 / var_84_4)

				if var_84_6 > 0 and var_84_1 < var_84_6 then
					arg_81_1.talkMaxDuration = var_84_6

					if var_84_6 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_6 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_3
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_7 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_7 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_7

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_7 and arg_81_1.time_ < var_84_0 + var_84_7 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play121511022 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 121511022
		arg_85_1.duration_ = 8.866

		local var_85_0 = {
			ja = 8.866,
			ko = 4.4,
			zh = 4.4
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
				arg_85_0:Play121511023(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1184ui_story"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos1184ui_story = var_88_0.localPosition
			end

			local var_88_2 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2
				local var_88_4 = Vector3.New(-0.7, -0.97, -6)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1184ui_story, var_88_4, var_88_3)

				local var_88_5 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_5.x, var_88_5.y, var_88_5.z)

				local var_88_6 = var_88_0.localEulerAngles

				var_88_6.z = 0
				var_88_6.x = 0
				var_88_0.localEulerAngles = var_88_6
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_88_7 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_7.x, var_88_7.y, var_88_7.z)

				local var_88_8 = var_88_0.localEulerAngles

				var_88_8.z = 0
				var_88_8.x = 0
				var_88_0.localEulerAngles = var_88_8
			end

			local var_88_9 = arg_85_1.actors_["1184ui_story"]
			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 and arg_85_1.var_.characterEffect1184ui_story == nil then
				arg_85_1.var_.characterEffect1184ui_story = var_88_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_11 = 0.200000002980232

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_10) / var_88_11

				if arg_85_1.var_.characterEffect1184ui_story then
					local var_88_13 = Mathf.Lerp(0, 0.5, var_88_12)

					arg_85_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1184ui_story.fillRatio = var_88_13
				end
			end

			if arg_85_1.time_ >= var_88_10 + var_88_11 and arg_85_1.time_ < var_88_10 + var_88_11 + arg_88_0 and arg_85_1.var_.characterEffect1184ui_story then
				local var_88_14 = 0.5

				arg_85_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1184ui_story.fillRatio = var_88_14
			end

			local var_88_15 = arg_85_1.actors_["1075ui_story"].transform
			local var_88_16 = 0

			if var_88_16 < arg_85_1.time_ and arg_85_1.time_ <= var_88_16 + arg_88_0 then
				arg_85_1.var_.moveOldPos1075ui_story = var_88_15.localPosition
			end

			local var_88_17 = 0.001

			if var_88_16 <= arg_85_1.time_ and arg_85_1.time_ < var_88_16 + var_88_17 then
				local var_88_18 = (arg_85_1.time_ - var_88_16) / var_88_17
				local var_88_19 = Vector3.New(0.7, -1.055, -6.16)

				var_88_15.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1075ui_story, var_88_19, var_88_18)

				local var_88_20 = manager.ui.mainCamera.transform.position - var_88_15.position

				var_88_15.forward = Vector3.New(var_88_20.x, var_88_20.y, var_88_20.z)

				local var_88_21 = var_88_15.localEulerAngles

				var_88_21.z = 0
				var_88_21.x = 0
				var_88_15.localEulerAngles = var_88_21
			end

			if arg_85_1.time_ >= var_88_16 + var_88_17 and arg_85_1.time_ < var_88_16 + var_88_17 + arg_88_0 then
				var_88_15.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_88_22 = manager.ui.mainCamera.transform.position - var_88_15.position

				var_88_15.forward = Vector3.New(var_88_22.x, var_88_22.y, var_88_22.z)

				local var_88_23 = var_88_15.localEulerAngles

				var_88_23.z = 0
				var_88_23.x = 0
				var_88_15.localEulerAngles = var_88_23
			end

			local var_88_24 = arg_85_1.actors_["1075ui_story"]
			local var_88_25 = 0

			if var_88_25 < arg_85_1.time_ and arg_85_1.time_ <= var_88_25 + arg_88_0 and arg_85_1.var_.characterEffect1075ui_story == nil then
				arg_85_1.var_.characterEffect1075ui_story = var_88_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_26 = 0.200000002980232

			if var_88_25 <= arg_85_1.time_ and arg_85_1.time_ < var_88_25 + var_88_26 then
				local var_88_27 = (arg_85_1.time_ - var_88_25) / var_88_26

				if arg_85_1.var_.characterEffect1075ui_story then
					arg_85_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_25 + var_88_26 and arg_85_1.time_ < var_88_25 + var_88_26 + arg_88_0 and arg_85_1.var_.characterEffect1075ui_story then
				arg_85_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_88_28 = 0

			if var_88_28 < arg_85_1.time_ and arg_85_1.time_ <= var_88_28 + arg_88_0 then
				arg_85_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_88_29 = 0

			if var_88_29 < arg_85_1.time_ and arg_85_1.time_ <= var_88_29 + arg_88_0 then
				arg_85_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_88_30 = 0

			if var_88_30 < arg_85_1.time_ and arg_85_1.time_ <= var_88_30 + arg_88_0 then
				arg_85_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_88_31 = 0
			local var_88_32 = 0.55

			if var_88_31 < arg_85_1.time_ and arg_85_1.time_ <= var_88_31 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_33 = arg_85_1:FormatText(StoryNameCfg[381].name)

				arg_85_1.leftNameTxt_.text = var_88_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_34 = arg_85_1:GetWordFromCfg(121511022)
				local var_88_35 = arg_85_1:FormatText(var_88_34.content)

				arg_85_1.text_.text = var_88_35

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_36 = 22
				local var_88_37 = utf8.len(var_88_35)
				local var_88_38 = var_88_36 <= 0 and var_88_32 or var_88_32 * (var_88_37 / var_88_36)

				if var_88_38 > 0 and var_88_32 < var_88_38 then
					arg_85_1.talkMaxDuration = var_88_38

					if var_88_38 + var_88_31 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_38 + var_88_31
					end
				end

				arg_85_1.text_.text = var_88_35
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511022", "story_v_out_121511.awb") ~= 0 then
					local var_88_39 = manager.audio:GetVoiceLength("story_v_out_121511", "121511022", "story_v_out_121511.awb") / 1000

					if var_88_39 + var_88_31 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_39 + var_88_31
					end

					if var_88_34.prefab_name ~= "" and arg_85_1.actors_[var_88_34.prefab_name] ~= nil then
						local var_88_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_34.prefab_name].transform, "story_v_out_121511", "121511022", "story_v_out_121511.awb")

						arg_85_1:RecordAudio("121511022", var_88_40)
						arg_85_1:RecordAudio("121511022", var_88_40)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_121511", "121511022", "story_v_out_121511.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_121511", "121511022", "story_v_out_121511.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_41 = math.max(var_88_32, arg_85_1.talkMaxDuration)

			if var_88_31 <= arg_85_1.time_ and arg_85_1.time_ < var_88_31 + var_88_41 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_31) / var_88_41

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_31 + var_88_41 and arg_85_1.time_ < var_88_31 + var_88_41 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play121511023 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 121511023
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play121511024(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1075ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1075ui_story == nil then
				arg_89_1.var_.characterEffect1075ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1075ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1075ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1075ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1075ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 0.725

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[7].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(121511023)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 29
				local var_92_12 = utf8.len(var_92_10)
				local var_92_13 = var_92_11 <= 0 and var_92_7 or var_92_7 * (var_92_12 / var_92_11)

				if var_92_13 > 0 and var_92_7 < var_92_13 then
					arg_89_1.talkMaxDuration = var_92_13

					if var_92_13 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_13 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_10
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_14 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_14 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_14

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_14 and arg_89_1.time_ < var_92_6 + var_92_14 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play121511024 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 121511024
		arg_93_1.duration_ = 9.3

		local var_93_0 = {
			ja = 9.3,
			ko = 8.4,
			zh = 8.4
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
				arg_93_0:Play121511025(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1184ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1184ui_story == nil then
				arg_93_1.var_.characterEffect1184ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1184ui_story then
					arg_93_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1184ui_story then
				arg_93_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_96_4 = 0

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_96_6 = 0
			local var_96_7 = 1.15

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_8 = arg_93_1:FormatText(StoryNameCfg[6].name)

				arg_93_1.leftNameTxt_.text = var_96_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_9 = arg_93_1:GetWordFromCfg(121511024)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 46
				local var_96_12 = utf8.len(var_96_10)
				local var_96_13 = var_96_11 <= 0 and var_96_7 or var_96_7 * (var_96_12 / var_96_11)

				if var_96_13 > 0 and var_96_7 < var_96_13 then
					arg_93_1.talkMaxDuration = var_96_13

					if var_96_13 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_13 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_10
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511024", "story_v_out_121511.awb") ~= 0 then
					local var_96_14 = manager.audio:GetVoiceLength("story_v_out_121511", "121511024", "story_v_out_121511.awb") / 1000

					if var_96_14 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_14 + var_96_6
					end

					if var_96_9.prefab_name ~= "" and arg_93_1.actors_[var_96_9.prefab_name] ~= nil then
						local var_96_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_9.prefab_name].transform, "story_v_out_121511", "121511024", "story_v_out_121511.awb")

						arg_93_1:RecordAudio("121511024", var_96_15)
						arg_93_1:RecordAudio("121511024", var_96_15)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_121511", "121511024", "story_v_out_121511.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_121511", "121511024", "story_v_out_121511.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_16 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_16 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_16

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_16 and arg_93_1.time_ < var_96_6 + var_96_16 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play121511025 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 121511025
		arg_97_1.duration_ = 7.3

		local var_97_0 = {
			ja = 7.3,
			ko = 6.2,
			zh = 6.2
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
				arg_97_0:Play121511026(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1075ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1075ui_story == nil then
				arg_97_1.var_.characterEffect1075ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1075ui_story then
					arg_97_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1075ui_story then
				arg_97_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_100_4 = 0

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_2")
			end

			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_6 = arg_97_1.actors_["1184ui_story"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 and arg_97_1.var_.characterEffect1184ui_story == nil then
				arg_97_1.var_.characterEffect1184ui_story = var_100_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_8 = 0.200000002980232

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8

				if arg_97_1.var_.characterEffect1184ui_story then
					local var_100_10 = Mathf.Lerp(0, 0.5, var_100_9)

					arg_97_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1184ui_story.fillRatio = var_100_10
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 and arg_97_1.var_.characterEffect1184ui_story then
				local var_100_11 = 0.5

				arg_97_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1184ui_story.fillRatio = var_100_11
			end

			local var_100_12 = 0
			local var_100_13 = 0.675

			if var_100_12 < arg_97_1.time_ and arg_97_1.time_ <= var_100_12 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_14 = arg_97_1:FormatText(StoryNameCfg[381].name)

				arg_97_1.leftNameTxt_.text = var_100_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_15 = arg_97_1:GetWordFromCfg(121511025)
				local var_100_16 = arg_97_1:FormatText(var_100_15.content)

				arg_97_1.text_.text = var_100_16

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_17 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511025", "story_v_out_121511.awb") ~= 0 then
					local var_100_20 = manager.audio:GetVoiceLength("story_v_out_121511", "121511025", "story_v_out_121511.awb") / 1000

					if var_100_20 + var_100_12 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_20 + var_100_12
					end

					if var_100_15.prefab_name ~= "" and arg_97_1.actors_[var_100_15.prefab_name] ~= nil then
						local var_100_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_15.prefab_name].transform, "story_v_out_121511", "121511025", "story_v_out_121511.awb")

						arg_97_1:RecordAudio("121511025", var_100_21)
						arg_97_1:RecordAudio("121511025", var_100_21)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_121511", "121511025", "story_v_out_121511.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_121511", "121511025", "story_v_out_121511.awb")
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
	Play121511026 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 121511026
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play121511027(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1075ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1075ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, 100, 0)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1075ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, 100, 0)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1075ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect1075ui_story == nil then
				arg_101_1.var_.characterEffect1075ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect1075ui_story then
					local var_104_13 = Mathf.Lerp(0, 0.5, var_104_12)

					arg_101_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1075ui_story.fillRatio = var_104_13
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect1075ui_story then
				local var_104_14 = 0.5

				arg_101_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1075ui_story.fillRatio = var_104_14
			end

			local var_104_15 = arg_101_1.actors_["1184ui_story"].transform
			local var_104_16 = 0

			if var_104_16 < arg_101_1.time_ and arg_101_1.time_ <= var_104_16 + arg_104_0 then
				arg_101_1.var_.moveOldPos1184ui_story = var_104_15.localPosition
			end

			local var_104_17 = 0.001

			if var_104_16 <= arg_101_1.time_ and arg_101_1.time_ < var_104_16 + var_104_17 then
				local var_104_18 = (arg_101_1.time_ - var_104_16) / var_104_17
				local var_104_19 = Vector3.New(0, 100, 0)

				var_104_15.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1184ui_story, var_104_19, var_104_18)

				local var_104_20 = manager.ui.mainCamera.transform.position - var_104_15.position

				var_104_15.forward = Vector3.New(var_104_20.x, var_104_20.y, var_104_20.z)

				local var_104_21 = var_104_15.localEulerAngles

				var_104_21.z = 0
				var_104_21.x = 0
				var_104_15.localEulerAngles = var_104_21
			end

			if arg_101_1.time_ >= var_104_16 + var_104_17 and arg_101_1.time_ < var_104_16 + var_104_17 + arg_104_0 then
				var_104_15.localPosition = Vector3.New(0, 100, 0)

				local var_104_22 = manager.ui.mainCamera.transform.position - var_104_15.position

				var_104_15.forward = Vector3.New(var_104_22.x, var_104_22.y, var_104_22.z)

				local var_104_23 = var_104_15.localEulerAngles

				var_104_23.z = 0
				var_104_23.x = 0
				var_104_15.localEulerAngles = var_104_23
			end

			local var_104_24 = arg_101_1.actors_["1184ui_story"]
			local var_104_25 = 0

			if var_104_25 < arg_101_1.time_ and arg_101_1.time_ <= var_104_25 + arg_104_0 and arg_101_1.var_.characterEffect1184ui_story == nil then
				arg_101_1.var_.characterEffect1184ui_story = var_104_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_26 = 0.200000002980232

			if var_104_25 <= arg_101_1.time_ and arg_101_1.time_ < var_104_25 + var_104_26 then
				local var_104_27 = (arg_101_1.time_ - var_104_25) / var_104_26

				if arg_101_1.var_.characterEffect1184ui_story then
					local var_104_28 = Mathf.Lerp(0, 0.5, var_104_27)

					arg_101_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1184ui_story.fillRatio = var_104_28
				end
			end

			if arg_101_1.time_ >= var_104_25 + var_104_26 and arg_101_1.time_ < var_104_25 + var_104_26 + arg_104_0 and arg_101_1.var_.characterEffect1184ui_story then
				local var_104_29 = 0.5

				arg_101_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1184ui_story.fillRatio = var_104_29
			end

			local var_104_30 = 0
			local var_104_31 = 1

			if var_104_30 < arg_101_1.time_ and arg_101_1.time_ <= var_104_30 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_32 = arg_101_1:GetWordFromCfg(121511026)
				local var_104_33 = arg_101_1:FormatText(var_104_32.content)

				arg_101_1.text_.text = var_104_33

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_34 = 40
				local var_104_35 = utf8.len(var_104_33)
				local var_104_36 = var_104_34 <= 0 and var_104_31 or var_104_31 * (var_104_35 / var_104_34)

				if var_104_36 > 0 and var_104_31 < var_104_36 then
					arg_101_1.talkMaxDuration = var_104_36

					if var_104_36 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_36 + var_104_30
					end
				end

				arg_101_1.text_.text = var_104_33
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_37 = math.max(var_104_31, arg_101_1.talkMaxDuration)

			if var_104_30 <= arg_101_1.time_ and arg_101_1.time_ < var_104_30 + var_104_37 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_30) / var_104_37

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_30 + var_104_37 and arg_101_1.time_ < var_104_30 + var_104_37 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play121511027 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 121511027
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play121511028(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.625

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_2 = arg_105_1:GetWordFromCfg(121511027)
				local var_108_3 = arg_105_1:FormatText(var_108_2.content)

				arg_105_1.text_.text = var_108_3

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_4 = 25
				local var_108_5 = utf8.len(var_108_3)
				local var_108_6 = var_108_4 <= 0 and var_108_1 or var_108_1 * (var_108_5 / var_108_4)

				if var_108_6 > 0 and var_108_1 < var_108_6 then
					arg_105_1.talkMaxDuration = var_108_6

					if var_108_6 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_6 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_3
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_7 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_7 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_7

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_7 and arg_105_1.time_ < var_108_0 + var_108_7 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play121511028 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 121511028
		arg_109_1.duration_ = 6.133

		local var_109_0 = {
			ja = 6.133,
			ko = 5.433,
			zh = 5.433
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
				arg_109_0:Play121511029(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = "10042ui_story"

			if arg_109_1.actors_[var_112_0] == nil then
				local var_112_1 = Object.Instantiate(Asset.Load("Char/" .. var_112_0), arg_109_1.stage_.transform)

				var_112_1.name = var_112_0
				var_112_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_109_1.actors_[var_112_0] = var_112_1

				local var_112_2 = var_112_1:GetComponentInChildren(typeof(CharacterEffect))

				var_112_2.enabled = true

				local var_112_3 = GameObjectTools.GetOrAddComponent(var_112_1, typeof(DynamicBoneHelper))

				if var_112_3 then
					var_112_3:EnableDynamicBone(false)
				end

				arg_109_1:ShowWeapon(var_112_2.transform, false)

				arg_109_1.var_[var_112_0 .. "Animator"] = var_112_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_109_1.var_[var_112_0 .. "Animator"].applyRootMotion = true
				arg_109_1.var_[var_112_0 .. "LipSync"] = var_112_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_112_4 = arg_109_1.actors_["10042ui_story"].transform
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 then
				arg_109_1.var_.moveOldPos10042ui_story = var_112_4.localPosition
			end

			local var_112_6 = 0.001

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6
				local var_112_8 = Vector3.New(-0.7, -1.12, -6.2)

				var_112_4.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10042ui_story, var_112_8, var_112_7)

				local var_112_9 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_9.x, var_112_9.y, var_112_9.z)

				local var_112_10 = var_112_4.localEulerAngles

				var_112_10.z = 0
				var_112_10.x = 0
				var_112_4.localEulerAngles = var_112_10
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 then
				var_112_4.localPosition = Vector3.New(-0.7, -1.12, -6.2)

				local var_112_11 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_11.x, var_112_11.y, var_112_11.z)

				local var_112_12 = var_112_4.localEulerAngles

				var_112_12.z = 0
				var_112_12.x = 0
				var_112_4.localEulerAngles = var_112_12
			end

			local var_112_13 = arg_109_1.actors_["10042ui_story"]
			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 and arg_109_1.var_.characterEffect10042ui_story == nil then
				arg_109_1.var_.characterEffect10042ui_story = var_112_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_15 = 0.200000002980232

			if var_112_14 <= arg_109_1.time_ and arg_109_1.time_ < var_112_14 + var_112_15 then
				local var_112_16 = (arg_109_1.time_ - var_112_14) / var_112_15

				if arg_109_1.var_.characterEffect10042ui_story then
					arg_109_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_14 + var_112_15 and arg_109_1.time_ < var_112_14 + var_112_15 + arg_112_0 and arg_109_1.var_.characterEffect10042ui_story then
				arg_109_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_112_17 = 0

			if var_112_17 < arg_109_1.time_ and arg_109_1.time_ <= var_112_17 + arg_112_0 then
				arg_109_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action1_1")
			end

			local var_112_18 = 0

			if var_112_18 < arg_109_1.time_ and arg_109_1.time_ <= var_112_18 + arg_112_0 then
				arg_109_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_112_19 = arg_109_1.actors_["1184ui_story"].transform
			local var_112_20 = 0

			if var_112_20 < arg_109_1.time_ and arg_109_1.time_ <= var_112_20 + arg_112_0 then
				arg_109_1.var_.moveOldPos1184ui_story = var_112_19.localPosition
			end

			local var_112_21 = 0.001

			if var_112_20 <= arg_109_1.time_ and arg_109_1.time_ < var_112_20 + var_112_21 then
				local var_112_22 = (arg_109_1.time_ - var_112_20) / var_112_21
				local var_112_23 = Vector3.New(0.7, -0.97, -6)

				var_112_19.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1184ui_story, var_112_23, var_112_22)

				local var_112_24 = manager.ui.mainCamera.transform.position - var_112_19.position

				var_112_19.forward = Vector3.New(var_112_24.x, var_112_24.y, var_112_24.z)

				local var_112_25 = var_112_19.localEulerAngles

				var_112_25.z = 0
				var_112_25.x = 0
				var_112_19.localEulerAngles = var_112_25
			end

			if arg_109_1.time_ >= var_112_20 + var_112_21 and arg_109_1.time_ < var_112_20 + var_112_21 + arg_112_0 then
				var_112_19.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_112_26 = manager.ui.mainCamera.transform.position - var_112_19.position

				var_112_19.forward = Vector3.New(var_112_26.x, var_112_26.y, var_112_26.z)

				local var_112_27 = var_112_19.localEulerAngles

				var_112_27.z = 0
				var_112_27.x = 0
				var_112_19.localEulerAngles = var_112_27
			end

			local var_112_28 = arg_109_1.actors_["1184ui_story"]
			local var_112_29 = 0

			if var_112_29 < arg_109_1.time_ and arg_109_1.time_ <= var_112_29 + arg_112_0 and arg_109_1.var_.characterEffect1184ui_story == nil then
				arg_109_1.var_.characterEffect1184ui_story = var_112_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_30 = 0.200000002980232

			if var_112_29 <= arg_109_1.time_ and arg_109_1.time_ < var_112_29 + var_112_30 then
				local var_112_31 = (arg_109_1.time_ - var_112_29) / var_112_30

				if arg_109_1.var_.characterEffect1184ui_story then
					local var_112_32 = Mathf.Lerp(0, 0.5, var_112_31)

					arg_109_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1184ui_story.fillRatio = var_112_32
				end
			end

			if arg_109_1.time_ >= var_112_29 + var_112_30 and arg_109_1.time_ < var_112_29 + var_112_30 + arg_112_0 and arg_109_1.var_.characterEffect1184ui_story then
				local var_112_33 = 0.5

				arg_109_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1184ui_story.fillRatio = var_112_33
			end

			local var_112_34 = 0

			if var_112_34 < arg_109_1.time_ and arg_109_1.time_ <= var_112_34 + arg_112_0 then
				arg_109_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_112_35 = 0
			local var_112_36 = 0.65

			if var_112_35 < arg_109_1.time_ and arg_109_1.time_ <= var_112_35 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_37 = arg_109_1:FormatText(StoryNameCfg[388].name)

				arg_109_1.leftNameTxt_.text = var_112_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_38 = arg_109_1:GetWordFromCfg(121511028)
				local var_112_39 = arg_109_1:FormatText(var_112_38.content)

				arg_109_1.text_.text = var_112_39

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_40 = 26
				local var_112_41 = utf8.len(var_112_39)
				local var_112_42 = var_112_40 <= 0 and var_112_36 or var_112_36 * (var_112_41 / var_112_40)

				if var_112_42 > 0 and var_112_36 < var_112_42 then
					arg_109_1.talkMaxDuration = var_112_42

					if var_112_42 + var_112_35 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_42 + var_112_35
					end
				end

				arg_109_1.text_.text = var_112_39
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511028", "story_v_out_121511.awb") ~= 0 then
					local var_112_43 = manager.audio:GetVoiceLength("story_v_out_121511", "121511028", "story_v_out_121511.awb") / 1000

					if var_112_43 + var_112_35 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_43 + var_112_35
					end

					if var_112_38.prefab_name ~= "" and arg_109_1.actors_[var_112_38.prefab_name] ~= nil then
						local var_112_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_38.prefab_name].transform, "story_v_out_121511", "121511028", "story_v_out_121511.awb")

						arg_109_1:RecordAudio("121511028", var_112_44)
						arg_109_1:RecordAudio("121511028", var_112_44)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_121511", "121511028", "story_v_out_121511.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_121511", "121511028", "story_v_out_121511.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_45 = math.max(var_112_36, arg_109_1.talkMaxDuration)

			if var_112_35 <= arg_109_1.time_ and arg_109_1.time_ < var_112_35 + var_112_45 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_35) / var_112_45

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_35 + var_112_45 and arg_109_1.time_ < var_112_35 + var_112_45 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play121511029 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 121511029
		arg_113_1.duration_ = 8.666

		local var_113_0 = {
			ja = 8.666,
			ko = 2.9,
			zh = 2.9
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
				arg_113_0:Play121511030(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1184ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1184ui_story == nil then
				arg_113_1.var_.characterEffect1184ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1184ui_story then
					arg_113_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1184ui_story then
				arg_113_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_116_5 = arg_113_1.actors_["10042ui_story"]
			local var_116_6 = 0

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect10042ui_story == nil then
				arg_113_1.var_.characterEffect10042ui_story = var_116_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_7 = 0.200000002980232

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_7 then
				local var_116_8 = (arg_113_1.time_ - var_116_6) / var_116_7

				if arg_113_1.var_.characterEffect10042ui_story then
					local var_116_9 = Mathf.Lerp(0, 0.5, var_116_8)

					arg_113_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_113_1.var_.characterEffect10042ui_story.fillRatio = var_116_9
				end
			end

			if arg_113_1.time_ >= var_116_6 + var_116_7 and arg_113_1.time_ < var_116_6 + var_116_7 + arg_116_0 and arg_113_1.var_.characterEffect10042ui_story then
				local var_116_10 = 0.5

				arg_113_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_113_1.var_.characterEffect10042ui_story.fillRatio = var_116_10
			end

			local var_116_11 = 0
			local var_116_12 = 0.275

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_13 = arg_113_1:FormatText(StoryNameCfg[6].name)

				arg_113_1.leftNameTxt_.text = var_116_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_14 = arg_113_1:GetWordFromCfg(121511029)
				local var_116_15 = arg_113_1:FormatText(var_116_14.content)

				arg_113_1.text_.text = var_116_15

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_16 = 11
				local var_116_17 = utf8.len(var_116_15)
				local var_116_18 = var_116_16 <= 0 and var_116_12 or var_116_12 * (var_116_17 / var_116_16)

				if var_116_18 > 0 and var_116_12 < var_116_18 then
					arg_113_1.talkMaxDuration = var_116_18

					if var_116_18 + var_116_11 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_18 + var_116_11
					end
				end

				arg_113_1.text_.text = var_116_15
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511029", "story_v_out_121511.awb") ~= 0 then
					local var_116_19 = manager.audio:GetVoiceLength("story_v_out_121511", "121511029", "story_v_out_121511.awb") / 1000

					if var_116_19 + var_116_11 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_11
					end

					if var_116_14.prefab_name ~= "" and arg_113_1.actors_[var_116_14.prefab_name] ~= nil then
						local var_116_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_14.prefab_name].transform, "story_v_out_121511", "121511029", "story_v_out_121511.awb")

						arg_113_1:RecordAudio("121511029", var_116_20)
						arg_113_1:RecordAudio("121511029", var_116_20)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_121511", "121511029", "story_v_out_121511.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_121511", "121511029", "story_v_out_121511.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_21 = math.max(var_116_12, arg_113_1.talkMaxDuration)

			if var_116_11 <= arg_113_1.time_ and arg_113_1.time_ < var_116_11 + var_116_21 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_11) / var_116_21

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_11 + var_116_21 and arg_113_1.time_ < var_116_11 + var_116_21 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play121511030 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 121511030
		arg_117_1.duration_ = 6.066

		local var_117_0 = {
			ja = 3.733,
			ko = 6.066,
			zh = 6.066
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
				arg_117_0:Play121511031(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10042ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect10042ui_story == nil then
				arg_117_1.var_.characterEffect10042ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect10042ui_story then
					arg_117_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect10042ui_story then
				arg_117_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["1184ui_story"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect1184ui_story == nil then
				arg_117_1.var_.characterEffect1184ui_story = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.200000002980232

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect1184ui_story then
					local var_120_8 = Mathf.Lerp(0, 0.5, var_120_7)

					arg_117_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1184ui_story.fillRatio = var_120_8
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect1184ui_story then
				local var_120_9 = 0.5

				arg_117_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1184ui_story.fillRatio = var_120_9
			end

			local var_120_10 = 0
			local var_120_11 = 0.675

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_12 = arg_117_1:FormatText(StoryNameCfg[388].name)

				arg_117_1.leftNameTxt_.text = var_120_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_13 = arg_117_1:GetWordFromCfg(121511030)
				local var_120_14 = arg_117_1:FormatText(var_120_13.content)

				arg_117_1.text_.text = var_120_14

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_15 = 27
				local var_120_16 = utf8.len(var_120_14)
				local var_120_17 = var_120_15 <= 0 and var_120_11 or var_120_11 * (var_120_16 / var_120_15)

				if var_120_17 > 0 and var_120_11 < var_120_17 then
					arg_117_1.talkMaxDuration = var_120_17

					if var_120_17 + var_120_10 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_17 + var_120_10
					end
				end

				arg_117_1.text_.text = var_120_14
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511030", "story_v_out_121511.awb") ~= 0 then
					local var_120_18 = manager.audio:GetVoiceLength("story_v_out_121511", "121511030", "story_v_out_121511.awb") / 1000

					if var_120_18 + var_120_10 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_18 + var_120_10
					end

					if var_120_13.prefab_name ~= "" and arg_117_1.actors_[var_120_13.prefab_name] ~= nil then
						local var_120_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_13.prefab_name].transform, "story_v_out_121511", "121511030", "story_v_out_121511.awb")

						arg_117_1:RecordAudio("121511030", var_120_19)
						arg_117_1:RecordAudio("121511030", var_120_19)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_121511", "121511030", "story_v_out_121511.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_121511", "121511030", "story_v_out_121511.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_20 = math.max(var_120_11, arg_117_1.talkMaxDuration)

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_20 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_10) / var_120_20

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_10 + var_120_20 and arg_117_1.time_ < var_120_10 + var_120_20 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play121511031 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 121511031
		arg_121_1.duration_ = 2.033

		local var_121_0 = {
			ja = 1.999999999999,
			ko = 2.033,
			zh = 2.033
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
				arg_121_0:Play121511032(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1184ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1184ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, 100, 0)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1184ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, 100, 0)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1184ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1184ui_story == nil then
				arg_121_1.var_.characterEffect1184ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1184ui_story then
					local var_124_13 = Mathf.Lerp(0, 0.5, var_124_12)

					arg_121_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1184ui_story.fillRatio = var_124_13
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect1184ui_story then
				local var_124_14 = 0.5

				arg_121_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1184ui_story.fillRatio = var_124_14
			end

			local var_124_15 = arg_121_1.actors_["1075ui_story"].transform
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.var_.moveOldPos1075ui_story = var_124_15.localPosition
			end

			local var_124_17 = 0.001

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Vector3.New(0.7, -1.055, -6.16)

				var_124_15.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1075ui_story, var_124_19, var_124_18)

				local var_124_20 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_20.x, var_124_20.y, var_124_20.z)

				local var_124_21 = var_124_15.localEulerAngles

				var_124_21.z = 0
				var_124_21.x = 0
				var_124_15.localEulerAngles = var_124_21
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 then
				var_124_15.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_124_22 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_22.x, var_124_22.y, var_124_22.z)

				local var_124_23 = var_124_15.localEulerAngles

				var_124_23.z = 0
				var_124_23.x = 0
				var_124_15.localEulerAngles = var_124_23
			end

			local var_124_24 = arg_121_1.actors_["1075ui_story"]
			local var_124_25 = 0

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 and arg_121_1.var_.characterEffect1075ui_story == nil then
				arg_121_1.var_.characterEffect1075ui_story = var_124_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_26 = 0.200000002980232

			if var_124_25 <= arg_121_1.time_ and arg_121_1.time_ < var_124_25 + var_124_26 then
				local var_124_27 = (arg_121_1.time_ - var_124_25) / var_124_26

				if arg_121_1.var_.characterEffect1075ui_story then
					arg_121_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_25 + var_124_26 and arg_121_1.time_ < var_124_25 + var_124_26 + arg_124_0 and arg_121_1.var_.characterEffect1075ui_story then
				arg_121_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_124_28 = 0

			if var_124_28 < arg_121_1.time_ and arg_121_1.time_ <= var_124_28 + arg_124_0 then
				arg_121_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_124_29 = 0

			if var_124_29 < arg_121_1.time_ and arg_121_1.time_ <= var_124_29 + arg_124_0 then
				arg_121_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_124_30 = arg_121_1.actors_["10042ui_story"]
			local var_124_31 = 0

			if var_124_31 < arg_121_1.time_ and arg_121_1.time_ <= var_124_31 + arg_124_0 and arg_121_1.var_.characterEffect10042ui_story == nil then
				arg_121_1.var_.characterEffect10042ui_story = var_124_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_32 = 0.200000002980232

			if var_124_31 <= arg_121_1.time_ and arg_121_1.time_ < var_124_31 + var_124_32 then
				local var_124_33 = (arg_121_1.time_ - var_124_31) / var_124_32

				if arg_121_1.var_.characterEffect10042ui_story then
					local var_124_34 = Mathf.Lerp(0, 0.5, var_124_33)

					arg_121_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10042ui_story.fillRatio = var_124_34
				end
			end

			if arg_121_1.time_ >= var_124_31 + var_124_32 and arg_121_1.time_ < var_124_31 + var_124_32 + arg_124_0 and arg_121_1.var_.characterEffect10042ui_story then
				local var_124_35 = 0.5

				arg_121_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10042ui_story.fillRatio = var_124_35
			end

			local var_124_36 = 0
			local var_124_37 = 0.25

			if var_124_36 < arg_121_1.time_ and arg_121_1.time_ <= var_124_36 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_38 = arg_121_1:FormatText(StoryNameCfg[381].name)

				arg_121_1.leftNameTxt_.text = var_124_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_39 = arg_121_1:GetWordFromCfg(121511031)
				local var_124_40 = arg_121_1:FormatText(var_124_39.content)

				arg_121_1.text_.text = var_124_40

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_41 = 10
				local var_124_42 = utf8.len(var_124_40)
				local var_124_43 = var_124_41 <= 0 and var_124_37 or var_124_37 * (var_124_42 / var_124_41)

				if var_124_43 > 0 and var_124_37 < var_124_43 then
					arg_121_1.talkMaxDuration = var_124_43

					if var_124_43 + var_124_36 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_43 + var_124_36
					end
				end

				arg_121_1.text_.text = var_124_40
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511031", "story_v_out_121511.awb") ~= 0 then
					local var_124_44 = manager.audio:GetVoiceLength("story_v_out_121511", "121511031", "story_v_out_121511.awb") / 1000

					if var_124_44 + var_124_36 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_44 + var_124_36
					end

					if var_124_39.prefab_name ~= "" and arg_121_1.actors_[var_124_39.prefab_name] ~= nil then
						local var_124_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_39.prefab_name].transform, "story_v_out_121511", "121511031", "story_v_out_121511.awb")

						arg_121_1:RecordAudio("121511031", var_124_45)
						arg_121_1:RecordAudio("121511031", var_124_45)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_121511", "121511031", "story_v_out_121511.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_121511", "121511031", "story_v_out_121511.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_46 = math.max(var_124_37, arg_121_1.talkMaxDuration)

			if var_124_36 <= arg_121_1.time_ and arg_121_1.time_ < var_124_36 + var_124_46 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_36) / var_124_46

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_36 + var_124_46 and arg_121_1.time_ < var_124_36 + var_124_46 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play121511032 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 121511032
		arg_125_1.duration_ = 7.466

		local var_125_0 = {
			ja = 6.166,
			ko = 7.466,
			zh = 7.466
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
				arg_125_0:Play121511033(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10042ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect10042ui_story == nil then
				arg_125_1.var_.characterEffect10042ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect10042ui_story then
					arg_125_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10042ui_story then
				arg_125_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_128_4 = 0

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				arg_125_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action3_1")
			end

			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_6 = arg_125_1.actors_["1075ui_story"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect1075ui_story == nil then
				arg_125_1.var_.characterEffect1075ui_story = var_128_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_8 = 0.200000002980232

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.characterEffect1075ui_story then
					local var_128_10 = Mathf.Lerp(0, 0.5, var_128_9)

					arg_125_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1075ui_story.fillRatio = var_128_10
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.characterEffect1075ui_story then
				local var_128_11 = 0.5

				arg_125_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1075ui_story.fillRatio = var_128_11
			end

			local var_128_12 = 0
			local var_128_13 = 0.65

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_14 = arg_125_1:FormatText(StoryNameCfg[388].name)

				arg_125_1.leftNameTxt_.text = var_128_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_15 = arg_125_1:GetWordFromCfg(121511032)
				local var_128_16 = arg_125_1:FormatText(var_128_15.content)

				arg_125_1.text_.text = var_128_16

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_17 = 26
				local var_128_18 = utf8.len(var_128_16)
				local var_128_19 = var_128_17 <= 0 and var_128_13 or var_128_13 * (var_128_18 / var_128_17)

				if var_128_19 > 0 and var_128_13 < var_128_19 then
					arg_125_1.talkMaxDuration = var_128_19

					if var_128_19 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_19 + var_128_12
					end
				end

				arg_125_1.text_.text = var_128_16
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511032", "story_v_out_121511.awb") ~= 0 then
					local var_128_20 = manager.audio:GetVoiceLength("story_v_out_121511", "121511032", "story_v_out_121511.awb") / 1000

					if var_128_20 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_12
					end

					if var_128_15.prefab_name ~= "" and arg_125_1.actors_[var_128_15.prefab_name] ~= nil then
						local var_128_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_15.prefab_name].transform, "story_v_out_121511", "121511032", "story_v_out_121511.awb")

						arg_125_1:RecordAudio("121511032", var_128_21)
						arg_125_1:RecordAudio("121511032", var_128_21)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_121511", "121511032", "story_v_out_121511.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_121511", "121511032", "story_v_out_121511.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_22 = math.max(var_128_13, arg_125_1.talkMaxDuration)

			if var_128_12 <= arg_125_1.time_ and arg_125_1.time_ < var_128_12 + var_128_22 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_12) / var_128_22

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_12 + var_128_22 and arg_125_1.time_ < var_128_12 + var_128_22 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play121511033 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 121511033
		arg_129_1.duration_ = 5.8

		local var_129_0 = {
			ja = 5.8,
			ko = 3.733,
			zh = 3.733
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
				arg_129_0:Play121511034(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1075ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1075ui_story == nil then
				arg_129_1.var_.characterEffect1075ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1075ui_story then
					arg_129_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1075ui_story then
				arg_129_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_132_4 = 0

			if var_132_4 < arg_129_1.time_ and arg_129_1.time_ <= var_132_4 + arg_132_0 then
				arg_129_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 then
				arg_129_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_6 = arg_129_1.actors_["10042ui_story"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and arg_129_1.var_.characterEffect10042ui_story == nil then
				arg_129_1.var_.characterEffect10042ui_story = var_132_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_8 = 0.200000002980232

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.characterEffect10042ui_story then
					local var_132_10 = Mathf.Lerp(0, 0.5, var_132_9)

					arg_129_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_129_1.var_.characterEffect10042ui_story.fillRatio = var_132_10
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and arg_129_1.var_.characterEffect10042ui_story then
				local var_132_11 = 0.5

				arg_129_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_129_1.var_.characterEffect10042ui_story.fillRatio = var_132_11
			end

			local var_132_12 = 0
			local var_132_13 = 0.45

			if var_132_12 < arg_129_1.time_ and arg_129_1.time_ <= var_132_12 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_14 = arg_129_1:FormatText(StoryNameCfg[381].name)

				arg_129_1.leftNameTxt_.text = var_132_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_15 = arg_129_1:GetWordFromCfg(121511033)
				local var_132_16 = arg_129_1:FormatText(var_132_15.content)

				arg_129_1.text_.text = var_132_16

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_17 = 18
				local var_132_18 = utf8.len(var_132_16)
				local var_132_19 = var_132_17 <= 0 and var_132_13 or var_132_13 * (var_132_18 / var_132_17)

				if var_132_19 > 0 and var_132_13 < var_132_19 then
					arg_129_1.talkMaxDuration = var_132_19

					if var_132_19 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_19 + var_132_12
					end
				end

				arg_129_1.text_.text = var_132_16
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511033", "story_v_out_121511.awb") ~= 0 then
					local var_132_20 = manager.audio:GetVoiceLength("story_v_out_121511", "121511033", "story_v_out_121511.awb") / 1000

					if var_132_20 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_20 + var_132_12
					end

					if var_132_15.prefab_name ~= "" and arg_129_1.actors_[var_132_15.prefab_name] ~= nil then
						local var_132_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_15.prefab_name].transform, "story_v_out_121511", "121511033", "story_v_out_121511.awb")

						arg_129_1:RecordAudio("121511033", var_132_21)
						arg_129_1:RecordAudio("121511033", var_132_21)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_121511", "121511033", "story_v_out_121511.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_121511", "121511033", "story_v_out_121511.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_22 = math.max(var_132_13, arg_129_1.talkMaxDuration)

			if var_132_12 <= arg_129_1.time_ and arg_129_1.time_ < var_132_12 + var_132_22 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_12) / var_132_22

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_12 + var_132_22 and arg_129_1.time_ < var_132_12 + var_132_22 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play121511034 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 121511034
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play121511035(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1075ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1075ui_story == nil then
				arg_133_1.var_.characterEffect1075ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1075ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1075ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1075ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1075ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.633333333333333

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				local var_136_8 = "play"
				local var_136_9 = "effect"

				arg_133_1:AudioAction(var_136_8, var_136_9, "se_story_121_04", "se_story_121_04_scan", "")
			end

			local var_136_10 = 0
			local var_136_11 = 1.4

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_12 = arg_133_1:GetWordFromCfg(121511034)
				local var_136_13 = arg_133_1:FormatText(var_136_12.content)

				arg_133_1.text_.text = var_136_13

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_14 = 56
				local var_136_15 = utf8.len(var_136_13)
				local var_136_16 = var_136_14 <= 0 and var_136_11 or var_136_11 * (var_136_15 / var_136_14)

				if var_136_16 > 0 and var_136_11 < var_136_16 then
					arg_133_1.talkMaxDuration = var_136_16

					if var_136_16 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_16 + var_136_10
					end
				end

				arg_133_1.text_.text = var_136_13
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_17 = math.max(var_136_11, arg_133_1.talkMaxDuration)

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_17 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_10) / var_136_17

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_10 + var_136_17 and arg_133_1.time_ < var_136_10 + var_136_17 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play121511035 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 121511035
		arg_137_1.duration_ = 10.733

		local var_137_0 = {
			ja = 10.733,
			ko = 8.233,
			zh = 8.233
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
				arg_137_0:Play121511036(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10042ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect10042ui_story == nil then
				arg_137_1.var_.characterEffect10042ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect10042ui_story then
					arg_137_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect10042ui_story then
				arg_137_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action3_2")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_6 = 0

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_2")
			end

			local var_140_7 = 0
			local var_140_8 = 1.125

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_9 = arg_137_1:FormatText(StoryNameCfg[388].name)

				arg_137_1.leftNameTxt_.text = var_140_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_10 = arg_137_1:GetWordFromCfg(121511035)
				local var_140_11 = arg_137_1:FormatText(var_140_10.content)

				arg_137_1.text_.text = var_140_11

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_12 = 45
				local var_140_13 = utf8.len(var_140_11)
				local var_140_14 = var_140_12 <= 0 and var_140_8 or var_140_8 * (var_140_13 / var_140_12)

				if var_140_14 > 0 and var_140_8 < var_140_14 then
					arg_137_1.talkMaxDuration = var_140_14

					if var_140_14 + var_140_7 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_7
					end
				end

				arg_137_1.text_.text = var_140_11
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511035", "story_v_out_121511.awb") ~= 0 then
					local var_140_15 = manager.audio:GetVoiceLength("story_v_out_121511", "121511035", "story_v_out_121511.awb") / 1000

					if var_140_15 + var_140_7 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_15 + var_140_7
					end

					if var_140_10.prefab_name ~= "" and arg_137_1.actors_[var_140_10.prefab_name] ~= nil then
						local var_140_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_10.prefab_name].transform, "story_v_out_121511", "121511035", "story_v_out_121511.awb")

						arg_137_1:RecordAudio("121511035", var_140_16)
						arg_137_1:RecordAudio("121511035", var_140_16)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_121511", "121511035", "story_v_out_121511.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_121511", "121511035", "story_v_out_121511.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_17 = math.max(var_140_8, arg_137_1.talkMaxDuration)

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_17 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_7) / var_140_17

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_7 + var_140_17 and arg_137_1.time_ < var_140_7 + var_140_17 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play121511036 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 121511036
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play121511037(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10042ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect10042ui_story == nil then
				arg_141_1.var_.characterEffect10042ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect10042ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_141_1.var_.characterEffect10042ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect10042ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_141_1.var_.characterEffect10042ui_story.fillRatio = var_144_5
			end

			local var_144_6 = 0
			local var_144_7 = 0.325

			if var_144_6 < arg_141_1.time_ and arg_141_1.time_ <= var_144_6 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_8 = arg_141_1:FormatText(StoryNameCfg[7].name)

				arg_141_1.leftNameTxt_.text = var_144_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_9 = arg_141_1:GetWordFromCfg(121511036)
				local var_144_10 = arg_141_1:FormatText(var_144_9.content)

				arg_141_1.text_.text = var_144_10

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_11 = 13
				local var_144_12 = utf8.len(var_144_10)
				local var_144_13 = var_144_11 <= 0 and var_144_7 or var_144_7 * (var_144_12 / var_144_11)

				if var_144_13 > 0 and var_144_7 < var_144_13 then
					arg_141_1.talkMaxDuration = var_144_13

					if var_144_13 + var_144_6 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_13 + var_144_6
					end
				end

				arg_141_1.text_.text = var_144_10
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_14 = math.max(var_144_7, arg_141_1.talkMaxDuration)

			if var_144_6 <= arg_141_1.time_ and arg_141_1.time_ < var_144_6 + var_144_14 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_6) / var_144_14

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_6 + var_144_14 and arg_141_1.time_ < var_144_6 + var_144_14 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play121511037 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 121511037
		arg_145_1.duration_ = 6.633

		local var_145_0 = {
			ja = 6.633,
			ko = 3.2,
			zh = 3.2
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
				arg_145_0:Play121511038(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10042ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect10042ui_story == nil then
				arg_145_1.var_.characterEffect10042ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect10042ui_story then
					arg_145_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect10042ui_story then
				arg_145_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_148_4 = 0
			local var_148_5 = 0.4

			if var_148_4 < arg_145_1.time_ and arg_145_1.time_ <= var_148_4 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_6 = arg_145_1:FormatText(StoryNameCfg[388].name)

				arg_145_1.leftNameTxt_.text = var_148_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_7 = arg_145_1:GetWordFromCfg(121511037)
				local var_148_8 = arg_145_1:FormatText(var_148_7.content)

				arg_145_1.text_.text = var_148_8

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_9 = 16
				local var_148_10 = utf8.len(var_148_8)
				local var_148_11 = var_148_9 <= 0 and var_148_5 or var_148_5 * (var_148_10 / var_148_9)

				if var_148_11 > 0 and var_148_5 < var_148_11 then
					arg_145_1.talkMaxDuration = var_148_11

					if var_148_11 + var_148_4 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_11 + var_148_4
					end
				end

				arg_145_1.text_.text = var_148_8
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511037", "story_v_out_121511.awb") ~= 0 then
					local var_148_12 = manager.audio:GetVoiceLength("story_v_out_121511", "121511037", "story_v_out_121511.awb") / 1000

					if var_148_12 + var_148_4 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_12 + var_148_4
					end

					if var_148_7.prefab_name ~= "" and arg_145_1.actors_[var_148_7.prefab_name] ~= nil then
						local var_148_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_7.prefab_name].transform, "story_v_out_121511", "121511037", "story_v_out_121511.awb")

						arg_145_1:RecordAudio("121511037", var_148_13)
						arg_145_1:RecordAudio("121511037", var_148_13)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_121511", "121511037", "story_v_out_121511.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_121511", "121511037", "story_v_out_121511.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_14 = math.max(var_148_5, arg_145_1.talkMaxDuration)

			if var_148_4 <= arg_145_1.time_ and arg_145_1.time_ < var_148_4 + var_148_14 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_4) / var_148_14

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_4 + var_148_14 and arg_145_1.time_ < var_148_4 + var_148_14 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play121511038 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 121511038
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play121511039(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10042ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect10042ui_story == nil then
				arg_149_1.var_.characterEffect10042ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect10042ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_149_1.var_.characterEffect10042ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect10042ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_149_1.var_.characterEffect10042ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 0.725

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_8 = arg_149_1:FormatText(StoryNameCfg[7].name)

				arg_149_1.leftNameTxt_.text = var_152_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_9 = arg_149_1:GetWordFromCfg(121511038)
				local var_152_10 = arg_149_1:FormatText(var_152_9.content)

				arg_149_1.text_.text = var_152_10

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_11 = 29
				local var_152_12 = utf8.len(var_152_10)
				local var_152_13 = var_152_11 <= 0 and var_152_7 or var_152_7 * (var_152_12 / var_152_11)

				if var_152_13 > 0 and var_152_7 < var_152_13 then
					arg_149_1.talkMaxDuration = var_152_13

					if var_152_13 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_13 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_10
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_14 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_14 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_14

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_14 and arg_149_1.time_ < var_152_6 + var_152_14 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play121511039 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 121511039
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play121511040(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1.325

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[7].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(121511039)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 53
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
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_8 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_8 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_8

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_8 and arg_153_1.time_ < var_156_0 + var_156_8 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play121511040 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 121511040
		arg_157_1.duration_ = 6.333

		local var_157_0 = {
			ja = 6.333,
			ko = 4.033,
			zh = 4.033
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
				arg_157_0:Play121511041(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10042ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect10042ui_story == nil then
				arg_157_1.var_.characterEffect10042ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect10042ui_story then
					arg_157_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect10042ui_story then
				arg_157_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_160_4 = 0
			local var_160_5 = 0.5

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_6 = arg_157_1:FormatText(StoryNameCfg[388].name)

				arg_157_1.leftNameTxt_.text = var_160_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_7 = arg_157_1:GetWordFromCfg(121511040)
				local var_160_8 = arg_157_1:FormatText(var_160_7.content)

				arg_157_1.text_.text = var_160_8

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_9 = 20
				local var_160_10 = utf8.len(var_160_8)
				local var_160_11 = var_160_9 <= 0 and var_160_5 or var_160_5 * (var_160_10 / var_160_9)

				if var_160_11 > 0 and var_160_5 < var_160_11 then
					arg_157_1.talkMaxDuration = var_160_11

					if var_160_11 + var_160_4 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_11 + var_160_4
					end
				end

				arg_157_1.text_.text = var_160_8
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511040", "story_v_out_121511.awb") ~= 0 then
					local var_160_12 = manager.audio:GetVoiceLength("story_v_out_121511", "121511040", "story_v_out_121511.awb") / 1000

					if var_160_12 + var_160_4 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_12 + var_160_4
					end

					if var_160_7.prefab_name ~= "" and arg_157_1.actors_[var_160_7.prefab_name] ~= nil then
						local var_160_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_7.prefab_name].transform, "story_v_out_121511", "121511040", "story_v_out_121511.awb")

						arg_157_1:RecordAudio("121511040", var_160_13)
						arg_157_1:RecordAudio("121511040", var_160_13)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_121511", "121511040", "story_v_out_121511.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_121511", "121511040", "story_v_out_121511.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_14 = math.max(var_160_5, arg_157_1.talkMaxDuration)

			if var_160_4 <= arg_157_1.time_ and arg_157_1.time_ < var_160_4 + var_160_14 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_4) / var_160_14

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_4 + var_160_14 and arg_157_1.time_ < var_160_4 + var_160_14 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play121511041 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 121511041
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play121511042(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10042ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect10042ui_story == nil then
				arg_161_1.var_.characterEffect10042ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect10042ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_161_1.var_.characterEffect10042ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect10042ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_161_1.var_.characterEffect10042ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 0.9

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_8 = arg_161_1:FormatText(StoryNameCfg[7].name)

				arg_161_1.leftNameTxt_.text = var_164_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_9 = arg_161_1:GetWordFromCfg(121511041)
				local var_164_10 = arg_161_1:FormatText(var_164_9.content)

				arg_161_1.text_.text = var_164_10

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_11 = 36
				local var_164_12 = utf8.len(var_164_10)
				local var_164_13 = var_164_11 <= 0 and var_164_7 or var_164_7 * (var_164_12 / var_164_11)

				if var_164_13 > 0 and var_164_7 < var_164_13 then
					arg_161_1.talkMaxDuration = var_164_13

					if var_164_13 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_13 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_10
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_14 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_14 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_14

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_14 and arg_161_1.time_ < var_164_6 + var_164_14 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play121511042 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 121511042
		arg_165_1.duration_ = 4.333

		local var_165_0 = {
			ja = 3.633,
			ko = 4.333,
			zh = 4.333
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
				arg_165_0:Play121511043(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10042ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect10042ui_story == nil then
				arg_165_1.var_.characterEffect10042ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect10042ui_story then
					arg_165_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect10042ui_story then
				arg_165_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_168_4 = 0
			local var_168_5 = 0.375

			if var_168_4 < arg_165_1.time_ and arg_165_1.time_ <= var_168_4 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_6 = arg_165_1:FormatText(StoryNameCfg[388].name)

				arg_165_1.leftNameTxt_.text = var_168_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_7 = arg_165_1:GetWordFromCfg(121511042)
				local var_168_8 = arg_165_1:FormatText(var_168_7.content)

				arg_165_1.text_.text = var_168_8

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_9 = 15
				local var_168_10 = utf8.len(var_168_8)
				local var_168_11 = var_168_9 <= 0 and var_168_5 or var_168_5 * (var_168_10 / var_168_9)

				if var_168_11 > 0 and var_168_5 < var_168_11 then
					arg_165_1.talkMaxDuration = var_168_11

					if var_168_11 + var_168_4 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_11 + var_168_4
					end
				end

				arg_165_1.text_.text = var_168_8
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511042", "story_v_out_121511.awb") ~= 0 then
					local var_168_12 = manager.audio:GetVoiceLength("story_v_out_121511", "121511042", "story_v_out_121511.awb") / 1000

					if var_168_12 + var_168_4 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_12 + var_168_4
					end

					if var_168_7.prefab_name ~= "" and arg_165_1.actors_[var_168_7.prefab_name] ~= nil then
						local var_168_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_7.prefab_name].transform, "story_v_out_121511", "121511042", "story_v_out_121511.awb")

						arg_165_1:RecordAudio("121511042", var_168_13)
						arg_165_1:RecordAudio("121511042", var_168_13)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_121511", "121511042", "story_v_out_121511.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_121511", "121511042", "story_v_out_121511.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_14 = math.max(var_168_5, arg_165_1.talkMaxDuration)

			if var_168_4 <= arg_165_1.time_ and arg_165_1.time_ < var_168_4 + var_168_14 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_4) / var_168_14

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_4 + var_168_14 and arg_165_1.time_ < var_168_4 + var_168_14 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play121511043 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 121511043
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play121511044(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10042ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos10042ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, 100, 0)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10042ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, 100, 0)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["10042ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect10042ui_story == nil then
				arg_169_1.var_.characterEffect10042ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect10042ui_story then
					local var_172_13 = Mathf.Lerp(0, 0.5, var_172_12)

					arg_169_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_169_1.var_.characterEffect10042ui_story.fillRatio = var_172_13
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect10042ui_story then
				local var_172_14 = 0.5

				arg_169_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_169_1.var_.characterEffect10042ui_story.fillRatio = var_172_14
			end

			local var_172_15 = arg_169_1.actors_["1075ui_story"].transform
			local var_172_16 = 0

			if var_172_16 < arg_169_1.time_ and arg_169_1.time_ <= var_172_16 + arg_172_0 then
				arg_169_1.var_.moveOldPos1075ui_story = var_172_15.localPosition
			end

			local var_172_17 = 0.001

			if var_172_16 <= arg_169_1.time_ and arg_169_1.time_ < var_172_16 + var_172_17 then
				local var_172_18 = (arg_169_1.time_ - var_172_16) / var_172_17
				local var_172_19 = Vector3.New(0, 100, 0)

				var_172_15.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1075ui_story, var_172_19, var_172_18)

				local var_172_20 = manager.ui.mainCamera.transform.position - var_172_15.position

				var_172_15.forward = Vector3.New(var_172_20.x, var_172_20.y, var_172_20.z)

				local var_172_21 = var_172_15.localEulerAngles

				var_172_21.z = 0
				var_172_21.x = 0
				var_172_15.localEulerAngles = var_172_21
			end

			if arg_169_1.time_ >= var_172_16 + var_172_17 and arg_169_1.time_ < var_172_16 + var_172_17 + arg_172_0 then
				var_172_15.localPosition = Vector3.New(0, 100, 0)

				local var_172_22 = manager.ui.mainCamera.transform.position - var_172_15.position

				var_172_15.forward = Vector3.New(var_172_22.x, var_172_22.y, var_172_22.z)

				local var_172_23 = var_172_15.localEulerAngles

				var_172_23.z = 0
				var_172_23.x = 0
				var_172_15.localEulerAngles = var_172_23
			end

			local var_172_24 = 0
			local var_172_25 = 0.45

			if var_172_24 < arg_169_1.time_ and arg_169_1.time_ <= var_172_24 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_26 = arg_169_1:FormatText(StoryNameCfg[7].name)

				arg_169_1.leftNameTxt_.text = var_172_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_27 = arg_169_1:GetWordFromCfg(121511043)
				local var_172_28 = arg_169_1:FormatText(var_172_27.content)

				arg_169_1.text_.text = var_172_28

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_29 = 18
				local var_172_30 = utf8.len(var_172_28)
				local var_172_31 = var_172_29 <= 0 and var_172_25 or var_172_25 * (var_172_30 / var_172_29)

				if var_172_31 > 0 and var_172_25 < var_172_31 then
					arg_169_1.talkMaxDuration = var_172_31

					if var_172_31 + var_172_24 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_31 + var_172_24
					end
				end

				arg_169_1.text_.text = var_172_28
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_32 = math.max(var_172_25, arg_169_1.talkMaxDuration)

			if var_172_24 <= arg_169_1.time_ and arg_169_1.time_ < var_172_24 + var_172_32 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_24) / var_172_32

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_24 + var_172_32 and arg_169_1.time_ < var_172_24 + var_172_32 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play121511044 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 121511044
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play121511045(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 1.225

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_2 = arg_173_1:GetWordFromCfg(121511044)
				local var_176_3 = arg_173_1:FormatText(var_176_2.content)

				arg_173_1.text_.text = var_176_3

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_4 = 49
				local var_176_5 = utf8.len(var_176_3)
				local var_176_6 = var_176_4 <= 0 and var_176_1 or var_176_1 * (var_176_5 / var_176_4)

				if var_176_6 > 0 and var_176_1 < var_176_6 then
					arg_173_1.talkMaxDuration = var_176_6

					if var_176_6 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_6 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_3
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_7 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_7 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_7

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_7 and arg_173_1.time_ < var_176_0 + var_176_7 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play121511045 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 121511045
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play121511046(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.775

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_2 = arg_177_1:GetWordFromCfg(121511045)
				local var_180_3 = arg_177_1:FormatText(var_180_2.content)

				arg_177_1.text_.text = var_180_3

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_4 = 31
				local var_180_5 = utf8.len(var_180_3)
				local var_180_6 = var_180_4 <= 0 and var_180_1 or var_180_1 * (var_180_5 / var_180_4)

				if var_180_6 > 0 and var_180_1 < var_180_6 then
					arg_177_1.talkMaxDuration = var_180_6

					if var_180_6 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_6 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_3
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_7 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_7 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_7

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_7 and arg_177_1.time_ < var_180_0 + var_180_7 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play121511046 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 121511046
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play121511047(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.125

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[7].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(121511046)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 5
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
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_8 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_8 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_8

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_8 and arg_181_1.time_ < var_184_0 + var_184_8 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play121511047 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 121511047
		arg_185_1.duration_ = 8.8

		local var_185_0 = {
			ja = 8.8,
			ko = 8.633,
			zh = 8.633
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
				arg_185_0:Play121511048(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1184ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1184ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0, -0.97, -6)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1184ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["1184ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect1184ui_story == nil then
				arg_185_1.var_.characterEffect1184ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect1184ui_story then
					arg_185_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect1184ui_story then
				arg_185_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_188_15 = 0
			local var_188_16 = 0.9

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_17 = arg_185_1:FormatText(StoryNameCfg[6].name)

				arg_185_1.leftNameTxt_.text = var_188_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_18 = arg_185_1:GetWordFromCfg(121511047)
				local var_188_19 = arg_185_1:FormatText(var_188_18.content)

				arg_185_1.text_.text = var_188_19

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_20 = 36
				local var_188_21 = utf8.len(var_188_19)
				local var_188_22 = var_188_20 <= 0 and var_188_16 or var_188_16 * (var_188_21 / var_188_20)

				if var_188_22 > 0 and var_188_16 < var_188_22 then
					arg_185_1.talkMaxDuration = var_188_22

					if var_188_22 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_22 + var_188_15
					end
				end

				arg_185_1.text_.text = var_188_19
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511047", "story_v_out_121511.awb") ~= 0 then
					local var_188_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511047", "story_v_out_121511.awb") / 1000

					if var_188_23 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_23 + var_188_15
					end

					if var_188_18.prefab_name ~= "" and arg_185_1.actors_[var_188_18.prefab_name] ~= nil then
						local var_188_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_18.prefab_name].transform, "story_v_out_121511", "121511047", "story_v_out_121511.awb")

						arg_185_1:RecordAudio("121511047", var_188_24)
						arg_185_1:RecordAudio("121511047", var_188_24)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_121511", "121511047", "story_v_out_121511.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_121511", "121511047", "story_v_out_121511.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_25 = math.max(var_188_16, arg_185_1.talkMaxDuration)

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_25 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_15) / var_188_25

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_15 + var_188_25 and arg_185_1.time_ < var_188_15 + var_188_25 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play121511048 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 121511048
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play121511049(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1184ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1184ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, 100, 0)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1184ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(0, 100, 0)

				local var_192_7 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_7.x, var_192_7.y, var_192_7.z)

				local var_192_8 = var_192_0.localEulerAngles

				var_192_8.z = 0
				var_192_8.x = 0
				var_192_0.localEulerAngles = var_192_8
			end

			local var_192_9 = arg_189_1.actors_["1184ui_story"]
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 and arg_189_1.var_.characterEffect1184ui_story == nil then
				arg_189_1.var_.characterEffect1184ui_story = var_192_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_11 = 0.200000002980232

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11

				if arg_189_1.var_.characterEffect1184ui_story then
					local var_192_13 = Mathf.Lerp(0, 0.5, var_192_12)

					arg_189_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1184ui_story.fillRatio = var_192_13
				end
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 and arg_189_1.var_.characterEffect1184ui_story then
				local var_192_14 = 0.5

				arg_189_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1184ui_story.fillRatio = var_192_14
			end

			local var_192_15 = 0
			local var_192_16 = 1.25

			if var_192_15 < arg_189_1.time_ and arg_189_1.time_ <= var_192_15 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_17 = arg_189_1:GetWordFromCfg(121511048)
				local var_192_18 = arg_189_1:FormatText(var_192_17.content)

				arg_189_1.text_.text = var_192_18

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_19 = 50
				local var_192_20 = utf8.len(var_192_18)
				local var_192_21 = var_192_19 <= 0 and var_192_16 or var_192_16 * (var_192_20 / var_192_19)

				if var_192_21 > 0 and var_192_16 < var_192_21 then
					arg_189_1.talkMaxDuration = var_192_21

					if var_192_21 + var_192_15 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_21 + var_192_15
					end
				end

				arg_189_1.text_.text = var_192_18
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_22 = math.max(var_192_16, arg_189_1.talkMaxDuration)

			if var_192_15 <= arg_189_1.time_ and arg_189_1.time_ < var_192_15 + var_192_22 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_15) / var_192_22

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_15 + var_192_22 and arg_189_1.time_ < var_192_15 + var_192_22 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play121511049 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 121511049
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play121511050(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.8

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_2 = arg_193_1:GetWordFromCfg(121511049)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 32
				local var_196_5 = utf8.len(var_196_3)
				local var_196_6 = var_196_4 <= 0 and var_196_1 or var_196_1 * (var_196_5 / var_196_4)

				if var_196_6 > 0 and var_196_1 < var_196_6 then
					arg_193_1.talkMaxDuration = var_196_6

					if var_196_6 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_6 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_3
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_7 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_7 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_7

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_7 and arg_193_1.time_ < var_196_0 + var_196_7 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play121511050 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 121511050
		arg_197_1.duration_ = 7

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play121511051(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 2

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.screenFilterGo_:SetActive(true)

				arg_197_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_200_1 = 0.1

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_1 then
				local var_200_2 = (arg_197_1.time_ - var_200_0) / var_200_1

				arg_197_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_200_2)
			end

			if arg_197_1.time_ >= var_200_0 + var_200_1 and arg_197_1.time_ < var_200_0 + var_200_1 + arg_200_0 then
				arg_197_1.screenFilterEffect_.weight = 1
			end

			local var_200_3 = 0

			if var_200_3 < arg_197_1.time_ and arg_197_1.time_ <= var_200_3 + arg_200_0 then
				arg_197_1.mask_.enabled = true
				arg_197_1.mask_.raycastTarget = true

				arg_197_1:SetGaussion(false)
			end

			local var_200_4 = 2

			if var_200_3 <= arg_197_1.time_ and arg_197_1.time_ < var_200_3 + var_200_4 then
				local var_200_5 = (arg_197_1.time_ - var_200_3) / var_200_4
				local var_200_6 = Color.New(0, 0, 0)

				var_200_6.a = Mathf.Lerp(0, 1, var_200_5)
				arg_197_1.mask_.color = var_200_6
			end

			if arg_197_1.time_ >= var_200_3 + var_200_4 and arg_197_1.time_ < var_200_3 + var_200_4 + arg_200_0 then
				local var_200_7 = Color.New(0, 0, 0)

				var_200_7.a = 1
				arg_197_1.mask_.color = var_200_7
			end

			local var_200_8 = 2

			if var_200_8 < arg_197_1.time_ and arg_197_1.time_ <= var_200_8 + arg_200_0 then
				arg_197_1.mask_.enabled = true
				arg_197_1.mask_.raycastTarget = true

				arg_197_1:SetGaussion(false)
			end

			local var_200_9 = 2

			if var_200_8 <= arg_197_1.time_ and arg_197_1.time_ < var_200_8 + var_200_9 then
				local var_200_10 = (arg_197_1.time_ - var_200_8) / var_200_9
				local var_200_11 = Color.New(0, 0, 0)

				var_200_11.a = Mathf.Lerp(1, 0, var_200_10)
				arg_197_1.mask_.color = var_200_11
			end

			if arg_197_1.time_ >= var_200_8 + var_200_9 and arg_197_1.time_ < var_200_8 + var_200_9 + arg_200_0 then
				local var_200_12 = Color.New(0, 0, 0)
				local var_200_13 = 0

				arg_197_1.mask_.enabled = false
				var_200_12.a = var_200_13
				arg_197_1.mask_.color = var_200_12
			end

			if arg_197_1.frameCnt_ <= 1 then
				arg_197_1.dialog_:SetActive(false)
			end

			local var_200_14 = 2
			local var_200_15 = 0.975

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0

				arg_197_1.dialog_:SetActive(true)

				local var_200_16 = LeanTween.value(arg_197_1.dialog_, 0, 1, 0.3)

				var_200_16:setOnUpdate(LuaHelper.FloatAction(function(arg_201_0)
					arg_197_1.dialogCg_.alpha = arg_201_0
				end))
				var_200_16:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_197_1.dialog_)
					var_200_16:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_197_1.duration_ = arg_197_1.duration_ + 0.3

				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_17 = arg_197_1:GetWordFromCfg(121511050)
				local var_200_18 = arg_197_1:FormatText(var_200_17.content)

				arg_197_1.text_.text = var_200_18

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_19 = 39
				local var_200_20 = utf8.len(var_200_18)
				local var_200_21 = var_200_19 <= 0 and var_200_15 or var_200_15 * (var_200_20 / var_200_19)

				if var_200_21 > 0 and var_200_15 < var_200_21 then
					arg_197_1.talkMaxDuration = var_200_21
					var_200_14 = var_200_14 + 0.3

					if var_200_21 + var_200_14 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_14
					end
				end

				arg_197_1.text_.text = var_200_18
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_22 = var_200_14 + 0.3
			local var_200_23 = math.max(var_200_15, arg_197_1.talkMaxDuration)

			if var_200_22 <= arg_197_1.time_ and arg_197_1.time_ < var_200_22 + var_200_23 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_22) / var_200_23

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_22 + var_200_23 and arg_197_1.time_ < var_200_22 + var_200_23 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play121511051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 121511051
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play121511052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.05

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[7].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(121511051)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 2
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
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_8 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_8 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_8

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_8 and arg_203_1.time_ < var_206_0 + var_206_8 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play121511052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 121511052
		arg_207_1.duration_ = 5.266

		local var_207_0 = {
			ja = 5.266,
			ko = 1.4,
			zh = 1.4
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
				arg_207_0:Play121511053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.15

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[319].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, true)
				arg_207_1.iconController_:SetSelectedState("hero")

				arg_207_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(121511052)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 6
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511052", "story_v_out_121511.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511052", "story_v_out_121511.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_121511", "121511052", "story_v_out_121511.awb")

						arg_207_1:RecordAudio("121511052", var_210_9)
						arg_207_1:RecordAudio("121511052", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_121511", "121511052", "story_v_out_121511.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_121511", "121511052", "story_v_out_121511.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play121511053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 121511053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play121511054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.25

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_2 = arg_211_1:GetWordFromCfg(121511053)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 50
				local var_214_5 = utf8.len(var_214_3)
				local var_214_6 = var_214_4 <= 0 and var_214_1 or var_214_1 * (var_214_5 / var_214_4)

				if var_214_6 > 0 and var_214_1 < var_214_6 then
					arg_211_1.talkMaxDuration = var_214_6

					if var_214_6 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_6 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_3
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_7 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_7 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_7

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_7 and arg_211_1.time_ < var_214_0 + var_214_7 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play121511054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 121511054
		arg_215_1.duration_ = 10.8

		local var_215_0 = {
			ja = 10.8,
			ko = 8.6,
			zh = 8.6
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
				arg_215_0:Play121511055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.95

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[319].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(121511054)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511054", "story_v_out_121511.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511054", "story_v_out_121511.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_121511", "121511054", "story_v_out_121511.awb")

						arg_215_1:RecordAudio("121511054", var_218_9)
						arg_215_1:RecordAudio("121511054", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_121511", "121511054", "story_v_out_121511.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_121511", "121511054", "story_v_out_121511.awb")
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
	Play121511055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 121511055
		arg_219_1.duration_ = 13.533

		local var_219_0 = {
			ja = 13.533,
			ko = 8,
			zh = 8
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
				arg_219_0:Play121511056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 1.025

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[319].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(121511055)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511055", "story_v_out_121511.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511055", "story_v_out_121511.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_121511", "121511055", "story_v_out_121511.awb")

						arg_219_1:RecordAudio("121511055", var_222_9)
						arg_219_1:RecordAudio("121511055", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_121511", "121511055", "story_v_out_121511.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_121511", "121511055", "story_v_out_121511.awb")
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
	Play121511056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 121511056
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play121511057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1.45

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

				local var_226_2 = arg_223_1:GetWordFromCfg(121511056)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 58
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
	Play121511057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 121511057
		arg_227_1.duration_ = 2.7

		local var_227_0 = {
			ja = 2.7,
			ko = 2.1,
			zh = 2.1
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
				arg_227_0:Play121511058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.3

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[319].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, true)
				arg_227_1.iconController_:SetSelectedState("hero")

				arg_227_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(121511057)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511057", "story_v_out_121511.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511057", "story_v_out_121511.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_121511", "121511057", "story_v_out_121511.awb")

						arg_227_1:RecordAudio("121511057", var_230_9)
						arg_227_1:RecordAudio("121511057", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_121511", "121511057", "story_v_out_121511.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_121511", "121511057", "story_v_out_121511.awb")
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
	Play121511058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 121511058
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play121511059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 1.3

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_2 = arg_231_1:GetWordFromCfg(121511058)
				local var_234_3 = arg_231_1:FormatText(var_234_2.content)

				arg_231_1.text_.text = var_234_3

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_4 = 52
				local var_234_5 = utf8.len(var_234_3)
				local var_234_6 = var_234_4 <= 0 and var_234_1 or var_234_1 * (var_234_5 / var_234_4)

				if var_234_6 > 0 and var_234_1 < var_234_6 then
					arg_231_1.talkMaxDuration = var_234_6

					if var_234_6 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_6 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_3
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_7 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_7 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_7

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_7 and arg_231_1.time_ < var_234_0 + var_234_7 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play121511059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 121511059
		arg_235_1.duration_ = 9.1

		local var_235_0 = {
			ja = 9.1,
			ko = 8.566,
			zh = 8.566
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
				arg_235_0:Play121511060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.9

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[319].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, true)
				arg_235_1.iconController_:SetSelectedState("hero")

				arg_235_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(121511059)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 36
				local var_238_6 = utf8.len(var_238_4)
				local var_238_7 = var_238_5 <= 0 and var_238_1 or var_238_1 * (var_238_6 / var_238_5)

				if var_238_7 > 0 and var_238_1 < var_238_7 then
					arg_235_1.talkMaxDuration = var_238_7

					if var_238_7 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_7 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_4
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511059", "story_v_out_121511.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511059", "story_v_out_121511.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_121511", "121511059", "story_v_out_121511.awb")

						arg_235_1:RecordAudio("121511059", var_238_9)
						arg_235_1:RecordAudio("121511059", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_121511", "121511059", "story_v_out_121511.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_121511", "121511059", "story_v_out_121511.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_10 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_10 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_10

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_10 and arg_235_1.time_ < var_238_0 + var_238_10 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play121511060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 121511060
		arg_239_1.duration_ = 7

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play121511061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.mask_.enabled = true
				arg_239_1.mask_.raycastTarget = true

				arg_239_1:SetGaussion(false)
			end

			local var_242_1 = 2

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_1 then
				local var_242_2 = (arg_239_1.time_ - var_242_0) / var_242_1
				local var_242_3 = Color.New(1, 1, 1)

				var_242_3.a = Mathf.Lerp(1, 0, var_242_2)
				arg_239_1.mask_.color = var_242_3
			end

			if arg_239_1.time_ >= var_242_0 + var_242_1 and arg_239_1.time_ < var_242_0 + var_242_1 + arg_242_0 then
				local var_242_4 = Color.New(1, 1, 1)
				local var_242_5 = 0

				arg_239_1.mask_.enabled = false
				var_242_4.a = var_242_5
				arg_239_1.mask_.color = var_242_4
			end

			local var_242_6 = 0

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.screenFilterGo_:SetActive(false)
			end

			local var_242_7 = 0.1

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_7 then
				local var_242_8 = (arg_239_1.time_ - var_242_6) / var_242_7

				arg_239_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_242_8)
			end

			if arg_239_1.time_ >= var_242_6 + var_242_7 and arg_239_1.time_ < var_242_6 + var_242_7 + arg_242_0 then
				arg_239_1.screenFilterEffect_.weight = 0
			end

			local var_242_9 = 0.0333333333333333
			local var_242_10 = 1

			if var_242_9 < arg_239_1.time_ and arg_239_1.time_ <= var_242_9 + arg_242_0 then
				local var_242_11 = "play"
				local var_242_12 = "music"

				arg_239_1:AudioAction(var_242_11, var_242_12, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			if arg_239_1.frameCnt_ <= 1 then
				arg_239_1.dialog_:SetActive(false)
			end

			local var_242_13 = 2
			local var_242_14 = 0.175

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_15 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_15:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_15:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_15:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_16 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_17 = arg_239_1:GetWordFromCfg(121511060)
				local var_242_18 = arg_239_1:FormatText(var_242_17.content)

				arg_239_1.text_.text = var_242_18

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_19 = 7
				local var_242_20 = utf8.len(var_242_18)
				local var_242_21 = var_242_19 <= 0 and var_242_14 or var_242_14 * (var_242_20 / var_242_19)

				if var_242_21 > 0 and var_242_14 < var_242_21 then
					arg_239_1.talkMaxDuration = var_242_21
					var_242_13 = var_242_13 + 0.3

					if var_242_21 + var_242_13 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_21 + var_242_13
					end
				end

				arg_239_1.text_.text = var_242_18
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_22 = var_242_13 + 0.3
			local var_242_23 = math.max(var_242_14, arg_239_1.talkMaxDuration)

			if var_242_22 <= arg_239_1.time_ and arg_239_1.time_ < var_242_22 + var_242_23 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_22) / var_242_23

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_22 + var_242_23 and arg_239_1.time_ < var_242_22 + var_242_23 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play121511061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 121511061
		arg_245_1.duration_ = 1.666

		local var_245_0 = {
			ja = 1.666,
			ko = 1.2,
			zh = 1.2
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
				arg_245_0:Play121511062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.125

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[319].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, true)
				arg_245_1.iconController_:SetSelectedState("hero")

				arg_245_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(121511061)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 5
				local var_248_6 = utf8.len(var_248_4)
				local var_248_7 = var_248_5 <= 0 and var_248_1 or var_248_1 * (var_248_6 / var_248_5)

				if var_248_7 > 0 and var_248_1 < var_248_7 then
					arg_245_1.talkMaxDuration = var_248_7

					if var_248_7 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_7 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_4
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511061", "story_v_out_121511.awb") ~= 0 then
					local var_248_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511061", "story_v_out_121511.awb") / 1000

					if var_248_8 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_0
					end

					if var_248_3.prefab_name ~= "" and arg_245_1.actors_[var_248_3.prefab_name] ~= nil then
						local var_248_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_3.prefab_name].transform, "story_v_out_121511", "121511061", "story_v_out_121511.awb")

						arg_245_1:RecordAudio("121511061", var_248_9)
						arg_245_1:RecordAudio("121511061", var_248_9)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_121511", "121511061", "story_v_out_121511.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_121511", "121511061", "story_v_out_121511.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_10 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_10 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_10

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_10 and arg_245_1.time_ < var_248_0 + var_248_10 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play121511062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 121511062
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play121511063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = manager.ui.mainCamera.transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.shakeOldPos = var_252_0.localPosition
			end

			local var_252_2 = 0.6

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / 0.066
				local var_252_4, var_252_5 = math.modf(var_252_3)

				var_252_0.localPosition = Vector3.New(var_252_5 * 0.13, var_252_5 * 0.13, var_252_5 * 0.13) + arg_249_1.var_.shakeOldPos
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = arg_249_1.var_.shakeOldPos
			end

			local var_252_6 = 0

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.allBtn_.enabled = false
			end

			local var_252_7 = 0.6

			if arg_249_1.time_ >= var_252_6 + var_252_7 and arg_249_1.time_ < var_252_6 + var_252_7 + arg_252_0 then
				arg_249_1.allBtn_.enabled = true
			end

			local var_252_8 = 0
			local var_252_9 = 0.05

			if var_252_8 < arg_249_1.time_ and arg_249_1.time_ <= var_252_8 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_10 = arg_249_1:FormatText(StoryNameCfg[7].name)

				arg_249_1.leftNameTxt_.text = var_252_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_11 = arg_249_1:GetWordFromCfg(121511062)
				local var_252_12 = arg_249_1:FormatText(var_252_11.content)

				arg_249_1.text_.text = var_252_12

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_13 = 2
				local var_252_14 = utf8.len(var_252_12)
				local var_252_15 = var_252_13 <= 0 and var_252_9 or var_252_9 * (var_252_14 / var_252_13)

				if var_252_15 > 0 and var_252_9 < var_252_15 then
					arg_249_1.talkMaxDuration = var_252_15

					if var_252_15 + var_252_8 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_15 + var_252_8
					end
				end

				arg_249_1.text_.text = var_252_12
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_16 = math.max(var_252_9, arg_249_1.talkMaxDuration)

			if var_252_8 <= arg_249_1.time_ and arg_249_1.time_ < var_252_8 + var_252_16 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_8) / var_252_16

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_8 + var_252_16 and arg_249_1.time_ < var_252_8 + var_252_16 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play121511063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 121511063
		arg_253_1.duration_ = 10.1

		local var_253_0 = {
			ja = 10.1,
			ko = 5.533,
			zh = 5.533
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
				arg_253_0:Play121511064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.65

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[319].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(121511063)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 26
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511063", "story_v_out_121511.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511063", "story_v_out_121511.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_121511", "121511063", "story_v_out_121511.awb")

						arg_253_1:RecordAudio("121511063", var_256_9)
						arg_253_1:RecordAudio("121511063", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_121511", "121511063", "story_v_out_121511.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_121511", "121511063", "story_v_out_121511.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play121511064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 121511064
		arg_257_1.duration_ = 0.199999999999

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"

			SetActive(arg_257_1.choicesGo_, true)

			for iter_258_0, iter_258_1 in ipairs(arg_257_1.choices_) do
				local var_258_0 = iter_258_0 <= 2

				SetActive(iter_258_1.go, var_258_0)
			end

			arg_257_1.choices_[1].txt.text = arg_257_1:FormatText(StoryChoiceCfg[402].name)
			arg_257_1.choices_[2].txt.text = arg_257_1:FormatText(StoryChoiceCfg[403].name)
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play121511065(arg_257_1)
			end

			if arg_259_0 == 2 then
				arg_257_0:Play121511070(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.allBtn_.enabled = false
			end

			local var_260_1 = 0.2

			if arg_257_1.time_ >= var_260_0 + var_260_1 and arg_257_1.time_ < var_260_0 + var_260_1 + arg_260_0 then
				arg_257_1.allBtn_.enabled = true
			end
		end
	end,
	Play121511065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 121511065
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play121511066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.633333333333333

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				local var_264_2 = "play"
				local var_264_3 = "effect"

				arg_261_1:AudioAction(var_264_2, var_264_3, "se_story_121_04", "se_story_121_04_gunready", "")
			end

			local var_264_4 = 0
			local var_264_5 = 0.85

			if var_264_4 < arg_261_1.time_ and arg_261_1.time_ <= var_264_4 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_6 = arg_261_1:GetWordFromCfg(121511065)
				local var_264_7 = arg_261_1:FormatText(var_264_6.content)

				arg_261_1.text_.text = var_264_7

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_8 = 34
				local var_264_9 = utf8.len(var_264_7)
				local var_264_10 = var_264_8 <= 0 and var_264_5 or var_264_5 * (var_264_9 / var_264_8)

				if var_264_10 > 0 and var_264_5 < var_264_10 then
					arg_261_1.talkMaxDuration = var_264_10

					if var_264_10 + var_264_4 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_10 + var_264_4
					end
				end

				arg_261_1.text_.text = var_264_7
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_11 = math.max(var_264_5, arg_261_1.talkMaxDuration)

			if var_264_4 <= arg_261_1.time_ and arg_261_1.time_ < var_264_4 + var_264_11 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_4) / var_264_11

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_4 + var_264_11 and arg_261_1.time_ < var_264_4 + var_264_11 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play121511066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 121511066
		arg_265_1.duration_ = 2.766

		local var_265_0 = {
			ja = 2.766,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_265_0:Play121511067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1075ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1075ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(-0.7, -1.055, -6.16)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1075ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = arg_265_1.actors_["1075ui_story"]
			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect1075ui_story == nil then
				arg_265_1.var_.characterEffect1075ui_story = var_268_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_11 = 0.200000002980232

			if var_268_10 <= arg_265_1.time_ and arg_265_1.time_ < var_268_10 + var_268_11 then
				local var_268_12 = (arg_265_1.time_ - var_268_10) / var_268_11

				if arg_265_1.var_.characterEffect1075ui_story then
					arg_265_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_10 + var_268_11 and arg_265_1.time_ < var_268_10 + var_268_11 + arg_268_0 and arg_265_1.var_.characterEffect1075ui_story then
				arg_265_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_268_13 = 0

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 then
				arg_265_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_268_15 = arg_265_1.actors_["1184ui_story"].transform
			local var_268_16 = 0

			if var_268_16 < arg_265_1.time_ and arg_265_1.time_ <= var_268_16 + arg_268_0 then
				arg_265_1.var_.moveOldPos1184ui_story = var_268_15.localPosition
			end

			local var_268_17 = 0.001

			if var_268_16 <= arg_265_1.time_ and arg_265_1.time_ < var_268_16 + var_268_17 then
				local var_268_18 = (arg_265_1.time_ - var_268_16) / var_268_17
				local var_268_19 = Vector3.New(0.7, -0.97, -6)

				var_268_15.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1184ui_story, var_268_19, var_268_18)

				local var_268_20 = manager.ui.mainCamera.transform.position - var_268_15.position

				var_268_15.forward = Vector3.New(var_268_20.x, var_268_20.y, var_268_20.z)

				local var_268_21 = var_268_15.localEulerAngles

				var_268_21.z = 0
				var_268_21.x = 0
				var_268_15.localEulerAngles = var_268_21
			end

			if arg_265_1.time_ >= var_268_16 + var_268_17 and arg_265_1.time_ < var_268_16 + var_268_17 + arg_268_0 then
				var_268_15.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_268_22 = manager.ui.mainCamera.transform.position - var_268_15.position

				var_268_15.forward = Vector3.New(var_268_22.x, var_268_22.y, var_268_22.z)

				local var_268_23 = var_268_15.localEulerAngles

				var_268_23.z = 0
				var_268_23.x = 0
				var_268_15.localEulerAngles = var_268_23
			end

			local var_268_24 = arg_265_1.actors_["1184ui_story"]
			local var_268_25 = 0

			if var_268_25 < arg_265_1.time_ and arg_265_1.time_ <= var_268_25 + arg_268_0 and arg_265_1.var_.characterEffect1184ui_story == nil then
				arg_265_1.var_.characterEffect1184ui_story = var_268_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_26 = 0.200000002980232

			if var_268_25 <= arg_265_1.time_ and arg_265_1.time_ < var_268_25 + var_268_26 then
				local var_268_27 = (arg_265_1.time_ - var_268_25) / var_268_26

				if arg_265_1.var_.characterEffect1184ui_story then
					arg_265_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_25 + var_268_26 and arg_265_1.time_ < var_268_25 + var_268_26 + arg_268_0 and arg_265_1.var_.characterEffect1184ui_story then
				arg_265_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_268_28 = 0

			if var_268_28 < arg_265_1.time_ and arg_265_1.time_ <= var_268_28 + arg_268_0 then
				arg_265_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_268_29 = 0
			local var_268_30 = 0.475

			if var_268_29 < arg_265_1.time_ and arg_265_1.time_ <= var_268_29 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_31 = arg_265_1:FormatText(StoryNameCfg[381].name)

				arg_265_1.leftNameTxt_.text = var_268_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_32 = arg_265_1:GetWordFromCfg(121511066)
				local var_268_33 = arg_265_1:FormatText(var_268_32.content)

				arg_265_1.text_.text = var_268_33

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_34 = 19
				local var_268_35 = utf8.len(var_268_33)
				local var_268_36 = var_268_34 <= 0 and var_268_30 or var_268_30 * (var_268_35 / var_268_34)

				if var_268_36 > 0 and var_268_30 < var_268_36 then
					arg_265_1.talkMaxDuration = var_268_36

					if var_268_36 + var_268_29 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_36 + var_268_29
					end
				end

				arg_265_1.text_.text = var_268_33
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511066", "story_v_out_121511.awb") ~= 0 then
					local var_268_37 = manager.audio:GetVoiceLength("story_v_out_121511", "121511066", "story_v_out_121511.awb") / 1000

					if var_268_37 + var_268_29 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_37 + var_268_29
					end

					if var_268_32.prefab_name ~= "" and arg_265_1.actors_[var_268_32.prefab_name] ~= nil then
						local var_268_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_32.prefab_name].transform, "story_v_out_121511", "121511066", "story_v_out_121511.awb")

						arg_265_1:RecordAudio("121511066", var_268_38)
						arg_265_1:RecordAudio("121511066", var_268_38)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_121511", "121511066", "story_v_out_121511.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_121511", "121511066", "story_v_out_121511.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_39 = math.max(var_268_30, arg_265_1.talkMaxDuration)

			if var_268_29 <= arg_265_1.time_ and arg_265_1.time_ < var_268_29 + var_268_39 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_29) / var_268_39

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_29 + var_268_39 and arg_265_1.time_ < var_268_29 + var_268_39 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play121511067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 121511067
		arg_269_1.duration_ = 2.3

		local var_269_0 = {
			ja = 2.3,
			ko = 1.233,
			zh = 1.233
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
				arg_269_0:Play121511068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.125

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[6].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(121511067)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511067", "story_v_out_121511.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511067", "story_v_out_121511.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_121511", "121511067", "story_v_out_121511.awb")

						arg_269_1:RecordAudio("121511067", var_272_9)
						arg_269_1:RecordAudio("121511067", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_121511", "121511067", "story_v_out_121511.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_121511", "121511067", "story_v_out_121511.awb")
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
	Play121511068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 121511068
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play121511069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1075ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos1075ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0, 100, 0)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1075ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(0, 100, 0)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["1075ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect1075ui_story == nil then
				arg_273_1.var_.characterEffect1075ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect1075ui_story then
					local var_276_13 = Mathf.Lerp(0, 0.5, var_276_12)

					arg_273_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1075ui_story.fillRatio = var_276_13
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect1075ui_story then
				local var_276_14 = 0.5

				arg_273_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1075ui_story.fillRatio = var_276_14
			end

			local var_276_15 = arg_273_1.actors_["1184ui_story"].transform
			local var_276_16 = 0

			if var_276_16 < arg_273_1.time_ and arg_273_1.time_ <= var_276_16 + arg_276_0 then
				arg_273_1.var_.moveOldPos1184ui_story = var_276_15.localPosition
			end

			local var_276_17 = 0.001

			if var_276_16 <= arg_273_1.time_ and arg_273_1.time_ < var_276_16 + var_276_17 then
				local var_276_18 = (arg_273_1.time_ - var_276_16) / var_276_17
				local var_276_19 = Vector3.New(0, 100, 0)

				var_276_15.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1184ui_story, var_276_19, var_276_18)

				local var_276_20 = manager.ui.mainCamera.transform.position - var_276_15.position

				var_276_15.forward = Vector3.New(var_276_20.x, var_276_20.y, var_276_20.z)

				local var_276_21 = var_276_15.localEulerAngles

				var_276_21.z = 0
				var_276_21.x = 0
				var_276_15.localEulerAngles = var_276_21
			end

			if arg_273_1.time_ >= var_276_16 + var_276_17 and arg_273_1.time_ < var_276_16 + var_276_17 + arg_276_0 then
				var_276_15.localPosition = Vector3.New(0, 100, 0)

				local var_276_22 = manager.ui.mainCamera.transform.position - var_276_15.position

				var_276_15.forward = Vector3.New(var_276_22.x, var_276_22.y, var_276_22.z)

				local var_276_23 = var_276_15.localEulerAngles

				var_276_23.z = 0
				var_276_23.x = 0
				var_276_15.localEulerAngles = var_276_23
			end

			local var_276_24 = arg_273_1.actors_["1184ui_story"]
			local var_276_25 = 0

			if var_276_25 < arg_273_1.time_ and arg_273_1.time_ <= var_276_25 + arg_276_0 and arg_273_1.var_.characterEffect1184ui_story == nil then
				arg_273_1.var_.characterEffect1184ui_story = var_276_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_26 = 0.200000002980232

			if var_276_25 <= arg_273_1.time_ and arg_273_1.time_ < var_276_25 + var_276_26 then
				local var_276_27 = (arg_273_1.time_ - var_276_25) / var_276_26

				if arg_273_1.var_.characterEffect1184ui_story then
					local var_276_28 = Mathf.Lerp(0, 0.5, var_276_27)

					arg_273_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1184ui_story.fillRatio = var_276_28
				end
			end

			if arg_273_1.time_ >= var_276_25 + var_276_26 and arg_273_1.time_ < var_276_25 + var_276_26 + arg_276_0 and arg_273_1.var_.characterEffect1184ui_story then
				local var_276_29 = 0.5

				arg_273_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1184ui_story.fillRatio = var_276_29
			end

			local var_276_30 = 0
			local var_276_31 = 0.633333333333333

			if var_276_30 < arg_273_1.time_ and arg_273_1.time_ <= var_276_30 + arg_276_0 then
				local var_276_32 = "play"
				local var_276_33 = "effect"

				arg_273_1:AudioAction(var_276_32, var_276_33, "se_story_121_04", "se_story_121_04_gunreadygroup", "")
			end

			local var_276_34 = 0
			local var_276_35 = 1.2

			if var_276_34 < arg_273_1.time_ and arg_273_1.time_ <= var_276_34 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_36 = arg_273_1:GetWordFromCfg(121511068)
				local var_276_37 = arg_273_1:FormatText(var_276_36.content)

				arg_273_1.text_.text = var_276_37

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_38 = 48
				local var_276_39 = utf8.len(var_276_37)
				local var_276_40 = var_276_38 <= 0 and var_276_35 or var_276_35 * (var_276_39 / var_276_38)

				if var_276_40 > 0 and var_276_35 < var_276_40 then
					arg_273_1.talkMaxDuration = var_276_40

					if var_276_40 + var_276_34 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_40 + var_276_34
					end
				end

				arg_273_1.text_.text = var_276_37
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_41 = math.max(var_276_35, arg_273_1.talkMaxDuration)

			if var_276_34 <= arg_273_1.time_ and arg_273_1.time_ < var_276_34 + var_276_41 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_34) / var_276_41

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_34 + var_276_41 and arg_273_1.time_ < var_276_34 + var_276_41 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play121511069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 121511069
		arg_277_1.duration_ = 3.933

		local var_277_0 = {
			ja = 3.933,
			ko = 2.5,
			zh = 2.5
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
				arg_277_0:Play121511076(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["10042ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos10042ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, -1.12, -6.2)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10042ui_story, var_280_4, var_280_3)

				local var_280_5 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_5.x, var_280_5.y, var_280_5.z)

				local var_280_6 = var_280_0.localEulerAngles

				var_280_6.z = 0
				var_280_6.x = 0
				var_280_0.localEulerAngles = var_280_6
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_280_7 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_7.x, var_280_7.y, var_280_7.z)

				local var_280_8 = var_280_0.localEulerAngles

				var_280_8.z = 0
				var_280_8.x = 0
				var_280_0.localEulerAngles = var_280_8
			end

			local var_280_9 = arg_277_1.actors_["10042ui_story"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.characterEffect10042ui_story == nil then
				arg_277_1.var_.characterEffect10042ui_story = var_280_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_11 = 0.200000002980232

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.characterEffect10042ui_story then
					arg_277_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.characterEffect10042ui_story then
				arg_277_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action2_1")
			end

			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				arg_277_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_280_15 = 0
			local var_280_16 = 0.275

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_17 = arg_277_1:FormatText(StoryNameCfg[388].name)

				arg_277_1.leftNameTxt_.text = var_280_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_18 = arg_277_1:GetWordFromCfg(121511069)
				local var_280_19 = arg_277_1:FormatText(var_280_18.content)

				arg_277_1.text_.text = var_280_19

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_20 = 11
				local var_280_21 = utf8.len(var_280_19)
				local var_280_22 = var_280_20 <= 0 and var_280_16 or var_280_16 * (var_280_21 / var_280_20)

				if var_280_22 > 0 and var_280_16 < var_280_22 then
					arg_277_1.talkMaxDuration = var_280_22

					if var_280_22 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_22 + var_280_15
					end
				end

				arg_277_1.text_.text = var_280_19
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511069", "story_v_out_121511.awb") ~= 0 then
					local var_280_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511069", "story_v_out_121511.awb") / 1000

					if var_280_23 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_23 + var_280_15
					end

					if var_280_18.prefab_name ~= "" and arg_277_1.actors_[var_280_18.prefab_name] ~= nil then
						local var_280_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_18.prefab_name].transform, "story_v_out_121511", "121511069", "story_v_out_121511.awb")

						arg_277_1:RecordAudio("121511069", var_280_24)
						arg_277_1:RecordAudio("121511069", var_280_24)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_121511", "121511069", "story_v_out_121511.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_121511", "121511069", "story_v_out_121511.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_25 = math.max(var_280_16, arg_277_1.talkMaxDuration)

			if var_280_15 <= arg_277_1.time_ and arg_277_1.time_ < var_280_15 + var_280_25 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_15) / var_280_25

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_15 + var_280_25 and arg_277_1.time_ < var_280_15 + var_280_25 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play121511076 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 121511076
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play121511077(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10042ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos10042ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, 100, 0)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10042ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, 100, 0)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["10042ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect10042ui_story == nil then
				arg_281_1.var_.characterEffect10042ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect10042ui_story then
					local var_284_13 = Mathf.Lerp(0, 0.5, var_284_12)

					arg_281_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_281_1.var_.characterEffect10042ui_story.fillRatio = var_284_13
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect10042ui_story then
				local var_284_14 = 0.5

				arg_281_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_281_1.var_.characterEffect10042ui_story.fillRatio = var_284_14
			end

			local var_284_15 = 0
			local var_284_16 = 0.925

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_17 = arg_281_1:GetWordFromCfg(121511076)
				local var_284_18 = arg_281_1:FormatText(var_284_17.content)

				arg_281_1.text_.text = var_284_18

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_19 = 37
				local var_284_20 = utf8.len(var_284_18)
				local var_284_21 = var_284_19 <= 0 and var_284_16 or var_284_16 * (var_284_20 / var_284_19)

				if var_284_21 > 0 and var_284_16 < var_284_21 then
					arg_281_1.talkMaxDuration = var_284_21

					if var_284_21 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_21 + var_284_15
					end
				end

				arg_281_1.text_.text = var_284_18
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_22 = math.max(var_284_16, arg_281_1.talkMaxDuration)

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_22 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_15) / var_284_22

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_15 + var_284_22 and arg_281_1.time_ < var_284_15 + var_284_22 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play121511077 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 121511077
		arg_285_1.duration_ = 9.3

		local var_285_0 = {
			ja = 9.3,
			ko = 3.7,
			zh = 3.7
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
				arg_285_0:Play121511078(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.525

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[319].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(121511077)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 21
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511077", "story_v_out_121511.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511077", "story_v_out_121511.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_121511", "121511077", "story_v_out_121511.awb")

						arg_285_1:RecordAudio("121511077", var_288_9)
						arg_285_1:RecordAudio("121511077", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_121511", "121511077", "story_v_out_121511.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_121511", "121511077", "story_v_out_121511.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play121511078 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 121511078
		arg_289_1.duration_ = 9

		local var_289_0 = {
			ja = 9,
			ko = 5.933,
			zh = 5.933
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
				arg_289_0:Play121511079(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.775

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[319].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(121511078)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 31
				local var_292_6 = utf8.len(var_292_4)
				local var_292_7 = var_292_5 <= 0 and var_292_1 or var_292_1 * (var_292_6 / var_292_5)

				if var_292_7 > 0 and var_292_1 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_4
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511078", "story_v_out_121511.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511078", "story_v_out_121511.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_121511", "121511078", "story_v_out_121511.awb")

						arg_289_1:RecordAudio("121511078", var_292_9)
						arg_289_1:RecordAudio("121511078", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_121511", "121511078", "story_v_out_121511.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_121511", "121511078", "story_v_out_121511.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_10 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_10 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_10

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_10 and arg_289_1.time_ < var_292_0 + var_292_10 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play121511079 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 121511079
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play121511080(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 1

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

				local var_296_2 = arg_293_1:GetWordFromCfg(121511079)
				local var_296_3 = arg_293_1:FormatText(var_296_2.content)

				arg_293_1.text_.text = var_296_3

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_4 = 40
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
	Play121511080 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 121511080
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play121511081(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 1.3

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

				local var_300_2 = arg_297_1:GetWordFromCfg(121511080)
				local var_300_3 = arg_297_1:FormatText(var_300_2.content)

				arg_297_1.text_.text = var_300_3

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_4 = 52
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
	Play121511081 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 121511081
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play121511082(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.525

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[7].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(121511081)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 21
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
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_8 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_8 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_8

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_8 and arg_301_1.time_ < var_304_0 + var_304_8 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play121511082 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 121511082
		arg_305_1.duration_ = 1.999999999999

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play121511083(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1075ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1075ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0, -1.055, -6.16)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1075ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["1075ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and arg_305_1.var_.characterEffect1075ui_story == nil then
				arg_305_1.var_.characterEffect1075ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect1075ui_story then
					arg_305_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and arg_305_1.var_.characterEffect1075ui_story then
				arg_305_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_308_13 = 0

			if var_308_13 < arg_305_1.time_ and arg_305_1.time_ <= var_308_13 + arg_308_0 then
				arg_305_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_308_14 = 0

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 then
				arg_305_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_308_15 = 0
			local var_308_16 = 0.1

			if var_308_15 < arg_305_1.time_ and arg_305_1.time_ <= var_308_15 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_17 = arg_305_1:FormatText(StoryNameCfg[381].name)

				arg_305_1.leftNameTxt_.text = var_308_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_18 = arg_305_1:GetWordFromCfg(121511082)
				local var_308_19 = arg_305_1:FormatText(var_308_18.content)

				arg_305_1.text_.text = var_308_19

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_20 = 4
				local var_308_21 = utf8.len(var_308_19)
				local var_308_22 = var_308_20 <= 0 and var_308_16 or var_308_16 * (var_308_21 / var_308_20)

				if var_308_22 > 0 and var_308_16 < var_308_22 then
					arg_305_1.talkMaxDuration = var_308_22

					if var_308_22 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_22 + var_308_15
					end
				end

				arg_305_1.text_.text = var_308_19
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511082", "story_v_out_121511.awb") ~= 0 then
					local var_308_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511082", "story_v_out_121511.awb") / 1000

					if var_308_23 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_23 + var_308_15
					end

					if var_308_18.prefab_name ~= "" and arg_305_1.actors_[var_308_18.prefab_name] ~= nil then
						local var_308_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_18.prefab_name].transform, "story_v_out_121511", "121511082", "story_v_out_121511.awb")

						arg_305_1:RecordAudio("121511082", var_308_24)
						arg_305_1:RecordAudio("121511082", var_308_24)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_121511", "121511082", "story_v_out_121511.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_121511", "121511082", "story_v_out_121511.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_25 = math.max(var_308_16, arg_305_1.talkMaxDuration)

			if var_308_15 <= arg_305_1.time_ and arg_305_1.time_ < var_308_15 + var_308_25 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_15) / var_308_25

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_15 + var_308_25 and arg_305_1.time_ < var_308_15 + var_308_25 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play121511083 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 121511083
		arg_309_1.duration_ = 1.999999999999

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play121511084(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1075ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1075ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, 100, 0)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1075ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, 100, 0)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1075ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1075ui_story == nil then
				arg_309_1.var_.characterEffect1075ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1075ui_story then
					local var_312_13 = Mathf.Lerp(0, 0.5, var_312_12)

					arg_309_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_309_1.var_.characterEffect1075ui_story.fillRatio = var_312_13
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1075ui_story then
				local var_312_14 = 0.5

				arg_309_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_309_1.var_.characterEffect1075ui_story.fillRatio = var_312_14
			end

			local var_312_15 = arg_309_1.actors_["10042ui_story"].transform
			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 then
				arg_309_1.var_.moveOldPos10042ui_story = var_312_15.localPosition
			end

			local var_312_17 = 0.001

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17
				local var_312_19 = Vector3.New(0, -1.12, -6.2)

				var_312_15.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10042ui_story, var_312_19, var_312_18)

				local var_312_20 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_20.x, var_312_20.y, var_312_20.z)

				local var_312_21 = var_312_15.localEulerAngles

				var_312_21.z = 0
				var_312_21.x = 0
				var_312_15.localEulerAngles = var_312_21
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 then
				var_312_15.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_312_22 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_22.x, var_312_22.y, var_312_22.z)

				local var_312_23 = var_312_15.localEulerAngles

				var_312_23.z = 0
				var_312_23.x = 0
				var_312_15.localEulerAngles = var_312_23
			end

			local var_312_24 = arg_309_1.actors_["10042ui_story"]
			local var_312_25 = 0

			if var_312_25 < arg_309_1.time_ and arg_309_1.time_ <= var_312_25 + arg_312_0 and arg_309_1.var_.characterEffect10042ui_story == nil then
				arg_309_1.var_.characterEffect10042ui_story = var_312_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_26 = 0.200000002980232

			if var_312_25 <= arg_309_1.time_ and arg_309_1.time_ < var_312_25 + var_312_26 then
				local var_312_27 = (arg_309_1.time_ - var_312_25) / var_312_26

				if arg_309_1.var_.characterEffect10042ui_story then
					arg_309_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_25 + var_312_26 and arg_309_1.time_ < var_312_25 + var_312_26 + arg_312_0 and arg_309_1.var_.characterEffect10042ui_story then
				arg_309_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_312_28 = 0

			if var_312_28 < arg_309_1.time_ and arg_309_1.time_ <= var_312_28 + arg_312_0 then
				arg_309_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_312_29 = 0
			local var_312_30 = 0.05

			if var_312_29 < arg_309_1.time_ and arg_309_1.time_ <= var_312_29 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_31 = arg_309_1:FormatText(StoryNameCfg[388].name)

				arg_309_1.leftNameTxt_.text = var_312_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_32 = arg_309_1:GetWordFromCfg(121511083)
				local var_312_33 = arg_309_1:FormatText(var_312_32.content)

				arg_309_1.text_.text = var_312_33

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_34 = 2
				local var_312_35 = utf8.len(var_312_33)
				local var_312_36 = var_312_34 <= 0 and var_312_30 or var_312_30 * (var_312_35 / var_312_34)

				if var_312_36 > 0 and var_312_30 < var_312_36 then
					arg_309_1.talkMaxDuration = var_312_36

					if var_312_36 + var_312_29 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_36 + var_312_29
					end
				end

				arg_309_1.text_.text = var_312_33
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511083", "story_v_out_121511.awb") ~= 0 then
					local var_312_37 = manager.audio:GetVoiceLength("story_v_out_121511", "121511083", "story_v_out_121511.awb") / 1000

					if var_312_37 + var_312_29 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_37 + var_312_29
					end

					if var_312_32.prefab_name ~= "" and arg_309_1.actors_[var_312_32.prefab_name] ~= nil then
						local var_312_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_32.prefab_name].transform, "story_v_out_121511", "121511083", "story_v_out_121511.awb")

						arg_309_1:RecordAudio("121511083", var_312_38)
						arg_309_1:RecordAudio("121511083", var_312_38)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_121511", "121511083", "story_v_out_121511.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_121511", "121511083", "story_v_out_121511.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_39 = math.max(var_312_30, arg_309_1.talkMaxDuration)

			if var_312_29 <= arg_309_1.time_ and arg_309_1.time_ < var_312_29 + var_312_39 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_29) / var_312_39

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_29 + var_312_39 and arg_309_1.time_ < var_312_29 + var_312_39 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play121511084 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 121511084
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play121511085(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10042ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect10042ui_story == nil then
				arg_313_1.var_.characterEffect10042ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect10042ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_313_1.var_.characterEffect10042ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect10042ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_313_1.var_.characterEffect10042ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 1.45

			if var_316_6 < arg_313_1.time_ and arg_313_1.time_ <= var_316_6 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_8 = arg_313_1:GetWordFromCfg(121511084)
				local var_316_9 = arg_313_1:FormatText(var_316_8.content)

				arg_313_1.text_.text = var_316_9

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_10 = 58
				local var_316_11 = utf8.len(var_316_9)
				local var_316_12 = var_316_10 <= 0 and var_316_7 or var_316_7 * (var_316_11 / var_316_10)

				if var_316_12 > 0 and var_316_7 < var_316_12 then
					arg_313_1.talkMaxDuration = var_316_12

					if var_316_12 + var_316_6 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_12 + var_316_6
					end
				end

				arg_313_1.text_.text = var_316_9
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_13 = math.max(var_316_7, arg_313_1.talkMaxDuration)

			if var_316_6 <= arg_313_1.time_ and arg_313_1.time_ < var_316_6 + var_316_13 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_6) / var_316_13

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_6 + var_316_13 and arg_313_1.time_ < var_316_6 + var_316_13 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play121511085 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 121511085
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play121511086(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 1

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_2 = arg_317_1:GetWordFromCfg(121511085)
				local var_320_3 = arg_317_1:FormatText(var_320_2.content)

				arg_317_1.text_.text = var_320_3

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_4 = 38
				local var_320_5 = utf8.len(var_320_3)
				local var_320_6 = var_320_4 <= 0 and var_320_1 or var_320_1 * (var_320_5 / var_320_4)

				if var_320_6 > 0 and var_320_1 < var_320_6 then
					arg_317_1.talkMaxDuration = var_320_6

					if var_320_6 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_6 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_3
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_7 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_7 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_7

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_7 and arg_317_1.time_ < var_320_0 + var_320_7 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play121511086 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 121511086
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play121511087(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.6

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

				local var_324_3 = arg_321_1:GetWordFromCfg(121511086)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 24
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
	Play121511087 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 121511087
		arg_325_1.duration_ = 8.066

		local var_325_0 = {
			ja = 7.7,
			ko = 8.066,
			zh = 8.066
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
				arg_325_0:Play121511088(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10042ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect10042ui_story == nil then
				arg_325_1.var_.characterEffect10042ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect10042ui_story then
					arg_325_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect10042ui_story then
				arg_325_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_328_4 = 0
			local var_328_5 = 0.5

			if var_328_4 < arg_325_1.time_ and arg_325_1.time_ <= var_328_4 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_6 = arg_325_1:FormatText(StoryNameCfg[388].name)

				arg_325_1.leftNameTxt_.text = var_328_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_7 = arg_325_1:GetWordFromCfg(121511087)
				local var_328_8 = arg_325_1:FormatText(var_328_7.content)

				arg_325_1.text_.text = var_328_8

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_9 = 20
				local var_328_10 = utf8.len(var_328_8)
				local var_328_11 = var_328_9 <= 0 and var_328_5 or var_328_5 * (var_328_10 / var_328_9)

				if var_328_11 > 0 and var_328_5 < var_328_11 then
					arg_325_1.talkMaxDuration = var_328_11

					if var_328_11 + var_328_4 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_11 + var_328_4
					end
				end

				arg_325_1.text_.text = var_328_8
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511087", "story_v_out_121511.awb") ~= 0 then
					local var_328_12 = manager.audio:GetVoiceLength("story_v_out_121511", "121511087", "story_v_out_121511.awb") / 1000

					if var_328_12 + var_328_4 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_12 + var_328_4
					end

					if var_328_7.prefab_name ~= "" and arg_325_1.actors_[var_328_7.prefab_name] ~= nil then
						local var_328_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_7.prefab_name].transform, "story_v_out_121511", "121511087", "story_v_out_121511.awb")

						arg_325_1:RecordAudio("121511087", var_328_13)
						arg_325_1:RecordAudio("121511087", var_328_13)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_121511", "121511087", "story_v_out_121511.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_121511", "121511087", "story_v_out_121511.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_14 = math.max(var_328_5, arg_325_1.talkMaxDuration)

			if var_328_4 <= arg_325_1.time_ and arg_325_1.time_ < var_328_4 + var_328_14 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_4) / var_328_14

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_4 + var_328_14 and arg_325_1.time_ < var_328_4 + var_328_14 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play121511088 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 121511088
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play121511089(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10042ui_story"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect10042ui_story == nil then
				arg_329_1.var_.characterEffect10042ui_story = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.200000002980232

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect10042ui_story then
					local var_332_4 = Mathf.Lerp(0, 0.5, var_332_3)

					arg_329_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10042ui_story.fillRatio = var_332_4
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect10042ui_story then
				local var_332_5 = 0.5

				arg_329_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10042ui_story.fillRatio = var_332_5
			end

			local var_332_6 = 0
			local var_332_7 = 0.8

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

				local var_332_9 = arg_329_1:GetWordFromCfg(121511088)
				local var_332_10 = arg_329_1:FormatText(var_332_9.content)

				arg_329_1.text_.text = var_332_10

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_11 = 32
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
	Play121511089 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 121511089
		arg_333_1.duration_ = 15.2

		local var_333_0 = {
			ja = 13.133,
			ko = 15.2,
			zh = 15.2
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
				arg_333_0:Play121511090(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["10042ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect10042ui_story == nil then
				arg_333_1.var_.characterEffect10042ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect10042ui_story then
					arg_333_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect10042ui_story then
				arg_333_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_336_4 = 0

			if var_336_4 < arg_333_1.time_ and arg_333_1.time_ <= var_336_4 + arg_336_0 then
				arg_333_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042actionlink/10042action423")
			end

			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 then
				arg_333_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_336_6 = 0
			local var_336_7 = 1.325

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_8 = arg_333_1:FormatText(StoryNameCfg[388].name)

				arg_333_1.leftNameTxt_.text = var_336_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_9 = arg_333_1:GetWordFromCfg(121511089)
				local var_336_10 = arg_333_1:FormatText(var_336_9.content)

				arg_333_1.text_.text = var_336_10

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_11 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511089", "story_v_out_121511.awb") ~= 0 then
					local var_336_14 = manager.audio:GetVoiceLength("story_v_out_121511", "121511089", "story_v_out_121511.awb") / 1000

					if var_336_14 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_14 + var_336_6
					end

					if var_336_9.prefab_name ~= "" and arg_333_1.actors_[var_336_9.prefab_name] ~= nil then
						local var_336_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_9.prefab_name].transform, "story_v_out_121511", "121511089", "story_v_out_121511.awb")

						arg_333_1:RecordAudio("121511089", var_336_15)
						arg_333_1:RecordAudio("121511089", var_336_15)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_121511", "121511089", "story_v_out_121511.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_121511", "121511089", "story_v_out_121511.awb")
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
	Play121511090 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 121511090
		arg_337_1.duration_ = 13.766

		local var_337_0 = {
			ja = 13,
			ko = 13.766,
			zh = 13.766
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play121511091(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 1.125

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[388].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(121511090)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 45
				local var_340_6 = utf8.len(var_340_4)
				local var_340_7 = var_340_5 <= 0 and var_340_1 or var_340_1 * (var_340_6 / var_340_5)

				if var_340_7 > 0 and var_340_1 < var_340_7 then
					arg_337_1.talkMaxDuration = var_340_7

					if var_340_7 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_7 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_4
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511090", "story_v_out_121511.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511090", "story_v_out_121511.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_121511", "121511090", "story_v_out_121511.awb")

						arg_337_1:RecordAudio("121511090", var_340_9)
						arg_337_1:RecordAudio("121511090", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_121511", "121511090", "story_v_out_121511.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_121511", "121511090", "story_v_out_121511.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_10 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_10 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_10

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_10 and arg_337_1.time_ < var_340_0 + var_340_10 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play121511091 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 121511091
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play121511092(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10042ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect10042ui_story == nil then
				arg_341_1.var_.characterEffect10042ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect10042ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_341_1.var_.characterEffect10042ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect10042ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_341_1.var_.characterEffect10042ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.8

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_8 = arg_341_1:FormatText(StoryNameCfg[7].name)

				arg_341_1.leftNameTxt_.text = var_344_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_9 = arg_341_1:GetWordFromCfg(121511091)
				local var_344_10 = arg_341_1:FormatText(var_344_9.content)

				arg_341_1.text_.text = var_344_10

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_11 = 32
				local var_344_12 = utf8.len(var_344_10)
				local var_344_13 = var_344_11 <= 0 and var_344_7 or var_344_7 * (var_344_12 / var_344_11)

				if var_344_13 > 0 and var_344_7 < var_344_13 then
					arg_341_1.talkMaxDuration = var_344_13

					if var_344_13 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_10
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_14 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_14 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_14

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_14 and arg_341_1.time_ < var_344_6 + var_344_14 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play121511092 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 121511092
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play121511093(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 1.25

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[7].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(121511092)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 50
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_8 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_8 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_8

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_8 and arg_345_1.time_ < var_348_0 + var_348_8 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play121511093 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 121511093
		arg_349_1.duration_ = 7.333

		local var_349_0 = {
			ja = 7.333,
			ko = 3,
			zh = 3
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play121511094(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["10042ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect10042ui_story == nil then
				arg_349_1.var_.characterEffect10042ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect10042ui_story then
					arg_349_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect10042ui_story then
				arg_349_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_352_4 = 0

			if var_352_4 < arg_349_1.time_ and arg_349_1.time_ <= var_352_4 + arg_352_0 then
				arg_349_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042actionlink/10042action432")
			end

			local var_352_5 = 0

			if var_352_5 < arg_349_1.time_ and arg_349_1.time_ <= var_352_5 + arg_352_0 then
				arg_349_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_352_6 = 0
			local var_352_7 = 0.375

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_8 = arg_349_1:FormatText(StoryNameCfg[388].name)

				arg_349_1.leftNameTxt_.text = var_352_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_9 = arg_349_1:GetWordFromCfg(121511093)
				local var_352_10 = arg_349_1:FormatText(var_352_9.content)

				arg_349_1.text_.text = var_352_10

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_11 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511093", "story_v_out_121511.awb") ~= 0 then
					local var_352_14 = manager.audio:GetVoiceLength("story_v_out_121511", "121511093", "story_v_out_121511.awb") / 1000

					if var_352_14 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_14 + var_352_6
					end

					if var_352_9.prefab_name ~= "" and arg_349_1.actors_[var_352_9.prefab_name] ~= nil then
						local var_352_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_9.prefab_name].transform, "story_v_out_121511", "121511093", "story_v_out_121511.awb")

						arg_349_1:RecordAudio("121511093", var_352_15)
						arg_349_1:RecordAudio("121511093", var_352_15)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_121511", "121511093", "story_v_out_121511.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_121511", "121511093", "story_v_out_121511.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_16 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_16 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_16

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_16 and arg_349_1.time_ < var_352_6 + var_352_16 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play121511094 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 121511094
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play121511095(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["10042ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect10042ui_story == nil then
				arg_353_1.var_.characterEffect10042ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect10042ui_story then
					local var_356_4 = Mathf.Lerp(0, 0.5, var_356_3)

					arg_353_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_353_1.var_.characterEffect10042ui_story.fillRatio = var_356_4
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect10042ui_story then
				local var_356_5 = 0.5

				arg_353_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_353_1.var_.characterEffect10042ui_story.fillRatio = var_356_5
			end

			local var_356_6 = 0
			local var_356_7 = 1.05

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_8 = arg_353_1:FormatText(StoryNameCfg[7].name)

				arg_353_1.leftNameTxt_.text = var_356_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_9 = arg_353_1:GetWordFromCfg(121511094)
				local var_356_10 = arg_353_1:FormatText(var_356_9.content)

				arg_353_1.text_.text = var_356_10

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_11 = 42
				local var_356_12 = utf8.len(var_356_10)
				local var_356_13 = var_356_11 <= 0 and var_356_7 or var_356_7 * (var_356_12 / var_356_11)

				if var_356_13 > 0 and var_356_7 < var_356_13 then
					arg_353_1.talkMaxDuration = var_356_13

					if var_356_13 + var_356_6 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_13 + var_356_6
					end
				end

				arg_353_1.text_.text = var_356_10
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_14 = math.max(var_356_7, arg_353_1.talkMaxDuration)

			if var_356_6 <= arg_353_1.time_ and arg_353_1.time_ < var_356_6 + var_356_14 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_6) / var_356_14

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_6 + var_356_14 and arg_353_1.time_ < var_356_6 + var_356_14 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play121511095 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 121511095
		arg_357_1.duration_ = 4.2

		local var_357_0 = {
			ja = 4.2,
			ko = 2.066,
			zh = 2.066
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
				arg_357_0:Play121511096(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10042ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect10042ui_story == nil then
				arg_357_1.var_.characterEffect10042ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect10042ui_story then
					arg_357_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect10042ui_story then
				arg_357_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_360_4 = 0
			local var_360_5 = 0.1

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_6 = arg_357_1:FormatText(StoryNameCfg[388].name)

				arg_357_1.leftNameTxt_.text = var_360_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_7 = arg_357_1:GetWordFromCfg(121511095)
				local var_360_8 = arg_357_1:FormatText(var_360_7.content)

				arg_357_1.text_.text = var_360_8

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_9 = 4
				local var_360_10 = utf8.len(var_360_8)
				local var_360_11 = var_360_9 <= 0 and var_360_5 or var_360_5 * (var_360_10 / var_360_9)

				if var_360_11 > 0 and var_360_5 < var_360_11 then
					arg_357_1.talkMaxDuration = var_360_11

					if var_360_11 + var_360_4 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_11 + var_360_4
					end
				end

				arg_357_1.text_.text = var_360_8
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511095", "story_v_out_121511.awb") ~= 0 then
					local var_360_12 = manager.audio:GetVoiceLength("story_v_out_121511", "121511095", "story_v_out_121511.awb") / 1000

					if var_360_12 + var_360_4 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_12 + var_360_4
					end

					if var_360_7.prefab_name ~= "" and arg_357_1.actors_[var_360_7.prefab_name] ~= nil then
						local var_360_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_7.prefab_name].transform, "story_v_out_121511", "121511095", "story_v_out_121511.awb")

						arg_357_1:RecordAudio("121511095", var_360_13)
						arg_357_1:RecordAudio("121511095", var_360_13)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_121511", "121511095", "story_v_out_121511.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_121511", "121511095", "story_v_out_121511.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_14 = math.max(var_360_5, arg_357_1.talkMaxDuration)

			if var_360_4 <= arg_357_1.time_ and arg_357_1.time_ < var_360_4 + var_360_14 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_4) / var_360_14

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_4 + var_360_14 and arg_357_1.time_ < var_360_4 + var_360_14 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play121511096 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 121511096
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play121511097(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["10042ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect10042ui_story == nil then
				arg_361_1.var_.characterEffect10042ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.200000002980232

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect10042ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_361_1.var_.characterEffect10042ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect10042ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_361_1.var_.characterEffect10042ui_story.fillRatio = var_364_5
			end

			local var_364_6 = 0
			local var_364_7 = 0.8

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

				local var_364_8 = arg_361_1:GetWordFromCfg(121511096)
				local var_364_9 = arg_361_1:FormatText(var_364_8.content)

				arg_361_1.text_.text = var_364_9

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_10 = 32
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
	Play121511097 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 121511097
		arg_365_1.duration_ = 9.033

		local var_365_0 = {
			ja = 6.8,
			ko = 9.033,
			zh = 9.033
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
				arg_365_0:Play121511098(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10042ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect10042ui_story == nil then
				arg_365_1.var_.characterEffect10042ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.200000002980232

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect10042ui_story then
					arg_365_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect10042ui_story then
				arg_365_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_368_4 = 0
			local var_368_5 = 0.925

			if var_368_4 < arg_365_1.time_ and arg_365_1.time_ <= var_368_4 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_6 = arg_365_1:FormatText(StoryNameCfg[388].name)

				arg_365_1.leftNameTxt_.text = var_368_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_7 = arg_365_1:GetWordFromCfg(121511097)
				local var_368_8 = arg_365_1:FormatText(var_368_7.content)

				arg_365_1.text_.text = var_368_8

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_9 = 37
				local var_368_10 = utf8.len(var_368_8)
				local var_368_11 = var_368_9 <= 0 and var_368_5 or var_368_5 * (var_368_10 / var_368_9)

				if var_368_11 > 0 and var_368_5 < var_368_11 then
					arg_365_1.talkMaxDuration = var_368_11

					if var_368_11 + var_368_4 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_11 + var_368_4
					end
				end

				arg_365_1.text_.text = var_368_8
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511097", "story_v_out_121511.awb") ~= 0 then
					local var_368_12 = manager.audio:GetVoiceLength("story_v_out_121511", "121511097", "story_v_out_121511.awb") / 1000

					if var_368_12 + var_368_4 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_12 + var_368_4
					end

					if var_368_7.prefab_name ~= "" and arg_365_1.actors_[var_368_7.prefab_name] ~= nil then
						local var_368_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_7.prefab_name].transform, "story_v_out_121511", "121511097", "story_v_out_121511.awb")

						arg_365_1:RecordAudio("121511097", var_368_13)
						arg_365_1:RecordAudio("121511097", var_368_13)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_121511", "121511097", "story_v_out_121511.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_121511", "121511097", "story_v_out_121511.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_14 = math.max(var_368_5, arg_365_1.talkMaxDuration)

			if var_368_4 <= arg_365_1.time_ and arg_365_1.time_ < var_368_4 + var_368_14 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_4) / var_368_14

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_4 + var_368_14 and arg_365_1.time_ < var_368_4 + var_368_14 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play121511098 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 121511098
		arg_369_1.duration_ = 13.3

		local var_369_0 = {
			ja = 13.3,
			ko = 11.4,
			zh = 11.4
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
				arg_369_0:Play121511099(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042actionlink/10042action423")
			end

			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_372_2 = 0
			local var_372_3 = 1.2

			if var_372_2 < arg_369_1.time_ and arg_369_1.time_ <= var_372_2 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_4 = arg_369_1:FormatText(StoryNameCfg[388].name)

				arg_369_1.leftNameTxt_.text = var_372_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_5 = arg_369_1:GetWordFromCfg(121511098)
				local var_372_6 = arg_369_1:FormatText(var_372_5.content)

				arg_369_1.text_.text = var_372_6

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_7 = 48
				local var_372_8 = utf8.len(var_372_6)
				local var_372_9 = var_372_7 <= 0 and var_372_3 or var_372_3 * (var_372_8 / var_372_7)

				if var_372_9 > 0 and var_372_3 < var_372_9 then
					arg_369_1.talkMaxDuration = var_372_9

					if var_372_9 + var_372_2 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_9 + var_372_2
					end
				end

				arg_369_1.text_.text = var_372_6
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511098", "story_v_out_121511.awb") ~= 0 then
					local var_372_10 = manager.audio:GetVoiceLength("story_v_out_121511", "121511098", "story_v_out_121511.awb") / 1000

					if var_372_10 + var_372_2 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_10 + var_372_2
					end

					if var_372_5.prefab_name ~= "" and arg_369_1.actors_[var_372_5.prefab_name] ~= nil then
						local var_372_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_5.prefab_name].transform, "story_v_out_121511", "121511098", "story_v_out_121511.awb")

						arg_369_1:RecordAudio("121511098", var_372_11)
						arg_369_1:RecordAudio("121511098", var_372_11)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_121511", "121511098", "story_v_out_121511.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_121511", "121511098", "story_v_out_121511.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_12 = math.max(var_372_3, arg_369_1.talkMaxDuration)

			if var_372_2 <= arg_369_1.time_ and arg_369_1.time_ < var_372_2 + var_372_12 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_2) / var_372_12

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_2 + var_372_12 and arg_369_1.time_ < var_372_2 + var_372_12 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play121511099 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 121511099
		arg_373_1.duration_ = 6.2

		local var_373_0 = {
			ja = 6.2,
			ko = 4.9,
			zh = 4.9
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play121511100(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.45

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[388].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(121511099)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 18
				local var_376_6 = utf8.len(var_376_4)
				local var_376_7 = var_376_5 <= 0 and var_376_1 or var_376_1 * (var_376_6 / var_376_5)

				if var_376_7 > 0 and var_376_1 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_4
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511099", "story_v_out_121511.awb") ~= 0 then
					local var_376_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511099", "story_v_out_121511.awb") / 1000

					if var_376_8 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_8 + var_376_0
					end

					if var_376_3.prefab_name ~= "" and arg_373_1.actors_[var_376_3.prefab_name] ~= nil then
						local var_376_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_3.prefab_name].transform, "story_v_out_121511", "121511099", "story_v_out_121511.awb")

						arg_373_1:RecordAudio("121511099", var_376_9)
						arg_373_1:RecordAudio("121511099", var_376_9)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_121511", "121511099", "story_v_out_121511.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_121511", "121511099", "story_v_out_121511.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_10 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_10 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_10

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_10 and arg_373_1.time_ < var_376_0 + var_376_10 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play121511100 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 121511100
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play121511101(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["10042ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect10042ui_story == nil then
				arg_377_1.var_.characterEffect10042ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.2

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect10042ui_story then
					local var_380_4 = Mathf.Lerp(0, 0.5, var_380_3)

					arg_377_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_377_1.var_.characterEffect10042ui_story.fillRatio = var_380_4
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect10042ui_story then
				local var_380_5 = 0.5

				arg_377_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_377_1.var_.characterEffect10042ui_story.fillRatio = var_380_5
			end

			local var_380_6 = 0
			local var_380_7 = 0.6

			if var_380_6 < arg_377_1.time_ and arg_377_1.time_ <= var_380_6 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_8 = arg_377_1:FormatText(StoryNameCfg[7].name)

				arg_377_1.leftNameTxt_.text = var_380_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_9 = arg_377_1:GetWordFromCfg(121511100)
				local var_380_10 = arg_377_1:FormatText(var_380_9.content)

				arg_377_1.text_.text = var_380_10

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_11 = 24
				local var_380_12 = utf8.len(var_380_10)
				local var_380_13 = var_380_11 <= 0 and var_380_7 or var_380_7 * (var_380_12 / var_380_11)

				if var_380_13 > 0 and var_380_7 < var_380_13 then
					arg_377_1.talkMaxDuration = var_380_13

					if var_380_13 + var_380_6 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_13 + var_380_6
					end
				end

				arg_377_1.text_.text = var_380_10
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_14 = math.max(var_380_7, arg_377_1.talkMaxDuration)

			if var_380_6 <= arg_377_1.time_ and arg_377_1.time_ < var_380_6 + var_380_14 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_6) / var_380_14

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_6 + var_380_14 and arg_377_1.time_ < var_380_6 + var_380_14 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play121511101 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 121511101
		arg_381_1.duration_ = 13.633

		local var_381_0 = {
			ja = 13.633,
			ko = 12.233,
			zh = 12.233
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play121511102(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["10042ui_story"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.characterEffect10042ui_story == nil then
				arg_381_1.var_.characterEffect10042ui_story = var_384_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_2 = 0.200000002980232

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.characterEffect10042ui_story then
					arg_381_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.characterEffect10042ui_story then
				arg_381_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_384_4 = 0

			if var_384_4 < arg_381_1.time_ and arg_381_1.time_ <= var_384_4 + arg_384_0 then
				arg_381_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042actionlink/10042action432")
			end

			local var_384_5 = 0

			if var_384_5 < arg_381_1.time_ and arg_381_1.time_ <= var_384_5 + arg_384_0 then
				arg_381_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_384_6 = 0
			local var_384_7 = 0.85

			if var_384_6 < arg_381_1.time_ and arg_381_1.time_ <= var_384_6 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_8 = arg_381_1:FormatText(StoryNameCfg[388].name)

				arg_381_1.leftNameTxt_.text = var_384_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_9 = arg_381_1:GetWordFromCfg(121511101)
				local var_384_10 = arg_381_1:FormatText(var_384_9.content)

				arg_381_1.text_.text = var_384_10

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_11 = 34
				local var_384_12 = utf8.len(var_384_10)
				local var_384_13 = var_384_11 <= 0 and var_384_7 or var_384_7 * (var_384_12 / var_384_11)

				if var_384_13 > 0 and var_384_7 < var_384_13 then
					arg_381_1.talkMaxDuration = var_384_13

					if var_384_13 + var_384_6 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_13 + var_384_6
					end
				end

				arg_381_1.text_.text = var_384_10
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511101", "story_v_out_121511.awb") ~= 0 then
					local var_384_14 = manager.audio:GetVoiceLength("story_v_out_121511", "121511101", "story_v_out_121511.awb") / 1000

					if var_384_14 + var_384_6 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_14 + var_384_6
					end

					if var_384_9.prefab_name ~= "" and arg_381_1.actors_[var_384_9.prefab_name] ~= nil then
						local var_384_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_9.prefab_name].transform, "story_v_out_121511", "121511101", "story_v_out_121511.awb")

						arg_381_1:RecordAudio("121511101", var_384_15)
						arg_381_1:RecordAudio("121511101", var_384_15)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_121511", "121511101", "story_v_out_121511.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_121511", "121511101", "story_v_out_121511.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_16 = math.max(var_384_7, arg_381_1.talkMaxDuration)

			if var_384_6 <= arg_381_1.time_ and arg_381_1.time_ < var_384_6 + var_384_16 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_6) / var_384_16

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_6 + var_384_16 and arg_381_1.time_ < var_384_6 + var_384_16 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play121511102 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 121511102
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play121511103(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["10042ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos10042ui_story = var_388_0.localPosition
			end

			local var_388_2 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2
				local var_388_4 = Vector3.New(0, 100, 0)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos10042ui_story, var_388_4, var_388_3)

				local var_388_5 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_5.x, var_388_5.y, var_388_5.z)

				local var_388_6 = var_388_0.localEulerAngles

				var_388_6.z = 0
				var_388_6.x = 0
				var_388_0.localEulerAngles = var_388_6
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0, 100, 0)

				local var_388_7 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_7.x, var_388_7.y, var_388_7.z)

				local var_388_8 = var_388_0.localEulerAngles

				var_388_8.z = 0
				var_388_8.x = 0
				var_388_0.localEulerAngles = var_388_8
			end

			local var_388_9 = arg_385_1.actors_["10042ui_story"]
			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 and arg_385_1.var_.characterEffect10042ui_story == nil then
				arg_385_1.var_.characterEffect10042ui_story = var_388_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_11 = 0.200000002980232

			if var_388_10 <= arg_385_1.time_ and arg_385_1.time_ < var_388_10 + var_388_11 then
				local var_388_12 = (arg_385_1.time_ - var_388_10) / var_388_11

				if arg_385_1.var_.characterEffect10042ui_story then
					local var_388_13 = Mathf.Lerp(0, 0.5, var_388_12)

					arg_385_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_385_1.var_.characterEffect10042ui_story.fillRatio = var_388_13
				end
			end

			if arg_385_1.time_ >= var_388_10 + var_388_11 and arg_385_1.time_ < var_388_10 + var_388_11 + arg_388_0 and arg_385_1.var_.characterEffect10042ui_story then
				local var_388_14 = 0.5

				arg_385_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_385_1.var_.characterEffect10042ui_story.fillRatio = var_388_14
			end

			local var_388_15 = 0
			local var_388_16 = 1.7

			if var_388_15 < arg_385_1.time_ and arg_385_1.time_ <= var_388_15 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_17 = arg_385_1:GetWordFromCfg(121511102)
				local var_388_18 = arg_385_1:FormatText(var_388_17.content)

				arg_385_1.text_.text = var_388_18

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_19 = 68
				local var_388_20 = utf8.len(var_388_18)
				local var_388_21 = var_388_19 <= 0 and var_388_16 or var_388_16 * (var_388_20 / var_388_19)

				if var_388_21 > 0 and var_388_16 < var_388_21 then
					arg_385_1.talkMaxDuration = var_388_21

					if var_388_21 + var_388_15 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_21 + var_388_15
					end
				end

				arg_385_1.text_.text = var_388_18
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_22 = math.max(var_388_16, arg_385_1.talkMaxDuration)

			if var_388_15 <= arg_385_1.time_ and arg_385_1.time_ < var_388_15 + var_388_22 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_15) / var_388_22

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_15 + var_388_22 and arg_385_1.time_ < var_388_15 + var_388_22 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play121511103 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 121511103
		arg_389_1.duration_ = 4.933

		local var_389_0 = {
			ja = 4.933,
			ko = 4.466,
			zh = 4.466
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
				arg_389_0:Play121511104(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1075ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1075ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(-0.7, -1.055, -6.16)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1075ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1075ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1075ui_story == nil then
				arg_389_1.var_.characterEffect1075ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1075ui_story then
					arg_389_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1075ui_story then
				arg_389_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_392_13 = 0

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 then
				arg_389_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_392_15 = arg_389_1.actors_["1184ui_story"].transform
			local var_392_16 = 0

			if var_392_16 < arg_389_1.time_ and arg_389_1.time_ <= var_392_16 + arg_392_0 then
				arg_389_1.var_.moveOldPos1184ui_story = var_392_15.localPosition
			end

			local var_392_17 = 0.001

			if var_392_16 <= arg_389_1.time_ and arg_389_1.time_ < var_392_16 + var_392_17 then
				local var_392_18 = (arg_389_1.time_ - var_392_16) / var_392_17
				local var_392_19 = Vector3.New(0.7, -0.97, -6)

				var_392_15.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1184ui_story, var_392_19, var_392_18)

				local var_392_20 = manager.ui.mainCamera.transform.position - var_392_15.position

				var_392_15.forward = Vector3.New(var_392_20.x, var_392_20.y, var_392_20.z)

				local var_392_21 = var_392_15.localEulerAngles

				var_392_21.z = 0
				var_392_21.x = 0
				var_392_15.localEulerAngles = var_392_21
			end

			if arg_389_1.time_ >= var_392_16 + var_392_17 and arg_389_1.time_ < var_392_16 + var_392_17 + arg_392_0 then
				var_392_15.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_392_22 = manager.ui.mainCamera.transform.position - var_392_15.position

				var_392_15.forward = Vector3.New(var_392_22.x, var_392_22.y, var_392_22.z)

				local var_392_23 = var_392_15.localEulerAngles

				var_392_23.z = 0
				var_392_23.x = 0
				var_392_15.localEulerAngles = var_392_23
			end

			local var_392_24 = arg_389_1.actors_["1184ui_story"]
			local var_392_25 = 0

			if var_392_25 < arg_389_1.time_ and arg_389_1.time_ <= var_392_25 + arg_392_0 and arg_389_1.var_.characterEffect1184ui_story == nil then
				arg_389_1.var_.characterEffect1184ui_story = var_392_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_26 = 0.200000002980232

			if var_392_25 <= arg_389_1.time_ and arg_389_1.time_ < var_392_25 + var_392_26 then
				local var_392_27 = (arg_389_1.time_ - var_392_25) / var_392_26

				if arg_389_1.var_.characterEffect1184ui_story then
					local var_392_28 = Mathf.Lerp(0, 0.5, var_392_27)

					arg_389_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_389_1.var_.characterEffect1184ui_story.fillRatio = var_392_28
				end
			end

			if arg_389_1.time_ >= var_392_25 + var_392_26 and arg_389_1.time_ < var_392_25 + var_392_26 + arg_392_0 and arg_389_1.var_.characterEffect1184ui_story then
				local var_392_29 = 0.5

				arg_389_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_389_1.var_.characterEffect1184ui_story.fillRatio = var_392_29
			end

			local var_392_30 = 0

			if var_392_30 < arg_389_1.time_ and arg_389_1.time_ <= var_392_30 + arg_392_0 then
				arg_389_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_392_31 = 0

			if var_392_31 < arg_389_1.time_ and arg_389_1.time_ <= var_392_31 + arg_392_0 then
				arg_389_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_392_32 = 0
			local var_392_33 = 0.575

			if var_392_32 < arg_389_1.time_ and arg_389_1.time_ <= var_392_32 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_34 = arg_389_1:FormatText(StoryNameCfg[381].name)

				arg_389_1.leftNameTxt_.text = var_392_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_35 = arg_389_1:GetWordFromCfg(121511103)
				local var_392_36 = arg_389_1:FormatText(var_392_35.content)

				arg_389_1.text_.text = var_392_36

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_37 = 23
				local var_392_38 = utf8.len(var_392_36)
				local var_392_39 = var_392_37 <= 0 and var_392_33 or var_392_33 * (var_392_38 / var_392_37)

				if var_392_39 > 0 and var_392_33 < var_392_39 then
					arg_389_1.talkMaxDuration = var_392_39

					if var_392_39 + var_392_32 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_39 + var_392_32
					end
				end

				arg_389_1.text_.text = var_392_36
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511103", "story_v_out_121511.awb") ~= 0 then
					local var_392_40 = manager.audio:GetVoiceLength("story_v_out_121511", "121511103", "story_v_out_121511.awb") / 1000

					if var_392_40 + var_392_32 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_40 + var_392_32
					end

					if var_392_35.prefab_name ~= "" and arg_389_1.actors_[var_392_35.prefab_name] ~= nil then
						local var_392_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_35.prefab_name].transform, "story_v_out_121511", "121511103", "story_v_out_121511.awb")

						arg_389_1:RecordAudio("121511103", var_392_41)
						arg_389_1:RecordAudio("121511103", var_392_41)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_121511", "121511103", "story_v_out_121511.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_121511", "121511103", "story_v_out_121511.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_42 = math.max(var_392_33, arg_389_1.talkMaxDuration)

			if var_392_32 <= arg_389_1.time_ and arg_389_1.time_ < var_392_32 + var_392_42 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_32) / var_392_42

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_32 + var_392_42 and arg_389_1.time_ < var_392_32 + var_392_42 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play121511104 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 121511104
		arg_393_1.duration_ = 8.166

		local var_393_0 = {
			ja = 8.166,
			ko = 4.266,
			zh = 4.266
		}
		local var_393_1 = manager.audio:GetLocalizationFlag()

		if var_393_0[var_393_1] ~= nil then
			arg_393_1.duration_ = var_393_0[var_393_1]
		end

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play121511105(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1184ui_story"].transform
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1.var_.moveOldPos1184ui_story = var_396_0.localPosition
			end

			local var_396_2 = 0.001

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2
				local var_396_4 = Vector3.New(0.7, -0.97, -6)

				var_396_0.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos1184ui_story, var_396_4, var_396_3)

				local var_396_5 = manager.ui.mainCamera.transform.position - var_396_0.position

				var_396_0.forward = Vector3.New(var_396_5.x, var_396_5.y, var_396_5.z)

				local var_396_6 = var_396_0.localEulerAngles

				var_396_6.z = 0
				var_396_6.x = 0
				var_396_0.localEulerAngles = var_396_6
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 then
				var_396_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_396_7 = manager.ui.mainCamera.transform.position - var_396_0.position

				var_396_0.forward = Vector3.New(var_396_7.x, var_396_7.y, var_396_7.z)

				local var_396_8 = var_396_0.localEulerAngles

				var_396_8.z = 0
				var_396_8.x = 0
				var_396_0.localEulerAngles = var_396_8
			end

			local var_396_9 = arg_393_1.actors_["1184ui_story"]
			local var_396_10 = 0

			if var_396_10 < arg_393_1.time_ and arg_393_1.time_ <= var_396_10 + arg_396_0 and arg_393_1.var_.characterEffect1184ui_story == nil then
				arg_393_1.var_.characterEffect1184ui_story = var_396_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_11 = 0.200000002980232

			if var_396_10 <= arg_393_1.time_ and arg_393_1.time_ < var_396_10 + var_396_11 then
				local var_396_12 = (arg_393_1.time_ - var_396_10) / var_396_11

				if arg_393_1.var_.characterEffect1184ui_story then
					arg_393_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_10 + var_396_11 and arg_393_1.time_ < var_396_10 + var_396_11 + arg_396_0 and arg_393_1.var_.characterEffect1184ui_story then
				arg_393_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_396_13 = 0

			if var_396_13 < arg_393_1.time_ and arg_393_1.time_ <= var_396_13 + arg_396_0 then
				arg_393_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_396_14 = arg_393_1.actors_["1075ui_story"]
			local var_396_15 = 0

			if var_396_15 < arg_393_1.time_ and arg_393_1.time_ <= var_396_15 + arg_396_0 and arg_393_1.var_.characterEffect1075ui_story == nil then
				arg_393_1.var_.characterEffect1075ui_story = var_396_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_16 = 0.200000002980232

			if var_396_15 <= arg_393_1.time_ and arg_393_1.time_ < var_396_15 + var_396_16 then
				local var_396_17 = (arg_393_1.time_ - var_396_15) / var_396_16

				if arg_393_1.var_.characterEffect1075ui_story then
					local var_396_18 = Mathf.Lerp(0, 0.5, var_396_17)

					arg_393_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1075ui_story.fillRatio = var_396_18
				end
			end

			if arg_393_1.time_ >= var_396_15 + var_396_16 and arg_393_1.time_ < var_396_15 + var_396_16 + arg_396_0 and arg_393_1.var_.characterEffect1075ui_story then
				local var_396_19 = 0.5

				arg_393_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1075ui_story.fillRatio = var_396_19
			end

			local var_396_20 = 0

			if var_396_20 < arg_393_1.time_ and arg_393_1.time_ <= var_396_20 + arg_396_0 then
				arg_393_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_396_21 = 0
			local var_396_22 = 0.55

			if var_396_21 < arg_393_1.time_ and arg_393_1.time_ <= var_396_21 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_23 = arg_393_1:FormatText(StoryNameCfg[6].name)

				arg_393_1.leftNameTxt_.text = var_396_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_24 = arg_393_1:GetWordFromCfg(121511104)
				local var_396_25 = arg_393_1:FormatText(var_396_24.content)

				arg_393_1.text_.text = var_396_25

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_26 = 22
				local var_396_27 = utf8.len(var_396_25)
				local var_396_28 = var_396_26 <= 0 and var_396_22 or var_396_22 * (var_396_27 / var_396_26)

				if var_396_28 > 0 and var_396_22 < var_396_28 then
					arg_393_1.talkMaxDuration = var_396_28

					if var_396_28 + var_396_21 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_28 + var_396_21
					end
				end

				arg_393_1.text_.text = var_396_25
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511104", "story_v_out_121511.awb") ~= 0 then
					local var_396_29 = manager.audio:GetVoiceLength("story_v_out_121511", "121511104", "story_v_out_121511.awb") / 1000

					if var_396_29 + var_396_21 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_29 + var_396_21
					end

					if var_396_24.prefab_name ~= "" and arg_393_1.actors_[var_396_24.prefab_name] ~= nil then
						local var_396_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_24.prefab_name].transform, "story_v_out_121511", "121511104", "story_v_out_121511.awb")

						arg_393_1:RecordAudio("121511104", var_396_30)
						arg_393_1:RecordAudio("121511104", var_396_30)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_121511", "121511104", "story_v_out_121511.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_121511", "121511104", "story_v_out_121511.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_31 = math.max(var_396_22, arg_393_1.talkMaxDuration)

			if var_396_21 <= arg_393_1.time_ and arg_393_1.time_ < var_396_21 + var_396_31 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_21) / var_396_31

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_21 + var_396_31 and arg_393_1.time_ < var_396_21 + var_396_31 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play121511105 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 121511105
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play121511106(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1184ui_story"].transform
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1.var_.moveOldPos1184ui_story = var_400_0.localPosition

				local var_400_2 = "1184ui_story"

				arg_397_1:ShowWeapon(arg_397_1.var_[var_400_2 .. "Animator"].transform, false)
			end

			local var_400_3 = 0.001

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_3 then
				local var_400_4 = (arg_397_1.time_ - var_400_1) / var_400_3
				local var_400_5 = Vector3.New(0, 100, 0)

				var_400_0.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1184ui_story, var_400_5, var_400_4)

				local var_400_6 = manager.ui.mainCamera.transform.position - var_400_0.position

				var_400_0.forward = Vector3.New(var_400_6.x, var_400_6.y, var_400_6.z)

				local var_400_7 = var_400_0.localEulerAngles

				var_400_7.z = 0
				var_400_7.x = 0
				var_400_0.localEulerAngles = var_400_7
			end

			if arg_397_1.time_ >= var_400_1 + var_400_3 and arg_397_1.time_ < var_400_1 + var_400_3 + arg_400_0 then
				var_400_0.localPosition = Vector3.New(0, 100, 0)

				local var_400_8 = manager.ui.mainCamera.transform.position - var_400_0.position

				var_400_0.forward = Vector3.New(var_400_8.x, var_400_8.y, var_400_8.z)

				local var_400_9 = var_400_0.localEulerAngles

				var_400_9.z = 0
				var_400_9.x = 0
				var_400_0.localEulerAngles = var_400_9
			end

			local var_400_10 = arg_397_1.actors_["1184ui_story"]
			local var_400_11 = 0

			if var_400_11 < arg_397_1.time_ and arg_397_1.time_ <= var_400_11 + arg_400_0 and arg_397_1.var_.characterEffect1184ui_story == nil then
				arg_397_1.var_.characterEffect1184ui_story = var_400_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_12 = 0.200000002980232

			if var_400_11 <= arg_397_1.time_ and arg_397_1.time_ < var_400_11 + var_400_12 then
				local var_400_13 = (arg_397_1.time_ - var_400_11) / var_400_12

				if arg_397_1.var_.characterEffect1184ui_story then
					local var_400_14 = Mathf.Lerp(0, 0.5, var_400_13)

					arg_397_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1184ui_story.fillRatio = var_400_14
				end
			end

			if arg_397_1.time_ >= var_400_11 + var_400_12 and arg_397_1.time_ < var_400_11 + var_400_12 + arg_400_0 and arg_397_1.var_.characterEffect1184ui_story then
				local var_400_15 = 0.5

				arg_397_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1184ui_story.fillRatio = var_400_15
			end

			local var_400_16 = arg_397_1.actors_["1075ui_story"].transform
			local var_400_17 = 0

			if var_400_17 < arg_397_1.time_ and arg_397_1.time_ <= var_400_17 + arg_400_0 then
				arg_397_1.var_.moveOldPos1075ui_story = var_400_16.localPosition
			end

			local var_400_18 = 0.001

			if var_400_17 <= arg_397_1.time_ and arg_397_1.time_ < var_400_17 + var_400_18 then
				local var_400_19 = (arg_397_1.time_ - var_400_17) / var_400_18
				local var_400_20 = Vector3.New(0, 100, 0)

				var_400_16.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1075ui_story, var_400_20, var_400_19)

				local var_400_21 = manager.ui.mainCamera.transform.position - var_400_16.position

				var_400_16.forward = Vector3.New(var_400_21.x, var_400_21.y, var_400_21.z)

				local var_400_22 = var_400_16.localEulerAngles

				var_400_22.z = 0
				var_400_22.x = 0
				var_400_16.localEulerAngles = var_400_22
			end

			if arg_397_1.time_ >= var_400_17 + var_400_18 and arg_397_1.time_ < var_400_17 + var_400_18 + arg_400_0 then
				var_400_16.localPosition = Vector3.New(0, 100, 0)

				local var_400_23 = manager.ui.mainCamera.transform.position - var_400_16.position

				var_400_16.forward = Vector3.New(var_400_23.x, var_400_23.y, var_400_23.z)

				local var_400_24 = var_400_16.localEulerAngles

				var_400_24.z = 0
				var_400_24.x = 0
				var_400_16.localEulerAngles = var_400_24
			end

			local var_400_25 = arg_397_1.actors_["1075ui_story"]
			local var_400_26 = 0

			if var_400_26 < arg_397_1.time_ and arg_397_1.time_ <= var_400_26 + arg_400_0 and arg_397_1.var_.characterEffect1075ui_story == nil then
				arg_397_1.var_.characterEffect1075ui_story = var_400_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_27 = 0.200000002980232

			if var_400_26 <= arg_397_1.time_ and arg_397_1.time_ < var_400_26 + var_400_27 then
				local var_400_28 = (arg_397_1.time_ - var_400_26) / var_400_27

				if arg_397_1.var_.characterEffect1075ui_story then
					local var_400_29 = Mathf.Lerp(0, 0.5, var_400_28)

					arg_397_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1075ui_story.fillRatio = var_400_29
				end
			end

			if arg_397_1.time_ >= var_400_26 + var_400_27 and arg_397_1.time_ < var_400_26 + var_400_27 + arg_400_0 and arg_397_1.var_.characterEffect1075ui_story then
				local var_400_30 = 0.5

				arg_397_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1075ui_story.fillRatio = var_400_30
			end

			local var_400_31 = 0
			local var_400_32 = 0.633333333333333

			if var_400_31 < arg_397_1.time_ and arg_397_1.time_ <= var_400_31 + arg_400_0 then
				local var_400_33 = "play"
				local var_400_34 = "effect"

				arg_397_1:AudioAction(var_400_33, var_400_34, "se_story_16", "se_story_16_gun02", "")
			end

			local var_400_35 = manager.ui.mainCamera.transform
			local var_400_36 = 0

			if var_400_36 < arg_397_1.time_ and arg_397_1.time_ <= var_400_36 + arg_400_0 then
				arg_397_1.var_.shakeOldPos = var_400_35.localPosition
			end

			local var_400_37 = 0.6

			if var_400_36 <= arg_397_1.time_ and arg_397_1.time_ < var_400_36 + var_400_37 then
				local var_400_38 = (arg_397_1.time_ - var_400_36) / 0.066
				local var_400_39, var_400_40 = math.modf(var_400_38)

				var_400_35.localPosition = Vector3.New(var_400_40 * 0.13, var_400_40 * 0.13, var_400_40 * 0.13) + arg_397_1.var_.shakeOldPos
			end

			if arg_397_1.time_ >= var_400_36 + var_400_37 and arg_397_1.time_ < var_400_36 + var_400_37 + arg_400_0 then
				var_400_35.localPosition = arg_397_1.var_.shakeOldPos
			end

			local var_400_41 = 0

			if var_400_41 < arg_397_1.time_ and arg_397_1.time_ <= var_400_41 + arg_400_0 then
				arg_397_1.allBtn_.enabled = false
			end

			local var_400_42 = 0.6

			if arg_397_1.time_ >= var_400_41 + var_400_42 and arg_397_1.time_ < var_400_41 + var_400_42 + arg_400_0 then
				arg_397_1.allBtn_.enabled = true
			end

			local var_400_43 = 0
			local var_400_44 = 1

			if var_400_43 < arg_397_1.time_ and arg_397_1.time_ <= var_400_43 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_45 = arg_397_1:GetWordFromCfg(121511105)
				local var_400_46 = arg_397_1:FormatText(var_400_45.content)

				arg_397_1.text_.text = var_400_46

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_47 = 40
				local var_400_48 = utf8.len(var_400_46)
				local var_400_49 = var_400_47 <= 0 and var_400_44 or var_400_44 * (var_400_48 / var_400_47)

				if var_400_49 > 0 and var_400_44 < var_400_49 then
					arg_397_1.talkMaxDuration = var_400_49

					if var_400_49 + var_400_43 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_49 + var_400_43
					end
				end

				arg_397_1.text_.text = var_400_46
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_50 = math.max(var_400_44, arg_397_1.talkMaxDuration)

			if var_400_43 <= arg_397_1.time_ and arg_397_1.time_ < var_400_43 + var_400_50 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_43) / var_400_50

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_43 + var_400_50 and arg_397_1.time_ < var_400_43 + var_400_50 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play121511106 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 121511106
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play121511107(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 1.675

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_2 = arg_401_1:GetWordFromCfg(121511106)
				local var_404_3 = arg_401_1:FormatText(var_404_2.content)

				arg_401_1.text_.text = var_404_3

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_4 = 67
				local var_404_5 = utf8.len(var_404_3)
				local var_404_6 = var_404_4 <= 0 and var_404_1 or var_404_1 * (var_404_5 / var_404_4)

				if var_404_6 > 0 and var_404_1 < var_404_6 then
					arg_401_1.talkMaxDuration = var_404_6

					if var_404_6 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_6 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_3
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_7 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_7 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_7

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_7 and arg_401_1.time_ < var_404_0 + var_404_7 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play121511107 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 121511107
		arg_405_1.duration_ = 5.666

		local var_405_0 = {
			ja = 5.666,
			ko = 3.066,
			zh = 3.066
		}
		local var_405_1 = manager.audio:GetLocalizationFlag()

		if var_405_0[var_405_1] ~= nil then
			arg_405_1.duration_ = var_405_0[var_405_1]
		end

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play121511108(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1184ui_story"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos1184ui_story = var_408_0.localPosition
			end

			local var_408_2 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2
				local var_408_4 = Vector3.New(-0.7, -0.97, -6)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1184ui_story, var_408_4, var_408_3)

				local var_408_5 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_5.x, var_408_5.y, var_408_5.z)

				local var_408_6 = var_408_0.localEulerAngles

				var_408_6.z = 0
				var_408_6.x = 0
				var_408_0.localEulerAngles = var_408_6
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_408_7 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_7.x, var_408_7.y, var_408_7.z)

				local var_408_8 = var_408_0.localEulerAngles

				var_408_8.z = 0
				var_408_8.x = 0
				var_408_0.localEulerAngles = var_408_8
			end

			local var_408_9 = arg_405_1.actors_["1184ui_story"]
			local var_408_10 = 0

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 and arg_405_1.var_.characterEffect1184ui_story == nil then
				arg_405_1.var_.characterEffect1184ui_story = var_408_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_11 = 0.200000002980232

			if var_408_10 <= arg_405_1.time_ and arg_405_1.time_ < var_408_10 + var_408_11 then
				local var_408_12 = (arg_405_1.time_ - var_408_10) / var_408_11

				if arg_405_1.var_.characterEffect1184ui_story then
					arg_405_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_10 + var_408_11 and arg_405_1.time_ < var_408_10 + var_408_11 + arg_408_0 and arg_405_1.var_.characterEffect1184ui_story then
				arg_405_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_408_13 = 0

			if var_408_13 < arg_405_1.time_ and arg_405_1.time_ <= var_408_13 + arg_408_0 then
				arg_405_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_408_14 = arg_405_1.actors_["10042ui_story"].transform
			local var_408_15 = 0

			if var_408_15 < arg_405_1.time_ and arg_405_1.time_ <= var_408_15 + arg_408_0 then
				arg_405_1.var_.moveOldPos10042ui_story = var_408_14.localPosition
			end

			local var_408_16 = 0.001

			if var_408_15 <= arg_405_1.time_ and arg_405_1.time_ < var_408_15 + var_408_16 then
				local var_408_17 = (arg_405_1.time_ - var_408_15) / var_408_16
				local var_408_18 = Vector3.New(0.7, -1.12, -6.2)

				var_408_14.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10042ui_story, var_408_18, var_408_17)

				local var_408_19 = manager.ui.mainCamera.transform.position - var_408_14.position

				var_408_14.forward = Vector3.New(var_408_19.x, var_408_19.y, var_408_19.z)

				local var_408_20 = var_408_14.localEulerAngles

				var_408_20.z = 0
				var_408_20.x = 0
				var_408_14.localEulerAngles = var_408_20
			end

			if arg_405_1.time_ >= var_408_15 + var_408_16 and arg_405_1.time_ < var_408_15 + var_408_16 + arg_408_0 then
				var_408_14.localPosition = Vector3.New(0.7, -1.12, -6.2)

				local var_408_21 = manager.ui.mainCamera.transform.position - var_408_14.position

				var_408_14.forward = Vector3.New(var_408_21.x, var_408_21.y, var_408_21.z)

				local var_408_22 = var_408_14.localEulerAngles

				var_408_22.z = 0
				var_408_22.x = 0
				var_408_14.localEulerAngles = var_408_22
			end

			local var_408_23 = arg_405_1.actors_["10042ui_story"]
			local var_408_24 = 0

			if var_408_24 < arg_405_1.time_ and arg_405_1.time_ <= var_408_24 + arg_408_0 and arg_405_1.var_.characterEffect10042ui_story == nil then
				arg_405_1.var_.characterEffect10042ui_story = var_408_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_25 = 0.200000002980232

			if var_408_24 <= arg_405_1.time_ and arg_405_1.time_ < var_408_24 + var_408_25 then
				local var_408_26 = (arg_405_1.time_ - var_408_24) / var_408_25

				if arg_405_1.var_.characterEffect10042ui_story then
					local var_408_27 = Mathf.Lerp(0, 0.5, var_408_26)

					arg_405_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_405_1.var_.characterEffect10042ui_story.fillRatio = var_408_27
				end
			end

			if arg_405_1.time_ >= var_408_24 + var_408_25 and arg_405_1.time_ < var_408_24 + var_408_25 + arg_408_0 and arg_405_1.var_.characterEffect10042ui_story then
				local var_408_28 = 0.5

				arg_405_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_405_1.var_.characterEffect10042ui_story.fillRatio = var_408_28
			end

			local var_408_29 = 0

			if var_408_29 < arg_405_1.time_ and arg_405_1.time_ <= var_408_29 + arg_408_0 then
				arg_405_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_408_30 = 0
			local var_408_31 = 0.275

			if var_408_30 < arg_405_1.time_ and arg_405_1.time_ <= var_408_30 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_32 = arg_405_1:FormatText(StoryNameCfg[6].name)

				arg_405_1.leftNameTxt_.text = var_408_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_33 = arg_405_1:GetWordFromCfg(121511107)
				local var_408_34 = arg_405_1:FormatText(var_408_33.content)

				arg_405_1.text_.text = var_408_34

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_35 = 11
				local var_408_36 = utf8.len(var_408_34)
				local var_408_37 = var_408_35 <= 0 and var_408_31 or var_408_31 * (var_408_36 / var_408_35)

				if var_408_37 > 0 and var_408_31 < var_408_37 then
					arg_405_1.talkMaxDuration = var_408_37

					if var_408_37 + var_408_30 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_37 + var_408_30
					end
				end

				arg_405_1.text_.text = var_408_34
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511107", "story_v_out_121511.awb") ~= 0 then
					local var_408_38 = manager.audio:GetVoiceLength("story_v_out_121511", "121511107", "story_v_out_121511.awb") / 1000

					if var_408_38 + var_408_30 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_38 + var_408_30
					end

					if var_408_33.prefab_name ~= "" and arg_405_1.actors_[var_408_33.prefab_name] ~= nil then
						local var_408_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_33.prefab_name].transform, "story_v_out_121511", "121511107", "story_v_out_121511.awb")

						arg_405_1:RecordAudio("121511107", var_408_39)
						arg_405_1:RecordAudio("121511107", var_408_39)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_121511", "121511107", "story_v_out_121511.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_121511", "121511107", "story_v_out_121511.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_40 = math.max(var_408_31, arg_405_1.talkMaxDuration)

			if var_408_30 <= arg_405_1.time_ and arg_405_1.time_ < var_408_30 + var_408_40 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_30) / var_408_40

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_30 + var_408_40 and arg_405_1.time_ < var_408_30 + var_408_40 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play121511108 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 121511108
		arg_409_1.duration_ = 9.333

		local var_409_0 = {
			ja = 9.333,
			ko = 9.1,
			zh = 9.1
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
				arg_409_0:Play121511109(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10042ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect10042ui_story == nil then
				arg_409_1.var_.characterEffect10042ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.200000002980232

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect10042ui_story then
					arg_409_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect10042ui_story then
				arg_409_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_412_4 = arg_409_1.actors_["1184ui_story"]
			local var_412_5 = 0

			if var_412_5 < arg_409_1.time_ and arg_409_1.time_ <= var_412_5 + arg_412_0 and arg_409_1.var_.characterEffect1184ui_story == nil then
				arg_409_1.var_.characterEffect1184ui_story = var_412_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_6 = 0.200000002980232

			if var_412_5 <= arg_409_1.time_ and arg_409_1.time_ < var_412_5 + var_412_6 then
				local var_412_7 = (arg_409_1.time_ - var_412_5) / var_412_6

				if arg_409_1.var_.characterEffect1184ui_story then
					local var_412_8 = Mathf.Lerp(0, 0.5, var_412_7)

					arg_409_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1184ui_story.fillRatio = var_412_8
				end
			end

			if arg_409_1.time_ >= var_412_5 + var_412_6 and arg_409_1.time_ < var_412_5 + var_412_6 + arg_412_0 and arg_409_1.var_.characterEffect1184ui_story then
				local var_412_9 = 0.5

				arg_409_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1184ui_story.fillRatio = var_412_9
			end

			local var_412_10 = 0
			local var_412_11 = 0.625

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_12 = arg_409_1:FormatText(StoryNameCfg[388].name)

				arg_409_1.leftNameTxt_.text = var_412_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_13 = arg_409_1:GetWordFromCfg(121511108)
				local var_412_14 = arg_409_1:FormatText(var_412_13.content)

				arg_409_1.text_.text = var_412_14

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_15 = 25
				local var_412_16 = utf8.len(var_412_14)
				local var_412_17 = var_412_15 <= 0 and var_412_11 or var_412_11 * (var_412_16 / var_412_15)

				if var_412_17 > 0 and var_412_11 < var_412_17 then
					arg_409_1.talkMaxDuration = var_412_17

					if var_412_17 + var_412_10 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_17 + var_412_10
					end
				end

				arg_409_1.text_.text = var_412_14
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511108", "story_v_out_121511.awb") ~= 0 then
					local var_412_18 = manager.audio:GetVoiceLength("story_v_out_121511", "121511108", "story_v_out_121511.awb") / 1000

					if var_412_18 + var_412_10 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_18 + var_412_10
					end

					if var_412_13.prefab_name ~= "" and arg_409_1.actors_[var_412_13.prefab_name] ~= nil then
						local var_412_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_13.prefab_name].transform, "story_v_out_121511", "121511108", "story_v_out_121511.awb")

						arg_409_1:RecordAudio("121511108", var_412_19)
						arg_409_1:RecordAudio("121511108", var_412_19)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_121511", "121511108", "story_v_out_121511.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_121511", "121511108", "story_v_out_121511.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_20 = math.max(var_412_11, arg_409_1.talkMaxDuration)

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_20 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_10) / var_412_20

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_10 + var_412_20 and arg_409_1.time_ < var_412_10 + var_412_20 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play121511109 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 121511109
		arg_413_1.duration_ = 10.366

		local var_413_0 = {
			ja = 10.366,
			ko = 10.133,
			zh = 10.133
		}
		local var_413_1 = manager.audio:GetLocalizationFlag()

		if var_413_0[var_413_1] ~= nil then
			arg_413_1.duration_ = var_413_0[var_413_1]
		end

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play121511110(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0
			local var_416_1 = 0.825

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_2 = arg_413_1:FormatText(StoryNameCfg[388].name)

				arg_413_1.leftNameTxt_.text = var_416_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_3 = arg_413_1:GetWordFromCfg(121511109)
				local var_416_4 = arg_413_1:FormatText(var_416_3.content)

				arg_413_1.text_.text = var_416_4

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_5 = 33
				local var_416_6 = utf8.len(var_416_4)
				local var_416_7 = var_416_5 <= 0 and var_416_1 or var_416_1 * (var_416_6 / var_416_5)

				if var_416_7 > 0 and var_416_1 < var_416_7 then
					arg_413_1.talkMaxDuration = var_416_7

					if var_416_7 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_7 + var_416_0
					end
				end

				arg_413_1.text_.text = var_416_4
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511109", "story_v_out_121511.awb") ~= 0 then
					local var_416_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511109", "story_v_out_121511.awb") / 1000

					if var_416_8 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_8 + var_416_0
					end

					if var_416_3.prefab_name ~= "" and arg_413_1.actors_[var_416_3.prefab_name] ~= nil then
						local var_416_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_3.prefab_name].transform, "story_v_out_121511", "121511109", "story_v_out_121511.awb")

						arg_413_1:RecordAudio("121511109", var_416_9)
						arg_413_1:RecordAudio("121511109", var_416_9)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_121511", "121511109", "story_v_out_121511.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_121511", "121511109", "story_v_out_121511.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_10 = math.max(var_416_1, arg_413_1.talkMaxDuration)

			if var_416_0 <= arg_413_1.time_ and arg_413_1.time_ < var_416_0 + var_416_10 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_0) / var_416_10

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_0 + var_416_10 and arg_413_1.time_ < var_416_0 + var_416_10 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play121511110 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 121511110
		arg_417_1.duration_ = 5

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play121511111(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1184ui_story"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1184ui_story = var_420_0.localPosition
			end

			local var_420_2 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2
				local var_420_4 = Vector3.New(0, 100, 0)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1184ui_story, var_420_4, var_420_3)

				local var_420_5 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_5.x, var_420_5.y, var_420_5.z)

				local var_420_6 = var_420_0.localEulerAngles

				var_420_6.z = 0
				var_420_6.x = 0
				var_420_0.localEulerAngles = var_420_6
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(0, 100, 0)

				local var_420_7 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_7.x, var_420_7.y, var_420_7.z)

				local var_420_8 = var_420_0.localEulerAngles

				var_420_8.z = 0
				var_420_8.x = 0
				var_420_0.localEulerAngles = var_420_8
			end

			local var_420_9 = arg_417_1.actors_["1184ui_story"]
			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 and arg_417_1.var_.characterEffect1184ui_story == nil then
				arg_417_1.var_.characterEffect1184ui_story = var_420_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_11 = 0.200000002980232

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_11 then
				local var_420_12 = (arg_417_1.time_ - var_420_10) / var_420_11

				if arg_417_1.var_.characterEffect1184ui_story then
					local var_420_13 = Mathf.Lerp(0, 0.5, var_420_12)

					arg_417_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1184ui_story.fillRatio = var_420_13
				end
			end

			if arg_417_1.time_ >= var_420_10 + var_420_11 and arg_417_1.time_ < var_420_10 + var_420_11 + arg_420_0 and arg_417_1.var_.characterEffect1184ui_story then
				local var_420_14 = 0.5

				arg_417_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1184ui_story.fillRatio = var_420_14
			end

			local var_420_15 = arg_417_1.actors_["10042ui_story"].transform
			local var_420_16 = 0

			if var_420_16 < arg_417_1.time_ and arg_417_1.time_ <= var_420_16 + arg_420_0 then
				arg_417_1.var_.moveOldPos10042ui_story = var_420_15.localPosition
			end

			local var_420_17 = 0.001

			if var_420_16 <= arg_417_1.time_ and arg_417_1.time_ < var_420_16 + var_420_17 then
				local var_420_18 = (arg_417_1.time_ - var_420_16) / var_420_17
				local var_420_19 = Vector3.New(0, 100, 0)

				var_420_15.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos10042ui_story, var_420_19, var_420_18)

				local var_420_20 = manager.ui.mainCamera.transform.position - var_420_15.position

				var_420_15.forward = Vector3.New(var_420_20.x, var_420_20.y, var_420_20.z)

				local var_420_21 = var_420_15.localEulerAngles

				var_420_21.z = 0
				var_420_21.x = 0
				var_420_15.localEulerAngles = var_420_21
			end

			if arg_417_1.time_ >= var_420_16 + var_420_17 and arg_417_1.time_ < var_420_16 + var_420_17 + arg_420_0 then
				var_420_15.localPosition = Vector3.New(0, 100, 0)

				local var_420_22 = manager.ui.mainCamera.transform.position - var_420_15.position

				var_420_15.forward = Vector3.New(var_420_22.x, var_420_22.y, var_420_22.z)

				local var_420_23 = var_420_15.localEulerAngles

				var_420_23.z = 0
				var_420_23.x = 0
				var_420_15.localEulerAngles = var_420_23
			end

			local var_420_24 = arg_417_1.actors_["10042ui_story"]
			local var_420_25 = 0

			if var_420_25 < arg_417_1.time_ and arg_417_1.time_ <= var_420_25 + arg_420_0 and arg_417_1.var_.characterEffect10042ui_story == nil then
				arg_417_1.var_.characterEffect10042ui_story = var_420_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_26 = 0.200000002980232

			if var_420_25 <= arg_417_1.time_ and arg_417_1.time_ < var_420_25 + var_420_26 then
				local var_420_27 = (arg_417_1.time_ - var_420_25) / var_420_26

				if arg_417_1.var_.characterEffect10042ui_story then
					local var_420_28 = Mathf.Lerp(0, 0.5, var_420_27)

					arg_417_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_417_1.var_.characterEffect10042ui_story.fillRatio = var_420_28
				end
			end

			if arg_417_1.time_ >= var_420_25 + var_420_26 and arg_417_1.time_ < var_420_25 + var_420_26 + arg_420_0 and arg_417_1.var_.characterEffect10042ui_story then
				local var_420_29 = 0.5

				arg_417_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_417_1.var_.characterEffect10042ui_story.fillRatio = var_420_29
			end

			local var_420_30 = manager.ui.mainCamera.transform
			local var_420_31 = 0.5

			if var_420_31 < arg_417_1.time_ and arg_417_1.time_ <= var_420_31 + arg_420_0 then
				arg_417_1.var_.shakeOldPos = var_420_30.localPosition
			end

			local var_420_32 = 1

			if var_420_31 <= arg_417_1.time_ and arg_417_1.time_ < var_420_31 + var_420_32 then
				local var_420_33 = (arg_417_1.time_ - var_420_31) / 0.066
				local var_420_34, var_420_35 = math.modf(var_420_33)

				var_420_30.localPosition = Vector3.New(var_420_35 * 0.13, var_420_35 * 0.13, var_420_35 * 0.13) + arg_417_1.var_.shakeOldPos
			end

			if arg_417_1.time_ >= var_420_31 + var_420_32 and arg_417_1.time_ < var_420_31 + var_420_32 + arg_420_0 then
				var_420_30.localPosition = arg_417_1.var_.shakeOldPos
			end

			local var_420_36 = 0

			if var_420_36 < arg_417_1.time_ and arg_417_1.time_ <= var_420_36 + arg_420_0 then
				arg_417_1.allBtn_.enabled = false
			end

			local var_420_37 = 1.5

			if arg_417_1.time_ >= var_420_36 + var_420_37 and arg_417_1.time_ < var_420_36 + var_420_37 + arg_420_0 then
				arg_417_1.allBtn_.enabled = true
			end

			local var_420_38 = 0
			local var_420_39 = 0.633333333333333

			if var_420_38 < arg_417_1.time_ and arg_417_1.time_ <= var_420_38 + arg_420_0 then
				local var_420_40 = "play"
				local var_420_41 = "effect"

				arg_417_1:AudioAction(var_420_40, var_420_41, "se_story_121_04", "se_story_121_04_bulletdefence", "")
			end

			local var_420_42 = 0
			local var_420_43 = 1.4

			if var_420_42 < arg_417_1.time_ and arg_417_1.time_ <= var_420_42 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, false)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_44 = arg_417_1:GetWordFromCfg(121511110)
				local var_420_45 = arg_417_1:FormatText(var_420_44.content)

				arg_417_1.text_.text = var_420_45

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_46 = 56
				local var_420_47 = utf8.len(var_420_45)
				local var_420_48 = var_420_46 <= 0 and var_420_43 or var_420_43 * (var_420_47 / var_420_46)

				if var_420_48 > 0 and var_420_43 < var_420_48 then
					arg_417_1.talkMaxDuration = var_420_48

					if var_420_48 + var_420_42 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_48 + var_420_42
					end
				end

				arg_417_1.text_.text = var_420_45
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)
				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_49 = math.max(var_420_43, arg_417_1.talkMaxDuration)

			if var_420_42 <= arg_417_1.time_ and arg_417_1.time_ < var_420_42 + var_420_49 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_42) / var_420_49

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_42 + var_420_49 and arg_417_1.time_ < var_420_42 + var_420_49 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play121511111 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 121511111
		arg_421_1.duration_ = 7

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play121511112(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = 0

			if var_424_0 < arg_421_1.time_ and arg_421_1.time_ <= var_424_0 + arg_424_0 then
				arg_421_1.mask_.enabled = true
				arg_421_1.mask_.raycastTarget = false

				arg_421_1:SetGaussion(false)
			end

			local var_424_1 = 2

			if var_424_0 <= arg_421_1.time_ and arg_421_1.time_ < var_424_0 + var_424_1 then
				local var_424_2 = (arg_421_1.time_ - var_424_0) / var_424_1
				local var_424_3 = Color.New(0.3207547, 0, 0)

				var_424_3.a = Mathf.Lerp(1, 0, var_424_2)
				arg_421_1.mask_.color = var_424_3
			end

			if arg_421_1.time_ >= var_424_0 + var_424_1 and arg_421_1.time_ < var_424_0 + var_424_1 + arg_424_0 then
				local var_424_4 = Color.New(0.3207547, 0, 0)
				local var_424_5 = 0

				arg_421_1.mask_.enabled = false
				var_424_4.a = var_424_5
				arg_421_1.mask_.color = var_424_4
			end

			local var_424_6 = manager.ui.mainCamera.transform
			local var_424_7 = 0

			if var_424_7 < arg_421_1.time_ and arg_421_1.time_ <= var_424_7 + arg_424_0 then
				arg_421_1.var_.shakeOldPos = var_424_6.localPosition
			end

			local var_424_8 = 2

			if var_424_7 <= arg_421_1.time_ and arg_421_1.time_ < var_424_7 + var_424_8 then
				local var_424_9 = (arg_421_1.time_ - var_424_7) / 0.066
				local var_424_10, var_424_11 = math.modf(var_424_9)

				var_424_6.localPosition = Vector3.New(var_424_11 * 0.13, var_424_11 * 0.13, var_424_11 * 0.13) + arg_421_1.var_.shakeOldPos
			end

			if arg_421_1.time_ >= var_424_7 + var_424_8 and arg_421_1.time_ < var_424_7 + var_424_8 + arg_424_0 then
				var_424_6.localPosition = arg_421_1.var_.shakeOldPos
			end

			if arg_421_1.frameCnt_ <= 1 then
				arg_421_1.dialog_:SetActive(false)
			end

			local var_424_12 = 2
			local var_424_13 = 1.275

			if var_424_12 < arg_421_1.time_ and arg_421_1.time_ <= var_424_12 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0

				arg_421_1.dialog_:SetActive(true)

				local var_424_14 = LeanTween.value(arg_421_1.dialog_, 0, 1, 0.3)

				var_424_14:setOnUpdate(LuaHelper.FloatAction(function(arg_425_0)
					arg_421_1.dialogCg_.alpha = arg_425_0
				end))
				var_424_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_421_1.dialog_)
					var_424_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_421_1.duration_ = arg_421_1.duration_ + 0.3

				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_15 = arg_421_1:GetWordFromCfg(121511111)
				local var_424_16 = arg_421_1:FormatText(var_424_15.content)

				arg_421_1.text_.text = var_424_16

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_17 = 51
				local var_424_18 = utf8.len(var_424_16)
				local var_424_19 = var_424_17 <= 0 and var_424_13 or var_424_13 * (var_424_18 / var_424_17)

				if var_424_19 > 0 and var_424_13 < var_424_19 then
					arg_421_1.talkMaxDuration = var_424_19
					var_424_12 = var_424_12 + 0.3

					if var_424_19 + var_424_12 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_12
					end
				end

				arg_421_1.text_.text = var_424_16
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_20 = var_424_12 + 0.3
			local var_424_21 = math.max(var_424_13, arg_421_1.talkMaxDuration)

			if var_424_20 <= arg_421_1.time_ and arg_421_1.time_ < var_424_20 + var_424_21 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_20) / var_424_21

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_20 + var_424_21 and arg_421_1.time_ < var_424_20 + var_424_21 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play121511112 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 121511112
		arg_427_1.duration_ = 1.666

		local var_427_0 = {
			ja = 1.533,
			ko = 1.666,
			zh = 1.666
		}
		local var_427_1 = manager.audio:GetLocalizationFlag()

		if var_427_0[var_427_1] ~= nil then
			arg_427_1.duration_ = var_427_0[var_427_1]
		end

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play121511113(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.125

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_2 = arg_427_1:FormatText(StoryNameCfg[6].name)

				arg_427_1.leftNameTxt_.text = var_430_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, true)
				arg_427_1.iconController_:SetSelectedState("hero")

				arg_427_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_3 = arg_427_1:GetWordFromCfg(121511112)
				local var_430_4 = arg_427_1:FormatText(var_430_3.content)

				arg_427_1.text_.text = var_430_4

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_5 = 5
				local var_430_6 = utf8.len(var_430_4)
				local var_430_7 = var_430_5 <= 0 and var_430_1 or var_430_1 * (var_430_6 / var_430_5)

				if var_430_7 > 0 and var_430_1 < var_430_7 then
					arg_427_1.talkMaxDuration = var_430_7

					if var_430_7 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_7 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_4
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511112", "story_v_out_121511.awb") ~= 0 then
					local var_430_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511112", "story_v_out_121511.awb") / 1000

					if var_430_8 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_8 + var_430_0
					end

					if var_430_3.prefab_name ~= "" and arg_427_1.actors_[var_430_3.prefab_name] ~= nil then
						local var_430_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_3.prefab_name].transform, "story_v_out_121511", "121511112", "story_v_out_121511.awb")

						arg_427_1:RecordAudio("121511112", var_430_9)
						arg_427_1:RecordAudio("121511112", var_430_9)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_121511", "121511112", "story_v_out_121511.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_121511", "121511112", "story_v_out_121511.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_10 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_10 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_10

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_10 and arg_427_1.time_ < var_430_0 + var_430_10 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play121511113 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 121511113
		arg_431_1.duration_ = 6.8

		local var_431_0 = {
			ja = 6.8,
			ko = 5.933,
			zh = 5.933
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
				arg_431_0:Play121511114(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["10042ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos10042ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, -1.12, -6.2)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos10042ui_story, var_434_4, var_434_3)

				local var_434_5 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_5.x, var_434_5.y, var_434_5.z)

				local var_434_6 = var_434_0.localEulerAngles

				var_434_6.z = 0
				var_434_6.x = 0
				var_434_0.localEulerAngles = var_434_6
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_434_7 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_7.x, var_434_7.y, var_434_7.z)

				local var_434_8 = var_434_0.localEulerAngles

				var_434_8.z = 0
				var_434_8.x = 0
				var_434_0.localEulerAngles = var_434_8
			end

			local var_434_9 = arg_431_1.actors_["10042ui_story"]
			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 and arg_431_1.var_.characterEffect10042ui_story == nil then
				arg_431_1.var_.characterEffect10042ui_story = var_434_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_11 = 0.200000002980232

			if var_434_10 <= arg_431_1.time_ and arg_431_1.time_ < var_434_10 + var_434_11 then
				local var_434_12 = (arg_431_1.time_ - var_434_10) / var_434_11

				if arg_431_1.var_.characterEffect10042ui_story then
					arg_431_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_10 + var_434_11 and arg_431_1.time_ < var_434_10 + var_434_11 + arg_434_0 and arg_431_1.var_.characterEffect10042ui_story then
				arg_431_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_434_13 = 0

			if var_434_13 < arg_431_1.time_ and arg_431_1.time_ <= var_434_13 + arg_434_0 then
				arg_431_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action1_1")
			end

			local var_434_14 = 0

			if var_434_14 < arg_431_1.time_ and arg_431_1.time_ <= var_434_14 + arg_434_0 then
				arg_431_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_434_15 = 0
			local var_434_16 = 0.325

			if var_434_15 < arg_431_1.time_ and arg_431_1.time_ <= var_434_15 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_17 = arg_431_1:FormatText(StoryNameCfg[388].name)

				arg_431_1.leftNameTxt_.text = var_434_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_18 = arg_431_1:GetWordFromCfg(121511113)
				local var_434_19 = arg_431_1:FormatText(var_434_18.content)

				arg_431_1.text_.text = var_434_19

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_20 = 13
				local var_434_21 = utf8.len(var_434_19)
				local var_434_22 = var_434_20 <= 0 and var_434_16 or var_434_16 * (var_434_21 / var_434_20)

				if var_434_22 > 0 and var_434_16 < var_434_22 then
					arg_431_1.talkMaxDuration = var_434_22

					if var_434_22 + var_434_15 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_22 + var_434_15
					end
				end

				arg_431_1.text_.text = var_434_19
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511113", "story_v_out_121511.awb") ~= 0 then
					local var_434_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511113", "story_v_out_121511.awb") / 1000

					if var_434_23 + var_434_15 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_23 + var_434_15
					end

					if var_434_18.prefab_name ~= "" and arg_431_1.actors_[var_434_18.prefab_name] ~= nil then
						local var_434_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_18.prefab_name].transform, "story_v_out_121511", "121511113", "story_v_out_121511.awb")

						arg_431_1:RecordAudio("121511113", var_434_24)
						arg_431_1:RecordAudio("121511113", var_434_24)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_121511", "121511113", "story_v_out_121511.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_121511", "121511113", "story_v_out_121511.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_25 = math.max(var_434_16, arg_431_1.talkMaxDuration)

			if var_434_15 <= arg_431_1.time_ and arg_431_1.time_ < var_434_15 + var_434_25 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_15) / var_434_25

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_15 + var_434_25 and arg_431_1.time_ < var_434_15 + var_434_25 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play121511114 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 121511114
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play121511115(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["10042ui_story"].transform
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 then
				arg_435_1.var_.moveOldPos10042ui_story = var_438_0.localPosition
			end

			local var_438_2 = 0.001

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2
				local var_438_4 = Vector3.New(0, 100, 0)

				var_438_0.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos10042ui_story, var_438_4, var_438_3)

				local var_438_5 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_5.x, var_438_5.y, var_438_5.z)

				local var_438_6 = var_438_0.localEulerAngles

				var_438_6.z = 0
				var_438_6.x = 0
				var_438_0.localEulerAngles = var_438_6
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 then
				var_438_0.localPosition = Vector3.New(0, 100, 0)

				local var_438_7 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_7.x, var_438_7.y, var_438_7.z)

				local var_438_8 = var_438_0.localEulerAngles

				var_438_8.z = 0
				var_438_8.x = 0
				var_438_0.localEulerAngles = var_438_8
			end

			local var_438_9 = arg_435_1.actors_["10042ui_story"]
			local var_438_10 = 0

			if var_438_10 < arg_435_1.time_ and arg_435_1.time_ <= var_438_10 + arg_438_0 and arg_435_1.var_.characterEffect10042ui_story == nil then
				arg_435_1.var_.characterEffect10042ui_story = var_438_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_11 = 0.200000002980232

			if var_438_10 <= arg_435_1.time_ and arg_435_1.time_ < var_438_10 + var_438_11 then
				local var_438_12 = (arg_435_1.time_ - var_438_10) / var_438_11

				if arg_435_1.var_.characterEffect10042ui_story then
					local var_438_13 = Mathf.Lerp(0, 0.5, var_438_12)

					arg_435_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_435_1.var_.characterEffect10042ui_story.fillRatio = var_438_13
				end
			end

			if arg_435_1.time_ >= var_438_10 + var_438_11 and arg_435_1.time_ < var_438_10 + var_438_11 + arg_438_0 and arg_435_1.var_.characterEffect10042ui_story then
				local var_438_14 = 0.5

				arg_435_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_435_1.var_.characterEffect10042ui_story.fillRatio = var_438_14
			end

			local var_438_15 = 0
			local var_438_16 = 0.925

			if var_438_15 < arg_435_1.time_ and arg_435_1.time_ <= var_438_15 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_17 = arg_435_1:GetWordFromCfg(121511114)
				local var_438_18 = arg_435_1:FormatText(var_438_17.content)

				arg_435_1.text_.text = var_438_18

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_19 = 37
				local var_438_20 = utf8.len(var_438_18)
				local var_438_21 = var_438_19 <= 0 and var_438_16 or var_438_16 * (var_438_20 / var_438_19)

				if var_438_21 > 0 and var_438_16 < var_438_21 then
					arg_435_1.talkMaxDuration = var_438_21

					if var_438_21 + var_438_15 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_21 + var_438_15
					end
				end

				arg_435_1.text_.text = var_438_18
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_22 = math.max(var_438_16, arg_435_1.talkMaxDuration)

			if var_438_15 <= arg_435_1.time_ and arg_435_1.time_ < var_438_15 + var_438_22 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_15) / var_438_22

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_15 + var_438_22 and arg_435_1.time_ < var_438_15 + var_438_22 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play121511115 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 121511115
		arg_439_1.duration_ = 5

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play121511116(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.275

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[7].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(121511115)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 11
				local var_442_6 = utf8.len(var_442_4)
				local var_442_7 = var_442_5 <= 0 and var_442_1 or var_442_1 * (var_442_6 / var_442_5)

				if var_442_7 > 0 and var_442_1 < var_442_7 then
					arg_439_1.talkMaxDuration = var_442_7

					if var_442_7 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_7 + var_442_0
					end
				end

				arg_439_1.text_.text = var_442_4
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)
				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_8 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_8 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_8

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_8 and arg_439_1.time_ < var_442_0 + var_442_8 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play121511116 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 121511116
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play121511117(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 0.633333333333333

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				local var_446_2 = "play"
				local var_446_3 = "effect"

				arg_443_1:AudioAction(var_446_2, var_446_3, "se_story_121_04", "se_story_121_04_fireanergy1", "")
			end

			local var_446_4 = 0
			local var_446_5 = 1.025

			if var_446_4 < arg_443_1.time_ and arg_443_1.time_ <= var_446_4 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_6 = arg_443_1:GetWordFromCfg(121511116)
				local var_446_7 = arg_443_1:FormatText(var_446_6.content)

				arg_443_1.text_.text = var_446_7

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_8 = 41
				local var_446_9 = utf8.len(var_446_7)
				local var_446_10 = var_446_8 <= 0 and var_446_5 or var_446_5 * (var_446_9 / var_446_8)

				if var_446_10 > 0 and var_446_5 < var_446_10 then
					arg_443_1.talkMaxDuration = var_446_10

					if var_446_10 + var_446_4 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_10 + var_446_4
					end
				end

				arg_443_1.text_.text = var_446_7
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_11 = math.max(var_446_5, arg_443_1.talkMaxDuration)

			if var_446_4 <= arg_443_1.time_ and arg_443_1.time_ < var_446_4 + var_446_11 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_4) / var_446_11

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_4 + var_446_11 and arg_443_1.time_ < var_446_4 + var_446_11 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play121511117 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 121511117
		arg_447_1.duration_ = 11.8

		local var_447_0 = {
			ja = 11.8,
			ko = 9.6,
			zh = 9.6
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
				arg_447_0:Play121511118(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 1.025

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[388].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, true)
				arg_447_1.iconController_:SetSelectedState("hero")

				arg_447_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10042")

				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(121511117)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 41
				local var_450_6 = utf8.len(var_450_4)
				local var_450_7 = var_450_5 <= 0 and var_450_1 or var_450_1 * (var_450_6 / var_450_5)

				if var_450_7 > 0 and var_450_1 < var_450_7 then
					arg_447_1.talkMaxDuration = var_450_7

					if var_450_7 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_7 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_4
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511117", "story_v_out_121511.awb") ~= 0 then
					local var_450_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511117", "story_v_out_121511.awb") / 1000

					if var_450_8 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_0
					end

					if var_450_3.prefab_name ~= "" and arg_447_1.actors_[var_450_3.prefab_name] ~= nil then
						local var_450_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_3.prefab_name].transform, "story_v_out_121511", "121511117", "story_v_out_121511.awb")

						arg_447_1:RecordAudio("121511117", var_450_9)
						arg_447_1:RecordAudio("121511117", var_450_9)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_121511", "121511117", "story_v_out_121511.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_121511", "121511117", "story_v_out_121511.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_10 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_10 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_10

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_10 and arg_447_1.time_ < var_450_0 + var_450_10 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play121511118 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 121511118
		arg_451_1.duration_ = 12.6

		local var_451_0 = {
			ja = 12.6,
			ko = 9.433,
			zh = 9.433
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
				arg_451_0:Play121511119(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 0.675

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_2 = arg_451_1:FormatText(StoryNameCfg[388].name)

				arg_451_1.leftNameTxt_.text = var_454_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, true)
				arg_451_1.iconController_:SetSelectedState("hero")

				arg_451_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10042")

				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_3 = arg_451_1:GetWordFromCfg(121511118)
				local var_454_4 = arg_451_1:FormatText(var_454_3.content)

				arg_451_1.text_.text = var_454_4

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_5 = 27
				local var_454_6 = utf8.len(var_454_4)
				local var_454_7 = var_454_5 <= 0 and var_454_1 or var_454_1 * (var_454_6 / var_454_5)

				if var_454_7 > 0 and var_454_1 < var_454_7 then
					arg_451_1.talkMaxDuration = var_454_7

					if var_454_7 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_7 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_4
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511118", "story_v_out_121511.awb") ~= 0 then
					local var_454_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511118", "story_v_out_121511.awb") / 1000

					if var_454_8 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_8 + var_454_0
					end

					if var_454_3.prefab_name ~= "" and arg_451_1.actors_[var_454_3.prefab_name] ~= nil then
						local var_454_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_3.prefab_name].transform, "story_v_out_121511", "121511118", "story_v_out_121511.awb")

						arg_451_1:RecordAudio("121511118", var_454_9)
						arg_451_1:RecordAudio("121511118", var_454_9)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_121511", "121511118", "story_v_out_121511.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_121511", "121511118", "story_v_out_121511.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_10 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_10 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_10

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_10 and arg_451_1.time_ < var_454_0 + var_454_10 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play121511119 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 121511119
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play121511120(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.633333333333333

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				local var_458_2 = "play"
				local var_458_3 = "effect"

				arg_455_1:AudioAction(var_458_2, var_458_3, "se_story_121_04", "se_story_121_04_fireanergy2", "")
			end

			local var_458_4 = 0
			local var_458_5 = 1.7

			if var_458_4 < arg_455_1.time_ and arg_455_1.time_ <= var_458_4 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_6 = arg_455_1:GetWordFromCfg(121511119)
				local var_458_7 = arg_455_1:FormatText(var_458_6.content)

				arg_455_1.text_.text = var_458_7

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_8 = 69
				local var_458_9 = utf8.len(var_458_7)
				local var_458_10 = var_458_8 <= 0 and var_458_5 or var_458_5 * (var_458_9 / var_458_8)

				if var_458_10 > 0 and var_458_5 < var_458_10 then
					arg_455_1.talkMaxDuration = var_458_10

					if var_458_10 + var_458_4 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_10 + var_458_4
					end
				end

				arg_455_1.text_.text = var_458_7
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_11 = math.max(var_458_5, arg_455_1.talkMaxDuration)

			if var_458_4 <= arg_455_1.time_ and arg_455_1.time_ < var_458_4 + var_458_11 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_4) / var_458_11

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_4 + var_458_11 and arg_455_1.time_ < var_458_4 + var_458_11 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play121511120 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 121511120
		arg_459_1.duration_ = 7

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play121511121(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = "XH0305"

			if arg_459_1.bgs_[var_462_0] == nil then
				local var_462_1 = Object.Instantiate(arg_459_1.paintGo_)

				var_462_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_462_0)
				var_462_1.name = var_462_0
				var_462_1.transform.parent = arg_459_1.stage_.transform
				var_462_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_459_1.bgs_[var_462_0] = var_462_1
			end

			local var_462_2 = 0

			if var_462_2 < arg_459_1.time_ and arg_459_1.time_ <= var_462_2 + arg_462_0 then
				local var_462_3 = manager.ui.mainCamera.transform.localPosition
				local var_462_4 = Vector3.New(0, 0, 10) + Vector3.New(var_462_3.x, var_462_3.y, 0)
				local var_462_5 = arg_459_1.bgs_.XH0305

				var_462_5.transform.localPosition = var_462_4
				var_462_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_462_6 = var_462_5:GetComponent("SpriteRenderer")

				if var_462_6 and var_462_6.sprite then
					local var_462_7 = (var_462_5.transform.localPosition - var_462_3).z
					local var_462_8 = manager.ui.mainCameraCom_
					local var_462_9 = 2 * var_462_7 * Mathf.Tan(var_462_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_462_10 = var_462_9 * var_462_8.aspect
					local var_462_11 = var_462_6.sprite.bounds.size.x
					local var_462_12 = var_462_6.sprite.bounds.size.y
					local var_462_13 = var_462_10 / var_462_11
					local var_462_14 = var_462_9 / var_462_12
					local var_462_15 = var_462_14 < var_462_13 and var_462_13 or var_462_14

					var_462_5.transform.localScale = Vector3.New(var_462_15, var_462_15, 0)
				end

				for iter_462_0, iter_462_1 in pairs(arg_459_1.bgs_) do
					if iter_462_0 ~= "XH0305" then
						iter_462_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_462_16 = 0

			if var_462_16 < arg_459_1.time_ and arg_459_1.time_ <= var_462_16 + arg_462_0 then
				arg_459_1.mask_.enabled = true
				arg_459_1.mask_.raycastTarget = true

				arg_459_1:SetGaussion(false)
			end

			local var_462_17 = 2

			if var_462_16 <= arg_459_1.time_ and arg_459_1.time_ < var_462_16 + var_462_17 then
				local var_462_18 = (arg_459_1.time_ - var_462_16) / var_462_17
				local var_462_19 = Color.New(1, 1, 1)

				var_462_19.a = Mathf.Lerp(1, 0, var_462_18)
				arg_459_1.mask_.color = var_462_19
			end

			if arg_459_1.time_ >= var_462_16 + var_462_17 and arg_459_1.time_ < var_462_16 + var_462_17 + arg_462_0 then
				local var_462_20 = Color.New(1, 1, 1)
				local var_462_21 = 0

				arg_459_1.mask_.enabled = false
				var_462_20.a = var_462_21
				arg_459_1.mask_.color = var_462_20
			end

			local var_462_22 = arg_459_1.bgs_.XH0305.transform
			local var_462_23 = 0

			if var_462_23 < arg_459_1.time_ and arg_459_1.time_ <= var_462_23 + arg_462_0 then
				arg_459_1.var_.moveOldPosXH0305 = var_462_22.localPosition
			end

			local var_462_24 = 0.001

			if var_462_23 <= arg_459_1.time_ and arg_459_1.time_ < var_462_23 + var_462_24 then
				local var_462_25 = (arg_459_1.time_ - var_462_23) / var_462_24
				local var_462_26 = Vector3.New(0, 1, 9)

				var_462_22.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPosXH0305, var_462_26, var_462_25)
			end

			if arg_459_1.time_ >= var_462_23 + var_462_24 and arg_459_1.time_ < var_462_23 + var_462_24 + arg_462_0 then
				var_462_22.localPosition = Vector3.New(0, 1, 9)
			end

			local var_462_27 = arg_459_1.bgs_.XH0305.transform
			local var_462_28 = 0.0333333333333333

			if var_462_28 < arg_459_1.time_ and arg_459_1.time_ <= var_462_28 + arg_462_0 then
				arg_459_1.var_.moveOldPosXH0305 = var_462_27.localPosition
			end

			local var_462_29 = 4.5

			if var_462_28 <= arg_459_1.time_ and arg_459_1.time_ < var_462_28 + var_462_29 then
				local var_462_30 = (arg_459_1.time_ - var_462_28) / var_462_29
				local var_462_31 = Vector3.New(0, 1, 10)

				var_462_27.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPosXH0305, var_462_31, var_462_30)
			end

			if arg_459_1.time_ >= var_462_28 + var_462_29 and arg_459_1.time_ < var_462_28 + var_462_29 + arg_462_0 then
				var_462_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_462_32 = 2

			if var_462_32 < arg_459_1.time_ and arg_459_1.time_ <= var_462_32 + arg_462_0 then
				arg_459_1.allBtn_.enabled = false
			end

			local var_462_33 = 2.53333333333333

			if arg_459_1.time_ >= var_462_32 + var_462_33 and arg_459_1.time_ < var_462_32 + var_462_33 + arg_462_0 then
				arg_459_1.allBtn_.enabled = true
			end

			if arg_459_1.frameCnt_ <= 1 then
				arg_459_1.dialog_:SetActive(false)
			end

			local var_462_34 = 2
			local var_462_35 = 1.325

			if var_462_34 < arg_459_1.time_ and arg_459_1.time_ <= var_462_34 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0

				arg_459_1.dialog_:SetActive(true)

				local var_462_36 = LeanTween.value(arg_459_1.dialog_, 0, 1, 0.3)

				var_462_36:setOnUpdate(LuaHelper.FloatAction(function(arg_463_0)
					arg_459_1.dialogCg_.alpha = arg_463_0
				end))
				var_462_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_459_1.dialog_)
					var_462_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_459_1.duration_ = arg_459_1.duration_ + 0.3

				SetActive(arg_459_1.leftNameGo_, false)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_37 = arg_459_1:GetWordFromCfg(121511120)
				local var_462_38 = arg_459_1:FormatText(var_462_37.content)

				arg_459_1.text_.text = var_462_38

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_39 = 53
				local var_462_40 = utf8.len(var_462_38)
				local var_462_41 = var_462_39 <= 0 and var_462_35 or var_462_35 * (var_462_40 / var_462_39)

				if var_462_41 > 0 and var_462_35 < var_462_41 then
					arg_459_1.talkMaxDuration = var_462_41
					var_462_34 = var_462_34 + 0.3

					if var_462_41 + var_462_34 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_41 + var_462_34
					end
				end

				arg_459_1.text_.text = var_462_38
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_42 = var_462_34 + 0.3
			local var_462_43 = math.max(var_462_35, arg_459_1.talkMaxDuration)

			if var_462_42 <= arg_459_1.time_ and arg_459_1.time_ < var_462_42 + var_462_43 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_42) / var_462_43

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_42 + var_462_43 and arg_459_1.time_ < var_462_42 + var_462_43 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play121511121 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 121511121
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play121511122(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 1.4

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, false)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_2 = arg_465_1:GetWordFromCfg(121511121)
				local var_468_3 = arg_465_1:FormatText(var_468_2.content)

				arg_465_1.text_.text = var_468_3

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_4 = 56
				local var_468_5 = utf8.len(var_468_3)
				local var_468_6 = var_468_4 <= 0 and var_468_1 or var_468_1 * (var_468_5 / var_468_4)

				if var_468_6 > 0 and var_468_1 < var_468_6 then
					arg_465_1.talkMaxDuration = var_468_6

					if var_468_6 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_6 + var_468_0
					end
				end

				arg_465_1.text_.text = var_468_3
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_7 = math.max(var_468_1, arg_465_1.talkMaxDuration)

			if var_468_0 <= arg_465_1.time_ and arg_465_1.time_ < var_468_0 + var_468_7 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_0) / var_468_7

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_0 + var_468_7 and arg_465_1.time_ < var_468_0 + var_468_7 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play121511122 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 121511122
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play121511123(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = 0
			local var_472_1 = 1.1

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, false)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_2 = arg_469_1:GetWordFromCfg(121511122)
				local var_472_3 = arg_469_1:FormatText(var_472_2.content)

				arg_469_1.text_.text = var_472_3

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_4 = 44
				local var_472_5 = utf8.len(var_472_3)
				local var_472_6 = var_472_4 <= 0 and var_472_1 or var_472_1 * (var_472_5 / var_472_4)

				if var_472_6 > 0 and var_472_1 < var_472_6 then
					arg_469_1.talkMaxDuration = var_472_6

					if var_472_6 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_6 + var_472_0
					end
				end

				arg_469_1.text_.text = var_472_3
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_7 = math.max(var_472_1, arg_469_1.talkMaxDuration)

			if var_472_0 <= arg_469_1.time_ and arg_469_1.time_ < var_472_0 + var_472_7 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_0) / var_472_7

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_0 + var_472_7 and arg_469_1.time_ < var_472_0 + var_472_7 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play121511123 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 121511123
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play121511124(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 1.025

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, false)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_2 = arg_473_1:GetWordFromCfg(121511123)
				local var_476_3 = arg_473_1:FormatText(var_476_2.content)

				arg_473_1.text_.text = var_476_3

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_4 = 41
				local var_476_5 = utf8.len(var_476_3)
				local var_476_6 = var_476_4 <= 0 and var_476_1 or var_476_1 * (var_476_5 / var_476_4)

				if var_476_6 > 0 and var_476_1 < var_476_6 then
					arg_473_1.talkMaxDuration = var_476_6

					if var_476_6 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_6 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_3
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_7 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_7 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_7

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_7 and arg_473_1.time_ < var_476_0 + var_476_7 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play121511124 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 121511124
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play121511125(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 1.275

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_2 = arg_477_1:GetWordFromCfg(121511124)
				local var_480_3 = arg_477_1:FormatText(var_480_2.content)

				arg_477_1.text_.text = var_480_3

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_4 = 51
				local var_480_5 = utf8.len(var_480_3)
				local var_480_6 = var_480_4 <= 0 and var_480_1 or var_480_1 * (var_480_5 / var_480_4)

				if var_480_6 > 0 and var_480_1 < var_480_6 then
					arg_477_1.talkMaxDuration = var_480_6

					if var_480_6 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_6 + var_480_0
					end
				end

				arg_477_1.text_.text = var_480_3
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_7 = math.max(var_480_1, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_7 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_0) / var_480_7

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_7 and arg_477_1.time_ < var_480_0 + var_480_7 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play121511125 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 121511125
		arg_481_1.duration_ = 12.866

		local var_481_0 = {
			ja = 12.866,
			ko = 8.166,
			zh = 8.166
		}
		local var_481_1 = manager.audio:GetLocalizationFlag()

		if var_481_0[var_481_1] ~= nil then
			arg_481_1.duration_ = var_481_0[var_481_1]
		end

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play121511126(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0
			local var_484_1 = 0.85

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_2 = arg_481_1:FormatText(StoryNameCfg[388].name)

				arg_481_1.leftNameTxt_.text = var_484_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_3 = arg_481_1:GetWordFromCfg(121511125)
				local var_484_4 = arg_481_1:FormatText(var_484_3.content)

				arg_481_1.text_.text = var_484_4

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_5 = 34
				local var_484_6 = utf8.len(var_484_4)
				local var_484_7 = var_484_5 <= 0 and var_484_1 or var_484_1 * (var_484_6 / var_484_5)

				if var_484_7 > 0 and var_484_1 < var_484_7 then
					arg_481_1.talkMaxDuration = var_484_7

					if var_484_7 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_7 + var_484_0
					end
				end

				arg_481_1.text_.text = var_484_4
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511125", "story_v_out_121511.awb") ~= 0 then
					local var_484_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511125", "story_v_out_121511.awb") / 1000

					if var_484_8 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_8 + var_484_0
					end

					if var_484_3.prefab_name ~= "" and arg_481_1.actors_[var_484_3.prefab_name] ~= nil then
						local var_484_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_3.prefab_name].transform, "story_v_out_121511", "121511125", "story_v_out_121511.awb")

						arg_481_1:RecordAudio("121511125", var_484_9)
						arg_481_1:RecordAudio("121511125", var_484_9)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_121511", "121511125", "story_v_out_121511.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_121511", "121511125", "story_v_out_121511.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_10 = math.max(var_484_1, arg_481_1.talkMaxDuration)

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_10 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_0) / var_484_10

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_0 + var_484_10 and arg_481_1.time_ < var_484_0 + var_484_10 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play121511126 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 121511126
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play121511127(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.425

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_2 = arg_485_1:FormatText(StoryNameCfg[7].name)

				arg_485_1.leftNameTxt_.text = var_488_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_3 = arg_485_1:GetWordFromCfg(121511126)
				local var_488_4 = arg_485_1:FormatText(var_488_3.content)

				arg_485_1.text_.text = var_488_4

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_5 = 17
				local var_488_6 = utf8.len(var_488_4)
				local var_488_7 = var_488_5 <= 0 and var_488_1 or var_488_1 * (var_488_6 / var_488_5)

				if var_488_7 > 0 and var_488_1 < var_488_7 then
					arg_485_1.talkMaxDuration = var_488_7

					if var_488_7 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_7 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_4
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_8 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_8 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_8

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_8 and arg_485_1.time_ < var_488_0 + var_488_8 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play121511127 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 121511127
		arg_489_1.duration_ = 5.233

		local var_489_0 = {
			ja = 1.8,
			ko = 5.233,
			zh = 5.233
		}
		local var_489_1 = manager.audio:GetLocalizationFlag()

		if var_489_0[var_489_1] ~= nil then
			arg_489_1.duration_ = var_489_0[var_489_1]
		end

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play121511128(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = 0
			local var_492_1 = 0.375

			if var_492_0 < arg_489_1.time_ and arg_489_1.time_ <= var_492_0 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_2 = arg_489_1:FormatText(StoryNameCfg[388].name)

				arg_489_1.leftNameTxt_.text = var_492_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_3 = arg_489_1:GetWordFromCfg(121511127)
				local var_492_4 = arg_489_1:FormatText(var_492_3.content)

				arg_489_1.text_.text = var_492_4

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_5 = 15
				local var_492_6 = utf8.len(var_492_4)
				local var_492_7 = var_492_5 <= 0 and var_492_1 or var_492_1 * (var_492_6 / var_492_5)

				if var_492_7 > 0 and var_492_1 < var_492_7 then
					arg_489_1.talkMaxDuration = var_492_7

					if var_492_7 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_7 + var_492_0
					end
				end

				arg_489_1.text_.text = var_492_4
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511127", "story_v_out_121511.awb") ~= 0 then
					local var_492_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511127", "story_v_out_121511.awb") / 1000

					if var_492_8 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_8 + var_492_0
					end

					if var_492_3.prefab_name ~= "" and arg_489_1.actors_[var_492_3.prefab_name] ~= nil then
						local var_492_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_3.prefab_name].transform, "story_v_out_121511", "121511127", "story_v_out_121511.awb")

						arg_489_1:RecordAudio("121511127", var_492_9)
						arg_489_1:RecordAudio("121511127", var_492_9)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_121511", "121511127", "story_v_out_121511.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_121511", "121511127", "story_v_out_121511.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_10 = math.max(var_492_1, arg_489_1.talkMaxDuration)

			if var_492_0 <= arg_489_1.time_ and arg_489_1.time_ < var_492_0 + var_492_10 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_0) / var_492_10

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_0 + var_492_10 and arg_489_1.time_ < var_492_0 + var_492_10 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play121511128 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 121511128
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play121511129(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0
			local var_496_1 = 1.625

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_2 = arg_493_1:FormatText(StoryNameCfg[7].name)

				arg_493_1.leftNameTxt_.text = var_496_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_3 = arg_493_1:GetWordFromCfg(121511128)
				local var_496_4 = arg_493_1:FormatText(var_496_3.content)

				arg_493_1.text_.text = var_496_4

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_5 = 65
				local var_496_6 = utf8.len(var_496_4)
				local var_496_7 = var_496_5 <= 0 and var_496_1 or var_496_1 * (var_496_6 / var_496_5)

				if var_496_7 > 0 and var_496_1 < var_496_7 then
					arg_493_1.talkMaxDuration = var_496_7

					if var_496_7 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_7 + var_496_0
					end
				end

				arg_493_1.text_.text = var_496_4
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_8 = math.max(var_496_1, arg_493_1.talkMaxDuration)

			if var_496_0 <= arg_493_1.time_ and arg_493_1.time_ < var_496_0 + var_496_8 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_0) / var_496_8

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_0 + var_496_8 and arg_493_1.time_ < var_496_0 + var_496_8 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play121511129 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 121511129
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play121511130(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 0.675

			if var_500_0 < arg_497_1.time_ and arg_497_1.time_ <= var_500_0 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_2 = arg_497_1:FormatText(StoryNameCfg[7].name)

				arg_497_1.leftNameTxt_.text = var_500_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_3 = arg_497_1:GetWordFromCfg(121511129)
				local var_500_4 = arg_497_1:FormatText(var_500_3.content)

				arg_497_1.text_.text = var_500_4

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_5 = 27
				local var_500_6 = utf8.len(var_500_4)
				local var_500_7 = var_500_5 <= 0 and var_500_1 or var_500_1 * (var_500_6 / var_500_5)

				if var_500_7 > 0 and var_500_1 < var_500_7 then
					arg_497_1.talkMaxDuration = var_500_7

					if var_500_7 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_7 + var_500_0
					end
				end

				arg_497_1.text_.text = var_500_4
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_8 = math.max(var_500_1, arg_497_1.talkMaxDuration)

			if var_500_0 <= arg_497_1.time_ and arg_497_1.time_ < var_500_0 + var_500_8 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_0) / var_500_8

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_0 + var_500_8 and arg_497_1.time_ < var_500_0 + var_500_8 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play121511130 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 121511130
		arg_501_1.duration_ = 6.166

		local var_501_0 = {
			ja = 6.133,
			ko = 6.166,
			zh = 6.166
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play121511131(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0
			local var_504_1 = 0.475

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_2 = arg_501_1:FormatText(StoryNameCfg[388].name)

				arg_501_1.leftNameTxt_.text = var_504_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_3 = arg_501_1:GetWordFromCfg(121511130)
				local var_504_4 = arg_501_1:FormatText(var_504_3.content)

				arg_501_1.text_.text = var_504_4

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_5 = 19
				local var_504_6 = utf8.len(var_504_4)
				local var_504_7 = var_504_5 <= 0 and var_504_1 or var_504_1 * (var_504_6 / var_504_5)

				if var_504_7 > 0 and var_504_1 < var_504_7 then
					arg_501_1.talkMaxDuration = var_504_7

					if var_504_7 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_7 + var_504_0
					end
				end

				arg_501_1.text_.text = var_504_4
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511130", "story_v_out_121511.awb") ~= 0 then
					local var_504_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511130", "story_v_out_121511.awb") / 1000

					if var_504_8 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_8 + var_504_0
					end

					if var_504_3.prefab_name ~= "" and arg_501_1.actors_[var_504_3.prefab_name] ~= nil then
						local var_504_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_3.prefab_name].transform, "story_v_out_121511", "121511130", "story_v_out_121511.awb")

						arg_501_1:RecordAudio("121511130", var_504_9)
						arg_501_1:RecordAudio("121511130", var_504_9)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_121511", "121511130", "story_v_out_121511.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_121511", "121511130", "story_v_out_121511.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_10 = math.max(var_504_1, arg_501_1.talkMaxDuration)

			if var_504_0 <= arg_501_1.time_ and arg_501_1.time_ < var_504_0 + var_504_10 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_0) / var_504_10

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_0 + var_504_10 and arg_501_1.time_ < var_504_0 + var_504_10 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play121511131 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 121511131
		arg_505_1.duration_ = 11.2

		local var_505_0 = {
			ja = 11.2,
			ko = 9.233,
			zh = 9.233
		}
		local var_505_1 = manager.audio:GetLocalizationFlag()

		if var_505_0[var_505_1] ~= nil then
			arg_505_1.duration_ = var_505_0[var_505_1]
		end

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play121511132(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = 0
			local var_508_1 = 0.9

			if var_508_0 < arg_505_1.time_ and arg_505_1.time_ <= var_508_0 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_2 = arg_505_1:FormatText(StoryNameCfg[388].name)

				arg_505_1.leftNameTxt_.text = var_508_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_3 = arg_505_1:GetWordFromCfg(121511131)
				local var_508_4 = arg_505_1:FormatText(var_508_3.content)

				arg_505_1.text_.text = var_508_4

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_5 = 36
				local var_508_6 = utf8.len(var_508_4)
				local var_508_7 = var_508_5 <= 0 and var_508_1 or var_508_1 * (var_508_6 / var_508_5)

				if var_508_7 > 0 and var_508_1 < var_508_7 then
					arg_505_1.talkMaxDuration = var_508_7

					if var_508_7 + var_508_0 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_7 + var_508_0
					end
				end

				arg_505_1.text_.text = var_508_4
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511131", "story_v_out_121511.awb") ~= 0 then
					local var_508_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511131", "story_v_out_121511.awb") / 1000

					if var_508_8 + var_508_0 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_8 + var_508_0
					end

					if var_508_3.prefab_name ~= "" and arg_505_1.actors_[var_508_3.prefab_name] ~= nil then
						local var_508_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_3.prefab_name].transform, "story_v_out_121511", "121511131", "story_v_out_121511.awb")

						arg_505_1:RecordAudio("121511131", var_508_9)
						arg_505_1:RecordAudio("121511131", var_508_9)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_121511", "121511131", "story_v_out_121511.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_121511", "121511131", "story_v_out_121511.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_10 = math.max(var_508_1, arg_505_1.talkMaxDuration)

			if var_508_0 <= arg_505_1.time_ and arg_505_1.time_ < var_508_0 + var_508_10 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_0) / var_508_10

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_0 + var_508_10 and arg_505_1.time_ < var_508_0 + var_508_10 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play121511132 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 121511132
		arg_509_1.duration_ = 2.266

		local var_509_0 = {
			ja = 1.7,
			ko = 2.266,
			zh = 2.266
		}
		local var_509_1 = manager.audio:GetLocalizationFlag()

		if var_509_0[var_509_1] ~= nil then
			arg_509_1.duration_ = var_509_0[var_509_1]
		end

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play121511133(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = 0
			local var_512_1 = 0.35

			if var_512_0 < arg_509_1.time_ and arg_509_1.time_ <= var_512_0 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_2 = arg_509_1:FormatText(StoryNameCfg[6].name)

				arg_509_1.leftNameTxt_.text = var_512_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, true)
				arg_509_1.iconController_:SetSelectedState("hero")

				arg_509_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_3 = arg_509_1:GetWordFromCfg(121511132)
				local var_512_4 = arg_509_1:FormatText(var_512_3.content)

				arg_509_1.text_.text = var_512_4

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_5 = 14
				local var_512_6 = utf8.len(var_512_4)
				local var_512_7 = var_512_5 <= 0 and var_512_1 or var_512_1 * (var_512_6 / var_512_5)

				if var_512_7 > 0 and var_512_1 < var_512_7 then
					arg_509_1.talkMaxDuration = var_512_7

					if var_512_7 + var_512_0 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_7 + var_512_0
					end
				end

				arg_509_1.text_.text = var_512_4
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511132", "story_v_out_121511.awb") ~= 0 then
					local var_512_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511132", "story_v_out_121511.awb") / 1000

					if var_512_8 + var_512_0 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_8 + var_512_0
					end

					if var_512_3.prefab_name ~= "" and arg_509_1.actors_[var_512_3.prefab_name] ~= nil then
						local var_512_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_3.prefab_name].transform, "story_v_out_121511", "121511132", "story_v_out_121511.awb")

						arg_509_1:RecordAudio("121511132", var_512_9)
						arg_509_1:RecordAudio("121511132", var_512_9)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_out_121511", "121511132", "story_v_out_121511.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_out_121511", "121511132", "story_v_out_121511.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_10 = math.max(var_512_1, arg_509_1.talkMaxDuration)

			if var_512_0 <= arg_509_1.time_ and arg_509_1.time_ < var_512_0 + var_512_10 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_0) / var_512_10

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_0 + var_512_10 and arg_509_1.time_ < var_512_0 + var_512_10 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play121511133 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 121511133
		arg_513_1.duration_ = 7.266

		local var_513_0 = {
			ja = 5.233,
			ko = 7.266,
			zh = 7.266
		}
		local var_513_1 = manager.audio:GetLocalizationFlag()

		if var_513_0[var_513_1] ~= nil then
			arg_513_1.duration_ = var_513_0[var_513_1]
		end

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play121511134(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 0.55

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_2 = arg_513_1:FormatText(StoryNameCfg[388].name)

				arg_513_1.leftNameTxt_.text = var_516_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_3 = arg_513_1:GetWordFromCfg(121511133)
				local var_516_4 = arg_513_1:FormatText(var_516_3.content)

				arg_513_1.text_.text = var_516_4

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_5 = 22
				local var_516_6 = utf8.len(var_516_4)
				local var_516_7 = var_516_5 <= 0 and var_516_1 or var_516_1 * (var_516_6 / var_516_5)

				if var_516_7 > 0 and var_516_1 < var_516_7 then
					arg_513_1.talkMaxDuration = var_516_7

					if var_516_7 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_7 + var_516_0
					end
				end

				arg_513_1.text_.text = var_516_4
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511133", "story_v_out_121511.awb") ~= 0 then
					local var_516_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511133", "story_v_out_121511.awb") / 1000

					if var_516_8 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_8 + var_516_0
					end

					if var_516_3.prefab_name ~= "" and arg_513_1.actors_[var_516_3.prefab_name] ~= nil then
						local var_516_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_3.prefab_name].transform, "story_v_out_121511", "121511133", "story_v_out_121511.awb")

						arg_513_1:RecordAudio("121511133", var_516_9)
						arg_513_1:RecordAudio("121511133", var_516_9)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_121511", "121511133", "story_v_out_121511.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_121511", "121511133", "story_v_out_121511.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_10 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_10 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_10

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_10 and arg_513_1.time_ < var_516_0 + var_516_10 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play121511134 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 121511134
		arg_517_1.duration_ = 11.066

		local var_517_0 = {
			ja = 11.066,
			ko = 8.633,
			zh = 8.633
		}
		local var_517_1 = manager.audio:GetLocalizationFlag()

		if var_517_0[var_517_1] ~= nil then
			arg_517_1.duration_ = var_517_0[var_517_1]
		end

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play121511135(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = 0
			local var_520_1 = 0.925

			if var_520_0 < arg_517_1.time_ and arg_517_1.time_ <= var_520_0 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_2 = arg_517_1:FormatText(StoryNameCfg[381].name)

				arg_517_1.leftNameTxt_.text = var_520_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, true)
				arg_517_1.iconController_:SetSelectedState("hero")

				arg_517_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_3 = arg_517_1:GetWordFromCfg(121511134)
				local var_520_4 = arg_517_1:FormatText(var_520_3.content)

				arg_517_1.text_.text = var_520_4

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_5 = 37
				local var_520_6 = utf8.len(var_520_4)
				local var_520_7 = var_520_5 <= 0 and var_520_1 or var_520_1 * (var_520_6 / var_520_5)

				if var_520_7 > 0 and var_520_1 < var_520_7 then
					arg_517_1.talkMaxDuration = var_520_7

					if var_520_7 + var_520_0 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_7 + var_520_0
					end
				end

				arg_517_1.text_.text = var_520_4
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511134", "story_v_out_121511.awb") ~= 0 then
					local var_520_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511134", "story_v_out_121511.awb") / 1000

					if var_520_8 + var_520_0 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_8 + var_520_0
					end

					if var_520_3.prefab_name ~= "" and arg_517_1.actors_[var_520_3.prefab_name] ~= nil then
						local var_520_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_3.prefab_name].transform, "story_v_out_121511", "121511134", "story_v_out_121511.awb")

						arg_517_1:RecordAudio("121511134", var_520_9)
						arg_517_1:RecordAudio("121511134", var_520_9)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_121511", "121511134", "story_v_out_121511.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_121511", "121511134", "story_v_out_121511.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_10 = math.max(var_520_1, arg_517_1.talkMaxDuration)

			if var_520_0 <= arg_517_1.time_ and arg_517_1.time_ < var_520_0 + var_520_10 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_0) / var_520_10

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_0 + var_520_10 and arg_517_1.time_ < var_520_0 + var_520_10 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play121511135 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 121511135
		arg_521_1.duration_ = 11.933

		local var_521_0 = {
			ja = 11.933,
			ko = 8.666,
			zh = 8.666
		}
		local var_521_1 = manager.audio:GetLocalizationFlag()

		if var_521_0[var_521_1] ~= nil then
			arg_521_1.duration_ = var_521_0[var_521_1]
		end

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play121511136(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 0
			local var_524_1 = 0.625

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_2 = arg_521_1:FormatText(StoryNameCfg[388].name)

				arg_521_1.leftNameTxt_.text = var_524_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_3 = arg_521_1:GetWordFromCfg(121511135)
				local var_524_4 = arg_521_1:FormatText(var_524_3.content)

				arg_521_1.text_.text = var_524_4

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_5 = 25
				local var_524_6 = utf8.len(var_524_4)
				local var_524_7 = var_524_5 <= 0 and var_524_1 or var_524_1 * (var_524_6 / var_524_5)

				if var_524_7 > 0 and var_524_1 < var_524_7 then
					arg_521_1.talkMaxDuration = var_524_7

					if var_524_7 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_7 + var_524_0
					end
				end

				arg_521_1.text_.text = var_524_4
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511135", "story_v_out_121511.awb") ~= 0 then
					local var_524_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511135", "story_v_out_121511.awb") / 1000

					if var_524_8 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_8 + var_524_0
					end

					if var_524_3.prefab_name ~= "" and arg_521_1.actors_[var_524_3.prefab_name] ~= nil then
						local var_524_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_3.prefab_name].transform, "story_v_out_121511", "121511135", "story_v_out_121511.awb")

						arg_521_1:RecordAudio("121511135", var_524_9)
						arg_521_1:RecordAudio("121511135", var_524_9)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_121511", "121511135", "story_v_out_121511.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_121511", "121511135", "story_v_out_121511.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_10 = math.max(var_524_1, arg_521_1.talkMaxDuration)

			if var_524_0 <= arg_521_1.time_ and arg_521_1.time_ < var_524_0 + var_524_10 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_0) / var_524_10

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_0 + var_524_10 and arg_521_1.time_ < var_524_0 + var_524_10 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play121511136 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 121511136
		arg_525_1.duration_ = 10.9

		local var_525_0 = {
			ja = 10.9,
			ko = 10.033,
			zh = 10.033
		}
		local var_525_1 = manager.audio:GetLocalizationFlag()

		if var_525_0[var_525_1] ~= nil then
			arg_525_1.duration_ = var_525_0[var_525_1]
		end

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play121511137(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 1.075

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_2 = arg_525_1:FormatText(StoryNameCfg[388].name)

				arg_525_1.leftNameTxt_.text = var_528_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_3 = arg_525_1:GetWordFromCfg(121511136)
				local var_528_4 = arg_525_1:FormatText(var_528_3.content)

				arg_525_1.text_.text = var_528_4

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_5 = 43
				local var_528_6 = utf8.len(var_528_4)
				local var_528_7 = var_528_5 <= 0 and var_528_1 or var_528_1 * (var_528_6 / var_528_5)

				if var_528_7 > 0 and var_528_1 < var_528_7 then
					arg_525_1.talkMaxDuration = var_528_7

					if var_528_7 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_7 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_4
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511136", "story_v_out_121511.awb") ~= 0 then
					local var_528_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511136", "story_v_out_121511.awb") / 1000

					if var_528_8 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_8 + var_528_0
					end

					if var_528_3.prefab_name ~= "" and arg_525_1.actors_[var_528_3.prefab_name] ~= nil then
						local var_528_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_3.prefab_name].transform, "story_v_out_121511", "121511136", "story_v_out_121511.awb")

						arg_525_1:RecordAudio("121511136", var_528_9)
						arg_525_1:RecordAudio("121511136", var_528_9)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_121511", "121511136", "story_v_out_121511.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_121511", "121511136", "story_v_out_121511.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_10 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_10 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_10

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_10 and arg_525_1.time_ < var_528_0 + var_528_10 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play121511137 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 121511137
		arg_529_1.duration_ = 12.4

		local var_529_0 = {
			ja = 12.4,
			ko = 8.966,
			zh = 8.966
		}
		local var_529_1 = manager.audio:GetLocalizationFlag()

		if var_529_0[var_529_1] ~= nil then
			arg_529_1.duration_ = var_529_0[var_529_1]
		end

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play121511138(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0
			local var_532_1 = 0.9

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_2 = arg_529_1:FormatText(StoryNameCfg[388].name)

				arg_529_1.leftNameTxt_.text = var_532_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_3 = arg_529_1:GetWordFromCfg(121511137)
				local var_532_4 = arg_529_1:FormatText(var_532_3.content)

				arg_529_1.text_.text = var_532_4

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_5 = 36
				local var_532_6 = utf8.len(var_532_4)
				local var_532_7 = var_532_5 <= 0 and var_532_1 or var_532_1 * (var_532_6 / var_532_5)

				if var_532_7 > 0 and var_532_1 < var_532_7 then
					arg_529_1.talkMaxDuration = var_532_7

					if var_532_7 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_7 + var_532_0
					end
				end

				arg_529_1.text_.text = var_532_4
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511137", "story_v_out_121511.awb") ~= 0 then
					local var_532_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511137", "story_v_out_121511.awb") / 1000

					if var_532_8 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_8 + var_532_0
					end

					if var_532_3.prefab_name ~= "" and arg_529_1.actors_[var_532_3.prefab_name] ~= nil then
						local var_532_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_529_1.actors_[var_532_3.prefab_name].transform, "story_v_out_121511", "121511137", "story_v_out_121511.awb")

						arg_529_1:RecordAudio("121511137", var_532_9)
						arg_529_1:RecordAudio("121511137", var_532_9)
					else
						arg_529_1:AudioAction("play", "voice", "story_v_out_121511", "121511137", "story_v_out_121511.awb")
					end

					arg_529_1:RecordHistoryTalkVoice("story_v_out_121511", "121511137", "story_v_out_121511.awb")
				end

				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_10 = math.max(var_532_1, arg_529_1.talkMaxDuration)

			if var_532_0 <= arg_529_1.time_ and arg_529_1.time_ < var_532_0 + var_532_10 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_0) / var_532_10

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_0 + var_532_10 and arg_529_1.time_ < var_532_0 + var_532_10 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play121511138 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 121511138
		arg_533_1.duration_ = 17.633

		local var_533_0 = {
			ja = 17.633,
			ko = 7.8,
			zh = 7.8
		}
		local var_533_1 = manager.audio:GetLocalizationFlag()

		if var_533_0[var_533_1] ~= nil then
			arg_533_1.duration_ = var_533_0[var_533_1]
		end

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play121511139(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = 0
			local var_536_1 = 0.8

			if var_536_0 < arg_533_1.time_ and arg_533_1.time_ <= var_536_0 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_2 = arg_533_1:FormatText(StoryNameCfg[388].name)

				arg_533_1.leftNameTxt_.text = var_536_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_3 = arg_533_1:GetWordFromCfg(121511138)
				local var_536_4 = arg_533_1:FormatText(var_536_3.content)

				arg_533_1.text_.text = var_536_4

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_5 = 32
				local var_536_6 = utf8.len(var_536_4)
				local var_536_7 = var_536_5 <= 0 and var_536_1 or var_536_1 * (var_536_6 / var_536_5)

				if var_536_7 > 0 and var_536_1 < var_536_7 then
					arg_533_1.talkMaxDuration = var_536_7

					if var_536_7 + var_536_0 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_7 + var_536_0
					end
				end

				arg_533_1.text_.text = var_536_4
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511138", "story_v_out_121511.awb") ~= 0 then
					local var_536_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511138", "story_v_out_121511.awb") / 1000

					if var_536_8 + var_536_0 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_8 + var_536_0
					end

					if var_536_3.prefab_name ~= "" and arg_533_1.actors_[var_536_3.prefab_name] ~= nil then
						local var_536_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_533_1.actors_[var_536_3.prefab_name].transform, "story_v_out_121511", "121511138", "story_v_out_121511.awb")

						arg_533_1:RecordAudio("121511138", var_536_9)
						arg_533_1:RecordAudio("121511138", var_536_9)
					else
						arg_533_1:AudioAction("play", "voice", "story_v_out_121511", "121511138", "story_v_out_121511.awb")
					end

					arg_533_1:RecordHistoryTalkVoice("story_v_out_121511", "121511138", "story_v_out_121511.awb")
				end

				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_10 = math.max(var_536_1, arg_533_1.talkMaxDuration)

			if var_536_0 <= arg_533_1.time_ and arg_533_1.time_ < var_536_0 + var_536_10 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_0) / var_536_10

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_0 + var_536_10 and arg_533_1.time_ < var_536_0 + var_536_10 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play121511139 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 121511139
		arg_537_1.duration_ = 13.866

		local var_537_0 = {
			ja = 13.866,
			ko = 8.6,
			zh = 8.6
		}
		local var_537_1 = manager.audio:GetLocalizationFlag()

		if var_537_0[var_537_1] ~= nil then
			arg_537_1.duration_ = var_537_0[var_537_1]
		end

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play121511140(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = 0
			local var_540_1 = 0.875

			if var_540_0 < arg_537_1.time_ and arg_537_1.time_ <= var_540_0 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_2 = arg_537_1:FormatText(StoryNameCfg[388].name)

				arg_537_1.leftNameTxt_.text = var_540_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_3 = arg_537_1:GetWordFromCfg(121511139)
				local var_540_4 = arg_537_1:FormatText(var_540_3.content)

				arg_537_1.text_.text = var_540_4

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_5 = 35
				local var_540_6 = utf8.len(var_540_4)
				local var_540_7 = var_540_5 <= 0 and var_540_1 or var_540_1 * (var_540_6 / var_540_5)

				if var_540_7 > 0 and var_540_1 < var_540_7 then
					arg_537_1.talkMaxDuration = var_540_7

					if var_540_7 + var_540_0 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_7 + var_540_0
					end
				end

				arg_537_1.text_.text = var_540_4
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511139", "story_v_out_121511.awb") ~= 0 then
					local var_540_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511139", "story_v_out_121511.awb") / 1000

					if var_540_8 + var_540_0 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_8 + var_540_0
					end

					if var_540_3.prefab_name ~= "" and arg_537_1.actors_[var_540_3.prefab_name] ~= nil then
						local var_540_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_3.prefab_name].transform, "story_v_out_121511", "121511139", "story_v_out_121511.awb")

						arg_537_1:RecordAudio("121511139", var_540_9)
						arg_537_1:RecordAudio("121511139", var_540_9)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_121511", "121511139", "story_v_out_121511.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_121511", "121511139", "story_v_out_121511.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_10 = math.max(var_540_1, arg_537_1.talkMaxDuration)

			if var_540_0 <= arg_537_1.time_ and arg_537_1.time_ < var_540_0 + var_540_10 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_0) / var_540_10

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_0 + var_540_10 and arg_537_1.time_ < var_540_0 + var_540_10 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play121511140 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 121511140
		arg_541_1.duration_ = 5

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play121511141(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0
			local var_544_1 = 0.675

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_2 = arg_541_1:FormatText(StoryNameCfg[7].name)

				arg_541_1.leftNameTxt_.text = var_544_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_3 = arg_541_1:GetWordFromCfg(121511140)
				local var_544_4 = arg_541_1:FormatText(var_544_3.content)

				arg_541_1.text_.text = var_544_4

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_5 = 27
				local var_544_6 = utf8.len(var_544_4)
				local var_544_7 = var_544_5 <= 0 and var_544_1 or var_544_1 * (var_544_6 / var_544_5)

				if var_544_7 > 0 and var_544_1 < var_544_7 then
					arg_541_1.talkMaxDuration = var_544_7

					if var_544_7 + var_544_0 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_7 + var_544_0
					end
				end

				arg_541_1.text_.text = var_544_4
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)
				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_8 = math.max(var_544_1, arg_541_1.talkMaxDuration)

			if var_544_0 <= arg_541_1.time_ and arg_541_1.time_ < var_544_0 + var_544_8 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_0) / var_544_8

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_0 + var_544_8 and arg_541_1.time_ < var_544_0 + var_544_8 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play121511141 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 121511141
		arg_545_1.duration_ = 18.333

		local var_545_0 = {
			ja = 18.333,
			ko = 11.733,
			zh = 11.733
		}
		local var_545_1 = manager.audio:GetLocalizationFlag()

		if var_545_0[var_545_1] ~= nil then
			arg_545_1.duration_ = var_545_0[var_545_1]
		end

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play121511142(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0
			local var_548_1 = 0.975

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_2 = arg_545_1:FormatText(StoryNameCfg[441].name)

				arg_545_1.leftNameTxt_.text = var_548_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_3 = arg_545_1:GetWordFromCfg(121511141)
				local var_548_4 = arg_545_1:FormatText(var_548_3.content)

				arg_545_1.text_.text = var_548_4

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_5 = 39
				local var_548_6 = utf8.len(var_548_4)
				local var_548_7 = var_548_5 <= 0 and var_548_1 or var_548_1 * (var_548_6 / var_548_5)

				if var_548_7 > 0 and var_548_1 < var_548_7 then
					arg_545_1.talkMaxDuration = var_548_7

					if var_548_7 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_7 + var_548_0
					end
				end

				arg_545_1.text_.text = var_548_4
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511141", "story_v_out_121511.awb") ~= 0 then
					local var_548_8 = manager.audio:GetVoiceLength("story_v_out_121511", "121511141", "story_v_out_121511.awb") / 1000

					if var_548_8 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_8 + var_548_0
					end

					if var_548_3.prefab_name ~= "" and arg_545_1.actors_[var_548_3.prefab_name] ~= nil then
						local var_548_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_545_1.actors_[var_548_3.prefab_name].transform, "story_v_out_121511", "121511141", "story_v_out_121511.awb")

						arg_545_1:RecordAudio("121511141", var_548_9)
						arg_545_1:RecordAudio("121511141", var_548_9)
					else
						arg_545_1:AudioAction("play", "voice", "story_v_out_121511", "121511141", "story_v_out_121511.awb")
					end

					arg_545_1:RecordHistoryTalkVoice("story_v_out_121511", "121511141", "story_v_out_121511.awb")
				end

				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_10 = math.max(var_548_1, arg_545_1.talkMaxDuration)

			if var_548_0 <= arg_545_1.time_ and arg_545_1.time_ < var_548_0 + var_548_10 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_0) / var_548_10

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_0 + var_548_10 and arg_545_1.time_ < var_548_0 + var_548_10 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play121511142 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 121511142
		arg_549_1.duration_ = 5

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play121511143(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = manager.ui.mainCamera.transform
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 then
				local var_552_2 = arg_549_1.var_.effectxuehua2

				if var_552_2 then
					Object.Destroy(var_552_2)

					arg_549_1.var_.effectxuehua2 = nil
				end
			end

			local var_552_3 = 0
			local var_552_4 = 0.633333333333333

			if var_552_3 < arg_549_1.time_ and arg_549_1.time_ <= var_552_3 + arg_552_0 then
				local var_552_5 = "play"
				local var_552_6 = "effect"

				arg_549_1:AudioAction(var_552_5, var_552_6, "se_story_121_04", "se_story_121_04_spacegap", "")
			end

			local var_552_7 = 0
			local var_552_8 = 0.85

			if var_552_7 < arg_549_1.time_ and arg_549_1.time_ <= var_552_7 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0

				arg_549_1.dialog_:SetActive(true)

				local var_552_9 = LeanTween.value(arg_549_1.dialog_, 0, 1, 0.3)

				var_552_9:setOnUpdate(LuaHelper.FloatAction(function(arg_553_0)
					arg_549_1.dialogCg_.alpha = arg_553_0
				end))
				var_552_9:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_549_1.dialog_)
					var_552_9:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_549_1.duration_ = arg_549_1.duration_ + 0.3

				SetActive(arg_549_1.leftNameGo_, false)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_10 = arg_549_1:GetWordFromCfg(121511142)
				local var_552_11 = arg_549_1:FormatText(var_552_10.content)

				arg_549_1.text_.text = var_552_11

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_12 = 34
				local var_552_13 = utf8.len(var_552_11)
				local var_552_14 = var_552_12 <= 0 and var_552_8 or var_552_8 * (var_552_13 / var_552_12)

				if var_552_14 > 0 and var_552_8 < var_552_14 then
					arg_549_1.talkMaxDuration = var_552_14
					var_552_7 = var_552_7 + 0.3

					if var_552_14 + var_552_7 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_14 + var_552_7
					end
				end

				arg_549_1.text_.text = var_552_11
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)
				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_15 = var_552_7 + 0.3
			local var_552_16 = math.max(var_552_8, arg_549_1.talkMaxDuration)

			if var_552_15 <= arg_549_1.time_ and arg_549_1.time_ < var_552_15 + var_552_16 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_15) / var_552_16

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_15 + var_552_16 and arg_549_1.time_ < var_552_15 + var_552_16 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play121511143 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 121511143
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play121511144(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0.166666666666667
			local var_558_1 = 0.633333333333333

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				local var_558_2 = "play"
				local var_558_3 = "effect"

				arg_555_1:AudioAction(var_558_2, var_558_3, "se_story_121_04", "se_story_121_04_monsterchange", "")
			end

			local var_558_4 = 0
			local var_558_5 = 1.55

			if var_558_4 < arg_555_1.time_ and arg_555_1.time_ <= var_558_4 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_6 = arg_555_1:GetWordFromCfg(121511143)
				local var_558_7 = arg_555_1:FormatText(var_558_6.content)

				arg_555_1.text_.text = var_558_7

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_8 = 62
				local var_558_9 = utf8.len(var_558_7)
				local var_558_10 = var_558_8 <= 0 and var_558_5 or var_558_5 * (var_558_9 / var_558_8)

				if var_558_10 > 0 and var_558_5 < var_558_10 then
					arg_555_1.talkMaxDuration = var_558_10

					if var_558_10 + var_558_4 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_10 + var_558_4
					end
				end

				arg_555_1.text_.text = var_558_7
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_11 = math.max(var_558_5, arg_555_1.talkMaxDuration)

			if var_558_4 <= arg_555_1.time_ and arg_555_1.time_ < var_558_4 + var_558_11 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_4) / var_558_11

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_4 + var_558_11 and arg_555_1.time_ < var_558_4 + var_558_11 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play121511144 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 121511144
		arg_559_1.duration_ = 9.316666666666

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play121511145(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = "STblack"

			if arg_559_1.bgs_[var_562_0] == nil then
				local var_562_1 = Object.Instantiate(arg_559_1.paintGo_)

				var_562_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_562_0)
				var_562_1.name = var_562_0
				var_562_1.transform.parent = arg_559_1.stage_.transform
				var_562_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_559_1.bgs_[var_562_0] = var_562_1
			end

			local var_562_2 = 2

			if var_562_2 < arg_559_1.time_ and arg_559_1.time_ <= var_562_2 + arg_562_0 then
				local var_562_3 = manager.ui.mainCamera.transform.localPosition
				local var_562_4 = Vector3.New(0, 0, 10) + Vector3.New(var_562_3.x, var_562_3.y, 0)
				local var_562_5 = arg_559_1.bgs_.STblack

				var_562_5.transform.localPosition = var_562_4
				var_562_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_562_6 = var_562_5:GetComponent("SpriteRenderer")

				if var_562_6 and var_562_6.sprite then
					local var_562_7 = (var_562_5.transform.localPosition - var_562_3).z
					local var_562_8 = manager.ui.mainCameraCom_
					local var_562_9 = 2 * var_562_7 * Mathf.Tan(var_562_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_562_10 = var_562_9 * var_562_8.aspect
					local var_562_11 = var_562_6.sprite.bounds.size.x
					local var_562_12 = var_562_6.sprite.bounds.size.y
					local var_562_13 = var_562_10 / var_562_11
					local var_562_14 = var_562_9 / var_562_12
					local var_562_15 = var_562_14 < var_562_13 and var_562_13 or var_562_14

					var_562_5.transform.localScale = Vector3.New(var_562_15, var_562_15, 0)
				end

				for iter_562_0, iter_562_1 in pairs(arg_559_1.bgs_) do
					if iter_562_0 ~= "STblack" then
						iter_562_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_562_16 = 0

			if var_562_16 < arg_559_1.time_ and arg_559_1.time_ <= var_562_16 + arg_562_0 then
				arg_559_1.mask_.enabled = true
				arg_559_1.mask_.raycastTarget = true

				arg_559_1:SetGaussion(false)
			end

			local var_562_17 = 2

			if var_562_16 <= arg_559_1.time_ and arg_559_1.time_ < var_562_16 + var_562_17 then
				local var_562_18 = (arg_559_1.time_ - var_562_16) / var_562_17
				local var_562_19 = Color.New(0, 0, 0)

				var_562_19.a = Mathf.Lerp(0, 1, var_562_18)
				arg_559_1.mask_.color = var_562_19
			end

			if arg_559_1.time_ >= var_562_16 + var_562_17 and arg_559_1.time_ < var_562_16 + var_562_17 + arg_562_0 then
				local var_562_20 = Color.New(0, 0, 0)

				var_562_20.a = 1
				arg_559_1.mask_.color = var_562_20
			end

			local var_562_21 = 2

			if var_562_21 < arg_559_1.time_ and arg_559_1.time_ <= var_562_21 + arg_562_0 then
				arg_559_1.mask_.enabled = true
				arg_559_1.mask_.raycastTarget = true

				arg_559_1:SetGaussion(false)
			end

			local var_562_22 = 2

			if var_562_21 <= arg_559_1.time_ and arg_559_1.time_ < var_562_21 + var_562_22 then
				local var_562_23 = (arg_559_1.time_ - var_562_21) / var_562_22
				local var_562_24 = Color.New(0, 0, 0)

				var_562_24.a = Mathf.Lerp(1, 0, var_562_23)
				arg_559_1.mask_.color = var_562_24
			end

			if arg_559_1.time_ >= var_562_21 + var_562_22 and arg_559_1.time_ < var_562_21 + var_562_22 + arg_562_0 then
				local var_562_25 = Color.New(0, 0, 0)
				local var_562_26 = 0

				arg_559_1.mask_.enabled = false
				var_562_25.a = var_562_26
				arg_559_1.mask_.color = var_562_25
			end

			local var_562_27 = 2

			if var_562_27 < arg_559_1.time_ and arg_559_1.time_ <= var_562_27 + arg_562_0 then
				arg_559_1.fswbg_:SetActive(true)
				arg_559_1.dialog_:SetActive(false)

				arg_559_1.fswtw_.percent = 0

				local var_562_28 = arg_559_1:GetWordFromCfg(121511144)
				local var_562_29 = arg_559_1:FormatText(var_562_28.content)

				arg_559_1.fswt_.text = var_562_29

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.fswt_)

				arg_559_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_559_1.fswtw_:SetDirty()

				arg_559_1.typewritterCharCountI18N = 0

				SetActive(arg_559_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_559_1:ShowNextGo(false)
			end

			local var_562_30 = 4

			if var_562_30 < arg_559_1.time_ and arg_559_1.time_ <= var_562_30 + arg_562_0 then
				arg_559_1.var_.oldValueTypewriter = arg_559_1.fswtw_.percent

				arg_559_1:ShowNextGo(false)
			end

			local var_562_31 = 25
			local var_562_32 = 1.66666666666667
			local var_562_33 = arg_559_1:GetWordFromCfg(121511144)
			local var_562_34 = arg_559_1:FormatText(var_562_33.content)
			local var_562_35, var_562_36 = arg_559_1:GetPercentByPara(var_562_34, 1)

			if var_562_30 < arg_559_1.time_ and arg_559_1.time_ <= var_562_30 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0

				local var_562_37 = var_562_31 <= 0 and var_562_32 or var_562_32 * ((var_562_36 - arg_559_1.typewritterCharCountI18N) / var_562_31)

				if var_562_37 > 0 and var_562_32 < var_562_37 then
					arg_559_1.talkMaxDuration = var_562_37

					if var_562_37 + var_562_30 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_37 + var_562_30
					end
				end
			end

			local var_562_38 = 1.66666666666667
			local var_562_39 = math.max(var_562_38, arg_559_1.talkMaxDuration)

			if var_562_30 <= arg_559_1.time_ and arg_559_1.time_ < var_562_30 + var_562_39 then
				local var_562_40 = (arg_559_1.time_ - var_562_30) / var_562_39

				arg_559_1.fswtw_.percent = Mathf.Lerp(arg_559_1.var_.oldValueTypewriter, var_562_35, var_562_40)
				arg_559_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_559_1.fswtw_:SetDirty()
			end

			if arg_559_1.time_ >= var_562_30 + var_562_39 and arg_559_1.time_ < var_562_30 + var_562_39 + arg_562_0 then
				arg_559_1.fswtw_.percent = var_562_35

				arg_559_1.fswtw_:SetDirty()
				arg_559_1:ShowNextGo(true)

				arg_559_1.typewritterCharCountI18N = var_562_36
			end

			local var_562_41 = 4

			if var_562_41 < arg_559_1.time_ and arg_559_1.time_ <= var_562_41 + arg_562_0 then
				local var_562_42 = arg_559_1.fswbg_.transform:Find("textbox/adapt/content") or arg_559_1.fswbg_.transform:Find("textbox/content")
				local var_562_43 = var_562_42:GetComponent("Text")
				local var_562_44 = var_562_42:GetComponent("RectTransform")

				var_562_43.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_562_44.offsetMin = Vector2.New(0, 0)
				var_562_44.offsetMax = Vector2.New(0, 0)
			end

			local var_562_45 = 4.01666666666667
			local var_562_46 = 5.3
			local var_562_47 = manager.audio:GetVoiceLength("story_v_out_121511", "121511144", "story_v_out_121511.awb") / 1000

			if var_562_47 > 0 and var_562_46 < var_562_47 and var_562_47 + var_562_45 > arg_559_1.duration_ then
				local var_562_48 = var_562_47

				arg_559_1.duration_ = var_562_47 + var_562_45
			end

			if var_562_45 < arg_559_1.time_ and arg_559_1.time_ <= var_562_45 + arg_562_0 then
				local var_562_49 = "play"
				local var_562_50 = "voice"

				arg_559_1:AudioAction(var_562_49, var_562_50, "story_v_out_121511", "121511144", "story_v_out_121511.awb")
			end
		end
	end,
	Play121511145 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 121511145
		arg_563_1.duration_ = 5.065999999999

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play121511146(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.fswbg_:SetActive(true)
				arg_563_1.dialog_:SetActive(false)

				arg_563_1.fswtw_.percent = 0

				local var_566_1 = arg_563_1:GetWordFromCfg(121511145)
				local var_566_2 = arg_563_1:FormatText(var_566_1.content)

				arg_563_1.fswt_.text = var_566_2

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.fswt_)

				arg_563_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_563_1.fswtw_:SetDirty()

				arg_563_1.typewritterCharCountI18N = 0

				SetActive(arg_563_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_563_1:ShowNextGo(false)
			end

			local var_566_3 = 0.0166666666666666

			if var_566_3 < arg_563_1.time_ and arg_563_1.time_ <= var_566_3 + arg_566_0 then
				arg_563_1.var_.oldValueTypewriter = arg_563_1.fswtw_.percent

				arg_563_1:ShowNextGo(false)
			end

			local var_566_4 = 27
			local var_566_5 = 1.8
			local var_566_6 = arg_563_1:GetWordFromCfg(121511145)
			local var_566_7 = arg_563_1:FormatText(var_566_6.content)
			local var_566_8, var_566_9 = arg_563_1:GetPercentByPara(var_566_7, 1)

			if var_566_3 < arg_563_1.time_ and arg_563_1.time_ <= var_566_3 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0

				local var_566_10 = var_566_4 <= 0 and var_566_5 or var_566_5 * ((var_566_9 - arg_563_1.typewritterCharCountI18N) / var_566_4)

				if var_566_10 > 0 and var_566_5 < var_566_10 then
					arg_563_1.talkMaxDuration = var_566_10

					if var_566_10 + var_566_3 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_10 + var_566_3
					end
				end
			end

			local var_566_11 = 1.8
			local var_566_12 = math.max(var_566_11, arg_563_1.talkMaxDuration)

			if var_566_3 <= arg_563_1.time_ and arg_563_1.time_ < var_566_3 + var_566_12 then
				local var_566_13 = (arg_563_1.time_ - var_566_3) / var_566_12

				arg_563_1.fswtw_.percent = Mathf.Lerp(arg_563_1.var_.oldValueTypewriter, var_566_8, var_566_13)
				arg_563_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_563_1.fswtw_:SetDirty()
			end

			if arg_563_1.time_ >= var_566_3 + var_566_12 and arg_563_1.time_ < var_566_3 + var_566_12 + arg_566_0 then
				arg_563_1.fswtw_.percent = var_566_8

				arg_563_1.fswtw_:SetDirty()
				arg_563_1:ShowNextGo(true)

				arg_563_1.typewritterCharCountI18N = var_566_9
			end

			local var_566_14 = 0
			local var_566_15 = 5.066
			local var_566_16 = manager.audio:GetVoiceLength("story_v_out_121511", "121511145", "story_v_out_121511.awb") / 1000

			if var_566_16 > 0 and var_566_15 < var_566_16 and var_566_16 + var_566_14 > arg_563_1.duration_ then
				local var_566_17 = var_566_16

				arg_563_1.duration_ = var_566_16 + var_566_14
			end

			if var_566_14 < arg_563_1.time_ and arg_563_1.time_ <= var_566_14 + arg_566_0 then
				local var_566_18 = "play"
				local var_566_19 = "voice"

				arg_563_1:AudioAction(var_566_18, var_566_19, "story_v_out_121511", "121511145", "story_v_out_121511.awb")
			end
		end
	end,
	Play121511146 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 121511146
		arg_567_1.duration_ = 1.532999999999

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
			arg_567_1.auto_ = false
		end

		function arg_567_1.playNext_(arg_569_0)
			arg_567_1.onStoryFinished_()
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.fswbg_:SetActive(true)
				arg_567_1.dialog_:SetActive(false)

				arg_567_1.fswtw_.percent = 0

				local var_570_1 = arg_567_1:GetWordFromCfg(121511146)
				local var_570_2 = arg_567_1:FormatText(var_570_1.content)

				arg_567_1.fswt_.text = var_570_2

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.fswt_)

				arg_567_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_567_1.fswtw_:SetDirty()

				arg_567_1.typewritterCharCountI18N = 0

				SetActive(arg_567_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_567_1:ShowNextGo(false)
			end

			local var_570_3 = 0.0166666666666665

			if var_570_3 < arg_567_1.time_ and arg_567_1.time_ <= var_570_3 + arg_570_0 then
				arg_567_1.var_.oldValueTypewriter = arg_567_1.fswtw_.percent

				arg_567_1:ShowNextGo(false)
			end

			local var_570_4 = 5
			local var_570_5 = 0.333333333333333
			local var_570_6 = arg_567_1:GetWordFromCfg(121511146)
			local var_570_7 = arg_567_1:FormatText(var_570_6.content)
			local var_570_8, var_570_9 = arg_567_1:GetPercentByPara(var_570_7, 1)

			if var_570_3 < arg_567_1.time_ and arg_567_1.time_ <= var_570_3 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0

				local var_570_10 = var_570_4 <= 0 and var_570_5 or var_570_5 * ((var_570_9 - arg_567_1.typewritterCharCountI18N) / var_570_4)

				if var_570_10 > 0 and var_570_5 < var_570_10 then
					arg_567_1.talkMaxDuration = var_570_10

					if var_570_10 + var_570_3 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_10 + var_570_3
					end
				end
			end

			local var_570_11 = 0.333333333333333
			local var_570_12 = math.max(var_570_11, arg_567_1.talkMaxDuration)

			if var_570_3 <= arg_567_1.time_ and arg_567_1.time_ < var_570_3 + var_570_12 then
				local var_570_13 = (arg_567_1.time_ - var_570_3) / var_570_12

				arg_567_1.fswtw_.percent = Mathf.Lerp(arg_567_1.var_.oldValueTypewriter, var_570_8, var_570_13)
				arg_567_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_567_1.fswtw_:SetDirty()
			end

			if arg_567_1.time_ >= var_570_3 + var_570_12 and arg_567_1.time_ < var_570_3 + var_570_12 + arg_570_0 then
				arg_567_1.fswtw_.percent = var_570_8

				arg_567_1.fswtw_:SetDirty()
				arg_567_1:ShowNextGo(true)

				arg_567_1.typewritterCharCountI18N = var_570_9
			end

			local var_570_14 = 0
			local var_570_15 = 1.533
			local var_570_16 = manager.audio:GetVoiceLength("story_v_out_121511", "121511146", "story_v_out_121511.awb") / 1000

			if var_570_16 > 0 and var_570_15 < var_570_16 and var_570_16 + var_570_14 > arg_567_1.duration_ then
				local var_570_17 = var_570_16

				arg_567_1.duration_ = var_570_16 + var_570_14
			end

			if var_570_14 < arg_567_1.time_ and arg_567_1.time_ <= var_570_14 + arg_570_0 then
				local var_570_18 = "play"
				local var_570_19 = "voice"

				arg_567_1:AudioAction(var_570_18, var_570_19, "story_v_out_121511", "121511146", "story_v_out_121511.awb")
			end
		end
	end,
	Play121511070 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 121511070
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play121511071(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["10042ui_story"]
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 and arg_571_1.var_.characterEffect10042ui_story == nil then
				arg_571_1.var_.characterEffect10042ui_story = var_574_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_2 = 0.200000002980232

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2

				if arg_571_1.var_.characterEffect10042ui_story then
					local var_574_4 = Mathf.Lerp(0, 0.5, var_574_3)

					arg_571_1.var_.characterEffect10042ui_story.fillFlat = true
					arg_571_1.var_.characterEffect10042ui_story.fillRatio = var_574_4
				end
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 and arg_571_1.var_.characterEffect10042ui_story then
				local var_574_5 = 0.5

				arg_571_1.var_.characterEffect10042ui_story.fillFlat = true
				arg_571_1.var_.characterEffect10042ui_story.fillRatio = var_574_5
			end

			local var_574_6 = 0
			local var_574_7 = 0.25

			if var_574_6 < arg_571_1.time_ and arg_571_1.time_ <= var_574_6 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_8 = arg_571_1:FormatText(StoryNameCfg[7].name)

				arg_571_1.leftNameTxt_.text = var_574_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_9 = arg_571_1:GetWordFromCfg(121511070)
				local var_574_10 = arg_571_1:FormatText(var_574_9.content)

				arg_571_1.text_.text = var_574_10

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_11 = 10
				local var_574_12 = utf8.len(var_574_10)
				local var_574_13 = var_574_11 <= 0 and var_574_7 or var_574_7 * (var_574_12 / var_574_11)

				if var_574_13 > 0 and var_574_7 < var_574_13 then
					arg_571_1.talkMaxDuration = var_574_13

					if var_574_13 + var_574_6 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_13 + var_574_6
					end
				end

				arg_571_1.text_.text = var_574_10
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_14 = math.max(var_574_7, arg_571_1.talkMaxDuration)

			if var_574_6 <= arg_571_1.time_ and arg_571_1.time_ < var_574_6 + var_574_14 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_6) / var_574_14

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_6 + var_574_14 and arg_571_1.time_ < var_574_6 + var_574_14 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play121511071 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 121511071
		arg_575_1.duration_ = 3.566

		local var_575_0 = {
			ja = 3.566,
			ko = 2.366,
			zh = 2.366
		}
		local var_575_1 = manager.audio:GetLocalizationFlag()

		if var_575_0[var_575_1] ~= nil then
			arg_575_1.duration_ = var_575_0[var_575_1]
		end

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play121511072(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1184ui_story"].transform
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 then
				arg_575_1.var_.moveOldPos1184ui_story = var_578_0.localPosition
			end

			local var_578_2 = 0.001

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2
				local var_578_4 = Vector3.New(0, -0.97, -6)

				var_578_0.localPosition = Vector3.Lerp(arg_575_1.var_.moveOldPos1184ui_story, var_578_4, var_578_3)

				local var_578_5 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_5.x, var_578_5.y, var_578_5.z)

				local var_578_6 = var_578_0.localEulerAngles

				var_578_6.z = 0
				var_578_6.x = 0
				var_578_0.localEulerAngles = var_578_6
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 then
				var_578_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_578_7 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_7.x, var_578_7.y, var_578_7.z)

				local var_578_8 = var_578_0.localEulerAngles

				var_578_8.z = 0
				var_578_8.x = 0
				var_578_0.localEulerAngles = var_578_8
			end

			local var_578_9 = arg_575_1.actors_["1184ui_story"]
			local var_578_10 = 0

			if var_578_10 < arg_575_1.time_ and arg_575_1.time_ <= var_578_10 + arg_578_0 and arg_575_1.var_.characterEffect1184ui_story == nil then
				arg_575_1.var_.characterEffect1184ui_story = var_578_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_11 = 0.200000002980232

			if var_578_10 <= arg_575_1.time_ and arg_575_1.time_ < var_578_10 + var_578_11 then
				local var_578_12 = (arg_575_1.time_ - var_578_10) / var_578_11

				if arg_575_1.var_.characterEffect1184ui_story then
					arg_575_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_575_1.time_ >= var_578_10 + var_578_11 and arg_575_1.time_ < var_578_10 + var_578_11 + arg_578_0 and arg_575_1.var_.characterEffect1184ui_story then
				arg_575_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_578_13 = 0

			if var_578_13 < arg_575_1.time_ and arg_575_1.time_ <= var_578_13 + arg_578_0 then
				arg_575_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_578_14 = 0

			if var_578_14 < arg_575_1.time_ and arg_575_1.time_ <= var_578_14 + arg_578_0 then
				arg_575_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_578_15 = 0
			local var_578_16 = 0.2

			if var_578_15 < arg_575_1.time_ and arg_575_1.time_ <= var_578_15 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_17 = arg_575_1:FormatText(StoryNameCfg[6].name)

				arg_575_1.leftNameTxt_.text = var_578_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_18 = arg_575_1:GetWordFromCfg(121511071)
				local var_578_19 = arg_575_1:FormatText(var_578_18.content)

				arg_575_1.text_.text = var_578_19

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_20 = 8
				local var_578_21 = utf8.len(var_578_19)
				local var_578_22 = var_578_20 <= 0 and var_578_16 or var_578_16 * (var_578_21 / var_578_20)

				if var_578_22 > 0 and var_578_16 < var_578_22 then
					arg_575_1.talkMaxDuration = var_578_22

					if var_578_22 + var_578_15 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_22 + var_578_15
					end
				end

				arg_575_1.text_.text = var_578_19
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511071", "story_v_out_121511.awb") ~= 0 then
					local var_578_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511071", "story_v_out_121511.awb") / 1000

					if var_578_23 + var_578_15 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_23 + var_578_15
					end

					if var_578_18.prefab_name ~= "" and arg_575_1.actors_[var_578_18.prefab_name] ~= nil then
						local var_578_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_575_1.actors_[var_578_18.prefab_name].transform, "story_v_out_121511", "121511071", "story_v_out_121511.awb")

						arg_575_1:RecordAudio("121511071", var_578_24)
						arg_575_1:RecordAudio("121511071", var_578_24)
					else
						arg_575_1:AudioAction("play", "voice", "story_v_out_121511", "121511071", "story_v_out_121511.awb")
					end

					arg_575_1:RecordHistoryTalkVoice("story_v_out_121511", "121511071", "story_v_out_121511.awb")
				end

				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_25 = math.max(var_578_16, arg_575_1.talkMaxDuration)

			if var_578_15 <= arg_575_1.time_ and arg_575_1.time_ < var_578_15 + var_578_25 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_15) / var_578_25

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_15 + var_578_25 and arg_575_1.time_ < var_578_15 + var_578_25 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play121511072 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 121511072
		arg_579_1.duration_ = 5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play121511073(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1184ui_story"]
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 and arg_579_1.var_.characterEffect1184ui_story == nil then
				arg_579_1.var_.characterEffect1184ui_story = var_582_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_2 = 0.200000002980232

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2

				if arg_579_1.var_.characterEffect1184ui_story then
					local var_582_4 = Mathf.Lerp(0, 0.5, var_582_3)

					arg_579_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_579_1.var_.characterEffect1184ui_story.fillRatio = var_582_4
				end
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 and arg_579_1.var_.characterEffect1184ui_story then
				local var_582_5 = 0.5

				arg_579_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_579_1.var_.characterEffect1184ui_story.fillRatio = var_582_5
			end

			local var_582_6 = 0
			local var_582_7 = 0.5

			if var_582_6 < arg_579_1.time_ and arg_579_1.time_ <= var_582_6 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_8 = arg_579_1:FormatText(StoryNameCfg[7].name)

				arg_579_1.leftNameTxt_.text = var_582_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_9 = arg_579_1:GetWordFromCfg(121511072)
				local var_582_10 = arg_579_1:FormatText(var_582_9.content)

				arg_579_1.text_.text = var_582_10

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_11 = 20
				local var_582_12 = utf8.len(var_582_10)
				local var_582_13 = var_582_11 <= 0 and var_582_7 or var_582_7 * (var_582_12 / var_582_11)

				if var_582_13 > 0 and var_582_7 < var_582_13 then
					arg_579_1.talkMaxDuration = var_582_13

					if var_582_13 + var_582_6 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_13 + var_582_6
					end
				end

				arg_579_1.text_.text = var_582_10
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)
				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_14 = math.max(var_582_7, arg_579_1.talkMaxDuration)

			if var_582_6 <= arg_579_1.time_ and arg_579_1.time_ < var_582_6 + var_582_14 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_6) / var_582_14

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_6 + var_582_14 and arg_579_1.time_ < var_582_6 + var_582_14 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play121511073 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 121511073
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play121511074(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1184ui_story"].transform
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 then
				arg_583_1.var_.moveOldPos1184ui_story = var_586_0.localPosition
			end

			local var_586_2 = 0.001

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2
				local var_586_4 = Vector3.New(0, 100, 0)

				var_586_0.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1184ui_story, var_586_4, var_586_3)

				local var_586_5 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_5.x, var_586_5.y, var_586_5.z)

				local var_586_6 = var_586_0.localEulerAngles

				var_586_6.z = 0
				var_586_6.x = 0
				var_586_0.localEulerAngles = var_586_6
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 then
				var_586_0.localPosition = Vector3.New(0, 100, 0)

				local var_586_7 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_7.x, var_586_7.y, var_586_7.z)

				local var_586_8 = var_586_0.localEulerAngles

				var_586_8.z = 0
				var_586_8.x = 0
				var_586_0.localEulerAngles = var_586_8
			end

			local var_586_9 = arg_583_1.actors_["1184ui_story"]
			local var_586_10 = 0

			if var_586_10 < arg_583_1.time_ and arg_583_1.time_ <= var_586_10 + arg_586_0 and arg_583_1.var_.characterEffect1184ui_story == nil then
				arg_583_1.var_.characterEffect1184ui_story = var_586_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_11 = 0.200000002980232

			if var_586_10 <= arg_583_1.time_ and arg_583_1.time_ < var_586_10 + var_586_11 then
				local var_586_12 = (arg_583_1.time_ - var_586_10) / var_586_11

				if arg_583_1.var_.characterEffect1184ui_story then
					local var_586_13 = Mathf.Lerp(0, 0.5, var_586_12)

					arg_583_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_583_1.var_.characterEffect1184ui_story.fillRatio = var_586_13
				end
			end

			if arg_583_1.time_ >= var_586_10 + var_586_11 and arg_583_1.time_ < var_586_10 + var_586_11 + arg_586_0 and arg_583_1.var_.characterEffect1184ui_story then
				local var_586_14 = 0.5

				arg_583_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_583_1.var_.characterEffect1184ui_story.fillRatio = var_586_14
			end

			local var_586_15 = 0
			local var_586_16 = 1.225

			if var_586_15 < arg_583_1.time_ and arg_583_1.time_ <= var_586_15 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, false)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_17 = arg_583_1:GetWordFromCfg(121511073)
				local var_586_18 = arg_583_1:FormatText(var_586_17.content)

				arg_583_1.text_.text = var_586_18

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_19 = 49
				local var_586_20 = utf8.len(var_586_18)
				local var_586_21 = var_586_19 <= 0 and var_586_16 or var_586_16 * (var_586_20 / var_586_19)

				if var_586_21 > 0 and var_586_16 < var_586_21 then
					arg_583_1.talkMaxDuration = var_586_21

					if var_586_21 + var_586_15 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_21 + var_586_15
					end
				end

				arg_583_1.text_.text = var_586_18
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_22 = math.max(var_586_16, arg_583_1.talkMaxDuration)

			if var_586_15 <= arg_583_1.time_ and arg_583_1.time_ < var_586_15 + var_586_22 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_15) / var_586_22

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_15 + var_586_22 and arg_583_1.time_ < var_586_15 + var_586_22 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play121511074 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 121511074
		arg_587_1.duration_ = 4.7

		local var_587_0 = {
			ja = 4.433,
			ko = 4.7,
			zh = 4.7
		}
		local var_587_1 = manager.audio:GetLocalizationFlag()

		if var_587_0[var_587_1] ~= nil then
			arg_587_1.duration_ = var_587_0[var_587_1]
		end

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play121511075(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["10042ui_story"].transform
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 then
				arg_587_1.var_.moveOldPos10042ui_story = var_590_0.localPosition
			end

			local var_590_2 = 0.001

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_2 then
				local var_590_3 = (arg_587_1.time_ - var_590_1) / var_590_2
				local var_590_4 = Vector3.New(0, -1.12, -6.2)

				var_590_0.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos10042ui_story, var_590_4, var_590_3)

				local var_590_5 = manager.ui.mainCamera.transform.position - var_590_0.position

				var_590_0.forward = Vector3.New(var_590_5.x, var_590_5.y, var_590_5.z)

				local var_590_6 = var_590_0.localEulerAngles

				var_590_6.z = 0
				var_590_6.x = 0
				var_590_0.localEulerAngles = var_590_6
			end

			if arg_587_1.time_ >= var_590_1 + var_590_2 and arg_587_1.time_ < var_590_1 + var_590_2 + arg_590_0 then
				var_590_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_590_7 = manager.ui.mainCamera.transform.position - var_590_0.position

				var_590_0.forward = Vector3.New(var_590_7.x, var_590_7.y, var_590_7.z)

				local var_590_8 = var_590_0.localEulerAngles

				var_590_8.z = 0
				var_590_8.x = 0
				var_590_0.localEulerAngles = var_590_8
			end

			local var_590_9 = arg_587_1.actors_["10042ui_story"]
			local var_590_10 = 0

			if var_590_10 < arg_587_1.time_ and arg_587_1.time_ <= var_590_10 + arg_590_0 and arg_587_1.var_.characterEffect10042ui_story == nil then
				arg_587_1.var_.characterEffect10042ui_story = var_590_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_11 = 0.200000002980232

			if var_590_10 <= arg_587_1.time_ and arg_587_1.time_ < var_590_10 + var_590_11 then
				local var_590_12 = (arg_587_1.time_ - var_590_10) / var_590_11

				if arg_587_1.var_.characterEffect10042ui_story then
					arg_587_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_587_1.time_ >= var_590_10 + var_590_11 and arg_587_1.time_ < var_590_10 + var_590_11 + arg_590_0 and arg_587_1.var_.characterEffect10042ui_story then
				arg_587_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_590_13 = 0

			if var_590_13 < arg_587_1.time_ and arg_587_1.time_ <= var_590_13 + arg_590_0 then
				arg_587_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action1_1")
			end

			local var_590_14 = 0

			if var_590_14 < arg_587_1.time_ and arg_587_1.time_ <= var_590_14 + arg_590_0 then
				arg_587_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_590_15 = 0
			local var_590_16 = 0.4

			if var_590_15 < arg_587_1.time_ and arg_587_1.time_ <= var_590_15 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_17 = arg_587_1:FormatText(StoryNameCfg[388].name)

				arg_587_1.leftNameTxt_.text = var_590_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_18 = arg_587_1:GetWordFromCfg(121511074)
				local var_590_19 = arg_587_1:FormatText(var_590_18.content)

				arg_587_1.text_.text = var_590_19

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_20 = 16
				local var_590_21 = utf8.len(var_590_19)
				local var_590_22 = var_590_20 <= 0 and var_590_16 or var_590_16 * (var_590_21 / var_590_20)

				if var_590_22 > 0 and var_590_16 < var_590_22 then
					arg_587_1.talkMaxDuration = var_590_22

					if var_590_22 + var_590_15 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_22 + var_590_15
					end
				end

				arg_587_1.text_.text = var_590_19
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511074", "story_v_out_121511.awb") ~= 0 then
					local var_590_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511074", "story_v_out_121511.awb") / 1000

					if var_590_23 + var_590_15 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_23 + var_590_15
					end

					if var_590_18.prefab_name ~= "" and arg_587_1.actors_[var_590_18.prefab_name] ~= nil then
						local var_590_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_18.prefab_name].transform, "story_v_out_121511", "121511074", "story_v_out_121511.awb")

						arg_587_1:RecordAudio("121511074", var_590_24)
						arg_587_1:RecordAudio("121511074", var_590_24)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_out_121511", "121511074", "story_v_out_121511.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_out_121511", "121511074", "story_v_out_121511.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_25 = math.max(var_590_16, arg_587_1.talkMaxDuration)

			if var_590_15 <= arg_587_1.time_ and arg_587_1.time_ < var_590_15 + var_590_25 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_15) / var_590_25

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_15 + var_590_25 and arg_587_1.time_ < var_590_15 + var_590_25 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play121511075 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 121511075
		arg_591_1.duration_ = 6.066

		local var_591_0 = {
			ja = 6.066,
			ko = 3.866,
			zh = 3.866
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
				arg_591_0:Play121511076(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["10042ui_story"].transform
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 then
				arg_591_1.var_.moveOldPos10042ui_story = var_594_0.localPosition
			end

			local var_594_2 = 0.001

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2
				local var_594_4 = Vector3.New(0, -1.12, -6.2)

				var_594_0.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos10042ui_story, var_594_4, var_594_3)

				local var_594_5 = manager.ui.mainCamera.transform.position - var_594_0.position

				var_594_0.forward = Vector3.New(var_594_5.x, var_594_5.y, var_594_5.z)

				local var_594_6 = var_594_0.localEulerAngles

				var_594_6.z = 0
				var_594_6.x = 0
				var_594_0.localEulerAngles = var_594_6
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 then
				var_594_0.localPosition = Vector3.New(0, -1.12, -6.2)

				local var_594_7 = manager.ui.mainCamera.transform.position - var_594_0.position

				var_594_0.forward = Vector3.New(var_594_7.x, var_594_7.y, var_594_7.z)

				local var_594_8 = var_594_0.localEulerAngles

				var_594_8.z = 0
				var_594_8.x = 0
				var_594_0.localEulerAngles = var_594_8
			end

			local var_594_9 = arg_591_1.actors_["10042ui_story"]
			local var_594_10 = 0

			if var_594_10 < arg_591_1.time_ and arg_591_1.time_ <= var_594_10 + arg_594_0 and arg_591_1.var_.characterEffect10042ui_story == nil then
				arg_591_1.var_.characterEffect10042ui_story = var_594_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_11 = 0.200000002980232

			if var_594_10 <= arg_591_1.time_ and arg_591_1.time_ < var_594_10 + var_594_11 then
				local var_594_12 = (arg_591_1.time_ - var_594_10) / var_594_11

				if arg_591_1.var_.characterEffect10042ui_story then
					arg_591_1.var_.characterEffect10042ui_story.fillFlat = false
				end
			end

			if arg_591_1.time_ >= var_594_10 + var_594_11 and arg_591_1.time_ < var_594_10 + var_594_11 + arg_594_0 and arg_591_1.var_.characterEffect10042ui_story then
				arg_591_1.var_.characterEffect10042ui_story.fillFlat = false
			end

			local var_594_13 = 0

			if var_594_13 < arg_591_1.time_ and arg_591_1.time_ <= var_594_13 + arg_594_0 then
				arg_591_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/story10042/story10042action/10042action2_1")
			end

			local var_594_14 = 0

			if var_594_14 < arg_591_1.time_ and arg_591_1.time_ <= var_594_14 + arg_594_0 then
				arg_591_1:PlayTimeline("10042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_594_15 = 0
			local var_594_16 = 0.3

			if var_594_15 < arg_591_1.time_ and arg_591_1.time_ <= var_594_15 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_17 = arg_591_1:FormatText(StoryNameCfg[388].name)

				arg_591_1.leftNameTxt_.text = var_594_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_18 = arg_591_1:GetWordFromCfg(121511075)
				local var_594_19 = arg_591_1:FormatText(var_594_18.content)

				arg_591_1.text_.text = var_594_19

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_20 = 12
				local var_594_21 = utf8.len(var_594_19)
				local var_594_22 = var_594_20 <= 0 and var_594_16 or var_594_16 * (var_594_21 / var_594_20)

				if var_594_22 > 0 and var_594_16 < var_594_22 then
					arg_591_1.talkMaxDuration = var_594_22

					if var_594_22 + var_594_15 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_22 + var_594_15
					end
				end

				arg_591_1.text_.text = var_594_19
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121511", "121511075", "story_v_out_121511.awb") ~= 0 then
					local var_594_23 = manager.audio:GetVoiceLength("story_v_out_121511", "121511075", "story_v_out_121511.awb") / 1000

					if var_594_23 + var_594_15 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_23 + var_594_15
					end

					if var_594_18.prefab_name ~= "" and arg_591_1.actors_[var_594_18.prefab_name] ~= nil then
						local var_594_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_18.prefab_name].transform, "story_v_out_121511", "121511075", "story_v_out_121511.awb")

						arg_591_1:RecordAudio("121511075", var_594_24)
						arg_591_1:RecordAudio("121511075", var_594_24)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_out_121511", "121511075", "story_v_out_121511.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_out_121511", "121511075", "story_v_out_121511.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_25 = math.max(var_594_16, arg_591_1.talkMaxDuration)

			if var_594_15 <= arg_591_1.time_ and arg_591_1.time_ < var_594_15 + var_594_25 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_15) / var_594_25

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_15 + var_594_25 and arg_591_1.time_ < var_594_15 + var_594_25 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J12f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0305",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_121511.awb"
	}
}
