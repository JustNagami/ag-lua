return {
	Play116292001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116292001
		arg_1_1.duration_ = 4.833

		local var_1_0 = {
			zh = 4.833,
			ja = 4.466
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
				arg_1_0:Play116292002(arg_1_1)
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

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_v0_battleground", "bgm_story_v0_battleground", "bgm_story_v0_battleground.awb")
			end

			local var_4_30 = 2
			local var_4_31 = 0.35

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_32 = arg_1_1:FormatText(StoryNameCfg[8].name)

				arg_1_1.leftNameTxt_.text = var_4_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(116292001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 14
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292001", "story_v_out_116292.awb") ~= 0 then
					local var_4_38 = manager.audio:GetVoiceLength("story_v_out_116292", "116292001", "story_v_out_116292.awb") / 1000

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end

					if var_4_33.prefab_name ~= "" and arg_1_1.actors_[var_4_33.prefab_name] ~= nil then
						local var_4_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_33.prefab_name].transform, "story_v_out_116292", "116292001", "story_v_out_116292.awb")

						arg_1_1:RecordAudio("116292001", var_4_39)
						arg_1_1:RecordAudio("116292001", var_4_39)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116292", "116292001", "story_v_out_116292.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116292", "116292001", "story_v_out_116292.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_40 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_30 <= arg_1_1.time_ and arg_1_1.time_ < var_4_30 + var_4_40 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_30) / var_4_40

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_30 + var_4_40 and arg_1_1.time_ < var_4_30 + var_4_40 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play116292002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 116292002
		arg_5_1.duration_ = 1.999999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play116292003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "1059ui_story"

			if arg_5_1.actors_[var_8_0] == nil then
				local var_8_1 = Object.Instantiate(Asset.Load("Char/" .. var_8_0), arg_5_1.stage_.transform)

				var_8_1.name = var_8_0
				var_8_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.actors_[var_8_0] = var_8_1

				local var_8_2 = var_8_1:GetComponentInChildren(typeof(CharacterEffect))

				var_8_2.enabled = true

				local var_8_3 = GameObjectTools.GetOrAddComponent(var_8_1, typeof(DynamicBoneHelper))

				if var_8_3 then
					var_8_3:EnableDynamicBone(false)
				end

				arg_5_1:ShowWeapon(var_8_2.transform, false)

				arg_5_1.var_[var_8_0 .. "Animator"] = var_8_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_5_1.var_[var_8_0 .. "Animator"].applyRootMotion = true
				arg_5_1.var_[var_8_0 .. "LipSync"] = var_8_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_8_4 = arg_5_1.actors_["1059ui_story"]
			local var_8_5 = 0

			if var_8_5 < arg_5_1.time_ and arg_5_1.time_ <= var_8_5 + arg_8_0 and arg_5_1.var_.characterEffect1059ui_story == nil then
				arg_5_1.var_.characterEffect1059ui_story = var_8_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_6 = 0.2

			if var_8_5 <= arg_5_1.time_ and arg_5_1.time_ < var_8_5 + var_8_6 then
				local var_8_7 = (arg_5_1.time_ - var_8_5) / var_8_6

				if arg_5_1.var_.characterEffect1059ui_story then
					arg_5_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_5_1.time_ >= var_8_5 + var_8_6 and arg_5_1.time_ < var_8_5 + var_8_6 + arg_8_0 and arg_5_1.var_.characterEffect1059ui_story then
				arg_5_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_8_8 = "1148ui_story"

			if arg_5_1.actors_[var_8_8] == nil then
				local var_8_9 = Object.Instantiate(Asset.Load("Char/" .. var_8_8), arg_5_1.stage_.transform)

				var_8_9.name = var_8_8
				var_8_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.actors_[var_8_8] = var_8_9

				local var_8_10 = var_8_9:GetComponentInChildren(typeof(CharacterEffect))

				var_8_10.enabled = true

				local var_8_11 = GameObjectTools.GetOrAddComponent(var_8_9, typeof(DynamicBoneHelper))

				if var_8_11 then
					var_8_11:EnableDynamicBone(false)
				end

				arg_5_1:ShowWeapon(var_8_10.transform, false)

				arg_5_1.var_[var_8_8 .. "Animator"] = var_8_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_5_1.var_[var_8_8 .. "Animator"].applyRootMotion = true
				arg_5_1.var_[var_8_8 .. "LipSync"] = var_8_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_8_12 = arg_5_1.actors_["1148ui_story"]
			local var_8_13 = 0

			if var_8_13 < arg_5_1.time_ and arg_5_1.time_ <= var_8_13 + arg_8_0 and arg_5_1.var_.characterEffect1148ui_story == nil then
				arg_5_1.var_.characterEffect1148ui_story = var_8_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_8_14 = 0.2

			if var_8_13 <= arg_5_1.time_ and arg_5_1.time_ < var_8_13 + var_8_14 then
				local var_8_15 = (arg_5_1.time_ - var_8_13) / var_8_14

				if arg_5_1.var_.characterEffect1148ui_story then
					local var_8_16 = Mathf.Lerp(0, 0.5, var_8_15)

					arg_5_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_5_1.var_.characterEffect1148ui_story.fillRatio = var_8_16
				end
			end

			if arg_5_1.time_ >= var_8_13 + var_8_14 and arg_5_1.time_ < var_8_13 + var_8_14 + arg_8_0 and arg_5_1.var_.characterEffect1148ui_story then
				local var_8_17 = 0.5

				arg_5_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_5_1.var_.characterEffect1148ui_story.fillRatio = var_8_17
			end

			local var_8_18 = arg_5_1.actors_["1059ui_story"].transform
			local var_8_19 = 0

			if var_8_19 < arg_5_1.time_ and arg_5_1.time_ <= var_8_19 + arg_8_0 then
				arg_5_1.var_.moveOldPos1059ui_story = var_8_18.localPosition
			end

			local var_8_20 = 0.001

			if var_8_19 <= arg_5_1.time_ and arg_5_1.time_ < var_8_19 + var_8_20 then
				local var_8_21 = (arg_5_1.time_ - var_8_19) / var_8_20
				local var_8_22 = Vector3.New(0, -1.05, -6)

				var_8_18.localPosition = Vector3.Lerp(arg_5_1.var_.moveOldPos1059ui_story, var_8_22, var_8_21)

				local var_8_23 = manager.ui.mainCamera.transform.position - var_8_18.position

				var_8_18.forward = Vector3.New(var_8_23.x, var_8_23.y, var_8_23.z)

				local var_8_24 = var_8_18.localEulerAngles

				var_8_24.z = 0
				var_8_24.x = 0
				var_8_18.localEulerAngles = var_8_24
			end

			if arg_5_1.time_ >= var_8_19 + var_8_20 and arg_5_1.time_ < var_8_19 + var_8_20 + arg_8_0 then
				var_8_18.localPosition = Vector3.New(0, -1.05, -6)

				local var_8_25 = manager.ui.mainCamera.transform.position - var_8_18.position

				var_8_18.forward = Vector3.New(var_8_25.x, var_8_25.y, var_8_25.z)

				local var_8_26 = var_8_18.localEulerAngles

				var_8_26.z = 0
				var_8_26.x = 0
				var_8_18.localEulerAngles = var_8_26
			end

			local var_8_27 = 0

			if var_8_27 < arg_5_1.time_ and arg_5_1.time_ <= var_8_27 + arg_8_0 then
				arg_5_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_8_28 = 0

			if var_8_28 < arg_5_1.time_ and arg_5_1.time_ <= var_8_28 + arg_8_0 then
				arg_5_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_8_29 = 0
			local var_8_30 = 0.125

			if var_8_29 < arg_5_1.time_ and arg_5_1.time_ <= var_8_29 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, true)

				local var_8_31 = arg_5_1:FormatText(StoryNameCfg[28].name)

				arg_5_1.leftNameTxt_.text = var_8_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_1.leftNameTxt_.transform)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1.leftNameTxt_.text)
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_32 = arg_5_1:GetWordFromCfg(116292002)
				local var_8_33 = arg_5_1:FormatText(var_8_32.content)

				arg_5_1.text_.text = var_8_33

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_34 = 5
				local var_8_35 = utf8.len(var_8_33)
				local var_8_36 = var_8_34 <= 0 and var_8_30 or var_8_30 * (var_8_35 / var_8_34)

				if var_8_36 > 0 and var_8_30 < var_8_36 then
					arg_5_1.talkMaxDuration = var_8_36

					if var_8_36 + var_8_29 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_36 + var_8_29
					end
				end

				arg_5_1.text_.text = var_8_33
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292002", "story_v_out_116292.awb") ~= 0 then
					local var_8_37 = manager.audio:GetVoiceLength("story_v_out_116292", "116292002", "story_v_out_116292.awb") / 1000

					if var_8_37 + var_8_29 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_37 + var_8_29
					end

					if var_8_32.prefab_name ~= "" and arg_5_1.actors_[var_8_32.prefab_name] ~= nil then
						local var_8_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_5_1.actors_[var_8_32.prefab_name].transform, "story_v_out_116292", "116292002", "story_v_out_116292.awb")

						arg_5_1:RecordAudio("116292002", var_8_38)
						arg_5_1:RecordAudio("116292002", var_8_38)
					else
						arg_5_1:AudioAction("play", "voice", "story_v_out_116292", "116292002", "story_v_out_116292.awb")
					end

					arg_5_1:RecordHistoryTalkVoice("story_v_out_116292", "116292002", "story_v_out_116292.awb")
				end

				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_39 = math.max(var_8_30, arg_5_1.talkMaxDuration)

			if var_8_29 <= arg_5_1.time_ and arg_5_1.time_ < var_8_29 + var_8_39 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_29) / var_8_39

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_29 + var_8_39 and arg_5_1.time_ < var_8_29 + var_8_39 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play116292003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 116292003
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play116292004(arg_9_1)
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

			local var_12_9 = arg_9_1.actors_["1059ui_story"].transform
			local var_12_10 = 0

			if var_12_10 < arg_9_1.time_ and arg_9_1.time_ <= var_12_10 + arg_12_0 then
				arg_9_1.var_.moveOldPos1059ui_story = var_12_9.localPosition
			end

			local var_12_11 = 0.001

			if var_12_10 <= arg_9_1.time_ and arg_9_1.time_ < var_12_10 + var_12_11 then
				local var_12_12 = (arg_9_1.time_ - var_12_10) / var_12_11
				local var_12_13 = Vector3.New(0, 100, 0)

				var_12_9.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1059ui_story, var_12_13, var_12_12)

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

			local var_12_18 = 0
			local var_12_19 = 1.375

			if var_12_18 < arg_9_1.time_ and arg_9_1.time_ <= var_12_18 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, false)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_20 = arg_9_1:GetWordFromCfg(116292003)
				local var_12_21 = arg_9_1:FormatText(var_12_20.content)

				arg_9_1.text_.text = var_12_21

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_22 = 55
				local var_12_23 = utf8.len(var_12_21)
				local var_12_24 = var_12_22 <= 0 and var_12_19 or var_12_19 * (var_12_23 / var_12_22)

				if var_12_24 > 0 and var_12_19 < var_12_24 then
					arg_9_1.talkMaxDuration = var_12_24

					if var_12_24 + var_12_18 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_24 + var_12_18
					end
				end

				arg_9_1.text_.text = var_12_21
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_25 = math.max(var_12_19, arg_9_1.talkMaxDuration)

			if var_12_18 <= arg_9_1.time_ and arg_9_1.time_ < var_12_18 + var_12_25 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_18) / var_12_25

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_18 + var_12_25 and arg_9_1.time_ < var_12_18 + var_12_25 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play116292004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 116292004
		arg_13_1.duration_ = 4.733

		local var_13_0 = {
			zh = 4.733,
			ja = 4.266
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
				arg_13_0:Play116292005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.55

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[28].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, true)
				arg_13_1.iconController_:SetSelectedState("hero")

				arg_13_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(116292004)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 22
				local var_16_6 = utf8.len(var_16_4)
				local var_16_7 = var_16_5 <= 0 and var_16_1 or var_16_1 * (var_16_6 / var_16_5)

				if var_16_7 > 0 and var_16_1 < var_16_7 then
					arg_13_1.talkMaxDuration = var_16_7

					if var_16_7 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_7 + var_16_0
					end
				end

				arg_13_1.text_.text = var_16_4
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292004", "story_v_out_116292.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292004", "story_v_out_116292.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_116292", "116292004", "story_v_out_116292.awb")

						arg_13_1:RecordAudio("116292004", var_16_9)
						arg_13_1:RecordAudio("116292004", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_116292", "116292004", "story_v_out_116292.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_116292", "116292004", "story_v_out_116292.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_10 = math.max(var_16_1, arg_13_1.talkMaxDuration)

			if var_16_0 <= arg_13_1.time_ and arg_13_1.time_ < var_16_0 + var_16_10 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_0) / var_16_10

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_0 + var_16_10 and arg_13_1.time_ < var_16_0 + var_16_10 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play116292005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 116292005
		arg_17_1.duration_ = 6.999999999999

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play116292006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1059ui_story"].transform
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1.var_.moveOldPos1059ui_story = var_20_0.localPosition
			end

			local var_20_2 = 0.001

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2
				local var_20_4 = Vector3.New(0, 100, 0)

				var_20_0.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1059ui_story, var_20_4, var_20_3)

				local var_20_5 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_5.x, var_20_5.y, var_20_5.z)

				local var_20_6 = var_20_0.localEulerAngles

				var_20_6.z = 0
				var_20_6.x = 0
				var_20_0.localEulerAngles = var_20_6
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 then
				var_20_0.localPosition = Vector3.New(0, 100, 0)

				local var_20_7 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_7.x, var_20_7.y, var_20_7.z)

				local var_20_8 = var_20_0.localEulerAngles

				var_20_8.z = 0
				var_20_8.x = 0
				var_20_0.localEulerAngles = var_20_8
			end

			local var_20_9 = 0
			local var_20_10 = 1

			if var_20_9 < arg_17_1.time_ and arg_17_1.time_ <= var_20_9 + arg_20_0 then
				local var_20_11 = "play"
				local var_20_12 = "effect"

				arg_17_1:AudioAction(var_20_11, var_20_12, "se_story_16", "se_story_16_archery", "")
			end

			local var_20_13 = 0

			if var_20_13 < arg_17_1.time_ and arg_17_1.time_ <= var_20_13 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_14 = 2

			if var_20_13 <= arg_17_1.time_ and arg_17_1.time_ < var_20_13 + var_20_14 then
				local var_20_15 = (arg_17_1.time_ - var_20_13) / var_20_14
				local var_20_16 = Color.New(1, 1, 1)

				var_20_16.a = Mathf.Lerp(1, 0, var_20_15)
				arg_17_1.mask_.color = var_20_16
			end

			if arg_17_1.time_ >= var_20_13 + var_20_14 and arg_17_1.time_ < var_20_13 + var_20_14 + arg_20_0 then
				local var_20_17 = Color.New(1, 1, 1)
				local var_20_18 = 0

				arg_17_1.mask_.enabled = false
				var_20_17.a = var_20_18
				arg_17_1.mask_.color = var_20_17
			end

			local var_20_19 = manager.ui.mainCamera.transform
			local var_20_20 = 1

			if var_20_20 < arg_17_1.time_ and arg_17_1.time_ <= var_20_20 + arg_20_0 then
				arg_17_1.var_.shakeOldPos = var_20_19.localPosition
			end

			local var_20_21 = 1

			if var_20_20 <= arg_17_1.time_ and arg_17_1.time_ < var_20_20 + var_20_21 then
				local var_20_22 = (arg_17_1.time_ - var_20_20) / 0.066
				local var_20_23, var_20_24 = math.modf(var_20_22)

				var_20_19.localPosition = Vector3.New(var_20_24 * 0.13, var_20_24 * 0.13, var_20_24 * 0.13) + arg_17_1.var_.shakeOldPos
			end

			if arg_17_1.time_ >= var_20_20 + var_20_21 and arg_17_1.time_ < var_20_20 + var_20_21 + arg_20_0 then
				var_20_19.localPosition = arg_17_1.var_.shakeOldPos
			end

			if arg_17_1.frameCnt_ <= 1 then
				arg_17_1.dialog_:SetActive(false)
			end

			local var_20_25 = 1.999999999999
			local var_20_26 = 1.65

			if var_20_25 < arg_17_1.time_ and arg_17_1.time_ <= var_20_25 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				arg_17_1.dialog_:SetActive(true)

				local var_20_27 = LeanTween.value(arg_17_1.dialog_, 0, 1, 0.3)

				var_20_27:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
					arg_17_1.dialogCg_.alpha = arg_21_0
				end))
				var_20_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_17_1.dialog_)
					var_20_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_17_1.duration_ = arg_17_1.duration_ + 0.3

				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_28 = arg_17_1:GetWordFromCfg(116292005)
				local var_20_29 = arg_17_1:FormatText(var_20_28.content)

				arg_17_1.text_.text = var_20_29

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_30 = 66
				local var_20_31 = utf8.len(var_20_29)
				local var_20_32 = var_20_30 <= 0 and var_20_26 or var_20_26 * (var_20_31 / var_20_30)

				if var_20_32 > 0 and var_20_26 < var_20_32 then
					arg_17_1.talkMaxDuration = var_20_32
					var_20_25 = var_20_25 + 0.3

					if var_20_32 + var_20_25 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_32 + var_20_25
					end
				end

				arg_17_1.text_.text = var_20_29
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_33 = var_20_25 + 0.3
			local var_20_34 = math.max(var_20_26, arg_17_1.talkMaxDuration)

			if var_20_33 <= arg_17_1.time_ and arg_17_1.time_ < var_20_33 + var_20_34 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_33) / var_20_34

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_33 + var_20_34 and arg_17_1.time_ < var_20_33 + var_20_34 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play116292006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 116292006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play116292007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.1

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

				local var_26_2 = arg_23_1:GetWordFromCfg(116292006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 4
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
	Play116292007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 116292007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play116292008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(116292007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 40
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play116292008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 116292008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play116292009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.05

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[7].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(116292008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 2
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
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_8 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_8 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_8

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_8 and arg_31_1.time_ < var_34_0 + var_34_8 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play116292009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 116292009
		arg_35_1.duration_ = 5.166

		local var_35_0 = {
			zh = 3.266,
			ja = 5.166
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
				arg_35_0:Play116292010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "1184ui_story"

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

			local var_38_4 = arg_35_1.actors_["1184ui_story"].transform
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.var_.moveOldPos1184ui_story = var_38_4.localPosition
			end

			local var_38_6 = 0.001

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6
				local var_38_8 = Vector3.New(-0.7, -0.97, -6)

				var_38_4.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1184ui_story, var_38_8, var_38_7)

				local var_38_9 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_9.x, var_38_9.y, var_38_9.z)

				local var_38_10 = var_38_4.localEulerAngles

				var_38_10.z = 0
				var_38_10.x = 0
				var_38_4.localEulerAngles = var_38_10
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 then
				var_38_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_4.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_4.localEulerAngles = var_38_12
			end

			local var_38_13 = arg_35_1.actors_["1059ui_story"].transform
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1.var_.moveOldPos1059ui_story = var_38_13.localPosition
			end

			local var_38_15 = 0.001

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15
				local var_38_17 = Vector3.New(0.7, -1.05, -6)

				var_38_13.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1059ui_story, var_38_17, var_38_16)

				local var_38_18 = manager.ui.mainCamera.transform.position - var_38_13.position

				var_38_13.forward = Vector3.New(var_38_18.x, var_38_18.y, var_38_18.z)

				local var_38_19 = var_38_13.localEulerAngles

				var_38_19.z = 0
				var_38_19.x = 0
				var_38_13.localEulerAngles = var_38_19
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 then
				var_38_13.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_38_20 = manager.ui.mainCamera.transform.position - var_38_13.position

				var_38_13.forward = Vector3.New(var_38_20.x, var_38_20.y, var_38_20.z)

				local var_38_21 = var_38_13.localEulerAngles

				var_38_21.z = 0
				var_38_21.x = 0
				var_38_13.localEulerAngles = var_38_21
			end

			local var_38_22 = arg_35_1.actors_["1059ui_story"]
			local var_38_23 = 0

			if var_38_23 < arg_35_1.time_ and arg_35_1.time_ <= var_38_23 + arg_38_0 and arg_35_1.var_.characterEffect1059ui_story == nil then
				arg_35_1.var_.characterEffect1059ui_story = var_38_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_24 = 0.034

			if var_38_23 <= arg_35_1.time_ and arg_35_1.time_ < var_38_23 + var_38_24 then
				local var_38_25 = (arg_35_1.time_ - var_38_23) / var_38_24

				if arg_35_1.var_.characterEffect1059ui_story then
					local var_38_26 = Mathf.Lerp(0, 0.5, var_38_25)

					arg_35_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1059ui_story.fillRatio = var_38_26
				end
			end

			if arg_35_1.time_ >= var_38_23 + var_38_24 and arg_35_1.time_ < var_38_23 + var_38_24 + arg_38_0 and arg_35_1.var_.characterEffect1059ui_story then
				local var_38_27 = 0.5

				arg_35_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1059ui_story.fillRatio = var_38_27
			end

			local var_38_28 = arg_35_1.actors_["1184ui_story"]
			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story == nil then
				arg_35_1.var_.characterEffect1184ui_story = var_38_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_30 = 0.2

			if var_38_29 <= arg_35_1.time_ and arg_35_1.time_ < var_38_29 + var_38_30 then
				local var_38_31 = (arg_35_1.time_ - var_38_29) / var_38_30

				if arg_35_1.var_.characterEffect1184ui_story then
					arg_35_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_29 + var_38_30 and arg_35_1.time_ < var_38_29 + var_38_30 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story then
				arg_35_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_38_32 = 0

			if var_38_32 < arg_35_1.time_ and arg_35_1.time_ <= var_38_32 + arg_38_0 then
				arg_35_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_38_33 = 0

			if var_38_33 < arg_35_1.time_ and arg_35_1.time_ <= var_38_33 + arg_38_0 then
				arg_35_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_38_34 = 0

			if var_38_34 < arg_35_1.time_ and arg_35_1.time_ <= var_38_34 + arg_38_0 then
				arg_35_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_38_35 = 0
			local var_38_36 = 0.375

			if var_38_35 < arg_35_1.time_ and arg_35_1.time_ <= var_38_35 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_37 = arg_35_1:FormatText(StoryNameCfg[6].name)

				arg_35_1.leftNameTxt_.text = var_38_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_38 = arg_35_1:GetWordFromCfg(116292009)
				local var_38_39 = arg_35_1:FormatText(var_38_38.content)

				arg_35_1.text_.text = var_38_39

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_40 = 15
				local var_38_41 = utf8.len(var_38_39)
				local var_38_42 = var_38_40 <= 0 and var_38_36 or var_38_36 * (var_38_41 / var_38_40)

				if var_38_42 > 0 and var_38_36 < var_38_42 then
					arg_35_1.talkMaxDuration = var_38_42

					if var_38_42 + var_38_35 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_42 + var_38_35
					end
				end

				arg_35_1.text_.text = var_38_39
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292009", "story_v_out_116292.awb") ~= 0 then
					local var_38_43 = manager.audio:GetVoiceLength("story_v_out_116292", "116292009", "story_v_out_116292.awb") / 1000

					if var_38_43 + var_38_35 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_43 + var_38_35
					end

					if var_38_38.prefab_name ~= "" and arg_35_1.actors_[var_38_38.prefab_name] ~= nil then
						local var_38_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_38.prefab_name].transform, "story_v_out_116292", "116292009", "story_v_out_116292.awb")

						arg_35_1:RecordAudio("116292009", var_38_44)
						arg_35_1:RecordAudio("116292009", var_38_44)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_116292", "116292009", "story_v_out_116292.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_116292", "116292009", "story_v_out_116292.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_45 = math.max(var_38_36, arg_35_1.talkMaxDuration)

			if var_38_35 <= arg_35_1.time_ and arg_35_1.time_ < var_38_35 + var_38_45 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_35) / var_38_45

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_35 + var_38_45 and arg_35_1.time_ < var_38_35 + var_38_45 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play116292010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 116292010
		arg_39_1.duration_ = 3.066

		local var_39_0 = {
			zh = 2.433333333332,
			ja = 3.066
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
				arg_39_0:Play116292011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1059ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1059ui_story == nil then
				arg_39_1.var_.characterEffect1059ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1059ui_story then
					arg_39_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1059ui_story then
				arg_39_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1184ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1184ui_story == nil then
				arg_39_1.var_.characterEffect1184ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.2

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1184ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1184ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1184ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1184ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_42_12 = 0
			local var_42_13 = 0.2

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[28].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(116292010)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 8
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292010", "story_v_out_116292.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_116292", "116292010", "story_v_out_116292.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_116292", "116292010", "story_v_out_116292.awb")

						arg_39_1:RecordAudio("116292010", var_42_21)
						arg_39_1:RecordAudio("116292010", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_116292", "116292010", "story_v_out_116292.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_116292", "116292010", "story_v_out_116292.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play116292011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 116292011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play116292012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1184ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1184ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1184ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, 100, 0)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1059ui_story"].transform
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.var_.moveOldPos1059ui_story = var_46_9.localPosition
			end

			local var_46_11 = 0.001

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11
				local var_46_13 = Vector3.New(0, 100, 0)

				var_46_9.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1059ui_story, var_46_13, var_46_12)

				local var_46_14 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_14.x, var_46_14.y, var_46_14.z)

				local var_46_15 = var_46_9.localEulerAngles

				var_46_15.z = 0
				var_46_15.x = 0
				var_46_9.localEulerAngles = var_46_15
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 then
				var_46_9.localPosition = Vector3.New(0, 100, 0)

				local var_46_16 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_16.x, var_46_16.y, var_46_16.z)

				local var_46_17 = var_46_9.localEulerAngles

				var_46_17.z = 0
				var_46_17.x = 0
				var_46_9.localEulerAngles = var_46_17
			end

			local var_46_18 = 0
			local var_46_19 = 0.65

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_20 = arg_43_1:GetWordFromCfg(116292011)
				local var_46_21 = arg_43_1:FormatText(var_46_20.content)

				arg_43_1.text_.text = var_46_21

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_22 = 26
				local var_46_23 = utf8.len(var_46_21)
				local var_46_24 = var_46_22 <= 0 and var_46_19 or var_46_19 * (var_46_23 / var_46_22)

				if var_46_24 > 0 and var_46_19 < var_46_24 then
					arg_43_1.talkMaxDuration = var_46_24

					if var_46_24 + var_46_18 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_24 + var_46_18
					end
				end

				arg_43_1.text_.text = var_46_21
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_19, arg_43_1.talkMaxDuration)

			if var_46_18 <= arg_43_1.time_ and arg_43_1.time_ < var_46_18 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_18) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_18 + var_46_25 and arg_43_1.time_ < var_46_18 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play116292012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 116292012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play116292013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.225

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(116292012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 49
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play116292013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 116292013
		arg_51_1.duration_ = 3.433

		local var_51_0 = {
			zh = 3.433,
			ja = 0.999999999999
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
				arg_51_0:Play116292014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1184ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1184ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1184ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, 100, 0)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1059ui_story"].transform
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.var_.moveOldPos1059ui_story = var_54_9.localPosition
			end

			local var_54_11 = 0.001

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11
				local var_54_13 = Vector3.New(0, 100, 0)

				var_54_9.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1059ui_story, var_54_13, var_54_12)

				local var_54_14 = manager.ui.mainCamera.transform.position - var_54_9.position

				var_54_9.forward = Vector3.New(var_54_14.x, var_54_14.y, var_54_14.z)

				local var_54_15 = var_54_9.localEulerAngles

				var_54_15.z = 0
				var_54_15.x = 0
				var_54_9.localEulerAngles = var_54_15
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 then
				var_54_9.localPosition = Vector3.New(0, 100, 0)

				local var_54_16 = manager.ui.mainCamera.transform.position - var_54_9.position

				var_54_9.forward = Vector3.New(var_54_16.x, var_54_16.y, var_54_16.z)

				local var_54_17 = var_54_9.localEulerAngles

				var_54_17.z = 0
				var_54_17.x = 0
				var_54_9.localEulerAngles = var_54_17
			end

			local var_54_18 = manager.ui.mainCamera.transform
			local var_54_19 = 0

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.var_.shakeOldPos = var_54_18.localPosition
			end

			local var_54_20 = 0.6

			if var_54_19 <= arg_51_1.time_ and arg_51_1.time_ < var_54_19 + var_54_20 then
				local var_54_21 = (arg_51_1.time_ - var_54_19) / 0.066
				local var_54_22, var_54_23 = math.modf(var_54_21)

				var_54_18.localPosition = Vector3.New(var_54_23 * 0.13, var_54_23 * 0.13, var_54_23 * 0.13) + arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.time_ >= var_54_19 + var_54_20 and arg_51_1.time_ < var_54_19 + var_54_20 + arg_54_0 then
				var_54_18.localPosition = arg_51_1.var_.shakeOldPos
			end

			local var_54_24 = 0

			if var_54_24 < arg_51_1.time_ and arg_51_1.time_ <= var_54_24 + arg_54_0 then
				arg_51_1.allBtn_.enabled = false
			end

			local var_54_25 = 0.6

			if arg_51_1.time_ >= var_54_24 + var_54_25 and arg_51_1.time_ < var_54_24 + var_54_25 + arg_54_0 then
				arg_51_1.allBtn_.enabled = true
			end

			local var_54_26 = 0
			local var_54_27 = 0.375

			if var_54_26 < arg_51_1.time_ and arg_51_1.time_ <= var_54_26 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_28 = arg_51_1:FormatText(StoryNameCfg[8].name)

				arg_51_1.leftNameTxt_.text = var_54_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_29 = arg_51_1:GetWordFromCfg(116292013)
				local var_54_30 = arg_51_1:FormatText(var_54_29.content)

				arg_51_1.text_.text = var_54_30

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_31 = 15
				local var_54_32 = utf8.len(var_54_30)
				local var_54_33 = var_54_31 <= 0 and var_54_27 or var_54_27 * (var_54_32 / var_54_31)

				if var_54_33 > 0 and var_54_27 < var_54_33 then
					arg_51_1.talkMaxDuration = var_54_33

					if var_54_33 + var_54_26 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_33 + var_54_26
					end
				end

				arg_51_1.text_.text = var_54_30
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292013", "story_v_out_116292.awb") ~= 0 then
					local var_54_34 = manager.audio:GetVoiceLength("story_v_out_116292", "116292013", "story_v_out_116292.awb") / 1000

					if var_54_34 + var_54_26 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_34 + var_54_26
					end

					if var_54_29.prefab_name ~= "" and arg_51_1.actors_[var_54_29.prefab_name] ~= nil then
						local var_54_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_29.prefab_name].transform, "story_v_out_116292", "116292013", "story_v_out_116292.awb")

						arg_51_1:RecordAudio("116292013", var_54_35)
						arg_51_1:RecordAudio("116292013", var_54_35)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_116292", "116292013", "story_v_out_116292.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_116292", "116292013", "story_v_out_116292.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_36 = math.max(var_54_27, arg_51_1.talkMaxDuration)

			if var_54_26 <= arg_51_1.time_ and arg_51_1.time_ < var_54_26 + var_54_36 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_26) / var_54_36

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_26 + var_54_36 and arg_51_1.time_ < var_54_26 + var_54_36 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play116292014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 116292014
		arg_55_1.duration_ = 1.999999999999

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play116292015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1184ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1184ui_story == nil then
				arg_55_1.var_.characterEffect1184ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1184ui_story then
					arg_55_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1184ui_story then
				arg_55_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1148ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1148ui_story == nil then
				arg_55_1.var_.characterEffect1148ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.2

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1148ui_story then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect1148ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1148ui_story.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1148ui_story then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect1148ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1148ui_story.fillRatio = var_58_9
			end

			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_58_12 = arg_55_1.actors_["1184ui_story"].transform
			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.var_.moveOldPos1184ui_story = var_58_12.localPosition

				local var_58_14 = "1184ui_story"

				arg_55_1:ShowWeapon(arg_55_1.var_[var_58_14 .. "Animator"].transform, true)
			end

			local var_58_15 = 0.001

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_13) / var_58_15
				local var_58_17 = Vector3.New(0, -0.97, -6)

				var_58_12.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1184ui_story, var_58_17, var_58_16)

				local var_58_18 = manager.ui.mainCamera.transform.position - var_58_12.position

				var_58_12.forward = Vector3.New(var_58_18.x, var_58_18.y, var_58_18.z)

				local var_58_19 = var_58_12.localEulerAngles

				var_58_19.z = 0
				var_58_19.x = 0
				var_58_12.localEulerAngles = var_58_19
			end

			if arg_55_1.time_ >= var_58_13 + var_58_15 and arg_55_1.time_ < var_58_13 + var_58_15 + arg_58_0 then
				var_58_12.localPosition = Vector3.New(0, -0.97, -6)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_12.position

				var_58_12.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_12.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_12.localEulerAngles = var_58_21
			end

			local var_58_22 = 0
			local var_58_23 = 0.175

			if var_58_22 < arg_55_1.time_ and arg_55_1.time_ <= var_58_22 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_24 = arg_55_1:FormatText(StoryNameCfg[6].name)

				arg_55_1.leftNameTxt_.text = var_58_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_25 = arg_55_1:GetWordFromCfg(116292014)
				local var_58_26 = arg_55_1:FormatText(var_58_25.content)

				arg_55_1.text_.text = var_58_26

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_27 = 7
				local var_58_28 = utf8.len(var_58_26)
				local var_58_29 = var_58_27 <= 0 and var_58_23 or var_58_23 * (var_58_28 / var_58_27)

				if var_58_29 > 0 and var_58_23 < var_58_29 then
					arg_55_1.talkMaxDuration = var_58_29

					if var_58_29 + var_58_22 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_29 + var_58_22
					end
				end

				arg_55_1.text_.text = var_58_26
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292014", "story_v_out_116292.awb") ~= 0 then
					local var_58_30 = manager.audio:GetVoiceLength("story_v_out_116292", "116292014", "story_v_out_116292.awb") / 1000

					if var_58_30 + var_58_22 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_30 + var_58_22
					end

					if var_58_25.prefab_name ~= "" and arg_55_1.actors_[var_58_25.prefab_name] ~= nil then
						local var_58_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_25.prefab_name].transform, "story_v_out_116292", "116292014", "story_v_out_116292.awb")

						arg_55_1:RecordAudio("116292014", var_58_31)
						arg_55_1:RecordAudio("116292014", var_58_31)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_116292", "116292014", "story_v_out_116292.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_116292", "116292014", "story_v_out_116292.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_32 = math.max(var_58_23, arg_55_1.talkMaxDuration)

			if var_58_22 <= arg_55_1.time_ and arg_55_1.time_ < var_58_22 + var_58_32 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_22) / var_58_32

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_22 + var_58_32 and arg_55_1.time_ < var_58_22 + var_58_32 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play116292015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 116292015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play116292016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1148ui_story"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1148ui_story = var_62_0.localPosition
			end

			local var_62_2 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2
				local var_62_4 = Vector3.New(0, 100, 0)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1148ui_story, var_62_4, var_62_3)

				local var_62_5 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_5.x, var_62_5.y, var_62_5.z)

				local var_62_6 = var_62_0.localEulerAngles

				var_62_6.z = 0
				var_62_6.x = 0
				var_62_0.localEulerAngles = var_62_6
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(0, 100, 0)

				local var_62_7 = manager.ui.mainCamera.transform.position - var_62_0.position

				var_62_0.forward = Vector3.New(var_62_7.x, var_62_7.y, var_62_7.z)

				local var_62_8 = var_62_0.localEulerAngles

				var_62_8.z = 0
				var_62_8.x = 0
				var_62_0.localEulerAngles = var_62_8
			end

			local var_62_9 = arg_59_1.actors_["1184ui_story"].transform
			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1.var_.moveOldPos1184ui_story = var_62_9.localPosition
			end

			local var_62_11 = 0.001

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_11 then
				local var_62_12 = (arg_59_1.time_ - var_62_10) / var_62_11
				local var_62_13 = Vector3.New(0, 100, 0)

				var_62_9.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1184ui_story, var_62_13, var_62_12)

				local var_62_14 = manager.ui.mainCamera.transform.position - var_62_9.position

				var_62_9.forward = Vector3.New(var_62_14.x, var_62_14.y, var_62_14.z)

				local var_62_15 = var_62_9.localEulerAngles

				var_62_15.z = 0
				var_62_15.x = 0
				var_62_9.localEulerAngles = var_62_15
			end

			if arg_59_1.time_ >= var_62_10 + var_62_11 and arg_59_1.time_ < var_62_10 + var_62_11 + arg_62_0 then
				var_62_9.localPosition = Vector3.New(0, 100, 0)

				local var_62_16 = manager.ui.mainCamera.transform.position - var_62_9.position

				var_62_9.forward = Vector3.New(var_62_16.x, var_62_16.y, var_62_16.z)

				local var_62_17 = var_62_9.localEulerAngles

				var_62_17.z = 0
				var_62_17.x = 0
				var_62_9.localEulerAngles = var_62_17
			end

			local var_62_18 = 0
			local var_62_19 = 0.85

			if var_62_18 < arg_59_1.time_ and arg_59_1.time_ <= var_62_18 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_20 = arg_59_1:GetWordFromCfg(116292015)
				local var_62_21 = arg_59_1:FormatText(var_62_20.content)

				arg_59_1.text_.text = var_62_21

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_22 = 34
				local var_62_23 = utf8.len(var_62_21)
				local var_62_24 = var_62_22 <= 0 and var_62_19 or var_62_19 * (var_62_23 / var_62_22)

				if var_62_24 > 0 and var_62_19 < var_62_24 then
					arg_59_1.talkMaxDuration = var_62_24

					if var_62_24 + var_62_18 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_24 + var_62_18
					end
				end

				arg_59_1.text_.text = var_62_21
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_25 = math.max(var_62_19, arg_59_1.talkMaxDuration)

			if var_62_18 <= arg_59_1.time_ and arg_59_1.time_ < var_62_18 + var_62_25 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_18) / var_62_25

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_18 + var_62_25 and arg_59_1.time_ < var_62_18 + var_62_25 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play116292016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116292016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play116292017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = manager.ui.mainCamera.transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.shakeOldPos = var_66_0.localPosition
			end

			local var_66_2 = 1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / 0.099
				local var_66_4, var_66_5 = math.modf(var_66_3)

				var_66_0.localPosition = Vector3.New(var_66_5 * 0.13, var_66_5 * 0.13, var_66_5 * 0.13) + arg_63_1.var_.shakeOldPos
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = arg_63_1.var_.shakeOldPos
			end

			local var_66_6 = 0
			local var_66_7 = 1

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				local var_66_8 = "play"
				local var_66_9 = "effect"

				arg_63_1:AudioAction(var_66_8, var_66_9, "se_story_16", "se_story_16_blast", "")
			end

			local var_66_10 = 0
			local var_66_11 = 0.95

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_12 = arg_63_1:GetWordFromCfg(116292016)
				local var_66_13 = arg_63_1:FormatText(var_66_12.content)

				arg_63_1.text_.text = var_66_13

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_14 = 38
				local var_66_15 = utf8.len(var_66_13)
				local var_66_16 = var_66_14 <= 0 and var_66_11 or var_66_11 * (var_66_15 / var_66_14)

				if var_66_16 > 0 and var_66_11 < var_66_16 then
					arg_63_1.talkMaxDuration = var_66_16

					if var_66_16 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_16 + var_66_10
					end
				end

				arg_63_1.text_.text = var_66_13
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_17 = math.max(var_66_11, arg_63_1.talkMaxDuration)

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_17 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_10) / var_66_17

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_10 + var_66_17 and arg_63_1.time_ < var_66_10 + var_66_17 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play116292017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 116292017
		arg_67_1.duration_ = 11.683

		local var_67_0 = {
			zh = 6.083,
			ja = 11.683
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
				arg_67_0:Play116292018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "STblack"

			if arg_67_1.bgs_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_0)
				var_70_1.name = var_70_0
				var_70_1.transform.parent = arg_67_1.stage_.transform
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_0] = var_70_1
			end

			local var_70_2 = 2

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 then
				local var_70_3 = manager.ui.mainCamera.transform.localPosition
				local var_70_4 = Vector3.New(0, 0, 10) + Vector3.New(var_70_3.x, var_70_3.y, 0)
				local var_70_5 = arg_67_1.bgs_.STblack

				var_70_5.transform.localPosition = var_70_4
				var_70_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_6 = var_70_5:GetComponent("SpriteRenderer")

				if var_70_6 and var_70_6.sprite then
					local var_70_7 = (var_70_5.transform.localPosition - var_70_3).z
					local var_70_8 = manager.ui.mainCameraCom_
					local var_70_9 = 2 * var_70_7 * Mathf.Tan(var_70_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_10 = var_70_9 * var_70_8.aspect
					local var_70_11 = var_70_6.sprite.bounds.size.x
					local var_70_12 = var_70_6.sprite.bounds.size.y
					local var_70_13 = var_70_10 / var_70_11
					local var_70_14 = var_70_9 / var_70_12
					local var_70_15 = var_70_14 < var_70_13 and var_70_13 or var_70_14

					var_70_5.transform.localScale = Vector3.New(var_70_15, var_70_15, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "STblack" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_17 = 2

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Color.New(0, 0, 0)

				var_70_19.a = Mathf.Lerp(0, 1, var_70_18)
				arg_67_1.mask_.color = var_70_19
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				local var_70_20 = Color.New(0, 0, 0)

				var_70_20.a = 1
				arg_67_1.mask_.color = var_70_20
			end

			local var_70_21 = 2

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_22 = 2

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22
				local var_70_24 = Color.New(0, 0, 0)

				var_70_24.a = Mathf.Lerp(1, 0, var_70_23)
				arg_67_1.mask_.color = var_70_24
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 then
				local var_70_25 = Color.New(0, 0, 0)
				local var_70_26 = 0

				arg_67_1.mask_.enabled = false
				var_70_25.a = var_70_26
				arg_67_1.mask_.color = var_70_25
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_27 = 3.85
			local var_70_28 = 0.15

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_29 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_29:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_30 = arg_67_1:FormatText(StoryNameCfg[8].name)

				arg_67_1.leftNameTxt_.text = var_70_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_31 = arg_67_1:GetWordFromCfg(116292017)
				local var_70_32 = arg_67_1:FormatText(var_70_31.content)

				arg_67_1.text_.text = var_70_32

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_33 = 6
				local var_70_34 = utf8.len(var_70_32)
				local var_70_35 = var_70_33 <= 0 and var_70_28 or var_70_28 * (var_70_34 / var_70_33)

				if var_70_35 > 0 and var_70_28 < var_70_35 then
					arg_67_1.talkMaxDuration = var_70_35
					var_70_27 = var_70_27 + 0.3

					if var_70_35 + var_70_27 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_35 + var_70_27
					end
				end

				arg_67_1.text_.text = var_70_32
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292017", "story_v_out_116292.awb") ~= 0 then
					local var_70_36 = manager.audio:GetVoiceLength("story_v_out_116292", "116292017", "story_v_out_116292.awb") / 1000

					if var_70_36 + var_70_27 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_36 + var_70_27
					end

					if var_70_31.prefab_name ~= "" and arg_67_1.actors_[var_70_31.prefab_name] ~= nil then
						local var_70_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_31.prefab_name].transform, "story_v_out_116292", "116292017", "story_v_out_116292.awb")

						arg_67_1:RecordAudio("116292017", var_70_37)
						arg_67_1:RecordAudio("116292017", var_70_37)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_116292", "116292017", "story_v_out_116292.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_116292", "116292017", "story_v_out_116292.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_38 = var_70_27 + 0.3
			local var_70_39 = math.max(var_70_28, arg_67_1.talkMaxDuration)

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_39 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_38) / var_70_39

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_38 + var_70_39 and arg_67_1.time_ < var_70_38 + var_70_39 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play116292018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 116292018
		arg_73_1.duration_ = 12.166

		local var_73_0 = {
			zh = 10.733,
			ja = 12.166
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
				arg_73_0:Play116292019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "SK0204"

			if arg_73_1.bgs_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(arg_73_1.paintGo_)

				var_76_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_76_0)
				var_76_1.name = var_76_0
				var_76_1.transform.parent = arg_73_1.stage_.transform
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.bgs_[var_76_0] = var_76_1
			end

			local var_76_2 = 0

			if var_76_2 < arg_73_1.time_ and arg_73_1.time_ <= var_76_2 + arg_76_0 then
				local var_76_3 = manager.ui.mainCamera.transform.localPosition
				local var_76_4 = Vector3.New(0, 0, 10) + Vector3.New(var_76_3.x, var_76_3.y, 0)
				local var_76_5 = arg_73_1.bgs_.SK0204

				var_76_5.transform.localPosition = var_76_4
				var_76_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_76_6 = var_76_5:GetComponent("SpriteRenderer")

				if var_76_6 and var_76_6.sprite then
					local var_76_7 = (var_76_5.transform.localPosition - var_76_3).z
					local var_76_8 = manager.ui.mainCameraCom_
					local var_76_9 = 2 * var_76_7 * Mathf.Tan(var_76_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_76_10 = var_76_9 * var_76_8.aspect
					local var_76_11 = var_76_6.sprite.bounds.size.x
					local var_76_12 = var_76_6.sprite.bounds.size.y
					local var_76_13 = var_76_10 / var_76_11
					local var_76_14 = var_76_9 / var_76_12
					local var_76_15 = var_76_14 < var_76_13 and var_76_13 or var_76_14

					var_76_5.transform.localScale = Vector3.New(var_76_15, var_76_15, 0)
				end

				for iter_76_0, iter_76_1 in pairs(arg_73_1.bgs_) do
					if iter_76_0 ~= "SK0204" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_16 = 0

			if var_76_16 < arg_73_1.time_ and arg_73_1.time_ <= var_76_16 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = true

				arg_73_1:SetGaussion(false)
			end

			local var_76_17 = 5

			if var_76_16 <= arg_73_1.time_ and arg_73_1.time_ < var_76_16 + var_76_17 then
				local var_76_18 = (arg_73_1.time_ - var_76_16) / var_76_17
				local var_76_19 = Color.New(0, 0, 0)

				var_76_19.a = Mathf.Lerp(1, 0, var_76_18)
				arg_73_1.mask_.color = var_76_19
			end

			if arg_73_1.time_ >= var_76_16 + var_76_17 and arg_73_1.time_ < var_76_16 + var_76_17 + arg_76_0 then
				local var_76_20 = Color.New(0, 0, 0)
				local var_76_21 = 0

				arg_73_1.mask_.enabled = false
				var_76_20.a = var_76_21
				arg_73_1.mask_.color = var_76_20
			end

			local var_76_22 = arg_73_1.bgs_.SK0204.transform
			local var_76_23 = 0

			if var_76_23 < arg_73_1.time_ and arg_73_1.time_ <= var_76_23 + arg_76_0 then
				arg_73_1.var_.moveOldPosSK0204 = var_76_22.localPosition
			end

			local var_76_24 = 0.1

			if var_76_23 <= arg_73_1.time_ and arg_73_1.time_ < var_76_23 + var_76_24 then
				local var_76_25 = (arg_73_1.time_ - var_76_23) / var_76_24
				local var_76_26 = Vector3.New(-4.08, 3.87, 0.99)

				var_76_22.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPosSK0204, var_76_26, var_76_25)
			end

			if arg_73_1.time_ >= var_76_23 + var_76_24 and arg_73_1.time_ < var_76_23 + var_76_24 + arg_76_0 then
				var_76_22.localPosition = Vector3.New(-4.08, 3.87, 0.99)
			end

			local var_76_27 = arg_73_1.bgs_.SK0204.transform
			local var_76_28 = 0.1

			if var_76_28 < arg_73_1.time_ and arg_73_1.time_ <= var_76_28 + arg_76_0 then
				arg_73_1.var_.moveOldPosSK0204 = var_76_27.localPosition
			end

			local var_76_29 = 4.9

			if var_76_28 <= arg_73_1.time_ and arg_73_1.time_ < var_76_28 + var_76_29 then
				local var_76_30 = (arg_73_1.time_ - var_76_28) / var_76_29
				local var_76_31 = Vector3.New(0, 1, 10)

				var_76_27.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPosSK0204, var_76_31, var_76_30)
			end

			if arg_73_1.time_ >= var_76_28 + var_76_29 and arg_73_1.time_ < var_76_28 + var_76_29 + arg_76_0 then
				var_76_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_76_32 = 0

			if var_76_32 < arg_73_1.time_ and arg_73_1.time_ <= var_76_32 + arg_76_0 then
				arg_73_1.allBtn_.enabled = false
			end

			local var_76_33 = 5

			if arg_73_1.time_ >= var_76_32 + var_76_33 and arg_73_1.time_ < var_76_32 + var_76_33 + arg_76_0 then
				arg_73_1.allBtn_.enabled = true
			end

			if arg_73_1.frameCnt_ <= 1 then
				arg_73_1.dialog_:SetActive(false)
			end

			local var_76_34 = 5
			local var_76_35 = 0.45

			if var_76_34 < arg_73_1.time_ and arg_73_1.time_ <= var_76_34 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_36 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_36:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_37 = arg_73_1:FormatText(StoryNameCfg[327].name)

				arg_73_1.leftNameTxt_.text = var_76_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_38 = arg_73_1:GetWordFromCfg(116292018)
				local var_76_39 = arg_73_1:FormatText(var_76_38.content)

				arg_73_1.text_.text = var_76_39

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_40 = 18
				local var_76_41 = utf8.len(var_76_39)
				local var_76_42 = var_76_40 <= 0 and var_76_35 or var_76_35 * (var_76_41 / var_76_40)

				if var_76_42 > 0 and var_76_35 < var_76_42 then
					arg_73_1.talkMaxDuration = var_76_42
					var_76_34 = var_76_34 + 0.3

					if var_76_42 + var_76_34 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_42 + var_76_34
					end
				end

				arg_73_1.text_.text = var_76_39
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292018", "story_v_out_116292.awb") ~= 0 then
					local var_76_43 = manager.audio:GetVoiceLength("story_v_out_116292", "116292018", "story_v_out_116292.awb") / 1000

					if var_76_43 + var_76_34 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_43 + var_76_34
					end

					if var_76_38.prefab_name ~= "" and arg_73_1.actors_[var_76_38.prefab_name] ~= nil then
						local var_76_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_38.prefab_name].transform, "story_v_out_116292", "116292018", "story_v_out_116292.awb")

						arg_73_1:RecordAudio("116292018", var_76_44)
						arg_73_1:RecordAudio("116292018", var_76_44)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_116292", "116292018", "story_v_out_116292.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_116292", "116292018", "story_v_out_116292.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_45 = var_76_34 + 0.3
			local var_76_46 = math.max(var_76_35, arg_73_1.talkMaxDuration)

			if var_76_45 <= arg_73_1.time_ and arg_73_1.time_ < var_76_45 + var_76_46 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_45) / var_76_46

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_45 + var_76_46 and arg_73_1.time_ < var_76_45 + var_76_46 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play116292019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 116292019
		arg_79_1.duration_ = 2.4

		local var_79_0 = {
			zh = 1.9,
			ja = 2.4
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
				arg_79_0:Play116292020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.175

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[8].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(116292019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 7
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292019", "story_v_out_116292.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292019", "story_v_out_116292.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_116292", "116292019", "story_v_out_116292.awb")

						arg_79_1:RecordAudio("116292019", var_82_9)
						arg_79_1:RecordAudio("116292019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_116292", "116292019", "story_v_out_116292.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_116292", "116292019", "story_v_out_116292.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play116292020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 116292020
		arg_83_1.duration_ = 5.8

		local var_83_0 = {
			zh = 5.8,
			ja = 4.9
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
				arg_83_0:Play116292021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.85

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[332].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(116292020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 34
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292020", "story_v_out_116292.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292020", "story_v_out_116292.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_116292", "116292020", "story_v_out_116292.awb")

						arg_83_1:RecordAudio("116292020", var_86_9)
						arg_83_1:RecordAudio("116292020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_116292", "116292020", "story_v_out_116292.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_116292", "116292020", "story_v_out_116292.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play116292021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 116292021
		arg_87_1.duration_ = 10.633

		local var_87_0 = {
			zh = 8.166,
			ja = 10.633
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
				arg_87_0:Play116292022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.075

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[327].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(116292021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 43
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292021", "story_v_out_116292.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292021", "story_v_out_116292.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_116292", "116292021", "story_v_out_116292.awb")

						arg_87_1:RecordAudio("116292021", var_90_9)
						arg_87_1:RecordAudio("116292021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_116292", "116292021", "story_v_out_116292.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_116292", "116292021", "story_v_out_116292.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play116292022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116292022
		arg_91_1.duration_ = 7.3

		local var_91_0 = {
			zh = 7.3,
			ja = 3.6
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
				arg_91_0:Play116292023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.525

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[332].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(116292022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292022", "story_v_out_116292.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292022", "story_v_out_116292.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_116292", "116292022", "story_v_out_116292.awb")

						arg_91_1:RecordAudio("116292022", var_94_9)
						arg_91_1:RecordAudio("116292022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_116292", "116292022", "story_v_out_116292.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_116292", "116292022", "story_v_out_116292.awb")
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
	Play116292023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116292023
		arg_95_1.duration_ = 12.666

		local var_95_0 = {
			zh = 12.666,
			ja = 6.766
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
				arg_95_0:Play116292024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.15

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[327].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(116292023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 46
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292023", "story_v_out_116292.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292023", "story_v_out_116292.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_116292", "116292023", "story_v_out_116292.awb")

						arg_95_1:RecordAudio("116292023", var_98_9)
						arg_95_1:RecordAudio("116292023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_116292", "116292023", "story_v_out_116292.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_116292", "116292023", "story_v_out_116292.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play116292024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 116292024
		arg_99_1.duration_ = 5.633

		local var_99_0 = {
			zh = 5.6,
			ja = 5.633
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
				arg_99_0:Play116292025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.7

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[28].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(116292024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 28
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292024", "story_v_out_116292.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292024", "story_v_out_116292.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_116292", "116292024", "story_v_out_116292.awb")

						arg_99_1:RecordAudio("116292024", var_102_9)
						arg_99_1:RecordAudio("116292024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_116292", "116292024", "story_v_out_116292.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_116292", "116292024", "story_v_out_116292.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play116292025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 116292025
		arg_103_1.duration_ = 3.7

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play116292026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.175

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[327].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(116292025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 7
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292025", "story_v_out_116292.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292025", "story_v_out_116292.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_116292", "116292025", "story_v_out_116292.awb")

						arg_103_1:RecordAudio("116292025", var_106_9)
						arg_103_1:RecordAudio("116292025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_116292", "116292025", "story_v_out_116292.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_116292", "116292025", "story_v_out_116292.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play116292026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116292026
		arg_107_1.duration_ = 9.763999999999

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play116292027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 1

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				local var_110_1 = manager.ui.mainCamera.transform.localPosition
				local var_110_2 = Vector3.New(0, 0, 10) + Vector3.New(var_110_1.x, var_110_1.y, 0)
				local var_110_3 = arg_107_1.bgs_.STblack

				var_110_3.transform.localPosition = var_110_2
				var_110_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_110_4 = var_110_3:GetComponent("SpriteRenderer")

				if var_110_4 and var_110_4.sprite then
					local var_110_5 = (var_110_3.transform.localPosition - var_110_1).z
					local var_110_6 = manager.ui.mainCameraCom_
					local var_110_7 = 2 * var_110_5 * Mathf.Tan(var_110_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_110_8 = var_110_7 * var_110_6.aspect
					local var_110_9 = var_110_4.sprite.bounds.size.x
					local var_110_10 = var_110_4.sprite.bounds.size.y
					local var_110_11 = var_110_8 / var_110_9
					local var_110_12 = var_110_7 / var_110_10
					local var_110_13 = var_110_12 < var_110_11 and var_110_11 or var_110_12

					var_110_3.transform.localScale = Vector3.New(var_110_13, var_110_13, 0)
				end

				for iter_110_0, iter_110_1 in pairs(arg_107_1.bgs_) do
					if iter_110_0 ~= "STblack" then
						iter_110_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = false

				arg_107_1:SetGaussion(false)
			end

			local var_110_15 = 1

			if var_110_14 <= arg_107_1.time_ and arg_107_1.time_ < var_110_14 + var_110_15 then
				local var_110_16 = (arg_107_1.time_ - var_110_14) / var_110_15
				local var_110_17 = Color.New(0, 0, 0)

				var_110_17.a = Mathf.Lerp(0, 1, var_110_16)
				arg_107_1.mask_.color = var_110_17
			end

			if arg_107_1.time_ >= var_110_14 + var_110_15 and arg_107_1.time_ < var_110_14 + var_110_15 + arg_110_0 then
				local var_110_18 = Color.New(0, 0, 0)

				var_110_18.a = 1
				arg_107_1.mask_.color = var_110_18
			end

			local var_110_19 = 1

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = false

				arg_107_1:SetGaussion(false)
			end

			local var_110_20 = 1.5

			if var_110_19 <= arg_107_1.time_ and arg_107_1.time_ < var_110_19 + var_110_20 then
				local var_110_21 = (arg_107_1.time_ - var_110_19) / var_110_20
				local var_110_22 = Color.New(0, 0, 0)

				var_110_22.a = Mathf.Lerp(1, 0, var_110_21)
				arg_107_1.mask_.color = var_110_22
			end

			if arg_107_1.time_ >= var_110_19 + var_110_20 and arg_107_1.time_ < var_110_19 + var_110_20 + arg_110_0 then
				local var_110_23 = Color.New(0, 0, 0)
				local var_110_24 = 0

				arg_107_1.mask_.enabled = false
				var_110_23.a = var_110_24
				arg_107_1.mask_.color = var_110_23
			end

			local var_110_25 = 2.5
			local var_110_26 = 7.264
			local var_110_27 = manager.audio:GetVoiceLength("story_v_out_116292", "116292026", "story_v_out_116292.awb") / 1000

			if var_110_27 > 0 and var_110_26 < var_110_27 and var_110_27 + var_110_25 > arg_107_1.duration_ then
				local var_110_28 = var_110_27

				arg_107_1.duration_ = var_110_27 + var_110_25
			end

			if var_110_25 < arg_107_1.time_ and arg_107_1.time_ <= var_110_25 + arg_110_0 then
				local var_110_29 = "play"
				local var_110_30 = "voice"

				arg_107_1:AudioAction(var_110_29, var_110_30, "story_v_out_116292", "116292026", "story_v_out_116292.awb")
			end

			local var_110_31 = 2.5

			if var_110_31 < arg_107_1.time_ and arg_107_1.time_ <= var_110_31 + arg_110_0 then
				arg_107_1.var_.oldValueTypewriter = arg_107_1.fswtw_.percent

				arg_107_1:ShowNextGo(false)
			end

			local var_110_32 = 42
			local var_110_33 = 2.8
			local var_110_34 = arg_107_1:GetWordFromCfg(116292026)
			local var_110_35 = arg_107_1:FormatText(var_110_34.content)
			local var_110_36, var_110_37 = arg_107_1:GetPercentByPara(var_110_35, 1)

			if var_110_31 < arg_107_1.time_ and arg_107_1.time_ <= var_110_31 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				local var_110_38 = var_110_32 <= 0 and var_110_33 or var_110_33 * ((var_110_37 - arg_107_1.typewritterCharCountI18N) / var_110_32)

				if var_110_38 > 0 and var_110_33 < var_110_38 then
					arg_107_1.talkMaxDuration = var_110_38

					if var_110_38 + var_110_31 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_31
					end
				end
			end

			local var_110_39 = 2.8
			local var_110_40 = math.max(var_110_39, arg_107_1.talkMaxDuration)

			if var_110_31 <= arg_107_1.time_ and arg_107_1.time_ < var_110_31 + var_110_40 then
				local var_110_41 = (arg_107_1.time_ - var_110_31) / var_110_40

				arg_107_1.fswtw_.percent = Mathf.Lerp(arg_107_1.var_.oldValueTypewriter, var_110_36, var_110_41)
				arg_107_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_107_1.fswtw_:SetDirty()
			end

			if arg_107_1.time_ >= var_110_31 + var_110_40 and arg_107_1.time_ < var_110_31 + var_110_40 + arg_110_0 then
				arg_107_1.fswtw_.percent = var_110_36

				arg_107_1.fswtw_:SetDirty()
				arg_107_1:ShowNextGo(true)

				arg_107_1.typewritterCharCountI18N = var_110_37
			end

			local var_110_42 = 1

			if var_110_42 < arg_107_1.time_ and arg_107_1.time_ <= var_110_42 + arg_110_0 then
				arg_107_1.fswbg_:SetActive(true)
				arg_107_1.dialog_:SetActive(false)

				arg_107_1.fswtw_.percent = 0

				local var_110_43 = arg_107_1:GetWordFromCfg(116292026)
				local var_110_44 = arg_107_1:FormatText(var_110_43.content)

				arg_107_1.fswt_.text = var_110_44

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.fswt_)

				arg_107_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_107_1.fswtw_:SetDirty()

				arg_107_1.typewritterCharCountI18N = 0

				arg_107_1:ShowNextGo(false)
			end

			local var_110_45 = 0

			if var_110_45 < arg_107_1.time_ and arg_107_1.time_ <= var_110_45 + arg_110_0 then
				arg_107_1.allBtn_.enabled = false
			end

			local var_110_46 = 5.3

			if arg_107_1.time_ >= var_110_45 + var_110_46 and arg_107_1.time_ < var_110_45 + var_110_46 + arg_110_0 then
				arg_107_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116292027
		arg_111_1.duration_ = 0.999999999999

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play116292028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.var_.oldValueTypewriter = arg_111_1.fswtw_.percent

				arg_111_1:ShowNextGo(false)
			end

			local var_114_1 = 0
			local var_114_2 = -0.533333333333333
			local var_114_3 = arg_111_1:GetWordFromCfg(116292026)
			local var_114_4 = arg_111_1:FormatText(var_114_3.content)
			local var_114_5, var_114_6 = arg_111_1:GetPercentByPara(var_114_4, 1)

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				local var_114_7 = var_114_1 <= 0 and var_114_2 or var_114_2 * ((var_114_6 - arg_111_1.typewritterCharCountI18N) / var_114_1)

				if var_114_7 > 0 and var_114_2 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end
			end

			local var_114_8 = -0.533333333333333
			local var_114_9 = math.max(var_114_8, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_0) / var_114_9

				arg_111_1.fswtw_.percent = Mathf.Lerp(arg_111_1.var_.oldValueTypewriter, var_114_5, var_114_10)
				arg_111_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_111_1.fswtw_:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_9 and arg_111_1.time_ < var_114_0 + var_114_9 + arg_114_0 then
				arg_111_1.fswtw_.percent = var_114_5

				arg_111_1.fswtw_:SetDirty()
				arg_111_1:ShowNextGo(true)

				arg_111_1.typewritterCharCountI18N = var_114_6
			end

			local var_114_11 = 0

			if var_114_11 < arg_111_1.time_ and arg_111_1.time_ <= var_114_11 + arg_114_0 then
				arg_111_1.var_.oldValueTypewriter = arg_111_1.fswtw_.percent

				arg_111_1:ShowNextGo(false)
			end

			local var_114_12 = 57
			local var_114_13 = 1
			local var_114_14 = arg_111_1:GetWordFromCfg(116292026)
			local var_114_15 = arg_111_1:FormatText(var_114_14.content)
			local var_114_16, var_114_17 = arg_111_1:GetPercentByPara(var_114_15, 2)

			if var_114_11 < arg_111_1.time_ and arg_111_1.time_ <= var_114_11 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0

				local var_114_18 = var_114_12 <= 0 and var_114_13 or var_114_13 * ((var_114_17 - arg_111_1.typewritterCharCountI18N) / var_114_12)

				if var_114_18 > 0 and var_114_13 < var_114_18 then
					arg_111_1.talkMaxDuration = var_114_18

					if var_114_18 + var_114_11 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_11
					end
				end
			end

			local var_114_19 = 1
			local var_114_20 = math.max(var_114_19, arg_111_1.talkMaxDuration)

			if var_114_11 <= arg_111_1.time_ and arg_111_1.time_ < var_114_11 + var_114_20 then
				local var_114_21 = (arg_111_1.time_ - var_114_11) / var_114_20

				arg_111_1.fswtw_.percent = Mathf.Lerp(arg_111_1.var_.oldValueTypewriter, var_114_16, var_114_21)
				arg_111_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_111_1.fswtw_:SetDirty()
			end

			if arg_111_1.time_ >= var_114_11 + var_114_20 and arg_111_1.time_ < var_114_11 + var_114_20 + arg_114_0 then
				arg_111_1.fswtw_.percent = var_114_16

				arg_111_1.fswtw_:SetDirty()
				arg_111_1:ShowNextGo(true)

				arg_111_1.typewritterCharCountI18N = var_114_17
			end

			local var_114_22 = 0
			local var_114_23 = 0.711
			local var_114_24 = manager.audio:GetVoiceLength("story_v_out_116292", "116292027", "story_v_out_116292.awb") / 1000

			if var_114_24 > 0 and var_114_23 < var_114_24 and var_114_24 + var_114_22 > arg_111_1.duration_ then
				local var_114_25 = var_114_24

				arg_111_1.duration_ = var_114_24 + var_114_22
			end

			if var_114_22 < arg_111_1.time_ and arg_111_1.time_ <= var_114_22 + arg_114_0 then
				local var_114_26 = "play"
				local var_114_27 = "voice"

				arg_111_1:AudioAction(var_114_26, var_114_27, "story_v_out_116292", "116292027", "story_v_out_116292.awb")
			end

			local var_114_28 = 0

			if var_114_28 < arg_111_1.time_ and arg_111_1.time_ <= var_114_28 + arg_114_0 then
				arg_111_1.allBtn_.enabled = false
			end

			local var_114_29 = 1

			if arg_111_1.time_ >= var_114_28 + var_114_29 and arg_111_1.time_ < var_114_28 + var_114_29 + arg_114_0 then
				arg_111_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116292028
		arg_115_1.duration_ = 7.416999999999

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play116292029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.var_.oldValueTypewriter = arg_115_1.fswtw_.percent

				arg_115_1:ShowNextGo(false)
			end

			local var_118_1 = 46
			local var_118_2 = 3.06666666666667
			local var_118_3 = arg_115_1:GetWordFromCfg(116292026)
			local var_118_4 = arg_115_1:FormatText(var_118_3.content)
			local var_118_5, var_118_6 = arg_115_1:GetPercentByPara(var_118_4, 3)

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0

				local var_118_7 = var_118_1 <= 0 and var_118_2 or var_118_2 * ((var_118_6 - arg_115_1.typewritterCharCountI18N) / var_118_1)

				if var_118_7 > 0 and var_118_2 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end
			end

			local var_118_8 = 3.06666666666667
			local var_118_9 = math.max(var_118_8, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_0) / var_118_9

				arg_115_1.fswtw_.percent = Mathf.Lerp(arg_115_1.var_.oldValueTypewriter, var_118_5, var_118_10)
				arg_115_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_115_1.fswtw_:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_9 and arg_115_1.time_ < var_118_0 + var_118_9 + arg_118_0 then
				arg_115_1.fswtw_.percent = var_118_5

				arg_115_1.fswtw_:SetDirty()
				arg_115_1:ShowNextGo(true)

				arg_115_1.typewritterCharCountI18N = var_118_6
			end

			local var_118_11 = 0
			local var_118_12 = 7.417
			local var_118_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292028", "story_v_out_116292.awb") / 1000

			if var_118_13 > 0 and var_118_12 < var_118_13 and var_118_13 + var_118_11 > arg_115_1.duration_ then
				local var_118_14 = var_118_13

				arg_115_1.duration_ = var_118_13 + var_118_11
			end

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				local var_118_15 = "play"
				local var_118_16 = "voice"

				arg_115_1:AudioAction(var_118_15, var_118_16, "story_v_out_116292", "116292028", "story_v_out_116292.awb")
			end

			local var_118_17 = 0

			if var_118_17 < arg_115_1.time_ and arg_115_1.time_ <= var_118_17 + arg_118_0 then
				arg_115_1.allBtn_.enabled = false
			end

			local var_118_18 = 3.06666666666667

			if arg_115_1.time_ >= var_118_17 + var_118_18 and arg_115_1.time_ < var_118_17 + var_118_18 + arg_118_0 then
				arg_115_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116292029
		arg_119_1.duration_ = 7.801999999999

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play116292030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.var_.oldValueTypewriter = arg_119_1.fswtw_.percent

				arg_119_1:ShowNextGo(false)
			end

			local var_122_1 = 0
			local var_122_2 = -0.866666666666667
			local var_122_3 = arg_119_1:GetWordFromCfg(116292026)
			local var_122_4 = arg_119_1:FormatText(var_122_3.content)
			local var_122_5, var_122_6 = arg_119_1:GetPercentByPara(var_122_4, 3)

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				local var_122_7 = var_122_1 <= 0 and var_122_2 or var_122_2 * ((var_122_6 - arg_119_1.typewritterCharCountI18N) / var_122_1)

				if var_122_7 > 0 and var_122_2 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end
			end

			local var_122_8 = -0.866666666666667
			local var_122_9 = math.max(var_122_8, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_0) / var_122_9

				arg_119_1.fswtw_.percent = Mathf.Lerp(arg_119_1.var_.oldValueTypewriter, var_122_5, var_122_10)
				arg_119_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_119_1.fswtw_:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_9 and arg_119_1.time_ < var_122_0 + var_122_9 + arg_122_0 then
				arg_119_1.fswtw_.percent = var_122_5

				arg_119_1.fswtw_:SetDirty()
				arg_119_1:ShowNextGo(true)

				arg_119_1.typewritterCharCountI18N = var_122_6
			end

			local var_122_11 = 0

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.var_.oldValueTypewriter = arg_119_1.fswtw_.percent

				arg_119_1:ShowNextGo(false)
			end

			local var_122_12 = 45
			local var_122_13 = 3
			local var_122_14 = arg_119_1:GetWordFromCfg(116292026)
			local var_122_15 = arg_119_1:FormatText(var_122_14.content)
			local var_122_16, var_122_17 = arg_119_1:GetPercentByPara(var_122_15, 4)

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				local var_122_18 = var_122_12 <= 0 and var_122_13 or var_122_13 * ((var_122_17 - arg_119_1.typewritterCharCountI18N) / var_122_12)

				if var_122_18 > 0 and var_122_13 < var_122_18 then
					arg_119_1.talkMaxDuration = var_122_18

					if var_122_18 + var_122_11 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_11
					end
				end
			end

			local var_122_19 = 3
			local var_122_20 = math.max(var_122_19, arg_119_1.talkMaxDuration)

			if var_122_11 <= arg_119_1.time_ and arg_119_1.time_ < var_122_11 + var_122_20 then
				local var_122_21 = (arg_119_1.time_ - var_122_11) / var_122_20

				arg_119_1.fswtw_.percent = Mathf.Lerp(arg_119_1.var_.oldValueTypewriter, var_122_16, var_122_21)
				arg_119_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_119_1.fswtw_:SetDirty()
			end

			if arg_119_1.time_ >= var_122_11 + var_122_20 and arg_119_1.time_ < var_122_11 + var_122_20 + arg_122_0 then
				arg_119_1.fswtw_.percent = var_122_16

				arg_119_1.fswtw_:SetDirty()
				arg_119_1:ShowNextGo(true)

				arg_119_1.typewritterCharCountI18N = var_122_17
			end

			local var_122_22 = 0
			local var_122_23 = 7.802
			local var_122_24 = manager.audio:GetVoiceLength("story_v_out_116292", "116292029", "story_v_out_116292.awb") / 1000

			if var_122_24 > 0 and var_122_23 < var_122_24 and var_122_24 + var_122_22 > arg_119_1.duration_ then
				local var_122_25 = var_122_24

				arg_119_1.duration_ = var_122_24 + var_122_22
			end

			if var_122_22 < arg_119_1.time_ and arg_119_1.time_ <= var_122_22 + arg_122_0 then
				local var_122_26 = "play"
				local var_122_27 = "voice"

				arg_119_1:AudioAction(var_122_26, var_122_27, "story_v_out_116292", "116292029", "story_v_out_116292.awb")
			end

			local var_122_28 = 0

			if var_122_28 < arg_119_1.time_ and arg_119_1.time_ <= var_122_28 + arg_122_0 then
				arg_119_1.allBtn_.enabled = false
			end

			local var_122_29 = 3.06666666666667

			if arg_119_1.time_ >= var_122_28 + var_122_29 and arg_119_1.time_ < var_122_28 + var_122_29 + arg_122_0 then
				arg_119_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116292030
		arg_123_1.duration_ = 3.728999999999

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play116292031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.var_.oldValueTypewriter = arg_123_1.fswtw_.percent

				arg_123_1:ShowNextGo(false)
			end

			local var_126_1 = 0
			local var_126_2 = -2.6
			local var_126_3 = arg_123_1:GetWordFromCfg(116292026)
			local var_126_4 = arg_123_1:FormatText(var_126_3.content)
			local var_126_5, var_126_6 = arg_123_1:GetPercentByPara(var_126_4, 3)

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				local var_126_7 = var_126_1 <= 0 and var_126_2 or var_126_2 * ((var_126_6 - arg_123_1.typewritterCharCountI18N) / var_126_1)

				if var_126_7 > 0 and var_126_2 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end
			end

			local var_126_8 = -2.6
			local var_126_9 = math.max(var_126_8, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_0) / var_126_9

				arg_123_1.fswtw_.percent = Mathf.Lerp(arg_123_1.var_.oldValueTypewriter, var_126_5, var_126_10)
				arg_123_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_123_1.fswtw_:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_9 and arg_123_1.time_ < var_126_0 + var_126_9 + arg_126_0 then
				arg_123_1.fswtw_.percent = var_126_5

				arg_123_1.fswtw_:SetDirty()
				arg_123_1:ShowNextGo(true)

				arg_123_1.typewritterCharCountI18N = var_126_6
			end

			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1.var_.oldValueTypewriter = arg_123_1.fswtw_.percent

				arg_123_1:ShowNextGo(false)
			end

			local var_126_12 = 29
			local var_126_13 = 1.93333333333333
			local var_126_14 = arg_123_1:GetWordFromCfg(116292026)
			local var_126_15 = arg_123_1:FormatText(var_126_14.content)
			local var_126_16, var_126_17 = arg_123_1:GetPercentByPara(var_126_15, 5)

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				local var_126_18 = var_126_12 <= 0 and var_126_13 or var_126_13 * ((var_126_17 - arg_123_1.typewritterCharCountI18N) / var_126_12)

				if var_126_18 > 0 and var_126_13 < var_126_18 then
					arg_123_1.talkMaxDuration = var_126_18

					if var_126_18 + var_126_11 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_18 + var_126_11
					end
				end
			end

			local var_126_19 = 1.93333333333333
			local var_126_20 = math.max(var_126_19, arg_123_1.talkMaxDuration)

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_20 then
				local var_126_21 = (arg_123_1.time_ - var_126_11) / var_126_20

				arg_123_1.fswtw_.percent = Mathf.Lerp(arg_123_1.var_.oldValueTypewriter, var_126_16, var_126_21)
				arg_123_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_123_1.fswtw_:SetDirty()
			end

			if arg_123_1.time_ >= var_126_11 + var_126_20 and arg_123_1.time_ < var_126_11 + var_126_20 + arg_126_0 then
				arg_123_1.fswtw_.percent = var_126_16

				arg_123_1.fswtw_:SetDirty()
				arg_123_1:ShowNextGo(true)

				arg_123_1.typewritterCharCountI18N = var_126_17
			end

			local var_126_22 = 0
			local var_126_23 = 3.729
			local var_126_24 = manager.audio:GetVoiceLength("story_v_out_116292", "116292030", "story_v_out_116292.awb") / 1000

			if var_126_24 > 0 and var_126_23 < var_126_24 and var_126_24 + var_126_22 > arg_123_1.duration_ then
				local var_126_25 = var_126_24

				arg_123_1.duration_ = var_126_24 + var_126_22
			end

			if var_126_22 < arg_123_1.time_ and arg_123_1.time_ <= var_126_22 + arg_126_0 then
				local var_126_26 = "play"
				local var_126_27 = "voice"

				arg_123_1:AudioAction(var_126_26, var_126_27, "story_v_out_116292", "116292030", "story_v_out_116292.awb")
			end

			local var_126_28 = 0

			if var_126_28 < arg_123_1.time_ and arg_123_1.time_ <= var_126_28 + arg_126_0 then
				arg_123_1.allBtn_.enabled = false
			end

			local var_126_29 = 1.93333333333333

			if arg_123_1.time_ >= var_126_28 + var_126_29 and arg_123_1.time_ < var_126_28 + var_126_29 + arg_126_0 then
				arg_123_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 116292031
		arg_127_1.duration_ = 2.585999999999

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play116292032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.var_.oldValueTypewriter = arg_127_1.fswtw_.percent

				arg_127_1:ShowNextGo(false)
			end

			local var_130_1 = 0
			local var_130_2 = -3.93333333333333
			local var_130_3 = arg_127_1:GetWordFromCfg(116292026)
			local var_130_4 = arg_127_1:FormatText(var_130_3.content)
			local var_130_5, var_130_6 = arg_127_1:GetPercentByPara(var_130_4, 3)

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0

				local var_130_7 = var_130_1 <= 0 and var_130_2 or var_130_2 * ((var_130_6 - arg_127_1.typewritterCharCountI18N) / var_130_1)

				if var_130_7 > 0 and var_130_2 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end
			end

			local var_130_8 = -3.93333333333333
			local var_130_9 = math.max(var_130_8, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_0) / var_130_9

				arg_127_1.fswtw_.percent = Mathf.Lerp(arg_127_1.var_.oldValueTypewriter, var_130_5, var_130_10)
				arg_127_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_127_1.fswtw_:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_9 and arg_127_1.time_ < var_130_0 + var_130_9 + arg_130_0 then
				arg_127_1.fswtw_.percent = var_130_5

				arg_127_1.fswtw_:SetDirty()
				arg_127_1:ShowNextGo(true)

				arg_127_1.typewritterCharCountI18N = var_130_6
			end

			local var_130_11 = 0

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.var_.oldValueTypewriter = arg_127_1.fswtw_.percent

				arg_127_1:ShowNextGo(false)
			end

			local var_130_12 = 15
			local var_130_13 = 1
			local var_130_14 = arg_127_1:GetWordFromCfg(116292026)
			local var_130_15 = arg_127_1:FormatText(var_130_14.content)
			local var_130_16, var_130_17 = arg_127_1:GetPercentByPara(var_130_15, 6)

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0

				local var_130_18 = var_130_12 <= 0 and var_130_13 or var_130_13 * ((var_130_17 - arg_127_1.typewritterCharCountI18N) / var_130_12)

				if var_130_18 > 0 and var_130_13 < var_130_18 then
					arg_127_1.talkMaxDuration = var_130_18

					if var_130_18 + var_130_11 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_11
					end
				end
			end

			local var_130_19 = 1
			local var_130_20 = math.max(var_130_19, arg_127_1.talkMaxDuration)

			if var_130_11 <= arg_127_1.time_ and arg_127_1.time_ < var_130_11 + var_130_20 then
				local var_130_21 = (arg_127_1.time_ - var_130_11) / var_130_20

				arg_127_1.fswtw_.percent = Mathf.Lerp(arg_127_1.var_.oldValueTypewriter, var_130_16, var_130_21)
				arg_127_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_127_1.fswtw_:SetDirty()
			end

			if arg_127_1.time_ >= var_130_11 + var_130_20 and arg_127_1.time_ < var_130_11 + var_130_20 + arg_130_0 then
				arg_127_1.fswtw_.percent = var_130_16

				arg_127_1.fswtw_:SetDirty()
				arg_127_1:ShowNextGo(true)

				arg_127_1.typewritterCharCountI18N = var_130_17
			end

			local var_130_22 = 0
			local var_130_23 = 2.586
			local var_130_24 = manager.audio:GetVoiceLength("story_v_out_116292", "116292031", "story_v_out_116292.awb") / 1000

			if var_130_24 > 0 and var_130_23 < var_130_24 and var_130_24 + var_130_22 > arg_127_1.duration_ then
				local var_130_25 = var_130_24

				arg_127_1.duration_ = var_130_24 + var_130_22
			end

			if var_130_22 < arg_127_1.time_ and arg_127_1.time_ <= var_130_22 + arg_130_0 then
				local var_130_26 = "play"
				local var_130_27 = "voice"

				arg_127_1:AudioAction(var_130_26, var_130_27, "story_v_out_116292", "116292031", "story_v_out_116292.awb")
			end

			local var_130_28 = 0

			if var_130_28 < arg_127_1.time_ and arg_127_1.time_ <= var_130_28 + arg_130_0 then
				arg_127_1.allBtn_.enabled = false
			end

			local var_130_29 = 1

			if arg_127_1.time_ >= var_130_28 + var_130_29 and arg_127_1.time_ < var_130_28 + var_130_29 + arg_130_0 then
				arg_127_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 116292032
		arg_131_1.duration_ = 4.956999999999

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play116292033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.var_.oldValueTypewriter = arg_131_1.fswtw_.percent

				arg_131_1:ShowNextGo(false)
			end

			local var_134_1 = 0
			local var_134_2 = -3.46666666666667
			local var_134_3 = arg_131_1:GetWordFromCfg(116292026)
			local var_134_4 = arg_131_1:FormatText(var_134_3.content)
			local var_134_5, var_134_6 = arg_131_1:GetPercentByPara(var_134_4, 4)

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				local var_134_7 = var_134_1 <= 0 and var_134_2 or var_134_2 * ((var_134_6 - arg_131_1.typewritterCharCountI18N) / var_134_1)

				if var_134_7 > 0 and var_134_2 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end
			end

			local var_134_8 = -3.46666666666667
			local var_134_9 = math.max(var_134_8, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_0) / var_134_9

				arg_131_1.fswtw_.percent = Mathf.Lerp(arg_131_1.var_.oldValueTypewriter, var_134_5, var_134_10)
				arg_131_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_131_1.fswtw_:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_9 and arg_131_1.time_ < var_134_0 + var_134_9 + arg_134_0 then
				arg_131_1.fswtw_.percent = var_134_5

				arg_131_1.fswtw_:SetDirty()
				arg_131_1:ShowNextGo(true)

				arg_131_1.typewritterCharCountI18N = var_134_6
			end

			local var_134_11 = 0

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1.fswbg_:SetActive(true)
				arg_131_1.dialog_:SetActive(false)

				arg_131_1.fswtw_.percent = 0

				local var_134_12 = arg_131_1:GetWordFromCfg(116292032)
				local var_134_13 = arg_131_1:FormatText(var_134_12.content)

				arg_131_1.fswt_.text = var_134_13

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.fswt_)

				arg_131_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_131_1.fswtw_:SetDirty()

				arg_131_1.typewritterCharCountI18N = 0

				arg_131_1:ShowNextGo(false)
			end

			local var_134_14 = 0.0166666666666667

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1.var_.oldValueTypewriter = arg_131_1.fswtw_.percent

				arg_131_1:ShowNextGo(false)
			end

			local var_134_15 = 34
			local var_134_16 = 2.26666666666667
			local var_134_17 = arg_131_1:GetWordFromCfg(116292032)
			local var_134_18 = arg_131_1:FormatText(var_134_17.content)
			local var_134_19, var_134_20 = arg_131_1:GetPercentByPara(var_134_18, 1)

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				local var_134_21 = var_134_15 <= 0 and var_134_16 or var_134_16 * ((var_134_20 - arg_131_1.typewritterCharCountI18N) / var_134_15)

				if var_134_21 > 0 and var_134_16 < var_134_21 then
					arg_131_1.talkMaxDuration = var_134_21

					if var_134_21 + var_134_14 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_21 + var_134_14
					end
				end
			end

			local var_134_22 = 2.26666666666667
			local var_134_23 = math.max(var_134_22, arg_131_1.talkMaxDuration)

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_23 then
				local var_134_24 = (arg_131_1.time_ - var_134_14) / var_134_23

				arg_131_1.fswtw_.percent = Mathf.Lerp(arg_131_1.var_.oldValueTypewriter, var_134_19, var_134_24)
				arg_131_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_131_1.fswtw_:SetDirty()
			end

			if arg_131_1.time_ >= var_134_14 + var_134_23 and arg_131_1.time_ < var_134_14 + var_134_23 + arg_134_0 then
				arg_131_1.fswtw_.percent = var_134_19

				arg_131_1.fswtw_:SetDirty()
				arg_131_1:ShowNextGo(true)

				arg_131_1.typewritterCharCountI18N = var_134_20
			end

			local var_134_25 = 0
			local var_134_26 = 4.957
			local var_134_27 = manager.audio:GetVoiceLength("story_v_out_116292", "116292032", "story_v_out_116292.awb") / 1000

			if var_134_27 > 0 and var_134_26 < var_134_27 and var_134_27 + var_134_25 > arg_131_1.duration_ then
				local var_134_28 = var_134_27

				arg_131_1.duration_ = var_134_27 + var_134_25
			end

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 then
				local var_134_29 = "play"
				local var_134_30 = "voice"

				arg_131_1:AudioAction(var_134_29, var_134_30, "story_v_out_116292", "116292032", "story_v_out_116292.awb")
			end

			local var_134_31 = 0

			if var_134_31 < arg_131_1.time_ and arg_131_1.time_ <= var_134_31 + arg_134_0 then
				arg_131_1.allBtn_.enabled = false
			end

			local var_134_32 = 2.28333333333333

			if arg_131_1.time_ >= var_134_31 + var_134_32 and arg_131_1.time_ < var_134_31 + var_134_32 + arg_134_0 then
				arg_131_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 116292033
		arg_135_1.duration_ = 3.345999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play116292034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.var_.oldValueTypewriter = arg_135_1.fswtw_.percent

				arg_135_1:ShowNextGo(false)
			end

			local var_138_1 = 25
			local var_138_2 = 1.66666666666667
			local var_138_3 = arg_135_1:GetWordFromCfg(116292032)
			local var_138_4 = arg_135_1:FormatText(var_138_3.content)
			local var_138_5, var_138_6 = arg_135_1:GetPercentByPara(var_138_4, 2)

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				local var_138_7 = var_138_1 <= 0 and var_138_2 or var_138_2 * ((var_138_6 - arg_135_1.typewritterCharCountI18N) / var_138_1)

				if var_138_7 > 0 and var_138_2 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end
			end

			local var_138_8 = 1.66666666666667
			local var_138_9 = math.max(var_138_8, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_0) / var_138_9

				arg_135_1.fswtw_.percent = Mathf.Lerp(arg_135_1.var_.oldValueTypewriter, var_138_5, var_138_10)
				arg_135_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_135_1.fswtw_:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_9 and arg_135_1.time_ < var_138_0 + var_138_9 + arg_138_0 then
				arg_135_1.fswtw_.percent = var_138_5

				arg_135_1.fswtw_:SetDirty()
				arg_135_1:ShowNextGo(true)

				arg_135_1.typewritterCharCountI18N = var_138_6
			end

			local var_138_11 = 0
			local var_138_12 = 3.346
			local var_138_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292033", "story_v_out_116292.awb") / 1000

			if var_138_13 > 0 and var_138_12 < var_138_13 and var_138_13 + var_138_11 > arg_135_1.duration_ then
				local var_138_14 = var_138_13

				arg_135_1.duration_ = var_138_13 + var_138_11
			end

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				local var_138_15 = "play"
				local var_138_16 = "voice"

				arg_135_1:AudioAction(var_138_15, var_138_16, "story_v_out_116292", "116292033", "story_v_out_116292.awb")
			end

			local var_138_17 = 0

			if var_138_17 < arg_135_1.time_ and arg_135_1.time_ <= var_138_17 + arg_138_0 then
				arg_135_1.allBtn_.enabled = false
			end

			local var_138_18 = 1.66666666666667

			if arg_135_1.time_ >= var_138_17 + var_138_18 and arg_135_1.time_ < var_138_17 + var_138_18 + arg_138_0 then
				arg_135_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 116292034
		arg_139_1.duration_ = 6.670999999999

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play116292035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.var_.oldValueTypewriter = arg_139_1.fswtw_.percent

				arg_139_1:ShowNextGo(false)
			end

			local var_142_1 = 40
			local var_142_2 = 2.66666666666667
			local var_142_3 = arg_139_1:GetWordFromCfg(116292032)
			local var_142_4 = arg_139_1:FormatText(var_142_3.content)
			local var_142_5, var_142_6 = arg_139_1:GetPercentByPara(var_142_4, 3)

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0

				local var_142_7 = var_142_1 <= 0 and var_142_2 or var_142_2 * ((var_142_6 - arg_139_1.typewritterCharCountI18N) / var_142_1)

				if var_142_7 > 0 and var_142_2 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end
			end

			local var_142_8 = 2.66666666666667
			local var_142_9 = math.max(var_142_8, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_0) / var_142_9

				arg_139_1.fswtw_.percent = Mathf.Lerp(arg_139_1.var_.oldValueTypewriter, var_142_5, var_142_10)
				arg_139_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_139_1.fswtw_:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_9 and arg_139_1.time_ < var_142_0 + var_142_9 + arg_142_0 then
				arg_139_1.fswtw_.percent = var_142_5

				arg_139_1.fswtw_:SetDirty()
				arg_139_1:ShowNextGo(true)

				arg_139_1.typewritterCharCountI18N = var_142_6
			end

			local var_142_11 = 0
			local var_142_12 = 6.671
			local var_142_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292034", "story_v_out_116292.awb") / 1000

			if var_142_13 > 0 and var_142_12 < var_142_13 and var_142_13 + var_142_11 > arg_139_1.duration_ then
				local var_142_14 = var_142_13

				arg_139_1.duration_ = var_142_13 + var_142_11
			end

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				local var_142_15 = "play"
				local var_142_16 = "voice"

				arg_139_1:AudioAction(var_142_15, var_142_16, "story_v_out_116292", "116292034", "story_v_out_116292.awb")
			end

			local var_142_17 = 0

			if var_142_17 < arg_139_1.time_ and arg_139_1.time_ <= var_142_17 + arg_142_0 then
				arg_139_1.allBtn_.enabled = false
			end

			local var_142_18 = 2.66666666666667

			if arg_139_1.time_ >= var_142_17 + var_142_18 and arg_139_1.time_ < var_142_17 + var_142_18 + arg_142_0 then
				arg_139_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 116292035
		arg_143_1.duration_ = 6.091999999999

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play116292036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.var_.oldValueTypewriter = arg_143_1.fswtw_.percent

				arg_143_1:ShowNextGo(false)
			end

			local var_146_1 = 28
			local var_146_2 = 1.86666666666667
			local var_146_3 = arg_143_1:GetWordFromCfg(116292032)
			local var_146_4 = arg_143_1:FormatText(var_146_3.content)
			local var_146_5, var_146_6 = arg_143_1:GetPercentByPara(var_146_4, 4)

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				local var_146_7 = var_146_1 <= 0 and var_146_2 or var_146_2 * ((var_146_6 - arg_143_1.typewritterCharCountI18N) / var_146_1)

				if var_146_7 > 0 and var_146_2 < var_146_7 then
					arg_143_1.talkMaxDuration = var_146_7

					if var_146_7 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_7 + var_146_0
					end
				end
			end

			local var_146_8 = 1.86666666666667
			local var_146_9 = math.max(var_146_8, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_9 then
				local var_146_10 = (arg_143_1.time_ - var_146_0) / var_146_9

				arg_143_1.fswtw_.percent = Mathf.Lerp(arg_143_1.var_.oldValueTypewriter, var_146_5, var_146_10)
				arg_143_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_143_1.fswtw_:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_9 and arg_143_1.time_ < var_146_0 + var_146_9 + arg_146_0 then
				arg_143_1.fswtw_.percent = var_146_5

				arg_143_1.fswtw_:SetDirty()
				arg_143_1:ShowNextGo(true)

				arg_143_1.typewritterCharCountI18N = var_146_6
			end

			local var_146_11 = 0
			local var_146_12 = 6.092
			local var_146_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292035", "story_v_out_116292.awb") / 1000

			if var_146_13 > 0 and var_146_12 < var_146_13 and var_146_13 + var_146_11 > arg_143_1.duration_ then
				local var_146_14 = var_146_13

				arg_143_1.duration_ = var_146_13 + var_146_11
			end

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				local var_146_15 = "play"
				local var_146_16 = "voice"

				arg_143_1:AudioAction(var_146_15, var_146_16, "story_v_out_116292", "116292035", "story_v_out_116292.awb")
			end

			local var_146_17 = 0

			if var_146_17 < arg_143_1.time_ and arg_143_1.time_ <= var_146_17 + arg_146_0 then
				arg_143_1.allBtn_.enabled = false
			end

			local var_146_18 = 1.86666666666667

			if arg_143_1.time_ >= var_146_17 + var_146_18 and arg_143_1.time_ < var_146_17 + var_146_18 + arg_146_0 then
				arg_143_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 116292036
		arg_147_1.duration_ = 5.680999999999

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play116292037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.var_.oldValueTypewriter = arg_147_1.fswtw_.percent

				arg_147_1:ShowNextGo(false)
			end

			local var_150_1 = 37
			local var_150_2 = 2.46666666666667
			local var_150_3 = arg_147_1:GetWordFromCfg(116292032)
			local var_150_4 = arg_147_1:FormatText(var_150_3.content)
			local var_150_5, var_150_6 = arg_147_1:GetPercentByPara(var_150_4, 5)

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0

				local var_150_7 = var_150_1 <= 0 and var_150_2 or var_150_2 * ((var_150_6 - arg_147_1.typewritterCharCountI18N) / var_150_1)

				if var_150_7 > 0 and var_150_2 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end
			end

			local var_150_8 = 2.46666666666667
			local var_150_9 = math.max(var_150_8, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_0) / var_150_9

				arg_147_1.fswtw_.percent = Mathf.Lerp(arg_147_1.var_.oldValueTypewriter, var_150_5, var_150_10)
				arg_147_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_147_1.fswtw_:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_9 and arg_147_1.time_ < var_150_0 + var_150_9 + arg_150_0 then
				arg_147_1.fswtw_.percent = var_150_5

				arg_147_1.fswtw_:SetDirty()
				arg_147_1:ShowNextGo(true)

				arg_147_1.typewritterCharCountI18N = var_150_6
			end

			local var_150_11 = 0
			local var_150_12 = 5.681
			local var_150_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292036", "story_v_out_116292.awb") / 1000

			if var_150_13 > 0 and var_150_12 < var_150_13 and var_150_13 + var_150_11 > arg_147_1.duration_ then
				local var_150_14 = var_150_13

				arg_147_1.duration_ = var_150_13 + var_150_11
			end

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				local var_150_15 = "play"
				local var_150_16 = "voice"

				arg_147_1:AudioAction(var_150_15, var_150_16, "story_v_out_116292", "116292036", "story_v_out_116292.awb")
			end

			local var_150_17 = 0

			if var_150_17 < arg_147_1.time_ and arg_147_1.time_ <= var_150_17 + arg_150_0 then
				arg_147_1.allBtn_.enabled = false
			end

			local var_150_18 = 2.46666666666667

			if arg_147_1.time_ >= var_150_17 + var_150_18 and arg_147_1.time_ < var_150_17 + var_150_18 + arg_150_0 then
				arg_147_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 116292037
		arg_151_1.duration_ = 4.059999999999

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play116292038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.var_.oldValueTypewriter = arg_151_1.fswtw_.percent

				arg_151_1:ShowNextGo(false)
			end

			local var_154_1 = 25
			local var_154_2 = 1.66666666666667
			local var_154_3 = arg_151_1:GetWordFromCfg(116292032)
			local var_154_4 = arg_151_1:FormatText(var_154_3.content)
			local var_154_5, var_154_6 = arg_151_1:GetPercentByPara(var_154_4, 6)

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0

				local var_154_7 = var_154_1 <= 0 and var_154_2 or var_154_2 * ((var_154_6 - arg_151_1.typewritterCharCountI18N) / var_154_1)

				if var_154_7 > 0 and var_154_2 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end
			end

			local var_154_8 = 1.66666666666667
			local var_154_9 = math.max(var_154_8, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_0) / var_154_9

				arg_151_1.fswtw_.percent = Mathf.Lerp(arg_151_1.var_.oldValueTypewriter, var_154_5, var_154_10)
				arg_151_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_151_1.fswtw_:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_9 and arg_151_1.time_ < var_154_0 + var_154_9 + arg_154_0 then
				arg_151_1.fswtw_.percent = var_154_5

				arg_151_1.fswtw_:SetDirty()
				arg_151_1:ShowNextGo(true)

				arg_151_1.typewritterCharCountI18N = var_154_6
			end

			local var_154_11 = 0
			local var_154_12 = 4.06
			local var_154_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292037", "story_v_out_116292.awb") / 1000

			if var_154_13 > 0 and var_154_12 < var_154_13 and var_154_13 + var_154_11 > arg_151_1.duration_ then
				local var_154_14 = var_154_13

				arg_151_1.duration_ = var_154_13 + var_154_11
			end

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				local var_154_15 = "play"
				local var_154_16 = "voice"

				arg_151_1:AudioAction(var_154_15, var_154_16, "story_v_out_116292", "116292037", "story_v_out_116292.awb")
			end

			local var_154_17 = 0

			if var_154_17 < arg_151_1.time_ and arg_151_1.time_ <= var_154_17 + arg_154_0 then
				arg_151_1.allBtn_.enabled = false
			end

			local var_154_18 = 1.66666666666667

			if arg_151_1.time_ >= var_154_17 + var_154_18 and arg_151_1.time_ < var_154_17 + var_154_18 + arg_154_0 then
				arg_151_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 116292038
		arg_155_1.duration_ = 3.553999999999

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play116292039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.fswbg_:SetActive(true)
				arg_155_1.dialog_:SetActive(false)

				arg_155_1.fswtw_.percent = 0

				local var_158_1 = arg_155_1:GetWordFromCfg(116292038)
				local var_158_2 = arg_155_1:FormatText(var_158_1.content)

				arg_155_1.fswt_.text = var_158_2

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.fswt_)

				arg_155_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_155_1.fswtw_:SetDirty()

				arg_155_1.typewritterCharCountI18N = 0

				arg_155_1:ShowNextGo(false)
			end

			local var_158_3 = 0.0166666666666667

			if var_158_3 < arg_155_1.time_ and arg_155_1.time_ <= var_158_3 + arg_158_0 then
				arg_155_1.var_.oldValueTypewriter = arg_155_1.fswtw_.percent

				arg_155_1:ShowNextGo(false)
			end

			local var_158_4 = 21
			local var_158_5 = 1.4
			local var_158_6 = arg_155_1:GetWordFromCfg(116292038)
			local var_158_7 = arg_155_1:FormatText(var_158_6.content)
			local var_158_8, var_158_9 = arg_155_1:GetPercentByPara(var_158_7, 1)

			if var_158_3 < arg_155_1.time_ and arg_155_1.time_ <= var_158_3 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0

				local var_158_10 = var_158_4 <= 0 and var_158_5 or var_158_5 * ((var_158_9 - arg_155_1.typewritterCharCountI18N) / var_158_4)

				if var_158_10 > 0 and var_158_5 < var_158_10 then
					arg_155_1.talkMaxDuration = var_158_10

					if var_158_10 + var_158_3 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_3
					end
				end
			end

			local var_158_11 = 1.4
			local var_158_12 = math.max(var_158_11, arg_155_1.talkMaxDuration)

			if var_158_3 <= arg_155_1.time_ and arg_155_1.time_ < var_158_3 + var_158_12 then
				local var_158_13 = (arg_155_1.time_ - var_158_3) / var_158_12

				arg_155_1.fswtw_.percent = Mathf.Lerp(arg_155_1.var_.oldValueTypewriter, var_158_8, var_158_13)
				arg_155_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_155_1.fswtw_:SetDirty()
			end

			if arg_155_1.time_ >= var_158_3 + var_158_12 and arg_155_1.time_ < var_158_3 + var_158_12 + arg_158_0 then
				arg_155_1.fswtw_.percent = var_158_8

				arg_155_1.fswtw_:SetDirty()
				arg_155_1:ShowNextGo(true)

				arg_155_1.typewritterCharCountI18N = var_158_9
			end

			local var_158_14 = 0
			local var_158_15 = 3.554
			local var_158_16 = manager.audio:GetVoiceLength("story_v_out_116292", "116292038", "story_v_out_116292.awb") / 1000

			if var_158_16 > 0 and var_158_15 < var_158_16 and var_158_16 + var_158_14 > arg_155_1.duration_ then
				local var_158_17 = var_158_16

				arg_155_1.duration_ = var_158_16 + var_158_14
			end

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				local var_158_18 = "play"
				local var_158_19 = "voice"

				arg_155_1:AudioAction(var_158_18, var_158_19, "story_v_out_116292", "116292038", "story_v_out_116292.awb")
			end

			local var_158_20 = 0

			if var_158_20 < arg_155_1.time_ and arg_155_1.time_ <= var_158_20 + arg_158_0 then
				arg_155_1.allBtn_.enabled = false
			end

			local var_158_21 = 3.554

			if arg_155_1.time_ >= var_158_20 + var_158_21 and arg_155_1.time_ < var_158_20 + var_158_21 + arg_158_0 then
				arg_155_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 116292039
		arg_159_1.duration_ = 2.766999999999

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play116292040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.var_.oldValueTypewriter = arg_159_1.fswtw_.percent

				arg_159_1:ShowNextGo(false)
			end

			local var_162_1 = 19
			local var_162_2 = 1.26666666666667
			local var_162_3 = arg_159_1:GetWordFromCfg(116292038)
			local var_162_4 = arg_159_1:FormatText(var_162_3.content)
			local var_162_5, var_162_6 = arg_159_1:GetPercentByPara(var_162_4, 2)

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0

				local var_162_7 = var_162_1 <= 0 and var_162_2 or var_162_2 * ((var_162_6 - arg_159_1.typewritterCharCountI18N) / var_162_1)

				if var_162_7 > 0 and var_162_2 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end
			end

			local var_162_8 = 1.26666666666667
			local var_162_9 = math.max(var_162_8, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_0) / var_162_9

				arg_159_1.fswtw_.percent = Mathf.Lerp(arg_159_1.var_.oldValueTypewriter, var_162_5, var_162_10)
				arg_159_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_159_1.fswtw_:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_9 and arg_159_1.time_ < var_162_0 + var_162_9 + arg_162_0 then
				arg_159_1.fswtw_.percent = var_162_5

				arg_159_1.fswtw_:SetDirty()
				arg_159_1:ShowNextGo(true)

				arg_159_1.typewritterCharCountI18N = var_162_6
			end

			local var_162_11 = 0
			local var_162_12 = 2.767
			local var_162_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292039", "story_v_out_116292.awb") / 1000

			if var_162_13 > 0 and var_162_12 < var_162_13 and var_162_13 + var_162_11 > arg_159_1.duration_ then
				local var_162_14 = var_162_13

				arg_159_1.duration_ = var_162_13 + var_162_11
			end

			if var_162_11 < arg_159_1.time_ and arg_159_1.time_ <= var_162_11 + arg_162_0 then
				local var_162_15 = "play"
				local var_162_16 = "voice"

				arg_159_1:AudioAction(var_162_15, var_162_16, "story_v_out_116292", "116292039", "story_v_out_116292.awb")
			end

			local var_162_17 = 0

			if var_162_17 < arg_159_1.time_ and arg_159_1.time_ <= var_162_17 + arg_162_0 then
				arg_159_1.allBtn_.enabled = false
			end

			local var_162_18 = 1.26666666666667

			if arg_159_1.time_ >= var_162_17 + var_162_18 and arg_159_1.time_ < var_162_17 + var_162_18 + arg_162_0 then
				arg_159_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 116292040
		arg_163_1.duration_ = 2.101999999999

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play116292041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.var_.oldValueTypewriter = arg_163_1.fswtw_.percent

				arg_163_1:ShowNextGo(false)
			end

			local var_166_1 = 18
			local var_166_2 = 1.2
			local var_166_3 = arg_163_1:GetWordFromCfg(116292038)
			local var_166_4 = arg_163_1:FormatText(var_166_3.content)
			local var_166_5, var_166_6 = arg_163_1:GetPercentByPara(var_166_4, 3)

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0

				local var_166_7 = var_166_1 <= 0 and var_166_2 or var_166_2 * ((var_166_6 - arg_163_1.typewritterCharCountI18N) / var_166_1)

				if var_166_7 > 0 and var_166_2 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end
			end

			local var_166_8 = 1.2
			local var_166_9 = math.max(var_166_8, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_0) / var_166_9

				arg_163_1.fswtw_.percent = Mathf.Lerp(arg_163_1.var_.oldValueTypewriter, var_166_5, var_166_10)
				arg_163_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_163_1.fswtw_:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_9 and arg_163_1.time_ < var_166_0 + var_166_9 + arg_166_0 then
				arg_163_1.fswtw_.percent = var_166_5

				arg_163_1.fswtw_:SetDirty()
				arg_163_1:ShowNextGo(true)

				arg_163_1.typewritterCharCountI18N = var_166_6
			end

			local var_166_11 = 0
			local var_166_12 = 2.102
			local var_166_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292040", "story_v_out_116292.awb") / 1000

			if var_166_13 > 0 and var_166_12 < var_166_13 and var_166_13 + var_166_11 > arg_163_1.duration_ then
				local var_166_14 = var_166_13

				arg_163_1.duration_ = var_166_13 + var_166_11
			end

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				local var_166_15 = "play"
				local var_166_16 = "voice"

				arg_163_1:AudioAction(var_166_15, var_166_16, "story_v_out_116292", "116292040", "story_v_out_116292.awb")
			end

			local var_166_17 = 0

			if var_166_17 < arg_163_1.time_ and arg_163_1.time_ <= var_166_17 + arg_166_0 then
				arg_163_1.allBtn_.enabled = false
			end

			local var_166_18 = 1.2

			if arg_163_1.time_ >= var_166_17 + var_166_18 and arg_163_1.time_ < var_166_17 + var_166_18 + arg_166_0 then
				arg_163_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 116292041
		arg_167_1.duration_ = 2.935999999999

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play116292042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.var_.oldValueTypewriter = arg_167_1.fswtw_.percent

				arg_167_1:ShowNextGo(false)
			end

			local var_170_1 = 21
			local var_170_2 = 1.4
			local var_170_3 = arg_167_1:GetWordFromCfg(116292038)
			local var_170_4 = arg_167_1:FormatText(var_170_3.content)
			local var_170_5, var_170_6 = arg_167_1:GetPercentByPara(var_170_4, 4)

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0

				local var_170_7 = var_170_1 <= 0 and var_170_2 or var_170_2 * ((var_170_6 - arg_167_1.typewritterCharCountI18N) / var_170_1)

				if var_170_7 > 0 and var_170_2 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end
			end

			local var_170_8 = 1.4
			local var_170_9 = math.max(var_170_8, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_0) / var_170_9

				arg_167_1.fswtw_.percent = Mathf.Lerp(arg_167_1.var_.oldValueTypewriter, var_170_5, var_170_10)
				arg_167_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_167_1.fswtw_:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_9 and arg_167_1.time_ < var_170_0 + var_170_9 + arg_170_0 then
				arg_167_1.fswtw_.percent = var_170_5

				arg_167_1.fswtw_:SetDirty()
				arg_167_1:ShowNextGo(true)

				arg_167_1.typewritterCharCountI18N = var_170_6
			end

			local var_170_11 = 0
			local var_170_12 = 1

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 then
				local var_170_13 = "play"
				local var_170_14 = "effect"

				arg_167_1:AudioAction(var_170_13, var_170_14, "se_story_6", "se_story_6_blast", "")
			end

			local var_170_15 = 0
			local var_170_16 = 2.936
			local var_170_17 = manager.audio:GetVoiceLength("story_v_out_116292", "116292041", "story_v_out_116292.awb") / 1000

			if var_170_17 > 0 and var_170_16 < var_170_17 and var_170_17 + var_170_15 > arg_167_1.duration_ then
				local var_170_18 = var_170_17

				arg_167_1.duration_ = var_170_17 + var_170_15
			end

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				local var_170_19 = "play"
				local var_170_20 = "voice"

				arg_167_1:AudioAction(var_170_19, var_170_20, "story_v_out_116292", "116292041", "story_v_out_116292.awb")
			end

			local var_170_21 = 0

			if var_170_21 < arg_167_1.time_ and arg_167_1.time_ <= var_170_21 + arg_170_0 then
				arg_167_1.allBtn_.enabled = false
			end

			local var_170_22 = 1.4

			if arg_167_1.time_ >= var_170_21 + var_170_22 and arg_167_1.time_ < var_170_21 + var_170_22 + arg_170_0 then
				arg_167_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 116292042
		arg_171_1.duration_ = 1.843999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play116292043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.var_.oldValueTypewriter = arg_171_1.fswtw_.percent

				arg_171_1:ShowNextGo(false)
			end

			local var_174_1 = 18
			local var_174_2 = 1.2
			local var_174_3 = arg_171_1:GetWordFromCfg(116292038)
			local var_174_4 = arg_171_1:FormatText(var_174_3.content)
			local var_174_5, var_174_6 = arg_171_1:GetPercentByPara(var_174_4, 5)

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0

				local var_174_7 = var_174_1 <= 0 and var_174_2 or var_174_2 * ((var_174_6 - arg_171_1.typewritterCharCountI18N) / var_174_1)

				if var_174_7 > 0 and var_174_2 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end
			end

			local var_174_8 = 1.2
			local var_174_9 = math.max(var_174_8, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_0) / var_174_9

				arg_171_1.fswtw_.percent = Mathf.Lerp(arg_171_1.var_.oldValueTypewriter, var_174_5, var_174_10)
				arg_171_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_171_1.fswtw_:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_9 and arg_171_1.time_ < var_174_0 + var_174_9 + arg_174_0 then
				arg_171_1.fswtw_.percent = var_174_5

				arg_171_1.fswtw_:SetDirty()
				arg_171_1:ShowNextGo(true)

				arg_171_1.typewritterCharCountI18N = var_174_6
			end

			local var_174_11 = 0
			local var_174_12 = 1.844
			local var_174_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292042", "story_v_out_116292.awb") / 1000

			if var_174_13 > 0 and var_174_12 < var_174_13 and var_174_13 + var_174_11 > arg_171_1.duration_ then
				local var_174_14 = var_174_13

				arg_171_1.duration_ = var_174_13 + var_174_11
			end

			if var_174_11 < arg_171_1.time_ and arg_171_1.time_ <= var_174_11 + arg_174_0 then
				local var_174_15 = "play"
				local var_174_16 = "voice"

				arg_171_1:AudioAction(var_174_15, var_174_16, "story_v_out_116292", "116292042", "story_v_out_116292.awb")
			end

			local var_174_17 = 0

			if var_174_17 < arg_171_1.time_ and arg_171_1.time_ <= var_174_17 + arg_174_0 then
				arg_171_1.allBtn_.enabled = false
			end

			local var_174_18 = 1.2

			if arg_171_1.time_ >= var_174_17 + var_174_18 and arg_171_1.time_ < var_174_17 + var_174_18 + arg_174_0 then
				arg_171_1.allBtn_.enabled = true
			end
		end
	end,
	Play116292043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 116292043
		arg_175_1.duration_ = 8.133333333332

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play116292044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				local var_178_1 = manager.ui.mainCamera.transform.localPosition
				local var_178_2 = Vector3.New(0, 0, 10) + Vector3.New(var_178_1.x, var_178_1.y, 0)
				local var_178_3 = arg_175_1.bgs_.STblack

				var_178_3.transform.localPosition = var_178_2
				var_178_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_178_4 = var_178_3:GetComponent("SpriteRenderer")

				if var_178_4 and var_178_4.sprite then
					local var_178_5 = (var_178_3.transform.localPosition - var_178_1).z
					local var_178_6 = manager.ui.mainCameraCom_
					local var_178_7 = 2 * var_178_5 * Mathf.Tan(var_178_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_178_8 = var_178_7 * var_178_6.aspect
					local var_178_9 = var_178_4.sprite.bounds.size.x
					local var_178_10 = var_178_4.sprite.bounds.size.y
					local var_178_11 = var_178_8 / var_178_9
					local var_178_12 = var_178_7 / var_178_10
					local var_178_13 = var_178_12 < var_178_11 and var_178_11 or var_178_12

					var_178_3.transform.localScale = Vector3.New(var_178_13, var_178_13, 0)
				end

				for iter_178_0, iter_178_1 in pairs(arg_175_1.bgs_) do
					if iter_178_0 ~= "STblack" then
						iter_178_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_178_14 = 1.983333

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				arg_175_1.fswbg_:SetActive(false)
				arg_175_1.dialog_:SetActive(true)
				arg_175_1:ShowNextGo(false)
			end

			local var_178_15 = 2
			local var_178_16 = 3.464
			local var_178_17 = manager.audio:GetVoiceLength("story_v_out_116292", "116292043", "story_v_out_116292.awb") / 1000

			if var_178_17 > 0 and var_178_16 < var_178_17 and var_178_17 + var_178_15 > arg_175_1.duration_ then
				local var_178_18 = var_178_17

				arg_175_1.duration_ = var_178_17 + var_178_15
			end

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				local var_178_19 = "play"
				local var_178_20 = "voice"

				arg_175_1:AudioAction(var_178_19, var_178_20, "story_v_out_116292", "116292043", "story_v_out_116292.awb")
			end

			local var_178_21 = 0

			if var_178_21 < arg_175_1.time_ and arg_175_1.time_ <= var_178_21 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_22 = 2

			if var_178_21 <= arg_175_1.time_ and arg_175_1.time_ < var_178_21 + var_178_22 then
				local var_178_23 = (arg_175_1.time_ - var_178_21) / var_178_22
				local var_178_24 = Color.New(0, 0, 0)

				var_178_24.a = Mathf.Lerp(0, 1, var_178_23)
				arg_175_1.mask_.color = var_178_24
			end

			if arg_175_1.time_ >= var_178_21 + var_178_22 and arg_175_1.time_ < var_178_21 + var_178_22 + arg_178_0 then
				local var_178_25 = Color.New(0, 0, 0)

				var_178_25.a = 1
				arg_175_1.mask_.color = var_178_25
			end

			local var_178_26 = 2

			if var_178_26 < arg_175_1.time_ and arg_175_1.time_ <= var_178_26 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_27 = 2

			if var_178_26 <= arg_175_1.time_ and arg_175_1.time_ < var_178_26 + var_178_27 then
				local var_178_28 = (arg_175_1.time_ - var_178_26) / var_178_27
				local var_178_29 = Color.New(0, 0, 0)

				var_178_29.a = Mathf.Lerp(1, 0, var_178_28)
				arg_175_1.mask_.color = var_178_29
			end

			if arg_175_1.time_ >= var_178_26 + var_178_27 and arg_175_1.time_ < var_178_26 + var_178_27 + arg_178_0 then
				local var_178_30 = Color.New(0, 0, 0)
				local var_178_31 = 0

				arg_175_1.mask_.enabled = false
				var_178_30.a = var_178_31
				arg_175_1.mask_.color = var_178_30
			end

			if arg_175_1.frameCnt_ <= 1 then
				arg_175_1.dialog_:SetActive(false)
			end

			local var_178_32 = 1.983333
			local var_178_33 = 0.15

			if var_178_32 < arg_175_1.time_ and arg_175_1.time_ <= var_178_32 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				arg_175_1.dialog_:SetActive(true)

				local var_178_34 = LeanTween.value(arg_175_1.dialog_, 0, 1, 0.3)

				var_178_34:setOnUpdate(LuaHelper.FloatAction(function(arg_179_0)
					arg_175_1.dialogCg_.alpha = arg_179_0
				end))
				var_178_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_175_1.dialog_)
					var_178_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_175_1.duration_ = arg_175_1.duration_ + 0.3

				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_35 = arg_175_1:FormatText(StoryNameCfg[8].name)

				arg_175_1.leftNameTxt_.text = var_178_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, true)
				arg_175_1.iconController_:SetSelectedState("hero")

				arg_175_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_36 = arg_175_1:GetWordFromCfg(116292043)
				local var_178_37 = arg_175_1:FormatText(var_178_36.content)

				arg_175_1.text_.text = var_178_37

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_38 = 6
				local var_178_39 = utf8.len(var_178_37)
				local var_178_40 = var_178_38 <= 0 and var_178_33 or var_178_33 * (var_178_39 / var_178_38)

				if var_178_40 > 0 and var_178_33 < var_178_40 then
					arg_175_1.talkMaxDuration = var_178_40
					var_178_32 = var_178_32 + 0.3

					if var_178_40 + var_178_32 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_40 + var_178_32
					end
				end

				arg_175_1.text_.text = var_178_37
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292043", "story_v_out_116292.awb") ~= 0 then
					local var_178_41 = manager.audio:GetVoiceLength("story_v_out_116292", "116292043", "story_v_out_116292.awb") / 1000

					if var_178_41 + var_178_32 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_41 + var_178_32
					end

					if var_178_36.prefab_name ~= "" and arg_175_1.actors_[var_178_36.prefab_name] ~= nil then
						local var_178_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_36.prefab_name].transform, "story_v_out_116292", "116292043", "story_v_out_116292.awb")

						arg_175_1:RecordAudio("116292043", var_178_42)
						arg_175_1:RecordAudio("116292043", var_178_42)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_116292", "116292043", "story_v_out_116292.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_116292", "116292043", "story_v_out_116292.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_43 = var_178_32 + 0.3
			local var_178_44 = math.max(var_178_33, arg_175_1.talkMaxDuration)

			if var_178_43 <= arg_175_1.time_ and arg_175_1.time_ < var_178_43 + var_178_44 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_43) / var_178_44

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_43 + var_178_44 and arg_175_1.time_ < var_178_43 + var_178_44 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play116292044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 116292044
		arg_181_1.duration_ = 6.833

		local var_181_0 = {
			zh = 5.733,
			ja = 6.833
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
				arg_181_0:Play116292045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = "SK0204a"

			if arg_181_1.bgs_[var_184_0] == nil then
				local var_184_1 = Object.Instantiate(arg_181_1.paintGo_)

				var_184_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_184_0)
				var_184_1.name = var_184_0
				var_184_1.transform.parent = arg_181_1.stage_.transform
				var_184_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.bgs_[var_184_0] = var_184_1
			end

			local var_184_2 = 0

			if var_184_2 < arg_181_1.time_ and arg_181_1.time_ <= var_184_2 + arg_184_0 then
				local var_184_3 = manager.ui.mainCamera.transform.localPosition
				local var_184_4 = Vector3.New(0, 0, 10) + Vector3.New(var_184_3.x, var_184_3.y, 0)
				local var_184_5 = arg_181_1.bgs_.SK0204a

				var_184_5.transform.localPosition = var_184_4
				var_184_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_184_6 = var_184_5:GetComponent("SpriteRenderer")

				if var_184_6 and var_184_6.sprite then
					local var_184_7 = (var_184_5.transform.localPosition - var_184_3).z
					local var_184_8 = manager.ui.mainCameraCom_
					local var_184_9 = 2 * var_184_7 * Mathf.Tan(var_184_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_184_10 = var_184_9 * var_184_8.aspect
					local var_184_11 = var_184_6.sprite.bounds.size.x
					local var_184_12 = var_184_6.sprite.bounds.size.y
					local var_184_13 = var_184_10 / var_184_11
					local var_184_14 = var_184_9 / var_184_12
					local var_184_15 = var_184_14 < var_184_13 and var_184_13 or var_184_14

					var_184_5.transform.localScale = Vector3.New(var_184_15, var_184_15, 0)
				end

				for iter_184_0, iter_184_1 in pairs(arg_181_1.bgs_) do
					if iter_184_0 ~= "SK0204a" then
						iter_184_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_17 = 3

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17
				local var_184_19 = Color.New(0, 0, 0)

				var_184_19.a = Mathf.Lerp(1, 0, var_184_18)
				arg_181_1.mask_.color = var_184_19
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 then
				local var_184_20 = Color.New(0, 0, 0)
				local var_184_21 = 0

				arg_181_1.mask_.enabled = false
				var_184_20.a = var_184_21
				arg_181_1.mask_.color = var_184_20
			end

			local var_184_22 = 0

			if var_184_22 < arg_181_1.time_ and arg_181_1.time_ <= var_184_22 + arg_184_0 then
				arg_181_1.screenFilterGo_:SetActive(true)

				arg_181_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_184_23 = 0.0166666666666667

			if var_184_22 <= arg_181_1.time_ and arg_181_1.time_ < var_184_22 + var_184_23 then
				local var_184_24 = (arg_181_1.time_ - var_184_22) / var_184_23

				arg_181_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_184_24)
			end

			if arg_181_1.time_ >= var_184_22 + var_184_23 and arg_181_1.time_ < var_184_22 + var_184_23 + arg_184_0 then
				arg_181_1.screenFilterEffect_.weight = 1
			end

			if arg_181_1.frameCnt_ <= 1 then
				arg_181_1.dialog_:SetActive(false)
			end

			local var_184_25 = 3
			local var_184_26 = 0.2

			if var_184_25 < arg_181_1.time_ and arg_181_1.time_ <= var_184_25 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0

				arg_181_1.dialog_:SetActive(true)

				local var_184_27 = LeanTween.value(arg_181_1.dialog_, 0, 1, 0.3)

				var_184_27:setOnUpdate(LuaHelper.FloatAction(function(arg_185_0)
					arg_181_1.dialogCg_.alpha = arg_185_0
				end))
				var_184_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_181_1.dialog_)
					var_184_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_181_1.duration_ = arg_181_1.duration_ + 0.3

				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_28 = arg_181_1:FormatText(StoryNameCfg[8].name)

				arg_181_1.leftNameTxt_.text = var_184_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_29 = arg_181_1:GetWordFromCfg(116292044)
				local var_184_30 = arg_181_1:FormatText(var_184_29.content)

				arg_181_1.text_.text = var_184_30

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_31 = 8
				local var_184_32 = utf8.len(var_184_30)
				local var_184_33 = var_184_31 <= 0 and var_184_26 or var_184_26 * (var_184_32 / var_184_31)

				if var_184_33 > 0 and var_184_26 < var_184_33 then
					arg_181_1.talkMaxDuration = var_184_33
					var_184_25 = var_184_25 + 0.3

					if var_184_33 + var_184_25 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_33 + var_184_25
					end
				end

				arg_181_1.text_.text = var_184_30
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292044", "story_v_out_116292.awb") ~= 0 then
					local var_184_34 = manager.audio:GetVoiceLength("story_v_out_116292", "116292044", "story_v_out_116292.awb") / 1000

					if var_184_34 + var_184_25 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_34 + var_184_25
					end

					if var_184_29.prefab_name ~= "" and arg_181_1.actors_[var_184_29.prefab_name] ~= nil then
						local var_184_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_29.prefab_name].transform, "story_v_out_116292", "116292044", "story_v_out_116292.awb")

						arg_181_1:RecordAudio("116292044", var_184_35)
						arg_181_1:RecordAudio("116292044", var_184_35)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_116292", "116292044", "story_v_out_116292.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_116292", "116292044", "story_v_out_116292.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_36 = var_184_25 + 0.3
			local var_184_37 = math.max(var_184_26, arg_181_1.talkMaxDuration)

			if var_184_36 <= arg_181_1.time_ and arg_181_1.time_ < var_184_36 + var_184_37 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_36) / var_184_37

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_36 + var_184_37 and arg_181_1.time_ < var_184_36 + var_184_37 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play116292045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 116292045
		arg_187_1.duration_ = 7.7

		local var_187_0 = {
			zh = 7.7,
			ja = 6.966
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
				arg_187_0:Play116292046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.75

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[327].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(116292045)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 30
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292045", "story_v_out_116292.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292045", "story_v_out_116292.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_116292", "116292045", "story_v_out_116292.awb")

						arg_187_1:RecordAudio("116292045", var_190_9)
						arg_187_1:RecordAudio("116292045", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_116292", "116292045", "story_v_out_116292.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_116292", "116292045", "story_v_out_116292.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play116292046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 116292046
		arg_191_1.duration_ = 6

		local var_191_0 = {
			zh = 6,
			ja = 2.966
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
				arg_191_0:Play116292047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.45

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[8].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(116292046)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 18
				local var_194_6 = utf8.len(var_194_4)
				local var_194_7 = var_194_5 <= 0 and var_194_1 or var_194_1 * (var_194_6 / var_194_5)

				if var_194_7 > 0 and var_194_1 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_4
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292046", "story_v_out_116292.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292046", "story_v_out_116292.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_116292", "116292046", "story_v_out_116292.awb")

						arg_191_1:RecordAudio("116292046", var_194_9)
						arg_191_1:RecordAudio("116292046", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_116292", "116292046", "story_v_out_116292.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_116292", "116292046", "story_v_out_116292.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_10 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_10 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_10

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_10 and arg_191_1.time_ < var_194_0 + var_194_10 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play116292047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 116292047
		arg_195_1.duration_ = 12.633

		local var_195_0 = {
			zh = 8.8,
			ja = 12.633
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
				arg_195_0:Play116292048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.925

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[327].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(116292047)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 37
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292047", "story_v_out_116292.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292047", "story_v_out_116292.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_116292", "116292047", "story_v_out_116292.awb")

						arg_195_1:RecordAudio("116292047", var_198_9)
						arg_195_1:RecordAudio("116292047", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_116292", "116292047", "story_v_out_116292.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_116292", "116292047", "story_v_out_116292.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play116292048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 116292048
		arg_199_1.duration_ = 3.4

		local var_199_0 = {
			zh = 2.7,
			ja = 3.4
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
				arg_199_0:Play116292049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.225

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[8].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(116292048)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292048", "story_v_out_116292.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292048", "story_v_out_116292.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_116292", "116292048", "story_v_out_116292.awb")

						arg_199_1:RecordAudio("116292048", var_202_9)
						arg_199_1:RecordAudio("116292048", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_116292", "116292048", "story_v_out_116292.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_116292", "116292048", "story_v_out_116292.awb")
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
	Play116292049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 116292049
		arg_203_1.duration_ = 10.633

		local var_203_0 = {
			zh = 10.633,
			ja = 4.4
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
				arg_203_0:Play116292050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 1

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[327].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(116292049)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292049", "story_v_out_116292.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292049", "story_v_out_116292.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_116292", "116292049", "story_v_out_116292.awb")

						arg_203_1:RecordAudio("116292049", var_206_9)
						arg_203_1:RecordAudio("116292049", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_116292", "116292049", "story_v_out_116292.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_116292", "116292049", "story_v_out_116292.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play116292050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 116292050
		arg_207_1.duration_ = 4.7

		local var_207_0 = {
			zh = 2.8,
			ja = 4.7
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
				arg_207_0:Play116292051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.325

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[28].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, true)
				arg_207_1.iconController_:SetSelectedState("hero")

				arg_207_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(116292050)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292050", "story_v_out_116292.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292050", "story_v_out_116292.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_116292", "116292050", "story_v_out_116292.awb")

						arg_207_1:RecordAudio("116292050", var_210_9)
						arg_207_1:RecordAudio("116292050", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_116292", "116292050", "story_v_out_116292.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_116292", "116292050", "story_v_out_116292.awb")
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
	Play116292051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 116292051
		arg_211_1.duration_ = 5.233

		local var_211_0 = {
			zh = 5.233,
			ja = 2.133
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
				arg_211_0:Play116292052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.4

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[327].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(116292051)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292051", "story_v_out_116292.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292051", "story_v_out_116292.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_116292", "116292051", "story_v_out_116292.awb")

						arg_211_1:RecordAudio("116292051", var_214_9)
						arg_211_1:RecordAudio("116292051", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_116292", "116292051", "story_v_out_116292.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_116292", "116292051", "story_v_out_116292.awb")
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
	Play116292052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 116292052
		arg_215_1.duration_ = 3.6

		local var_215_0 = {
			zh = 3.6,
			ja = 2.466
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
				arg_215_0:Play116292053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.175

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[8].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(116292052)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292052", "story_v_out_116292.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292052", "story_v_out_116292.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_116292", "116292052", "story_v_out_116292.awb")

						arg_215_1:RecordAudio("116292052", var_218_9)
						arg_215_1:RecordAudio("116292052", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_116292", "116292052", "story_v_out_116292.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_116292", "116292052", "story_v_out_116292.awb")
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
	Play116292053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 116292053
		arg_219_1.duration_ = 13.466

		local var_219_0 = {
			zh = 13.466,
			ja = 10.6
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
				arg_219_0:Play116292054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 2

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				local var_222_1 = manager.ui.mainCamera.transform.localPosition
				local var_222_2 = Vector3.New(0, 0, 10) + Vector3.New(var_222_1.x, var_222_1.y, 0)
				local var_222_3 = arg_219_1.bgs_.B13c

				var_222_3.transform.localPosition = var_222_2
				var_222_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_222_4 = var_222_3:GetComponent("SpriteRenderer")

				if var_222_4 and var_222_4.sprite then
					local var_222_5 = (var_222_3.transform.localPosition - var_222_1).z
					local var_222_6 = manager.ui.mainCameraCom_
					local var_222_7 = 2 * var_222_5 * Mathf.Tan(var_222_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_222_8 = var_222_7 * var_222_6.aspect
					local var_222_9 = var_222_4.sprite.bounds.size.x
					local var_222_10 = var_222_4.sprite.bounds.size.y
					local var_222_11 = var_222_8 / var_222_9
					local var_222_12 = var_222_7 / var_222_10
					local var_222_13 = var_222_12 < var_222_11 and var_222_11 or var_222_12

					var_222_3.transform.localScale = Vector3.New(var_222_13, var_222_13, 0)
				end

				for iter_222_0, iter_222_1 in pairs(arg_219_1.bgs_) do
					if iter_222_0 ~= "B13c" then
						iter_222_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_15 = 2

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_15 then
				local var_222_16 = (arg_219_1.time_ - var_222_14) / var_222_15
				local var_222_17 = Color.New(0, 0, 0)

				var_222_17.a = Mathf.Lerp(0, 1, var_222_16)
				arg_219_1.mask_.color = var_222_17
			end

			if arg_219_1.time_ >= var_222_14 + var_222_15 and arg_219_1.time_ < var_222_14 + var_222_15 + arg_222_0 then
				local var_222_18 = Color.New(0, 0, 0)

				var_222_18.a = 1
				arg_219_1.mask_.color = var_222_18
			end

			local var_222_19 = 2

			if var_222_19 < arg_219_1.time_ and arg_219_1.time_ <= var_222_19 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = true

				arg_219_1:SetGaussion(false)
			end

			local var_222_20 = 2

			if var_222_19 <= arg_219_1.time_ and arg_219_1.time_ < var_222_19 + var_222_20 then
				local var_222_21 = (arg_219_1.time_ - var_222_19) / var_222_20
				local var_222_22 = Color.New(0, 0, 0)

				var_222_22.a = Mathf.Lerp(1, 0, var_222_21)
				arg_219_1.mask_.color = var_222_22
			end

			if arg_219_1.time_ >= var_222_19 + var_222_20 and arg_219_1.time_ < var_222_19 + var_222_20 + arg_222_0 then
				local var_222_23 = Color.New(0, 0, 0)
				local var_222_24 = 0

				arg_219_1.mask_.enabled = false
				var_222_23.a = var_222_24
				arg_219_1.mask_.color = var_222_23
			end

			local var_222_25 = 1.98333333333333

			if var_222_25 < arg_219_1.time_ and arg_219_1.time_ <= var_222_25 + arg_222_0 then
				arg_219_1.screenFilterGo_:SetActive(false)
			end

			local var_222_26 = 0.0166666666666667

			if var_222_25 <= arg_219_1.time_ and arg_219_1.time_ < var_222_25 + var_222_26 then
				local var_222_27 = (arg_219_1.time_ - var_222_25) / var_222_26

				arg_219_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_222_27)
			end

			if arg_219_1.time_ >= var_222_25 + var_222_26 and arg_219_1.time_ < var_222_25 + var_222_26 + arg_222_0 then
				arg_219_1.screenFilterEffect_.weight = 0
			end

			if arg_219_1.frameCnt_ <= 1 then
				arg_219_1.dialog_:SetActive(false)
			end

			local var_222_28 = 4
			local var_222_29 = 1.175

			if var_222_28 < arg_219_1.time_ and arg_219_1.time_ <= var_222_28 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				arg_219_1.dialog_:SetActive(true)

				local var_222_30 = LeanTween.value(arg_219_1.dialog_, 0, 1, 0.3)

				var_222_30:setOnUpdate(LuaHelper.FloatAction(function(arg_223_0)
					arg_219_1.dialogCg_.alpha = arg_223_0
				end))
				var_222_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_219_1.dialog_)
					var_222_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_219_1.duration_ = arg_219_1.duration_ + 0.3

				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_31 = arg_219_1:FormatText(StoryNameCfg[28].name)

				arg_219_1.leftNameTxt_.text = var_222_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_32 = arg_219_1:GetWordFromCfg(116292053)
				local var_222_33 = arg_219_1:FormatText(var_222_32.content)

				arg_219_1.text_.text = var_222_33

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_34 = 47
				local var_222_35 = utf8.len(var_222_33)
				local var_222_36 = var_222_34 <= 0 and var_222_29 or var_222_29 * (var_222_35 / var_222_34)

				if var_222_36 > 0 and var_222_29 < var_222_36 then
					arg_219_1.talkMaxDuration = var_222_36
					var_222_28 = var_222_28 + 0.3

					if var_222_36 + var_222_28 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_36 + var_222_28
					end
				end

				arg_219_1.text_.text = var_222_33
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292053", "story_v_out_116292.awb") ~= 0 then
					local var_222_37 = manager.audio:GetVoiceLength("story_v_out_116292", "116292053", "story_v_out_116292.awb") / 1000

					if var_222_37 + var_222_28 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_37 + var_222_28
					end

					if var_222_32.prefab_name ~= "" and arg_219_1.actors_[var_222_32.prefab_name] ~= nil then
						local var_222_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_32.prefab_name].transform, "story_v_out_116292", "116292053", "story_v_out_116292.awb")

						arg_219_1:RecordAudio("116292053", var_222_38)
						arg_219_1:RecordAudio("116292053", var_222_38)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_116292", "116292053", "story_v_out_116292.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_116292", "116292053", "story_v_out_116292.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_39 = var_222_28 + 0.3
			local var_222_40 = math.max(var_222_29, arg_219_1.talkMaxDuration)

			if var_222_39 <= arg_219_1.time_ and arg_219_1.time_ < var_222_39 + var_222_40 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_39) / var_222_40

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_39 + var_222_40 and arg_219_1.time_ < var_222_39 + var_222_40 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play116292054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 116292054
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play116292055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_2 = arg_225_1:GetWordFromCfg(116292054)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 40
				local var_228_5 = utf8.len(var_228_3)
				local var_228_6 = var_228_4 <= 0 and var_228_1 or var_228_1 * (var_228_5 / var_228_4)

				if var_228_6 > 0 and var_228_1 < var_228_6 then
					arg_225_1.talkMaxDuration = var_228_6

					if var_228_6 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_6 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_3
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_7 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_7 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_7

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_7 and arg_225_1.time_ < var_228_0 + var_228_7 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play116292055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 116292055
		arg_229_1.duration_ = 7.2

		local var_229_0 = {
			zh = 7.2,
			ja = 6.766
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
				arg_229_0:Play116292056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1059ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1059ui_story == nil then
				arg_229_1.var_.characterEffect1059ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1059ui_story then
					arg_229_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1059ui_story then
				arg_229_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_232_4 = 0

			if var_232_4 < arg_229_1.time_ and arg_229_1.time_ <= var_232_4 + arg_232_0 then
				arg_229_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_232_5 = arg_229_1.actors_["1059ui_story"].transform
			local var_232_6 = 0

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.var_.moveOldPos1059ui_story = var_232_5.localPosition
			end

			local var_232_7 = 0.001

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_7 then
				local var_232_8 = (arg_229_1.time_ - var_232_6) / var_232_7
				local var_232_9 = Vector3.New(0, -1.05, -6)

				var_232_5.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1059ui_story, var_232_9, var_232_8)

				local var_232_10 = manager.ui.mainCamera.transform.position - var_232_5.position

				var_232_5.forward = Vector3.New(var_232_10.x, var_232_10.y, var_232_10.z)

				local var_232_11 = var_232_5.localEulerAngles

				var_232_11.z = 0
				var_232_11.x = 0
				var_232_5.localEulerAngles = var_232_11
			end

			if arg_229_1.time_ >= var_232_6 + var_232_7 and arg_229_1.time_ < var_232_6 + var_232_7 + arg_232_0 then
				var_232_5.localPosition = Vector3.New(0, -1.05, -6)

				local var_232_12 = manager.ui.mainCamera.transform.position - var_232_5.position

				var_232_5.forward = Vector3.New(var_232_12.x, var_232_12.y, var_232_12.z)

				local var_232_13 = var_232_5.localEulerAngles

				var_232_13.z = 0
				var_232_13.x = 0
				var_232_5.localEulerAngles = var_232_13
			end

			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 then
				arg_229_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_232_15 = 0
			local var_232_16 = 0.825

			if var_232_15 < arg_229_1.time_ and arg_229_1.time_ <= var_232_15 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_17 = arg_229_1:FormatText(StoryNameCfg[28].name)

				arg_229_1.leftNameTxt_.text = var_232_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_18 = arg_229_1:GetWordFromCfg(116292055)
				local var_232_19 = arg_229_1:FormatText(var_232_18.content)

				arg_229_1.text_.text = var_232_19

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_20 = 33
				local var_232_21 = utf8.len(var_232_19)
				local var_232_22 = var_232_20 <= 0 and var_232_16 or var_232_16 * (var_232_21 / var_232_20)

				if var_232_22 > 0 and var_232_16 < var_232_22 then
					arg_229_1.talkMaxDuration = var_232_22

					if var_232_22 + var_232_15 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_22 + var_232_15
					end
				end

				arg_229_1.text_.text = var_232_19
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292055", "story_v_out_116292.awb") ~= 0 then
					local var_232_23 = manager.audio:GetVoiceLength("story_v_out_116292", "116292055", "story_v_out_116292.awb") / 1000

					if var_232_23 + var_232_15 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_23 + var_232_15
					end

					if var_232_18.prefab_name ~= "" and arg_229_1.actors_[var_232_18.prefab_name] ~= nil then
						local var_232_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_18.prefab_name].transform, "story_v_out_116292", "116292055", "story_v_out_116292.awb")

						arg_229_1:RecordAudio("116292055", var_232_24)
						arg_229_1:RecordAudio("116292055", var_232_24)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_116292", "116292055", "story_v_out_116292.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_116292", "116292055", "story_v_out_116292.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_25 = math.max(var_232_16, arg_229_1.talkMaxDuration)

			if var_232_15 <= arg_229_1.time_ and arg_229_1.time_ < var_232_15 + var_232_25 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_15) / var_232_25

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_15 + var_232_25 and arg_229_1.time_ < var_232_15 + var_232_25 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play116292056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 116292056
		arg_233_1.duration_ = 6.6

		local var_233_0 = {
			zh = 6.6,
			ja = 3.566
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
				arg_233_0:Play116292057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_236_1 = 0
			local var_236_2 = 0.825

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_3 = arg_233_1:FormatText(StoryNameCfg[28].name)

				arg_233_1.leftNameTxt_.text = var_236_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_4 = arg_233_1:GetWordFromCfg(116292056)
				local var_236_5 = arg_233_1:FormatText(var_236_4.content)

				arg_233_1.text_.text = var_236_5

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_6 = 33
				local var_236_7 = utf8.len(var_236_5)
				local var_236_8 = var_236_6 <= 0 and var_236_2 or var_236_2 * (var_236_7 / var_236_6)

				if var_236_8 > 0 and var_236_2 < var_236_8 then
					arg_233_1.talkMaxDuration = var_236_8

					if var_236_8 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_1
					end
				end

				arg_233_1.text_.text = var_236_5
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292056", "story_v_out_116292.awb") ~= 0 then
					local var_236_9 = manager.audio:GetVoiceLength("story_v_out_116292", "116292056", "story_v_out_116292.awb") / 1000

					if var_236_9 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_9 + var_236_1
					end

					if var_236_4.prefab_name ~= "" and arg_233_1.actors_[var_236_4.prefab_name] ~= nil then
						local var_236_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_4.prefab_name].transform, "story_v_out_116292", "116292056", "story_v_out_116292.awb")

						arg_233_1:RecordAudio("116292056", var_236_10)
						arg_233_1:RecordAudio("116292056", var_236_10)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_116292", "116292056", "story_v_out_116292.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_116292", "116292056", "story_v_out_116292.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_11 = math.max(var_236_2, arg_233_1.talkMaxDuration)

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_11 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_1) / var_236_11

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_1 + var_236_11 and arg_233_1.time_ < var_236_1 + var_236_11 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play116292057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 116292057
		arg_237_1.duration_ = 7.7

		local var_237_0 = {
			zh = 7.666,
			ja = 7.7
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
				arg_237_0:Play116292058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_2")
			end

			local var_240_2 = 0
			local var_240_3 = 0.975

			if var_240_2 < arg_237_1.time_ and arg_237_1.time_ <= var_240_2 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_4 = arg_237_1:FormatText(StoryNameCfg[28].name)

				arg_237_1.leftNameTxt_.text = var_240_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_5 = arg_237_1:GetWordFromCfg(116292057)
				local var_240_6 = arg_237_1:FormatText(var_240_5.content)

				arg_237_1.text_.text = var_240_6

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_7 = 39
				local var_240_8 = utf8.len(var_240_6)
				local var_240_9 = var_240_7 <= 0 and var_240_3 or var_240_3 * (var_240_8 / var_240_7)

				if var_240_9 > 0 and var_240_3 < var_240_9 then
					arg_237_1.talkMaxDuration = var_240_9

					if var_240_9 + var_240_2 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_9 + var_240_2
					end
				end

				arg_237_1.text_.text = var_240_6
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292057", "story_v_out_116292.awb") ~= 0 then
					local var_240_10 = manager.audio:GetVoiceLength("story_v_out_116292", "116292057", "story_v_out_116292.awb") / 1000

					if var_240_10 + var_240_2 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_10 + var_240_2
					end

					if var_240_5.prefab_name ~= "" and arg_237_1.actors_[var_240_5.prefab_name] ~= nil then
						local var_240_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_5.prefab_name].transform, "story_v_out_116292", "116292057", "story_v_out_116292.awb")

						arg_237_1:RecordAudio("116292057", var_240_11)
						arg_237_1:RecordAudio("116292057", var_240_11)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_116292", "116292057", "story_v_out_116292.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_116292", "116292057", "story_v_out_116292.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_12 = math.max(var_240_3, arg_237_1.talkMaxDuration)

			if var_240_2 <= arg_237_1.time_ and arg_237_1.time_ < var_240_2 + var_240_12 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_2) / var_240_12

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_2 + var_240_12 and arg_237_1.time_ < var_240_2 + var_240_12 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play116292058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 116292058
		arg_241_1.duration_ = 1.7

		local var_241_0 = {
			zh = 1.7,
			ja = 1.1
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
				arg_241_0:Play116292059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1059ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1059ui_story == nil then
				arg_241_1.var_.characterEffect1059ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1059ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1059ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1059ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1059ui_story.fillRatio = var_244_5
			end

			local var_244_6 = 0
			local var_244_7 = 0.15

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[327].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, true)
				arg_241_1.iconController_:SetSelectedState("hero")

				arg_241_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(116292058)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 6
				local var_244_12 = utf8.len(var_244_10)
				local var_244_13 = var_244_11 <= 0 and var_244_7 or var_244_7 * (var_244_12 / var_244_11)

				if var_244_13 > 0 and var_244_7 < var_244_13 then
					arg_241_1.talkMaxDuration = var_244_13

					if var_244_13 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_13 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_10
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292058", "story_v_out_116292.awb") ~= 0 then
					local var_244_14 = manager.audio:GetVoiceLength("story_v_out_116292", "116292058", "story_v_out_116292.awb") / 1000

					if var_244_14 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_14 + var_244_6
					end

					if var_244_9.prefab_name ~= "" and arg_241_1.actors_[var_244_9.prefab_name] ~= nil then
						local var_244_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_9.prefab_name].transform, "story_v_out_116292", "116292058", "story_v_out_116292.awb")

						arg_241_1:RecordAudio("116292058", var_244_15)
						arg_241_1:RecordAudio("116292058", var_244_15)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_116292", "116292058", "story_v_out_116292.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_116292", "116292058", "story_v_out_116292.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_16 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_16 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_16

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_16 and arg_241_1.time_ < var_244_6 + var_244_16 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play116292059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 116292059
		arg_245_1.duration_ = 13.433

		local var_245_0 = {
			zh = 12.1,
			ja = 13.433
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
				arg_245_0:Play116292060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1059ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1059ui_story == nil then
				arg_245_1.var_.characterEffect1059ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1059ui_story then
					arg_245_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1059ui_story then
				arg_245_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_248_4 = 0

			if var_248_4 < arg_245_1.time_ and arg_245_1.time_ <= var_248_4 + arg_248_0 then
				arg_245_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_248_5 = 0
			local var_248_6 = 1.3

			if var_248_5 < arg_245_1.time_ and arg_245_1.time_ <= var_248_5 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_7 = arg_245_1:FormatText(StoryNameCfg[28].name)

				arg_245_1.leftNameTxt_.text = var_248_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_8 = arg_245_1:GetWordFromCfg(116292059)
				local var_248_9 = arg_245_1:FormatText(var_248_8.content)

				arg_245_1.text_.text = var_248_9

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_10 = 52
				local var_248_11 = utf8.len(var_248_9)
				local var_248_12 = var_248_10 <= 0 and var_248_6 or var_248_6 * (var_248_11 / var_248_10)

				if var_248_12 > 0 and var_248_6 < var_248_12 then
					arg_245_1.talkMaxDuration = var_248_12

					if var_248_12 + var_248_5 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_12 + var_248_5
					end
				end

				arg_245_1.text_.text = var_248_9
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292059", "story_v_out_116292.awb") ~= 0 then
					local var_248_13 = manager.audio:GetVoiceLength("story_v_out_116292", "116292059", "story_v_out_116292.awb") / 1000

					if var_248_13 + var_248_5 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_5
					end

					if var_248_8.prefab_name ~= "" and arg_245_1.actors_[var_248_8.prefab_name] ~= nil then
						local var_248_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_8.prefab_name].transform, "story_v_out_116292", "116292059", "story_v_out_116292.awb")

						arg_245_1:RecordAudio("116292059", var_248_14)
						arg_245_1:RecordAudio("116292059", var_248_14)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_116292", "116292059", "story_v_out_116292.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_116292", "116292059", "story_v_out_116292.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_15 = math.max(var_248_6, arg_245_1.talkMaxDuration)

			if var_248_5 <= arg_245_1.time_ and arg_245_1.time_ < var_248_5 + var_248_15 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_5) / var_248_15

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_5 + var_248_15 and arg_245_1.time_ < var_248_5 + var_248_15 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play116292060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 116292060
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play116292061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1059ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1059ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, 100, 0)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1059ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, 100, 0)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = 0
			local var_252_10 = 1

			if var_252_9 < arg_249_1.time_ and arg_249_1.time_ <= var_252_9 + arg_252_0 then
				local var_252_11 = "play"
				local var_252_12 = "effect"

				arg_249_1:AudioAction(var_252_11, var_252_12, "se_story_16", "se_story_16_arch", "")
			end

			local var_252_13 = 0
			local var_252_14 = 0.5

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(116292060)
				local var_252_16 = arg_249_1:FormatText(var_252_15.content)

				arg_249_1.text_.text = var_252_16

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_17 = 20
				local var_252_18 = utf8.len(var_252_16)
				local var_252_19 = var_252_17 <= 0 and var_252_14 or var_252_14 * (var_252_18 / var_252_17)

				if var_252_19 > 0 and var_252_14 < var_252_19 then
					arg_249_1.talkMaxDuration = var_252_19

					if var_252_19 + var_252_13 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_19 + var_252_13
					end
				end

				arg_249_1.text_.text = var_252_16
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_20 = math.max(var_252_14, arg_249_1.talkMaxDuration)

			if var_252_13 <= arg_249_1.time_ and arg_249_1.time_ < var_252_13 + var_252_20 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_13) / var_252_20

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_13 + var_252_20 and arg_249_1.time_ < var_252_13 + var_252_20 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play116292061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 116292061
		arg_253_1.duration_ = 6.3

		local var_253_0 = {
			zh = 4.266,
			ja = 6.3
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
				arg_253_0:Play116292062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.4

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[28].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(116292061)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292061", "story_v_out_116292.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292061", "story_v_out_116292.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_116292", "116292061", "story_v_out_116292.awb")

						arg_253_1:RecordAudio("116292061", var_256_9)
						arg_253_1:RecordAudio("116292061", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_116292", "116292061", "story_v_out_116292.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_116292", "116292061", "story_v_out_116292.awb")
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
	Play116292062 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 116292062
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play116292063(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1.125

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_2 = arg_257_1:GetWordFromCfg(116292062)
				local var_260_3 = arg_257_1:FormatText(var_260_2.content)

				arg_257_1.text_.text = var_260_3

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_4 = 45
				local var_260_5 = utf8.len(var_260_3)
				local var_260_6 = var_260_4 <= 0 and var_260_1 or var_260_1 * (var_260_5 / var_260_4)

				if var_260_6 > 0 and var_260_1 < var_260_6 then
					arg_257_1.talkMaxDuration = var_260_6

					if var_260_6 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_6 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_3
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_7 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_7 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_7

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_7 and arg_257_1.time_ < var_260_0 + var_260_7 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play116292063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 116292063
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play116292064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.7

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_2 = arg_261_1:GetWordFromCfg(116292063)
				local var_264_3 = arg_261_1:FormatText(var_264_2.content)

				arg_261_1.text_.text = var_264_3

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_4 = 28
				local var_264_5 = utf8.len(var_264_3)
				local var_264_6 = var_264_4 <= 0 and var_264_1 or var_264_1 * (var_264_5 / var_264_4)

				if var_264_6 > 0 and var_264_1 < var_264_6 then
					arg_261_1.talkMaxDuration = var_264_6

					if var_264_6 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_6 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_3
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_7 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_7 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_7

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_7 and arg_261_1.time_ < var_264_0 + var_264_7 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play116292064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 116292064
		arg_265_1.duration_ = 6.633

		local var_265_0 = {
			zh = 4.466,
			ja = 6.633
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
				arg_265_0:Play116292065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.3

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[327].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, true)
				arg_265_1.iconController_:SetSelectedState("hero")

				arg_265_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(116292064)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 12
				local var_268_6 = utf8.len(var_268_4)
				local var_268_7 = var_268_5 <= 0 and var_268_1 or var_268_1 * (var_268_6 / var_268_5)

				if var_268_7 > 0 and var_268_1 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_4
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292064", "story_v_out_116292.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292064", "story_v_out_116292.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_116292", "116292064", "story_v_out_116292.awb")

						arg_265_1:RecordAudio("116292064", var_268_9)
						arg_265_1:RecordAudio("116292064", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_116292", "116292064", "story_v_out_116292.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_116292", "116292064", "story_v_out_116292.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_10 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_10 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_10

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_10 and arg_265_1.time_ < var_268_0 + var_268_10 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play116292065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 116292065
		arg_269_1.duration_ = 5.566

		local var_269_0 = {
			zh = 5.566,
			ja = 4.033
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
				arg_269_0:Play116292066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1059ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1059ui_story == nil then
				arg_269_1.var_.characterEffect1059ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1059ui_story then
					arg_269_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1059ui_story then
				arg_269_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_272_4 = 0

			if var_272_4 < arg_269_1.time_ and arg_269_1.time_ <= var_272_4 + arg_272_0 then
				arg_269_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_272_5 = 0

			if var_272_5 < arg_269_1.time_ and arg_269_1.time_ <= var_272_5 + arg_272_0 then
				arg_269_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_272_6 = arg_269_1.actors_["1059ui_story"].transform
			local var_272_7 = 0

			if var_272_7 < arg_269_1.time_ and arg_269_1.time_ <= var_272_7 + arg_272_0 then
				arg_269_1.var_.moveOldPos1059ui_story = var_272_6.localPosition
			end

			local var_272_8 = 0.001

			if var_272_7 <= arg_269_1.time_ and arg_269_1.time_ < var_272_7 + var_272_8 then
				local var_272_9 = (arg_269_1.time_ - var_272_7) / var_272_8
				local var_272_10 = Vector3.New(0, -1.05, -6)

				var_272_6.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1059ui_story, var_272_10, var_272_9)

				local var_272_11 = manager.ui.mainCamera.transform.position - var_272_6.position

				var_272_6.forward = Vector3.New(var_272_11.x, var_272_11.y, var_272_11.z)

				local var_272_12 = var_272_6.localEulerAngles

				var_272_12.z = 0
				var_272_12.x = 0
				var_272_6.localEulerAngles = var_272_12
			end

			if arg_269_1.time_ >= var_272_7 + var_272_8 and arg_269_1.time_ < var_272_7 + var_272_8 + arg_272_0 then
				var_272_6.localPosition = Vector3.New(0, -1.05, -6)

				local var_272_13 = manager.ui.mainCamera.transform.position - var_272_6.position

				var_272_6.forward = Vector3.New(var_272_13.x, var_272_13.y, var_272_13.z)

				local var_272_14 = var_272_6.localEulerAngles

				var_272_14.z = 0
				var_272_14.x = 0
				var_272_6.localEulerAngles = var_272_14
			end

			local var_272_15 = 0
			local var_272_16 = 0.55

			if var_272_15 < arg_269_1.time_ and arg_269_1.time_ <= var_272_15 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_17 = arg_269_1:FormatText(StoryNameCfg[28].name)

				arg_269_1.leftNameTxt_.text = var_272_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_18 = arg_269_1:GetWordFromCfg(116292065)
				local var_272_19 = arg_269_1:FormatText(var_272_18.content)

				arg_269_1.text_.text = var_272_19

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_20 = 22
				local var_272_21 = utf8.len(var_272_19)
				local var_272_22 = var_272_20 <= 0 and var_272_16 or var_272_16 * (var_272_21 / var_272_20)

				if var_272_22 > 0 and var_272_16 < var_272_22 then
					arg_269_1.talkMaxDuration = var_272_22

					if var_272_22 + var_272_15 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_22 + var_272_15
					end
				end

				arg_269_1.text_.text = var_272_19
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292065", "story_v_out_116292.awb") ~= 0 then
					local var_272_23 = manager.audio:GetVoiceLength("story_v_out_116292", "116292065", "story_v_out_116292.awb") / 1000

					if var_272_23 + var_272_15 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_23 + var_272_15
					end

					if var_272_18.prefab_name ~= "" and arg_269_1.actors_[var_272_18.prefab_name] ~= nil then
						local var_272_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_18.prefab_name].transform, "story_v_out_116292", "116292065", "story_v_out_116292.awb")

						arg_269_1:RecordAudio("116292065", var_272_24)
						arg_269_1:RecordAudio("116292065", var_272_24)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_116292", "116292065", "story_v_out_116292.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_116292", "116292065", "story_v_out_116292.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_25 = math.max(var_272_16, arg_269_1.talkMaxDuration)

			if var_272_15 <= arg_269_1.time_ and arg_269_1.time_ < var_272_15 + var_272_25 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_15) / var_272_25

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_15 + var_272_25 and arg_269_1.time_ < var_272_15 + var_272_25 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play116292066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 116292066
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play116292067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1059ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.characterEffect1059ui_story == nil then
				arg_273_1.var_.characterEffect1059ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.2

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect1059ui_story then
					local var_276_4 = Mathf.Lerp(0, 0.5, var_276_3)

					arg_273_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1059ui_story.fillRatio = var_276_4
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect1059ui_story then
				local var_276_5 = 0.5

				arg_273_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1059ui_story.fillRatio = var_276_5
			end

			local var_276_6 = 0
			local var_276_7 = 0.2

			if var_276_6 < arg_273_1.time_ and arg_273_1.time_ <= var_276_6 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_8 = arg_273_1:FormatText(StoryNameCfg[7].name)

				arg_273_1.leftNameTxt_.text = var_276_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_9 = arg_273_1:GetWordFromCfg(116292066)
				local var_276_10 = arg_273_1:FormatText(var_276_9.content)

				arg_273_1.text_.text = var_276_10

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_11 = 8
				local var_276_12 = utf8.len(var_276_10)
				local var_276_13 = var_276_11 <= 0 and var_276_7 or var_276_7 * (var_276_12 / var_276_11)

				if var_276_13 > 0 and var_276_7 < var_276_13 then
					arg_273_1.talkMaxDuration = var_276_13

					if var_276_13 + var_276_6 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_13 + var_276_6
					end
				end

				arg_273_1.text_.text = var_276_10
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_14 = math.max(var_276_7, arg_273_1.talkMaxDuration)

			if var_276_6 <= arg_273_1.time_ and arg_273_1.time_ < var_276_6 + var_276_14 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_6) / var_276_14

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_6 + var_276_14 and arg_273_1.time_ < var_276_6 + var_276_14 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play116292067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 116292067
		arg_277_1.duration_ = 2.8

		local var_277_0 = {
			zh = 2.8,
			ja = 2.433333333332
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
				arg_277_0:Play116292068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1059ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1059ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, 100, 0)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1059ui_story, var_280_4, var_280_3)

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

			local var_280_9 = "10025ui_story"

			if arg_277_1.actors_[var_280_9] == nil then
				local var_280_10 = Object.Instantiate(Asset.Load("Char/" .. var_280_9), arg_277_1.stage_.transform)

				var_280_10.name = var_280_9
				var_280_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_277_1.actors_[var_280_9] = var_280_10

				local var_280_11 = var_280_10:GetComponentInChildren(typeof(CharacterEffect))

				var_280_11.enabled = true

				local var_280_12 = GameObjectTools.GetOrAddComponent(var_280_10, typeof(DynamicBoneHelper))

				if var_280_12 then
					var_280_12:EnableDynamicBone(false)
				end

				arg_277_1:ShowWeapon(var_280_11.transform, false)

				arg_277_1.var_[var_280_9 .. "Animator"] = var_280_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_277_1.var_[var_280_9 .. "Animator"].applyRootMotion = true
				arg_277_1.var_[var_280_9 .. "LipSync"] = var_280_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_280_13 = arg_277_1.actors_["10025ui_story"].transform
			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				arg_277_1.var_.moveOldPos10025ui_story = var_280_13.localPosition
			end

			local var_280_15 = 0.001

			if var_280_14 <= arg_277_1.time_ and arg_277_1.time_ < var_280_14 + var_280_15 then
				local var_280_16 = (arg_277_1.time_ - var_280_14) / var_280_15
				local var_280_17 = Vector3.New(0, -1.1, -5.9)

				var_280_13.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10025ui_story, var_280_17, var_280_16)

				local var_280_18 = manager.ui.mainCamera.transform.position - var_280_13.position

				var_280_13.forward = Vector3.New(var_280_18.x, var_280_18.y, var_280_18.z)

				local var_280_19 = var_280_13.localEulerAngles

				var_280_19.z = 0
				var_280_19.x = 0
				var_280_13.localEulerAngles = var_280_19
			end

			if arg_277_1.time_ >= var_280_14 + var_280_15 and arg_277_1.time_ < var_280_14 + var_280_15 + arg_280_0 then
				var_280_13.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_280_20 = manager.ui.mainCamera.transform.position - var_280_13.position

				var_280_13.forward = Vector3.New(var_280_20.x, var_280_20.y, var_280_20.z)

				local var_280_21 = var_280_13.localEulerAngles

				var_280_21.z = 0
				var_280_21.x = 0
				var_280_13.localEulerAngles = var_280_21
			end

			local var_280_22 = arg_277_1.actors_["10025ui_story"]
			local var_280_23 = 0

			if var_280_23 < arg_277_1.time_ and arg_277_1.time_ <= var_280_23 + arg_280_0 and arg_277_1.var_.characterEffect10025ui_story == nil then
				arg_277_1.var_.characterEffect10025ui_story = var_280_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_24 = 0.2

			if var_280_23 <= arg_277_1.time_ and arg_277_1.time_ < var_280_23 + var_280_24 then
				local var_280_25 = (arg_277_1.time_ - var_280_23) / var_280_24

				if arg_277_1.var_.characterEffect10025ui_story then
					arg_277_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_23 + var_280_24 and arg_277_1.time_ < var_280_23 + var_280_24 + arg_280_0 and arg_277_1.var_.characterEffect10025ui_story then
				arg_277_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_280_26 = 0

			if var_280_26 < arg_277_1.time_ and arg_277_1.time_ <= var_280_26 + arg_280_0 then
				arg_277_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_1")
			end

			local var_280_27 = 0

			if var_280_27 < arg_277_1.time_ and arg_277_1.time_ <= var_280_27 + arg_280_0 then
				arg_277_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_280_28 = 0
			local var_280_29 = 0.175

			if var_280_28 < arg_277_1.time_ and arg_277_1.time_ <= var_280_28 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_30 = arg_277_1:FormatText(StoryNameCfg[328].name)

				arg_277_1.leftNameTxt_.text = var_280_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_31 = arg_277_1:GetWordFromCfg(116292067)
				local var_280_32 = arg_277_1:FormatText(var_280_31.content)

				arg_277_1.text_.text = var_280_32

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_33 = 7
				local var_280_34 = utf8.len(var_280_32)
				local var_280_35 = var_280_33 <= 0 and var_280_29 or var_280_29 * (var_280_34 / var_280_33)

				if var_280_35 > 0 and var_280_29 < var_280_35 then
					arg_277_1.talkMaxDuration = var_280_35

					if var_280_35 + var_280_28 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_35 + var_280_28
					end
				end

				arg_277_1.text_.text = var_280_32
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292067", "story_v_out_116292.awb") ~= 0 then
					local var_280_36 = manager.audio:GetVoiceLength("story_v_out_116292", "116292067", "story_v_out_116292.awb") / 1000

					if var_280_36 + var_280_28 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_36 + var_280_28
					end

					if var_280_31.prefab_name ~= "" and arg_277_1.actors_[var_280_31.prefab_name] ~= nil then
						local var_280_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_31.prefab_name].transform, "story_v_out_116292", "116292067", "story_v_out_116292.awb")

						arg_277_1:RecordAudio("116292067", var_280_37)
						arg_277_1:RecordAudio("116292067", var_280_37)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_116292", "116292067", "story_v_out_116292.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_116292", "116292067", "story_v_out_116292.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_38 = math.max(var_280_29, arg_277_1.talkMaxDuration)

			if var_280_28 <= arg_277_1.time_ and arg_277_1.time_ < var_280_28 + var_280_38 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_28) / var_280_38

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_28 + var_280_38 and arg_277_1.time_ < var_280_28 + var_280_38 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play116292068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 116292068
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play116292069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10025ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos10025ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, 100, 0)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10025ui_story, var_284_4, var_284_3)

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

			local var_284_9 = 0
			local var_284_10 = 1.025

			if var_284_9 < arg_281_1.time_ and arg_281_1.time_ <= var_284_9 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_11 = arg_281_1:GetWordFromCfg(116292068)
				local var_284_12 = arg_281_1:FormatText(var_284_11.content)

				arg_281_1.text_.text = var_284_12

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_13 = 41
				local var_284_14 = utf8.len(var_284_12)
				local var_284_15 = var_284_13 <= 0 and var_284_10 or var_284_10 * (var_284_14 / var_284_13)

				if var_284_15 > 0 and var_284_10 < var_284_15 then
					arg_281_1.talkMaxDuration = var_284_15

					if var_284_15 + var_284_9 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_15 + var_284_9
					end
				end

				arg_281_1.text_.text = var_284_12
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_16 = math.max(var_284_10, arg_281_1.talkMaxDuration)

			if var_284_9 <= arg_281_1.time_ and arg_281_1.time_ < var_284_9 + var_284_16 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_9) / var_284_16

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_9 + var_284_16 and arg_281_1.time_ < var_284_9 + var_284_16 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play116292069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 116292069
		arg_285_1.duration_ = 8.3

		local var_285_0 = {
			zh = 6.2,
			ja = 8.3
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
				arg_285_0:Play116292070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.35

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[327].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(116292069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292069", "story_v_out_116292.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_116292", "116292069", "story_v_out_116292.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_116292", "116292069", "story_v_out_116292.awb")

						arg_285_1:RecordAudio("116292069", var_288_9)
						arg_285_1:RecordAudio("116292069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_116292", "116292069", "story_v_out_116292.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_116292", "116292069", "story_v_out_116292.awb")
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
	Play116292070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 116292070
		arg_289_1.duration_ = 4.566

		local var_289_0 = {
			zh = 4.5,
			ja = 4.566
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
				arg_289_0:Play116292071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1184ui_story"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos1184ui_story = var_292_0.localPosition

				local var_292_2 = "1184ui_story"

				arg_289_1:ShowWeapon(arg_289_1.var_[var_292_2 .. "Animator"].transform, false)
			end

			local var_292_3 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_3 then
				local var_292_4 = (arg_289_1.time_ - var_292_1) / var_292_3
				local var_292_5 = Vector3.New(0, -0.97, -6)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1184ui_story, var_292_5, var_292_4)

				local var_292_6 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_6.x, var_292_6.y, var_292_6.z)

				local var_292_7 = var_292_0.localEulerAngles

				var_292_7.z = 0
				var_292_7.x = 0
				var_292_0.localEulerAngles = var_292_7
			end

			if arg_289_1.time_ >= var_292_1 + var_292_3 and arg_289_1.time_ < var_292_1 + var_292_3 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_292_8 = manager.ui.mainCamera.transform.position - var_292_0.position

				var_292_0.forward = Vector3.New(var_292_8.x, var_292_8.y, var_292_8.z)

				local var_292_9 = var_292_0.localEulerAngles

				var_292_9.z = 0
				var_292_9.x = 0
				var_292_0.localEulerAngles = var_292_9
			end

			local var_292_10 = "1028ui_story"

			if arg_289_1.actors_[var_292_10] == nil then
				local var_292_11 = Object.Instantiate(Asset.Load("Char/" .. var_292_10), arg_289_1.stage_.transform)

				var_292_11.name = var_292_10
				var_292_11.transform.localPosition = Vector3.New(0, 100, 0)
				arg_289_1.actors_[var_292_10] = var_292_11

				local var_292_12 = var_292_11:GetComponentInChildren(typeof(CharacterEffect))

				var_292_12.enabled = true

				local var_292_13 = GameObjectTools.GetOrAddComponent(var_292_11, typeof(DynamicBoneHelper))

				if var_292_13 then
					var_292_13:EnableDynamicBone(false)
				end

				arg_289_1:ShowWeapon(var_292_12.transform, false)

				arg_289_1.var_[var_292_10 .. "Animator"] = var_292_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_289_1.var_[var_292_10 .. "Animator"].applyRootMotion = true
				arg_289_1.var_[var_292_10 .. "LipSync"] = var_292_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_292_14 = arg_289_1.actors_["1028ui_story"]
			local var_292_15 = 0

			if var_292_15 < arg_289_1.time_ and arg_289_1.time_ <= var_292_15 + arg_292_0 and arg_289_1.var_.characterEffect1028ui_story == nil then
				arg_289_1.var_.characterEffect1028ui_story = var_292_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_16 = 0.2

			if var_292_15 <= arg_289_1.time_ and arg_289_1.time_ < var_292_15 + var_292_16 then
				local var_292_17 = (arg_289_1.time_ - var_292_15) / var_292_16

				if arg_289_1.var_.characterEffect1028ui_story then
					local var_292_18 = Mathf.Lerp(0, 0.5, var_292_17)

					arg_289_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_289_1.var_.characterEffect1028ui_story.fillRatio = var_292_18
				end
			end

			if arg_289_1.time_ >= var_292_15 + var_292_16 and arg_289_1.time_ < var_292_15 + var_292_16 + arg_292_0 and arg_289_1.var_.characterEffect1028ui_story then
				local var_292_19 = 0.5

				arg_289_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_289_1.var_.characterEffect1028ui_story.fillRatio = var_292_19
			end

			local var_292_20 = arg_289_1.actors_["1184ui_story"]
			local var_292_21 = 0

			if var_292_21 < arg_289_1.time_ and arg_289_1.time_ <= var_292_21 + arg_292_0 and arg_289_1.var_.characterEffect1184ui_story == nil then
				arg_289_1.var_.characterEffect1184ui_story = var_292_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_22 = 0.2

			if var_292_21 <= arg_289_1.time_ and arg_289_1.time_ < var_292_21 + var_292_22 then
				local var_292_23 = (arg_289_1.time_ - var_292_21) / var_292_22

				if arg_289_1.var_.characterEffect1184ui_story then
					arg_289_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_21 + var_292_22 and arg_289_1.time_ < var_292_21 + var_292_22 + arg_292_0 and arg_289_1.var_.characterEffect1184ui_story then
				arg_289_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_292_24 = 0

			if var_292_24 < arg_289_1.time_ and arg_289_1.time_ <= var_292_24 + arg_292_0 then
				arg_289_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_292_25 = 0

			if var_292_25 < arg_289_1.time_ and arg_289_1.time_ <= var_292_25 + arg_292_0 then
				arg_289_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_292_26 = 0
			local var_292_27 = 0.3

			if var_292_26 < arg_289_1.time_ and arg_289_1.time_ <= var_292_26 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_28 = arg_289_1:FormatText(StoryNameCfg[6].name)

				arg_289_1.leftNameTxt_.text = var_292_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_29 = arg_289_1:GetWordFromCfg(116292070)
				local var_292_30 = arg_289_1:FormatText(var_292_29.content)

				arg_289_1.text_.text = var_292_30

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_31 = 12
				local var_292_32 = utf8.len(var_292_30)
				local var_292_33 = var_292_31 <= 0 and var_292_27 or var_292_27 * (var_292_32 / var_292_31)

				if var_292_33 > 0 and var_292_27 < var_292_33 then
					arg_289_1.talkMaxDuration = var_292_33

					if var_292_33 + var_292_26 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_33 + var_292_26
					end
				end

				arg_289_1.text_.text = var_292_30
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292070", "story_v_out_116292.awb") ~= 0 then
					local var_292_34 = manager.audio:GetVoiceLength("story_v_out_116292", "116292070", "story_v_out_116292.awb") / 1000

					if var_292_34 + var_292_26 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_34 + var_292_26
					end

					if var_292_29.prefab_name ~= "" and arg_289_1.actors_[var_292_29.prefab_name] ~= nil then
						local var_292_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_29.prefab_name].transform, "story_v_out_116292", "116292070", "story_v_out_116292.awb")

						arg_289_1:RecordAudio("116292070", var_292_35)
						arg_289_1:RecordAudio("116292070", var_292_35)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_116292", "116292070", "story_v_out_116292.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_116292", "116292070", "story_v_out_116292.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_36 = math.max(var_292_27, arg_289_1.talkMaxDuration)

			if var_292_26 <= arg_289_1.time_ and arg_289_1.time_ < var_292_26 + var_292_36 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_26) / var_292_36

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_26 + var_292_36 and arg_289_1.time_ < var_292_26 + var_292_36 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play116292071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 116292071
		arg_293_1.duration_ = 13.566

		local var_293_0 = {
			zh = 8.133,
			ja = 13.566
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play116292072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1028ui_story"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect1028ui_story == nil then
				arg_293_1.var_.characterEffect1028ui_story = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.2

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect1028ui_story then
					arg_293_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect1028ui_story then
				arg_293_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_296_4 = arg_293_1.actors_["1184ui_story"]
			local var_296_5 = 0

			if var_296_5 < arg_293_1.time_ and arg_293_1.time_ <= var_296_5 + arg_296_0 and arg_293_1.var_.characterEffect1184ui_story == nil then
				arg_293_1.var_.characterEffect1184ui_story = var_296_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_6 = 0.2

			if var_296_5 <= arg_293_1.time_ and arg_293_1.time_ < var_296_5 + var_296_6 then
				local var_296_7 = (arg_293_1.time_ - var_296_5) / var_296_6

				if arg_293_1.var_.characterEffect1184ui_story then
					local var_296_8 = Mathf.Lerp(0, 0.5, var_296_7)

					arg_293_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1184ui_story.fillRatio = var_296_8
				end
			end

			if arg_293_1.time_ >= var_296_5 + var_296_6 and arg_293_1.time_ < var_296_5 + var_296_6 + arg_296_0 and arg_293_1.var_.characterEffect1184ui_story then
				local var_296_9 = 0.5

				arg_293_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1184ui_story.fillRatio = var_296_9
			end

			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 then
				arg_293_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_296_11 = 0
			local var_296_12 = 0.925

			if var_296_11 < arg_293_1.time_ and arg_293_1.time_ <= var_296_11 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_13 = arg_293_1:FormatText(StoryNameCfg[327].name)

				arg_293_1.leftNameTxt_.text = var_296_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, true)
				arg_293_1.iconController_:SetSelectedState("hero")

				arg_293_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_14 = arg_293_1:GetWordFromCfg(116292071)
				local var_296_15 = arg_293_1:FormatText(var_296_14.content)

				arg_293_1.text_.text = var_296_15

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_16 = 37
				local var_296_17 = utf8.len(var_296_15)
				local var_296_18 = var_296_16 <= 0 and var_296_12 or var_296_12 * (var_296_17 / var_296_16)

				if var_296_18 > 0 and var_296_12 < var_296_18 then
					arg_293_1.talkMaxDuration = var_296_18

					if var_296_18 + var_296_11 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_18 + var_296_11
					end
				end

				arg_293_1.text_.text = var_296_15
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292071", "story_v_out_116292.awb") ~= 0 then
					local var_296_19 = manager.audio:GetVoiceLength("story_v_out_116292", "116292071", "story_v_out_116292.awb") / 1000

					if var_296_19 + var_296_11 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_19 + var_296_11
					end

					if var_296_14.prefab_name ~= "" and arg_293_1.actors_[var_296_14.prefab_name] ~= nil then
						local var_296_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_14.prefab_name].transform, "story_v_out_116292", "116292071", "story_v_out_116292.awb")

						arg_293_1:RecordAudio("116292071", var_296_20)
						arg_293_1:RecordAudio("116292071", var_296_20)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_116292", "116292071", "story_v_out_116292.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_116292", "116292071", "story_v_out_116292.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_21 = math.max(var_296_12, arg_293_1.talkMaxDuration)

			if var_296_11 <= arg_293_1.time_ and arg_293_1.time_ < var_296_11 + var_296_21 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_11) / var_296_21

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_11 + var_296_21 and arg_293_1.time_ < var_296_11 + var_296_21 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play116292072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 116292072
		arg_297_1.duration_ = 7.066

		local var_297_0 = {
			zh = 4.1,
			ja = 7.066
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play116292073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1059ui_story"].transform
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1.var_.moveOldPos1059ui_story = var_300_0.localPosition
			end

			local var_300_2 = 0.001

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2
				local var_300_4 = Vector3.New(-0.7, -1.05, -6)

				var_300_0.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1059ui_story, var_300_4, var_300_3)

				local var_300_5 = manager.ui.mainCamera.transform.position - var_300_0.position

				var_300_0.forward = Vector3.New(var_300_5.x, var_300_5.y, var_300_5.z)

				local var_300_6 = var_300_0.localEulerAngles

				var_300_6.z = 0
				var_300_6.x = 0
				var_300_0.localEulerAngles = var_300_6
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 then
				var_300_0.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_300_7 = manager.ui.mainCamera.transform.position - var_300_0.position

				var_300_0.forward = Vector3.New(var_300_7.x, var_300_7.y, var_300_7.z)

				local var_300_8 = var_300_0.localEulerAngles

				var_300_8.z = 0
				var_300_8.x = 0
				var_300_0.localEulerAngles = var_300_8
			end

			local var_300_9 = arg_297_1.actors_["1028ui_story"].transform
			local var_300_10 = 0

			if var_300_10 < arg_297_1.time_ and arg_297_1.time_ <= var_300_10 + arg_300_0 then
				arg_297_1.var_.moveOldPos1028ui_story = var_300_9.localPosition
			end

			local var_300_11 = 0.001

			if var_300_10 <= arg_297_1.time_ and arg_297_1.time_ < var_300_10 + var_300_11 then
				local var_300_12 = (arg_297_1.time_ - var_300_10) / var_300_11
				local var_300_13 = Vector3.New(0, 100, 0)

				var_300_9.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1028ui_story, var_300_13, var_300_12)

				local var_300_14 = manager.ui.mainCamera.transform.position - var_300_9.position

				var_300_9.forward = Vector3.New(var_300_14.x, var_300_14.y, var_300_14.z)

				local var_300_15 = var_300_9.localEulerAngles

				var_300_15.z = 0
				var_300_15.x = 0
				var_300_9.localEulerAngles = var_300_15
			end

			if arg_297_1.time_ >= var_300_10 + var_300_11 and arg_297_1.time_ < var_300_10 + var_300_11 + arg_300_0 then
				var_300_9.localPosition = Vector3.New(0, 100, 0)

				local var_300_16 = manager.ui.mainCamera.transform.position - var_300_9.position

				var_300_9.forward = Vector3.New(var_300_16.x, var_300_16.y, var_300_16.z)

				local var_300_17 = var_300_9.localEulerAngles

				var_300_17.z = 0
				var_300_17.x = 0
				var_300_9.localEulerAngles = var_300_17
			end

			local var_300_18 = arg_297_1.actors_["1184ui_story"].transform
			local var_300_19 = 0

			if var_300_19 < arg_297_1.time_ and arg_297_1.time_ <= var_300_19 + arg_300_0 then
				arg_297_1.var_.moveOldPos1184ui_story = var_300_18.localPosition
			end

			local var_300_20 = 0.001

			if var_300_19 <= arg_297_1.time_ and arg_297_1.time_ < var_300_19 + var_300_20 then
				local var_300_21 = (arg_297_1.time_ - var_300_19) / var_300_20
				local var_300_22 = Vector3.New(0, 100, 0)

				var_300_18.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1184ui_story, var_300_22, var_300_21)

				local var_300_23 = manager.ui.mainCamera.transform.position - var_300_18.position

				var_300_18.forward = Vector3.New(var_300_23.x, var_300_23.y, var_300_23.z)

				local var_300_24 = var_300_18.localEulerAngles

				var_300_24.z = 0
				var_300_24.x = 0
				var_300_18.localEulerAngles = var_300_24
			end

			if arg_297_1.time_ >= var_300_19 + var_300_20 and arg_297_1.time_ < var_300_19 + var_300_20 + arg_300_0 then
				var_300_18.localPosition = Vector3.New(0, 100, 0)

				local var_300_25 = manager.ui.mainCamera.transform.position - var_300_18.position

				var_300_18.forward = Vector3.New(var_300_25.x, var_300_25.y, var_300_25.z)

				local var_300_26 = var_300_18.localEulerAngles

				var_300_26.z = 0
				var_300_26.x = 0
				var_300_18.localEulerAngles = var_300_26
			end

			local var_300_27 = arg_297_1.actors_["1059ui_story"]
			local var_300_28 = 0

			if var_300_28 < arg_297_1.time_ and arg_297_1.time_ <= var_300_28 + arg_300_0 and arg_297_1.var_.characterEffect1059ui_story == nil then
				arg_297_1.var_.characterEffect1059ui_story = var_300_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_29 = 0.2

			if var_300_28 <= arg_297_1.time_ and arg_297_1.time_ < var_300_28 + var_300_29 then
				local var_300_30 = (arg_297_1.time_ - var_300_28) / var_300_29

				if arg_297_1.var_.characterEffect1059ui_story then
					arg_297_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_28 + var_300_29 and arg_297_1.time_ < var_300_28 + var_300_29 + arg_300_0 and arg_297_1.var_.characterEffect1059ui_story then
				arg_297_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_300_31 = 0

			if var_300_31 < arg_297_1.time_ and arg_297_1.time_ <= var_300_31 + arg_300_0 then
				arg_297_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_300_32 = 0

			if var_300_32 < arg_297_1.time_ and arg_297_1.time_ <= var_300_32 + arg_300_0 then
				arg_297_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_300_33 = 0
			local var_300_34 = 0.475

			if var_300_33 < arg_297_1.time_ and arg_297_1.time_ <= var_300_33 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_35 = arg_297_1:FormatText(StoryNameCfg[28].name)

				arg_297_1.leftNameTxt_.text = var_300_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_36 = arg_297_1:GetWordFromCfg(116292072)
				local var_300_37 = arg_297_1:FormatText(var_300_36.content)

				arg_297_1.text_.text = var_300_37

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_38 = 19
				local var_300_39 = utf8.len(var_300_37)
				local var_300_40 = var_300_38 <= 0 and var_300_34 or var_300_34 * (var_300_39 / var_300_38)

				if var_300_40 > 0 and var_300_34 < var_300_40 then
					arg_297_1.talkMaxDuration = var_300_40

					if var_300_40 + var_300_33 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_40 + var_300_33
					end
				end

				arg_297_1.text_.text = var_300_37
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292072", "story_v_out_116292.awb") ~= 0 then
					local var_300_41 = manager.audio:GetVoiceLength("story_v_out_116292", "116292072", "story_v_out_116292.awb") / 1000

					if var_300_41 + var_300_33 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_41 + var_300_33
					end

					if var_300_36.prefab_name ~= "" and arg_297_1.actors_[var_300_36.prefab_name] ~= nil then
						local var_300_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_36.prefab_name].transform, "story_v_out_116292", "116292072", "story_v_out_116292.awb")

						arg_297_1:RecordAudio("116292072", var_300_42)
						arg_297_1:RecordAudio("116292072", var_300_42)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_116292", "116292072", "story_v_out_116292.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_116292", "116292072", "story_v_out_116292.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_43 = math.max(var_300_34, arg_297_1.talkMaxDuration)

			if var_300_33 <= arg_297_1.time_ and arg_297_1.time_ < var_300_33 + var_300_43 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_33) / var_300_43

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_33 + var_300_43 and arg_297_1.time_ < var_300_33 + var_300_43 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play116292073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 116292073
		arg_301_1.duration_ = 3.933

		local var_301_0 = {
			zh = 3.733,
			ja = 3.933
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
			arg_301_1.auto_ = false
		end

		function arg_301_1.playNext_(arg_303_0)
			arg_301_1.onStoryFinished_()
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1059ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect1059ui_story == nil then
				arg_301_1.var_.characterEffect1059ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.2

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect1059ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1059ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect1059ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1059ui_story.fillRatio = var_304_5
			end

			local var_304_6 = arg_301_1.actors_["1148ui_story"]
			local var_304_7 = 0

			if var_304_7 < arg_301_1.time_ and arg_301_1.time_ <= var_304_7 + arg_304_0 and arg_301_1.var_.characterEffect1148ui_story == nil then
				arg_301_1.var_.characterEffect1148ui_story = var_304_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_8 = 0.2

			if var_304_7 <= arg_301_1.time_ and arg_301_1.time_ < var_304_7 + var_304_8 then
				local var_304_9 = (arg_301_1.time_ - var_304_7) / var_304_8

				if arg_301_1.var_.characterEffect1148ui_story then
					arg_301_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_7 + var_304_8 and arg_301_1.time_ < var_304_7 + var_304_8 + arg_304_0 and arg_301_1.var_.characterEffect1148ui_story then
				arg_301_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 then
				arg_301_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_304_11 = 0

			if var_304_11 < arg_301_1.time_ and arg_301_1.time_ <= var_304_11 + arg_304_0 then
				arg_301_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_304_12 = arg_301_1.actors_["1148ui_story"].transform
			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1.var_.moveOldPos1148ui_story = var_304_12.localPosition
			end

			local var_304_14 = 0.001

			if var_304_13 <= arg_301_1.time_ and arg_301_1.time_ < var_304_13 + var_304_14 then
				local var_304_15 = (arg_301_1.time_ - var_304_13) / var_304_14
				local var_304_16 = Vector3.New(0.7, -0.8, -6.2)

				var_304_12.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1148ui_story, var_304_16, var_304_15)

				local var_304_17 = manager.ui.mainCamera.transform.position - var_304_12.position

				var_304_12.forward = Vector3.New(var_304_17.x, var_304_17.y, var_304_17.z)

				local var_304_18 = var_304_12.localEulerAngles

				var_304_18.z = 0
				var_304_18.x = 0
				var_304_12.localEulerAngles = var_304_18
			end

			if arg_301_1.time_ >= var_304_13 + var_304_14 and arg_301_1.time_ < var_304_13 + var_304_14 + arg_304_0 then
				var_304_12.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_304_19 = manager.ui.mainCamera.transform.position - var_304_12.position

				var_304_12.forward = Vector3.New(var_304_19.x, var_304_19.y, var_304_19.z)

				local var_304_20 = var_304_12.localEulerAngles

				var_304_20.z = 0
				var_304_20.x = 0
				var_304_12.localEulerAngles = var_304_20
			end

			local var_304_21 = 0
			local var_304_22 = 0.575

			if var_304_21 < arg_301_1.time_ and arg_301_1.time_ <= var_304_21 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_23 = arg_301_1:FormatText(StoryNameCfg[8].name)

				arg_301_1.leftNameTxt_.text = var_304_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_24 = arg_301_1:GetWordFromCfg(116292073)
				local var_304_25 = arg_301_1:FormatText(var_304_24.content)

				arg_301_1.text_.text = var_304_25

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_26 = 23
				local var_304_27 = utf8.len(var_304_25)
				local var_304_28 = var_304_26 <= 0 and var_304_22 or var_304_22 * (var_304_27 / var_304_26)

				if var_304_28 > 0 and var_304_22 < var_304_28 then
					arg_301_1.talkMaxDuration = var_304_28

					if var_304_28 + var_304_21 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_28 + var_304_21
					end
				end

				arg_301_1.text_.text = var_304_25
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116292", "116292073", "story_v_out_116292.awb") ~= 0 then
					local var_304_29 = manager.audio:GetVoiceLength("story_v_out_116292", "116292073", "story_v_out_116292.awb") / 1000

					if var_304_29 + var_304_21 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_29 + var_304_21
					end

					if var_304_24.prefab_name ~= "" and arg_301_1.actors_[var_304_24.prefab_name] ~= nil then
						local var_304_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_24.prefab_name].transform, "story_v_out_116292", "116292073", "story_v_out_116292.awb")

						arg_301_1:RecordAudio("116292073", var_304_30)
						arg_301_1:RecordAudio("116292073", var_304_30)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_116292", "116292073", "story_v_out_116292.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_116292", "116292073", "story_v_out_116292.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_31 = math.max(var_304_22, arg_301_1.talkMaxDuration)

			if var_304_21 <= arg_301_1.time_ and arg_301_1.time_ < var_304_21 + var_304_31 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_21) / var_304_31

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_21 + var_304_31 and arg_301_1.time_ < var_304_21 + var_304_31 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0204",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0204a"
	},
	voices = {
		"story_v_out_116292.awb"
	}
}
