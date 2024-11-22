return {
	Play122531001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 122531001
		arg_1_1.duration_ = 6.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play122531002(arg_1_1)
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

			local var_4_22 = 0
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.5
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_1_story_farewell", "bgm_activity_2_1_story_farewell", "bgm_activity_2_1_story_farewell.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999999
			local var_4_31 = 0.3

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_32 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_32:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[7].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(122531001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 12
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_39 = var_4_30 + 0.3
			local var_4_40 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_39) / var_4_40

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play122531002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 122531002
		arg_7_1.duration_ = 10.3

		local var_7_0 = {
			ja = 10.3,
			ko = 6.3,
			zh = 6.3
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
				arg_7_0:Play122531003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1029ui_story"

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

			local var_10_4 = arg_7_1.actors_["1029ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1029ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.09, -6.2)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1029ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1029ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1029ui_story == nil then
				arg_7_1.var_.characterEffect1029ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1029ui_story then
					arg_7_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1029ui_story then
				arg_7_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = arg_7_1.actors_["1029ui_story"]
			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				if arg_7_1.var_.characterEffect1029ui_story == nil then
					arg_7_1.var_.characterEffect1029ui_story = var_10_19:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_10_21 = arg_7_1.var_.characterEffect1029ui_story

				var_10_21.imageEffect:turnOff()

				var_10_21.interferenceEffect.enabled = true
				var_10_21.interferenceEffect.noise = 0.001
				var_10_21.interferenceEffect.simTimeScale = 1
				var_10_21.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_10_22 = arg_7_1.actors_["1029ui_story"]
			local var_10_23 = 0
			local var_10_24 = 0.2

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				if arg_7_1.var_.characterEffect1029ui_story == nil then
					arg_7_1.var_.characterEffect1029ui_story = var_10_22:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_7_1.var_.characterEffect1029ui_story.imageEffect:turnOn(false)
			end

			local var_10_25 = 0
			local var_10_26 = 0.85

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[319].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(122531002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531002", "story_v_out_122531.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_122531", "122531002", "story_v_out_122531.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_122531", "122531002", "story_v_out_122531.awb")

						arg_7_1:RecordAudio("122531002", var_10_34)
						arg_7_1:RecordAudio("122531002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_122531", "122531002", "story_v_out_122531.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_122531", "122531002", "story_v_out_122531.awb")
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
	Play122531003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 122531003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play122531004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1029ui_story"].transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPos1029ui_story = var_14_0.localPosition
			end

			local var_14_2 = 0.001

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 100, 0)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1029ui_story, var_14_4, var_14_3)

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

			local var_14_9 = arg_11_1.actors_["1029ui_story"]
			local var_14_10 = 0

			if var_14_10 < arg_11_1.time_ and arg_11_1.time_ <= var_14_10 + arg_14_0 and arg_11_1.var_.characterEffect1029ui_story == nil then
				arg_11_1.var_.characterEffect1029ui_story = var_14_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_11 = 0.200000002980232

			if var_14_10 <= arg_11_1.time_ and arg_11_1.time_ < var_14_10 + var_14_11 then
				local var_14_12 = (arg_11_1.time_ - var_14_10) / var_14_11

				if arg_11_1.var_.characterEffect1029ui_story then
					local var_14_13 = Mathf.Lerp(0, 0.5, var_14_12)

					arg_11_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1029ui_story.fillRatio = var_14_13
				end
			end

			if arg_11_1.time_ >= var_14_10 + var_14_11 and arg_11_1.time_ < var_14_10 + var_14_11 + arg_14_0 and arg_11_1.var_.characterEffect1029ui_story then
				local var_14_14 = 0.5

				arg_11_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1029ui_story.fillRatio = var_14_14
			end

			local var_14_15 = 0
			local var_14_16 = 1.525

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

				local var_14_17 = arg_11_1:GetWordFromCfg(122531003)
				local var_14_18 = arg_11_1:FormatText(var_14_17.content)

				arg_11_1.text_.text = var_14_18

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_19 = 61
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
	Play122531004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 122531004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play122531005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.425

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(122531004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 57
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play122531005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 122531005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play122531006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.65

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(122531005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 26
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_8 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_8 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_8

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_8 and arg_19_1.time_ < var_22_0 + var_22_8 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play122531006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 122531006
		arg_23_1.duration_ = 3.8

		local var_23_0 = {
			ja = 3.8,
			ko = 3.7,
			zh = 3.7
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
				arg_23_0:Play122531007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1029ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1029ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, -1.09, -6.2)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1029ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1029ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1029ui_story == nil then
				arg_23_1.var_.characterEffect1029ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1029ui_story then
					arg_23_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1029ui_story then
				arg_23_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = 0
			local var_26_16 = 0.425

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_17 = arg_23_1:FormatText(StoryNameCfg[319].name)

				arg_23_1.leftNameTxt_.text = var_26_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_18 = arg_23_1:GetWordFromCfg(122531006)
				local var_26_19 = arg_23_1:FormatText(var_26_18.content)

				arg_23_1.text_.text = var_26_19

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_20 = 17
				local var_26_21 = utf8.len(var_26_19)
				local var_26_22 = var_26_20 <= 0 and var_26_16 or var_26_16 * (var_26_21 / var_26_20)

				if var_26_22 > 0 and var_26_16 < var_26_22 then
					arg_23_1.talkMaxDuration = var_26_22

					if var_26_22 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_22 + var_26_15
					end
				end

				arg_23_1.text_.text = var_26_19
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531006", "story_v_out_122531.awb") ~= 0 then
					local var_26_23 = manager.audio:GetVoiceLength("story_v_out_122531", "122531006", "story_v_out_122531.awb") / 1000

					if var_26_23 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_15
					end

					if var_26_18.prefab_name ~= "" and arg_23_1.actors_[var_26_18.prefab_name] ~= nil then
						local var_26_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_18.prefab_name].transform, "story_v_out_122531", "122531006", "story_v_out_122531.awb")

						arg_23_1:RecordAudio("122531006", var_26_24)
						arg_23_1:RecordAudio("122531006", var_26_24)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_122531", "122531006", "story_v_out_122531.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_122531", "122531006", "story_v_out_122531.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_25 = math.max(var_26_16, arg_23_1.talkMaxDuration)

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_25 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_15) / var_26_25

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_15 + var_26_25 and arg_23_1.time_ < var_26_15 + var_26_25 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play122531007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 122531007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play122531008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1029ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1029ui_story == nil then
				arg_27_1.var_.characterEffect1029ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1029ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1029ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1029ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1029ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.2

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[7].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(122531007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 8
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
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_14 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_14 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_14

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_14 and arg_27_1.time_ < var_30_6 + var_30_14 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play122531008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 122531008
		arg_31_1.duration_ = 8.633

		local var_31_0 = {
			ja = 8.633,
			ko = 6,
			zh = 6
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
				arg_31_0:Play122531009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1029ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1029ui_story == nil then
				arg_31_1.var_.characterEffect1029ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1029ui_story then
					arg_31_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1029ui_story then
				arg_31_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_34_4 = 0

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_5 = 0
			local var_34_6 = 0.45

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_7 = arg_31_1:FormatText(StoryNameCfg[319].name)

				arg_31_1.leftNameTxt_.text = var_34_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(122531008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 18
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_6 or var_34_6 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_6 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_5 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_5
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531008", "story_v_out_122531.awb") ~= 0 then
					local var_34_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531008", "story_v_out_122531.awb") / 1000

					if var_34_13 + var_34_5 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_5
					end

					if var_34_8.prefab_name ~= "" and arg_31_1.actors_[var_34_8.prefab_name] ~= nil then
						local var_34_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_8.prefab_name].transform, "story_v_out_122531", "122531008", "story_v_out_122531.awb")

						arg_31_1:RecordAudio("122531008", var_34_14)
						arg_31_1:RecordAudio("122531008", var_34_14)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_122531", "122531008", "story_v_out_122531.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_122531", "122531008", "story_v_out_122531.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_15 = math.max(var_34_6, arg_31_1.talkMaxDuration)

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_15 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_5) / var_34_15

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_5 + var_34_15 and arg_31_1.time_ < var_34_5 + var_34_15 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play122531009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 122531009
		arg_35_1.duration_ = 6.733

		local var_35_0 = {
			ja = 6.733,
			ko = 3.3,
			zh = 3.3
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
				arg_35_0:Play122531010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.475

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[319].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(122531009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 19
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_1 or var_38_1 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_1 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531009", "story_v_out_122531.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531009", "story_v_out_122531.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_122531", "122531009", "story_v_out_122531.awb")

						arg_35_1:RecordAudio("122531009", var_38_9)
						arg_35_1:RecordAudio("122531009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_122531", "122531009", "story_v_out_122531.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_122531", "122531009", "story_v_out_122531.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play122531010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 122531010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play122531011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1029ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1029ui_story == nil then
				arg_39_1.var_.characterEffect1029ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1029ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1029ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1029ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1029ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.225

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(122531010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 9
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
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_14 and arg_39_1.time_ < var_42_6 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play122531011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 122531011
		arg_43_1.duration_ = 5.833

		local var_43_0 = {
			ja = 5.833,
			ko = 2.5,
			zh = 2.5
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
				arg_43_0:Play122531012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1029ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1029ui_story == nil then
				arg_43_1.var_.characterEffect1029ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1029ui_story then
					arg_43_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1029ui_story then
				arg_43_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_46_4 = 0
			local var_46_5 = 0.3

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_6 = arg_43_1:FormatText(StoryNameCfg[319].name)

				arg_43_1.leftNameTxt_.text = var_46_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_7 = arg_43_1:GetWordFromCfg(122531011)
				local var_46_8 = arg_43_1:FormatText(var_46_7.content)

				arg_43_1.text_.text = var_46_8

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_9 = 12
				local var_46_10 = utf8.len(var_46_8)
				local var_46_11 = var_46_9 <= 0 and var_46_5 or var_46_5 * (var_46_10 / var_46_9)

				if var_46_11 > 0 and var_46_5 < var_46_11 then
					arg_43_1.talkMaxDuration = var_46_11

					if var_46_11 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_11 + var_46_4
					end
				end

				arg_43_1.text_.text = var_46_8
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531011", "story_v_out_122531.awb") ~= 0 then
					local var_46_12 = manager.audio:GetVoiceLength("story_v_out_122531", "122531011", "story_v_out_122531.awb") / 1000

					if var_46_12 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_4
					end

					if var_46_7.prefab_name ~= "" and arg_43_1.actors_[var_46_7.prefab_name] ~= nil then
						local var_46_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_7.prefab_name].transform, "story_v_out_122531", "122531011", "story_v_out_122531.awb")

						arg_43_1:RecordAudio("122531011", var_46_13)
						arg_43_1:RecordAudio("122531011", var_46_13)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_122531", "122531011", "story_v_out_122531.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_122531", "122531011", "story_v_out_122531.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_5, arg_43_1.talkMaxDuration)

			if var_46_4 <= arg_43_1.time_ and arg_43_1.time_ < var_46_4 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_4) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_4 + var_46_14 and arg_43_1.time_ < var_46_4 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play122531012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 122531012
		arg_47_1.duration_ = 11.633

		local var_47_0 = {
			ja = 11.633,
			ko = 4.933,
			zh = 4.933
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
				arg_47_0:Play122531013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action442")
			end

			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_50_2 = 0
			local var_50_3 = 0.525

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_4 = arg_47_1:FormatText(StoryNameCfg[319].name)

				arg_47_1.leftNameTxt_.text = var_50_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_5 = arg_47_1:GetWordFromCfg(122531012)
				local var_50_6 = arg_47_1:FormatText(var_50_5.content)

				arg_47_1.text_.text = var_50_6

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_7 = 21
				local var_50_8 = utf8.len(var_50_6)
				local var_50_9 = var_50_7 <= 0 and var_50_3 or var_50_3 * (var_50_8 / var_50_7)

				if var_50_9 > 0 and var_50_3 < var_50_9 then
					arg_47_1.talkMaxDuration = var_50_9

					if var_50_9 + var_50_2 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_9 + var_50_2
					end
				end

				arg_47_1.text_.text = var_50_6
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531012", "story_v_out_122531.awb") ~= 0 then
					local var_50_10 = manager.audio:GetVoiceLength("story_v_out_122531", "122531012", "story_v_out_122531.awb") / 1000

					if var_50_10 + var_50_2 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_10 + var_50_2
					end

					if var_50_5.prefab_name ~= "" and arg_47_1.actors_[var_50_5.prefab_name] ~= nil then
						local var_50_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_5.prefab_name].transform, "story_v_out_122531", "122531012", "story_v_out_122531.awb")

						arg_47_1:RecordAudio("122531012", var_50_11)
						arg_47_1:RecordAudio("122531012", var_50_11)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_122531", "122531012", "story_v_out_122531.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_122531", "122531012", "story_v_out_122531.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_12 = math.max(var_50_3, arg_47_1.talkMaxDuration)

			if var_50_2 <= arg_47_1.time_ and arg_47_1.time_ < var_50_2 + var_50_12 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_2) / var_50_12

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_2 + var_50_12 and arg_47_1.time_ < var_50_2 + var_50_12 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play122531013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 122531013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play122531014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1029ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1029ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1029ui_story, var_54_4, var_54_3)

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

			local var_54_9 = arg_51_1.actors_["1029ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1029ui_story == nil then
				arg_51_1.var_.characterEffect1029ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1029ui_story then
					local var_54_13 = Mathf.Lerp(0, 0.5, var_54_12)

					arg_51_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1029ui_story.fillRatio = var_54_13
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1029ui_story then
				local var_54_14 = 0.5

				arg_51_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1029ui_story.fillRatio = var_54_14
			end

			local var_54_15 = 0
			local var_54_16 = 1.325

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_17 = arg_51_1:GetWordFromCfg(122531013)
				local var_54_18 = arg_51_1:FormatText(var_54_17.content)

				arg_51_1.text_.text = var_54_18

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_19 = 53
				local var_54_20 = utf8.len(var_54_18)
				local var_54_21 = var_54_19 <= 0 and var_54_16 or var_54_16 * (var_54_20 / var_54_19)

				if var_54_21 > 0 and var_54_16 < var_54_21 then
					arg_51_1.talkMaxDuration = var_54_21

					if var_54_21 + var_54_15 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_21 + var_54_15
					end
				end

				arg_51_1.text_.text = var_54_18
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_16, arg_51_1.talkMaxDuration)

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_15) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_15 + var_54_22 and arg_51_1.time_ < var_54_15 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play122531014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 122531014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play122531015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.375

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_2 = arg_55_1:GetWordFromCfg(122531014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 55
				local var_58_5 = utf8.len(var_58_3)
				local var_58_6 = var_58_4 <= 0 and var_58_1 or var_58_1 * (var_58_5 / var_58_4)

				if var_58_6 > 0 and var_58_1 < var_58_6 then
					arg_55_1.talkMaxDuration = var_58_6

					if var_58_6 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_6 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_3
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_7 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_7 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_7

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_7 and arg_55_1.time_ < var_58_0 + var_58_7 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play122531015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 122531015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play122531016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.275

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(122531015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 11
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play122531016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 122531016
		arg_63_1.duration_ = 6.5

		local var_63_0 = {
			ja = 6.5,
			ko = 6.233333333332,
			zh = 6.233333333332
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
				arg_63_0:Play122531017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "ST42"

			if arg_63_1.bgs_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(arg_63_1.paintGo_)

				var_66_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_66_0)
				var_66_1.name = var_66_0
				var_66_1.transform.parent = arg_63_1.stage_.transform
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.bgs_[var_66_0] = var_66_1
			end

			local var_66_2 = 1.999999999999

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 then
				local var_66_3 = manager.ui.mainCamera.transform.localPosition
				local var_66_4 = Vector3.New(0, 0, 10) + Vector3.New(var_66_3.x, var_66_3.y, 0)
				local var_66_5 = arg_63_1.bgs_.ST42

				var_66_5.transform.localPosition = var_66_4
				var_66_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_6 = var_66_5:GetComponent("SpriteRenderer")

				if var_66_6 and var_66_6.sprite then
					local var_66_7 = (var_66_5.transform.localPosition - var_66_3).z
					local var_66_8 = manager.ui.mainCameraCom_
					local var_66_9 = 2 * var_66_7 * Mathf.Tan(var_66_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_10 = var_66_9 * var_66_8.aspect
					local var_66_11 = var_66_6.sprite.bounds.size.x
					local var_66_12 = var_66_6.sprite.bounds.size.y
					local var_66_13 = var_66_10 / var_66_11
					local var_66_14 = var_66_9 / var_66_12
					local var_66_15 = var_66_14 < var_66_13 and var_66_13 or var_66_14

					var_66_5.transform.localScale = Vector3.New(var_66_15, var_66_15, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "ST42" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_17 = 2

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17
				local var_66_19 = Color.New(0, 0, 0)

				var_66_19.a = Mathf.Lerp(0, 1, var_66_18)
				arg_63_1.mask_.color = var_66_19
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 then
				local var_66_20 = Color.New(0, 0, 0)

				var_66_20.a = 1
				arg_63_1.mask_.color = var_66_20
			end

			local var_66_21 = 2

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_22 = 2

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22
				local var_66_24 = Color.New(0, 0, 0)

				var_66_24.a = Mathf.Lerp(1, 0, var_66_23)
				arg_63_1.mask_.color = var_66_24
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 then
				local var_66_25 = Color.New(0, 0, 0)
				local var_66_26 = 0

				arg_63_1.mask_.enabled = false
				var_66_25.a = var_66_26
				arg_63_1.mask_.color = var_66_25
			end

			local var_66_27 = "1071ui_story"

			if arg_63_1.actors_[var_66_27] == nil then
				local var_66_28 = Object.Instantiate(Asset.Load("Char/" .. var_66_27), arg_63_1.stage_.transform)

				var_66_28.name = var_66_27
				var_66_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_27] = var_66_28

				local var_66_29 = var_66_28:GetComponentInChildren(typeof(CharacterEffect))

				var_66_29.enabled = true

				local var_66_30 = GameObjectTools.GetOrAddComponent(var_66_28, typeof(DynamicBoneHelper))

				if var_66_30 then
					var_66_30:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_29.transform, false)

				arg_63_1.var_[var_66_27 .. "Animator"] = var_66_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_27 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_27 .. "LipSync"] = var_66_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_31 = arg_63_1.actors_["1071ui_story"].transform
			local var_66_32 = 3.8

			if var_66_32 < arg_63_1.time_ and arg_63_1.time_ <= var_66_32 + arg_66_0 then
				arg_63_1.var_.moveOldPos1071ui_story = var_66_31.localPosition
			end

			local var_66_33 = 0.001

			if var_66_32 <= arg_63_1.time_ and arg_63_1.time_ < var_66_32 + var_66_33 then
				local var_66_34 = (arg_63_1.time_ - var_66_32) / var_66_33
				local var_66_35 = Vector3.New(0, -1.05, -6.2)

				var_66_31.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1071ui_story, var_66_35, var_66_34)

				local var_66_36 = manager.ui.mainCamera.transform.position - var_66_31.position

				var_66_31.forward = Vector3.New(var_66_36.x, var_66_36.y, var_66_36.z)

				local var_66_37 = var_66_31.localEulerAngles

				var_66_37.z = 0
				var_66_37.x = 0
				var_66_31.localEulerAngles = var_66_37
			end

			if arg_63_1.time_ >= var_66_32 + var_66_33 and arg_63_1.time_ < var_66_32 + var_66_33 + arg_66_0 then
				var_66_31.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_66_38 = manager.ui.mainCamera.transform.position - var_66_31.position

				var_66_31.forward = Vector3.New(var_66_38.x, var_66_38.y, var_66_38.z)

				local var_66_39 = var_66_31.localEulerAngles

				var_66_39.z = 0
				var_66_39.x = 0
				var_66_31.localEulerAngles = var_66_39
			end

			local var_66_40 = arg_63_1.actors_["1071ui_story"]
			local var_66_41 = 3.8

			if var_66_41 < arg_63_1.time_ and arg_63_1.time_ <= var_66_41 + arg_66_0 and arg_63_1.var_.characterEffect1071ui_story == nil then
				arg_63_1.var_.characterEffect1071ui_story = var_66_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_42 = 0.200000002980232

			if var_66_41 <= arg_63_1.time_ and arg_63_1.time_ < var_66_41 + var_66_42 then
				local var_66_43 = (arg_63_1.time_ - var_66_41) / var_66_42

				if arg_63_1.var_.characterEffect1071ui_story then
					arg_63_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_41 + var_66_42 and arg_63_1.time_ < var_66_41 + var_66_42 + arg_66_0 and arg_63_1.var_.characterEffect1071ui_story then
				arg_63_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_66_44 = 3.8

			if var_66_44 < arg_63_1.time_ and arg_63_1.time_ <= var_66_44 + arg_66_0 then
				arg_63_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_66_45 = 1.56666666666667

			if var_66_45 < arg_63_1.time_ and arg_63_1.time_ <= var_66_45 + arg_66_0 then
				arg_63_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_46 = 4
			local var_66_47 = 0.05

			if var_66_46 < arg_63_1.time_ and arg_63_1.time_ <= var_66_46 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_48 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_48:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_49 = arg_63_1:FormatText(StoryNameCfg[384].name)

				arg_63_1.leftNameTxt_.text = var_66_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_50 = arg_63_1:GetWordFromCfg(122531016)
				local var_66_51 = arg_63_1:FormatText(var_66_50.content)

				arg_63_1.text_.text = var_66_51

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_52 = 2
				local var_66_53 = utf8.len(var_66_51)
				local var_66_54 = var_66_52 <= 0 and var_66_47 or var_66_47 * (var_66_53 / var_66_52)

				if var_66_54 > 0 and var_66_47 < var_66_54 then
					arg_63_1.talkMaxDuration = var_66_54
					var_66_46 = var_66_46 + 0.3

					if var_66_54 + var_66_46 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_54 + var_66_46
					end
				end

				arg_63_1.text_.text = var_66_51
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531016", "story_v_out_122531.awb") ~= 0 then
					local var_66_55 = manager.audio:GetVoiceLength("story_v_out_122531", "122531016", "story_v_out_122531.awb") / 1000

					if var_66_55 + var_66_46 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_55 + var_66_46
					end

					if var_66_50.prefab_name ~= "" and arg_63_1.actors_[var_66_50.prefab_name] ~= nil then
						local var_66_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_50.prefab_name].transform, "story_v_out_122531", "122531016", "story_v_out_122531.awb")

						arg_63_1:RecordAudio("122531016", var_66_56)
						arg_63_1:RecordAudio("122531016", var_66_56)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_122531", "122531016", "story_v_out_122531.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_122531", "122531016", "story_v_out_122531.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_57 = var_66_46 + 0.3
			local var_66_58 = math.max(var_66_47, arg_63_1.talkMaxDuration)

			if var_66_57 <= arg_63_1.time_ and arg_63_1.time_ < var_66_57 + var_66_58 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_57) / var_66_58

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_57 + var_66_58 and arg_63_1.time_ < var_66_57 + var_66_58 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play122531017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 122531017
		arg_69_1.duration_ = 3.833

		local var_69_0 = {
			ja = 3.833,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_69_0:Play122531018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_72_1 = 0
			local var_72_2 = 0.225

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_3 = arg_69_1:FormatText(StoryNameCfg[384].name)

				arg_69_1.leftNameTxt_.text = var_72_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_4 = arg_69_1:GetWordFromCfg(122531017)
				local var_72_5 = arg_69_1:FormatText(var_72_4.content)

				arg_69_1.text_.text = var_72_5

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_6 = 9
				local var_72_7 = utf8.len(var_72_5)
				local var_72_8 = var_72_6 <= 0 and var_72_2 or var_72_2 * (var_72_7 / var_72_6)

				if var_72_8 > 0 and var_72_2 < var_72_8 then
					arg_69_1.talkMaxDuration = var_72_8

					if var_72_8 + var_72_1 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_1
					end
				end

				arg_69_1.text_.text = var_72_5
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531017", "story_v_out_122531.awb") ~= 0 then
					local var_72_9 = manager.audio:GetVoiceLength("story_v_out_122531", "122531017", "story_v_out_122531.awb") / 1000

					if var_72_9 + var_72_1 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_9 + var_72_1
					end

					if var_72_4.prefab_name ~= "" and arg_69_1.actors_[var_72_4.prefab_name] ~= nil then
						local var_72_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_4.prefab_name].transform, "story_v_out_122531", "122531017", "story_v_out_122531.awb")

						arg_69_1:RecordAudio("122531017", var_72_10)
						arg_69_1:RecordAudio("122531017", var_72_10)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_122531", "122531017", "story_v_out_122531.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_122531", "122531017", "story_v_out_122531.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_11 = math.max(var_72_2, arg_69_1.talkMaxDuration)

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_11 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_1) / var_72_11

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_1 + var_72_11 and arg_69_1.time_ < var_72_1 + var_72_11 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play122531018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 122531018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play122531019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1071ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1071ui_story == nil then
				arg_73_1.var_.characterEffect1071ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1071ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1071ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1071ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1071ui_story.fillRatio = var_76_5
			end

			local var_76_6 = 0
			local var_76_7 = 0.475

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_8 = arg_73_1:FormatText(StoryNameCfg[7].name)

				arg_73_1.leftNameTxt_.text = var_76_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_9 = arg_73_1:GetWordFromCfg(122531018)
				local var_76_10 = arg_73_1:FormatText(var_76_9.content)

				arg_73_1.text_.text = var_76_10

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_11 = 19
				local var_76_12 = utf8.len(var_76_10)
				local var_76_13 = var_76_11 <= 0 and var_76_7 or var_76_7 * (var_76_12 / var_76_11)

				if var_76_13 > 0 and var_76_7 < var_76_13 then
					arg_73_1.talkMaxDuration = var_76_13

					if var_76_13 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_10
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_14 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_14 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_14

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_14 and arg_73_1.time_ < var_76_6 + var_76_14 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play122531019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 122531019
		arg_77_1.duration_ = 12.333

		local var_77_0 = {
			ja = 12.333,
			ko = 7.266,
			zh = 7.266
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
				arg_77_0:Play122531020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1071ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1071ui_story == nil then
				arg_77_1.var_.characterEffect1071ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1071ui_story then
					arg_77_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1071ui_story then
				arg_77_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_80_4 = 0

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_80_5 = 0
			local var_80_6 = 0.8

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_7 = arg_77_1:FormatText(StoryNameCfg[384].name)

				arg_77_1.leftNameTxt_.text = var_80_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_8 = arg_77_1:GetWordFromCfg(122531019)
				local var_80_9 = arg_77_1:FormatText(var_80_8.content)

				arg_77_1.text_.text = var_80_9

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_10 = 32
				local var_80_11 = utf8.len(var_80_9)
				local var_80_12 = var_80_10 <= 0 and var_80_6 or var_80_6 * (var_80_11 / var_80_10)

				if var_80_12 > 0 and var_80_6 < var_80_12 then
					arg_77_1.talkMaxDuration = var_80_12

					if var_80_12 + var_80_5 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_12 + var_80_5
					end
				end

				arg_77_1.text_.text = var_80_9
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531019", "story_v_out_122531.awb") ~= 0 then
					local var_80_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531019", "story_v_out_122531.awb") / 1000

					if var_80_13 + var_80_5 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_5
					end

					if var_80_8.prefab_name ~= "" and arg_77_1.actors_[var_80_8.prefab_name] ~= nil then
						local var_80_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_8.prefab_name].transform, "story_v_out_122531", "122531019", "story_v_out_122531.awb")

						arg_77_1:RecordAudio("122531019", var_80_14)
						arg_77_1:RecordAudio("122531019", var_80_14)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_122531", "122531019", "story_v_out_122531.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_122531", "122531019", "story_v_out_122531.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_15 = math.max(var_80_6, arg_77_1.talkMaxDuration)

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_15 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_5) / var_80_15

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_5 + var_80_15 and arg_77_1.time_ < var_80_5 + var_80_15 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play122531020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 122531020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play122531021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1071ui_story"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos1071ui_story = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0, 100, 0)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1071ui_story, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, 100, 0)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = arg_81_1.actors_["1071ui_story"]
			local var_84_10 = 0

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 and arg_81_1.var_.characterEffect1071ui_story == nil then
				arg_81_1.var_.characterEffect1071ui_story = var_84_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_11 = 0.200000002980232

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_11 then
				local var_84_12 = (arg_81_1.time_ - var_84_10) / var_84_11

				if arg_81_1.var_.characterEffect1071ui_story then
					local var_84_13 = Mathf.Lerp(0, 0.5, var_84_12)

					arg_81_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1071ui_story.fillRatio = var_84_13
				end
			end

			if arg_81_1.time_ >= var_84_10 + var_84_11 and arg_81_1.time_ < var_84_10 + var_84_11 + arg_84_0 and arg_81_1.var_.characterEffect1071ui_story then
				local var_84_14 = 0.5

				arg_81_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1071ui_story.fillRatio = var_84_14
			end

			local var_84_15 = 0
			local var_84_16 = 0.95

			if var_84_15 < arg_81_1.time_ and arg_81_1.time_ <= var_84_15 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_17 = arg_81_1:GetWordFromCfg(122531020)
				local var_84_18 = arg_81_1:FormatText(var_84_17.content)

				arg_81_1.text_.text = var_84_18

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_19 = 38
				local var_84_20 = utf8.len(var_84_18)
				local var_84_21 = var_84_19 <= 0 and var_84_16 or var_84_16 * (var_84_20 / var_84_19)

				if var_84_21 > 0 and var_84_16 < var_84_21 then
					arg_81_1.talkMaxDuration = var_84_21

					if var_84_21 + var_84_15 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_21 + var_84_15
					end
				end

				arg_81_1.text_.text = var_84_18
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_22 = math.max(var_84_16, arg_81_1.talkMaxDuration)

			if var_84_15 <= arg_81_1.time_ and arg_81_1.time_ < var_84_15 + var_84_22 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_15) / var_84_22

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_15 + var_84_22 and arg_81_1.time_ < var_84_15 + var_84_22 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play122531021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 122531021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play122531022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.5

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[7].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(122531021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 20
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_8 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_8 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_8

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_8 and arg_85_1.time_ < var_88_0 + var_88_8 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play122531022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 122531022
		arg_89_1.duration_ = 17.233

		local var_89_0 = {
			ja = 17.233,
			ko = 8.8,
			zh = 8.8
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
				arg_89_0:Play122531023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1071ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1071ui_story == nil then
				arg_89_1.var_.characterEffect1071ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1071ui_story then
					arg_89_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1071ui_story then
				arg_89_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_92_4 = 0

			if var_92_4 < arg_89_1.time_ and arg_89_1.time_ <= var_92_4 + arg_92_0 then
				arg_89_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_2")
			end

			local var_92_5 = arg_89_1.actors_["1071ui_story"].transform
			local var_92_6 = 0

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.var_.moveOldPos1071ui_story = var_92_5.localPosition
			end

			local var_92_7 = 0.001

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_7 then
				local var_92_8 = (arg_89_1.time_ - var_92_6) / var_92_7
				local var_92_9 = Vector3.New(0, -1.05, -6.2)

				var_92_5.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1071ui_story, var_92_9, var_92_8)

				local var_92_10 = manager.ui.mainCamera.transform.position - var_92_5.position

				var_92_5.forward = Vector3.New(var_92_10.x, var_92_10.y, var_92_10.z)

				local var_92_11 = var_92_5.localEulerAngles

				var_92_11.z = 0
				var_92_11.x = 0
				var_92_5.localEulerAngles = var_92_11
			end

			if arg_89_1.time_ >= var_92_6 + var_92_7 and arg_89_1.time_ < var_92_6 + var_92_7 + arg_92_0 then
				var_92_5.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_92_12 = manager.ui.mainCamera.transform.position - var_92_5.position

				var_92_5.forward = Vector3.New(var_92_12.x, var_92_12.y, var_92_12.z)

				local var_92_13 = var_92_5.localEulerAngles

				var_92_13.z = 0
				var_92_13.x = 0
				var_92_5.localEulerAngles = var_92_13
			end

			local var_92_14 = 0
			local var_92_15 = 0.75

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_16 = arg_89_1:FormatText(StoryNameCfg[384].name)

				arg_89_1.leftNameTxt_.text = var_92_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_17 = arg_89_1:GetWordFromCfg(122531022)
				local var_92_18 = arg_89_1:FormatText(var_92_17.content)

				arg_89_1.text_.text = var_92_18

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_19 = 30
				local var_92_20 = utf8.len(var_92_18)
				local var_92_21 = var_92_19 <= 0 and var_92_15 or var_92_15 * (var_92_20 / var_92_19)

				if var_92_21 > 0 and var_92_15 < var_92_21 then
					arg_89_1.talkMaxDuration = var_92_21

					if var_92_21 + var_92_14 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_21 + var_92_14
					end
				end

				arg_89_1.text_.text = var_92_18
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531022", "story_v_out_122531.awb") ~= 0 then
					local var_92_22 = manager.audio:GetVoiceLength("story_v_out_122531", "122531022", "story_v_out_122531.awb") / 1000

					if var_92_22 + var_92_14 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_22 + var_92_14
					end

					if var_92_17.prefab_name ~= "" and arg_89_1.actors_[var_92_17.prefab_name] ~= nil then
						local var_92_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_17.prefab_name].transform, "story_v_out_122531", "122531022", "story_v_out_122531.awb")

						arg_89_1:RecordAudio("122531022", var_92_23)
						arg_89_1:RecordAudio("122531022", var_92_23)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_122531", "122531022", "story_v_out_122531.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_122531", "122531022", "story_v_out_122531.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_24 = math.max(var_92_15, arg_89_1.talkMaxDuration)

			if var_92_14 <= arg_89_1.time_ and arg_89_1.time_ < var_92_14 + var_92_24 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_14) / var_92_24

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_14 + var_92_24 and arg_89_1.time_ < var_92_14 + var_92_24 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play122531023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 122531023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play122531024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1071ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1071ui_story == nil then
				arg_93_1.var_.characterEffect1071ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1071ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1071ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1071ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1071ui_story.fillRatio = var_96_5
			end

			local var_96_6 = 0
			local var_96_7 = 0.35

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_8 = arg_93_1:FormatText(StoryNameCfg[7].name)

				arg_93_1.leftNameTxt_.text = var_96_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_9 = arg_93_1:GetWordFromCfg(122531023)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 14
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
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_14 and arg_93_1.time_ < var_96_6 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play122531024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 122531024
		arg_97_1.duration_ = 2.533

		local var_97_0 = {
			ja = 2.533,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_97_0:Play122531025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1071ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1071ui_story == nil then
				arg_97_1.var_.characterEffect1071ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1071ui_story then
					arg_97_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1071ui_story then
				arg_97_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_100_4 = 0

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_100_5 = 0
			local var_100_6 = 0.075

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_7 = arg_97_1:FormatText(StoryNameCfg[384].name)

				arg_97_1.leftNameTxt_.text = var_100_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_8 = arg_97_1:GetWordFromCfg(122531024)
				local var_100_9 = arg_97_1:FormatText(var_100_8.content)

				arg_97_1.text_.text = var_100_9

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_10 = 3
				local var_100_11 = utf8.len(var_100_9)
				local var_100_12 = var_100_10 <= 0 and var_100_6 or var_100_6 * (var_100_11 / var_100_10)

				if var_100_12 > 0 and var_100_6 < var_100_12 then
					arg_97_1.talkMaxDuration = var_100_12

					if var_100_12 + var_100_5 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_12 + var_100_5
					end
				end

				arg_97_1.text_.text = var_100_9
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531024", "story_v_out_122531.awb") ~= 0 then
					local var_100_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531024", "story_v_out_122531.awb") / 1000

					if var_100_13 + var_100_5 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_5
					end

					if var_100_8.prefab_name ~= "" and arg_97_1.actors_[var_100_8.prefab_name] ~= nil then
						local var_100_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_8.prefab_name].transform, "story_v_out_122531", "122531024", "story_v_out_122531.awb")

						arg_97_1:RecordAudio("122531024", var_100_14)
						arg_97_1:RecordAudio("122531024", var_100_14)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_122531", "122531024", "story_v_out_122531.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_122531", "122531024", "story_v_out_122531.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_15 = math.max(var_100_6, arg_97_1.talkMaxDuration)

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_15 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_5) / var_100_15

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_5 + var_100_15 and arg_97_1.time_ < var_100_5 + var_100_15 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play122531025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 122531025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play122531026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1071ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1071ui_story == nil then
				arg_101_1.var_.characterEffect1071ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1071ui_story then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1071ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1071ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1071ui_story.fillRatio = var_104_5
			end

			local var_104_6 = 0
			local var_104_7 = 0.475

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[7].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(122531025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 19
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_14 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_14 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_14

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_14 and arg_101_1.time_ < var_104_6 + var_104_14 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play122531026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 122531026
		arg_105_1.duration_ = 6

		local var_105_0 = {
			ja = 6,
			ko = 3.966,
			zh = 3.966
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
				arg_105_0:Play122531027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1071ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1071ui_story == nil then
				arg_105_1.var_.characterEffect1071ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1071ui_story then
					arg_105_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1071ui_story then
				arg_105_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_108_4 = 0

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_108_5 = 0
			local var_108_6 = 0.5

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_7 = arg_105_1:FormatText(StoryNameCfg[384].name)

				arg_105_1.leftNameTxt_.text = var_108_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_8 = arg_105_1:GetWordFromCfg(122531026)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 20
				local var_108_11 = utf8.len(var_108_9)
				local var_108_12 = var_108_10 <= 0 and var_108_6 or var_108_6 * (var_108_11 / var_108_10)

				if var_108_12 > 0 and var_108_6 < var_108_12 then
					arg_105_1.talkMaxDuration = var_108_12

					if var_108_12 + var_108_5 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_5
					end
				end

				arg_105_1.text_.text = var_108_9
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531026", "story_v_out_122531.awb") ~= 0 then
					local var_108_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531026", "story_v_out_122531.awb") / 1000

					if var_108_13 + var_108_5 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_5
					end

					if var_108_8.prefab_name ~= "" and arg_105_1.actors_[var_108_8.prefab_name] ~= nil then
						local var_108_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_8.prefab_name].transform, "story_v_out_122531", "122531026", "story_v_out_122531.awb")

						arg_105_1:RecordAudio("122531026", var_108_14)
						arg_105_1:RecordAudio("122531026", var_108_14)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_122531", "122531026", "story_v_out_122531.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_122531", "122531026", "story_v_out_122531.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_15 = math.max(var_108_6, arg_105_1.talkMaxDuration)

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_15 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_5) / var_108_15

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_5 + var_108_15 and arg_105_1.time_ < var_108_5 + var_108_15 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play122531027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 122531027
		arg_109_1.duration_ = 19.3

		local var_109_0 = {
			ja = 19.3,
			ko = 10.933,
			zh = 10.933
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
				arg_109_0:Play122531028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.2

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[384].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(122531027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 48
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531027", "story_v_out_122531.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531027", "story_v_out_122531.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_122531", "122531027", "story_v_out_122531.awb")

						arg_109_1:RecordAudio("122531027", var_112_9)
						arg_109_1:RecordAudio("122531027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_122531", "122531027", "story_v_out_122531.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_122531", "122531027", "story_v_out_122531.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play122531028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 122531028
		arg_113_1.duration_ = 18.4

		local var_113_0 = {
			ja = 18.4,
			ko = 10.633,
			zh = 10.633
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
				arg_113_0:Play122531029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.25

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[384].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(122531028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531028", "story_v_out_122531.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531028", "story_v_out_122531.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_122531", "122531028", "story_v_out_122531.awb")

						arg_113_1:RecordAudio("122531028", var_116_9)
						arg_113_1:RecordAudio("122531028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_122531", "122531028", "story_v_out_122531.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_122531", "122531028", "story_v_out_122531.awb")
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
	Play122531029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 122531029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play122531030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1071ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1071ui_story == nil then
				arg_117_1.var_.characterEffect1071ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1071ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1071ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1071ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1071ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.875

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[7].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_9 = arg_117_1:GetWordFromCfg(122531029)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 35
				local var_120_12 = utf8.len(var_120_10)
				local var_120_13 = var_120_11 <= 0 and var_120_7 or var_120_7 * (var_120_12 / var_120_11)

				if var_120_13 > 0 and var_120_7 < var_120_13 then
					arg_117_1.talkMaxDuration = var_120_13

					if var_120_13 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_13 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_10
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_14 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_14 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_14

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_14 and arg_117_1.time_ < var_120_6 + var_120_14 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play122531030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 122531030
		arg_121_1.duration_ = 4.1

		local var_121_0 = {
			ja = 4.1,
			ko = 2.133,
			zh = 2.133
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
				arg_121_0:Play122531031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1071ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1071ui_story == nil then
				arg_121_1.var_.characterEffect1071ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1071ui_story then
					arg_121_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1071ui_story then
				arg_121_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_124_4 = 0

			if var_124_4 < arg_121_1.time_ and arg_121_1.time_ <= var_124_4 + arg_124_0 then
				arg_121_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_124_5 = 0
			local var_124_6 = 0.25

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_7 = arg_121_1:FormatText(StoryNameCfg[384].name)

				arg_121_1.leftNameTxt_.text = var_124_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_8 = arg_121_1:GetWordFromCfg(122531030)
				local var_124_9 = arg_121_1:FormatText(var_124_8.content)

				arg_121_1.text_.text = var_124_9

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_10 = 10
				local var_124_11 = utf8.len(var_124_9)
				local var_124_12 = var_124_10 <= 0 and var_124_6 or var_124_6 * (var_124_11 / var_124_10)

				if var_124_12 > 0 and var_124_6 < var_124_12 then
					arg_121_1.talkMaxDuration = var_124_12

					if var_124_12 + var_124_5 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_12 + var_124_5
					end
				end

				arg_121_1.text_.text = var_124_9
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531030", "story_v_out_122531.awb") ~= 0 then
					local var_124_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531030", "story_v_out_122531.awb") / 1000

					if var_124_13 + var_124_5 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_13 + var_124_5
					end

					if var_124_8.prefab_name ~= "" and arg_121_1.actors_[var_124_8.prefab_name] ~= nil then
						local var_124_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_8.prefab_name].transform, "story_v_out_122531", "122531030", "story_v_out_122531.awb")

						arg_121_1:RecordAudio("122531030", var_124_14)
						arg_121_1:RecordAudio("122531030", var_124_14)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_122531", "122531030", "story_v_out_122531.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_122531", "122531030", "story_v_out_122531.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_15 = math.max(var_124_6, arg_121_1.talkMaxDuration)

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_15 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_5) / var_124_15

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_5 + var_124_15 and arg_121_1.time_ < var_124_5 + var_124_15 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play122531031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 122531031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play122531032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1071ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1071ui_story == nil then
				arg_125_1.var_.characterEffect1071ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1071ui_story then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1071ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1071ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1071ui_story.fillRatio = var_128_5
			end

			local var_128_6 = 0
			local var_128_7 = 0.575

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[7].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(122531031)
				local var_128_10 = arg_125_1:FormatText(var_128_9.content)

				arg_125_1.text_.text = var_128_10

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_11 = 23
				local var_128_12 = utf8.len(var_128_10)
				local var_128_13 = var_128_11 <= 0 and var_128_7 or var_128_7 * (var_128_12 / var_128_11)

				if var_128_13 > 0 and var_128_7 < var_128_13 then
					arg_125_1.talkMaxDuration = var_128_13

					if var_128_13 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_10
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_14 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_14 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_14

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_14 and arg_125_1.time_ < var_128_6 + var_128_14 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play122531032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 122531032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play122531033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.775

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[7].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(122531032)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 31
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_8 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_8 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_8

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_8 and arg_129_1.time_ < var_132_0 + var_132_8 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play122531033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 122531033
		arg_133_1.duration_ = 10.433

		local var_133_0 = {
			ja = 10.433,
			ko = 4.5,
			zh = 4.5
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
				arg_133_0:Play122531034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1071ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1071ui_story == nil then
				arg_133_1.var_.characterEffect1071ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1071ui_story then
					arg_133_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1071ui_story then
				arg_133_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action436")
			end

			local var_136_5 = 0
			local var_136_6 = 0.4

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_7 = arg_133_1:FormatText(StoryNameCfg[384].name)

				arg_133_1.leftNameTxt_.text = var_136_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_8 = arg_133_1:GetWordFromCfg(122531033)
				local var_136_9 = arg_133_1:FormatText(var_136_8.content)

				arg_133_1.text_.text = var_136_9

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_10 = 16
				local var_136_11 = utf8.len(var_136_9)
				local var_136_12 = var_136_10 <= 0 and var_136_6 or var_136_6 * (var_136_11 / var_136_10)

				if var_136_12 > 0 and var_136_6 < var_136_12 then
					arg_133_1.talkMaxDuration = var_136_12

					if var_136_12 + var_136_5 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_12 + var_136_5
					end
				end

				arg_133_1.text_.text = var_136_9
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531033", "story_v_out_122531.awb") ~= 0 then
					local var_136_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531033", "story_v_out_122531.awb") / 1000

					if var_136_13 + var_136_5 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_5
					end

					if var_136_8.prefab_name ~= "" and arg_133_1.actors_[var_136_8.prefab_name] ~= nil then
						local var_136_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_8.prefab_name].transform, "story_v_out_122531", "122531033", "story_v_out_122531.awb")

						arg_133_1:RecordAudio("122531033", var_136_14)
						arg_133_1:RecordAudio("122531033", var_136_14)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_122531", "122531033", "story_v_out_122531.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_122531", "122531033", "story_v_out_122531.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_15 = math.max(var_136_6, arg_133_1.talkMaxDuration)

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_15 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_5) / var_136_15

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_5 + var_136_15 and arg_133_1.time_ < var_136_5 + var_136_15 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play122531034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 122531034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play122531035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1071ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1071ui_story == nil then
				arg_137_1.var_.characterEffect1071ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1071ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1071ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1071ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1071ui_story.fillRatio = var_140_5
			end

			local var_140_6 = 0
			local var_140_7 = 0.1

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[7].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(122531034)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 4
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_14 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_14 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_14

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_14 and arg_137_1.time_ < var_140_6 + var_140_14 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play122531035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 122531035
		arg_141_1.duration_ = 19.6

		local var_141_0 = {
			ja = 19.6,
			ko = 8.233,
			zh = 8.233
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
				arg_141_0:Play122531036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1071ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1071ui_story == nil then
				arg_141_1.var_.characterEffect1071ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1071ui_story then
					arg_141_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1071ui_story then
				arg_141_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action463")
			end

			local var_144_5 = 0
			local var_144_6 = 1.075

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_7 = arg_141_1:FormatText(StoryNameCfg[384].name)

				arg_141_1.leftNameTxt_.text = var_144_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_8 = arg_141_1:GetWordFromCfg(122531035)
				local var_144_9 = arg_141_1:FormatText(var_144_8.content)

				arg_141_1.text_.text = var_144_9

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_10 = 43
				local var_144_11 = utf8.len(var_144_9)
				local var_144_12 = var_144_10 <= 0 and var_144_6 or var_144_6 * (var_144_11 / var_144_10)

				if var_144_12 > 0 and var_144_6 < var_144_12 then
					arg_141_1.talkMaxDuration = var_144_12

					if var_144_12 + var_144_5 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_12 + var_144_5
					end
				end

				arg_141_1.text_.text = var_144_9
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531035", "story_v_out_122531.awb") ~= 0 then
					local var_144_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531035", "story_v_out_122531.awb") / 1000

					if var_144_13 + var_144_5 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_13 + var_144_5
					end

					if var_144_8.prefab_name ~= "" and arg_141_1.actors_[var_144_8.prefab_name] ~= nil then
						local var_144_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_8.prefab_name].transform, "story_v_out_122531", "122531035", "story_v_out_122531.awb")

						arg_141_1:RecordAudio("122531035", var_144_14)
						arg_141_1:RecordAudio("122531035", var_144_14)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_122531", "122531035", "story_v_out_122531.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_122531", "122531035", "story_v_out_122531.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_15 = math.max(var_144_6, arg_141_1.talkMaxDuration)

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_15 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_5) / var_144_15

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_5 + var_144_15 and arg_141_1.time_ < var_144_5 + var_144_15 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play122531036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 122531036
		arg_145_1.duration_ = 16.9

		local var_145_0 = {
			ja = 16.9,
			ko = 12.7,
			zh = 12.7
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
				arg_145_0:Play122531037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.375

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[384].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(122531036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 55
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531036", "story_v_out_122531.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531036", "story_v_out_122531.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_122531", "122531036", "story_v_out_122531.awb")

						arg_145_1:RecordAudio("122531036", var_148_9)
						arg_145_1:RecordAudio("122531036", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_122531", "122531036", "story_v_out_122531.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_122531", "122531036", "story_v_out_122531.awb")
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
	Play122531037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 122531037
		arg_149_1.duration_ = 13.9

		local var_149_0 = {
			ja = 13.9,
			ko = 12.166,
			zh = 12.166
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
				arg_149_0:Play122531038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1.25

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[384].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(122531037)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531037", "story_v_out_122531.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531037", "story_v_out_122531.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_122531", "122531037", "story_v_out_122531.awb")

						arg_149_1:RecordAudio("122531037", var_152_9)
						arg_149_1:RecordAudio("122531037", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_122531", "122531037", "story_v_out_122531.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_122531", "122531037", "story_v_out_122531.awb")
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
	Play122531038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 122531038
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play122531039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1071ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1071ui_story == nil then
				arg_153_1.var_.characterEffect1071ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1071ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1071ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1071ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1071ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 0.45

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_8 = arg_153_1:FormatText(StoryNameCfg[7].name)

				arg_153_1.leftNameTxt_.text = var_156_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_9 = arg_153_1:GetWordFromCfg(122531038)
				local var_156_10 = arg_153_1:FormatText(var_156_9.content)

				arg_153_1.text_.text = var_156_10

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_11 = 18
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
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_14 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_14 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_14

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_14 and arg_153_1.time_ < var_156_6 + var_156_14 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play122531039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 122531039
		arg_157_1.duration_ = 8

		local var_157_0 = {
			ja = 7.233,
			ko = 8,
			zh = 8
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
				arg_157_0:Play122531040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1071ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1071ui_story == nil then
				arg_157_1.var_.characterEffect1071ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1071ui_story then
					arg_157_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1071ui_story then
				arg_157_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_160_4 = 0

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_2")
			end

			local var_160_5 = 0
			local var_160_6 = 0.675

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_7 = arg_157_1:FormatText(StoryNameCfg[384].name)

				arg_157_1.leftNameTxt_.text = var_160_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_8 = arg_157_1:GetWordFromCfg(122531039)
				local var_160_9 = arg_157_1:FormatText(var_160_8.content)

				arg_157_1.text_.text = var_160_9

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_10 = 27
				local var_160_11 = utf8.len(var_160_9)
				local var_160_12 = var_160_10 <= 0 and var_160_6 or var_160_6 * (var_160_11 / var_160_10)

				if var_160_12 > 0 and var_160_6 < var_160_12 then
					arg_157_1.talkMaxDuration = var_160_12

					if var_160_12 + var_160_5 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_12 + var_160_5
					end
				end

				arg_157_1.text_.text = var_160_9
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531039", "story_v_out_122531.awb") ~= 0 then
					local var_160_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531039", "story_v_out_122531.awb") / 1000

					if var_160_13 + var_160_5 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_5
					end

					if var_160_8.prefab_name ~= "" and arg_157_1.actors_[var_160_8.prefab_name] ~= nil then
						local var_160_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_8.prefab_name].transform, "story_v_out_122531", "122531039", "story_v_out_122531.awb")

						arg_157_1:RecordAudio("122531039", var_160_14)
						arg_157_1:RecordAudio("122531039", var_160_14)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_122531", "122531039", "story_v_out_122531.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_122531", "122531039", "story_v_out_122531.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_15 = math.max(var_160_6, arg_157_1.talkMaxDuration)

			if var_160_5 <= arg_157_1.time_ and arg_157_1.time_ < var_160_5 + var_160_15 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_5) / var_160_15

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_5 + var_160_15 and arg_157_1.time_ < var_160_5 + var_160_15 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play122531040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 122531040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play122531041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1071ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1071ui_story == nil then
				arg_161_1.var_.characterEffect1071ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1071ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1071ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1071ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1071ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 1.175

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

				local var_164_9 = arg_161_1:GetWordFromCfg(122531040)
				local var_164_10 = arg_161_1:FormatText(var_164_9.content)

				arg_161_1.text_.text = var_164_10

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_11 = 47
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
	Play122531041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 122531041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play122531042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.25

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[7].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(122531041)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 10
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
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_8 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_8 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_8

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_8 and arg_165_1.time_ < var_168_0 + var_168_8 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play122531042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 122531042
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play122531043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.725

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_2 = arg_169_1:GetWordFromCfg(122531042)
				local var_172_3 = arg_169_1:FormatText(var_172_2.content)

				arg_169_1.text_.text = var_172_3

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_4 = 29
				local var_172_5 = utf8.len(var_172_3)
				local var_172_6 = var_172_4 <= 0 and var_172_1 or var_172_1 * (var_172_5 / var_172_4)

				if var_172_6 > 0 and var_172_1 < var_172_6 then
					arg_169_1.talkMaxDuration = var_172_6

					if var_172_6 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_6 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_3
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_7 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_7 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_7

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_7 and arg_169_1.time_ < var_172_0 + var_172_7 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play122531043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 122531043
		arg_173_1.duration_ = 13.333

		local var_173_0 = {
			ja = 13.333,
			ko = 8.366,
			zh = 8.366
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
				arg_173_0:Play122531044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1071ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1071ui_story == nil then
				arg_173_1.var_.characterEffect1071ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1071ui_story then
					arg_173_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1071ui_story then
				arg_173_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_176_4 = 0
			local var_176_5 = 1.05

			if var_176_4 < arg_173_1.time_ and arg_173_1.time_ <= var_176_4 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_6 = arg_173_1:FormatText(StoryNameCfg[384].name)

				arg_173_1.leftNameTxt_.text = var_176_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_7 = arg_173_1:GetWordFromCfg(122531043)
				local var_176_8 = arg_173_1:FormatText(var_176_7.content)

				arg_173_1.text_.text = var_176_8

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_9 = 42
				local var_176_10 = utf8.len(var_176_8)
				local var_176_11 = var_176_9 <= 0 and var_176_5 or var_176_5 * (var_176_10 / var_176_9)

				if var_176_11 > 0 and var_176_5 < var_176_11 then
					arg_173_1.talkMaxDuration = var_176_11

					if var_176_11 + var_176_4 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_11 + var_176_4
					end
				end

				arg_173_1.text_.text = var_176_8
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531043", "story_v_out_122531.awb") ~= 0 then
					local var_176_12 = manager.audio:GetVoiceLength("story_v_out_122531", "122531043", "story_v_out_122531.awb") / 1000

					if var_176_12 + var_176_4 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_12 + var_176_4
					end

					if var_176_7.prefab_name ~= "" and arg_173_1.actors_[var_176_7.prefab_name] ~= nil then
						local var_176_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_7.prefab_name].transform, "story_v_out_122531", "122531043", "story_v_out_122531.awb")

						arg_173_1:RecordAudio("122531043", var_176_13)
						arg_173_1:RecordAudio("122531043", var_176_13)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_122531", "122531043", "story_v_out_122531.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_122531", "122531043", "story_v_out_122531.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_14 = math.max(var_176_5, arg_173_1.talkMaxDuration)

			if var_176_4 <= arg_173_1.time_ and arg_173_1.time_ < var_176_4 + var_176_14 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_4) / var_176_14

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_4 + var_176_14 and arg_173_1.time_ < var_176_4 + var_176_14 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play122531044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 122531044
		arg_177_1.duration_ = 8.433

		local var_177_0 = {
			ja = 8.433,
			ko = 3.233,
			zh = 3.233
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
				arg_177_0:Play122531045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.35

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[384].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(122531044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531044", "story_v_out_122531.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531044", "story_v_out_122531.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_122531", "122531044", "story_v_out_122531.awb")

						arg_177_1:RecordAudio("122531044", var_180_9)
						arg_177_1:RecordAudio("122531044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_122531", "122531044", "story_v_out_122531.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_122531", "122531044", "story_v_out_122531.awb")
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
	Play122531045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 122531045
		arg_181_1.duration_ = 0.499999999999

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"

			SetActive(arg_181_1.choicesGo_, true)

			for iter_182_0, iter_182_1 in ipairs(arg_181_1.choices_) do
				local var_182_0 = iter_182_0 <= 2

				SetActive(iter_182_1.go, var_182_0)
			end

			arg_181_1.choices_[1].txt.text = arg_181_1:FormatText(StoryChoiceCfg[461].name)
			arg_181_1.choices_[2].txt.text = arg_181_1:FormatText(StoryChoiceCfg[462].name)
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play122531046(arg_181_1)
			end

			if arg_183_0 == 2 then
				arg_181_0:Play122531046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1071ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1071ui_story == nil then
				arg_181_1.var_.characterEffect1071ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1071ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1071ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1071ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1071ui_story.fillRatio = var_184_5
			end

			local var_184_6 = 0

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1.allBtn_.enabled = false
			end

			local var_184_7 = 0.5

			if arg_181_1.time_ >= var_184_6 + var_184_7 and arg_181_1.time_ < var_184_6 + var_184_7 + arg_184_0 then
				arg_181_1.allBtn_.enabled = true
			end
		end
	end,
	Play122531046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 122531046
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play122531047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.525

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[7].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(122531046)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 21
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
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_8 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_8 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_8

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_8 and arg_185_1.time_ < var_188_0 + var_188_8 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play122531047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 122531047
		arg_189_1.duration_ = 8.933

		local var_189_0 = {
			ja = 8.933,
			ko = 3.733,
			zh = 3.733
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
				arg_189_0:Play122531048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1071ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1071ui_story == nil then
				arg_189_1.var_.characterEffect1071ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1071ui_story then
					arg_189_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1071ui_story then
				arg_189_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_192_4 = 0
			local var_192_5 = 0.3

			if var_192_4 < arg_189_1.time_ and arg_189_1.time_ <= var_192_4 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_6 = arg_189_1:FormatText(StoryNameCfg[384].name)

				arg_189_1.leftNameTxt_.text = var_192_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_7 = arg_189_1:GetWordFromCfg(122531047)
				local var_192_8 = arg_189_1:FormatText(var_192_7.content)

				arg_189_1.text_.text = var_192_8

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_9 = 12
				local var_192_10 = utf8.len(var_192_8)
				local var_192_11 = var_192_9 <= 0 and var_192_5 or var_192_5 * (var_192_10 / var_192_9)

				if var_192_11 > 0 and var_192_5 < var_192_11 then
					arg_189_1.talkMaxDuration = var_192_11

					if var_192_11 + var_192_4 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_11 + var_192_4
					end
				end

				arg_189_1.text_.text = var_192_8
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531047", "story_v_out_122531.awb") ~= 0 then
					local var_192_12 = manager.audio:GetVoiceLength("story_v_out_122531", "122531047", "story_v_out_122531.awb") / 1000

					if var_192_12 + var_192_4 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_12 + var_192_4
					end

					if var_192_7.prefab_name ~= "" and arg_189_1.actors_[var_192_7.prefab_name] ~= nil then
						local var_192_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_7.prefab_name].transform, "story_v_out_122531", "122531047", "story_v_out_122531.awb")

						arg_189_1:RecordAudio("122531047", var_192_13)
						arg_189_1:RecordAudio("122531047", var_192_13)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_122531", "122531047", "story_v_out_122531.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_122531", "122531047", "story_v_out_122531.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_14 = math.max(var_192_5, arg_189_1.talkMaxDuration)

			if var_192_4 <= arg_189_1.time_ and arg_189_1.time_ < var_192_4 + var_192_14 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_4) / var_192_14

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_4 + var_192_14 and arg_189_1.time_ < var_192_4 + var_192_14 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play122531048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 122531048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play122531049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1071ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1071ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, 100, 0)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1071ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, 100, 0)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1071ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect1071ui_story == nil then
				arg_193_1.var_.characterEffect1071ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1071ui_story then
					local var_196_13 = Mathf.Lerp(0, 0.5, var_196_12)

					arg_193_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1071ui_story.fillRatio = var_196_13
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect1071ui_story then
				local var_196_14 = 0.5

				arg_193_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1071ui_story.fillRatio = var_196_14
			end

			local var_196_15 = 0
			local var_196_16 = 0.7

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_17 = arg_193_1:FormatText(StoryNameCfg[7].name)

				arg_193_1.leftNameTxt_.text = var_196_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_18 = arg_193_1:GetWordFromCfg(122531048)
				local var_196_19 = arg_193_1:FormatText(var_196_18.content)

				arg_193_1.text_.text = var_196_19

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_20 = 28
				local var_196_21 = utf8.len(var_196_19)
				local var_196_22 = var_196_20 <= 0 and var_196_16 or var_196_16 * (var_196_21 / var_196_20)

				if var_196_22 > 0 and var_196_16 < var_196_22 then
					arg_193_1.talkMaxDuration = var_196_22

					if var_196_22 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_22 + var_196_15
					end
				end

				arg_193_1.text_.text = var_196_19
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_23 = math.max(var_196_16, arg_193_1.talkMaxDuration)

			if var_196_15 <= arg_193_1.time_ and arg_193_1.time_ < var_196_15 + var_196_23 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_15) / var_196_23

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_15 + var_196_23 and arg_193_1.time_ < var_196_15 + var_196_23 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play122531049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 122531049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play122531050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = "ST42_blur"

			if arg_197_1.bgs_[var_200_0] == nil then
				local var_200_1 = Object.Instantiate(arg_197_1.blurPaintGo_)
				local var_200_2 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_200_0)

				var_200_1:GetComponent("SpriteRenderer").sprite = var_200_2
				var_200_1.name = var_200_0
				var_200_1.transform.parent = arg_197_1.stage_.transform
				var_200_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_197_1.bgs_[var_200_0] = var_200_1
			end

			local var_200_3 = 0
			local var_200_4 = arg_197_1.bgs_[var_200_0]

			if var_200_3 < arg_197_1.time_ and arg_197_1.time_ <= var_200_3 + arg_200_0 then
				local var_200_5 = manager.ui.mainCamera.transform.localPosition
				local var_200_6 = Vector3.New(0, 0, 10) + Vector3.New(var_200_5.x, var_200_5.y, 0)

				var_200_4.transform.localPosition = var_200_6
				var_200_4.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_200_7 = var_200_4:GetComponent("SpriteRenderer")

				if var_200_7 and var_200_7.sprite then
					local var_200_8 = (var_200_4.transform.localPosition - var_200_5).z
					local var_200_9 = manager.ui.mainCameraCom_
					local var_200_10 = 2 * var_200_8 * Mathf.Tan(var_200_9.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_200_11 = var_200_10 * var_200_9.aspect
					local var_200_12 = var_200_7.sprite.bounds.size.x
					local var_200_13 = var_200_7.sprite.bounds.size.y
					local var_200_14 = var_200_11 / var_200_12
					local var_200_15 = var_200_10 / var_200_13
					local var_200_16 = var_200_15 < var_200_14 and var_200_14 or var_200_15

					var_200_4.transform.localScale = Vector3.New(var_200_16, var_200_16, 0)
				end
			end

			local var_200_17 = 2

			if var_200_3 <= arg_197_1.time_ and arg_197_1.time_ < var_200_3 + var_200_17 then
				local var_200_18 = (arg_197_1.time_ - var_200_3) / var_200_17
				local var_200_19 = Color.New(1, 1, 1)

				var_200_19.a = Mathf.Lerp(0, 1, var_200_18)

				var_200_4:GetComponent("SpriteRenderer").material:SetColor("_Color", var_200_19)
			end

			local var_200_20 = 0

			if var_200_20 < arg_197_1.time_ and arg_197_1.time_ <= var_200_20 + arg_200_0 then
				arg_197_1.allBtn_.enabled = false
			end

			local var_200_21 = 2

			if arg_197_1.time_ >= var_200_20 + var_200_21 and arg_197_1.time_ < var_200_20 + var_200_21 + arg_200_0 then
				arg_197_1.allBtn_.enabled = true
			end

			local var_200_22 = 0
			local var_200_23 = 1.275

			if var_200_22 < arg_197_1.time_ and arg_197_1.time_ <= var_200_22 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_24 = arg_197_1:GetWordFromCfg(122531049)
				local var_200_25 = arg_197_1:FormatText(var_200_24.content)

				arg_197_1.text_.text = var_200_25

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_26 = 51
				local var_200_27 = utf8.len(var_200_25)
				local var_200_28 = var_200_26 <= 0 and var_200_23 or var_200_23 * (var_200_27 / var_200_26)

				if var_200_28 > 0 and var_200_23 < var_200_28 then
					arg_197_1.talkMaxDuration = var_200_28

					if var_200_28 + var_200_22 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_28 + var_200_22
					end
				end

				arg_197_1.text_.text = var_200_25
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_29 = math.max(var_200_23, arg_197_1.talkMaxDuration)

			if var_200_22 <= arg_197_1.time_ and arg_197_1.time_ < var_200_22 + var_200_29 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_22) / var_200_29

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_22 + var_200_29 and arg_197_1.time_ < var_200_22 + var_200_29 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play122531050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 122531050
		arg_201_1.duration_ = 1.999999999999

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"

			SetActive(arg_201_1.choicesGo_, true)

			for iter_202_0, iter_202_1 in ipairs(arg_201_1.choices_) do
				local var_202_0 = iter_202_0 <= 1

				SetActive(iter_202_1.go, var_202_0)
			end

			arg_201_1.choices_[1].txt.text = arg_201_1:FormatText(StoryChoiceCfg[463].name)
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play122531051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "ST42_blur"

			if arg_201_1.bgs_[var_204_0] == nil then
				local var_204_1 = Object.Instantiate(arg_201_1.blurPaintGo_)
				local var_204_2 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_204_0)

				var_204_1:GetComponent("SpriteRenderer").sprite = var_204_2
				var_204_1.name = var_204_0
				var_204_1.transform.parent = arg_201_1.stage_.transform
				var_204_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.bgs_[var_204_0] = var_204_1
			end

			local var_204_3 = 0
			local var_204_4 = arg_201_1.bgs_[var_204_0]

			if var_204_3 < arg_201_1.time_ and arg_201_1.time_ <= var_204_3 + arg_204_0 then
				local var_204_5 = manager.ui.mainCamera.transform.localPosition
				local var_204_6 = Vector3.New(0, 0, 10) + Vector3.New(var_204_5.x, var_204_5.y, 0)

				var_204_4.transform.localPosition = var_204_6
				var_204_4.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_204_7 = var_204_4:GetComponent("SpriteRenderer")

				if var_204_7 and var_204_7.sprite then
					local var_204_8 = (var_204_4.transform.localPosition - var_204_5).z
					local var_204_9 = manager.ui.mainCameraCom_
					local var_204_10 = 2 * var_204_8 * Mathf.Tan(var_204_9.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_204_11 = var_204_10 * var_204_9.aspect
					local var_204_12 = var_204_7.sprite.bounds.size.x
					local var_204_13 = var_204_7.sprite.bounds.size.y
					local var_204_14 = var_204_11 / var_204_12
					local var_204_15 = var_204_10 / var_204_13
					local var_204_16 = var_204_15 < var_204_14 and var_204_14 or var_204_15

					var_204_4.transform.localScale = Vector3.New(var_204_16, var_204_16, 0)
				end
			end

			local var_204_17 = 2

			if var_204_3 <= arg_201_1.time_ and arg_201_1.time_ < var_204_3 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_3) / var_204_17
				local var_204_19 = Color.New(1, 1, 1)

				var_204_19.a = Mathf.Lerp(1, 0, var_204_18)

				var_204_4:GetComponent("SpriteRenderer").material:SetColor("_Color", var_204_19)
			end

			local var_204_20 = 0

			if var_204_20 < arg_201_1.time_ and arg_201_1.time_ <= var_204_20 + arg_204_0 then
				arg_201_1.allBtn_.enabled = false
			end

			local var_204_21 = 2

			if arg_201_1.time_ >= var_204_20 + var_204_21 and arg_201_1.time_ < var_204_20 + var_204_21 + arg_204_0 then
				arg_201_1.allBtn_.enabled = true
			end
		end
	end,
	Play122531051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 122531051
		arg_205_1.duration_ = 15.3

		local var_205_0 = {
			ja = 15.3,
			ko = 5.1,
			zh = 5.1
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
				arg_205_0:Play122531052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1071ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1071ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(0, -1.05, -6.2)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1071ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = arg_205_1.actors_["1071ui_story"]
			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 and arg_205_1.var_.characterEffect1071ui_story == nil then
				arg_205_1.var_.characterEffect1071ui_story = var_208_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_11 = 0.200000002980232

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_10) / var_208_11

				if arg_205_1.var_.characterEffect1071ui_story then
					arg_205_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_10 + var_208_11 and arg_205_1.time_ < var_208_10 + var_208_11 + arg_208_0 and arg_205_1.var_.characterEffect1071ui_story then
				arg_205_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_208_13 = 0

			if var_208_13 < arg_205_1.time_ and arg_205_1.time_ <= var_208_13 + arg_208_0 then
				arg_205_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_208_14 = 0
			local var_208_15 = 0.575

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_16 = arg_205_1:FormatText(StoryNameCfg[384].name)

				arg_205_1.leftNameTxt_.text = var_208_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_17 = arg_205_1:GetWordFromCfg(122531051)
				local var_208_18 = arg_205_1:FormatText(var_208_17.content)

				arg_205_1.text_.text = var_208_18

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_19 = 23
				local var_208_20 = utf8.len(var_208_18)
				local var_208_21 = var_208_19 <= 0 and var_208_15 or var_208_15 * (var_208_20 / var_208_19)

				if var_208_21 > 0 and var_208_15 < var_208_21 then
					arg_205_1.talkMaxDuration = var_208_21

					if var_208_21 + var_208_14 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_21 + var_208_14
					end
				end

				arg_205_1.text_.text = var_208_18
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531051", "story_v_out_122531.awb") ~= 0 then
					local var_208_22 = manager.audio:GetVoiceLength("story_v_out_122531", "122531051", "story_v_out_122531.awb") / 1000

					if var_208_22 + var_208_14 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_22 + var_208_14
					end

					if var_208_17.prefab_name ~= "" and arg_205_1.actors_[var_208_17.prefab_name] ~= nil then
						local var_208_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_17.prefab_name].transform, "story_v_out_122531", "122531051", "story_v_out_122531.awb")

						arg_205_1:RecordAudio("122531051", var_208_23)
						arg_205_1:RecordAudio("122531051", var_208_23)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_122531", "122531051", "story_v_out_122531.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_122531", "122531051", "story_v_out_122531.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_24 = math.max(var_208_15, arg_205_1.talkMaxDuration)

			if var_208_14 <= arg_205_1.time_ and arg_205_1.time_ < var_208_14 + var_208_24 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_14) / var_208_24

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_14 + var_208_24 and arg_205_1.time_ < var_208_14 + var_208_24 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play122531052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 122531052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play122531053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1071ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1071ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, 100, 0)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1071ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, 100, 0)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["1071ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect1071ui_story == nil then
				arg_209_1.var_.characterEffect1071ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect1071ui_story then
					local var_212_13 = Mathf.Lerp(0, 0.5, var_212_12)

					arg_209_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1071ui_story.fillRatio = var_212_13
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect1071ui_story then
				local var_212_14 = 0.5

				arg_209_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1071ui_story.fillRatio = var_212_14
			end

			local var_212_15 = 0
			local var_212_16 = 1.2

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_17 = arg_209_1:GetWordFromCfg(122531052)
				local var_212_18 = arg_209_1:FormatText(var_212_17.content)

				arg_209_1.text_.text = var_212_18

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_19 = 48
				local var_212_20 = utf8.len(var_212_18)
				local var_212_21 = var_212_19 <= 0 and var_212_16 or var_212_16 * (var_212_20 / var_212_19)

				if var_212_21 > 0 and var_212_16 < var_212_21 then
					arg_209_1.talkMaxDuration = var_212_21

					if var_212_21 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_21 + var_212_15
					end
				end

				arg_209_1.text_.text = var_212_18
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_22 = math.max(var_212_16, arg_209_1.talkMaxDuration)

			if var_212_15 <= arg_209_1.time_ and arg_209_1.time_ < var_212_15 + var_212_22 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_15) / var_212_22

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_15 + var_212_22 and arg_209_1.time_ < var_212_15 + var_212_22 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play122531053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 122531053
		arg_213_1.duration_ = 5.7

		local var_213_0 = {
			ja = 5.7,
			ko = 4.533,
			zh = 4.533
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
				arg_213_0:Play122531054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1071ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1071ui_story == nil then
				arg_213_1.var_.characterEffect1071ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1071ui_story then
					arg_213_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1071ui_story then
				arg_213_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_216_4 = 0

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_2")
			end

			local var_216_5 = arg_213_1.actors_["1071ui_story"].transform
			local var_216_6 = 0

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.var_.moveOldPos1071ui_story = var_216_5.localPosition
			end

			local var_216_7 = 0.001

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_7 then
				local var_216_8 = (arg_213_1.time_ - var_216_6) / var_216_7
				local var_216_9 = Vector3.New(0, -1.05, -6.2)

				var_216_5.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1071ui_story, var_216_9, var_216_8)

				local var_216_10 = manager.ui.mainCamera.transform.position - var_216_5.position

				var_216_5.forward = Vector3.New(var_216_10.x, var_216_10.y, var_216_10.z)

				local var_216_11 = var_216_5.localEulerAngles

				var_216_11.z = 0
				var_216_11.x = 0
				var_216_5.localEulerAngles = var_216_11
			end

			if arg_213_1.time_ >= var_216_6 + var_216_7 and arg_213_1.time_ < var_216_6 + var_216_7 + arg_216_0 then
				var_216_5.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_216_12 = manager.ui.mainCamera.transform.position - var_216_5.position

				var_216_5.forward = Vector3.New(var_216_12.x, var_216_12.y, var_216_12.z)

				local var_216_13 = var_216_5.localEulerAngles

				var_216_13.z = 0
				var_216_13.x = 0
				var_216_5.localEulerAngles = var_216_13
			end

			local var_216_14 = 0
			local var_216_15 = 0.5

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_16 = arg_213_1:FormatText(StoryNameCfg[384].name)

				arg_213_1.leftNameTxt_.text = var_216_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_17 = arg_213_1:GetWordFromCfg(122531053)
				local var_216_18 = arg_213_1:FormatText(var_216_17.content)

				arg_213_1.text_.text = var_216_18

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_19 = 20
				local var_216_20 = utf8.len(var_216_18)
				local var_216_21 = var_216_19 <= 0 and var_216_15 or var_216_15 * (var_216_20 / var_216_19)

				if var_216_21 > 0 and var_216_15 < var_216_21 then
					arg_213_1.talkMaxDuration = var_216_21

					if var_216_21 + var_216_14 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_21 + var_216_14
					end
				end

				arg_213_1.text_.text = var_216_18
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531053", "story_v_out_122531.awb") ~= 0 then
					local var_216_22 = manager.audio:GetVoiceLength("story_v_out_122531", "122531053", "story_v_out_122531.awb") / 1000

					if var_216_22 + var_216_14 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_22 + var_216_14
					end

					if var_216_17.prefab_name ~= "" and arg_213_1.actors_[var_216_17.prefab_name] ~= nil then
						local var_216_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_17.prefab_name].transform, "story_v_out_122531", "122531053", "story_v_out_122531.awb")

						arg_213_1:RecordAudio("122531053", var_216_23)
						arg_213_1:RecordAudio("122531053", var_216_23)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_122531", "122531053", "story_v_out_122531.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_122531", "122531053", "story_v_out_122531.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_24 = math.max(var_216_15, arg_213_1.talkMaxDuration)

			if var_216_14 <= arg_213_1.time_ and arg_213_1.time_ < var_216_14 + var_216_24 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_14) / var_216_24

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_14 + var_216_24 and arg_213_1.time_ < var_216_14 + var_216_24 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play122531054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 122531054
		arg_217_1.duration_ = 14.466

		local var_217_0 = {
			ja = 14.466,
			ko = 7.4,
			zh = 7.4
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
				arg_217_0:Play122531055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.825

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[384].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(122531054)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 33
				local var_220_6 = utf8.len(var_220_4)
				local var_220_7 = var_220_5 <= 0 and var_220_1 or var_220_1 * (var_220_6 / var_220_5)

				if var_220_7 > 0 and var_220_1 < var_220_7 then
					arg_217_1.talkMaxDuration = var_220_7

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_4
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531054", "story_v_out_122531.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531054", "story_v_out_122531.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_122531", "122531054", "story_v_out_122531.awb")

						arg_217_1:RecordAudio("122531054", var_220_9)
						arg_217_1:RecordAudio("122531054", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_122531", "122531054", "story_v_out_122531.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_122531", "122531054", "story_v_out_122531.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_10 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_10 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_10

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_10 and arg_217_1.time_ < var_220_0 + var_220_10 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play122531055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 122531055
		arg_221_1.duration_ = 15.266

		local var_221_0 = {
			ja = 15.266,
			ko = 9,
			zh = 9
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
				arg_221_0:Play122531056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 1

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[384].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(122531055)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 40
				local var_224_6 = utf8.len(var_224_4)
				local var_224_7 = var_224_5 <= 0 and var_224_1 or var_224_1 * (var_224_6 / var_224_5)

				if var_224_7 > 0 and var_224_1 < var_224_7 then
					arg_221_1.talkMaxDuration = var_224_7

					if var_224_7 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_7 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_4
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531055", "story_v_out_122531.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531055", "story_v_out_122531.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_122531", "122531055", "story_v_out_122531.awb")

						arg_221_1:RecordAudio("122531055", var_224_9)
						arg_221_1:RecordAudio("122531055", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_122531", "122531055", "story_v_out_122531.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_122531", "122531055", "story_v_out_122531.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_10 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_10 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_10

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_10 and arg_221_1.time_ < var_224_0 + var_224_10 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play122531056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 122531056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play122531057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1071ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1071ui_story == nil then
				arg_225_1.var_.characterEffect1071ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.200000002980232

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1071ui_story then
					local var_228_4 = Mathf.Lerp(0, 0.5, var_228_3)

					arg_225_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1071ui_story.fillRatio = var_228_4
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1071ui_story then
				local var_228_5 = 0.5

				arg_225_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1071ui_story.fillRatio = var_228_5
			end

			local var_228_6 = 0
			local var_228_7 = 0.125

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

				local var_228_9 = arg_225_1:GetWordFromCfg(122531056)
				local var_228_10 = arg_225_1:FormatText(var_228_9.content)

				arg_225_1.text_.text = var_228_10

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_11 = 5
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
	Play122531057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 122531057
		arg_229_1.duration_ = 6.433

		local var_229_0 = {
			ja = 6.433,
			ko = 3.2,
			zh = 3.2
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
				arg_229_0:Play122531058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1071ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1071ui_story == nil then
				arg_229_1.var_.characterEffect1071ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1071ui_story then
					arg_229_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1071ui_story then
				arg_229_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_232_4 = 0

			if var_232_4 < arg_229_1.time_ and arg_229_1.time_ <= var_232_4 + arg_232_0 then
				arg_229_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_232_5 = 0
			local var_232_6 = 0.4

			if var_232_5 < arg_229_1.time_ and arg_229_1.time_ <= var_232_5 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_7 = arg_229_1:FormatText(StoryNameCfg[384].name)

				arg_229_1.leftNameTxt_.text = var_232_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_8 = arg_229_1:GetWordFromCfg(122531057)
				local var_232_9 = arg_229_1:FormatText(var_232_8.content)

				arg_229_1.text_.text = var_232_9

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_10 = 16
				local var_232_11 = utf8.len(var_232_9)
				local var_232_12 = var_232_10 <= 0 and var_232_6 or var_232_6 * (var_232_11 / var_232_10)

				if var_232_12 > 0 and var_232_6 < var_232_12 then
					arg_229_1.talkMaxDuration = var_232_12

					if var_232_12 + var_232_5 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_12 + var_232_5
					end
				end

				arg_229_1.text_.text = var_232_9
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531057", "story_v_out_122531.awb") ~= 0 then
					local var_232_13 = manager.audio:GetVoiceLength("story_v_out_122531", "122531057", "story_v_out_122531.awb") / 1000

					if var_232_13 + var_232_5 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_5
					end

					if var_232_8.prefab_name ~= "" and arg_229_1.actors_[var_232_8.prefab_name] ~= nil then
						local var_232_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_8.prefab_name].transform, "story_v_out_122531", "122531057", "story_v_out_122531.awb")

						arg_229_1:RecordAudio("122531057", var_232_14)
						arg_229_1:RecordAudio("122531057", var_232_14)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_122531", "122531057", "story_v_out_122531.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_122531", "122531057", "story_v_out_122531.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_15 = math.max(var_232_6, arg_229_1.talkMaxDuration)

			if var_232_5 <= arg_229_1.time_ and arg_229_1.time_ < var_232_5 + var_232_15 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_5) / var_232_15

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_5 + var_232_15 and arg_229_1.time_ < var_232_5 + var_232_15 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play122531058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 122531058
		arg_233_1.duration_ = 11.566

		local var_233_0 = {
			ja = 11.566,
			ko = 6.633,
			zh = 6.633
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
				arg_233_0:Play122531059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_236_1 = 0
			local var_236_2 = 0.65

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_3 = arg_233_1:FormatText(StoryNameCfg[384].name)

				arg_233_1.leftNameTxt_.text = var_236_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_4 = arg_233_1:GetWordFromCfg(122531058)
				local var_236_5 = arg_233_1:FormatText(var_236_4.content)

				arg_233_1.text_.text = var_236_5

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_6 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531058", "story_v_out_122531.awb") ~= 0 then
					local var_236_9 = manager.audio:GetVoiceLength("story_v_out_122531", "122531058", "story_v_out_122531.awb") / 1000

					if var_236_9 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_9 + var_236_1
					end

					if var_236_4.prefab_name ~= "" and arg_233_1.actors_[var_236_4.prefab_name] ~= nil then
						local var_236_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_4.prefab_name].transform, "story_v_out_122531", "122531058", "story_v_out_122531.awb")

						arg_233_1:RecordAudio("122531058", var_236_10)
						arg_233_1:RecordAudio("122531058", var_236_10)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_122531", "122531058", "story_v_out_122531.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_122531", "122531058", "story_v_out_122531.awb")
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
	Play122531059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 122531059
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play122531060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1071ui_story"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos1071ui_story = var_240_0.localPosition
			end

			local var_240_2 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2
				local var_240_4 = Vector3.New(0, 100, 0)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1071ui_story, var_240_4, var_240_3)

				local var_240_5 = manager.ui.mainCamera.transform.position - var_240_0.position

				var_240_0.forward = Vector3.New(var_240_5.x, var_240_5.y, var_240_5.z)

				local var_240_6 = var_240_0.localEulerAngles

				var_240_6.z = 0
				var_240_6.x = 0
				var_240_0.localEulerAngles = var_240_6
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(0, 100, 0)

				local var_240_7 = manager.ui.mainCamera.transform.position - var_240_0.position

				var_240_0.forward = Vector3.New(var_240_7.x, var_240_7.y, var_240_7.z)

				local var_240_8 = var_240_0.localEulerAngles

				var_240_8.z = 0
				var_240_8.x = 0
				var_240_0.localEulerAngles = var_240_8
			end

			local var_240_9 = arg_237_1.actors_["1071ui_story"]
			local var_240_10 = 0

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 and arg_237_1.var_.characterEffect1071ui_story == nil then
				arg_237_1.var_.characterEffect1071ui_story = var_240_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_11 = 0.200000002980232

			if var_240_10 <= arg_237_1.time_ and arg_237_1.time_ < var_240_10 + var_240_11 then
				local var_240_12 = (arg_237_1.time_ - var_240_10) / var_240_11

				if arg_237_1.var_.characterEffect1071ui_story then
					local var_240_13 = Mathf.Lerp(0, 0.5, var_240_12)

					arg_237_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1071ui_story.fillRatio = var_240_13
				end
			end

			if arg_237_1.time_ >= var_240_10 + var_240_11 and arg_237_1.time_ < var_240_10 + var_240_11 + arg_240_0 and arg_237_1.var_.characterEffect1071ui_story then
				local var_240_14 = 0.5

				arg_237_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1071ui_story.fillRatio = var_240_14
			end

			local var_240_15 = 0
			local var_240_16 = 1.525

			if var_240_15 < arg_237_1.time_ and arg_237_1.time_ <= var_240_15 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_17 = arg_237_1:GetWordFromCfg(122531059)
				local var_240_18 = arg_237_1:FormatText(var_240_17.content)

				arg_237_1.text_.text = var_240_18

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_19 = 61
				local var_240_20 = utf8.len(var_240_18)
				local var_240_21 = var_240_19 <= 0 and var_240_16 or var_240_16 * (var_240_20 / var_240_19)

				if var_240_21 > 0 and var_240_16 < var_240_21 then
					arg_237_1.talkMaxDuration = var_240_21

					if var_240_21 + var_240_15 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_21 + var_240_15
					end
				end

				arg_237_1.text_.text = var_240_18
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_22 = math.max(var_240_16, arg_237_1.talkMaxDuration)

			if var_240_15 <= arg_237_1.time_ and arg_237_1.time_ < var_240_15 + var_240_22 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_15) / var_240_22

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_15 + var_240_22 and arg_237_1.time_ < var_240_15 + var_240_22 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play122531060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 122531060
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play122531061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 1.175

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_2 = arg_241_1:GetWordFromCfg(122531060)
				local var_244_3 = arg_241_1:FormatText(var_244_2.content)

				arg_241_1.text_.text = var_244_3

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_4 = 47
				local var_244_5 = utf8.len(var_244_3)
				local var_244_6 = var_244_4 <= 0 and var_244_1 or var_244_1 * (var_244_5 / var_244_4)

				if var_244_6 > 0 and var_244_1 < var_244_6 then
					arg_241_1.talkMaxDuration = var_244_6

					if var_244_6 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_6 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_3
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_7 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_7 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_7

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_7 and arg_241_1.time_ < var_244_0 + var_244_7 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play122531061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 122531061
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play122531062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 1.375

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

				local var_248_2 = arg_245_1:GetWordFromCfg(122531061)
				local var_248_3 = arg_245_1:FormatText(var_248_2.content)

				arg_245_1.text_.text = var_248_3

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_4 = 55
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
	Play122531062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 122531062
		arg_249_1.duration_ = 5.033

		local var_249_0 = {
			ja = 5.033,
			ko = 2.7,
			zh = 2.7
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
				arg_249_0:Play122531063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = "1075ui_story"

			if arg_249_1.actors_[var_252_0] == nil then
				local var_252_1 = Object.Instantiate(Asset.Load("Char/" .. var_252_0), arg_249_1.stage_.transform)

				var_252_1.name = var_252_0
				var_252_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_249_1.actors_[var_252_0] = var_252_1

				local var_252_2 = var_252_1:GetComponentInChildren(typeof(CharacterEffect))

				var_252_2.enabled = true

				local var_252_3 = GameObjectTools.GetOrAddComponent(var_252_1, typeof(DynamicBoneHelper))

				if var_252_3 then
					var_252_3:EnableDynamicBone(false)
				end

				arg_249_1:ShowWeapon(var_252_2.transform, false)

				arg_249_1.var_[var_252_0 .. "Animator"] = var_252_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_249_1.var_[var_252_0 .. "Animator"].applyRootMotion = true
				arg_249_1.var_[var_252_0 .. "LipSync"] = var_252_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_252_4 = arg_249_1.actors_["1075ui_story"].transform
			local var_252_5 = 0

			if var_252_5 < arg_249_1.time_ and arg_249_1.time_ <= var_252_5 + arg_252_0 then
				arg_249_1.var_.moveOldPos1075ui_story = var_252_4.localPosition
			end

			local var_252_6 = 0.001

			if var_252_5 <= arg_249_1.time_ and arg_249_1.time_ < var_252_5 + var_252_6 then
				local var_252_7 = (arg_249_1.time_ - var_252_5) / var_252_6
				local var_252_8 = Vector3.New(0, -1.055, -6.16)

				var_252_4.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1075ui_story, var_252_8, var_252_7)

				local var_252_9 = manager.ui.mainCamera.transform.position - var_252_4.position

				var_252_4.forward = Vector3.New(var_252_9.x, var_252_9.y, var_252_9.z)

				local var_252_10 = var_252_4.localEulerAngles

				var_252_10.z = 0
				var_252_10.x = 0
				var_252_4.localEulerAngles = var_252_10
			end

			if arg_249_1.time_ >= var_252_5 + var_252_6 and arg_249_1.time_ < var_252_5 + var_252_6 + arg_252_0 then
				var_252_4.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_252_11 = manager.ui.mainCamera.transform.position - var_252_4.position

				var_252_4.forward = Vector3.New(var_252_11.x, var_252_11.y, var_252_11.z)

				local var_252_12 = var_252_4.localEulerAngles

				var_252_12.z = 0
				var_252_12.x = 0
				var_252_4.localEulerAngles = var_252_12
			end

			local var_252_13 = arg_249_1.actors_["1075ui_story"]
			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 and arg_249_1.var_.characterEffect1075ui_story == nil then
				arg_249_1.var_.characterEffect1075ui_story = var_252_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_15 = 0.200000002980232

			if var_252_14 <= arg_249_1.time_ and arg_249_1.time_ < var_252_14 + var_252_15 then
				local var_252_16 = (arg_249_1.time_ - var_252_14) / var_252_15

				if arg_249_1.var_.characterEffect1075ui_story then
					arg_249_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_14 + var_252_15 and arg_249_1.time_ < var_252_14 + var_252_15 + arg_252_0 and arg_249_1.var_.characterEffect1075ui_story then
				arg_249_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_252_17 = 0

			if var_252_17 < arg_249_1.time_ and arg_249_1.time_ <= var_252_17 + arg_252_0 then
				arg_249_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_252_18 = 0

			if var_252_18 < arg_249_1.time_ and arg_249_1.time_ <= var_252_18 + arg_252_0 then
				arg_249_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_252_19 = 0
			local var_252_20 = 0.475

			if var_252_19 < arg_249_1.time_ and arg_249_1.time_ <= var_252_19 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_21 = arg_249_1:FormatText(StoryNameCfg[381].name)

				arg_249_1.leftNameTxt_.text = var_252_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_22 = arg_249_1:GetWordFromCfg(122531062)
				local var_252_23 = arg_249_1:FormatText(var_252_22.content)

				arg_249_1.text_.text = var_252_23

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_24 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531062", "story_v_out_122531.awb") ~= 0 then
					local var_252_27 = manager.audio:GetVoiceLength("story_v_out_122531", "122531062", "story_v_out_122531.awb") / 1000

					if var_252_27 + var_252_19 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_27 + var_252_19
					end

					if var_252_22.prefab_name ~= "" and arg_249_1.actors_[var_252_22.prefab_name] ~= nil then
						local var_252_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_22.prefab_name].transform, "story_v_out_122531", "122531062", "story_v_out_122531.awb")

						arg_249_1:RecordAudio("122531062", var_252_28)
						arg_249_1:RecordAudio("122531062", var_252_28)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_122531", "122531062", "story_v_out_122531.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_122531", "122531062", "story_v_out_122531.awb")
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
	Play122531063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 122531063
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play122531064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1075ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1075ui_story == nil then
				arg_253_1.var_.characterEffect1075ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1075ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1075ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1075ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1075ui_story.fillRatio = var_256_5
			end

			local var_256_6 = 0
			local var_256_7 = 0.1

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_8 = arg_253_1:FormatText(StoryNameCfg[7].name)

				arg_253_1.leftNameTxt_.text = var_256_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_9 = arg_253_1:GetWordFromCfg(122531063)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 4
				local var_256_12 = utf8.len(var_256_10)
				local var_256_13 = var_256_11 <= 0 and var_256_7 or var_256_7 * (var_256_12 / var_256_11)

				if var_256_13 > 0 and var_256_7 < var_256_13 then
					arg_253_1.talkMaxDuration = var_256_13

					if var_256_13 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_13 + var_256_6
					end
				end

				arg_253_1.text_.text = var_256_10
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_14 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_14 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_14

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_14 and arg_253_1.time_ < var_256_6 + var_256_14 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play122531064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 122531064
		arg_257_1.duration_ = 13.266

		local var_257_0 = {
			ja = 13.266,
			ko = 10.4,
			zh = 10.4
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
				arg_257_0:Play122531065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1075ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1075ui_story == nil then
				arg_257_1.var_.characterEffect1075ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1075ui_story then
					arg_257_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1075ui_story then
				arg_257_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_260_4 = 0

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				arg_257_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_260_5 = 0

			if var_260_5 < arg_257_1.time_ and arg_257_1.time_ <= var_260_5 + arg_260_0 then
				arg_257_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_260_6 = 0
			local var_260_7 = 1.075

			if var_260_6 < arg_257_1.time_ and arg_257_1.time_ <= var_260_6 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_8 = arg_257_1:FormatText(StoryNameCfg[381].name)

				arg_257_1.leftNameTxt_.text = var_260_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_9 = arg_257_1:GetWordFromCfg(122531064)
				local var_260_10 = arg_257_1:FormatText(var_260_9.content)

				arg_257_1.text_.text = var_260_10

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_11 = 43
				local var_260_12 = utf8.len(var_260_10)
				local var_260_13 = var_260_11 <= 0 and var_260_7 or var_260_7 * (var_260_12 / var_260_11)

				if var_260_13 > 0 and var_260_7 < var_260_13 then
					arg_257_1.talkMaxDuration = var_260_13

					if var_260_13 + var_260_6 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_13 + var_260_6
					end
				end

				arg_257_1.text_.text = var_260_10
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531064", "story_v_out_122531.awb") ~= 0 then
					local var_260_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531064", "story_v_out_122531.awb") / 1000

					if var_260_14 + var_260_6 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_14 + var_260_6
					end

					if var_260_9.prefab_name ~= "" and arg_257_1.actors_[var_260_9.prefab_name] ~= nil then
						local var_260_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_9.prefab_name].transform, "story_v_out_122531", "122531064", "story_v_out_122531.awb")

						arg_257_1:RecordAudio("122531064", var_260_15)
						arg_257_1:RecordAudio("122531064", var_260_15)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_122531", "122531064", "story_v_out_122531.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_122531", "122531064", "story_v_out_122531.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_16 = math.max(var_260_7, arg_257_1.talkMaxDuration)

			if var_260_6 <= arg_257_1.time_ and arg_257_1.time_ < var_260_6 + var_260_16 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_6) / var_260_16

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_6 + var_260_16 and arg_257_1.time_ < var_260_6 + var_260_16 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play122531065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 122531065
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play122531066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1075ui_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.characterEffect1075ui_story == nil then
				arg_261_1.var_.characterEffect1075ui_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.200000002980232

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.characterEffect1075ui_story then
					local var_264_4 = Mathf.Lerp(0, 0.5, var_264_3)

					arg_261_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1075ui_story.fillRatio = var_264_4
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.characterEffect1075ui_story then
				local var_264_5 = 0.5

				arg_261_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1075ui_story.fillRatio = var_264_5
			end

			local var_264_6 = 0
			local var_264_7 = 1.075

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_8 = arg_261_1:FormatText(StoryNameCfg[7].name)

				arg_261_1.leftNameTxt_.text = var_264_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_9 = arg_261_1:GetWordFromCfg(122531065)
				local var_264_10 = arg_261_1:FormatText(var_264_9.content)

				arg_261_1.text_.text = var_264_10

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_11 = 43
				local var_264_12 = utf8.len(var_264_10)
				local var_264_13 = var_264_11 <= 0 and var_264_7 or var_264_7 * (var_264_12 / var_264_11)

				if var_264_13 > 0 and var_264_7 < var_264_13 then
					arg_261_1.talkMaxDuration = var_264_13

					if var_264_13 + var_264_6 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_13 + var_264_6
					end
				end

				arg_261_1.text_.text = var_264_10
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_14 = math.max(var_264_7, arg_261_1.talkMaxDuration)

			if var_264_6 <= arg_261_1.time_ and arg_261_1.time_ < var_264_6 + var_264_14 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_6) / var_264_14

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_6 + var_264_14 and arg_261_1.time_ < var_264_6 + var_264_14 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play122531066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 122531066
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play122531067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.75

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[7].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(122531066)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 30
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
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_8 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_8 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_8

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_8 and arg_265_1.time_ < var_268_0 + var_268_8 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play122531067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 122531067
		arg_269_1.duration_ = 15.766

		local var_269_0 = {
			ja = 15.766,
			ko = 10.533,
			zh = 10.533
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
				arg_269_0:Play122531068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1075ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1075ui_story == nil then
				arg_269_1.var_.characterEffect1075ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1075ui_story then
					arg_269_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1075ui_story then
				arg_269_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_272_4 = 0

			if var_272_4 < arg_269_1.time_ and arg_269_1.time_ <= var_272_4 + arg_272_0 then
				arg_269_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075actionlink/1075action443")
			end

			local var_272_5 = 0

			if var_272_5 < arg_269_1.time_ and arg_269_1.time_ <= var_272_5 + arg_272_0 then
				arg_269_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_272_6 = 0
			local var_272_7 = 1.2

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_8 = arg_269_1:FormatText(StoryNameCfg[381].name)

				arg_269_1.leftNameTxt_.text = var_272_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_9 = arg_269_1:GetWordFromCfg(122531067)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 48
				local var_272_12 = utf8.len(var_272_10)
				local var_272_13 = var_272_11 <= 0 and var_272_7 or var_272_7 * (var_272_12 / var_272_11)

				if var_272_13 > 0 and var_272_7 < var_272_13 then
					arg_269_1.talkMaxDuration = var_272_13

					if var_272_13 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_13 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_10
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531067", "story_v_out_122531.awb") ~= 0 then
					local var_272_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531067", "story_v_out_122531.awb") / 1000

					if var_272_14 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_14 + var_272_6
					end

					if var_272_9.prefab_name ~= "" and arg_269_1.actors_[var_272_9.prefab_name] ~= nil then
						local var_272_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_9.prefab_name].transform, "story_v_out_122531", "122531067", "story_v_out_122531.awb")

						arg_269_1:RecordAudio("122531067", var_272_15)
						arg_269_1:RecordAudio("122531067", var_272_15)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_122531", "122531067", "story_v_out_122531.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_122531", "122531067", "story_v_out_122531.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_16 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_16 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_16

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_16 and arg_269_1.time_ < var_272_6 + var_272_16 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play122531068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 122531068
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play122531069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1075ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.characterEffect1075ui_story == nil then
				arg_273_1.var_.characterEffect1075ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.200000002980232

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect1075ui_story then
					local var_276_4 = Mathf.Lerp(0, 0.5, var_276_3)

					arg_273_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1075ui_story.fillRatio = var_276_4
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect1075ui_story then
				local var_276_5 = 0.5

				arg_273_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1075ui_story.fillRatio = var_276_5
			end

			local var_276_6 = 0
			local var_276_7 = 0.1

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

				local var_276_9 = arg_273_1:GetWordFromCfg(122531068)
				local var_276_10 = arg_273_1:FormatText(var_276_9.content)

				arg_273_1.text_.text = var_276_10

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_11 = 4
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
	Play122531069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 122531069
		arg_277_1.duration_ = 8.9

		local var_277_0 = {
			ja = 8.9,
			ko = 4,
			zh = 4
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
				arg_277_0:Play122531070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1071ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1071ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1071ui_story, var_280_4, var_280_3)

				local var_280_5 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_5.x, var_280_5.y, var_280_5.z)

				local var_280_6 = var_280_0.localEulerAngles

				var_280_6.z = 0
				var_280_6.x = 0
				var_280_0.localEulerAngles = var_280_6
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_280_7 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_7.x, var_280_7.y, var_280_7.z)

				local var_280_8 = var_280_0.localEulerAngles

				var_280_8.z = 0
				var_280_8.x = 0
				var_280_0.localEulerAngles = var_280_8
			end

			local var_280_9 = arg_277_1.actors_["1071ui_story"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.characterEffect1071ui_story == nil then
				arg_277_1.var_.characterEffect1071ui_story = var_280_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_11 = 0.200000002980232

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.characterEffect1071ui_story then
					arg_277_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.characterEffect1071ui_story then
				arg_277_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_280_14 = arg_277_1.actors_["1075ui_story"].transform
			local var_280_15 = 0

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.var_.moveOldPos1075ui_story = var_280_14.localPosition
			end

			local var_280_16 = 0.001

			if var_280_15 <= arg_277_1.time_ and arg_277_1.time_ < var_280_15 + var_280_16 then
				local var_280_17 = (arg_277_1.time_ - var_280_15) / var_280_16
				local var_280_18 = Vector3.New(0.7, -1.055, -6.16)

				var_280_14.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1075ui_story, var_280_18, var_280_17)

				local var_280_19 = manager.ui.mainCamera.transform.position - var_280_14.position

				var_280_14.forward = Vector3.New(var_280_19.x, var_280_19.y, var_280_19.z)

				local var_280_20 = var_280_14.localEulerAngles

				var_280_20.z = 0
				var_280_20.x = 0
				var_280_14.localEulerAngles = var_280_20
			end

			if arg_277_1.time_ >= var_280_15 + var_280_16 and arg_277_1.time_ < var_280_15 + var_280_16 + arg_280_0 then
				var_280_14.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_280_21 = manager.ui.mainCamera.transform.position - var_280_14.position

				var_280_14.forward = Vector3.New(var_280_21.x, var_280_21.y, var_280_21.z)

				local var_280_22 = var_280_14.localEulerAngles

				var_280_22.z = 0
				var_280_22.x = 0
				var_280_14.localEulerAngles = var_280_22
			end

			local var_280_23 = arg_277_1.actors_["1075ui_story"]
			local var_280_24 = 0

			if var_280_24 < arg_277_1.time_ and arg_277_1.time_ <= var_280_24 + arg_280_0 and arg_277_1.var_.characterEffect1075ui_story == nil then
				arg_277_1.var_.characterEffect1075ui_story = var_280_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_25 = 0.200000002980232

			if var_280_24 <= arg_277_1.time_ and arg_277_1.time_ < var_280_24 + var_280_25 then
				local var_280_26 = (arg_277_1.time_ - var_280_24) / var_280_25

				if arg_277_1.var_.characterEffect1075ui_story then
					local var_280_27 = Mathf.Lerp(0, 0.5, var_280_26)

					arg_277_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1075ui_story.fillRatio = var_280_27
				end
			end

			if arg_277_1.time_ >= var_280_24 + var_280_25 and arg_277_1.time_ < var_280_24 + var_280_25 + arg_280_0 and arg_277_1.var_.characterEffect1075ui_story then
				local var_280_28 = 0.5

				arg_277_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1075ui_story.fillRatio = var_280_28
			end

			local var_280_29 = 0

			if var_280_29 < arg_277_1.time_ and arg_277_1.time_ <= var_280_29 + arg_280_0 then
				arg_277_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action3_2")
			end

			local var_280_30 = 0

			if var_280_30 < arg_277_1.time_ and arg_277_1.time_ <= var_280_30 + arg_280_0 then
				arg_277_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_280_31 = 0
			local var_280_32 = 0.525

			if var_280_31 < arg_277_1.time_ and arg_277_1.time_ <= var_280_31 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_33 = arg_277_1:FormatText(StoryNameCfg[384].name)

				arg_277_1.leftNameTxt_.text = var_280_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_34 = arg_277_1:GetWordFromCfg(122531069)
				local var_280_35 = arg_277_1:FormatText(var_280_34.content)

				arg_277_1.text_.text = var_280_35

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_36 = 21
				local var_280_37 = utf8.len(var_280_35)
				local var_280_38 = var_280_36 <= 0 and var_280_32 or var_280_32 * (var_280_37 / var_280_36)

				if var_280_38 > 0 and var_280_32 < var_280_38 then
					arg_277_1.talkMaxDuration = var_280_38

					if var_280_38 + var_280_31 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_38 + var_280_31
					end
				end

				arg_277_1.text_.text = var_280_35
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531069", "story_v_out_122531.awb") ~= 0 then
					local var_280_39 = manager.audio:GetVoiceLength("story_v_out_122531", "122531069", "story_v_out_122531.awb") / 1000

					if var_280_39 + var_280_31 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_39 + var_280_31
					end

					if var_280_34.prefab_name ~= "" and arg_277_1.actors_[var_280_34.prefab_name] ~= nil then
						local var_280_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_34.prefab_name].transform, "story_v_out_122531", "122531069", "story_v_out_122531.awb")

						arg_277_1:RecordAudio("122531069", var_280_40)
						arg_277_1:RecordAudio("122531069", var_280_40)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_122531", "122531069", "story_v_out_122531.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_122531", "122531069", "story_v_out_122531.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_41 = math.max(var_280_32, arg_277_1.talkMaxDuration)

			if var_280_31 <= arg_277_1.time_ and arg_277_1.time_ < var_280_31 + var_280_41 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_31) / var_280_41

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_31 + var_280_41 and arg_277_1.time_ < var_280_31 + var_280_41 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play122531070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 122531070
		arg_281_1.duration_ = 7.733

		local var_281_0 = {
			ja = 7.733,
			ko = 7.6,
			zh = 7.6
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play122531071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1075ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1075ui_story == nil then
				arg_281_1.var_.characterEffect1075ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1075ui_story then
					arg_281_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1075ui_story then
				arg_281_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_284_4 = 0

			if var_284_4 < arg_281_1.time_ and arg_281_1.time_ <= var_284_4 + arg_284_0 then
				arg_281_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_284_5 = 0

			if var_284_5 < arg_281_1.time_ and arg_281_1.time_ <= var_284_5 + arg_284_0 then
				arg_281_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_284_6 = arg_281_1.actors_["1071ui_story"]
			local var_284_7 = 0

			if var_284_7 < arg_281_1.time_ and arg_281_1.time_ <= var_284_7 + arg_284_0 and arg_281_1.var_.characterEffect1071ui_story == nil then
				arg_281_1.var_.characterEffect1071ui_story = var_284_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_8 = 0.200000002980232

			if var_284_7 <= arg_281_1.time_ and arg_281_1.time_ < var_284_7 + var_284_8 then
				local var_284_9 = (arg_281_1.time_ - var_284_7) / var_284_8

				if arg_281_1.var_.characterEffect1071ui_story then
					local var_284_10 = Mathf.Lerp(0, 0.5, var_284_9)

					arg_281_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1071ui_story.fillRatio = var_284_10
				end
			end

			if arg_281_1.time_ >= var_284_7 + var_284_8 and arg_281_1.time_ < var_284_7 + var_284_8 + arg_284_0 and arg_281_1.var_.characterEffect1071ui_story then
				local var_284_11 = 0.5

				arg_281_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1071ui_story.fillRatio = var_284_11
			end

			local var_284_12 = 0
			local var_284_13 = 0.75

			if var_284_12 < arg_281_1.time_ and arg_281_1.time_ <= var_284_12 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_14 = arg_281_1:FormatText(StoryNameCfg[381].name)

				arg_281_1.leftNameTxt_.text = var_284_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_15 = arg_281_1:GetWordFromCfg(122531070)
				local var_284_16 = arg_281_1:FormatText(var_284_15.content)

				arg_281_1.text_.text = var_284_16

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_17 = 30
				local var_284_18 = utf8.len(var_284_16)
				local var_284_19 = var_284_17 <= 0 and var_284_13 or var_284_13 * (var_284_18 / var_284_17)

				if var_284_19 > 0 and var_284_13 < var_284_19 then
					arg_281_1.talkMaxDuration = var_284_19

					if var_284_19 + var_284_12 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_12
					end
				end

				arg_281_1.text_.text = var_284_16
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531070", "story_v_out_122531.awb") ~= 0 then
					local var_284_20 = manager.audio:GetVoiceLength("story_v_out_122531", "122531070", "story_v_out_122531.awb") / 1000

					if var_284_20 + var_284_12 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_20 + var_284_12
					end

					if var_284_15.prefab_name ~= "" and arg_281_1.actors_[var_284_15.prefab_name] ~= nil then
						local var_284_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_15.prefab_name].transform, "story_v_out_122531", "122531070", "story_v_out_122531.awb")

						arg_281_1:RecordAudio("122531070", var_284_21)
						arg_281_1:RecordAudio("122531070", var_284_21)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_122531", "122531070", "story_v_out_122531.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_122531", "122531070", "story_v_out_122531.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_22 = math.max(var_284_13, arg_281_1.talkMaxDuration)

			if var_284_12 <= arg_281_1.time_ and arg_281_1.time_ < var_284_12 + var_284_22 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_12) / var_284_22

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_12 + var_284_22 and arg_281_1.time_ < var_284_12 + var_284_22 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play122531071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 122531071
		arg_285_1.duration_ = 6.2

		local var_285_0 = {
			ja = 6.2,
			ko = 3.8,
			zh = 3.8
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
				arg_285_0:Play122531072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.4

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[381].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(122531071)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531071", "story_v_out_122531.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531071", "story_v_out_122531.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_122531", "122531071", "story_v_out_122531.awb")

						arg_285_1:RecordAudio("122531071", var_288_9)
						arg_285_1:RecordAudio("122531071", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_122531", "122531071", "story_v_out_122531.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_122531", "122531071", "story_v_out_122531.awb")
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
	Play122531072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 122531072
		arg_289_1.duration_ = 6.566

		local var_289_0 = {
			ja = 6.566,
			ko = 3.5,
			zh = 3.5
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
				arg_289_0:Play122531073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.625

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[381].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(122531072)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531072", "story_v_out_122531.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531072", "story_v_out_122531.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_122531", "122531072", "story_v_out_122531.awb")

						arg_289_1:RecordAudio("122531072", var_292_9)
						arg_289_1:RecordAudio("122531072", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_122531", "122531072", "story_v_out_122531.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_122531", "122531072", "story_v_out_122531.awb")
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
	Play122531073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 122531073
		arg_293_1.duration_ = 8.999999999999

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play122531074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = "ST41"

			if arg_293_1.bgs_[var_296_0] == nil then
				local var_296_1 = Object.Instantiate(arg_293_1.paintGo_)

				var_296_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_296_0)
				var_296_1.name = var_296_0
				var_296_1.transform.parent = arg_293_1.stage_.transform
				var_296_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_293_1.bgs_[var_296_0] = var_296_1
			end

			local var_296_2 = 1.999999999999

			if var_296_2 < arg_293_1.time_ and arg_293_1.time_ <= var_296_2 + arg_296_0 then
				local var_296_3 = manager.ui.mainCamera.transform.localPosition
				local var_296_4 = Vector3.New(0, 0, 10) + Vector3.New(var_296_3.x, var_296_3.y, 0)
				local var_296_5 = arg_293_1.bgs_.ST41

				var_296_5.transform.localPosition = var_296_4
				var_296_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_296_6 = var_296_5:GetComponent("SpriteRenderer")

				if var_296_6 and var_296_6.sprite then
					local var_296_7 = (var_296_5.transform.localPosition - var_296_3).z
					local var_296_8 = manager.ui.mainCameraCom_
					local var_296_9 = 2 * var_296_7 * Mathf.Tan(var_296_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_296_10 = var_296_9 * var_296_8.aspect
					local var_296_11 = var_296_6.sprite.bounds.size.x
					local var_296_12 = var_296_6.sprite.bounds.size.y
					local var_296_13 = var_296_10 / var_296_11
					local var_296_14 = var_296_9 / var_296_12
					local var_296_15 = var_296_14 < var_296_13 and var_296_13 or var_296_14

					var_296_5.transform.localScale = Vector3.New(var_296_15, var_296_15, 0)
				end

				for iter_296_0, iter_296_1 in pairs(arg_293_1.bgs_) do
					if iter_296_0 ~= "ST41" then
						iter_296_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 then
				arg_293_1.mask_.enabled = true
				arg_293_1.mask_.raycastTarget = true

				arg_293_1:SetGaussion(false)
			end

			local var_296_17 = 2

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17
				local var_296_19 = Color.New(0, 0, 0)

				var_296_19.a = Mathf.Lerp(0, 1, var_296_18)
				arg_293_1.mask_.color = var_296_19
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				local var_296_20 = Color.New(0, 0, 0)

				var_296_20.a = 1
				arg_293_1.mask_.color = var_296_20
			end

			local var_296_21 = 2

			if var_296_21 < arg_293_1.time_ and arg_293_1.time_ <= var_296_21 + arg_296_0 then
				arg_293_1.mask_.enabled = true
				arg_293_1.mask_.raycastTarget = true

				arg_293_1:SetGaussion(false)
			end

			local var_296_22 = 2

			if var_296_21 <= arg_293_1.time_ and arg_293_1.time_ < var_296_21 + var_296_22 then
				local var_296_23 = (arg_293_1.time_ - var_296_21) / var_296_22
				local var_296_24 = Color.New(0, 0, 0)

				var_296_24.a = Mathf.Lerp(1, 0, var_296_23)
				arg_293_1.mask_.color = var_296_24
			end

			if arg_293_1.time_ >= var_296_21 + var_296_22 and arg_293_1.time_ < var_296_21 + var_296_22 + arg_296_0 then
				local var_296_25 = Color.New(0, 0, 0)
				local var_296_26 = 0

				arg_293_1.mask_.enabled = false
				var_296_25.a = var_296_26
				arg_293_1.mask_.color = var_296_25
			end

			local var_296_27 = arg_293_1.actors_["1071ui_story"].transform
			local var_296_28 = 1.96599999815226

			if var_296_28 < arg_293_1.time_ and arg_293_1.time_ <= var_296_28 + arg_296_0 then
				arg_293_1.var_.moveOldPos1071ui_story = var_296_27.localPosition
			end

			local var_296_29 = 0.001

			if var_296_28 <= arg_293_1.time_ and arg_293_1.time_ < var_296_28 + var_296_29 then
				local var_296_30 = (arg_293_1.time_ - var_296_28) / var_296_29
				local var_296_31 = Vector3.New(0, 100, 0)

				var_296_27.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1071ui_story, var_296_31, var_296_30)

				local var_296_32 = manager.ui.mainCamera.transform.position - var_296_27.position

				var_296_27.forward = Vector3.New(var_296_32.x, var_296_32.y, var_296_32.z)

				local var_296_33 = var_296_27.localEulerAngles

				var_296_33.z = 0
				var_296_33.x = 0
				var_296_27.localEulerAngles = var_296_33
			end

			if arg_293_1.time_ >= var_296_28 + var_296_29 and arg_293_1.time_ < var_296_28 + var_296_29 + arg_296_0 then
				var_296_27.localPosition = Vector3.New(0, 100, 0)

				local var_296_34 = manager.ui.mainCamera.transform.position - var_296_27.position

				var_296_27.forward = Vector3.New(var_296_34.x, var_296_34.y, var_296_34.z)

				local var_296_35 = var_296_27.localEulerAngles

				var_296_35.z = 0
				var_296_35.x = 0
				var_296_27.localEulerAngles = var_296_35
			end

			local var_296_36 = arg_293_1.actors_["1071ui_story"]
			local var_296_37 = 1.96599999815226

			if var_296_37 < arg_293_1.time_ and arg_293_1.time_ <= var_296_37 + arg_296_0 and arg_293_1.var_.characterEffect1071ui_story == nil then
				arg_293_1.var_.characterEffect1071ui_story = var_296_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_38 = 0.034000001847744

			if var_296_37 <= arg_293_1.time_ and arg_293_1.time_ < var_296_37 + var_296_38 then
				local var_296_39 = (arg_293_1.time_ - var_296_37) / var_296_38

				if arg_293_1.var_.characterEffect1071ui_story then
					local var_296_40 = Mathf.Lerp(0, 0.5, var_296_39)

					arg_293_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1071ui_story.fillRatio = var_296_40
				end
			end

			if arg_293_1.time_ >= var_296_37 + var_296_38 and arg_293_1.time_ < var_296_37 + var_296_38 + arg_296_0 and arg_293_1.var_.characterEffect1071ui_story then
				local var_296_41 = 0.5

				arg_293_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1071ui_story.fillRatio = var_296_41
			end

			local var_296_42 = arg_293_1.actors_["1075ui_story"].transform
			local var_296_43 = 1.96599999815226

			if var_296_43 < arg_293_1.time_ and arg_293_1.time_ <= var_296_43 + arg_296_0 then
				arg_293_1.var_.moveOldPos1075ui_story = var_296_42.localPosition
			end

			local var_296_44 = 0.001

			if var_296_43 <= arg_293_1.time_ and arg_293_1.time_ < var_296_43 + var_296_44 then
				local var_296_45 = (arg_293_1.time_ - var_296_43) / var_296_44
				local var_296_46 = Vector3.New(0, 100, 0)

				var_296_42.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1075ui_story, var_296_46, var_296_45)

				local var_296_47 = manager.ui.mainCamera.transform.position - var_296_42.position

				var_296_42.forward = Vector3.New(var_296_47.x, var_296_47.y, var_296_47.z)

				local var_296_48 = var_296_42.localEulerAngles

				var_296_48.z = 0
				var_296_48.x = 0
				var_296_42.localEulerAngles = var_296_48
			end

			if arg_293_1.time_ >= var_296_43 + var_296_44 and arg_293_1.time_ < var_296_43 + var_296_44 + arg_296_0 then
				var_296_42.localPosition = Vector3.New(0, 100, 0)

				local var_296_49 = manager.ui.mainCamera.transform.position - var_296_42.position

				var_296_42.forward = Vector3.New(var_296_49.x, var_296_49.y, var_296_49.z)

				local var_296_50 = var_296_42.localEulerAngles

				var_296_50.z = 0
				var_296_50.x = 0
				var_296_42.localEulerAngles = var_296_50
			end

			local var_296_51 = arg_293_1.actors_["1075ui_story"]
			local var_296_52 = 1.96599999815226

			if var_296_52 < arg_293_1.time_ and arg_293_1.time_ <= var_296_52 + arg_296_0 and arg_293_1.var_.characterEffect1075ui_story == nil then
				arg_293_1.var_.characterEffect1075ui_story = var_296_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_53 = 0.034000001847744

			if var_296_52 <= arg_293_1.time_ and arg_293_1.time_ < var_296_52 + var_296_53 then
				local var_296_54 = (arg_293_1.time_ - var_296_52) / var_296_53

				if arg_293_1.var_.characterEffect1075ui_story then
					local var_296_55 = Mathf.Lerp(0, 0.5, var_296_54)

					arg_293_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1075ui_story.fillRatio = var_296_55
				end
			end

			if arg_293_1.time_ >= var_296_52 + var_296_53 and arg_293_1.time_ < var_296_52 + var_296_53 + arg_296_0 and arg_293_1.var_.characterEffect1075ui_story then
				local var_296_56 = 0.5

				arg_293_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1075ui_story.fillRatio = var_296_56
			end

			if arg_293_1.frameCnt_ <= 1 then
				arg_293_1.dialog_:SetActive(false)
			end

			local var_296_57 = 3.999999999999
			local var_296_58 = 1.5

			if var_296_57 < arg_293_1.time_ and arg_293_1.time_ <= var_296_57 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0

				arg_293_1.dialog_:SetActive(true)

				local var_296_59 = LeanTween.value(arg_293_1.dialog_, 0, 1, 0.3)

				var_296_59:setOnUpdate(LuaHelper.FloatAction(function(arg_297_0)
					arg_293_1.dialogCg_.alpha = arg_297_0
				end))
				var_296_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_293_1.dialog_)
					var_296_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_293_1.duration_ = arg_293_1.duration_ + 0.3

				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_60 = arg_293_1:GetWordFromCfg(122531073)
				local var_296_61 = arg_293_1:FormatText(var_296_60.content)

				arg_293_1.text_.text = var_296_61

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_62 = 60
				local var_296_63 = utf8.len(var_296_61)
				local var_296_64 = var_296_62 <= 0 and var_296_58 or var_296_58 * (var_296_63 / var_296_62)

				if var_296_64 > 0 and var_296_58 < var_296_64 then
					arg_293_1.talkMaxDuration = var_296_64
					var_296_57 = var_296_57 + 0.3

					if var_296_64 + var_296_57 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_64 + var_296_57
					end
				end

				arg_293_1.text_.text = var_296_61
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_65 = var_296_57 + 0.3
			local var_296_66 = math.max(var_296_58, arg_293_1.talkMaxDuration)

			if var_296_65 <= arg_293_1.time_ and arg_293_1.time_ < var_296_65 + var_296_66 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_65) / var_296_66

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_65 + var_296_66 and arg_293_1.time_ < var_296_65 + var_296_66 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play122531074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 122531074
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play122531075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 1

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_2 = arg_299_1:GetWordFromCfg(122531074)
				local var_302_3 = arg_299_1:FormatText(var_302_2.content)

				arg_299_1.text_.text = var_302_3

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_4 = 40
				local var_302_5 = utf8.len(var_302_3)
				local var_302_6 = var_302_4 <= 0 and var_302_1 or var_302_1 * (var_302_5 / var_302_4)

				if var_302_6 > 0 and var_302_1 < var_302_6 then
					arg_299_1.talkMaxDuration = var_302_6

					if var_302_6 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_6 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_3
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_7 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_7 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_7

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_7 and arg_299_1.time_ < var_302_0 + var_302_7 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play122531075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 122531075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play122531076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.75

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_2 = arg_303_1:GetWordFromCfg(122531075)
				local var_306_3 = arg_303_1:FormatText(var_306_2.content)

				arg_303_1.text_.text = var_306_3

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_4 = 30
				local var_306_5 = utf8.len(var_306_3)
				local var_306_6 = var_306_4 <= 0 and var_306_1 or var_306_1 * (var_306_5 / var_306_4)

				if var_306_6 > 0 and var_306_1 < var_306_6 then
					arg_303_1.talkMaxDuration = var_306_6

					if var_306_6 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_6 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_3
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_7 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_7 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_7

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_7 and arg_303_1.time_ < var_306_0 + var_306_7 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play122531076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 122531076
		arg_307_1.duration_ = 2.433

		local var_307_0 = {
			ja = 2.433,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_307_0:Play122531077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1071ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1071ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, -1.05, -6.2)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1071ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = arg_307_1.actors_["1071ui_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and arg_307_1.var_.characterEffect1071ui_story == nil then
				arg_307_1.var_.characterEffect1071ui_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect1071ui_story then
					arg_307_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect1071ui_story then
				arg_307_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_310_13 = 0

			if var_310_13 < arg_307_1.time_ and arg_307_1.time_ <= var_310_13 + arg_310_0 then
				arg_307_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_310_14 = 0

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 then
				arg_307_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_310_15 = 0
			local var_310_16 = 0.1

			if var_310_15 < arg_307_1.time_ and arg_307_1.time_ <= var_310_15 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_17 = arg_307_1:FormatText(StoryNameCfg[384].name)

				arg_307_1.leftNameTxt_.text = var_310_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_18 = arg_307_1:GetWordFromCfg(122531076)
				local var_310_19 = arg_307_1:FormatText(var_310_18.content)

				arg_307_1.text_.text = var_310_19

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_20 = 4
				local var_310_21 = utf8.len(var_310_19)
				local var_310_22 = var_310_20 <= 0 and var_310_16 or var_310_16 * (var_310_21 / var_310_20)

				if var_310_22 > 0 and var_310_16 < var_310_22 then
					arg_307_1.talkMaxDuration = var_310_22

					if var_310_22 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_22 + var_310_15
					end
				end

				arg_307_1.text_.text = var_310_19
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531076", "story_v_out_122531.awb") ~= 0 then
					local var_310_23 = manager.audio:GetVoiceLength("story_v_out_122531", "122531076", "story_v_out_122531.awb") / 1000

					if var_310_23 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_23 + var_310_15
					end

					if var_310_18.prefab_name ~= "" and arg_307_1.actors_[var_310_18.prefab_name] ~= nil then
						local var_310_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_18.prefab_name].transform, "story_v_out_122531", "122531076", "story_v_out_122531.awb")

						arg_307_1:RecordAudio("122531076", var_310_24)
						arg_307_1:RecordAudio("122531076", var_310_24)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_122531", "122531076", "story_v_out_122531.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_122531", "122531076", "story_v_out_122531.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_25 = math.max(var_310_16, arg_307_1.talkMaxDuration)

			if var_310_15 <= arg_307_1.time_ and arg_307_1.time_ < var_310_15 + var_310_25 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_15) / var_310_25

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_15 + var_310_25 and arg_307_1.time_ < var_310_15 + var_310_25 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play122531077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 122531077
		arg_311_1.duration_ = 7.2

		local var_311_0 = {
			ja = 7.2,
			ko = 4.933,
			zh = 4.933
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
				arg_311_0:Play122531078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1075ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos1075ui_story = var_314_0.localPosition
			end

			local var_314_2 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2
				local var_314_4 = Vector3.New(0, -1.055, -6.16)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1075ui_story, var_314_4, var_314_3)

				local var_314_5 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_5.x, var_314_5.y, var_314_5.z)

				local var_314_6 = var_314_0.localEulerAngles

				var_314_6.z = 0
				var_314_6.x = 0
				var_314_0.localEulerAngles = var_314_6
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_314_7 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_7.x, var_314_7.y, var_314_7.z)

				local var_314_8 = var_314_0.localEulerAngles

				var_314_8.z = 0
				var_314_8.x = 0
				var_314_0.localEulerAngles = var_314_8
			end

			local var_314_9 = arg_311_1.actors_["1075ui_story"]
			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 and arg_311_1.var_.characterEffect1075ui_story == nil then
				arg_311_1.var_.characterEffect1075ui_story = var_314_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_11 = 0.200000002980232

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_11 then
				local var_314_12 = (arg_311_1.time_ - var_314_10) / var_314_11

				if arg_311_1.var_.characterEffect1075ui_story then
					arg_311_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_10 + var_314_11 and arg_311_1.time_ < var_314_10 + var_314_11 + arg_314_0 and arg_311_1.var_.characterEffect1075ui_story then
				arg_311_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_314_13 = 0

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_314_15 = arg_311_1.actors_["1071ui_story"].transform
			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.var_.moveOldPos1071ui_story = var_314_15.localPosition
			end

			local var_314_17 = 0.001

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Vector3.New(0, 100, 0)

				var_314_15.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1071ui_story, var_314_19, var_314_18)

				local var_314_20 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_20.x, var_314_20.y, var_314_20.z)

				local var_314_21 = var_314_15.localEulerAngles

				var_314_21.z = 0
				var_314_21.x = 0
				var_314_15.localEulerAngles = var_314_21
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				var_314_15.localPosition = Vector3.New(0, 100, 0)

				local var_314_22 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_22.x, var_314_22.y, var_314_22.z)

				local var_314_23 = var_314_15.localEulerAngles

				var_314_23.z = 0
				var_314_23.x = 0
				var_314_15.localEulerAngles = var_314_23
			end

			local var_314_24 = arg_311_1.actors_["1071ui_story"]
			local var_314_25 = 0

			if var_314_25 < arg_311_1.time_ and arg_311_1.time_ <= var_314_25 + arg_314_0 and arg_311_1.var_.characterEffect1071ui_story == nil then
				arg_311_1.var_.characterEffect1071ui_story = var_314_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_26 = 0.200000002980232

			if var_314_25 <= arg_311_1.time_ and arg_311_1.time_ < var_314_25 + var_314_26 then
				local var_314_27 = (arg_311_1.time_ - var_314_25) / var_314_26

				if arg_311_1.var_.characterEffect1071ui_story then
					local var_314_28 = Mathf.Lerp(0, 0.5, var_314_27)

					arg_311_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1071ui_story.fillRatio = var_314_28
				end
			end

			if arg_311_1.time_ >= var_314_25 + var_314_26 and arg_311_1.time_ < var_314_25 + var_314_26 + arg_314_0 and arg_311_1.var_.characterEffect1071ui_story then
				local var_314_29 = 0.5

				arg_311_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1071ui_story.fillRatio = var_314_29
			end

			local var_314_30 = 0
			local var_314_31 = 0.6

			if var_314_30 < arg_311_1.time_ and arg_311_1.time_ <= var_314_30 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_32 = arg_311_1:FormatText(StoryNameCfg[381].name)

				arg_311_1.leftNameTxt_.text = var_314_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_33 = arg_311_1:GetWordFromCfg(122531077)
				local var_314_34 = arg_311_1:FormatText(var_314_33.content)

				arg_311_1.text_.text = var_314_34

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_35 = 24
				local var_314_36 = utf8.len(var_314_34)
				local var_314_37 = var_314_35 <= 0 and var_314_31 or var_314_31 * (var_314_36 / var_314_35)

				if var_314_37 > 0 and var_314_31 < var_314_37 then
					arg_311_1.talkMaxDuration = var_314_37

					if var_314_37 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_37 + var_314_30
					end
				end

				arg_311_1.text_.text = var_314_34
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531077", "story_v_out_122531.awb") ~= 0 then
					local var_314_38 = manager.audio:GetVoiceLength("story_v_out_122531", "122531077", "story_v_out_122531.awb") / 1000

					if var_314_38 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_38 + var_314_30
					end

					if var_314_33.prefab_name ~= "" and arg_311_1.actors_[var_314_33.prefab_name] ~= nil then
						local var_314_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_33.prefab_name].transform, "story_v_out_122531", "122531077", "story_v_out_122531.awb")

						arg_311_1:RecordAudio("122531077", var_314_39)
						arg_311_1:RecordAudio("122531077", var_314_39)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_122531", "122531077", "story_v_out_122531.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_122531", "122531077", "story_v_out_122531.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_40 = math.max(var_314_31, arg_311_1.talkMaxDuration)

			if var_314_30 <= arg_311_1.time_ and arg_311_1.time_ < var_314_30 + var_314_40 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_30) / var_314_40

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_30 + var_314_40 and arg_311_1.time_ < var_314_30 + var_314_40 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play122531078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 122531078
		arg_315_1.duration_ = 6.9

		local var_315_0 = {
			ja = 6.9,
			ko = 5.533,
			zh = 5.533
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
				arg_315_0:Play122531079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = "1069ui_story"

			if arg_315_1.actors_[var_318_0] == nil then
				local var_318_1 = Object.Instantiate(Asset.Load("Char/" .. var_318_0), arg_315_1.stage_.transform)

				var_318_1.name = var_318_0
				var_318_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_315_1.actors_[var_318_0] = var_318_1

				local var_318_2 = var_318_1:GetComponentInChildren(typeof(CharacterEffect))

				var_318_2.enabled = true

				local var_318_3 = GameObjectTools.GetOrAddComponent(var_318_1, typeof(DynamicBoneHelper))

				if var_318_3 then
					var_318_3:EnableDynamicBone(false)
				end

				arg_315_1:ShowWeapon(var_318_2.transform, false)

				arg_315_1.var_[var_318_0 .. "Animator"] = var_318_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_315_1.var_[var_318_0 .. "Animator"].applyRootMotion = true
				arg_315_1.var_[var_318_0 .. "LipSync"] = var_318_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_318_4 = arg_315_1.actors_["1069ui_story"].transform
			local var_318_5 = 0

			if var_318_5 < arg_315_1.time_ and arg_315_1.time_ <= var_318_5 + arg_318_0 then
				arg_315_1.var_.moveOldPos1069ui_story = var_318_4.localPosition
			end

			local var_318_6 = 0.001

			if var_318_5 <= arg_315_1.time_ and arg_315_1.time_ < var_318_5 + var_318_6 then
				local var_318_7 = (arg_315_1.time_ - var_318_5) / var_318_6
				local var_318_8 = Vector3.New(0, -1, -6)

				var_318_4.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1069ui_story, var_318_8, var_318_7)

				local var_318_9 = manager.ui.mainCamera.transform.position - var_318_4.position

				var_318_4.forward = Vector3.New(var_318_9.x, var_318_9.y, var_318_9.z)

				local var_318_10 = var_318_4.localEulerAngles

				var_318_10.z = 0
				var_318_10.x = 0
				var_318_4.localEulerAngles = var_318_10
			end

			if arg_315_1.time_ >= var_318_5 + var_318_6 and arg_315_1.time_ < var_318_5 + var_318_6 + arg_318_0 then
				var_318_4.localPosition = Vector3.New(0, -1, -6)

				local var_318_11 = manager.ui.mainCamera.transform.position - var_318_4.position

				var_318_4.forward = Vector3.New(var_318_11.x, var_318_11.y, var_318_11.z)

				local var_318_12 = var_318_4.localEulerAngles

				var_318_12.z = 0
				var_318_12.x = 0
				var_318_4.localEulerAngles = var_318_12
			end

			local var_318_13 = arg_315_1.actors_["1069ui_story"]
			local var_318_14 = 0

			if var_318_14 < arg_315_1.time_ and arg_315_1.time_ <= var_318_14 + arg_318_0 and arg_315_1.var_.characterEffect1069ui_story == nil then
				arg_315_1.var_.characterEffect1069ui_story = var_318_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_15 = 0.200000002980232

			if var_318_14 <= arg_315_1.time_ and arg_315_1.time_ < var_318_14 + var_318_15 then
				local var_318_16 = (arg_315_1.time_ - var_318_14) / var_318_15

				if arg_315_1.var_.characterEffect1069ui_story then
					arg_315_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_14 + var_318_15 and arg_315_1.time_ < var_318_14 + var_318_15 + arg_318_0 and arg_315_1.var_.characterEffect1069ui_story then
				arg_315_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_318_17 = 0

			if var_318_17 < arg_315_1.time_ and arg_315_1.time_ <= var_318_17 + arg_318_0 then
				arg_315_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_318_18 = 0

			if var_318_18 < arg_315_1.time_ and arg_315_1.time_ <= var_318_18 + arg_318_0 then
				arg_315_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_19 = arg_315_1.actors_["1075ui_story"].transform
			local var_318_20 = 0

			if var_318_20 < arg_315_1.time_ and arg_315_1.time_ <= var_318_20 + arg_318_0 then
				arg_315_1.var_.moveOldPos1075ui_story = var_318_19.localPosition
			end

			local var_318_21 = 0.001

			if var_318_20 <= arg_315_1.time_ and arg_315_1.time_ < var_318_20 + var_318_21 then
				local var_318_22 = (arg_315_1.time_ - var_318_20) / var_318_21
				local var_318_23 = Vector3.New(0, 100, 0)

				var_318_19.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1075ui_story, var_318_23, var_318_22)

				local var_318_24 = manager.ui.mainCamera.transform.position - var_318_19.position

				var_318_19.forward = Vector3.New(var_318_24.x, var_318_24.y, var_318_24.z)

				local var_318_25 = var_318_19.localEulerAngles

				var_318_25.z = 0
				var_318_25.x = 0
				var_318_19.localEulerAngles = var_318_25
			end

			if arg_315_1.time_ >= var_318_20 + var_318_21 and arg_315_1.time_ < var_318_20 + var_318_21 + arg_318_0 then
				var_318_19.localPosition = Vector3.New(0, 100, 0)

				local var_318_26 = manager.ui.mainCamera.transform.position - var_318_19.position

				var_318_19.forward = Vector3.New(var_318_26.x, var_318_26.y, var_318_26.z)

				local var_318_27 = var_318_19.localEulerAngles

				var_318_27.z = 0
				var_318_27.x = 0
				var_318_19.localEulerAngles = var_318_27
			end

			local var_318_28 = arg_315_1.actors_["1075ui_story"]
			local var_318_29 = 0

			if var_318_29 < arg_315_1.time_ and arg_315_1.time_ <= var_318_29 + arg_318_0 and arg_315_1.var_.characterEffect1075ui_story == nil then
				arg_315_1.var_.characterEffect1075ui_story = var_318_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_30 = 0.200000002980232

			if var_318_29 <= arg_315_1.time_ and arg_315_1.time_ < var_318_29 + var_318_30 then
				local var_318_31 = (arg_315_1.time_ - var_318_29) / var_318_30

				if arg_315_1.var_.characterEffect1075ui_story then
					local var_318_32 = Mathf.Lerp(0, 0.5, var_318_31)

					arg_315_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1075ui_story.fillRatio = var_318_32
				end
			end

			if arg_315_1.time_ >= var_318_29 + var_318_30 and arg_315_1.time_ < var_318_29 + var_318_30 + arg_318_0 and arg_315_1.var_.characterEffect1075ui_story then
				local var_318_33 = 0.5

				arg_315_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1075ui_story.fillRatio = var_318_33
			end

			local var_318_34 = 0
			local var_318_35 = 0.45

			if var_318_34 < arg_315_1.time_ and arg_315_1.time_ <= var_318_34 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_36 = arg_315_1:FormatText(StoryNameCfg[378].name)

				arg_315_1.leftNameTxt_.text = var_318_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_37 = arg_315_1:GetWordFromCfg(122531078)
				local var_318_38 = arg_315_1:FormatText(var_318_37.content)

				arg_315_1.text_.text = var_318_38

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_39 = 18
				local var_318_40 = utf8.len(var_318_38)
				local var_318_41 = var_318_39 <= 0 and var_318_35 or var_318_35 * (var_318_40 / var_318_39)

				if var_318_41 > 0 and var_318_35 < var_318_41 then
					arg_315_1.talkMaxDuration = var_318_41

					if var_318_41 + var_318_34 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_41 + var_318_34
					end
				end

				arg_315_1.text_.text = var_318_38
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531078", "story_v_out_122531.awb") ~= 0 then
					local var_318_42 = manager.audio:GetVoiceLength("story_v_out_122531", "122531078", "story_v_out_122531.awb") / 1000

					if var_318_42 + var_318_34 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_42 + var_318_34
					end

					if var_318_37.prefab_name ~= "" and arg_315_1.actors_[var_318_37.prefab_name] ~= nil then
						local var_318_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_37.prefab_name].transform, "story_v_out_122531", "122531078", "story_v_out_122531.awb")

						arg_315_1:RecordAudio("122531078", var_318_43)
						arg_315_1:RecordAudio("122531078", var_318_43)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_122531", "122531078", "story_v_out_122531.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_122531", "122531078", "story_v_out_122531.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_44 = math.max(var_318_35, arg_315_1.talkMaxDuration)

			if var_318_34 <= arg_315_1.time_ and arg_315_1.time_ < var_318_34 + var_318_44 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_34) / var_318_44

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_34 + var_318_44 and arg_315_1.time_ < var_318_34 + var_318_44 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play122531079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 122531079
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play122531080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1069ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1069ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0, 100, 0)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1069ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, 100, 0)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["1075ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect1075ui_story == nil then
				arg_319_1.var_.characterEffect1075ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect1075ui_story then
					local var_322_13 = Mathf.Lerp(0, 0.5, var_322_12)

					arg_319_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1075ui_story.fillRatio = var_322_13
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect1075ui_story then
				local var_322_14 = 0.5

				arg_319_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1075ui_story.fillRatio = var_322_14
			end

			local var_322_15 = arg_319_1.actors_["1069ui_story"]
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 and arg_319_1.var_.characterEffect1069ui_story == nil then
				arg_319_1.var_.characterEffect1069ui_story = var_322_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_17 = 0.200000002980232

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17

				if arg_319_1.var_.characterEffect1069ui_story then
					local var_322_19 = Mathf.Lerp(0, 0.5, var_322_18)

					arg_319_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1069ui_story.fillRatio = var_322_19
				end
			end

			if arg_319_1.time_ >= var_322_16 + var_322_17 and arg_319_1.time_ < var_322_16 + var_322_17 + arg_322_0 and arg_319_1.var_.characterEffect1069ui_story then
				local var_322_20 = 0.5

				arg_319_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1069ui_story.fillRatio = var_322_20
			end

			local var_322_21 = 0
			local var_322_22 = 0.6

			if var_322_21 < arg_319_1.time_ and arg_319_1.time_ <= var_322_21 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_23 = arg_319_1:GetWordFromCfg(122531079)
				local var_322_24 = arg_319_1:FormatText(var_322_23.content)

				arg_319_1.text_.text = var_322_24

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_25 = 24
				local var_322_26 = utf8.len(var_322_24)
				local var_322_27 = var_322_25 <= 0 and var_322_22 or var_322_22 * (var_322_26 / var_322_25)

				if var_322_27 > 0 and var_322_22 < var_322_27 then
					arg_319_1.talkMaxDuration = var_322_27

					if var_322_27 + var_322_21 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_27 + var_322_21
					end
				end

				arg_319_1.text_.text = var_322_24
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_28 = math.max(var_322_22, arg_319_1.talkMaxDuration)

			if var_322_21 <= arg_319_1.time_ and arg_319_1.time_ < var_322_21 + var_322_28 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_21) / var_322_28

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_21 + var_322_28 and arg_319_1.time_ < var_322_21 + var_322_28 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play122531080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 122531080
		arg_323_1.duration_ = 8.266

		local var_323_0 = {
			ja = 8.266,
			ko = 5.8,
			zh = 5.8
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
				arg_323_0:Play122531081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1071ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos1071ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(0, -1.05, -6.2)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1071ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["1071ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect1071ui_story == nil then
				arg_323_1.var_.characterEffect1071ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect1071ui_story then
					arg_323_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect1071ui_story then
				arg_323_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_326_13 = 0

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_326_14 = 0
			local var_326_15 = 0.45

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_16 = arg_323_1:FormatText(StoryNameCfg[384].name)

				arg_323_1.leftNameTxt_.text = var_326_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_17 = arg_323_1:GetWordFromCfg(122531080)
				local var_326_18 = arg_323_1:FormatText(var_326_17.content)

				arg_323_1.text_.text = var_326_18

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_19 = 18
				local var_326_20 = utf8.len(var_326_18)
				local var_326_21 = var_326_19 <= 0 and var_326_15 or var_326_15 * (var_326_20 / var_326_19)

				if var_326_21 > 0 and var_326_15 < var_326_21 then
					arg_323_1.talkMaxDuration = var_326_21

					if var_326_21 + var_326_14 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_21 + var_326_14
					end
				end

				arg_323_1.text_.text = var_326_18
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531080", "story_v_out_122531.awb") ~= 0 then
					local var_326_22 = manager.audio:GetVoiceLength("story_v_out_122531", "122531080", "story_v_out_122531.awb") / 1000

					if var_326_22 + var_326_14 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_22 + var_326_14
					end

					if var_326_17.prefab_name ~= "" and arg_323_1.actors_[var_326_17.prefab_name] ~= nil then
						local var_326_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_17.prefab_name].transform, "story_v_out_122531", "122531080", "story_v_out_122531.awb")

						arg_323_1:RecordAudio("122531080", var_326_23)
						arg_323_1:RecordAudio("122531080", var_326_23)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_122531", "122531080", "story_v_out_122531.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_122531", "122531080", "story_v_out_122531.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_24 = math.max(var_326_15, arg_323_1.talkMaxDuration)

			if var_326_14 <= arg_323_1.time_ and arg_323_1.time_ < var_326_14 + var_326_24 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_14) / var_326_24

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_14 + var_326_24 and arg_323_1.time_ < var_326_14 + var_326_24 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play122531081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 122531081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play122531082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1071ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1071ui_story == nil then
				arg_327_1.var_.characterEffect1071ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1071ui_story then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1071ui_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1071ui_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1071ui_story.fillRatio = var_330_5
			end

			local var_330_6 = 0
			local var_330_7 = 0.9

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_8 = arg_327_1:GetWordFromCfg(122531081)
				local var_330_9 = arg_327_1:FormatText(var_330_8.content)

				arg_327_1.text_.text = var_330_9

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_10 = 36
				local var_330_11 = utf8.len(var_330_9)
				local var_330_12 = var_330_10 <= 0 and var_330_7 or var_330_7 * (var_330_11 / var_330_10)

				if var_330_12 > 0 and var_330_7 < var_330_12 then
					arg_327_1.talkMaxDuration = var_330_12

					if var_330_12 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_12 + var_330_6
					end
				end

				arg_327_1.text_.text = var_330_9
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_13 = math.max(var_330_7, arg_327_1.talkMaxDuration)

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_13 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_6) / var_330_13

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_6 + var_330_13 and arg_327_1.time_ < var_330_6 + var_330_13 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play122531082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 122531082
		arg_331_1.duration_ = 17.033

		local var_331_0 = {
			ja = 17.033,
			ko = 9.933,
			zh = 9.933
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
				arg_331_0:Play122531083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1071ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story == nil then
				arg_331_1.var_.characterEffect1071ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1071ui_story then
					arg_331_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story then
				arg_331_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_334_4 = 0

			if var_334_4 < arg_331_1.time_ and arg_331_1.time_ <= var_334_4 + arg_334_0 then
				arg_331_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_334_5 = 0

			if var_334_5 < arg_331_1.time_ and arg_331_1.time_ <= var_334_5 + arg_334_0 then
				arg_331_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_334_6 = 0
			local var_334_7 = 1.05

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[384].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(122531082)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 42
				local var_334_12 = utf8.len(var_334_10)
				local var_334_13 = var_334_11 <= 0 and var_334_7 or var_334_7 * (var_334_12 / var_334_11)

				if var_334_13 > 0 and var_334_7 < var_334_13 then
					arg_331_1.talkMaxDuration = var_334_13

					if var_334_13 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_13 + var_334_6
					end
				end

				arg_331_1.text_.text = var_334_10
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531082", "story_v_out_122531.awb") ~= 0 then
					local var_334_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531082", "story_v_out_122531.awb") / 1000

					if var_334_14 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_14 + var_334_6
					end

					if var_334_9.prefab_name ~= "" and arg_331_1.actors_[var_334_9.prefab_name] ~= nil then
						local var_334_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_9.prefab_name].transform, "story_v_out_122531", "122531082", "story_v_out_122531.awb")

						arg_331_1:RecordAudio("122531082", var_334_15)
						arg_331_1:RecordAudio("122531082", var_334_15)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_122531", "122531082", "story_v_out_122531.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_122531", "122531082", "story_v_out_122531.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_16 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_16 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_16

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_16 and arg_331_1.time_ < var_334_6 + var_334_16 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play122531083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 122531083
		arg_335_1.duration_ = 20.3

		local var_335_0 = {
			ja = 20.3,
			ko = 16.566,
			zh = 16.566
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
				arg_335_0:Play122531084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 1.475

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

				local var_338_3 = arg_335_1:GetWordFromCfg(122531083)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531083", "story_v_out_122531.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531083", "story_v_out_122531.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_122531", "122531083", "story_v_out_122531.awb")

						arg_335_1:RecordAudio("122531083", var_338_9)
						arg_335_1:RecordAudio("122531083", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_122531", "122531083", "story_v_out_122531.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_122531", "122531083", "story_v_out_122531.awb")
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
	Play122531084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 122531084
		arg_339_1.duration_ = 8.566

		local var_339_0 = {
			ja = 8.566,
			ko = 4.133,
			zh = 4.133
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
				arg_339_0:Play122531085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 0.35

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_2 = arg_339_1:FormatText(StoryNameCfg[384].name)

				arg_339_1.leftNameTxt_.text = var_342_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_3 = arg_339_1:GetWordFromCfg(122531084)
				local var_342_4 = arg_339_1:FormatText(var_342_3.content)

				arg_339_1.text_.text = var_342_4

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_5 = 14
				local var_342_6 = utf8.len(var_342_4)
				local var_342_7 = var_342_5 <= 0 and var_342_1 or var_342_1 * (var_342_6 / var_342_5)

				if var_342_7 > 0 and var_342_1 < var_342_7 then
					arg_339_1.talkMaxDuration = var_342_7

					if var_342_7 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_7 + var_342_0
					end
				end

				arg_339_1.text_.text = var_342_4
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531084", "story_v_out_122531.awb") ~= 0 then
					local var_342_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531084", "story_v_out_122531.awb") / 1000

					if var_342_8 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_8 + var_342_0
					end

					if var_342_3.prefab_name ~= "" and arg_339_1.actors_[var_342_3.prefab_name] ~= nil then
						local var_342_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_3.prefab_name].transform, "story_v_out_122531", "122531084", "story_v_out_122531.awb")

						arg_339_1:RecordAudio("122531084", var_342_9)
						arg_339_1:RecordAudio("122531084", var_342_9)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_122531", "122531084", "story_v_out_122531.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_122531", "122531084", "story_v_out_122531.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_10 = math.max(var_342_1, arg_339_1.talkMaxDuration)

			if var_342_0 <= arg_339_1.time_ and arg_339_1.time_ < var_342_0 + var_342_10 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_0) / var_342_10

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_0 + var_342_10 and arg_339_1.time_ < var_342_0 + var_342_10 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play122531085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 122531085
		arg_343_1.duration_ = 17.099999999999

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play122531086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.mask_.enabled = true
				arg_343_1.mask_.raycastTarget = true

				arg_343_1:SetGaussion(false)
			end

			local var_346_1 = 2

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_1 then
				local var_346_2 = (arg_343_1.time_ - var_346_0) / var_346_1
				local var_346_3 = Color.New(0, 0, 0)

				var_346_3.a = Mathf.Lerp(0, 1, var_346_2)
				arg_343_1.mask_.color = var_346_3
			end

			if arg_343_1.time_ >= var_346_0 + var_346_1 and arg_343_1.time_ < var_346_0 + var_346_1 + arg_346_0 then
				local var_346_4 = Color.New(0, 0, 0)

				var_346_4.a = 1
				arg_343_1.mask_.color = var_346_4
			end

			local var_346_5 = 2

			if var_346_5 < arg_343_1.time_ and arg_343_1.time_ <= var_346_5 + arg_346_0 then
				arg_343_1.mask_.enabled = true
				arg_343_1.mask_.raycastTarget = true

				arg_343_1:SetGaussion(false)
			end

			local var_346_6 = 2

			if var_346_5 <= arg_343_1.time_ and arg_343_1.time_ < var_346_5 + var_346_6 then
				local var_346_7 = (arg_343_1.time_ - var_346_5) / var_346_6
				local var_346_8 = Color.New(0, 0, 0)

				var_346_8.a = Mathf.Lerp(1, 0, var_346_7)
				arg_343_1.mask_.color = var_346_8
			end

			if arg_343_1.time_ >= var_346_5 + var_346_6 and arg_343_1.time_ < var_346_5 + var_346_6 + arg_346_0 then
				local var_346_9 = Color.New(0, 0, 0)
				local var_346_10 = 0

				arg_343_1.mask_.enabled = false
				var_346_9.a = var_346_10
				arg_343_1.mask_.color = var_346_9
			end

			local var_346_11 = 2

			if var_346_11 < arg_343_1.time_ and arg_343_1.time_ <= var_346_11 + arg_346_0 then
				arg_343_1.fswbg_:SetActive(true)
				arg_343_1.dialog_:SetActive(false)

				arg_343_1.fswtw_.percent = 0

				local var_346_12 = arg_343_1:GetWordFromCfg(122531085)
				local var_346_13 = arg_343_1:FormatText(var_346_12.content)

				arg_343_1.fswt_.text = var_346_13

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.fswt_)

				arg_343_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_343_1.fswtw_:SetDirty()

				arg_343_1.typewritterCharCountI18N = 0

				SetActive(arg_343_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_343_1:ShowNextGo(false)
			end

			local var_346_14 = 2.01666666666667

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1.var_.oldValueTypewriter = arg_343_1.fswtw_.percent

				arg_343_1:ShowNextGo(false)
			end

			local var_346_15 = 52
			local var_346_16 = 3.46666666666667
			local var_346_17 = arg_343_1:GetWordFromCfg(122531085)
			local var_346_18 = arg_343_1:FormatText(var_346_17.content)
			local var_346_19, var_346_20 = arg_343_1:GetPercentByPara(var_346_18, 1)

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0

				local var_346_21 = var_346_15 <= 0 and var_346_16 or var_346_16 * ((var_346_20 - arg_343_1.typewritterCharCountI18N) / var_346_15)

				if var_346_21 > 0 and var_346_16 < var_346_21 then
					arg_343_1.talkMaxDuration = var_346_21

					if var_346_21 + var_346_14 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_21 + var_346_14
					end
				end
			end

			local var_346_22 = 3.46666666666667
			local var_346_23 = math.max(var_346_22, arg_343_1.talkMaxDuration)

			if var_346_14 <= arg_343_1.time_ and arg_343_1.time_ < var_346_14 + var_346_23 then
				local var_346_24 = (arg_343_1.time_ - var_346_14) / var_346_23

				arg_343_1.fswtw_.percent = Mathf.Lerp(arg_343_1.var_.oldValueTypewriter, var_346_19, var_346_24)
				arg_343_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_343_1.fswtw_:SetDirty()
			end

			if arg_343_1.time_ >= var_346_14 + var_346_23 and arg_343_1.time_ < var_346_14 + var_346_23 + arg_346_0 then
				arg_343_1.fswtw_.percent = var_346_19

				arg_343_1.fswtw_:SetDirty()
				arg_343_1:ShowNextGo(true)

				arg_343_1.typewritterCharCountI18N = var_346_20
			end

			local var_346_25 = "STblack"

			if arg_343_1.bgs_[var_346_25] == nil then
				local var_346_26 = Object.Instantiate(arg_343_1.paintGo_)

				var_346_26:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_346_25)
				var_346_26.name = var_346_25
				var_346_26.transform.parent = arg_343_1.stage_.transform
				var_346_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_343_1.bgs_[var_346_25] = var_346_26
			end

			local var_346_27 = 2

			if var_346_27 < arg_343_1.time_ and arg_343_1.time_ <= var_346_27 + arg_346_0 then
				local var_346_28 = manager.ui.mainCamera.transform.localPosition
				local var_346_29 = Vector3.New(0, 0, 10) + Vector3.New(var_346_28.x, var_346_28.y, 0)
				local var_346_30 = arg_343_1.bgs_.STblack

				var_346_30.transform.localPosition = var_346_29
				var_346_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_346_31 = var_346_30:GetComponent("SpriteRenderer")

				if var_346_31 and var_346_31.sprite then
					local var_346_32 = (var_346_30.transform.localPosition - var_346_28).z
					local var_346_33 = manager.ui.mainCameraCom_
					local var_346_34 = 2 * var_346_32 * Mathf.Tan(var_346_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_346_35 = var_346_34 * var_346_33.aspect
					local var_346_36 = var_346_31.sprite.bounds.size.x
					local var_346_37 = var_346_31.sprite.bounds.size.y
					local var_346_38 = var_346_35 / var_346_36
					local var_346_39 = var_346_34 / var_346_37
					local var_346_40 = var_346_39 < var_346_38 and var_346_38 or var_346_39

					var_346_30.transform.localScale = Vector3.New(var_346_40, var_346_40, 0)
				end

				for iter_346_0, iter_346_1 in pairs(arg_343_1.bgs_) do
					if iter_346_0 ~= "STblack" then
						iter_346_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_346_41 = arg_343_1.actors_["1071ui_story"].transform
			local var_346_42 = 1.966

			if var_346_42 < arg_343_1.time_ and arg_343_1.time_ <= var_346_42 + arg_346_0 then
				arg_343_1.var_.moveOldPos1071ui_story = var_346_41.localPosition
			end

			local var_346_43 = 0.001

			if var_346_42 <= arg_343_1.time_ and arg_343_1.time_ < var_346_42 + var_346_43 then
				local var_346_44 = (arg_343_1.time_ - var_346_42) / var_346_43
				local var_346_45 = Vector3.New(0, 100, 0)

				var_346_41.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1071ui_story, var_346_45, var_346_44)

				local var_346_46 = manager.ui.mainCamera.transform.position - var_346_41.position

				var_346_41.forward = Vector3.New(var_346_46.x, var_346_46.y, var_346_46.z)

				local var_346_47 = var_346_41.localEulerAngles

				var_346_47.z = 0
				var_346_47.x = 0
				var_346_41.localEulerAngles = var_346_47
			end

			if arg_343_1.time_ >= var_346_42 + var_346_43 and arg_343_1.time_ < var_346_42 + var_346_43 + arg_346_0 then
				var_346_41.localPosition = Vector3.New(0, 100, 0)

				local var_346_48 = manager.ui.mainCamera.transform.position - var_346_41.position

				var_346_41.forward = Vector3.New(var_346_48.x, var_346_48.y, var_346_48.z)

				local var_346_49 = var_346_41.localEulerAngles

				var_346_49.z = 0
				var_346_49.x = 0
				var_346_41.localEulerAngles = var_346_49
			end

			local var_346_50 = 2

			if var_346_50 < arg_343_1.time_ and arg_343_1.time_ <= var_346_50 + arg_346_0 then
				local var_346_51 = arg_343_1.fswbg_.transform:Find("textbox/adapt/content") or arg_343_1.fswbg_.transform:Find("textbox/content")
				local var_346_52 = var_346_51:GetComponent("Text")
				local var_346_53 = var_346_51:GetComponent("RectTransform")

				var_346_52.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_346_53.offsetMin = Vector2.New(0, 0)
				var_346_53.offsetMax = Vector2.New(0, 0)
			end

			local var_346_54 = 2
			local var_346_55 = 13.833
			local var_346_56 = manager.audio:GetVoiceLength("story_v_out_122531", "122531085", "story_v_out_122531.awb") / 1000

			if var_346_56 > 0 and var_346_55 < var_346_56 and var_346_56 + var_346_54 > arg_343_1.duration_ then
				local var_346_57 = var_346_56

				arg_343_1.duration_ = var_346_56 + var_346_54
			end

			if var_346_54 < arg_343_1.time_ and arg_343_1.time_ <= var_346_54 + arg_346_0 then
				local var_346_58 = "play"
				local var_346_59 = "voice"

				arg_343_1:AudioAction(var_346_58, var_346_59, "story_v_out_122531", "122531085", "story_v_out_122531.awb")
			end

			local var_346_60 = 1.966
			local var_346_61 = 1

			if var_346_60 < arg_343_1.time_ and arg_343_1.time_ <= var_346_60 + arg_346_0 then
				local var_346_62 = "play"
				local var_346_63 = "effect"

				arg_343_1:AudioAction(var_346_62, var_346_63, "se_story_122_03", "se_story_122_03_write", "")
			end
		end
	end,
	Play122531086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 122531086
		arg_347_1.duration_ = 9.332999999999

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play122531087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.fswbg_:SetActive(true)
				arg_347_1.dialog_:SetActive(false)

				arg_347_1.fswtw_.percent = 0

				local var_350_1 = arg_347_1:GetWordFromCfg(122531086)
				local var_350_2 = arg_347_1:FormatText(var_350_1.content)

				arg_347_1.fswt_.text = var_350_2

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.fswt_)

				arg_347_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_347_1.fswtw_:SetDirty()

				arg_347_1.typewritterCharCountI18N = 0

				SetActive(arg_347_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_347_1:ShowNextGo(false)
			end

			local var_350_3 = 0.0166666666666666

			if var_350_3 < arg_347_1.time_ and arg_347_1.time_ <= var_350_3 + arg_350_0 then
				arg_347_1.var_.oldValueTypewriter = arg_347_1.fswtw_.percent

				arg_347_1:ShowNextGo(false)
			end

			local var_350_4 = 36
			local var_350_5 = 2.46666666666667
			local var_350_6 = arg_347_1:GetWordFromCfg(122531086)
			local var_350_7 = arg_347_1:FormatText(var_350_6.content)
			local var_350_8, var_350_9 = arg_347_1:GetPercentByPara(var_350_7, 1)

			if var_350_3 < arg_347_1.time_ and arg_347_1.time_ <= var_350_3 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0

				local var_350_10 = var_350_4 <= 0 and var_350_5 or var_350_5 * ((var_350_9 - arg_347_1.typewritterCharCountI18N) / var_350_4)

				if var_350_10 > 0 and var_350_5 < var_350_10 then
					arg_347_1.talkMaxDuration = var_350_10

					if var_350_10 + var_350_3 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_10 + var_350_3
					end
				end
			end

			local var_350_11 = 2.46666666666667
			local var_350_12 = math.max(var_350_11, arg_347_1.talkMaxDuration)

			if var_350_3 <= arg_347_1.time_ and arg_347_1.time_ < var_350_3 + var_350_12 then
				local var_350_13 = (arg_347_1.time_ - var_350_3) / var_350_12

				arg_347_1.fswtw_.percent = Mathf.Lerp(arg_347_1.var_.oldValueTypewriter, var_350_8, var_350_13)
				arg_347_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_347_1.fswtw_:SetDirty()
			end

			if arg_347_1.time_ >= var_350_3 + var_350_12 and arg_347_1.time_ < var_350_3 + var_350_12 + arg_350_0 then
				arg_347_1.fswtw_.percent = var_350_8

				arg_347_1.fswtw_:SetDirty()
				arg_347_1:ShowNextGo(true)

				arg_347_1.typewritterCharCountI18N = var_350_9
			end

			local var_350_14 = 0
			local var_350_15 = 9.333
			local var_350_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531086", "story_v_out_122531.awb") / 1000

			if var_350_16 > 0 and var_350_15 < var_350_16 and var_350_16 + var_350_14 > arg_347_1.duration_ then
				local var_350_17 = var_350_16

				arg_347_1.duration_ = var_350_16 + var_350_14
			end

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				local var_350_18 = "play"
				local var_350_19 = "voice"

				arg_347_1:AudioAction(var_350_18, var_350_19, "story_v_out_122531", "122531086", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 122531087
		arg_351_1.duration_ = 9.165999999999

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play122531088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.fswbg_:SetActive(true)
				arg_351_1.dialog_:SetActive(false)

				arg_351_1.fswtw_.percent = 0

				local var_354_1 = arg_351_1:GetWordFromCfg(122531087)
				local var_354_2 = arg_351_1:FormatText(var_354_1.content)

				arg_351_1.fswt_.text = var_354_2

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.fswt_)

				arg_351_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_351_1.fswtw_:SetDirty()

				arg_351_1.typewritterCharCountI18N = 0

				SetActive(arg_351_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_351_1:ShowNextGo(false)
			end

			local var_354_3 = 0.0166666666666666

			if var_354_3 < arg_351_1.time_ and arg_351_1.time_ <= var_354_3 + arg_354_0 then
				arg_351_1.var_.oldValueTypewriter = arg_351_1.fswtw_.percent

				arg_351_1:ShowNextGo(false)
			end

			local var_354_4 = 34
			local var_354_5 = 2.26666666666667
			local var_354_6 = arg_351_1:GetWordFromCfg(122531087)
			local var_354_7 = arg_351_1:FormatText(var_354_6.content)
			local var_354_8, var_354_9 = arg_351_1:GetPercentByPara(var_354_7, 1)

			if var_354_3 < arg_351_1.time_ and arg_351_1.time_ <= var_354_3 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0

				local var_354_10 = var_354_4 <= 0 and var_354_5 or var_354_5 * ((var_354_9 - arg_351_1.typewritterCharCountI18N) / var_354_4)

				if var_354_10 > 0 and var_354_5 < var_354_10 then
					arg_351_1.talkMaxDuration = var_354_10

					if var_354_10 + var_354_3 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_10 + var_354_3
					end
				end
			end

			local var_354_11 = 2.26666666666667
			local var_354_12 = math.max(var_354_11, arg_351_1.talkMaxDuration)

			if var_354_3 <= arg_351_1.time_ and arg_351_1.time_ < var_354_3 + var_354_12 then
				local var_354_13 = (arg_351_1.time_ - var_354_3) / var_354_12

				arg_351_1.fswtw_.percent = Mathf.Lerp(arg_351_1.var_.oldValueTypewriter, var_354_8, var_354_13)
				arg_351_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_351_1.fswtw_:SetDirty()
			end

			if arg_351_1.time_ >= var_354_3 + var_354_12 and arg_351_1.time_ < var_354_3 + var_354_12 + arg_354_0 then
				arg_351_1.fswtw_.percent = var_354_8

				arg_351_1.fswtw_:SetDirty()
				arg_351_1:ShowNextGo(true)

				arg_351_1.typewritterCharCountI18N = var_354_9
			end

			local var_354_14 = 0
			local var_354_15 = 9.166
			local var_354_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531087", "story_v_out_122531.awb") / 1000

			if var_354_16 > 0 and var_354_15 < var_354_16 and var_354_16 + var_354_14 > arg_351_1.duration_ then
				local var_354_17 = var_354_16

				arg_351_1.duration_ = var_354_16 + var_354_14
			end

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				local var_354_18 = "play"
				local var_354_19 = "voice"

				arg_351_1:AudioAction(var_354_18, var_354_19, "story_v_out_122531", "122531087", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 122531088
		arg_355_1.duration_ = 10.933333333332

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play122531089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.fswbg_:SetActive(true)
				arg_355_1.dialog_:SetActive(false)

				arg_355_1.fswtw_.percent = 0

				local var_358_1 = arg_355_1:GetWordFromCfg(122531088)
				local var_358_2 = arg_355_1:FormatText(var_358_1.content)

				arg_355_1.fswt_.text = var_358_2

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.fswt_)

				arg_355_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_355_1.fswtw_:SetDirty()

				arg_355_1.typewritterCharCountI18N = 0

				SetActive(arg_355_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_355_1:ShowNextGo(false)
			end

			local var_358_3 = 0.0166666666666667

			if var_358_3 < arg_355_1.time_ and arg_355_1.time_ <= var_358_3 + arg_358_0 then
				arg_355_1.var_.oldValueTypewriter = arg_355_1.fswtw_.percent

				arg_355_1:ShowNextGo(false)
			end

			local var_358_4 = 37
			local var_358_5 = 2.46666666666667
			local var_358_6 = arg_355_1:GetWordFromCfg(122531088)
			local var_358_7 = arg_355_1:FormatText(var_358_6.content)
			local var_358_8, var_358_9 = arg_355_1:GetPercentByPara(var_358_7, 1)

			if var_358_3 < arg_355_1.time_ and arg_355_1.time_ <= var_358_3 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0

				local var_358_10 = var_358_4 <= 0 and var_358_5 or var_358_5 * ((var_358_9 - arg_355_1.typewritterCharCountI18N) / var_358_4)

				if var_358_10 > 0 and var_358_5 < var_358_10 then
					arg_355_1.talkMaxDuration = var_358_10

					if var_358_10 + var_358_3 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_10 + var_358_3
					end
				end
			end

			local var_358_11 = 2.46666666666667
			local var_358_12 = math.max(var_358_11, arg_355_1.talkMaxDuration)

			if var_358_3 <= arg_355_1.time_ and arg_355_1.time_ < var_358_3 + var_358_12 then
				local var_358_13 = (arg_355_1.time_ - var_358_3) / var_358_12

				arg_355_1.fswtw_.percent = Mathf.Lerp(arg_355_1.var_.oldValueTypewriter, var_358_8, var_358_13)
				arg_355_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_355_1.fswtw_:SetDirty()
			end

			if arg_355_1.time_ >= var_358_3 + var_358_12 and arg_355_1.time_ < var_358_3 + var_358_12 + arg_358_0 then
				arg_355_1.fswtw_.percent = var_358_8

				arg_355_1.fswtw_:SetDirty()
				arg_355_1:ShowNextGo(true)

				arg_355_1.typewritterCharCountI18N = var_358_9
			end

			local var_358_14 = 0
			local var_358_15 = 10.2
			local var_358_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531088", "story_v_out_122531.awb") / 1000

			if var_358_16 > 0 and var_358_15 < var_358_16 and var_358_16 + var_358_14 > arg_355_1.duration_ then
				local var_358_17 = var_358_16

				arg_355_1.duration_ = var_358_16 + var_358_14
			end

			if var_358_14 < arg_355_1.time_ and arg_355_1.time_ <= var_358_14 + arg_358_0 then
				local var_358_18 = "play"
				local var_358_19 = "voice"

				arg_355_1:AudioAction(var_358_18, var_358_19, "story_v_out_122531", "122531088", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 122531089
		arg_359_1.duration_ = 11.199999999999

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play122531090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.fswbg_:SetActive(true)
				arg_359_1.dialog_:SetActive(false)

				arg_359_1.fswtw_.percent = 0

				local var_362_1 = arg_359_1:GetWordFromCfg(122531089)
				local var_362_2 = arg_359_1:FormatText(var_362_1.content)

				arg_359_1.fswt_.text = var_362_2

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.fswt_)

				arg_359_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_359_1.fswtw_:SetDirty()

				arg_359_1.typewritterCharCountI18N = 0

				SetActive(arg_359_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_359_1:ShowNextGo(false)
			end

			local var_362_3 = 0.0166666666666666

			if var_362_3 < arg_359_1.time_ and arg_359_1.time_ <= var_362_3 + arg_362_0 then
				arg_359_1.var_.oldValueTypewriter = arg_359_1.fswtw_.percent

				arg_359_1:ShowNextGo(false)
			end

			local var_362_4 = 46
			local var_362_5 = 3.06666666666667
			local var_362_6 = arg_359_1:GetWordFromCfg(122531089)
			local var_362_7 = arg_359_1:FormatText(var_362_6.content)
			local var_362_8, var_362_9 = arg_359_1:GetPercentByPara(var_362_7, 1)

			if var_362_3 < arg_359_1.time_ and arg_359_1.time_ <= var_362_3 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0

				local var_362_10 = var_362_4 <= 0 and var_362_5 or var_362_5 * ((var_362_9 - arg_359_1.typewritterCharCountI18N) / var_362_4)

				if var_362_10 > 0 and var_362_5 < var_362_10 then
					arg_359_1.talkMaxDuration = var_362_10

					if var_362_10 + var_362_3 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_10 + var_362_3
					end
				end
			end

			local var_362_11 = 3.06666666666667
			local var_362_12 = math.max(var_362_11, arg_359_1.talkMaxDuration)

			if var_362_3 <= arg_359_1.time_ and arg_359_1.time_ < var_362_3 + var_362_12 then
				local var_362_13 = (arg_359_1.time_ - var_362_3) / var_362_12

				arg_359_1.fswtw_.percent = Mathf.Lerp(arg_359_1.var_.oldValueTypewriter, var_362_8, var_362_13)
				arg_359_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_359_1.fswtw_:SetDirty()
			end

			if arg_359_1.time_ >= var_362_3 + var_362_12 and arg_359_1.time_ < var_362_3 + var_362_12 + arg_362_0 then
				arg_359_1.fswtw_.percent = var_362_8

				arg_359_1.fswtw_:SetDirty()
				arg_359_1:ShowNextGo(true)

				arg_359_1.typewritterCharCountI18N = var_362_9
			end

			local var_362_14 = 0
			local var_362_15 = 11.2
			local var_362_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531089", "story_v_out_122531.awb") / 1000

			if var_362_16 > 0 and var_362_15 < var_362_16 and var_362_16 + var_362_14 > arg_359_1.duration_ then
				local var_362_17 = var_362_16

				arg_359_1.duration_ = var_362_16 + var_362_14
			end

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				local var_362_18 = "play"
				local var_362_19 = "voice"

				arg_359_1:AudioAction(var_362_18, var_362_19, "story_v_out_122531", "122531089", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 122531090
		arg_363_1.duration_ = 6.765999999999

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play122531091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.fswbg_:SetActive(true)
				arg_363_1.dialog_:SetActive(false)

				arg_363_1.fswtw_.percent = 0

				local var_366_1 = arg_363_1:GetWordFromCfg(122531090)
				local var_366_2 = arg_363_1:FormatText(var_366_1.content)

				arg_363_1.fswt_.text = var_366_2

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.fswt_)

				arg_363_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_363_1.fswtw_:SetDirty()

				arg_363_1.typewritterCharCountI18N = 0

				SetActive(arg_363_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_363_1:ShowNextGo(false)
			end

			local var_366_3 = 0.0166666666666666

			if var_366_3 < arg_363_1.time_ and arg_363_1.time_ <= var_366_3 + arg_366_0 then
				arg_363_1.var_.oldValueTypewriter = arg_363_1.fswtw_.percent

				arg_363_1:ShowNextGo(false)
			end

			local var_366_4 = 27
			local var_366_5 = 1.8
			local var_366_6 = arg_363_1:GetWordFromCfg(122531090)
			local var_366_7 = arg_363_1:FormatText(var_366_6.content)
			local var_366_8, var_366_9 = arg_363_1:GetPercentByPara(var_366_7, 1)

			if var_366_3 < arg_363_1.time_ and arg_363_1.time_ <= var_366_3 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0

				local var_366_10 = var_366_4 <= 0 and var_366_5 or var_366_5 * ((var_366_9 - arg_363_1.typewritterCharCountI18N) / var_366_4)

				if var_366_10 > 0 and var_366_5 < var_366_10 then
					arg_363_1.talkMaxDuration = var_366_10

					if var_366_10 + var_366_3 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_10 + var_366_3
					end
				end
			end

			local var_366_11 = 1.8
			local var_366_12 = math.max(var_366_11, arg_363_1.talkMaxDuration)

			if var_366_3 <= arg_363_1.time_ and arg_363_1.time_ < var_366_3 + var_366_12 then
				local var_366_13 = (arg_363_1.time_ - var_366_3) / var_366_12

				arg_363_1.fswtw_.percent = Mathf.Lerp(arg_363_1.var_.oldValueTypewriter, var_366_8, var_366_13)
				arg_363_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_363_1.fswtw_:SetDirty()
			end

			if arg_363_1.time_ >= var_366_3 + var_366_12 and arg_363_1.time_ < var_366_3 + var_366_12 + arg_366_0 then
				arg_363_1.fswtw_.percent = var_366_8

				arg_363_1.fswtw_:SetDirty()
				arg_363_1:ShowNextGo(true)

				arg_363_1.typewritterCharCountI18N = var_366_9
			end

			local var_366_14 = 0
			local var_366_15 = 6.766
			local var_366_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531090", "story_v_out_122531.awb") / 1000

			if var_366_16 > 0 and var_366_15 < var_366_16 and var_366_16 + var_366_14 > arg_363_1.duration_ then
				local var_366_17 = var_366_16

				arg_363_1.duration_ = var_366_16 + var_366_14
			end

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 then
				local var_366_18 = "play"
				local var_366_19 = "voice"

				arg_363_1:AudioAction(var_366_18, var_366_19, "story_v_out_122531", "122531090", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 122531091
		arg_367_1.duration_ = 14.299999999999

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play122531092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1.fswbg_:SetActive(true)
				arg_367_1.dialog_:SetActive(false)

				arg_367_1.fswtw_.percent = 0

				local var_370_1 = arg_367_1:GetWordFromCfg(122531091)
				local var_370_2 = arg_367_1:FormatText(var_370_1.content)

				arg_367_1.fswt_.text = var_370_2

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.fswt_)

				arg_367_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_367_1.fswtw_:SetDirty()

				arg_367_1.typewritterCharCountI18N = 0

				SetActive(arg_367_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_367_1:ShowNextGo(false)
			end

			local var_370_3 = 0.0166666666666666

			if var_370_3 < arg_367_1.time_ and arg_367_1.time_ <= var_370_3 + arg_370_0 then
				arg_367_1.var_.oldValueTypewriter = arg_367_1.fswtw_.percent

				arg_367_1:ShowNextGo(false)
			end

			local var_370_4 = 52
			local var_370_5 = 3.46666666666667
			local var_370_6 = arg_367_1:GetWordFromCfg(122531091)
			local var_370_7 = arg_367_1:FormatText(var_370_6.content)
			local var_370_8, var_370_9 = arg_367_1:GetPercentByPara(var_370_7, 1)

			if var_370_3 < arg_367_1.time_ and arg_367_1.time_ <= var_370_3 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0

				local var_370_10 = var_370_4 <= 0 and var_370_5 or var_370_5 * ((var_370_9 - arg_367_1.typewritterCharCountI18N) / var_370_4)

				if var_370_10 > 0 and var_370_5 < var_370_10 then
					arg_367_1.talkMaxDuration = var_370_10

					if var_370_10 + var_370_3 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_10 + var_370_3
					end
				end
			end

			local var_370_11 = 3.46666666666667
			local var_370_12 = math.max(var_370_11, arg_367_1.talkMaxDuration)

			if var_370_3 <= arg_367_1.time_ and arg_367_1.time_ < var_370_3 + var_370_12 then
				local var_370_13 = (arg_367_1.time_ - var_370_3) / var_370_12

				arg_367_1.fswtw_.percent = Mathf.Lerp(arg_367_1.var_.oldValueTypewriter, var_370_8, var_370_13)
				arg_367_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_367_1.fswtw_:SetDirty()
			end

			if arg_367_1.time_ >= var_370_3 + var_370_12 and arg_367_1.time_ < var_370_3 + var_370_12 + arg_370_0 then
				arg_367_1.fswtw_.percent = var_370_8

				arg_367_1.fswtw_:SetDirty()
				arg_367_1:ShowNextGo(true)

				arg_367_1.typewritterCharCountI18N = var_370_9
			end

			local var_370_14 = 0
			local var_370_15 = 13.2
			local var_370_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531091", "story_v_out_122531.awb") / 1000

			if var_370_16 > 0 and var_370_15 < var_370_16 and var_370_16 + var_370_14 > arg_367_1.duration_ then
				local var_370_17 = var_370_16

				arg_367_1.duration_ = var_370_16 + var_370_14
			end

			if var_370_14 < arg_367_1.time_ and arg_367_1.time_ <= var_370_14 + arg_370_0 then
				local var_370_18 = "play"
				local var_370_19 = "voice"

				arg_367_1:AudioAction(var_370_18, var_370_19, "story_v_out_122531", "122531091", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 122531092
		arg_371_1.duration_ = 14.733333333332

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play122531093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.fswbg_:SetActive(true)
				arg_371_1.dialog_:SetActive(false)

				arg_371_1.fswtw_.percent = 0

				local var_374_1 = arg_371_1:GetWordFromCfg(122531092)
				local var_374_2 = arg_371_1:FormatText(var_374_1.content)

				arg_371_1.fswt_.text = var_374_2

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.fswt_)

				arg_371_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_371_1.fswtw_:SetDirty()

				arg_371_1.typewritterCharCountI18N = 0

				SetActive(arg_371_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_371_1:ShowNextGo(false)
			end

			local var_374_3 = 0.0166666666666666

			if var_374_3 < arg_371_1.time_ and arg_371_1.time_ <= var_374_3 + arg_374_0 then
				arg_371_1.var_.oldValueTypewriter = arg_371_1.fswtw_.percent

				arg_371_1:ShowNextGo(false)
			end

			local var_374_4 = 54
			local var_374_5 = 3.53333333333333
			local var_374_6 = arg_371_1:GetWordFromCfg(122531092)
			local var_374_7 = arg_371_1:FormatText(var_374_6.content)
			local var_374_8, var_374_9 = arg_371_1:GetPercentByPara(var_374_7, 1)

			if var_374_3 < arg_371_1.time_ and arg_371_1.time_ <= var_374_3 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0

				local var_374_10 = var_374_4 <= 0 and var_374_5 or var_374_5 * ((var_374_9 - arg_371_1.typewritterCharCountI18N) / var_374_4)

				if var_374_10 > 0 and var_374_5 < var_374_10 then
					arg_371_1.talkMaxDuration = var_374_10

					if var_374_10 + var_374_3 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_10 + var_374_3
					end
				end
			end

			local var_374_11 = 3.53333333333333
			local var_374_12 = math.max(var_374_11, arg_371_1.talkMaxDuration)

			if var_374_3 <= arg_371_1.time_ and arg_371_1.time_ < var_374_3 + var_374_12 then
				local var_374_13 = (arg_371_1.time_ - var_374_3) / var_374_12

				arg_371_1.fswtw_.percent = Mathf.Lerp(arg_371_1.var_.oldValueTypewriter, var_374_8, var_374_13)
				arg_371_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_371_1.fswtw_:SetDirty()
			end

			if arg_371_1.time_ >= var_374_3 + var_374_12 and arg_371_1.time_ < var_374_3 + var_374_12 + arg_374_0 then
				arg_371_1.fswtw_.percent = var_374_8

				arg_371_1.fswtw_:SetDirty()
				arg_371_1:ShowNextGo(true)

				arg_371_1.typewritterCharCountI18N = var_374_9
			end

			local var_374_14 = 0
			local var_374_15 = 13
			local var_374_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531092", "story_v_out_122531.awb") / 1000

			if var_374_16 > 0 and var_374_15 < var_374_16 and var_374_16 + var_374_14 > arg_371_1.duration_ then
				local var_374_17 = var_374_16

				arg_371_1.duration_ = var_374_16 + var_374_14
			end

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 then
				local var_374_18 = "play"
				local var_374_19 = "voice"

				arg_371_1:AudioAction(var_374_18, var_374_19, "story_v_out_122531", "122531092", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 122531093
		arg_375_1.duration_ = 16.699999999999

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play122531094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.fswbg_:SetActive(true)
				arg_375_1.dialog_:SetActive(false)

				arg_375_1.fswtw_.percent = 0

				local var_378_1 = arg_375_1:GetWordFromCfg(122531093)
				local var_378_2 = arg_375_1:FormatText(var_378_1.content)

				arg_375_1.fswt_.text = var_378_2

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.fswt_)

				arg_375_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_375_1.fswtw_:SetDirty()

				arg_375_1.typewritterCharCountI18N = 0

				SetActive(arg_375_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_375_1:ShowNextGo(false)
			end

			local var_378_3 = 0.0166666666666666

			if var_378_3 < arg_375_1.time_ and arg_375_1.time_ <= var_378_3 + arg_378_0 then
				arg_375_1.var_.oldValueTypewriter = arg_375_1.fswtw_.percent

				arg_375_1:ShowNextGo(false)
			end

			local var_378_4 = 51
			local var_378_5 = 3.4
			local var_378_6 = arg_375_1:GetWordFromCfg(122531093)
			local var_378_7 = arg_375_1:FormatText(var_378_6.content)
			local var_378_8, var_378_9 = arg_375_1:GetPercentByPara(var_378_7, 1)

			if var_378_3 < arg_375_1.time_ and arg_375_1.time_ <= var_378_3 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0

				local var_378_10 = var_378_4 <= 0 and var_378_5 or var_378_5 * ((var_378_9 - arg_375_1.typewritterCharCountI18N) / var_378_4)

				if var_378_10 > 0 and var_378_5 < var_378_10 then
					arg_375_1.talkMaxDuration = var_378_10

					if var_378_10 + var_378_3 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_10 + var_378_3
					end
				end
			end

			local var_378_11 = 3.4
			local var_378_12 = math.max(var_378_11, arg_375_1.talkMaxDuration)

			if var_378_3 <= arg_375_1.time_ and arg_375_1.time_ < var_378_3 + var_378_12 then
				local var_378_13 = (arg_375_1.time_ - var_378_3) / var_378_12

				arg_375_1.fswtw_.percent = Mathf.Lerp(arg_375_1.var_.oldValueTypewriter, var_378_8, var_378_13)
				arg_375_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_375_1.fswtw_:SetDirty()
			end

			if arg_375_1.time_ >= var_378_3 + var_378_12 and arg_375_1.time_ < var_378_3 + var_378_12 + arg_378_0 then
				arg_375_1.fswtw_.percent = var_378_8

				arg_375_1.fswtw_:SetDirty()
				arg_375_1:ShowNextGo(true)

				arg_375_1.typewritterCharCountI18N = var_378_9
			end

			local var_378_14 = 0
			local var_378_15 = 15.633
			local var_378_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531093", "story_v_out_122531.awb") / 1000

			if var_378_16 > 0 and var_378_15 < var_378_16 and var_378_16 + var_378_14 > arg_375_1.duration_ then
				local var_378_17 = var_378_16

				arg_375_1.duration_ = var_378_16 + var_378_14
			end

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				local var_378_18 = "play"
				local var_378_19 = "voice"

				arg_375_1:AudioAction(var_378_18, var_378_19, "story_v_out_122531", "122531093", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 122531094
		arg_379_1.duration_ = 8.033333333332

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play122531095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.fswbg_:SetActive(true)
				arg_379_1.dialog_:SetActive(false)

				arg_379_1.fswtw_.percent = 0

				local var_382_1 = arg_379_1:GetWordFromCfg(122531094)
				local var_382_2 = arg_379_1:FormatText(var_382_1.content)

				arg_379_1.fswt_.text = var_382_2

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.fswt_)

				arg_379_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_379_1.fswtw_:SetDirty()

				arg_379_1.typewritterCharCountI18N = 0

				SetActive(arg_379_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_379_1:ShowNextGo(false)
			end

			local var_382_3 = 0.0166666666666666

			if var_382_3 < arg_379_1.time_ and arg_379_1.time_ <= var_382_3 + arg_382_0 then
				arg_379_1.var_.oldValueTypewriter = arg_379_1.fswtw_.percent

				arg_379_1:ShowNextGo(false)
			end

			local var_382_4 = 33
			local var_382_5 = 2.2
			local var_382_6 = arg_379_1:GetWordFromCfg(122531094)
			local var_382_7 = arg_379_1:FormatText(var_382_6.content)
			local var_382_8, var_382_9 = arg_379_1:GetPercentByPara(var_382_7, 1)

			if var_382_3 < arg_379_1.time_ and arg_379_1.time_ <= var_382_3 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0

				local var_382_10 = var_382_4 <= 0 and var_382_5 or var_382_5 * ((var_382_9 - arg_379_1.typewritterCharCountI18N) / var_382_4)

				if var_382_10 > 0 and var_382_5 < var_382_10 then
					arg_379_1.talkMaxDuration = var_382_10

					if var_382_10 + var_382_3 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_10 + var_382_3
					end
				end
			end

			local var_382_11 = 2.2
			local var_382_12 = math.max(var_382_11, arg_379_1.talkMaxDuration)

			if var_382_3 <= arg_379_1.time_ and arg_379_1.time_ < var_382_3 + var_382_12 then
				local var_382_13 = (arg_379_1.time_ - var_382_3) / var_382_12

				arg_379_1.fswtw_.percent = Mathf.Lerp(arg_379_1.var_.oldValueTypewriter, var_382_8, var_382_13)
				arg_379_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_379_1.fswtw_:SetDirty()
			end

			if arg_379_1.time_ >= var_382_3 + var_382_12 and arg_379_1.time_ < var_382_3 + var_382_12 + arg_382_0 then
				arg_379_1.fswtw_.percent = var_382_8

				arg_379_1.fswtw_:SetDirty()
				arg_379_1:ShowNextGo(true)

				arg_379_1.typewritterCharCountI18N = var_382_9
			end

			local var_382_14 = 0
			local var_382_15 = 7.6
			local var_382_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531094", "story_v_out_122531.awb") / 1000

			if var_382_16 > 0 and var_382_15 < var_382_16 and var_382_16 + var_382_14 > arg_379_1.duration_ then
				local var_382_17 = var_382_16

				arg_379_1.duration_ = var_382_16 + var_382_14
			end

			if var_382_14 < arg_379_1.time_ and arg_379_1.time_ <= var_382_14 + arg_382_0 then
				local var_382_18 = "play"
				local var_382_19 = "voice"

				arg_379_1:AudioAction(var_382_18, var_382_19, "story_v_out_122531", "122531094", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 122531095
		arg_383_1.duration_ = 14.233333333332

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play122531096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.fswbg_:SetActive(true)
				arg_383_1.dialog_:SetActive(false)

				arg_383_1.fswtw_.percent = 0

				local var_386_1 = arg_383_1:GetWordFromCfg(122531095)
				local var_386_2 = arg_383_1:FormatText(var_386_1.content)

				arg_383_1.fswt_.text = var_386_2

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.fswt_)

				arg_383_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_383_1.fswtw_:SetDirty()

				arg_383_1.typewritterCharCountI18N = 0

				SetActive(arg_383_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_383_1:ShowNextGo(false)
			end

			local var_386_3 = 0.0166666666666666

			if var_386_3 < arg_383_1.time_ and arg_383_1.time_ <= var_386_3 + arg_386_0 then
				arg_383_1.var_.oldValueTypewriter = arg_383_1.fswtw_.percent

				arg_383_1:ShowNextGo(false)
			end

			local var_386_4 = 49
			local var_386_5 = 3.26666666666667
			local var_386_6 = arg_383_1:GetWordFromCfg(122531095)
			local var_386_7 = arg_383_1:FormatText(var_386_6.content)
			local var_386_8, var_386_9 = arg_383_1:GetPercentByPara(var_386_7, 1)

			if var_386_3 < arg_383_1.time_ and arg_383_1.time_ <= var_386_3 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0

				local var_386_10 = var_386_4 <= 0 and var_386_5 or var_386_5 * ((var_386_9 - arg_383_1.typewritterCharCountI18N) / var_386_4)

				if var_386_10 > 0 and var_386_5 < var_386_10 then
					arg_383_1.talkMaxDuration = var_386_10

					if var_386_10 + var_386_3 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_10 + var_386_3
					end
				end
			end

			local var_386_11 = 3.26666666666667
			local var_386_12 = math.max(var_386_11, arg_383_1.talkMaxDuration)

			if var_386_3 <= arg_383_1.time_ and arg_383_1.time_ < var_386_3 + var_386_12 then
				local var_386_13 = (arg_383_1.time_ - var_386_3) / var_386_12

				arg_383_1.fswtw_.percent = Mathf.Lerp(arg_383_1.var_.oldValueTypewriter, var_386_8, var_386_13)
				arg_383_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_383_1.fswtw_:SetDirty()
			end

			if arg_383_1.time_ >= var_386_3 + var_386_12 and arg_383_1.time_ < var_386_3 + var_386_12 + arg_386_0 then
				arg_383_1.fswtw_.percent = var_386_8

				arg_383_1.fswtw_:SetDirty()
				arg_383_1:ShowNextGo(true)

				arg_383_1.typewritterCharCountI18N = var_386_9
			end

			local var_386_14 = 0
			local var_386_15 = 13.166
			local var_386_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531095", "story_v_out_122531.awb") / 1000

			if var_386_16 > 0 and var_386_15 < var_386_16 and var_386_16 + var_386_14 > arg_383_1.duration_ then
				local var_386_17 = var_386_16

				arg_383_1.duration_ = var_386_16 + var_386_14
			end

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 then
				local var_386_18 = "play"
				local var_386_19 = "voice"

				arg_383_1:AudioAction(var_386_18, var_386_19, "story_v_out_122531", "122531095", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 122531096
		arg_387_1.duration_ = 11.499999999999

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play122531097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.fswbg_:SetActive(true)
				arg_387_1.dialog_:SetActive(false)

				arg_387_1.fswtw_.percent = 0

				local var_390_1 = arg_387_1:GetWordFromCfg(122531096)
				local var_390_2 = arg_387_1:FormatText(var_390_1.content)

				arg_387_1.fswt_.text = var_390_2

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.fswt_)

				arg_387_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_387_1.fswtw_:SetDirty()

				arg_387_1.typewritterCharCountI18N = 0

				SetActive(arg_387_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_387_1:ShowNextGo(false)
			end

			local var_390_3 = 0.0166666666666666

			if var_390_3 < arg_387_1.time_ and arg_387_1.time_ <= var_390_3 + arg_390_0 then
				arg_387_1.var_.oldValueTypewriter = arg_387_1.fswtw_.percent

				arg_387_1:ShowNextGo(false)
			end

			local var_390_4 = 46
			local var_390_5 = 3.2
			local var_390_6 = arg_387_1:GetWordFromCfg(122531096)
			local var_390_7 = arg_387_1:FormatText(var_390_6.content)
			local var_390_8, var_390_9 = arg_387_1:GetPercentByPara(var_390_7, 1)

			if var_390_3 < arg_387_1.time_ and arg_387_1.time_ <= var_390_3 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0

				local var_390_10 = var_390_4 <= 0 and var_390_5 or var_390_5 * ((var_390_9 - arg_387_1.typewritterCharCountI18N) / var_390_4)

				if var_390_10 > 0 and var_390_5 < var_390_10 then
					arg_387_1.talkMaxDuration = var_390_10

					if var_390_10 + var_390_3 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_10 + var_390_3
					end
				end
			end

			local var_390_11 = 3.2
			local var_390_12 = math.max(var_390_11, arg_387_1.talkMaxDuration)

			if var_390_3 <= arg_387_1.time_ and arg_387_1.time_ < var_390_3 + var_390_12 then
				local var_390_13 = (arg_387_1.time_ - var_390_3) / var_390_12

				arg_387_1.fswtw_.percent = Mathf.Lerp(arg_387_1.var_.oldValueTypewriter, var_390_8, var_390_13)
				arg_387_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_387_1.fswtw_:SetDirty()
			end

			if arg_387_1.time_ >= var_390_3 + var_390_12 and arg_387_1.time_ < var_390_3 + var_390_12 + arg_390_0 then
				arg_387_1.fswtw_.percent = var_390_8

				arg_387_1.fswtw_:SetDirty()
				arg_387_1:ShowNextGo(true)

				arg_387_1.typewritterCharCountI18N = var_390_9
			end

			local var_390_14 = 0
			local var_390_15 = 10.433
			local var_390_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531096", "story_v_out_122531.awb") / 1000

			if var_390_16 > 0 and var_390_15 < var_390_16 and var_390_16 + var_390_14 > arg_387_1.duration_ then
				local var_390_17 = var_390_16

				arg_387_1.duration_ = var_390_16 + var_390_14
			end

			if var_390_14 < arg_387_1.time_ and arg_387_1.time_ <= var_390_14 + arg_390_0 then
				local var_390_18 = "play"
				local var_390_19 = "voice"

				arg_387_1:AudioAction(var_390_18, var_390_19, "story_v_out_122531", "122531096", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 122531097
		arg_391_1.duration_ = 11.232999999999

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play122531098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				arg_391_1.fswbg_:SetActive(true)
				arg_391_1.dialog_:SetActive(false)

				arg_391_1.fswtw_.percent = 0

				local var_394_1 = arg_391_1:GetWordFromCfg(122531097)
				local var_394_2 = arg_391_1:FormatText(var_394_1.content)

				arg_391_1.fswt_.text = var_394_2

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.fswt_)

				arg_391_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_391_1.fswtw_:SetDirty()

				arg_391_1.typewritterCharCountI18N = 0

				SetActive(arg_391_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_391_1:ShowNextGo(false)
			end

			local var_394_3 = 0.0166666666666666

			if var_394_3 < arg_391_1.time_ and arg_391_1.time_ <= var_394_3 + arg_394_0 then
				arg_391_1.var_.oldValueTypewriter = arg_391_1.fswtw_.percent

				arg_391_1:ShowNextGo(false)
			end

			local var_394_4 = 45
			local var_394_5 = 3
			local var_394_6 = arg_391_1:GetWordFromCfg(122531097)
			local var_394_7 = arg_391_1:FormatText(var_394_6.content)
			local var_394_8, var_394_9 = arg_391_1:GetPercentByPara(var_394_7, 1)

			if var_394_3 < arg_391_1.time_ and arg_391_1.time_ <= var_394_3 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0

				local var_394_10 = var_394_4 <= 0 and var_394_5 or var_394_5 * ((var_394_9 - arg_391_1.typewritterCharCountI18N) / var_394_4)

				if var_394_10 > 0 and var_394_5 < var_394_10 then
					arg_391_1.talkMaxDuration = var_394_10

					if var_394_10 + var_394_3 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_10 + var_394_3
					end
				end
			end

			local var_394_11 = 3
			local var_394_12 = math.max(var_394_11, arg_391_1.talkMaxDuration)

			if var_394_3 <= arg_391_1.time_ and arg_391_1.time_ < var_394_3 + var_394_12 then
				local var_394_13 = (arg_391_1.time_ - var_394_3) / var_394_12

				arg_391_1.fswtw_.percent = Mathf.Lerp(arg_391_1.var_.oldValueTypewriter, var_394_8, var_394_13)
				arg_391_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_391_1.fswtw_:SetDirty()
			end

			if arg_391_1.time_ >= var_394_3 + var_394_12 and arg_391_1.time_ < var_394_3 + var_394_12 + arg_394_0 then
				arg_391_1.fswtw_.percent = var_394_8

				arg_391_1.fswtw_:SetDirty()
				arg_391_1:ShowNextGo(true)

				arg_391_1.typewritterCharCountI18N = var_394_9
			end

			local var_394_14 = 0
			local var_394_15 = 11.233
			local var_394_16 = manager.audio:GetVoiceLength("story_v_out_122531", "122531097", "story_v_out_122531.awb") / 1000

			if var_394_16 > 0 and var_394_15 < var_394_16 and var_394_16 + var_394_14 > arg_391_1.duration_ then
				local var_394_17 = var_394_16

				arg_391_1.duration_ = var_394_16 + var_394_14
			end

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				local var_394_18 = "play"
				local var_394_19 = "voice"

				arg_391_1:AudioAction(var_394_18, var_394_19, "story_v_out_122531", "122531097", "story_v_out_122531.awb")
			end
		end
	end,
	Play122531098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 122531098
		arg_395_1.duration_ = 0.999999999999

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play122531099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 0

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				arg_395_1.fswbg_:SetActive(true)
				arg_395_1.dialog_:SetActive(false)

				arg_395_1.fswtw_.percent = 0

				local var_398_1 = arg_395_1:GetWordFromCfg(122531098)
				local var_398_2 = arg_395_1:FormatText(var_398_1.content)

				arg_395_1.fswt_.text = var_398_2

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.fswt_)

				arg_395_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_395_1.fswtw_:SetDirty()

				arg_395_1.typewritterCharCountI18N = 0

				SetActive(arg_395_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_395_1:ShowNextGo(false)
			end

			local var_398_3 = 0.0166666666666666

			if var_398_3 < arg_395_1.time_ and arg_395_1.time_ <= var_398_3 + arg_398_0 then
				arg_395_1.var_.oldValueTypewriter = arg_395_1.fswtw_.percent

				arg_395_1:ShowNextGo(false)
			end

			local var_398_4 = 6
			local var_398_5 = 0.4
			local var_398_6 = arg_395_1:GetWordFromCfg(122531098)
			local var_398_7 = arg_395_1:FormatText(var_398_6.content)
			local var_398_8, var_398_9 = arg_395_1:GetPercentByPara(var_398_7, 1)

			if var_398_3 < arg_395_1.time_ and arg_395_1.time_ <= var_398_3 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0

				local var_398_10 = var_398_4 <= 0 and var_398_5 or var_398_5 * ((var_398_9 - arg_395_1.typewritterCharCountI18N) / var_398_4)

				if var_398_10 > 0 and var_398_5 < var_398_10 then
					arg_395_1.talkMaxDuration = var_398_10

					if var_398_10 + var_398_3 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_10 + var_398_3
					end
				end
			end

			local var_398_11 = 0.4
			local var_398_12 = math.max(var_398_11, arg_395_1.talkMaxDuration)

			if var_398_3 <= arg_395_1.time_ and arg_395_1.time_ < var_398_3 + var_398_12 then
				local var_398_13 = (arg_395_1.time_ - var_398_3) / var_398_12

				arg_395_1.fswtw_.percent = Mathf.Lerp(arg_395_1.var_.oldValueTypewriter, var_398_8, var_398_13)
				arg_395_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_395_1.fswtw_:SetDirty()
			end

			if arg_395_1.time_ >= var_398_3 + var_398_12 and arg_395_1.time_ < var_398_3 + var_398_12 + arg_398_0 then
				arg_395_1.fswtw_.percent = var_398_8

				arg_395_1.fswtw_:SetDirty()
				arg_395_1:ShowNextGo(true)

				arg_395_1.typewritterCharCountI18N = var_398_9
			end
		end
	end,
	Play122531099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 122531099
		arg_399_1.duration_ = 8.999999999999

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play122531100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 2

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				local var_402_1 = manager.ui.mainCamera.transform.localPosition
				local var_402_2 = Vector3.New(0, 0, 10) + Vector3.New(var_402_1.x, var_402_1.y, 0)
				local var_402_3 = arg_399_1.bgs_.ST41

				var_402_3.transform.localPosition = var_402_2
				var_402_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_402_4 = var_402_3:GetComponent("SpriteRenderer")

				if var_402_4 and var_402_4.sprite then
					local var_402_5 = (var_402_3.transform.localPosition - var_402_1).z
					local var_402_6 = manager.ui.mainCameraCom_
					local var_402_7 = 2 * var_402_5 * Mathf.Tan(var_402_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_402_8 = var_402_7 * var_402_6.aspect
					local var_402_9 = var_402_4.sprite.bounds.size.x
					local var_402_10 = var_402_4.sprite.bounds.size.y
					local var_402_11 = var_402_8 / var_402_9
					local var_402_12 = var_402_7 / var_402_10
					local var_402_13 = var_402_12 < var_402_11 and var_402_11 or var_402_12

					var_402_3.transform.localScale = Vector3.New(var_402_13, var_402_13, 0)
				end

				for iter_402_0, iter_402_1 in pairs(arg_399_1.bgs_) do
					if iter_402_0 ~= "ST41" then
						iter_402_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_402_14 = 0

			if var_402_14 < arg_399_1.time_ and arg_399_1.time_ <= var_402_14 + arg_402_0 then
				arg_399_1.mask_.enabled = true
				arg_399_1.mask_.raycastTarget = true

				arg_399_1:SetGaussion(false)
			end

			local var_402_15 = 2

			if var_402_14 <= arg_399_1.time_ and arg_399_1.time_ < var_402_14 + var_402_15 then
				local var_402_16 = (arg_399_1.time_ - var_402_14) / var_402_15
				local var_402_17 = Color.New(0, 0, 0)

				var_402_17.a = Mathf.Lerp(0, 1, var_402_16)
				arg_399_1.mask_.color = var_402_17
			end

			if arg_399_1.time_ >= var_402_14 + var_402_15 and arg_399_1.time_ < var_402_14 + var_402_15 + arg_402_0 then
				local var_402_18 = Color.New(0, 0, 0)

				var_402_18.a = 1
				arg_399_1.mask_.color = var_402_18
			end

			local var_402_19 = 2

			if var_402_19 < arg_399_1.time_ and arg_399_1.time_ <= var_402_19 + arg_402_0 then
				arg_399_1.mask_.enabled = true
				arg_399_1.mask_.raycastTarget = true

				arg_399_1:SetGaussion(false)
			end

			local var_402_20 = 2

			if var_402_19 <= arg_399_1.time_ and arg_399_1.time_ < var_402_19 + var_402_20 then
				local var_402_21 = (arg_399_1.time_ - var_402_19) / var_402_20
				local var_402_22 = Color.New(0, 0, 0)

				var_402_22.a = Mathf.Lerp(1, 0, var_402_21)
				arg_399_1.mask_.color = var_402_22
			end

			if arg_399_1.time_ >= var_402_19 + var_402_20 and arg_399_1.time_ < var_402_19 + var_402_20 + arg_402_0 then
				local var_402_23 = Color.New(0, 0, 0)
				local var_402_24 = 0

				arg_399_1.mask_.enabled = false
				var_402_23.a = var_402_24
				arg_399_1.mask_.color = var_402_23
			end

			local var_402_25 = 2

			if var_402_25 < arg_399_1.time_ and arg_399_1.time_ <= var_402_25 + arg_402_0 then
				arg_399_1.fswbg_:SetActive(false)
				arg_399_1.dialog_:SetActive(false)
				arg_399_1:ShowNextGo(false)
			end

			local var_402_26 = 0
			local var_402_27 = 1

			if var_402_26 < arg_399_1.time_ and arg_399_1.time_ <= var_402_26 + arg_402_0 then
				local var_402_28 = "stop"
				local var_402_29 = "effect"

				arg_399_1:AudioAction(var_402_28, var_402_29, "se_story_122_03", "se_story_122_03_write", "")
			end

			if arg_399_1.frameCnt_ <= 1 then
				arg_399_1.dialog_:SetActive(false)
			end

			local var_402_30 = 3.999999999999
			local var_402_31 = 1.175

			if var_402_30 < arg_399_1.time_ and arg_399_1.time_ <= var_402_30 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0

				arg_399_1.dialog_:SetActive(true)

				local var_402_32 = LeanTween.value(arg_399_1.dialog_, 0, 1, 0.3)

				var_402_32:setOnUpdate(LuaHelper.FloatAction(function(arg_403_0)
					arg_399_1.dialogCg_.alpha = arg_403_0
				end))
				var_402_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_399_1.dialog_)
					var_402_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_399_1.duration_ = arg_399_1.duration_ + 0.3

				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_33 = arg_399_1:GetWordFromCfg(122531099)
				local var_402_34 = arg_399_1:FormatText(var_402_33.content)

				arg_399_1.text_.text = var_402_34

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_35 = 47
				local var_402_36 = utf8.len(var_402_34)
				local var_402_37 = var_402_35 <= 0 and var_402_31 or var_402_31 * (var_402_36 / var_402_35)

				if var_402_37 > 0 and var_402_31 < var_402_37 then
					arg_399_1.talkMaxDuration = var_402_37
					var_402_30 = var_402_30 + 0.3

					if var_402_37 + var_402_30 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_37 + var_402_30
					end
				end

				arg_399_1.text_.text = var_402_34
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_38 = var_402_30 + 0.3
			local var_402_39 = math.max(var_402_31, arg_399_1.talkMaxDuration)

			if var_402_38 <= arg_399_1.time_ and arg_399_1.time_ < var_402_38 + var_402_39 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_38) / var_402_39

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_38 + var_402_39 and arg_399_1.time_ < var_402_38 + var_402_39 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play122531100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 122531100
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play122531101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 1.325

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_2 = arg_405_1:GetWordFromCfg(122531100)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 53
				local var_408_5 = utf8.len(var_408_3)
				local var_408_6 = var_408_4 <= 0 and var_408_1 or var_408_1 * (var_408_5 / var_408_4)

				if var_408_6 > 0 and var_408_1 < var_408_6 then
					arg_405_1.talkMaxDuration = var_408_6

					if var_408_6 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_6 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_3
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_7 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_7 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_7

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_7 and arg_405_1.time_ < var_408_0 + var_408_7 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play122531101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 122531101
		arg_409_1.duration_ = 1.999999999999

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play122531102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1075ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1075ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0, -1.055, -6.16)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1075ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["1075ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect1075ui_story == nil then
				arg_409_1.var_.characterEffect1075ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect1075ui_story then
					arg_409_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect1075ui_story then
				arg_409_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_412_15 = 0

			if var_412_15 < arg_409_1.time_ and arg_409_1.time_ <= var_412_15 + arg_412_0 then
				arg_409_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_412_16 = 0
			local var_412_17 = 0.075

			if var_412_16 < arg_409_1.time_ and arg_409_1.time_ <= var_412_16 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_18 = arg_409_1:FormatText(StoryNameCfg[381].name)

				arg_409_1.leftNameTxt_.text = var_412_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_19 = arg_409_1:GetWordFromCfg(122531101)
				local var_412_20 = arg_409_1:FormatText(var_412_19.content)

				arg_409_1.text_.text = var_412_20

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_21 = 3
				local var_412_22 = utf8.len(var_412_20)
				local var_412_23 = var_412_21 <= 0 and var_412_17 or var_412_17 * (var_412_22 / var_412_21)

				if var_412_23 > 0 and var_412_17 < var_412_23 then
					arg_409_1.talkMaxDuration = var_412_23

					if var_412_23 + var_412_16 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_23 + var_412_16
					end
				end

				arg_409_1.text_.text = var_412_20
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531101", "story_v_out_122531.awb") ~= 0 then
					local var_412_24 = manager.audio:GetVoiceLength("story_v_out_122531", "122531101", "story_v_out_122531.awb") / 1000

					if var_412_24 + var_412_16 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_24 + var_412_16
					end

					if var_412_19.prefab_name ~= "" and arg_409_1.actors_[var_412_19.prefab_name] ~= nil then
						local var_412_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_19.prefab_name].transform, "story_v_out_122531", "122531101", "story_v_out_122531.awb")

						arg_409_1:RecordAudio("122531101", var_412_25)
						arg_409_1:RecordAudio("122531101", var_412_25)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_122531", "122531101", "story_v_out_122531.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_122531", "122531101", "story_v_out_122531.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_26 = math.max(var_412_17, arg_409_1.talkMaxDuration)

			if var_412_16 <= arg_409_1.time_ and arg_409_1.time_ < var_412_16 + var_412_26 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_16) / var_412_26

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_16 + var_412_26 and arg_409_1.time_ < var_412_16 + var_412_26 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play122531102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 122531102
		arg_413_1.duration_ = 1.999999999999

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play122531103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1071ui_story"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1071ui_story = var_416_0.localPosition
			end

			local var_416_2 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2
				local var_416_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1071ui_story, var_416_4, var_416_3)

				local var_416_5 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_5.x, var_416_5.y, var_416_5.z)

				local var_416_6 = var_416_0.localEulerAngles

				var_416_6.z = 0
				var_416_6.x = 0
				var_416_0.localEulerAngles = var_416_6
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_416_7 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_7.x, var_416_7.y, var_416_7.z)

				local var_416_8 = var_416_0.localEulerAngles

				var_416_8.z = 0
				var_416_8.x = 0
				var_416_0.localEulerAngles = var_416_8
			end

			local var_416_9 = arg_413_1.actors_["1071ui_story"]
			local var_416_10 = 0

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 and arg_413_1.var_.characterEffect1071ui_story == nil then
				arg_413_1.var_.characterEffect1071ui_story = var_416_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_11 = 0.200000002980232

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_11 then
				local var_416_12 = (arg_413_1.time_ - var_416_10) / var_416_11

				if arg_413_1.var_.characterEffect1071ui_story then
					arg_413_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_10 + var_416_11 and arg_413_1.time_ < var_416_10 + var_416_11 + arg_416_0 and arg_413_1.var_.characterEffect1071ui_story then
				arg_413_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_416_13 = 0

			if var_416_13 < arg_413_1.time_ and arg_413_1.time_ <= var_416_13 + arg_416_0 then
				arg_413_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_416_14 = arg_413_1.actors_["1075ui_story"].transform
			local var_416_15 = 0

			if var_416_15 < arg_413_1.time_ and arg_413_1.time_ <= var_416_15 + arg_416_0 then
				arg_413_1.var_.moveOldPos1075ui_story = var_416_14.localPosition
			end

			local var_416_16 = 0.001

			if var_416_15 <= arg_413_1.time_ and arg_413_1.time_ < var_416_15 + var_416_16 then
				local var_416_17 = (arg_413_1.time_ - var_416_15) / var_416_16
				local var_416_18 = Vector3.New(0.7, -1.055, -6.16)

				var_416_14.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1075ui_story, var_416_18, var_416_17)

				local var_416_19 = manager.ui.mainCamera.transform.position - var_416_14.position

				var_416_14.forward = Vector3.New(var_416_19.x, var_416_19.y, var_416_19.z)

				local var_416_20 = var_416_14.localEulerAngles

				var_416_20.z = 0
				var_416_20.x = 0
				var_416_14.localEulerAngles = var_416_20
			end

			if arg_413_1.time_ >= var_416_15 + var_416_16 and arg_413_1.time_ < var_416_15 + var_416_16 + arg_416_0 then
				var_416_14.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_416_21 = manager.ui.mainCamera.transform.position - var_416_14.position

				var_416_14.forward = Vector3.New(var_416_21.x, var_416_21.y, var_416_21.z)

				local var_416_22 = var_416_14.localEulerAngles

				var_416_22.z = 0
				var_416_22.x = 0
				var_416_14.localEulerAngles = var_416_22
			end

			local var_416_23 = arg_413_1.actors_["1075ui_story"]
			local var_416_24 = 0

			if var_416_24 < arg_413_1.time_ and arg_413_1.time_ <= var_416_24 + arg_416_0 and arg_413_1.var_.characterEffect1075ui_story == nil then
				arg_413_1.var_.characterEffect1075ui_story = var_416_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_25 = 0.200000002980232

			if var_416_24 <= arg_413_1.time_ and arg_413_1.time_ < var_416_24 + var_416_25 then
				local var_416_26 = (arg_413_1.time_ - var_416_24) / var_416_25

				if arg_413_1.var_.characterEffect1075ui_story then
					local var_416_27 = Mathf.Lerp(0, 0.5, var_416_26)

					arg_413_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1075ui_story.fillRatio = var_416_27
				end
			end

			if arg_413_1.time_ >= var_416_24 + var_416_25 and arg_413_1.time_ < var_416_24 + var_416_25 + arg_416_0 and arg_413_1.var_.characterEffect1075ui_story then
				local var_416_28 = 0.5

				arg_413_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1075ui_story.fillRatio = var_416_28
			end

			local var_416_29 = 0
			local var_416_30 = 0.05

			if var_416_29 < arg_413_1.time_ and arg_413_1.time_ <= var_416_29 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_31 = arg_413_1:FormatText(StoryNameCfg[384].name)

				arg_413_1.leftNameTxt_.text = var_416_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_32 = arg_413_1:GetWordFromCfg(122531102)
				local var_416_33 = arg_413_1:FormatText(var_416_32.content)

				arg_413_1.text_.text = var_416_33

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_34 = 2
				local var_416_35 = utf8.len(var_416_33)
				local var_416_36 = var_416_34 <= 0 and var_416_30 or var_416_30 * (var_416_35 / var_416_34)

				if var_416_36 > 0 and var_416_30 < var_416_36 then
					arg_413_1.talkMaxDuration = var_416_36

					if var_416_36 + var_416_29 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_36 + var_416_29
					end
				end

				arg_413_1.text_.text = var_416_33
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531102", "story_v_out_122531.awb") ~= 0 then
					local var_416_37 = manager.audio:GetVoiceLength("story_v_out_122531", "122531102", "story_v_out_122531.awb") / 1000

					if var_416_37 + var_416_29 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_37 + var_416_29
					end

					if var_416_32.prefab_name ~= "" and arg_413_1.actors_[var_416_32.prefab_name] ~= nil then
						local var_416_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_32.prefab_name].transform, "story_v_out_122531", "122531102", "story_v_out_122531.awb")

						arg_413_1:RecordAudio("122531102", var_416_38)
						arg_413_1:RecordAudio("122531102", var_416_38)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_122531", "122531102", "story_v_out_122531.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_122531", "122531102", "story_v_out_122531.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_39 = math.max(var_416_30, arg_413_1.talkMaxDuration)

			if var_416_29 <= arg_413_1.time_ and arg_413_1.time_ < var_416_29 + var_416_39 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_29) / var_416_39

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_29 + var_416_39 and arg_413_1.time_ < var_416_29 + var_416_39 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play122531103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 122531103
		arg_417_1.duration_ = 3.5

		local var_417_0 = {
			ja = 3.5,
			ko = 1.933,
			zh = 1.933
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
				arg_417_0:Play122531104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1075ui_story"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1075ui_story = var_420_0.localPosition
			end

			local var_420_2 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2
				local var_420_4 = Vector3.New(0.7, -1.055, -6.16)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1075ui_story, var_420_4, var_420_3)

				local var_420_5 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_5.x, var_420_5.y, var_420_5.z)

				local var_420_6 = var_420_0.localEulerAngles

				var_420_6.z = 0
				var_420_6.x = 0
				var_420_0.localEulerAngles = var_420_6
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_420_7 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_7.x, var_420_7.y, var_420_7.z)

				local var_420_8 = var_420_0.localEulerAngles

				var_420_8.z = 0
				var_420_8.x = 0
				var_420_0.localEulerAngles = var_420_8
			end

			local var_420_9 = arg_417_1.actors_["1075ui_story"]
			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 and arg_417_1.var_.characterEffect1075ui_story == nil then
				arg_417_1.var_.characterEffect1075ui_story = var_420_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_11 = 0.200000002980232

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_11 then
				local var_420_12 = (arg_417_1.time_ - var_420_10) / var_420_11

				if arg_417_1.var_.characterEffect1075ui_story then
					arg_417_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_10 + var_420_11 and arg_417_1.time_ < var_420_10 + var_420_11 + arg_420_0 and arg_417_1.var_.characterEffect1075ui_story then
				arg_417_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_420_13 = 0

			if var_420_13 < arg_417_1.time_ and arg_417_1.time_ <= var_420_13 + arg_420_0 then
				arg_417_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_420_14 = 0

			if var_420_14 < arg_417_1.time_ and arg_417_1.time_ <= var_420_14 + arg_420_0 then
				arg_417_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_420_15 = arg_417_1.actors_["1071ui_story"]
			local var_420_16 = 0

			if var_420_16 < arg_417_1.time_ and arg_417_1.time_ <= var_420_16 + arg_420_0 and arg_417_1.var_.characterEffect1071ui_story == nil then
				arg_417_1.var_.characterEffect1071ui_story = var_420_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_17 = 0.200000002980232

			if var_420_16 <= arg_417_1.time_ and arg_417_1.time_ < var_420_16 + var_420_17 then
				local var_420_18 = (arg_417_1.time_ - var_420_16) / var_420_17

				if arg_417_1.var_.characterEffect1071ui_story then
					local var_420_19 = Mathf.Lerp(0, 0.5, var_420_18)

					arg_417_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1071ui_story.fillRatio = var_420_19
				end
			end

			if arg_417_1.time_ >= var_420_16 + var_420_17 and arg_417_1.time_ < var_420_16 + var_420_17 + arg_420_0 and arg_417_1.var_.characterEffect1071ui_story then
				local var_420_20 = 0.5

				arg_417_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1071ui_story.fillRatio = var_420_20
			end

			local var_420_21 = 0
			local var_420_22 = 0.15

			if var_420_21 < arg_417_1.time_ and arg_417_1.time_ <= var_420_21 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_23 = arg_417_1:FormatText(StoryNameCfg[381].name)

				arg_417_1.leftNameTxt_.text = var_420_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_24 = arg_417_1:GetWordFromCfg(122531103)
				local var_420_25 = arg_417_1:FormatText(var_420_24.content)

				arg_417_1.text_.text = var_420_25

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_26 = 6
				local var_420_27 = utf8.len(var_420_25)
				local var_420_28 = var_420_26 <= 0 and var_420_22 or var_420_22 * (var_420_27 / var_420_26)

				if var_420_28 > 0 and var_420_22 < var_420_28 then
					arg_417_1.talkMaxDuration = var_420_28

					if var_420_28 + var_420_21 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_28 + var_420_21
					end
				end

				arg_417_1.text_.text = var_420_25
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531103", "story_v_out_122531.awb") ~= 0 then
					local var_420_29 = manager.audio:GetVoiceLength("story_v_out_122531", "122531103", "story_v_out_122531.awb") / 1000

					if var_420_29 + var_420_21 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_29 + var_420_21
					end

					if var_420_24.prefab_name ~= "" and arg_417_1.actors_[var_420_24.prefab_name] ~= nil then
						local var_420_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_24.prefab_name].transform, "story_v_out_122531", "122531103", "story_v_out_122531.awb")

						arg_417_1:RecordAudio("122531103", var_420_30)
						arg_417_1:RecordAudio("122531103", var_420_30)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_122531", "122531103", "story_v_out_122531.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_122531", "122531103", "story_v_out_122531.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_31 = math.max(var_420_22, arg_417_1.talkMaxDuration)

			if var_420_21 <= arg_417_1.time_ and arg_417_1.time_ < var_420_21 + var_420_31 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_21) / var_420_31

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_21 + var_420_31 and arg_417_1.time_ < var_420_21 + var_420_31 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play122531104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 122531104
		arg_421_1.duration_ = 2.8

		local var_421_0 = {
			ja = 2.8,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_421_0:Play122531105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1071ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1071ui_story == nil then
				arg_421_1.var_.characterEffect1071ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.200000002980232

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1071ui_story then
					arg_421_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1071ui_story then
				arg_421_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_424_4 = 0

			if var_424_4 < arg_421_1.time_ and arg_421_1.time_ <= var_424_4 + arg_424_0 then
				arg_421_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_424_5 = arg_421_1.actors_["1075ui_story"]
			local var_424_6 = 0

			if var_424_6 < arg_421_1.time_ and arg_421_1.time_ <= var_424_6 + arg_424_0 and arg_421_1.var_.characterEffect1075ui_story == nil then
				arg_421_1.var_.characterEffect1075ui_story = var_424_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_7 = 0.200000002980232

			if var_424_6 <= arg_421_1.time_ and arg_421_1.time_ < var_424_6 + var_424_7 then
				local var_424_8 = (arg_421_1.time_ - var_424_6) / var_424_7

				if arg_421_1.var_.characterEffect1075ui_story then
					local var_424_9 = Mathf.Lerp(0, 0.5, var_424_8)

					arg_421_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1075ui_story.fillRatio = var_424_9
				end
			end

			if arg_421_1.time_ >= var_424_6 + var_424_7 and arg_421_1.time_ < var_424_6 + var_424_7 + arg_424_0 and arg_421_1.var_.characterEffect1075ui_story then
				local var_424_10 = 0.5

				arg_421_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1075ui_story.fillRatio = var_424_10
			end

			local var_424_11 = 0
			local var_424_12 = 0.15

			if var_424_11 < arg_421_1.time_ and arg_421_1.time_ <= var_424_11 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_13 = arg_421_1:FormatText(StoryNameCfg[384].name)

				arg_421_1.leftNameTxt_.text = var_424_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_14 = arg_421_1:GetWordFromCfg(122531104)
				local var_424_15 = arg_421_1:FormatText(var_424_14.content)

				arg_421_1.text_.text = var_424_15

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_16 = 6
				local var_424_17 = utf8.len(var_424_15)
				local var_424_18 = var_424_16 <= 0 and var_424_12 or var_424_12 * (var_424_17 / var_424_16)

				if var_424_18 > 0 and var_424_12 < var_424_18 then
					arg_421_1.talkMaxDuration = var_424_18

					if var_424_18 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_18 + var_424_11
					end
				end

				arg_421_1.text_.text = var_424_15
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531104", "story_v_out_122531.awb") ~= 0 then
					local var_424_19 = manager.audio:GetVoiceLength("story_v_out_122531", "122531104", "story_v_out_122531.awb") / 1000

					if var_424_19 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_11
					end

					if var_424_14.prefab_name ~= "" and arg_421_1.actors_[var_424_14.prefab_name] ~= nil then
						local var_424_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_14.prefab_name].transform, "story_v_out_122531", "122531104", "story_v_out_122531.awb")

						arg_421_1:RecordAudio("122531104", var_424_20)
						arg_421_1:RecordAudio("122531104", var_424_20)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_122531", "122531104", "story_v_out_122531.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_122531", "122531104", "story_v_out_122531.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_21 = math.max(var_424_12, arg_421_1.talkMaxDuration)

			if var_424_11 <= arg_421_1.time_ and arg_421_1.time_ < var_424_11 + var_424_21 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_11) / var_424_21

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_11 + var_424_21 and arg_421_1.time_ < var_424_11 + var_424_21 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play122531105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 122531105
		arg_425_1.duration_ = 2.166

		local var_425_0 = {
			ja = 2.166,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_425_0:Play122531106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1075ui_story"].transform
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				arg_425_1.var_.moveOldPos1075ui_story = var_428_0.localPosition
			end

			local var_428_2 = 0.001

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2
				local var_428_4 = Vector3.New(0, 100, 0)

				var_428_0.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1075ui_story, var_428_4, var_428_3)

				local var_428_5 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_5.x, var_428_5.y, var_428_5.z)

				local var_428_6 = var_428_0.localEulerAngles

				var_428_6.z = 0
				var_428_6.x = 0
				var_428_0.localEulerAngles = var_428_6
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 then
				var_428_0.localPosition = Vector3.New(0, 100, 0)

				local var_428_7 = manager.ui.mainCamera.transform.position - var_428_0.position

				var_428_0.forward = Vector3.New(var_428_7.x, var_428_7.y, var_428_7.z)

				local var_428_8 = var_428_0.localEulerAngles

				var_428_8.z = 0
				var_428_8.x = 0
				var_428_0.localEulerAngles = var_428_8
			end

			local var_428_9 = arg_425_1.actors_["1075ui_story"]
			local var_428_10 = 0

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 and arg_425_1.var_.characterEffect1075ui_story == nil then
				arg_425_1.var_.characterEffect1075ui_story = var_428_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_11 = 0.200000002980232

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_11 then
				local var_428_12 = (arg_425_1.time_ - var_428_10) / var_428_11

				if arg_425_1.var_.characterEffect1075ui_story then
					local var_428_13 = Mathf.Lerp(0, 0.5, var_428_12)

					arg_425_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1075ui_story.fillRatio = var_428_13
				end
			end

			if arg_425_1.time_ >= var_428_10 + var_428_11 and arg_425_1.time_ < var_428_10 + var_428_11 + arg_428_0 and arg_425_1.var_.characterEffect1075ui_story then
				local var_428_14 = 0.5

				arg_425_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1075ui_story.fillRatio = var_428_14
			end

			local var_428_15 = arg_425_1.actors_["1069ui_story"].transform
			local var_428_16 = 0

			if var_428_16 < arg_425_1.time_ and arg_425_1.time_ <= var_428_16 + arg_428_0 then
				arg_425_1.var_.moveOldPos1069ui_story = var_428_15.localPosition
			end

			local var_428_17 = 0.001

			if var_428_16 <= arg_425_1.time_ and arg_425_1.time_ < var_428_16 + var_428_17 then
				local var_428_18 = (arg_425_1.time_ - var_428_16) / var_428_17
				local var_428_19 = Vector3.New(0.7, -1, -6)

				var_428_15.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos1069ui_story, var_428_19, var_428_18)

				local var_428_20 = manager.ui.mainCamera.transform.position - var_428_15.position

				var_428_15.forward = Vector3.New(var_428_20.x, var_428_20.y, var_428_20.z)

				local var_428_21 = var_428_15.localEulerAngles

				var_428_21.z = 0
				var_428_21.x = 0
				var_428_15.localEulerAngles = var_428_21
			end

			if arg_425_1.time_ >= var_428_16 + var_428_17 and arg_425_1.time_ < var_428_16 + var_428_17 + arg_428_0 then
				var_428_15.localPosition = Vector3.New(0.7, -1, -6)

				local var_428_22 = manager.ui.mainCamera.transform.position - var_428_15.position

				var_428_15.forward = Vector3.New(var_428_22.x, var_428_22.y, var_428_22.z)

				local var_428_23 = var_428_15.localEulerAngles

				var_428_23.z = 0
				var_428_23.x = 0
				var_428_15.localEulerAngles = var_428_23
			end

			local var_428_24 = arg_425_1.actors_["1069ui_story"]
			local var_428_25 = 0

			if var_428_25 < arg_425_1.time_ and arg_425_1.time_ <= var_428_25 + arg_428_0 and arg_425_1.var_.characterEffect1069ui_story == nil then
				arg_425_1.var_.characterEffect1069ui_story = var_428_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_26 = 0.200000002980232

			if var_428_25 <= arg_425_1.time_ and arg_425_1.time_ < var_428_25 + var_428_26 then
				local var_428_27 = (arg_425_1.time_ - var_428_25) / var_428_26

				if arg_425_1.var_.characterEffect1069ui_story then
					arg_425_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_25 + var_428_26 and arg_425_1.time_ < var_428_25 + var_428_26 + arg_428_0 and arg_425_1.var_.characterEffect1069ui_story then
				arg_425_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_428_28 = 0

			if var_428_28 < arg_425_1.time_ and arg_425_1.time_ <= var_428_28 + arg_428_0 then
				arg_425_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_428_29 = 0

			if var_428_29 < arg_425_1.time_ and arg_425_1.time_ <= var_428_29 + arg_428_0 then
				arg_425_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_428_30 = arg_425_1.actors_["1071ui_story"]
			local var_428_31 = 0

			if var_428_31 < arg_425_1.time_ and arg_425_1.time_ <= var_428_31 + arg_428_0 and arg_425_1.var_.characterEffect1071ui_story == nil then
				arg_425_1.var_.characterEffect1071ui_story = var_428_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_32 = 0.200000002980232

			if var_428_31 <= arg_425_1.time_ and arg_425_1.time_ < var_428_31 + var_428_32 then
				local var_428_33 = (arg_425_1.time_ - var_428_31) / var_428_32

				if arg_425_1.var_.characterEffect1071ui_story then
					local var_428_34 = Mathf.Lerp(0, 0.5, var_428_33)

					arg_425_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1071ui_story.fillRatio = var_428_34
				end
			end

			if arg_425_1.time_ >= var_428_31 + var_428_32 and arg_425_1.time_ < var_428_31 + var_428_32 + arg_428_0 and arg_425_1.var_.characterEffect1071ui_story then
				local var_428_35 = 0.5

				arg_425_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1071ui_story.fillRatio = var_428_35
			end

			local var_428_36 = 0
			local var_428_37 = 0.175

			if var_428_36 < arg_425_1.time_ and arg_425_1.time_ <= var_428_36 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_38 = arg_425_1:FormatText(StoryNameCfg[378].name)

				arg_425_1.leftNameTxt_.text = var_428_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_39 = arg_425_1:GetWordFromCfg(122531105)
				local var_428_40 = arg_425_1:FormatText(var_428_39.content)

				arg_425_1.text_.text = var_428_40

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_41 = 7
				local var_428_42 = utf8.len(var_428_40)
				local var_428_43 = var_428_41 <= 0 and var_428_37 or var_428_37 * (var_428_42 / var_428_41)

				if var_428_43 > 0 and var_428_37 < var_428_43 then
					arg_425_1.talkMaxDuration = var_428_43

					if var_428_43 + var_428_36 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_43 + var_428_36
					end
				end

				arg_425_1.text_.text = var_428_40
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531105", "story_v_out_122531.awb") ~= 0 then
					local var_428_44 = manager.audio:GetVoiceLength("story_v_out_122531", "122531105", "story_v_out_122531.awb") / 1000

					if var_428_44 + var_428_36 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_44 + var_428_36
					end

					if var_428_39.prefab_name ~= "" and arg_425_1.actors_[var_428_39.prefab_name] ~= nil then
						local var_428_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_39.prefab_name].transform, "story_v_out_122531", "122531105", "story_v_out_122531.awb")

						arg_425_1:RecordAudio("122531105", var_428_45)
						arg_425_1:RecordAudio("122531105", var_428_45)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_122531", "122531105", "story_v_out_122531.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_122531", "122531105", "story_v_out_122531.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_46 = math.max(var_428_37, arg_425_1.talkMaxDuration)

			if var_428_36 <= arg_425_1.time_ and arg_425_1.time_ < var_428_36 + var_428_46 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_36) / var_428_46

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_36 + var_428_46 and arg_425_1.time_ < var_428_36 + var_428_46 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play122531106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 122531106
		arg_429_1.duration_ = 14.433

		local var_429_0 = {
			ja = 14.433,
			ko = 10.533,
			zh = 10.533
		}
		local var_429_1 = manager.audio:GetLocalizationFlag()

		if var_429_0[var_429_1] ~= nil then
			arg_429_1.duration_ = var_429_0[var_429_1]
		end

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play122531107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1071ui_story"].transform
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 then
				arg_429_1.var_.moveOldPos1071ui_story = var_432_0.localPosition
			end

			local var_432_2 = 0.001

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2
				local var_432_4 = Vector3.New(0, -1.05, -6.2)

				var_432_0.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1071ui_story, var_432_4, var_432_3)

				local var_432_5 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_5.x, var_432_5.y, var_432_5.z)

				local var_432_6 = var_432_0.localEulerAngles

				var_432_6.z = 0
				var_432_6.x = 0
				var_432_0.localEulerAngles = var_432_6
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 then
				var_432_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_432_7 = manager.ui.mainCamera.transform.position - var_432_0.position

				var_432_0.forward = Vector3.New(var_432_7.x, var_432_7.y, var_432_7.z)

				local var_432_8 = var_432_0.localEulerAngles

				var_432_8.z = 0
				var_432_8.x = 0
				var_432_0.localEulerAngles = var_432_8
			end

			local var_432_9 = arg_429_1.actors_["1071ui_story"]
			local var_432_10 = 0

			if var_432_10 < arg_429_1.time_ and arg_429_1.time_ <= var_432_10 + arg_432_0 and arg_429_1.var_.characterEffect1071ui_story == nil then
				arg_429_1.var_.characterEffect1071ui_story = var_432_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_11 = 0.200000002980232

			if var_432_10 <= arg_429_1.time_ and arg_429_1.time_ < var_432_10 + var_432_11 then
				local var_432_12 = (arg_429_1.time_ - var_432_10) / var_432_11

				if arg_429_1.var_.characterEffect1071ui_story then
					arg_429_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_10 + var_432_11 and arg_429_1.time_ < var_432_10 + var_432_11 + arg_432_0 and arg_429_1.var_.characterEffect1071ui_story then
				arg_429_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_432_13 = 0

			if var_432_13 < arg_429_1.time_ and arg_429_1.time_ <= var_432_13 + arg_432_0 then
				arg_429_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_432_14 = arg_429_1.actors_["1069ui_story"].transform
			local var_432_15 = 0

			if var_432_15 < arg_429_1.time_ and arg_429_1.time_ <= var_432_15 + arg_432_0 then
				arg_429_1.var_.moveOldPos1069ui_story = var_432_14.localPosition
			end

			local var_432_16 = 0.001

			if var_432_15 <= arg_429_1.time_ and arg_429_1.time_ < var_432_15 + var_432_16 then
				local var_432_17 = (arg_429_1.time_ - var_432_15) / var_432_16
				local var_432_18 = Vector3.New(0, 100, 0)

				var_432_14.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1069ui_story, var_432_18, var_432_17)

				local var_432_19 = manager.ui.mainCamera.transform.position - var_432_14.position

				var_432_14.forward = Vector3.New(var_432_19.x, var_432_19.y, var_432_19.z)

				local var_432_20 = var_432_14.localEulerAngles

				var_432_20.z = 0
				var_432_20.x = 0
				var_432_14.localEulerAngles = var_432_20
			end

			if arg_429_1.time_ >= var_432_15 + var_432_16 and arg_429_1.time_ < var_432_15 + var_432_16 + arg_432_0 then
				var_432_14.localPosition = Vector3.New(0, 100, 0)

				local var_432_21 = manager.ui.mainCamera.transform.position - var_432_14.position

				var_432_14.forward = Vector3.New(var_432_21.x, var_432_21.y, var_432_21.z)

				local var_432_22 = var_432_14.localEulerAngles

				var_432_22.z = 0
				var_432_22.x = 0
				var_432_14.localEulerAngles = var_432_22
			end

			local var_432_23 = arg_429_1.actors_["1069ui_story"]
			local var_432_24 = 0

			if var_432_24 < arg_429_1.time_ and arg_429_1.time_ <= var_432_24 + arg_432_0 and arg_429_1.var_.characterEffect1069ui_story == nil then
				arg_429_1.var_.characterEffect1069ui_story = var_432_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_25 = 0.200000002980232

			if var_432_24 <= arg_429_1.time_ and arg_429_1.time_ < var_432_24 + var_432_25 then
				local var_432_26 = (arg_429_1.time_ - var_432_24) / var_432_25

				if arg_429_1.var_.characterEffect1069ui_story then
					local var_432_27 = Mathf.Lerp(0, 0.5, var_432_26)

					arg_429_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1069ui_story.fillRatio = var_432_27
				end
			end

			if arg_429_1.time_ >= var_432_24 + var_432_25 and arg_429_1.time_ < var_432_24 + var_432_25 + arg_432_0 and arg_429_1.var_.characterEffect1069ui_story then
				local var_432_28 = 0.5

				arg_429_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1069ui_story.fillRatio = var_432_28
			end

			local var_432_29 = 0
			local var_432_30 = 1.075

			if var_432_29 < arg_429_1.time_ and arg_429_1.time_ <= var_432_29 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_31 = arg_429_1:FormatText(StoryNameCfg[384].name)

				arg_429_1.leftNameTxt_.text = var_432_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_32 = arg_429_1:GetWordFromCfg(122531106)
				local var_432_33 = arg_429_1:FormatText(var_432_32.content)

				arg_429_1.text_.text = var_432_33

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_34 = 43
				local var_432_35 = utf8.len(var_432_33)
				local var_432_36 = var_432_34 <= 0 and var_432_30 or var_432_30 * (var_432_35 / var_432_34)

				if var_432_36 > 0 and var_432_30 < var_432_36 then
					arg_429_1.talkMaxDuration = var_432_36

					if var_432_36 + var_432_29 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_36 + var_432_29
					end
				end

				arg_429_1.text_.text = var_432_33
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531106", "story_v_out_122531.awb") ~= 0 then
					local var_432_37 = manager.audio:GetVoiceLength("story_v_out_122531", "122531106", "story_v_out_122531.awb") / 1000

					if var_432_37 + var_432_29 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_37 + var_432_29
					end

					if var_432_32.prefab_name ~= "" and arg_429_1.actors_[var_432_32.prefab_name] ~= nil then
						local var_432_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_32.prefab_name].transform, "story_v_out_122531", "122531106", "story_v_out_122531.awb")

						arg_429_1:RecordAudio("122531106", var_432_38)
						arg_429_1:RecordAudio("122531106", var_432_38)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_122531", "122531106", "story_v_out_122531.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_122531", "122531106", "story_v_out_122531.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_39 = math.max(var_432_30, arg_429_1.talkMaxDuration)

			if var_432_29 <= arg_429_1.time_ and arg_429_1.time_ < var_432_29 + var_432_39 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_29) / var_432_39

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_29 + var_432_39 and arg_429_1.time_ < var_432_29 + var_432_39 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play122531107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 122531107
		arg_433_1.duration_ = 19.9

		local var_433_0 = {
			ja = 19.9,
			ko = 15.2,
			zh = 15.2
		}
		local var_433_1 = manager.audio:GetLocalizationFlag()

		if var_433_0[var_433_1] ~= nil then
			arg_433_1.duration_ = var_433_0[var_433_1]
		end

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play122531108(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_2")
			end

			local var_436_1 = 0
			local var_436_2 = 1.475

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_3 = arg_433_1:FormatText(StoryNameCfg[384].name)

				arg_433_1.leftNameTxt_.text = var_436_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_4 = arg_433_1:GetWordFromCfg(122531107)
				local var_436_5 = arg_433_1:FormatText(var_436_4.content)

				arg_433_1.text_.text = var_436_5

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_6 = 59
				local var_436_7 = utf8.len(var_436_5)
				local var_436_8 = var_436_6 <= 0 and var_436_2 or var_436_2 * (var_436_7 / var_436_6)

				if var_436_8 > 0 and var_436_2 < var_436_8 then
					arg_433_1.talkMaxDuration = var_436_8

					if var_436_8 + var_436_1 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_8 + var_436_1
					end
				end

				arg_433_1.text_.text = var_436_5
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531107", "story_v_out_122531.awb") ~= 0 then
					local var_436_9 = manager.audio:GetVoiceLength("story_v_out_122531", "122531107", "story_v_out_122531.awb") / 1000

					if var_436_9 + var_436_1 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_9 + var_436_1
					end

					if var_436_4.prefab_name ~= "" and arg_433_1.actors_[var_436_4.prefab_name] ~= nil then
						local var_436_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_4.prefab_name].transform, "story_v_out_122531", "122531107", "story_v_out_122531.awb")

						arg_433_1:RecordAudio("122531107", var_436_10)
						arg_433_1:RecordAudio("122531107", var_436_10)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_122531", "122531107", "story_v_out_122531.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_122531", "122531107", "story_v_out_122531.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_11 = math.max(var_436_2, arg_433_1.talkMaxDuration)

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_11 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_1) / var_436_11

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_1 + var_436_11 and arg_433_1.time_ < var_436_1 + var_436_11 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play122531108 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 122531108
		arg_437_1.duration_ = 19.133

		local var_437_0 = {
			ja = 19.133,
			ko = 15.1,
			zh = 15.1
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
				arg_437_0:Play122531109(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 1.5

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[384].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(122531108)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 60
				local var_440_6 = utf8.len(var_440_4)
				local var_440_7 = var_440_5 <= 0 and var_440_1 or var_440_1 * (var_440_6 / var_440_5)

				if var_440_7 > 0 and var_440_1 < var_440_7 then
					arg_437_1.talkMaxDuration = var_440_7

					if var_440_7 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_7 + var_440_0
					end
				end

				arg_437_1.text_.text = var_440_4
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531108", "story_v_out_122531.awb") ~= 0 then
					local var_440_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531108", "story_v_out_122531.awb") / 1000

					if var_440_8 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_8 + var_440_0
					end

					if var_440_3.prefab_name ~= "" and arg_437_1.actors_[var_440_3.prefab_name] ~= nil then
						local var_440_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_3.prefab_name].transform, "story_v_out_122531", "122531108", "story_v_out_122531.awb")

						arg_437_1:RecordAudio("122531108", var_440_9)
						arg_437_1:RecordAudio("122531108", var_440_9)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_122531", "122531108", "story_v_out_122531.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_122531", "122531108", "story_v_out_122531.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_10 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_10 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_10

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_10 and arg_437_1.time_ < var_440_0 + var_440_10 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play122531109 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 122531109
		arg_441_1.duration_ = 1.366

		local var_441_0 = {
			ja = 1.366,
			ko = 1.266,
			zh = 1.266
		}
		local var_441_1 = manager.audio:GetLocalizationFlag()

		if var_441_0[var_441_1] ~= nil then
			arg_441_1.duration_ = var_441_0[var_441_1]
		end

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play122531110(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1075ui_story"].transform
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 then
				arg_441_1.var_.moveOldPos1075ui_story = var_444_0.localPosition
			end

			local var_444_2 = 0.001

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2
				local var_444_4 = Vector3.New(0, -1.055, -6.16)

				var_444_0.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos1075ui_story, var_444_4, var_444_3)

				local var_444_5 = manager.ui.mainCamera.transform.position - var_444_0.position

				var_444_0.forward = Vector3.New(var_444_5.x, var_444_5.y, var_444_5.z)

				local var_444_6 = var_444_0.localEulerAngles

				var_444_6.z = 0
				var_444_6.x = 0
				var_444_0.localEulerAngles = var_444_6
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 then
				var_444_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_444_7 = manager.ui.mainCamera.transform.position - var_444_0.position

				var_444_0.forward = Vector3.New(var_444_7.x, var_444_7.y, var_444_7.z)

				local var_444_8 = var_444_0.localEulerAngles

				var_444_8.z = 0
				var_444_8.x = 0
				var_444_0.localEulerAngles = var_444_8
			end

			local var_444_9 = arg_441_1.actors_["1075ui_story"]
			local var_444_10 = 0

			if var_444_10 < arg_441_1.time_ and arg_441_1.time_ <= var_444_10 + arg_444_0 and arg_441_1.var_.characterEffect1075ui_story == nil then
				arg_441_1.var_.characterEffect1075ui_story = var_444_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_11 = 0.200000002980232

			if var_444_10 <= arg_441_1.time_ and arg_441_1.time_ < var_444_10 + var_444_11 then
				local var_444_12 = (arg_441_1.time_ - var_444_10) / var_444_11

				if arg_441_1.var_.characterEffect1075ui_story then
					arg_441_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_441_1.time_ >= var_444_10 + var_444_11 and arg_441_1.time_ < var_444_10 + var_444_11 + arg_444_0 and arg_441_1.var_.characterEffect1075ui_story then
				arg_441_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_444_13 = 0

			if var_444_13 < arg_441_1.time_ and arg_441_1.time_ <= var_444_13 + arg_444_0 then
				arg_441_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_444_14 = 0

			if var_444_14 < arg_441_1.time_ and arg_441_1.time_ <= var_444_14 + arg_444_0 then
				arg_441_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_444_15 = arg_441_1.actors_["1071ui_story"].transform
			local var_444_16 = 0

			if var_444_16 < arg_441_1.time_ and arg_441_1.time_ <= var_444_16 + arg_444_0 then
				arg_441_1.var_.moveOldPos1071ui_story = var_444_15.localPosition
			end

			local var_444_17 = 0.001

			if var_444_16 <= arg_441_1.time_ and arg_441_1.time_ < var_444_16 + var_444_17 then
				local var_444_18 = (arg_441_1.time_ - var_444_16) / var_444_17
				local var_444_19 = Vector3.New(0, 100, 0)

				var_444_15.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos1071ui_story, var_444_19, var_444_18)

				local var_444_20 = manager.ui.mainCamera.transform.position - var_444_15.position

				var_444_15.forward = Vector3.New(var_444_20.x, var_444_20.y, var_444_20.z)

				local var_444_21 = var_444_15.localEulerAngles

				var_444_21.z = 0
				var_444_21.x = 0
				var_444_15.localEulerAngles = var_444_21
			end

			if arg_441_1.time_ >= var_444_16 + var_444_17 and arg_441_1.time_ < var_444_16 + var_444_17 + arg_444_0 then
				var_444_15.localPosition = Vector3.New(0, 100, 0)

				local var_444_22 = manager.ui.mainCamera.transform.position - var_444_15.position

				var_444_15.forward = Vector3.New(var_444_22.x, var_444_22.y, var_444_22.z)

				local var_444_23 = var_444_15.localEulerAngles

				var_444_23.z = 0
				var_444_23.x = 0
				var_444_15.localEulerAngles = var_444_23
			end

			local var_444_24 = arg_441_1.actors_["1071ui_story"]
			local var_444_25 = 0

			if var_444_25 < arg_441_1.time_ and arg_441_1.time_ <= var_444_25 + arg_444_0 and arg_441_1.var_.characterEffect1071ui_story == nil then
				arg_441_1.var_.characterEffect1071ui_story = var_444_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_26 = 0.200000002980232

			if var_444_25 <= arg_441_1.time_ and arg_441_1.time_ < var_444_25 + var_444_26 then
				local var_444_27 = (arg_441_1.time_ - var_444_25) / var_444_26

				if arg_441_1.var_.characterEffect1071ui_story then
					local var_444_28 = Mathf.Lerp(0, 0.5, var_444_27)

					arg_441_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1071ui_story.fillRatio = var_444_28
				end
			end

			if arg_441_1.time_ >= var_444_25 + var_444_26 and arg_441_1.time_ < var_444_25 + var_444_26 + arg_444_0 and arg_441_1.var_.characterEffect1071ui_story then
				local var_444_29 = 0.5

				arg_441_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1071ui_story.fillRatio = var_444_29
			end

			local var_444_30 = 0
			local var_444_31 = 0.1

			if var_444_30 < arg_441_1.time_ and arg_441_1.time_ <= var_444_30 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_32 = arg_441_1:FormatText(StoryNameCfg[381].name)

				arg_441_1.leftNameTxt_.text = var_444_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_33 = arg_441_1:GetWordFromCfg(122531109)
				local var_444_34 = arg_441_1:FormatText(var_444_33.content)

				arg_441_1.text_.text = var_444_34

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_35 = 4
				local var_444_36 = utf8.len(var_444_34)
				local var_444_37 = var_444_35 <= 0 and var_444_31 or var_444_31 * (var_444_36 / var_444_35)

				if var_444_37 > 0 and var_444_31 < var_444_37 then
					arg_441_1.talkMaxDuration = var_444_37

					if var_444_37 + var_444_30 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_37 + var_444_30
					end
				end

				arg_441_1.text_.text = var_444_34
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531109", "story_v_out_122531.awb") ~= 0 then
					local var_444_38 = manager.audio:GetVoiceLength("story_v_out_122531", "122531109", "story_v_out_122531.awb") / 1000

					if var_444_38 + var_444_30 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_38 + var_444_30
					end

					if var_444_33.prefab_name ~= "" and arg_441_1.actors_[var_444_33.prefab_name] ~= nil then
						local var_444_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_33.prefab_name].transform, "story_v_out_122531", "122531109", "story_v_out_122531.awb")

						arg_441_1:RecordAudio("122531109", var_444_39)
						arg_441_1:RecordAudio("122531109", var_444_39)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_122531", "122531109", "story_v_out_122531.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_122531", "122531109", "story_v_out_122531.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_40 = math.max(var_444_31, arg_441_1.talkMaxDuration)

			if var_444_30 <= arg_441_1.time_ and arg_441_1.time_ < var_444_30 + var_444_40 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_30) / var_444_40

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_30 + var_444_40 and arg_441_1.time_ < var_444_30 + var_444_40 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play122531110 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 122531110
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play122531111(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1075ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos1075ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(0, 100, 0)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1075ui_story, var_448_4, var_448_3)

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

			local var_448_9 = arg_445_1.actors_["1075ui_story"]
			local var_448_10 = 0

			if var_448_10 < arg_445_1.time_ and arg_445_1.time_ <= var_448_10 + arg_448_0 and arg_445_1.var_.characterEffect1075ui_story == nil then
				arg_445_1.var_.characterEffect1075ui_story = var_448_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_11 = 0.200000002980232

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_11 then
				local var_448_12 = (arg_445_1.time_ - var_448_10) / var_448_11

				if arg_445_1.var_.characterEffect1075ui_story then
					local var_448_13 = Mathf.Lerp(0, 0.5, var_448_12)

					arg_445_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_445_1.var_.characterEffect1075ui_story.fillRatio = var_448_13
				end
			end

			if arg_445_1.time_ >= var_448_10 + var_448_11 and arg_445_1.time_ < var_448_10 + var_448_11 + arg_448_0 and arg_445_1.var_.characterEffect1075ui_story then
				local var_448_14 = 0.5

				arg_445_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_445_1.var_.characterEffect1075ui_story.fillRatio = var_448_14
			end

			local var_448_15 = 0
			local var_448_16 = 1.375

			if var_448_15 < arg_445_1.time_ and arg_445_1.time_ <= var_448_15 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, false)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_17 = arg_445_1:GetWordFromCfg(122531110)
				local var_448_18 = arg_445_1:FormatText(var_448_17.content)

				arg_445_1.text_.text = var_448_18

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_19 = 55
				local var_448_20 = utf8.len(var_448_18)
				local var_448_21 = var_448_19 <= 0 and var_448_16 or var_448_16 * (var_448_20 / var_448_19)

				if var_448_21 > 0 and var_448_16 < var_448_21 then
					arg_445_1.talkMaxDuration = var_448_21

					if var_448_21 + var_448_15 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_21 + var_448_15
					end
				end

				arg_445_1.text_.text = var_448_18
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_22 = math.max(var_448_16, arg_445_1.talkMaxDuration)

			if var_448_15 <= arg_445_1.time_ and arg_445_1.time_ < var_448_15 + var_448_22 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_15) / var_448_22

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_15 + var_448_22 and arg_445_1.time_ < var_448_15 + var_448_22 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play122531111 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 122531111
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play122531112(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 0.85

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, false)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_2 = arg_449_1:GetWordFromCfg(122531111)
				local var_452_3 = arg_449_1:FormatText(var_452_2.content)

				arg_449_1.text_.text = var_452_3

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_4 = 34
				local var_452_5 = utf8.len(var_452_3)
				local var_452_6 = var_452_4 <= 0 and var_452_1 or var_452_1 * (var_452_5 / var_452_4)

				if var_452_6 > 0 and var_452_1 < var_452_6 then
					arg_449_1.talkMaxDuration = var_452_6

					if var_452_6 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_6 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_3
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_7 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_7 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_7

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_7 and arg_449_1.time_ < var_452_0 + var_452_7 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play122531112 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 122531112
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play122531113(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0
			local var_456_1 = 0.675

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

				local var_456_2 = arg_453_1:GetWordFromCfg(122531112)
				local var_456_3 = arg_453_1:FormatText(var_456_2.content)

				arg_453_1.text_.text = var_456_3

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_4 = 27
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
	Play122531113 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 122531113
		arg_457_1.duration_ = 8.066

		local var_457_0 = {
			ja = 8.066,
			ko = 4.8,
			zh = 4.8
		}
		local var_457_1 = manager.audio:GetLocalizationFlag()

		if var_457_0[var_457_1] ~= nil then
			arg_457_1.duration_ = var_457_0[var_457_1]
		end

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play122531114(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1071ui_story"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos1071ui_story = var_460_0.localPosition
			end

			local var_460_2 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2
				local var_460_4 = Vector3.New(0, -1.05, -6.2)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos1071ui_story, var_460_4, var_460_3)

				local var_460_5 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_5.x, var_460_5.y, var_460_5.z)

				local var_460_6 = var_460_0.localEulerAngles

				var_460_6.z = 0
				var_460_6.x = 0
				var_460_0.localEulerAngles = var_460_6
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_460_7 = manager.ui.mainCamera.transform.position - var_460_0.position

				var_460_0.forward = Vector3.New(var_460_7.x, var_460_7.y, var_460_7.z)

				local var_460_8 = var_460_0.localEulerAngles

				var_460_8.z = 0
				var_460_8.x = 0
				var_460_0.localEulerAngles = var_460_8
			end

			local var_460_9 = arg_457_1.actors_["1071ui_story"]
			local var_460_10 = 0

			if var_460_10 < arg_457_1.time_ and arg_457_1.time_ <= var_460_10 + arg_460_0 and arg_457_1.var_.characterEffect1071ui_story == nil then
				arg_457_1.var_.characterEffect1071ui_story = var_460_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_11 = 0.200000002980232

			if var_460_10 <= arg_457_1.time_ and arg_457_1.time_ < var_460_10 + var_460_11 then
				local var_460_12 = (arg_457_1.time_ - var_460_10) / var_460_11

				if arg_457_1.var_.characterEffect1071ui_story then
					arg_457_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_10 + var_460_11 and arg_457_1.time_ < var_460_10 + var_460_11 + arg_460_0 and arg_457_1.var_.characterEffect1071ui_story then
				arg_457_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_460_13 = 0

			if var_460_13 < arg_457_1.time_ and arg_457_1.time_ <= var_460_13 + arg_460_0 then
				arg_457_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_1")
			end

			local var_460_14 = 0

			if var_460_14 < arg_457_1.time_ and arg_457_1.time_ <= var_460_14 + arg_460_0 then
				arg_457_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_460_15 = 0
			local var_460_16 = 0.325

			if var_460_15 < arg_457_1.time_ and arg_457_1.time_ <= var_460_15 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_17 = arg_457_1:FormatText(StoryNameCfg[384].name)

				arg_457_1.leftNameTxt_.text = var_460_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_18 = arg_457_1:GetWordFromCfg(122531113)
				local var_460_19 = arg_457_1:FormatText(var_460_18.content)

				arg_457_1.text_.text = var_460_19

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_20 = 13
				local var_460_21 = utf8.len(var_460_19)
				local var_460_22 = var_460_20 <= 0 and var_460_16 or var_460_16 * (var_460_21 / var_460_20)

				if var_460_22 > 0 and var_460_16 < var_460_22 then
					arg_457_1.talkMaxDuration = var_460_22

					if var_460_22 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_22 + var_460_15
					end
				end

				arg_457_1.text_.text = var_460_19
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531113", "story_v_out_122531.awb") ~= 0 then
					local var_460_23 = manager.audio:GetVoiceLength("story_v_out_122531", "122531113", "story_v_out_122531.awb") / 1000

					if var_460_23 + var_460_15 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_23 + var_460_15
					end

					if var_460_18.prefab_name ~= "" and arg_457_1.actors_[var_460_18.prefab_name] ~= nil then
						local var_460_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_18.prefab_name].transform, "story_v_out_122531", "122531113", "story_v_out_122531.awb")

						arg_457_1:RecordAudio("122531113", var_460_24)
						arg_457_1:RecordAudio("122531113", var_460_24)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_122531", "122531113", "story_v_out_122531.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_122531", "122531113", "story_v_out_122531.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_25 = math.max(var_460_16, arg_457_1.talkMaxDuration)

			if var_460_15 <= arg_457_1.time_ and arg_457_1.time_ < var_460_15 + var_460_25 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_15) / var_460_25

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_15 + var_460_25 and arg_457_1.time_ < var_460_15 + var_460_25 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play122531114 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 122531114
		arg_461_1.duration_ = 5.333

		local var_461_0 = {
			ja = 4.7,
			ko = 5.333,
			zh = 5.333
		}
		local var_461_1 = manager.audio:GetLocalizationFlag()

		if var_461_0[var_461_1] ~= nil then
			arg_461_1.duration_ = var_461_0[var_461_1]
		end

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play122531115(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.4

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[384].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(122531114)
				local var_464_4 = arg_461_1:FormatText(var_464_3.content)

				arg_461_1.text_.text = var_464_4

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_5 = 16
				local var_464_6 = utf8.len(var_464_4)
				local var_464_7 = var_464_5 <= 0 and var_464_1 or var_464_1 * (var_464_6 / var_464_5)

				if var_464_7 > 0 and var_464_1 < var_464_7 then
					arg_461_1.talkMaxDuration = var_464_7

					if var_464_7 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_7 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_4
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531114", "story_v_out_122531.awb") ~= 0 then
					local var_464_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531114", "story_v_out_122531.awb") / 1000

					if var_464_8 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_8 + var_464_0
					end

					if var_464_3.prefab_name ~= "" and arg_461_1.actors_[var_464_3.prefab_name] ~= nil then
						local var_464_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_3.prefab_name].transform, "story_v_out_122531", "122531114", "story_v_out_122531.awb")

						arg_461_1:RecordAudio("122531114", var_464_9)
						arg_461_1:RecordAudio("122531114", var_464_9)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_122531", "122531114", "story_v_out_122531.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_122531", "122531114", "story_v_out_122531.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_10 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_10 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_10

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_10 and arg_461_1.time_ < var_464_0 + var_464_10 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play122531115 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 122531115
		arg_465_1.duration_ = 8.999999999999

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play122531116(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = "ST31"

			if arg_465_1.bgs_[var_468_0] == nil then
				local var_468_1 = Object.Instantiate(arg_465_1.paintGo_)

				var_468_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_468_0)
				var_468_1.name = var_468_0
				var_468_1.transform.parent = arg_465_1.stage_.transform
				var_468_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_465_1.bgs_[var_468_0] = var_468_1
			end

			local var_468_2 = 2

			if var_468_2 < arg_465_1.time_ and arg_465_1.time_ <= var_468_2 + arg_468_0 then
				local var_468_3 = manager.ui.mainCamera.transform.localPosition
				local var_468_4 = Vector3.New(0, 0, 10) + Vector3.New(var_468_3.x, var_468_3.y, 0)
				local var_468_5 = arg_465_1.bgs_.ST31

				var_468_5.transform.localPosition = var_468_4
				var_468_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_468_6 = var_468_5:GetComponent("SpriteRenderer")

				if var_468_6 and var_468_6.sprite then
					local var_468_7 = (var_468_5.transform.localPosition - var_468_3).z
					local var_468_8 = manager.ui.mainCameraCom_
					local var_468_9 = 2 * var_468_7 * Mathf.Tan(var_468_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_468_10 = var_468_9 * var_468_8.aspect
					local var_468_11 = var_468_6.sprite.bounds.size.x
					local var_468_12 = var_468_6.sprite.bounds.size.y
					local var_468_13 = var_468_10 / var_468_11
					local var_468_14 = var_468_9 / var_468_12
					local var_468_15 = var_468_14 < var_468_13 and var_468_13 or var_468_14

					var_468_5.transform.localScale = Vector3.New(var_468_15, var_468_15, 0)
				end

				for iter_468_0, iter_468_1 in pairs(arg_465_1.bgs_) do
					if iter_468_0 ~= "ST31" then
						iter_468_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_468_16 = 0

			if var_468_16 < arg_465_1.time_ and arg_465_1.time_ <= var_468_16 + arg_468_0 then
				arg_465_1.mask_.enabled = true
				arg_465_1.mask_.raycastTarget = true

				arg_465_1:SetGaussion(false)
			end

			local var_468_17 = 2

			if var_468_16 <= arg_465_1.time_ and arg_465_1.time_ < var_468_16 + var_468_17 then
				local var_468_18 = (arg_465_1.time_ - var_468_16) / var_468_17
				local var_468_19 = Color.New(0, 0, 0)

				var_468_19.a = Mathf.Lerp(0, 1, var_468_18)
				arg_465_1.mask_.color = var_468_19
			end

			if arg_465_1.time_ >= var_468_16 + var_468_17 and arg_465_1.time_ < var_468_16 + var_468_17 + arg_468_0 then
				local var_468_20 = Color.New(0, 0, 0)

				var_468_20.a = 1
				arg_465_1.mask_.color = var_468_20
			end

			local var_468_21 = 2

			if var_468_21 < arg_465_1.time_ and arg_465_1.time_ <= var_468_21 + arg_468_0 then
				arg_465_1.mask_.enabled = true
				arg_465_1.mask_.raycastTarget = true

				arg_465_1:SetGaussion(false)
			end

			local var_468_22 = 2

			if var_468_21 <= arg_465_1.time_ and arg_465_1.time_ < var_468_21 + var_468_22 then
				local var_468_23 = (arg_465_1.time_ - var_468_21) / var_468_22
				local var_468_24 = Color.New(0, 0, 0)

				var_468_24.a = Mathf.Lerp(1, 0, var_468_23)
				arg_465_1.mask_.color = var_468_24
			end

			if arg_465_1.time_ >= var_468_21 + var_468_22 and arg_465_1.time_ < var_468_21 + var_468_22 + arg_468_0 then
				local var_468_25 = Color.New(0, 0, 0)
				local var_468_26 = 0

				arg_465_1.mask_.enabled = false
				var_468_25.a = var_468_26
				arg_465_1.mask_.color = var_468_25
			end

			local var_468_27 = arg_465_1.actors_["1071ui_story"].transform
			local var_468_28 = 1.96599999815226

			if var_468_28 < arg_465_1.time_ and arg_465_1.time_ <= var_468_28 + arg_468_0 then
				arg_465_1.var_.moveOldPos1071ui_story = var_468_27.localPosition
			end

			local var_468_29 = 0.001

			if var_468_28 <= arg_465_1.time_ and arg_465_1.time_ < var_468_28 + var_468_29 then
				local var_468_30 = (arg_465_1.time_ - var_468_28) / var_468_29
				local var_468_31 = Vector3.New(0, 100, 0)

				var_468_27.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos1071ui_story, var_468_31, var_468_30)

				local var_468_32 = manager.ui.mainCamera.transform.position - var_468_27.position

				var_468_27.forward = Vector3.New(var_468_32.x, var_468_32.y, var_468_32.z)

				local var_468_33 = var_468_27.localEulerAngles

				var_468_33.z = 0
				var_468_33.x = 0
				var_468_27.localEulerAngles = var_468_33
			end

			if arg_465_1.time_ >= var_468_28 + var_468_29 and arg_465_1.time_ < var_468_28 + var_468_29 + arg_468_0 then
				var_468_27.localPosition = Vector3.New(0, 100, 0)

				local var_468_34 = manager.ui.mainCamera.transform.position - var_468_27.position

				var_468_27.forward = Vector3.New(var_468_34.x, var_468_34.y, var_468_34.z)

				local var_468_35 = var_468_27.localEulerAngles

				var_468_35.z = 0
				var_468_35.x = 0
				var_468_27.localEulerAngles = var_468_35
			end

			local var_468_36 = arg_465_1.actors_["1071ui_story"]
			local var_468_37 = 1.96599999815226

			if var_468_37 < arg_465_1.time_ and arg_465_1.time_ <= var_468_37 + arg_468_0 and arg_465_1.var_.characterEffect1071ui_story == nil then
				arg_465_1.var_.characterEffect1071ui_story = var_468_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_38 = 0.034000001847744

			if var_468_37 <= arg_465_1.time_ and arg_465_1.time_ < var_468_37 + var_468_38 then
				local var_468_39 = (arg_465_1.time_ - var_468_37) / var_468_38

				if arg_465_1.var_.characterEffect1071ui_story then
					local var_468_40 = Mathf.Lerp(0, 0.5, var_468_39)

					arg_465_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1071ui_story.fillRatio = var_468_40
				end
			end

			if arg_465_1.time_ >= var_468_37 + var_468_38 and arg_465_1.time_ < var_468_37 + var_468_38 + arg_468_0 and arg_465_1.var_.characterEffect1071ui_story then
				local var_468_41 = 0.5

				arg_465_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1071ui_story.fillRatio = var_468_41
			end

			if arg_465_1.frameCnt_ <= 1 then
				arg_465_1.dialog_:SetActive(false)
			end

			local var_468_42 = 3.999999999999
			local var_468_43 = 1.3

			if var_468_42 < arg_465_1.time_ and arg_465_1.time_ <= var_468_42 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0

				arg_465_1.dialog_:SetActive(true)

				local var_468_44 = LeanTween.value(arg_465_1.dialog_, 0, 1, 0.3)

				var_468_44:setOnUpdate(LuaHelper.FloatAction(function(arg_469_0)
					arg_465_1.dialogCg_.alpha = arg_469_0
				end))
				var_468_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_465_1.dialog_)
					var_468_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_465_1.duration_ = arg_465_1.duration_ + 0.3

				SetActive(arg_465_1.leftNameGo_, false)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_45 = arg_465_1:GetWordFromCfg(122531115)
				local var_468_46 = arg_465_1:FormatText(var_468_45.content)

				arg_465_1.text_.text = var_468_46

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_47 = 52
				local var_468_48 = utf8.len(var_468_46)
				local var_468_49 = var_468_47 <= 0 and var_468_43 or var_468_43 * (var_468_48 / var_468_47)

				if var_468_49 > 0 and var_468_43 < var_468_49 then
					arg_465_1.talkMaxDuration = var_468_49
					var_468_42 = var_468_42 + 0.3

					if var_468_49 + var_468_42 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_49 + var_468_42
					end
				end

				arg_465_1.text_.text = var_468_46
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_50 = var_468_42 + 0.3
			local var_468_51 = math.max(var_468_43, arg_465_1.talkMaxDuration)

			if var_468_50 <= arg_465_1.time_ and arg_465_1.time_ < var_468_50 + var_468_51 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_50) / var_468_51

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_50 + var_468_51 and arg_465_1.time_ < var_468_50 + var_468_51 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play122531116 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 122531116
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play122531117(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 1.375

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

				local var_474_2 = arg_471_1:GetWordFromCfg(122531116)
				local var_474_3 = arg_471_1:FormatText(var_474_2.content)

				arg_471_1.text_.text = var_474_3

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_4 = 55
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
	Play122531117 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 122531117
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play122531118(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 2.025

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, false)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_2 = arg_475_1:GetWordFromCfg(122531117)
				local var_478_3 = arg_475_1:FormatText(var_478_2.content)

				arg_475_1.text_.text = var_478_3

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_4 = 81
				local var_478_5 = utf8.len(var_478_3)
				local var_478_6 = var_478_4 <= 0 and var_478_1 or var_478_1 * (var_478_5 / var_478_4)

				if var_478_6 > 0 and var_478_1 < var_478_6 then
					arg_475_1.talkMaxDuration = var_478_6

					if var_478_6 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_6 + var_478_0
					end
				end

				arg_475_1.text_.text = var_478_3
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_7 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_7 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_7

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_7 and arg_475_1.time_ < var_478_0 + var_478_7 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play122531118 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 122531118
		arg_479_1.duration_ = 5

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play122531119(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0
			local var_482_1 = 0.225

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_2 = arg_479_1:FormatText(StoryNameCfg[7].name)

				arg_479_1.leftNameTxt_.text = var_482_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_3 = arg_479_1:GetWordFromCfg(122531118)
				local var_482_4 = arg_479_1:FormatText(var_482_3.content)

				arg_479_1.text_.text = var_482_4

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_5 = 9
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
				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_8 = math.max(var_482_1, arg_479_1.talkMaxDuration)

			if var_482_0 <= arg_479_1.time_ and arg_479_1.time_ < var_482_0 + var_482_8 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_0) / var_482_8

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_0 + var_482_8 and arg_479_1.time_ < var_482_0 + var_482_8 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play122531119 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 122531119
		arg_483_1.duration_ = 2.433

		local var_483_0 = {
			ja = 1.999999999999,
			ko = 2.433,
			zh = 2.433
		}
		local var_483_1 = manager.audio:GetLocalizationFlag()

		if var_483_0[var_483_1] ~= nil then
			arg_483_1.duration_ = var_483_0[var_483_1]
		end

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play122531120(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1029ui_story"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos1029ui_story = var_486_0.localPosition
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(0, -1.09, -6.2)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos1029ui_story, var_486_4, var_486_3)

				local var_486_5 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_5.x, var_486_5.y, var_486_5.z)

				local var_486_6 = var_486_0.localEulerAngles

				var_486_6.z = 0
				var_486_6.x = 0
				var_486_0.localEulerAngles = var_486_6
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_486_7 = manager.ui.mainCamera.transform.position - var_486_0.position

				var_486_0.forward = Vector3.New(var_486_7.x, var_486_7.y, var_486_7.z)

				local var_486_8 = var_486_0.localEulerAngles

				var_486_8.z = 0
				var_486_8.x = 0
				var_486_0.localEulerAngles = var_486_8
			end

			local var_486_9 = arg_483_1.actors_["1029ui_story"]
			local var_486_10 = 0

			if var_486_10 < arg_483_1.time_ and arg_483_1.time_ <= var_486_10 + arg_486_0 and arg_483_1.var_.characterEffect1029ui_story == nil then
				arg_483_1.var_.characterEffect1029ui_story = var_486_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_11 = 0.200000002980232

			if var_486_10 <= arg_483_1.time_ and arg_483_1.time_ < var_486_10 + var_486_11 then
				local var_486_12 = (arg_483_1.time_ - var_486_10) / var_486_11

				if arg_483_1.var_.characterEffect1029ui_story then
					arg_483_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_483_1.time_ >= var_486_10 + var_486_11 and arg_483_1.time_ < var_486_10 + var_486_11 + arg_486_0 and arg_483_1.var_.characterEffect1029ui_story then
				arg_483_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_486_13 = 0

			if var_486_13 < arg_483_1.time_ and arg_483_1.time_ <= var_486_13 + arg_486_0 then
				arg_483_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_486_14 = 0

			if var_486_14 < arg_483_1.time_ and arg_483_1.time_ <= var_486_14 + arg_486_0 then
				arg_483_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_486_15 = arg_483_1.actors_["1029ui_story"]
			local var_486_16 = 0

			if var_486_16 < arg_483_1.time_ and arg_483_1.time_ <= var_486_16 + arg_486_0 then
				if arg_483_1.var_.characterEffect1029ui_story == nil then
					arg_483_1.var_.characterEffect1029ui_story = var_486_15:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_486_17 = arg_483_1.var_.characterEffect1029ui_story

				var_486_17.imageEffect:turnOff()

				var_486_17.interferenceEffect.enabled = false
				var_486_17.interferenceEffect.noise = 0.001
				var_486_17.interferenceEffect.simTimeScale = 1
				var_486_17.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_486_18 = arg_483_1.actors_["1029ui_story"]
			local var_486_19 = 0
			local var_486_20 = 0.2

			if var_486_19 < arg_483_1.time_ and arg_483_1.time_ <= var_486_19 + arg_486_0 then
				if arg_483_1.var_.characterEffect1029ui_story == nil then
					arg_483_1.var_.characterEffect1029ui_story = var_486_18:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_483_1.var_.characterEffect1029ui_story.imageEffect:turnOff()
			end

			local var_486_21 = 0
			local var_486_22 = 0.075

			if var_486_21 < arg_483_1.time_ and arg_483_1.time_ <= var_486_21 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_23 = arg_483_1:FormatText(StoryNameCfg[319].name)

				arg_483_1.leftNameTxt_.text = var_486_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_24 = arg_483_1:GetWordFromCfg(122531119)
				local var_486_25 = arg_483_1:FormatText(var_486_24.content)

				arg_483_1.text_.text = var_486_25

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_26 = 3
				local var_486_27 = utf8.len(var_486_25)
				local var_486_28 = var_486_26 <= 0 and var_486_22 or var_486_22 * (var_486_27 / var_486_26)

				if var_486_28 > 0 and var_486_22 < var_486_28 then
					arg_483_1.talkMaxDuration = var_486_28

					if var_486_28 + var_486_21 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_28 + var_486_21
					end
				end

				arg_483_1.text_.text = var_486_25
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531119", "story_v_out_122531.awb") ~= 0 then
					local var_486_29 = manager.audio:GetVoiceLength("story_v_out_122531", "122531119", "story_v_out_122531.awb") / 1000

					if var_486_29 + var_486_21 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_29 + var_486_21
					end

					if var_486_24.prefab_name ~= "" and arg_483_1.actors_[var_486_24.prefab_name] ~= nil then
						local var_486_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_24.prefab_name].transform, "story_v_out_122531", "122531119", "story_v_out_122531.awb")

						arg_483_1:RecordAudio("122531119", var_486_30)
						arg_483_1:RecordAudio("122531119", var_486_30)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_out_122531", "122531119", "story_v_out_122531.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_out_122531", "122531119", "story_v_out_122531.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_31 = math.max(var_486_22, arg_483_1.talkMaxDuration)

			if var_486_21 <= arg_483_1.time_ and arg_483_1.time_ < var_486_21 + var_486_31 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_21) / var_486_31

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_21 + var_486_31 and arg_483_1.time_ < var_486_21 + var_486_31 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play122531120 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 122531120
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play122531121(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1029ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect1029ui_story == nil then
				arg_487_1.var_.characterEffect1029ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.200000002980232

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect1029ui_story then
					local var_490_4 = Mathf.Lerp(0, 0.5, var_490_3)

					arg_487_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1029ui_story.fillRatio = var_490_4
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect1029ui_story then
				local var_490_5 = 0.5

				arg_487_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1029ui_story.fillRatio = var_490_5
			end

			local var_490_6 = 0
			local var_490_7 = 0.45

			if var_490_6 < arg_487_1.time_ and arg_487_1.time_ <= var_490_6 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_8 = arg_487_1:FormatText(StoryNameCfg[7].name)

				arg_487_1.leftNameTxt_.text = var_490_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_9 = arg_487_1:GetWordFromCfg(122531120)
				local var_490_10 = arg_487_1:FormatText(var_490_9.content)

				arg_487_1.text_.text = var_490_10

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_11 = 18
				local var_490_12 = utf8.len(var_490_10)
				local var_490_13 = var_490_11 <= 0 and var_490_7 or var_490_7 * (var_490_12 / var_490_11)

				if var_490_13 > 0 and var_490_7 < var_490_13 then
					arg_487_1.talkMaxDuration = var_490_13

					if var_490_13 + var_490_6 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_13 + var_490_6
					end
				end

				arg_487_1.text_.text = var_490_10
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_14 = math.max(var_490_7, arg_487_1.talkMaxDuration)

			if var_490_6 <= arg_487_1.time_ and arg_487_1.time_ < var_490_6 + var_490_14 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_6) / var_490_14

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_6 + var_490_14 and arg_487_1.time_ < var_490_6 + var_490_14 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play122531121 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 122531121
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play122531122(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0
			local var_494_1 = 1.275

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_2 = arg_491_1:FormatText(StoryNameCfg[7].name)

				arg_491_1.leftNameTxt_.text = var_494_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_3 = arg_491_1:GetWordFromCfg(122531121)
				local var_494_4 = arg_491_1:FormatText(var_494_3.content)

				arg_491_1.text_.text = var_494_4

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_5 = 51
				local var_494_6 = utf8.len(var_494_4)
				local var_494_7 = var_494_5 <= 0 and var_494_1 or var_494_1 * (var_494_6 / var_494_5)

				if var_494_7 > 0 and var_494_1 < var_494_7 then
					arg_491_1.talkMaxDuration = var_494_7

					if var_494_7 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_7 + var_494_0
					end
				end

				arg_491_1.text_.text = var_494_4
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_8 = math.max(var_494_1, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_8 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_0) / var_494_8

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_8 and arg_491_1.time_ < var_494_0 + var_494_8 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play122531122 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 122531122
		arg_495_1.duration_ = 7.233

		local var_495_0 = {
			ja = 7.233,
			ko = 6.333,
			zh = 6.333
		}
		local var_495_1 = manager.audio:GetLocalizationFlag()

		if var_495_0[var_495_1] ~= nil then
			arg_495_1.duration_ = var_495_0[var_495_1]
		end

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play122531123(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1029ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1029ui_story == nil then
				arg_495_1.var_.characterEffect1029ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.200000002980232

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1029ui_story then
					arg_495_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1029ui_story then
				arg_495_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_498_4 = 0

			if var_498_4 < arg_495_1.time_ and arg_495_1.time_ <= var_498_4 + arg_498_0 then
				arg_495_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_498_5 = 0

			if var_498_5 < arg_495_1.time_ and arg_495_1.time_ <= var_498_5 + arg_498_0 then
				arg_495_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_498_6 = 0
			local var_498_7 = 0.475

			if var_498_6 < arg_495_1.time_ and arg_495_1.time_ <= var_498_6 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_8 = arg_495_1:FormatText(StoryNameCfg[319].name)

				arg_495_1.leftNameTxt_.text = var_498_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_9 = arg_495_1:GetWordFromCfg(122531122)
				local var_498_10 = arg_495_1:FormatText(var_498_9.content)

				arg_495_1.text_.text = var_498_10

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_11 = 19
				local var_498_12 = utf8.len(var_498_10)
				local var_498_13 = var_498_11 <= 0 and var_498_7 or var_498_7 * (var_498_12 / var_498_11)

				if var_498_13 > 0 and var_498_7 < var_498_13 then
					arg_495_1.talkMaxDuration = var_498_13

					if var_498_13 + var_498_6 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_13 + var_498_6
					end
				end

				arg_495_1.text_.text = var_498_10
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531122", "story_v_out_122531.awb") ~= 0 then
					local var_498_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531122", "story_v_out_122531.awb") / 1000

					if var_498_14 + var_498_6 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_14 + var_498_6
					end

					if var_498_9.prefab_name ~= "" and arg_495_1.actors_[var_498_9.prefab_name] ~= nil then
						local var_498_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_9.prefab_name].transform, "story_v_out_122531", "122531122", "story_v_out_122531.awb")

						arg_495_1:RecordAudio("122531122", var_498_15)
						arg_495_1:RecordAudio("122531122", var_498_15)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_122531", "122531122", "story_v_out_122531.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_122531", "122531122", "story_v_out_122531.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_16 = math.max(var_498_7, arg_495_1.talkMaxDuration)

			if var_498_6 <= arg_495_1.time_ and arg_495_1.time_ < var_498_6 + var_498_16 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_6) / var_498_16

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_6 + var_498_16 and arg_495_1.time_ < var_498_6 + var_498_16 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play122531123 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 122531123
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play122531124(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1029ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1029ui_story == nil then
				arg_499_1.var_.characterEffect1029ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.200000002980232

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1029ui_story then
					local var_502_4 = Mathf.Lerp(0, 0.5, var_502_3)

					arg_499_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1029ui_story.fillRatio = var_502_4
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1029ui_story then
				local var_502_5 = 0.5

				arg_499_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1029ui_story.fillRatio = var_502_5
			end

			local var_502_6 = 0
			local var_502_7 = 0.375

			if var_502_6 < arg_499_1.time_ and arg_499_1.time_ <= var_502_6 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_8 = arg_499_1:FormatText(StoryNameCfg[7].name)

				arg_499_1.leftNameTxt_.text = var_502_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_9 = arg_499_1:GetWordFromCfg(122531123)
				local var_502_10 = arg_499_1:FormatText(var_502_9.content)

				arg_499_1.text_.text = var_502_10

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_11 = 15
				local var_502_12 = utf8.len(var_502_10)
				local var_502_13 = var_502_11 <= 0 and var_502_7 or var_502_7 * (var_502_12 / var_502_11)

				if var_502_13 > 0 and var_502_7 < var_502_13 then
					arg_499_1.talkMaxDuration = var_502_13

					if var_502_13 + var_502_6 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_13 + var_502_6
					end
				end

				arg_499_1.text_.text = var_502_10
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_14 = math.max(var_502_7, arg_499_1.talkMaxDuration)

			if var_502_6 <= arg_499_1.time_ and arg_499_1.time_ < var_502_6 + var_502_14 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_6) / var_502_14

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_6 + var_502_14 and arg_499_1.time_ < var_502_6 + var_502_14 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play122531124 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 122531124
		arg_503_1.duration_ = 15.033

		local var_503_0 = {
			ja = 15.033,
			ko = 5.466,
			zh = 5.466
		}
		local var_503_1 = manager.audio:GetLocalizationFlag()

		if var_503_0[var_503_1] ~= nil then
			arg_503_1.duration_ = var_503_0[var_503_1]
		end

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play122531125(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1029ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1029ui_story == nil then
				arg_503_1.var_.characterEffect1029ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.200000002980232

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1029ui_story then
					arg_503_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1029ui_story then
				arg_503_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_506_4 = 0
			local var_506_5 = 0.525

			if var_506_4 < arg_503_1.time_ and arg_503_1.time_ <= var_506_4 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_6 = arg_503_1:FormatText(StoryNameCfg[319].name)

				arg_503_1.leftNameTxt_.text = var_506_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_7 = arg_503_1:GetWordFromCfg(122531124)
				local var_506_8 = arg_503_1:FormatText(var_506_7.content)

				arg_503_1.text_.text = var_506_8

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_9 = 21
				local var_506_10 = utf8.len(var_506_8)
				local var_506_11 = var_506_9 <= 0 and var_506_5 or var_506_5 * (var_506_10 / var_506_9)

				if var_506_11 > 0 and var_506_5 < var_506_11 then
					arg_503_1.talkMaxDuration = var_506_11

					if var_506_11 + var_506_4 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_11 + var_506_4
					end
				end

				arg_503_1.text_.text = var_506_8
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531124", "story_v_out_122531.awb") ~= 0 then
					local var_506_12 = manager.audio:GetVoiceLength("story_v_out_122531", "122531124", "story_v_out_122531.awb") / 1000

					if var_506_12 + var_506_4 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_12 + var_506_4
					end

					if var_506_7.prefab_name ~= "" and arg_503_1.actors_[var_506_7.prefab_name] ~= nil then
						local var_506_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_7.prefab_name].transform, "story_v_out_122531", "122531124", "story_v_out_122531.awb")

						arg_503_1:RecordAudio("122531124", var_506_13)
						arg_503_1:RecordAudio("122531124", var_506_13)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_122531", "122531124", "story_v_out_122531.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_122531", "122531124", "story_v_out_122531.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_14 = math.max(var_506_5, arg_503_1.talkMaxDuration)

			if var_506_4 <= arg_503_1.time_ and arg_503_1.time_ < var_506_4 + var_506_14 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_4) / var_506_14

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_4 + var_506_14 and arg_503_1.time_ < var_506_4 + var_506_14 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play122531125 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 122531125
		arg_507_1.duration_ = 17.633

		local var_507_0 = {
			ja = 17.633,
			ko = 11.166,
			zh = 11.166
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
				arg_507_0:Play122531126(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 1.05

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_2 = arg_507_1:FormatText(StoryNameCfg[319].name)

				arg_507_1.leftNameTxt_.text = var_510_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_3 = arg_507_1:GetWordFromCfg(122531125)
				local var_510_4 = arg_507_1:FormatText(var_510_3.content)

				arg_507_1.text_.text = var_510_4

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_5 = 42
				local var_510_6 = utf8.len(var_510_4)
				local var_510_7 = var_510_5 <= 0 and var_510_1 or var_510_1 * (var_510_6 / var_510_5)

				if var_510_7 > 0 and var_510_1 < var_510_7 then
					arg_507_1.talkMaxDuration = var_510_7

					if var_510_7 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_7 + var_510_0
					end
				end

				arg_507_1.text_.text = var_510_4
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531125", "story_v_out_122531.awb") ~= 0 then
					local var_510_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531125", "story_v_out_122531.awb") / 1000

					if var_510_8 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_8 + var_510_0
					end

					if var_510_3.prefab_name ~= "" and arg_507_1.actors_[var_510_3.prefab_name] ~= nil then
						local var_510_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_3.prefab_name].transform, "story_v_out_122531", "122531125", "story_v_out_122531.awb")

						arg_507_1:RecordAudio("122531125", var_510_9)
						arg_507_1:RecordAudio("122531125", var_510_9)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_122531", "122531125", "story_v_out_122531.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_122531", "122531125", "story_v_out_122531.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_10 = math.max(var_510_1, arg_507_1.talkMaxDuration)

			if var_510_0 <= arg_507_1.time_ and arg_507_1.time_ < var_510_0 + var_510_10 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_0) / var_510_10

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_0 + var_510_10 and arg_507_1.time_ < var_510_0 + var_510_10 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play122531126 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 122531126
		arg_511_1.duration_ = 15

		local var_511_0 = {
			ja = 15,
			ko = 8.7,
			zh = 8.7
		}
		local var_511_1 = manager.audio:GetLocalizationFlag()

		if var_511_0[var_511_1] ~= nil then
			arg_511_1.duration_ = var_511_0[var_511_1]
		end

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play122531127(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action442")
			end

			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_514_2 = 0
			local var_514_3 = 1.125

			if var_514_2 < arg_511_1.time_ and arg_511_1.time_ <= var_514_2 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_4 = arg_511_1:FormatText(StoryNameCfg[319].name)

				arg_511_1.leftNameTxt_.text = var_514_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_5 = arg_511_1:GetWordFromCfg(122531126)
				local var_514_6 = arg_511_1:FormatText(var_514_5.content)

				arg_511_1.text_.text = var_514_6

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_7 = 45
				local var_514_8 = utf8.len(var_514_6)
				local var_514_9 = var_514_7 <= 0 and var_514_3 or var_514_3 * (var_514_8 / var_514_7)

				if var_514_9 > 0 and var_514_3 < var_514_9 then
					arg_511_1.talkMaxDuration = var_514_9

					if var_514_9 + var_514_2 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_9 + var_514_2
					end
				end

				arg_511_1.text_.text = var_514_6
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531126", "story_v_out_122531.awb") ~= 0 then
					local var_514_10 = manager.audio:GetVoiceLength("story_v_out_122531", "122531126", "story_v_out_122531.awb") / 1000

					if var_514_10 + var_514_2 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_10 + var_514_2
					end

					if var_514_5.prefab_name ~= "" and arg_511_1.actors_[var_514_5.prefab_name] ~= nil then
						local var_514_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_5.prefab_name].transform, "story_v_out_122531", "122531126", "story_v_out_122531.awb")

						arg_511_1:RecordAudio("122531126", var_514_11)
						arg_511_1:RecordAudio("122531126", var_514_11)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_122531", "122531126", "story_v_out_122531.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_122531", "122531126", "story_v_out_122531.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_12 = math.max(var_514_3, arg_511_1.talkMaxDuration)

			if var_514_2 <= arg_511_1.time_ and arg_511_1.time_ < var_514_2 + var_514_12 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_2) / var_514_12

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_2 + var_514_12 and arg_511_1.time_ < var_514_2 + var_514_12 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play122531127 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 122531127
		arg_515_1.duration_ = 7.9

		local var_515_0 = {
			ja = 7.9,
			ko = 4.466,
			zh = 4.466
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
				arg_515_0:Play122531128(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action424")
			end

			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_518_2 = 0
			local var_518_3 = 0.375

			if var_518_2 < arg_515_1.time_ and arg_515_1.time_ <= var_518_2 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_4 = arg_515_1:FormatText(StoryNameCfg[319].name)

				arg_515_1.leftNameTxt_.text = var_518_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_5 = arg_515_1:GetWordFromCfg(122531127)
				local var_518_6 = arg_515_1:FormatText(var_518_5.content)

				arg_515_1.text_.text = var_518_6

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_7 = 15
				local var_518_8 = utf8.len(var_518_6)
				local var_518_9 = var_518_7 <= 0 and var_518_3 or var_518_3 * (var_518_8 / var_518_7)

				if var_518_9 > 0 and var_518_3 < var_518_9 then
					arg_515_1.talkMaxDuration = var_518_9

					if var_518_9 + var_518_2 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_9 + var_518_2
					end
				end

				arg_515_1.text_.text = var_518_6
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531127", "story_v_out_122531.awb") ~= 0 then
					local var_518_10 = manager.audio:GetVoiceLength("story_v_out_122531", "122531127", "story_v_out_122531.awb") / 1000

					if var_518_10 + var_518_2 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_10 + var_518_2
					end

					if var_518_5.prefab_name ~= "" and arg_515_1.actors_[var_518_5.prefab_name] ~= nil then
						local var_518_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_5.prefab_name].transform, "story_v_out_122531", "122531127", "story_v_out_122531.awb")

						arg_515_1:RecordAudio("122531127", var_518_11)
						arg_515_1:RecordAudio("122531127", var_518_11)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_122531", "122531127", "story_v_out_122531.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_122531", "122531127", "story_v_out_122531.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_12 = math.max(var_518_3, arg_515_1.talkMaxDuration)

			if var_518_2 <= arg_515_1.time_ and arg_515_1.time_ < var_518_2 + var_518_12 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_2) / var_518_12

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_2 + var_518_12 and arg_515_1.time_ < var_518_2 + var_518_12 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play122531128 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 122531128
		arg_519_1.duration_ = 5.766

		local var_519_0 = {
			ja = 5.766,
			ko = 4.233,
			zh = 4.233
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
				arg_519_0:Play122531129(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 0.475

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_2 = arg_519_1:FormatText(StoryNameCfg[319].name)

				arg_519_1.leftNameTxt_.text = var_522_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_3 = arg_519_1:GetWordFromCfg(122531128)
				local var_522_4 = arg_519_1:FormatText(var_522_3.content)

				arg_519_1.text_.text = var_522_4

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_5 = 19
				local var_522_6 = utf8.len(var_522_4)
				local var_522_7 = var_522_5 <= 0 and var_522_1 or var_522_1 * (var_522_6 / var_522_5)

				if var_522_7 > 0 and var_522_1 < var_522_7 then
					arg_519_1.talkMaxDuration = var_522_7

					if var_522_7 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_7 + var_522_0
					end
				end

				arg_519_1.text_.text = var_522_4
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531128", "story_v_out_122531.awb") ~= 0 then
					local var_522_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531128", "story_v_out_122531.awb") / 1000

					if var_522_8 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_8 + var_522_0
					end

					if var_522_3.prefab_name ~= "" and arg_519_1.actors_[var_522_3.prefab_name] ~= nil then
						local var_522_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_3.prefab_name].transform, "story_v_out_122531", "122531128", "story_v_out_122531.awb")

						arg_519_1:RecordAudio("122531128", var_522_9)
						arg_519_1:RecordAudio("122531128", var_522_9)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_122531", "122531128", "story_v_out_122531.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_122531", "122531128", "story_v_out_122531.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_10 = math.max(var_522_1, arg_519_1.talkMaxDuration)

			if var_522_0 <= arg_519_1.time_ and arg_519_1.time_ < var_522_0 + var_522_10 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_0) / var_522_10

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_0 + var_522_10 and arg_519_1.time_ < var_522_0 + var_522_10 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play122531129 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 122531129
		arg_523_1.duration_ = 15.4

		local var_523_0 = {
			ja = 15.4,
			ko = 7.4,
			zh = 7.4
		}
		local var_523_1 = manager.audio:GetLocalizationFlag()

		if var_523_0[var_523_1] ~= nil then
			arg_523_1.duration_ = var_523_0[var_523_1]
		end

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play122531130(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = 0
			local var_526_1 = 0.95

			if var_526_0 < arg_523_1.time_ and arg_523_1.time_ <= var_526_0 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_2 = arg_523_1:FormatText(StoryNameCfg[319].name)

				arg_523_1.leftNameTxt_.text = var_526_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_3 = arg_523_1:GetWordFromCfg(122531129)
				local var_526_4 = arg_523_1:FormatText(var_526_3.content)

				arg_523_1.text_.text = var_526_4

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_5 = 38
				local var_526_6 = utf8.len(var_526_4)
				local var_526_7 = var_526_5 <= 0 and var_526_1 or var_526_1 * (var_526_6 / var_526_5)

				if var_526_7 > 0 and var_526_1 < var_526_7 then
					arg_523_1.talkMaxDuration = var_526_7

					if var_526_7 + var_526_0 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_7 + var_526_0
					end
				end

				arg_523_1.text_.text = var_526_4
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531129", "story_v_out_122531.awb") ~= 0 then
					local var_526_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531129", "story_v_out_122531.awb") / 1000

					if var_526_8 + var_526_0 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_8 + var_526_0
					end

					if var_526_3.prefab_name ~= "" and arg_523_1.actors_[var_526_3.prefab_name] ~= nil then
						local var_526_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_3.prefab_name].transform, "story_v_out_122531", "122531129", "story_v_out_122531.awb")

						arg_523_1:RecordAudio("122531129", var_526_9)
						arg_523_1:RecordAudio("122531129", var_526_9)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_out_122531", "122531129", "story_v_out_122531.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_out_122531", "122531129", "story_v_out_122531.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_10 = math.max(var_526_1, arg_523_1.talkMaxDuration)

			if var_526_0 <= arg_523_1.time_ and arg_523_1.time_ < var_526_0 + var_526_10 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_0) / var_526_10

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_0 + var_526_10 and arg_523_1.time_ < var_526_0 + var_526_10 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play122531130 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 122531130
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play122531131(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["1029ui_story"]
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 and arg_527_1.var_.characterEffect1029ui_story == nil then
				arg_527_1.var_.characterEffect1029ui_story = var_530_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_530_2 = 0.200000002980232

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2

				if arg_527_1.var_.characterEffect1029ui_story then
					local var_530_4 = Mathf.Lerp(0, 0.5, var_530_3)

					arg_527_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_527_1.var_.characterEffect1029ui_story.fillRatio = var_530_4
				end
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 and arg_527_1.var_.characterEffect1029ui_story then
				local var_530_5 = 0.5

				arg_527_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_527_1.var_.characterEffect1029ui_story.fillRatio = var_530_5
			end

			local var_530_6 = 0
			local var_530_7 = 0.375

			if var_530_6 < arg_527_1.time_ and arg_527_1.time_ <= var_530_6 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_8 = arg_527_1:FormatText(StoryNameCfg[7].name)

				arg_527_1.leftNameTxt_.text = var_530_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_9 = arg_527_1:GetWordFromCfg(122531130)
				local var_530_10 = arg_527_1:FormatText(var_530_9.content)

				arg_527_1.text_.text = var_530_10

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_11 = 15
				local var_530_12 = utf8.len(var_530_10)
				local var_530_13 = var_530_11 <= 0 and var_530_7 or var_530_7 * (var_530_12 / var_530_11)

				if var_530_13 > 0 and var_530_7 < var_530_13 then
					arg_527_1.talkMaxDuration = var_530_13

					if var_530_13 + var_530_6 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_13 + var_530_6
					end
				end

				arg_527_1.text_.text = var_530_10
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_14 = math.max(var_530_7, arg_527_1.talkMaxDuration)

			if var_530_6 <= arg_527_1.time_ and arg_527_1.time_ < var_530_6 + var_530_14 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_6) / var_530_14

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_6 + var_530_14 and arg_527_1.time_ < var_530_6 + var_530_14 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play122531131 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 122531131
		arg_531_1.duration_ = 10.066

		local var_531_0 = {
			ja = 10.066,
			ko = 6.333,
			zh = 6.333
		}
		local var_531_1 = manager.audio:GetLocalizationFlag()

		if var_531_0[var_531_1] ~= nil then
			arg_531_1.duration_ = var_531_0[var_531_1]
		end

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play122531132(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1029ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.characterEffect1029ui_story == nil then
				arg_531_1.var_.characterEffect1029ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.200000002980232

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1029ui_story then
					arg_531_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.characterEffect1029ui_story then
				arg_531_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_534_4 = 0
			local var_534_5 = 0.55

			if var_534_4 < arg_531_1.time_ and arg_531_1.time_ <= var_534_4 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_6 = arg_531_1:FormatText(StoryNameCfg[319].name)

				arg_531_1.leftNameTxt_.text = var_534_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_7 = arg_531_1:GetWordFromCfg(122531131)
				local var_534_8 = arg_531_1:FormatText(var_534_7.content)

				arg_531_1.text_.text = var_534_8

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_9 = 22
				local var_534_10 = utf8.len(var_534_8)
				local var_534_11 = var_534_9 <= 0 and var_534_5 or var_534_5 * (var_534_10 / var_534_9)

				if var_534_11 > 0 and var_534_5 < var_534_11 then
					arg_531_1.talkMaxDuration = var_534_11

					if var_534_11 + var_534_4 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_11 + var_534_4
					end
				end

				arg_531_1.text_.text = var_534_8
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531131", "story_v_out_122531.awb") ~= 0 then
					local var_534_12 = manager.audio:GetVoiceLength("story_v_out_122531", "122531131", "story_v_out_122531.awb") / 1000

					if var_534_12 + var_534_4 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_12 + var_534_4
					end

					if var_534_7.prefab_name ~= "" and arg_531_1.actors_[var_534_7.prefab_name] ~= nil then
						local var_534_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_7.prefab_name].transform, "story_v_out_122531", "122531131", "story_v_out_122531.awb")

						arg_531_1:RecordAudio("122531131", var_534_13)
						arg_531_1:RecordAudio("122531131", var_534_13)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_122531", "122531131", "story_v_out_122531.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_122531", "122531131", "story_v_out_122531.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_14 = math.max(var_534_5, arg_531_1.talkMaxDuration)

			if var_534_4 <= arg_531_1.time_ and arg_531_1.time_ < var_534_4 + var_534_14 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_4) / var_534_14

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_4 + var_534_14 and arg_531_1.time_ < var_534_4 + var_534_14 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play122531132 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 122531132
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play122531133(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1029ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.characterEffect1029ui_story == nil then
				arg_535_1.var_.characterEffect1029ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.200000002980232

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.characterEffect1029ui_story then
					local var_538_4 = Mathf.Lerp(0, 0.5, var_538_3)

					arg_535_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_535_1.var_.characterEffect1029ui_story.fillRatio = var_538_4
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.characterEffect1029ui_story then
				local var_538_5 = 0.5

				arg_535_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_535_1.var_.characterEffect1029ui_story.fillRatio = var_538_5
			end

			local var_538_6 = 0
			local var_538_7 = 0.2

			if var_538_6 < arg_535_1.time_ and arg_535_1.time_ <= var_538_6 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_8 = arg_535_1:FormatText(StoryNameCfg[7].name)

				arg_535_1.leftNameTxt_.text = var_538_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_9 = arg_535_1:GetWordFromCfg(122531132)
				local var_538_10 = arg_535_1:FormatText(var_538_9.content)

				arg_535_1.text_.text = var_538_10

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_11 = 8
				local var_538_12 = utf8.len(var_538_10)
				local var_538_13 = var_538_11 <= 0 and var_538_7 or var_538_7 * (var_538_12 / var_538_11)

				if var_538_13 > 0 and var_538_7 < var_538_13 then
					arg_535_1.talkMaxDuration = var_538_13

					if var_538_13 + var_538_6 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_13 + var_538_6
					end
				end

				arg_535_1.text_.text = var_538_10
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_14 = math.max(var_538_7, arg_535_1.talkMaxDuration)

			if var_538_6 <= arg_535_1.time_ and arg_535_1.time_ < var_538_6 + var_538_14 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_6) / var_538_14

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_6 + var_538_14 and arg_535_1.time_ < var_538_6 + var_538_14 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play122531133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 122531133
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play122531134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1029ui_story"].transform
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1.var_.moveOldPos1029ui_story = var_542_0.localPosition
			end

			local var_542_2 = 0.001

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2
				local var_542_4 = Vector3.New(0, 100, 0)

				var_542_0.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1029ui_story, var_542_4, var_542_3)

				local var_542_5 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_5.x, var_542_5.y, var_542_5.z)

				local var_542_6 = var_542_0.localEulerAngles

				var_542_6.z = 0
				var_542_6.x = 0
				var_542_0.localEulerAngles = var_542_6
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 then
				var_542_0.localPosition = Vector3.New(0, 100, 0)

				local var_542_7 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_7.x, var_542_7.y, var_542_7.z)

				local var_542_8 = var_542_0.localEulerAngles

				var_542_8.z = 0
				var_542_8.x = 0
				var_542_0.localEulerAngles = var_542_8
			end

			local var_542_9 = arg_539_1.actors_["1029ui_story"]
			local var_542_10 = 0

			if var_542_10 < arg_539_1.time_ and arg_539_1.time_ <= var_542_10 + arg_542_0 and arg_539_1.var_.characterEffect1029ui_story == nil then
				arg_539_1.var_.characterEffect1029ui_story = var_542_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_11 = 0.200000002980232

			if var_542_10 <= arg_539_1.time_ and arg_539_1.time_ < var_542_10 + var_542_11 then
				local var_542_12 = (arg_539_1.time_ - var_542_10) / var_542_11

				if arg_539_1.var_.characterEffect1029ui_story then
					local var_542_13 = Mathf.Lerp(0, 0.5, var_542_12)

					arg_539_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_539_1.var_.characterEffect1029ui_story.fillRatio = var_542_13
				end
			end

			if arg_539_1.time_ >= var_542_10 + var_542_11 and arg_539_1.time_ < var_542_10 + var_542_11 + arg_542_0 and arg_539_1.var_.characterEffect1029ui_story then
				local var_542_14 = 0.5

				arg_539_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_539_1.var_.characterEffect1029ui_story.fillRatio = var_542_14
			end

			local var_542_15 = 0
			local var_542_16 = 0.575

			if var_542_15 < arg_539_1.time_ and arg_539_1.time_ <= var_542_15 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_17 = arg_539_1:GetWordFromCfg(122531133)
				local var_542_18 = arg_539_1:FormatText(var_542_17.content)

				arg_539_1.text_.text = var_542_18

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_19 = 23
				local var_542_20 = utf8.len(var_542_18)
				local var_542_21 = var_542_19 <= 0 and var_542_16 or var_542_16 * (var_542_20 / var_542_19)

				if var_542_21 > 0 and var_542_16 < var_542_21 then
					arg_539_1.talkMaxDuration = var_542_21

					if var_542_21 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_21 + var_542_15
					end
				end

				arg_539_1.text_.text = var_542_18
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_22 = math.max(var_542_16, arg_539_1.talkMaxDuration)

			if var_542_15 <= arg_539_1.time_ and arg_539_1.time_ < var_542_15 + var_542_22 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_15) / var_542_22

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_15 + var_542_22 and arg_539_1.time_ < var_542_15 + var_542_22 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play122531134 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 122531134
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play122531135(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 1.525

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, false)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_2 = arg_543_1:GetWordFromCfg(122531134)
				local var_546_3 = arg_543_1:FormatText(var_546_2.content)

				arg_543_1.text_.text = var_546_3

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_4 = 61
				local var_546_5 = utf8.len(var_546_3)
				local var_546_6 = var_546_4 <= 0 and var_546_1 or var_546_1 * (var_546_5 / var_546_4)

				if var_546_6 > 0 and var_546_1 < var_546_6 then
					arg_543_1.talkMaxDuration = var_546_6

					if var_546_6 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_6 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_3
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_7 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_7 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_7

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_7 and arg_543_1.time_ < var_546_0 + var_546_7 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play122531135 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 122531135
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play122531136(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.55

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, false)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_2 = arg_547_1:GetWordFromCfg(122531135)
				local var_550_3 = arg_547_1:FormatText(var_550_2.content)

				arg_547_1.text_.text = var_550_3

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_4 = 22
				local var_550_5 = utf8.len(var_550_3)
				local var_550_6 = var_550_4 <= 0 and var_550_1 or var_550_1 * (var_550_5 / var_550_4)

				if var_550_6 > 0 and var_550_1 < var_550_6 then
					arg_547_1.talkMaxDuration = var_550_6

					if var_550_6 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_6 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_3
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_7 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_7 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_7

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_7 and arg_547_1.time_ < var_550_0 + var_550_7 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play122531136 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 122531136
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play122531137(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.25

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_2 = arg_551_1:FormatText(StoryNameCfg[7].name)

				arg_551_1.leftNameTxt_.text = var_554_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_3 = arg_551_1:GetWordFromCfg(122531136)
				local var_554_4 = arg_551_1:FormatText(var_554_3.content)

				arg_551_1.text_.text = var_554_4

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_5 = 10
				local var_554_6 = utf8.len(var_554_4)
				local var_554_7 = var_554_5 <= 0 and var_554_1 or var_554_1 * (var_554_6 / var_554_5)

				if var_554_7 > 0 and var_554_1 < var_554_7 then
					arg_551_1.talkMaxDuration = var_554_7

					if var_554_7 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_7 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_4
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_8 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_8 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_8

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_8 and arg_551_1.time_ < var_554_0 + var_554_8 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play122531137 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 122531137
		arg_555_1.duration_ = 5.866

		local var_555_0 = {
			ja = 5.866,
			ko = 2.466,
			zh = 2.466
		}
		local var_555_1 = manager.audio:GetLocalizationFlag()

		if var_555_0[var_555_1] ~= nil then
			arg_555_1.duration_ = var_555_0[var_555_1]
		end

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play122531138(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1029ui_story"].transform
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 then
				arg_555_1.var_.moveOldPos1029ui_story = var_558_0.localPosition
			end

			local var_558_2 = 0.001

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2
				local var_558_4 = Vector3.New(0, -1.09, -6.2)

				var_558_0.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos1029ui_story, var_558_4, var_558_3)

				local var_558_5 = manager.ui.mainCamera.transform.position - var_558_0.position

				var_558_0.forward = Vector3.New(var_558_5.x, var_558_5.y, var_558_5.z)

				local var_558_6 = var_558_0.localEulerAngles

				var_558_6.z = 0
				var_558_6.x = 0
				var_558_0.localEulerAngles = var_558_6
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 then
				var_558_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_558_7 = manager.ui.mainCamera.transform.position - var_558_0.position

				var_558_0.forward = Vector3.New(var_558_7.x, var_558_7.y, var_558_7.z)

				local var_558_8 = var_558_0.localEulerAngles

				var_558_8.z = 0
				var_558_8.x = 0
				var_558_0.localEulerAngles = var_558_8
			end

			local var_558_9 = arg_555_1.actors_["1029ui_story"]
			local var_558_10 = 0

			if var_558_10 < arg_555_1.time_ and arg_555_1.time_ <= var_558_10 + arg_558_0 and arg_555_1.var_.characterEffect1029ui_story == nil then
				arg_555_1.var_.characterEffect1029ui_story = var_558_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_11 = 0.200000002980232

			if var_558_10 <= arg_555_1.time_ and arg_555_1.time_ < var_558_10 + var_558_11 then
				local var_558_12 = (arg_555_1.time_ - var_558_10) / var_558_11

				if arg_555_1.var_.characterEffect1029ui_story then
					arg_555_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_555_1.time_ >= var_558_10 + var_558_11 and arg_555_1.time_ < var_558_10 + var_558_11 + arg_558_0 and arg_555_1.var_.characterEffect1029ui_story then
				arg_555_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_558_13 = 0

			if var_558_13 < arg_555_1.time_ and arg_555_1.time_ <= var_558_13 + arg_558_0 then
				arg_555_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_2")
			end

			local var_558_14 = 0

			if var_558_14 < arg_555_1.time_ and arg_555_1.time_ <= var_558_14 + arg_558_0 then
				arg_555_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_558_15 = 0
			local var_558_16 = 0.35

			if var_558_15 < arg_555_1.time_ and arg_555_1.time_ <= var_558_15 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_17 = arg_555_1:FormatText(StoryNameCfg[319].name)

				arg_555_1.leftNameTxt_.text = var_558_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_18 = arg_555_1:GetWordFromCfg(122531137)
				local var_558_19 = arg_555_1:FormatText(var_558_18.content)

				arg_555_1.text_.text = var_558_19

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_20 = 14
				local var_558_21 = utf8.len(var_558_19)
				local var_558_22 = var_558_20 <= 0 and var_558_16 or var_558_16 * (var_558_21 / var_558_20)

				if var_558_22 > 0 and var_558_16 < var_558_22 then
					arg_555_1.talkMaxDuration = var_558_22

					if var_558_22 + var_558_15 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_22 + var_558_15
					end
				end

				arg_555_1.text_.text = var_558_19
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531137", "story_v_out_122531.awb") ~= 0 then
					local var_558_23 = manager.audio:GetVoiceLength("story_v_out_122531", "122531137", "story_v_out_122531.awb") / 1000

					if var_558_23 + var_558_15 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_23 + var_558_15
					end

					if var_558_18.prefab_name ~= "" and arg_555_1.actors_[var_558_18.prefab_name] ~= nil then
						local var_558_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_18.prefab_name].transform, "story_v_out_122531", "122531137", "story_v_out_122531.awb")

						arg_555_1:RecordAudio("122531137", var_558_24)
						arg_555_1:RecordAudio("122531137", var_558_24)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_122531", "122531137", "story_v_out_122531.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_122531", "122531137", "story_v_out_122531.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_25 = math.max(var_558_16, arg_555_1.talkMaxDuration)

			if var_558_15 <= arg_555_1.time_ and arg_555_1.time_ < var_558_15 + var_558_25 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_15) / var_558_25

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_15 + var_558_25 and arg_555_1.time_ < var_558_15 + var_558_25 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play122531138 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 122531138
		arg_559_1.duration_ = 14.633

		local var_559_0 = {
			ja = 14.633,
			ko = 10.7,
			zh = 10.7
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
				arg_559_0:Play122531139(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 1.3

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_2 = arg_559_1:FormatText(StoryNameCfg[319].name)

				arg_559_1.leftNameTxt_.text = var_562_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_3 = arg_559_1:GetWordFromCfg(122531138)
				local var_562_4 = arg_559_1:FormatText(var_562_3.content)

				arg_559_1.text_.text = var_562_4

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_5 = 52
				local var_562_6 = utf8.len(var_562_4)
				local var_562_7 = var_562_5 <= 0 and var_562_1 or var_562_1 * (var_562_6 / var_562_5)

				if var_562_7 > 0 and var_562_1 < var_562_7 then
					arg_559_1.talkMaxDuration = var_562_7

					if var_562_7 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_7 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_4
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531138", "story_v_out_122531.awb") ~= 0 then
					local var_562_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531138", "story_v_out_122531.awb") / 1000

					if var_562_8 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_8 + var_562_0
					end

					if var_562_3.prefab_name ~= "" and arg_559_1.actors_[var_562_3.prefab_name] ~= nil then
						local var_562_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_3.prefab_name].transform, "story_v_out_122531", "122531138", "story_v_out_122531.awb")

						arg_559_1:RecordAudio("122531138", var_562_9)
						arg_559_1:RecordAudio("122531138", var_562_9)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_out_122531", "122531138", "story_v_out_122531.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_out_122531", "122531138", "story_v_out_122531.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_10 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_10 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_10

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_10 and arg_559_1.time_ < var_562_0 + var_562_10 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play122531139 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 122531139
		arg_563_1.duration_ = 9.433

		local var_563_0 = {
			ja = 9.433,
			ko = 7.233,
			zh = 7.233
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play122531140(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 0.825

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_2 = arg_563_1:FormatText(StoryNameCfg[319].name)

				arg_563_1.leftNameTxt_.text = var_566_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_3 = arg_563_1:GetWordFromCfg(122531139)
				local var_566_4 = arg_563_1:FormatText(var_566_3.content)

				arg_563_1.text_.text = var_566_4

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_5 = 33
				local var_566_6 = utf8.len(var_566_4)
				local var_566_7 = var_566_5 <= 0 and var_566_1 or var_566_1 * (var_566_6 / var_566_5)

				if var_566_7 > 0 and var_566_1 < var_566_7 then
					arg_563_1.talkMaxDuration = var_566_7

					if var_566_7 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_7 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_4
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531139", "story_v_out_122531.awb") ~= 0 then
					local var_566_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531139", "story_v_out_122531.awb") / 1000

					if var_566_8 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_8 + var_566_0
					end

					if var_566_3.prefab_name ~= "" and arg_563_1.actors_[var_566_3.prefab_name] ~= nil then
						local var_566_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_3.prefab_name].transform, "story_v_out_122531", "122531139", "story_v_out_122531.awb")

						arg_563_1:RecordAudio("122531139", var_566_9)
						arg_563_1:RecordAudio("122531139", var_566_9)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_out_122531", "122531139", "story_v_out_122531.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_out_122531", "122531139", "story_v_out_122531.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_10 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_10 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_10

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_10 and arg_563_1.time_ < var_566_0 + var_566_10 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play122531140 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 122531140
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play122531141(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["1029ui_story"]
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 and arg_567_1.var_.characterEffect1029ui_story == nil then
				arg_567_1.var_.characterEffect1029ui_story = var_570_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_570_2 = 0.200000002980232

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2

				if arg_567_1.var_.characterEffect1029ui_story then
					local var_570_4 = Mathf.Lerp(0, 0.5, var_570_3)

					arg_567_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_567_1.var_.characterEffect1029ui_story.fillRatio = var_570_4
				end
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 and arg_567_1.var_.characterEffect1029ui_story then
				local var_570_5 = 0.5

				arg_567_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_567_1.var_.characterEffect1029ui_story.fillRatio = var_570_5
			end

			local var_570_6 = 0
			local var_570_7 = 0.375

			if var_570_6 < arg_567_1.time_ and arg_567_1.time_ <= var_570_6 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_8 = arg_567_1:FormatText(StoryNameCfg[7].name)

				arg_567_1.leftNameTxt_.text = var_570_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_9 = arg_567_1:GetWordFromCfg(122531140)
				local var_570_10 = arg_567_1:FormatText(var_570_9.content)

				arg_567_1.text_.text = var_570_10

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_11 = 15
				local var_570_12 = utf8.len(var_570_10)
				local var_570_13 = var_570_11 <= 0 and var_570_7 or var_570_7 * (var_570_12 / var_570_11)

				if var_570_13 > 0 and var_570_7 < var_570_13 then
					arg_567_1.talkMaxDuration = var_570_13

					if var_570_13 + var_570_6 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_13 + var_570_6
					end
				end

				arg_567_1.text_.text = var_570_10
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_14 = math.max(var_570_7, arg_567_1.talkMaxDuration)

			if var_570_6 <= arg_567_1.time_ and arg_567_1.time_ < var_570_6 + var_570_14 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_6) / var_570_14

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_6 + var_570_14 and arg_567_1.time_ < var_570_6 + var_570_14 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play122531141 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 122531141
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play122531142(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = 0
			local var_574_1 = 0.525

			if var_574_0 < arg_571_1.time_ and arg_571_1.time_ <= var_574_0 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_2 = arg_571_1:FormatText(StoryNameCfg[7].name)

				arg_571_1.leftNameTxt_.text = var_574_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_3 = arg_571_1:GetWordFromCfg(122531141)
				local var_574_4 = arg_571_1:FormatText(var_574_3.content)

				arg_571_1.text_.text = var_574_4

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_5 = 21
				local var_574_6 = utf8.len(var_574_4)
				local var_574_7 = var_574_5 <= 0 and var_574_1 or var_574_1 * (var_574_6 / var_574_5)

				if var_574_7 > 0 and var_574_1 < var_574_7 then
					arg_571_1.talkMaxDuration = var_574_7

					if var_574_7 + var_574_0 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_7 + var_574_0
					end
				end

				arg_571_1.text_.text = var_574_4
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_8 = math.max(var_574_1, arg_571_1.talkMaxDuration)

			if var_574_0 <= arg_571_1.time_ and arg_571_1.time_ < var_574_0 + var_574_8 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_0) / var_574_8

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_0 + var_574_8 and arg_571_1.time_ < var_574_0 + var_574_8 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play122531142 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 122531142
		arg_575_1.duration_ = 4.233

		local var_575_0 = {
			ja = 4.233,
			ko = 2.6,
			zh = 2.6
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
				arg_575_0:Play122531143(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1029ui_story"]
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 and arg_575_1.var_.characterEffect1029ui_story == nil then
				arg_575_1.var_.characterEffect1029ui_story = var_578_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_2 = 0.200000002980232

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2

				if arg_575_1.var_.characterEffect1029ui_story then
					arg_575_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 and arg_575_1.var_.characterEffect1029ui_story then
				arg_575_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_578_4 = 0

			if var_578_4 < arg_575_1.time_ and arg_575_1.time_ <= var_578_4 + arg_578_0 then
				arg_575_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_578_5 = 0

			if var_578_5 < arg_575_1.time_ and arg_575_1.time_ <= var_578_5 + arg_578_0 then
				arg_575_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_578_6 = 0
			local var_578_7 = 0.175

			if var_578_6 < arg_575_1.time_ and arg_575_1.time_ <= var_578_6 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_8 = arg_575_1:FormatText(StoryNameCfg[319].name)

				arg_575_1.leftNameTxt_.text = var_578_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_9 = arg_575_1:GetWordFromCfg(122531142)
				local var_578_10 = arg_575_1:FormatText(var_578_9.content)

				arg_575_1.text_.text = var_578_10

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_11 = 7
				local var_578_12 = utf8.len(var_578_10)
				local var_578_13 = var_578_11 <= 0 and var_578_7 or var_578_7 * (var_578_12 / var_578_11)

				if var_578_13 > 0 and var_578_7 < var_578_13 then
					arg_575_1.talkMaxDuration = var_578_13

					if var_578_13 + var_578_6 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_13 + var_578_6
					end
				end

				arg_575_1.text_.text = var_578_10
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531142", "story_v_out_122531.awb") ~= 0 then
					local var_578_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531142", "story_v_out_122531.awb") / 1000

					if var_578_14 + var_578_6 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_14 + var_578_6
					end

					if var_578_9.prefab_name ~= "" and arg_575_1.actors_[var_578_9.prefab_name] ~= nil then
						local var_578_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_575_1.actors_[var_578_9.prefab_name].transform, "story_v_out_122531", "122531142", "story_v_out_122531.awb")

						arg_575_1:RecordAudio("122531142", var_578_15)
						arg_575_1:RecordAudio("122531142", var_578_15)
					else
						arg_575_1:AudioAction("play", "voice", "story_v_out_122531", "122531142", "story_v_out_122531.awb")
					end

					arg_575_1:RecordHistoryTalkVoice("story_v_out_122531", "122531142", "story_v_out_122531.awb")
				end

				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_16 = math.max(var_578_7, arg_575_1.talkMaxDuration)

			if var_578_6 <= arg_575_1.time_ and arg_575_1.time_ < var_578_6 + var_578_16 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_6) / var_578_16

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_6 + var_578_16 and arg_575_1.time_ < var_578_6 + var_578_16 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play122531143 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 122531143
		arg_579_1.duration_ = 5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play122531144(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1029ui_story"]
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 and arg_579_1.var_.characterEffect1029ui_story == nil then
				arg_579_1.var_.characterEffect1029ui_story = var_582_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_2 = 0.200000002980232

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2

				if arg_579_1.var_.characterEffect1029ui_story then
					local var_582_4 = Mathf.Lerp(0, 0.5, var_582_3)

					arg_579_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_579_1.var_.characterEffect1029ui_story.fillRatio = var_582_4
				end
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 and arg_579_1.var_.characterEffect1029ui_story then
				local var_582_5 = 0.5

				arg_579_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_579_1.var_.characterEffect1029ui_story.fillRatio = var_582_5
			end

			local var_582_6 = 0
			local var_582_7 = 0.525

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

				local var_582_9 = arg_579_1:GetWordFromCfg(122531143)
				local var_582_10 = arg_579_1:FormatText(var_582_9.content)

				arg_579_1.text_.text = var_582_10

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_11 = 21
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
	Play122531144 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 122531144
		arg_583_1.duration_ = 15.966

		local var_583_0 = {
			ja = 15.966,
			ko = 10.1,
			zh = 10.1
		}
		local var_583_1 = manager.audio:GetLocalizationFlag()

		if var_583_0[var_583_1] ~= nil then
			arg_583_1.duration_ = var_583_0[var_583_1]
		end

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play122531145(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1029ui_story"]
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 and arg_583_1.var_.characterEffect1029ui_story == nil then
				arg_583_1.var_.characterEffect1029ui_story = var_586_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_2 = 0.200000002980232

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2

				if arg_583_1.var_.characterEffect1029ui_story then
					arg_583_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 and arg_583_1.var_.characterEffect1029ui_story then
				arg_583_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_586_4 = 0

			if var_586_4 < arg_583_1.time_ and arg_583_1.time_ <= var_586_4 + arg_586_0 then
				arg_583_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_586_5 = 0

			if var_586_5 < arg_583_1.time_ and arg_583_1.time_ <= var_586_5 + arg_586_0 then
				arg_583_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_586_6 = 0
			local var_586_7 = 1.125

			if var_586_6 < arg_583_1.time_ and arg_583_1.time_ <= var_586_6 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_8 = arg_583_1:FormatText(StoryNameCfg[319].name)

				arg_583_1.leftNameTxt_.text = var_586_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_9 = arg_583_1:GetWordFromCfg(122531144)
				local var_586_10 = arg_583_1:FormatText(var_586_9.content)

				arg_583_1.text_.text = var_586_10

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_11 = 45
				local var_586_12 = utf8.len(var_586_10)
				local var_586_13 = var_586_11 <= 0 and var_586_7 or var_586_7 * (var_586_12 / var_586_11)

				if var_586_13 > 0 and var_586_7 < var_586_13 then
					arg_583_1.talkMaxDuration = var_586_13

					if var_586_13 + var_586_6 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_13 + var_586_6
					end
				end

				arg_583_1.text_.text = var_586_10
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531144", "story_v_out_122531.awb") ~= 0 then
					local var_586_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531144", "story_v_out_122531.awb") / 1000

					if var_586_14 + var_586_6 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_14 + var_586_6
					end

					if var_586_9.prefab_name ~= "" and arg_583_1.actors_[var_586_9.prefab_name] ~= nil then
						local var_586_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_9.prefab_name].transform, "story_v_out_122531", "122531144", "story_v_out_122531.awb")

						arg_583_1:RecordAudio("122531144", var_586_15)
						arg_583_1:RecordAudio("122531144", var_586_15)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_out_122531", "122531144", "story_v_out_122531.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_out_122531", "122531144", "story_v_out_122531.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_16 = math.max(var_586_7, arg_583_1.talkMaxDuration)

			if var_586_6 <= arg_583_1.time_ and arg_583_1.time_ < var_586_6 + var_586_16 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_6) / var_586_16

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_6 + var_586_16 and arg_583_1.time_ < var_586_6 + var_586_16 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play122531145 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 122531145
		arg_587_1.duration_ = 10.933

		local var_587_0 = {
			ja = 10.933,
			ko = 9.833,
			zh = 9.833
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
				arg_587_0:Play122531146(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = 0
			local var_590_1 = 1.175

			if var_590_0 < arg_587_1.time_ and arg_587_1.time_ <= var_590_0 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_2 = arg_587_1:FormatText(StoryNameCfg[319].name)

				arg_587_1.leftNameTxt_.text = var_590_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_3 = arg_587_1:GetWordFromCfg(122531145)
				local var_590_4 = arg_587_1:FormatText(var_590_3.content)

				arg_587_1.text_.text = var_590_4

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_5 = 47
				local var_590_6 = utf8.len(var_590_4)
				local var_590_7 = var_590_5 <= 0 and var_590_1 or var_590_1 * (var_590_6 / var_590_5)

				if var_590_7 > 0 and var_590_1 < var_590_7 then
					arg_587_1.talkMaxDuration = var_590_7

					if var_590_7 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_7 + var_590_0
					end
				end

				arg_587_1.text_.text = var_590_4
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531145", "story_v_out_122531.awb") ~= 0 then
					local var_590_8 = manager.audio:GetVoiceLength("story_v_out_122531", "122531145", "story_v_out_122531.awb") / 1000

					if var_590_8 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_8 + var_590_0
					end

					if var_590_3.prefab_name ~= "" and arg_587_1.actors_[var_590_3.prefab_name] ~= nil then
						local var_590_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_3.prefab_name].transform, "story_v_out_122531", "122531145", "story_v_out_122531.awb")

						arg_587_1:RecordAudio("122531145", var_590_9)
						arg_587_1:RecordAudio("122531145", var_590_9)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_out_122531", "122531145", "story_v_out_122531.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_out_122531", "122531145", "story_v_out_122531.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_10 = math.max(var_590_1, arg_587_1.talkMaxDuration)

			if var_590_0 <= arg_587_1.time_ and arg_587_1.time_ < var_590_0 + var_590_10 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_0) / var_590_10

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_0 + var_590_10 and arg_587_1.time_ < var_590_0 + var_590_10 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play122531146 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 122531146
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play122531147(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["1029ui_story"]
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 and arg_591_1.var_.characterEffect1029ui_story == nil then
				arg_591_1.var_.characterEffect1029ui_story = var_594_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_2 = 0.200000002980232

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2

				if arg_591_1.var_.characterEffect1029ui_story then
					local var_594_4 = Mathf.Lerp(0, 0.5, var_594_3)

					arg_591_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_591_1.var_.characterEffect1029ui_story.fillRatio = var_594_4
				end
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 and arg_591_1.var_.characterEffect1029ui_story then
				local var_594_5 = 0.5

				arg_591_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_591_1.var_.characterEffect1029ui_story.fillRatio = var_594_5
			end

			local var_594_6 = 0
			local var_594_7 = 0.425

			if var_594_6 < arg_591_1.time_ and arg_591_1.time_ <= var_594_6 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_8 = arg_591_1:FormatText(StoryNameCfg[7].name)

				arg_591_1.leftNameTxt_.text = var_594_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_9 = arg_591_1:GetWordFromCfg(122531146)
				local var_594_10 = arg_591_1:FormatText(var_594_9.content)

				arg_591_1.text_.text = var_594_10

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_11 = 17
				local var_594_12 = utf8.len(var_594_10)
				local var_594_13 = var_594_11 <= 0 and var_594_7 or var_594_7 * (var_594_12 / var_594_11)

				if var_594_13 > 0 and var_594_7 < var_594_13 then
					arg_591_1.talkMaxDuration = var_594_13

					if var_594_13 + var_594_6 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_13 + var_594_6
					end
				end

				arg_591_1.text_.text = var_594_10
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_14 = math.max(var_594_7, arg_591_1.talkMaxDuration)

			if var_594_6 <= arg_591_1.time_ and arg_591_1.time_ < var_594_6 + var_594_14 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_6) / var_594_14

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_6 + var_594_14 and arg_591_1.time_ < var_594_6 + var_594_14 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play122531147 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 122531147
		arg_595_1.duration_ = 8.833

		local var_595_0 = {
			ja = 8.833,
			ko = 6.833,
			zh = 6.833
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
				arg_595_0:Play122531148(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1029ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect1029ui_story == nil then
				arg_595_1.var_.characterEffect1029ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.200000002980232

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1029ui_story then
					arg_595_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect1029ui_story then
				arg_595_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_598_4 = 0
			local var_598_5 = 0.75

			if var_598_4 < arg_595_1.time_ and arg_595_1.time_ <= var_598_4 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_6 = arg_595_1:FormatText(StoryNameCfg[319].name)

				arg_595_1.leftNameTxt_.text = var_598_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_7 = arg_595_1:GetWordFromCfg(122531147)
				local var_598_8 = arg_595_1:FormatText(var_598_7.content)

				arg_595_1.text_.text = var_598_8

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_9 = 30
				local var_598_10 = utf8.len(var_598_8)
				local var_598_11 = var_598_9 <= 0 and var_598_5 or var_598_5 * (var_598_10 / var_598_9)

				if var_598_11 > 0 and var_598_5 < var_598_11 then
					arg_595_1.talkMaxDuration = var_598_11

					if var_598_11 + var_598_4 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_11 + var_598_4
					end
				end

				arg_595_1.text_.text = var_598_8
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531147", "story_v_out_122531.awb") ~= 0 then
					local var_598_12 = manager.audio:GetVoiceLength("story_v_out_122531", "122531147", "story_v_out_122531.awb") / 1000

					if var_598_12 + var_598_4 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_12 + var_598_4
					end

					if var_598_7.prefab_name ~= "" and arg_595_1.actors_[var_598_7.prefab_name] ~= nil then
						local var_598_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_7.prefab_name].transform, "story_v_out_122531", "122531147", "story_v_out_122531.awb")

						arg_595_1:RecordAudio("122531147", var_598_13)
						arg_595_1:RecordAudio("122531147", var_598_13)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_out_122531", "122531147", "story_v_out_122531.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_out_122531", "122531147", "story_v_out_122531.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_14 = math.max(var_598_5, arg_595_1.talkMaxDuration)

			if var_598_4 <= arg_595_1.time_ and arg_595_1.time_ < var_598_4 + var_598_14 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_4) / var_598_14

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_4 + var_598_14 and arg_595_1.time_ < var_598_4 + var_598_14 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play122531148 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 122531148
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play122531149(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1029ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and arg_599_1.var_.characterEffect1029ui_story == nil then
				arg_599_1.var_.characterEffect1029ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.200000002980232

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect1029ui_story then
					local var_602_4 = Mathf.Lerp(0, 0.5, var_602_3)

					arg_599_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_599_1.var_.characterEffect1029ui_story.fillRatio = var_602_4
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and arg_599_1.var_.characterEffect1029ui_story then
				local var_602_5 = 0.5

				arg_599_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_599_1.var_.characterEffect1029ui_story.fillRatio = var_602_5
			end

			local var_602_6 = 0
			local var_602_7 = 0.9

			if var_602_6 < arg_599_1.time_ and arg_599_1.time_ <= var_602_6 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_8 = arg_599_1:FormatText(StoryNameCfg[7].name)

				arg_599_1.leftNameTxt_.text = var_602_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_9 = arg_599_1:GetWordFromCfg(122531148)
				local var_602_10 = arg_599_1:FormatText(var_602_9.content)

				arg_599_1.text_.text = var_602_10

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_11 = 36
				local var_602_12 = utf8.len(var_602_10)
				local var_602_13 = var_602_11 <= 0 and var_602_7 or var_602_7 * (var_602_12 / var_602_11)

				if var_602_13 > 0 and var_602_7 < var_602_13 then
					arg_599_1.talkMaxDuration = var_602_13

					if var_602_13 + var_602_6 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_13 + var_602_6
					end
				end

				arg_599_1.text_.text = var_602_10
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_14 = math.max(var_602_7, arg_599_1.talkMaxDuration)

			if var_602_6 <= arg_599_1.time_ and arg_599_1.time_ < var_602_6 + var_602_14 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_6) / var_602_14

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_6 + var_602_14 and arg_599_1.time_ < var_602_6 + var_602_14 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play122531149 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 122531149
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play122531150(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.5

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[7].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(122531149)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 20
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
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_8 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_8 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_8

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_8 and arg_603_1.time_ < var_606_0 + var_606_8 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play122531150 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 122531150
		arg_607_1.duration_ = 15.633

		local var_607_0 = {
			ja = 15.633,
			ko = 7.633,
			zh = 7.633
		}
		local var_607_1 = manager.audio:GetLocalizationFlag()

		if var_607_0[var_607_1] ~= nil then
			arg_607_1.duration_ = var_607_0[var_607_1]
		end

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play122531151(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1029ui_story"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and arg_607_1.var_.characterEffect1029ui_story == nil then
				arg_607_1.var_.characterEffect1029ui_story = var_610_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_2 = 0.200000002980232

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.characterEffect1029ui_story then
					arg_607_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and arg_607_1.var_.characterEffect1029ui_story then
				arg_607_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_610_4 = 0

			if var_610_4 < arg_607_1.time_ and arg_607_1.time_ <= var_610_4 + arg_610_0 then
				arg_607_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action445")
			end

			local var_610_5 = 0

			if var_610_5 < arg_607_1.time_ and arg_607_1.time_ <= var_610_5 + arg_610_0 then
				arg_607_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_610_6 = 0
			local var_610_7 = 0.875

			if var_610_6 < arg_607_1.time_ and arg_607_1.time_ <= var_610_6 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_8 = arg_607_1:FormatText(StoryNameCfg[319].name)

				arg_607_1.leftNameTxt_.text = var_610_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_9 = arg_607_1:GetWordFromCfg(122531150)
				local var_610_10 = arg_607_1:FormatText(var_610_9.content)

				arg_607_1.text_.text = var_610_10

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_11 = 35
				local var_610_12 = utf8.len(var_610_10)
				local var_610_13 = var_610_11 <= 0 and var_610_7 or var_610_7 * (var_610_12 / var_610_11)

				if var_610_13 > 0 and var_610_7 < var_610_13 then
					arg_607_1.talkMaxDuration = var_610_13

					if var_610_13 + var_610_6 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_13 + var_610_6
					end
				end

				arg_607_1.text_.text = var_610_10
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531150", "story_v_out_122531.awb") ~= 0 then
					local var_610_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531150", "story_v_out_122531.awb") / 1000

					if var_610_14 + var_610_6 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_14 + var_610_6
					end

					if var_610_9.prefab_name ~= "" and arg_607_1.actors_[var_610_9.prefab_name] ~= nil then
						local var_610_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_9.prefab_name].transform, "story_v_out_122531", "122531150", "story_v_out_122531.awb")

						arg_607_1:RecordAudio("122531150", var_610_15)
						arg_607_1:RecordAudio("122531150", var_610_15)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_122531", "122531150", "story_v_out_122531.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_122531", "122531150", "story_v_out_122531.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_16 = math.max(var_610_7, arg_607_1.talkMaxDuration)

			if var_610_6 <= arg_607_1.time_ and arg_607_1.time_ < var_610_6 + var_610_16 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_6) / var_610_16

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_6 + var_610_16 and arg_607_1.time_ < var_610_6 + var_610_16 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play122531151 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 122531151
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play122531152(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1029ui_story"].transform
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 then
				arg_611_1.var_.moveOldPos1029ui_story = var_614_0.localPosition
			end

			local var_614_2 = 0.001

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2
				local var_614_4 = Vector3.New(0, 100, 0)

				var_614_0.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1029ui_story, var_614_4, var_614_3)

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

			local var_614_9 = arg_611_1.actors_["1029ui_story"]
			local var_614_10 = 0

			if var_614_10 < arg_611_1.time_ and arg_611_1.time_ <= var_614_10 + arg_614_0 and arg_611_1.var_.characterEffect1029ui_story == nil then
				arg_611_1.var_.characterEffect1029ui_story = var_614_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_11 = 0.200000002980232

			if var_614_10 <= arg_611_1.time_ and arg_611_1.time_ < var_614_10 + var_614_11 then
				local var_614_12 = (arg_611_1.time_ - var_614_10) / var_614_11

				if arg_611_1.var_.characterEffect1029ui_story then
					local var_614_13 = Mathf.Lerp(0, 0.5, var_614_12)

					arg_611_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_611_1.var_.characterEffect1029ui_story.fillRatio = var_614_13
				end
			end

			if arg_611_1.time_ >= var_614_10 + var_614_11 and arg_611_1.time_ < var_614_10 + var_614_11 + arg_614_0 and arg_611_1.var_.characterEffect1029ui_story then
				local var_614_14 = 0.5

				arg_611_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_611_1.var_.characterEffect1029ui_story.fillRatio = var_614_14
			end

			local var_614_15 = 0
			local var_614_16 = 0.7

			if var_614_15 < arg_611_1.time_ and arg_611_1.time_ <= var_614_15 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_17 = arg_611_1:GetWordFromCfg(122531151)
				local var_614_18 = arg_611_1:FormatText(var_614_17.content)

				arg_611_1.text_.text = var_614_18

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_19 = 28
				local var_614_20 = utf8.len(var_614_18)
				local var_614_21 = var_614_19 <= 0 and var_614_16 or var_614_16 * (var_614_20 / var_614_19)

				if var_614_21 > 0 and var_614_16 < var_614_21 then
					arg_611_1.talkMaxDuration = var_614_21

					if var_614_21 + var_614_15 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_21 + var_614_15
					end
				end

				arg_611_1.text_.text = var_614_18
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_22 = math.max(var_614_16, arg_611_1.talkMaxDuration)

			if var_614_15 <= arg_611_1.time_ and arg_611_1.time_ < var_614_15 + var_614_22 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_15) / var_614_22

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_15 + var_614_22 and arg_611_1.time_ < var_614_15 + var_614_22 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play122531152 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 122531152
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play122531153(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 2.125

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_2 = arg_615_1:GetWordFromCfg(122531152)
				local var_618_3 = arg_615_1:FormatText(var_618_2.content)

				arg_615_1.text_.text = var_618_3

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_4 = 85
				local var_618_5 = utf8.len(var_618_3)
				local var_618_6 = var_618_4 <= 0 and var_618_1 or var_618_1 * (var_618_5 / var_618_4)

				if var_618_6 > 0 and var_618_1 < var_618_6 then
					arg_615_1.talkMaxDuration = var_618_6

					if var_618_6 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_6 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_3
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_7 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_0 <= arg_615_1.time_ and arg_615_1.time_ < var_618_0 + var_618_7 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_0) / var_618_7

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_0 + var_618_7 and arg_615_1.time_ < var_618_0 + var_618_7 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play122531153 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 122531153
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play122531154(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 1.225

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, false)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_2 = arg_619_1:GetWordFromCfg(122531153)
				local var_622_3 = arg_619_1:FormatText(var_622_2.content)

				arg_619_1.text_.text = var_622_3

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_4 = 49
				local var_622_5 = utf8.len(var_622_3)
				local var_622_6 = var_622_4 <= 0 and var_622_1 or var_622_1 * (var_622_5 / var_622_4)

				if var_622_6 > 0 and var_622_1 < var_622_6 then
					arg_619_1.talkMaxDuration = var_622_6

					if var_622_6 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_6 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_3
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_7 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_7 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_7

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_7 and arg_619_1.time_ < var_622_0 + var_622_7 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play122531154 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 122531154
		arg_623_1.duration_ = 5

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play122531155(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 0.725

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, false)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_2 = arg_623_1:GetWordFromCfg(122531154)
				local var_626_3 = arg_623_1:FormatText(var_626_2.content)

				arg_623_1.text_.text = var_626_3

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_4 = 29
				local var_626_5 = utf8.len(var_626_3)
				local var_626_6 = var_626_4 <= 0 and var_626_1 or var_626_1 * (var_626_5 / var_626_4)

				if var_626_6 > 0 and var_626_1 < var_626_6 then
					arg_623_1.talkMaxDuration = var_626_6

					if var_626_6 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_6 + var_626_0
					end
				end

				arg_623_1.text_.text = var_626_3
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)
				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_7 = math.max(var_626_1, arg_623_1.talkMaxDuration)

			if var_626_0 <= arg_623_1.time_ and arg_623_1.time_ < var_626_0 + var_626_7 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_0) / var_626_7

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_0 + var_626_7 and arg_623_1.time_ < var_626_0 + var_626_7 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play122531155 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 122531155
		arg_627_1.duration_ = 5

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play122531156(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0
			local var_630_1 = 0.8

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_2 = arg_627_1:FormatText(StoryNameCfg[7].name)

				arg_627_1.leftNameTxt_.text = var_630_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_3 = arg_627_1:GetWordFromCfg(122531155)
				local var_630_4 = arg_627_1:FormatText(var_630_3.content)

				arg_627_1.text_.text = var_630_4

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_5 = 32
				local var_630_6 = utf8.len(var_630_4)
				local var_630_7 = var_630_5 <= 0 and var_630_1 or var_630_1 * (var_630_6 / var_630_5)

				if var_630_7 > 0 and var_630_1 < var_630_7 then
					arg_627_1.talkMaxDuration = var_630_7

					if var_630_7 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_7 + var_630_0
					end
				end

				arg_627_1.text_.text = var_630_4
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)
				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_8 = math.max(var_630_1, arg_627_1.talkMaxDuration)

			if var_630_0 <= arg_627_1.time_ and arg_627_1.time_ < var_630_0 + var_630_8 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_0) / var_630_8

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_0 + var_630_8 and arg_627_1.time_ < var_630_0 + var_630_8 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play122531156 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 122531156
		arg_631_1.duration_ = 11.933

		local var_631_0 = {
			ja = 11.933,
			ko = 7.9,
			zh = 7.9
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
				arg_631_0:Play122531157(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1029ui_story"].transform
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 then
				arg_631_1.var_.moveOldPos1029ui_story = var_634_0.localPosition
			end

			local var_634_2 = 0.001

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2
				local var_634_4 = Vector3.New(0, -1.09, -6.2)

				var_634_0.localPosition = Vector3.Lerp(arg_631_1.var_.moveOldPos1029ui_story, var_634_4, var_634_3)

				local var_634_5 = manager.ui.mainCamera.transform.position - var_634_0.position

				var_634_0.forward = Vector3.New(var_634_5.x, var_634_5.y, var_634_5.z)

				local var_634_6 = var_634_0.localEulerAngles

				var_634_6.z = 0
				var_634_6.x = 0
				var_634_0.localEulerAngles = var_634_6
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 then
				var_634_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_634_7 = manager.ui.mainCamera.transform.position - var_634_0.position

				var_634_0.forward = Vector3.New(var_634_7.x, var_634_7.y, var_634_7.z)

				local var_634_8 = var_634_0.localEulerAngles

				var_634_8.z = 0
				var_634_8.x = 0
				var_634_0.localEulerAngles = var_634_8
			end

			local var_634_9 = arg_631_1.actors_["1029ui_story"]
			local var_634_10 = 0

			if var_634_10 < arg_631_1.time_ and arg_631_1.time_ <= var_634_10 + arg_634_0 and arg_631_1.var_.characterEffect1029ui_story == nil then
				arg_631_1.var_.characterEffect1029ui_story = var_634_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_11 = 0.200000002980232

			if var_634_10 <= arg_631_1.time_ and arg_631_1.time_ < var_634_10 + var_634_11 then
				local var_634_12 = (arg_631_1.time_ - var_634_10) / var_634_11

				if arg_631_1.var_.characterEffect1029ui_story then
					arg_631_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_631_1.time_ >= var_634_10 + var_634_11 and arg_631_1.time_ < var_634_10 + var_634_11 + arg_634_0 and arg_631_1.var_.characterEffect1029ui_story then
				arg_631_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_634_13 = 0

			if var_634_13 < arg_631_1.time_ and arg_631_1.time_ <= var_634_13 + arg_634_0 then
				arg_631_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_634_14 = 0

			if var_634_14 < arg_631_1.time_ and arg_631_1.time_ <= var_634_14 + arg_634_0 then
				arg_631_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_634_15 = 0
			local var_634_16 = 0.95

			if var_634_15 < arg_631_1.time_ and arg_631_1.time_ <= var_634_15 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_17 = arg_631_1:FormatText(StoryNameCfg[319].name)

				arg_631_1.leftNameTxt_.text = var_634_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_18 = arg_631_1:GetWordFromCfg(122531156)
				local var_634_19 = arg_631_1:FormatText(var_634_18.content)

				arg_631_1.text_.text = var_634_19

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_20 = 38
				local var_634_21 = utf8.len(var_634_19)
				local var_634_22 = var_634_20 <= 0 and var_634_16 or var_634_16 * (var_634_21 / var_634_20)

				if var_634_22 > 0 and var_634_16 < var_634_22 then
					arg_631_1.talkMaxDuration = var_634_22

					if var_634_22 + var_634_15 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_22 + var_634_15
					end
				end

				arg_631_1.text_.text = var_634_19
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531156", "story_v_out_122531.awb") ~= 0 then
					local var_634_23 = manager.audio:GetVoiceLength("story_v_out_122531", "122531156", "story_v_out_122531.awb") / 1000

					if var_634_23 + var_634_15 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_23 + var_634_15
					end

					if var_634_18.prefab_name ~= "" and arg_631_1.actors_[var_634_18.prefab_name] ~= nil then
						local var_634_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_18.prefab_name].transform, "story_v_out_122531", "122531156", "story_v_out_122531.awb")

						arg_631_1:RecordAudio("122531156", var_634_24)
						arg_631_1:RecordAudio("122531156", var_634_24)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_122531", "122531156", "story_v_out_122531.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_122531", "122531156", "story_v_out_122531.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_25 = math.max(var_634_16, arg_631_1.talkMaxDuration)

			if var_634_15 <= arg_631_1.time_ and arg_631_1.time_ < var_634_15 + var_634_25 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_15) / var_634_25

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_15 + var_634_25 and arg_631_1.time_ < var_634_15 + var_634_25 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play122531157 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 122531157
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play122531158(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1029ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and arg_635_1.var_.characterEffect1029ui_story == nil then
				arg_635_1.var_.characterEffect1029ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.200000002980232

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1029ui_story then
					local var_638_4 = Mathf.Lerp(0, 0.5, var_638_3)

					arg_635_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1029ui_story.fillRatio = var_638_4
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and arg_635_1.var_.characterEffect1029ui_story then
				local var_638_5 = 0.5

				arg_635_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1029ui_story.fillRatio = var_638_5
			end

			local var_638_6 = 0
			local var_638_7 = 0.675

			if var_638_6 < arg_635_1.time_ and arg_635_1.time_ <= var_638_6 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_8 = arg_635_1:FormatText(StoryNameCfg[7].name)

				arg_635_1.leftNameTxt_.text = var_638_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_9 = arg_635_1:GetWordFromCfg(122531157)
				local var_638_10 = arg_635_1:FormatText(var_638_9.content)

				arg_635_1.text_.text = var_638_10

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_11 = 27
				local var_638_12 = utf8.len(var_638_10)
				local var_638_13 = var_638_11 <= 0 and var_638_7 or var_638_7 * (var_638_12 / var_638_11)

				if var_638_13 > 0 and var_638_7 < var_638_13 then
					arg_635_1.talkMaxDuration = var_638_13

					if var_638_13 + var_638_6 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_13 + var_638_6
					end
				end

				arg_635_1.text_.text = var_638_10
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_14 = math.max(var_638_7, arg_635_1.talkMaxDuration)

			if var_638_6 <= arg_635_1.time_ and arg_635_1.time_ < var_638_6 + var_638_14 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_6) / var_638_14

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_6 + var_638_14 and arg_635_1.time_ < var_638_6 + var_638_14 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play122531158 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 122531158
		arg_639_1.duration_ = 5

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play122531159(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0
			local var_642_1 = 0.175

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_2 = arg_639_1:FormatText(StoryNameCfg[7].name)

				arg_639_1.leftNameTxt_.text = var_642_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_3 = arg_639_1:GetWordFromCfg(122531158)
				local var_642_4 = arg_639_1:FormatText(var_642_3.content)

				arg_639_1.text_.text = var_642_4

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_5 = 7
				local var_642_6 = utf8.len(var_642_4)
				local var_642_7 = var_642_5 <= 0 and var_642_1 or var_642_1 * (var_642_6 / var_642_5)

				if var_642_7 > 0 and var_642_1 < var_642_7 then
					arg_639_1.talkMaxDuration = var_642_7

					if var_642_7 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_7 + var_642_0
					end
				end

				arg_639_1.text_.text = var_642_4
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_8 = math.max(var_642_1, arg_639_1.talkMaxDuration)

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_8 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_0) / var_642_8

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_0 + var_642_8 and arg_639_1.time_ < var_642_0 + var_642_8 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play122531159 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 122531159
		arg_643_1.duration_ = 11.1

		local var_643_0 = {
			ja = 11.1,
			ko = 7.3,
			zh = 7.3
		}
		local var_643_1 = manager.audio:GetLocalizationFlag()

		if var_643_0[var_643_1] ~= nil then
			arg_643_1.duration_ = var_643_0[var_643_1]
		end

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play122531160(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1029ui_story"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and arg_643_1.var_.characterEffect1029ui_story == nil then
				arg_643_1.var_.characterEffect1029ui_story = var_646_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_2 = 0.200000002980232

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.characterEffect1029ui_story then
					arg_643_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and arg_643_1.var_.characterEffect1029ui_story then
				arg_643_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_646_4 = 0

			if var_646_4 < arg_643_1.time_ and arg_643_1.time_ <= var_646_4 + arg_646_0 then
				arg_643_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_646_5 = 0

			if var_646_5 < arg_643_1.time_ and arg_643_1.time_ <= var_646_5 + arg_646_0 then
				arg_643_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_646_6 = 0
			local var_646_7 = 0.825

			if var_646_6 < arg_643_1.time_ and arg_643_1.time_ <= var_646_6 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_8 = arg_643_1:FormatText(StoryNameCfg[319].name)

				arg_643_1.leftNameTxt_.text = var_646_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_9 = arg_643_1:GetWordFromCfg(122531159)
				local var_646_10 = arg_643_1:FormatText(var_646_9.content)

				arg_643_1.text_.text = var_646_10

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_11 = 33
				local var_646_12 = utf8.len(var_646_10)
				local var_646_13 = var_646_11 <= 0 and var_646_7 or var_646_7 * (var_646_12 / var_646_11)

				if var_646_13 > 0 and var_646_7 < var_646_13 then
					arg_643_1.talkMaxDuration = var_646_13

					if var_646_13 + var_646_6 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_13 + var_646_6
					end
				end

				arg_643_1.text_.text = var_646_10
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531159", "story_v_out_122531.awb") ~= 0 then
					local var_646_14 = manager.audio:GetVoiceLength("story_v_out_122531", "122531159", "story_v_out_122531.awb") / 1000

					if var_646_14 + var_646_6 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_14 + var_646_6
					end

					if var_646_9.prefab_name ~= "" and arg_643_1.actors_[var_646_9.prefab_name] ~= nil then
						local var_646_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_9.prefab_name].transform, "story_v_out_122531", "122531159", "story_v_out_122531.awb")

						arg_643_1:RecordAudio("122531159", var_646_15)
						arg_643_1:RecordAudio("122531159", var_646_15)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_122531", "122531159", "story_v_out_122531.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_122531", "122531159", "story_v_out_122531.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_16 = math.max(var_646_7, arg_643_1.talkMaxDuration)

			if var_646_6 <= arg_643_1.time_ and arg_643_1.time_ < var_646_6 + var_646_16 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_6) / var_646_16

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_6 + var_646_16 and arg_643_1.time_ < var_646_6 + var_646_16 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play122531160 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 122531160
		arg_647_1.duration_ = 11.633

		local var_647_0 = {
			ja = 11.633,
			ko = 8.766,
			zh = 8.766
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
				arg_647_0:Play122531161(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = 0

			if var_650_0 < arg_647_1.time_ and arg_647_1.time_ <= var_650_0 + arg_650_0 then
				arg_647_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_1")
			end

			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 then
				arg_647_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_650_2 = 0
			local var_650_3 = 0.8

			if var_650_2 < arg_647_1.time_ and arg_647_1.time_ <= var_650_2 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_4 = arg_647_1:FormatText(StoryNameCfg[319].name)

				arg_647_1.leftNameTxt_.text = var_650_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_5 = arg_647_1:GetWordFromCfg(122531160)
				local var_650_6 = arg_647_1:FormatText(var_650_5.content)

				arg_647_1.text_.text = var_650_6

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_7 = 32
				local var_650_8 = utf8.len(var_650_6)
				local var_650_9 = var_650_7 <= 0 and var_650_3 or var_650_3 * (var_650_8 / var_650_7)

				if var_650_9 > 0 and var_650_3 < var_650_9 then
					arg_647_1.talkMaxDuration = var_650_9

					if var_650_9 + var_650_2 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_9 + var_650_2
					end
				end

				arg_647_1.text_.text = var_650_6
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531160", "story_v_out_122531.awb") ~= 0 then
					local var_650_10 = manager.audio:GetVoiceLength("story_v_out_122531", "122531160", "story_v_out_122531.awb") / 1000

					if var_650_10 + var_650_2 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_10 + var_650_2
					end

					if var_650_5.prefab_name ~= "" and arg_647_1.actors_[var_650_5.prefab_name] ~= nil then
						local var_650_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_5.prefab_name].transform, "story_v_out_122531", "122531160", "story_v_out_122531.awb")

						arg_647_1:RecordAudio("122531160", var_650_11)
						arg_647_1:RecordAudio("122531160", var_650_11)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_122531", "122531160", "story_v_out_122531.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_122531", "122531160", "story_v_out_122531.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_12 = math.max(var_650_3, arg_647_1.talkMaxDuration)

			if var_650_2 <= arg_647_1.time_ and arg_647_1.time_ < var_650_2 + var_650_12 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_2) / var_650_12

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_2 + var_650_12 and arg_647_1.time_ < var_650_2 + var_650_12 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play122531161 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 122531161
		arg_651_1.duration_ = 5.8

		local var_651_0 = {
			ja = 5.8,
			ko = 2.333,
			zh = 2.333
		}
		local var_651_1 = manager.audio:GetLocalizationFlag()

		if var_651_0[var_651_1] ~= nil then
			arg_651_1.duration_ = var_651_0[var_651_1]
		end

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play122531162(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = 0

			if var_654_0 < arg_651_1.time_ and arg_651_1.time_ <= var_654_0 + arg_654_0 then
				arg_651_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action5_2")
			end

			local var_654_1 = 0
			local var_654_2 = 0.2

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_3 = arg_651_1:FormatText(StoryNameCfg[319].name)

				arg_651_1.leftNameTxt_.text = var_654_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_4 = arg_651_1:GetWordFromCfg(122531161)
				local var_654_5 = arg_651_1:FormatText(var_654_4.content)

				arg_651_1.text_.text = var_654_5

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_6 = 8
				local var_654_7 = utf8.len(var_654_5)
				local var_654_8 = var_654_6 <= 0 and var_654_2 or var_654_2 * (var_654_7 / var_654_6)

				if var_654_8 > 0 and var_654_2 < var_654_8 then
					arg_651_1.talkMaxDuration = var_654_8

					if var_654_8 + var_654_1 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_8 + var_654_1
					end
				end

				arg_651_1.text_.text = var_654_5
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122531", "122531161", "story_v_out_122531.awb") ~= 0 then
					local var_654_9 = manager.audio:GetVoiceLength("story_v_out_122531", "122531161", "story_v_out_122531.awb") / 1000

					if var_654_9 + var_654_1 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_9 + var_654_1
					end

					if var_654_4.prefab_name ~= "" and arg_651_1.actors_[var_654_4.prefab_name] ~= nil then
						local var_654_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_651_1.actors_[var_654_4.prefab_name].transform, "story_v_out_122531", "122531161", "story_v_out_122531.awb")

						arg_651_1:RecordAudio("122531161", var_654_10)
						arg_651_1:RecordAudio("122531161", var_654_10)
					else
						arg_651_1:AudioAction("play", "voice", "story_v_out_122531", "122531161", "story_v_out_122531.awb")
					end

					arg_651_1:RecordHistoryTalkVoice("story_v_out_122531", "122531161", "story_v_out_122531.awb")
				end

				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_11 = math.max(var_654_2, arg_651_1.talkMaxDuration)

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_11 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_1) / var_654_11

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_1 + var_654_11 and arg_651_1.time_ < var_654_1 + var_654_11 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play122531162 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 122531162
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play122531163(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1029ui_story"].transform
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 then
				arg_655_1.var_.moveOldPos1029ui_story = var_658_0.localPosition
			end

			local var_658_2 = 0.001

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_2 then
				local var_658_3 = (arg_655_1.time_ - var_658_1) / var_658_2
				local var_658_4 = Vector3.New(0, 100, 0)

				var_658_0.localPosition = Vector3.Lerp(arg_655_1.var_.moveOldPos1029ui_story, var_658_4, var_658_3)

				local var_658_5 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_5.x, var_658_5.y, var_658_5.z)

				local var_658_6 = var_658_0.localEulerAngles

				var_658_6.z = 0
				var_658_6.x = 0
				var_658_0.localEulerAngles = var_658_6
			end

			if arg_655_1.time_ >= var_658_1 + var_658_2 and arg_655_1.time_ < var_658_1 + var_658_2 + arg_658_0 then
				var_658_0.localPosition = Vector3.New(0, 100, 0)

				local var_658_7 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_7.x, var_658_7.y, var_658_7.z)

				local var_658_8 = var_658_0.localEulerAngles

				var_658_8.z = 0
				var_658_8.x = 0
				var_658_0.localEulerAngles = var_658_8
			end

			local var_658_9 = arg_655_1.actors_["1029ui_story"]
			local var_658_10 = 0

			if var_658_10 < arg_655_1.time_ and arg_655_1.time_ <= var_658_10 + arg_658_0 and arg_655_1.var_.characterEffect1029ui_story == nil then
				arg_655_1.var_.characterEffect1029ui_story = var_658_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_11 = 0.200000002980232

			if var_658_10 <= arg_655_1.time_ and arg_655_1.time_ < var_658_10 + var_658_11 then
				local var_658_12 = (arg_655_1.time_ - var_658_10) / var_658_11

				if arg_655_1.var_.characterEffect1029ui_story then
					local var_658_13 = Mathf.Lerp(0, 0.5, var_658_12)

					arg_655_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_655_1.var_.characterEffect1029ui_story.fillRatio = var_658_13
				end
			end

			if arg_655_1.time_ >= var_658_10 + var_658_11 and arg_655_1.time_ < var_658_10 + var_658_11 + arg_658_0 and arg_655_1.var_.characterEffect1029ui_story then
				local var_658_14 = 0.5

				arg_655_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_655_1.var_.characterEffect1029ui_story.fillRatio = var_658_14
			end

			local var_658_15 = 0
			local var_658_16 = 1.225

			if var_658_15 < arg_655_1.time_ and arg_655_1.time_ <= var_658_15 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_17 = arg_655_1:GetWordFromCfg(122531162)
				local var_658_18 = arg_655_1:FormatText(var_658_17.content)

				arg_655_1.text_.text = var_658_18

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_19 = 49
				local var_658_20 = utf8.len(var_658_18)
				local var_658_21 = var_658_19 <= 0 and var_658_16 or var_658_16 * (var_658_20 / var_658_19)

				if var_658_21 > 0 and var_658_16 < var_658_21 then
					arg_655_1.talkMaxDuration = var_658_21

					if var_658_21 + var_658_15 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_21 + var_658_15
					end
				end

				arg_655_1.text_.text = var_658_18
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_22 = math.max(var_658_16, arg_655_1.talkMaxDuration)

			if var_658_15 <= arg_655_1.time_ and arg_655_1.time_ < var_658_15 + var_658_22 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_15) / var_658_22

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_15 + var_658_22 and arg_655_1.time_ < var_658_15 + var_658_22 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play122531163 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 122531163
		arg_659_1.duration_ = 5

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play122531164(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0
			local var_662_1 = 0.6

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_2 = arg_659_1:FormatText(StoryNameCfg[7].name)

				arg_659_1.leftNameTxt_.text = var_662_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_3 = arg_659_1:GetWordFromCfg(122531163)
				local var_662_4 = arg_659_1:FormatText(var_662_3.content)

				arg_659_1.text_.text = var_662_4

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_5 = 24
				local var_662_6 = utf8.len(var_662_4)
				local var_662_7 = var_662_5 <= 0 and var_662_1 or var_662_1 * (var_662_6 / var_662_5)

				if var_662_7 > 0 and var_662_1 < var_662_7 then
					arg_659_1.talkMaxDuration = var_662_7

					if var_662_7 + var_662_0 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_7 + var_662_0
					end
				end

				arg_659_1.text_.text = var_662_4
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)
				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_8 = math.max(var_662_1, arg_659_1.talkMaxDuration)

			if var_662_0 <= arg_659_1.time_ and arg_659_1.time_ < var_662_0 + var_662_8 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_0) / var_662_8

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_0 + var_662_8 and arg_659_1.time_ < var_662_0 + var_662_8 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play122531164 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 122531164
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play122531165(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.575

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, false)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_2 = arg_663_1:GetWordFromCfg(122531164)
				local var_666_3 = arg_663_1:FormatText(var_666_2.content)

				arg_663_1.text_.text = var_666_3

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_4 = 23
				local var_666_5 = utf8.len(var_666_3)
				local var_666_6 = var_666_4 <= 0 and var_666_1 or var_666_1 * (var_666_5 / var_666_4)

				if var_666_6 > 0 and var_666_1 < var_666_6 then
					arg_663_1.talkMaxDuration = var_666_6

					if var_666_6 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_6 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_3
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_7 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_7 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_7

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_7 and arg_663_1.time_ < var_666_0 + var_666_7 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play122531165 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 122531165
		arg_667_1.duration_ = 5

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
			arg_667_1.auto_ = false
		end

		function arg_667_1.playNext_(arg_669_0)
			arg_667_1.onStoryFinished_()
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 0.45

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, false)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_2 = arg_667_1:GetWordFromCfg(122531165)
				local var_670_3 = arg_667_1:FormatText(var_670_2.content)

				arg_667_1.text_.text = var_670_3

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_4 = 18
				local var_670_5 = utf8.len(var_670_3)
				local var_670_6 = var_670_4 <= 0 and var_670_1 or var_670_1 * (var_670_5 / var_670_4)

				if var_670_6 > 0 and var_670_1 < var_670_6 then
					arg_667_1.talkMaxDuration = var_670_6

					if var_670_6 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_6 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_3
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_7 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_7 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_7

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_7 and arg_667_1.time_ < var_670_0 + var_670_7 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST42",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST41",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31"
	},
	voices = {
		"story_v_out_122531.awb"
	}
}
