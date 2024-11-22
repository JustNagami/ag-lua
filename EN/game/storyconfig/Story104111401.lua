return {
	Play411141001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 411141001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play411141002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I07"

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
				local var_4_5 = arg_1_1.bgs_.I07

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
					if iter_4_0 ~= "I07" then
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

			local var_4_22 = 0.433333333333333
			local var_4_23 = 0.3

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock.awb")
			end

			local var_4_26 = 0
			local var_4_27 = 0.3

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.25

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

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(411141001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 50
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37
					var_4_30 = var_4_30 + 0.3

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_38 = var_4_30 + 0.3
			local var_4_39 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_38) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play411141002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 411141002
		arg_7_1.duration_ = 6.5

		local var_7_0 = {
			zh = 5.433,
			ja = 6.5
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
				arg_7_0:Play411141003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1095ui_story"

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

			local var_10_4 = arg_7_1.actors_["1095ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos1095ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -0.98, -6.1)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1095ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = arg_7_1.actors_["1095ui_story"]
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story == nil then
				arg_7_1.var_.characterEffect1095ui_story = var_10_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_15 = 0.200000002980232

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / var_10_15

				if arg_7_1.var_.characterEffect1095ui_story then
					arg_7_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 and arg_7_1.var_.characterEffect1095ui_story then
				arg_7_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_10_18 = 0

			if var_10_18 < arg_7_1.time_ and arg_7_1.time_ <= var_10_18 + arg_10_0 then
				arg_7_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_10_19 = arg_7_1.actors_["1095ui_story"]
			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 then
				if arg_7_1.var_.characterEffect1095ui_story == nil then
					arg_7_1.var_.characterEffect1095ui_story = var_10_19:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_10_21 = arg_7_1.var_.characterEffect1095ui_story

				var_10_21.imageEffect:turnOff()

				var_10_21.interferenceEffect.enabled = true
				var_10_21.interferenceEffect.noise = 0.001
				var_10_21.interferenceEffect.simTimeScale = 1
				var_10_21.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_10_22 = arg_7_1.actors_["1095ui_story"]
			local var_10_23 = 0
			local var_10_24 = 2

			if var_10_23 < arg_7_1.time_ and arg_7_1.time_ <= var_10_23 + arg_10_0 then
				if arg_7_1.var_.characterEffect1095ui_story == nil then
					arg_7_1.var_.characterEffect1095ui_story = var_10_22:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_7_1.var_.characterEffect1095ui_story.imageEffect:turnOn(false)
			end

			local var_10_25 = 0
			local var_10_26 = 0.625

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[471].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(411141002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141002", "story_v_out_411141.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_411141", "411141002", "story_v_out_411141.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_411141", "411141002", "story_v_out_411141.awb")

						arg_7_1:RecordAudio("411141002", var_10_34)
						arg_7_1:RecordAudio("411141002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_411141", "411141002", "story_v_out_411141.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_411141", "411141002", "story_v_out_411141.awb")
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
	Play411141003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 411141003
		arg_11_1.duration_ = 10.533

		local var_11_0 = {
			zh = 8,
			ja = 10.533
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
				arg_11_0:Play411141004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.075

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[471].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(411141003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141003", "story_v_out_411141.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141003", "story_v_out_411141.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_411141", "411141003", "story_v_out_411141.awb")

						arg_11_1:RecordAudio("411141003", var_14_9)
						arg_11_1:RecordAudio("411141003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_411141", "411141003", "story_v_out_411141.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_411141", "411141003", "story_v_out_411141.awb")
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
	Play411141004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 411141004
		arg_15_1.duration_ = 9.4

		local var_15_0 = {
			zh = 5.266,
			ja = 9.4
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
				arg_15_0:Play411141005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1095ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos1095ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, 100, 0)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1095ui_story, var_18_4, var_18_3)

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

			local var_18_9 = arg_15_1.actors_["1095ui_story"]
			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story == nil then
				arg_15_1.var_.characterEffect1095ui_story = var_18_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_11 = 0.200000002980232

			if var_18_10 <= arg_15_1.time_ and arg_15_1.time_ < var_18_10 + var_18_11 then
				local var_18_12 = (arg_15_1.time_ - var_18_10) / var_18_11

				if arg_15_1.var_.characterEffect1095ui_story then
					local var_18_13 = Mathf.Lerp(0, 0.5, var_18_12)

					arg_15_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1095ui_story.fillRatio = var_18_13
				end
			end

			if arg_15_1.time_ >= var_18_10 + var_18_11 and arg_15_1.time_ < var_18_10 + var_18_11 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story then
				local var_18_14 = 0.5

				arg_15_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1095ui_story.fillRatio = var_18_14
			end

			local var_18_15 = "10014ui_story"

			if arg_15_1.actors_[var_18_15] == nil then
				local var_18_16 = Object.Instantiate(Asset.Load("Char/" .. var_18_15), arg_15_1.stage_.transform)

				var_18_16.name = var_18_15
				var_18_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_15] = var_18_16

				local var_18_17 = var_18_16:GetComponentInChildren(typeof(CharacterEffect))

				var_18_17.enabled = true

				local var_18_18 = GameObjectTools.GetOrAddComponent(var_18_16, typeof(DynamicBoneHelper))

				if var_18_18 then
					var_18_18:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_17.transform, false)

				arg_15_1.var_[var_18_15 .. "Animator"] = var_18_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_15 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_15 .. "LipSync"] = var_18_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_19 = arg_15_1.actors_["10014ui_story"].transform
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.var_.moveOldPos10014ui_story = var_18_19.localPosition
			end

			local var_18_21 = 0.001

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Vector3.New(0, -1.06, -6.2)

				var_18_19.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10014ui_story, var_18_23, var_18_22)

				local var_18_24 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_24.x, var_18_24.y, var_18_24.z)

				local var_18_25 = var_18_19.localEulerAngles

				var_18_25.z = 0
				var_18_25.x = 0
				var_18_19.localEulerAngles = var_18_25
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				var_18_19.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_18_26 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_26.x, var_18_26.y, var_18_26.z)

				local var_18_27 = var_18_19.localEulerAngles

				var_18_27.z = 0
				var_18_27.x = 0
				var_18_19.localEulerAngles = var_18_27
			end

			local var_18_28 = arg_15_1.actors_["10014ui_story"]
			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 and arg_15_1.var_.characterEffect10014ui_story == nil then
				arg_15_1.var_.characterEffect10014ui_story = var_18_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_30 = 0.200000002980232

			if var_18_29 <= arg_15_1.time_ and arg_15_1.time_ < var_18_29 + var_18_30 then
				local var_18_31 = (arg_15_1.time_ - var_18_29) / var_18_30

				if arg_15_1.var_.characterEffect10014ui_story then
					arg_15_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_29 + var_18_30 and arg_15_1.time_ < var_18_29 + var_18_30 + arg_18_0 and arg_15_1.var_.characterEffect10014ui_story then
				arg_15_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_18_32 = 0

			if var_18_32 < arg_15_1.time_ and arg_15_1.time_ <= var_18_32 + arg_18_0 then
				arg_15_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_18_33 = 0

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				arg_15_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_34 = 0
			local var_18_35 = 0.7

			if var_18_34 < arg_15_1.time_ and arg_15_1.time_ <= var_18_34 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_36 = arg_15_1:FormatText(StoryNameCfg[264].name)

				arg_15_1.leftNameTxt_.text = var_18_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_37 = arg_15_1:GetWordFromCfg(411141004)
				local var_18_38 = arg_15_1:FormatText(var_18_37.content)

				arg_15_1.text_.text = var_18_38

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_39 = 28
				local var_18_40 = utf8.len(var_18_38)
				local var_18_41 = var_18_39 <= 0 and var_18_35 or var_18_35 * (var_18_40 / var_18_39)

				if var_18_41 > 0 and var_18_35 < var_18_41 then
					arg_15_1.talkMaxDuration = var_18_41

					if var_18_41 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_41 + var_18_34
					end
				end

				arg_15_1.text_.text = var_18_38
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141004", "story_v_out_411141.awb") ~= 0 then
					local var_18_42 = manager.audio:GetVoiceLength("story_v_out_411141", "411141004", "story_v_out_411141.awb") / 1000

					if var_18_42 + var_18_34 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_34
					end

					if var_18_37.prefab_name ~= "" and arg_15_1.actors_[var_18_37.prefab_name] ~= nil then
						local var_18_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_37.prefab_name].transform, "story_v_out_411141", "411141004", "story_v_out_411141.awb")

						arg_15_1:RecordAudio("411141004", var_18_43)
						arg_15_1:RecordAudio("411141004", var_18_43)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_411141", "411141004", "story_v_out_411141.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_411141", "411141004", "story_v_out_411141.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_44 = math.max(var_18_35, arg_15_1.talkMaxDuration)

			if var_18_34 <= arg_15_1.time_ and arg_15_1.time_ < var_18_34 + var_18_44 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_34) / var_18_44

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_34 + var_18_44 and arg_15_1.time_ < var_18_34 + var_18_44 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play411141005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 411141005
		arg_19_1.duration_ = 5.2

		local var_19_0 = {
			zh = 3.466,
			ja = 5.2
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
				arg_19_0:Play411141006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.5

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[264].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(411141005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141005", "story_v_out_411141.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141005", "story_v_out_411141.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_411141", "411141005", "story_v_out_411141.awb")

						arg_19_1:RecordAudio("411141005", var_22_9)
						arg_19_1:RecordAudio("411141005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_411141", "411141005", "story_v_out_411141.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_411141", "411141005", "story_v_out_411141.awb")
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
	Play411141006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 411141006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play411141007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10014ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10014ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10014ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, 100, 0)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["10014ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect10014ui_story == nil then
				arg_23_1.var_.characterEffect10014ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect10014ui_story then
					local var_26_13 = Mathf.Lerp(0, 0.5, var_26_12)

					arg_23_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10014ui_story.fillRatio = var_26_13
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect10014ui_story then
				local var_26_14 = 0.5

				arg_23_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10014ui_story.fillRatio = var_26_14
			end

			local var_26_15 = 0
			local var_26_16 = 0.9

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_17 = arg_23_1:GetWordFromCfg(411141006)
				local var_26_18 = arg_23_1:FormatText(var_26_17.content)

				arg_23_1.text_.text = var_26_18

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_19 = 36
				local var_26_20 = utf8.len(var_26_18)
				local var_26_21 = var_26_19 <= 0 and var_26_16 or var_26_16 * (var_26_20 / var_26_19)

				if var_26_21 > 0 and var_26_16 < var_26_21 then
					arg_23_1.talkMaxDuration = var_26_21

					if var_26_21 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_15
					end
				end

				arg_23_1.text_.text = var_26_18
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_16, arg_23_1.talkMaxDuration)

			if var_26_15 <= arg_23_1.time_ and arg_23_1.time_ < var_26_15 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_15) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_15 + var_26_22 and arg_23_1.time_ < var_26_15 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play411141007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 411141007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play411141008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.9

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

				local var_30_2 = arg_27_1:GetWordFromCfg(411141007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 36
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
	Play411141008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 411141008
		arg_31_1.duration_ = 2.266

		local var_31_0 = {
			zh = 1.3,
			ja = 2.266
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
				arg_31_0:Play411141009(arg_31_1)
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
				local var_34_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1095ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

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
			local var_34_14 = 0.2

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[471].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(411141008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 8
				local var_34_19 = utf8.len(var_34_17)
				local var_34_20 = var_34_18 <= 0 and var_34_14 or var_34_14 * (var_34_19 / var_34_18)

				if var_34_20 > 0 and var_34_14 < var_34_20 then
					arg_31_1.talkMaxDuration = var_34_20

					if var_34_20 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_20 + var_34_13
					end
				end

				arg_31_1.text_.text = var_34_17
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141008", "story_v_out_411141.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_411141", "411141008", "story_v_out_411141.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_411141", "411141008", "story_v_out_411141.awb")

						arg_31_1:RecordAudio("411141008", var_34_22)
						arg_31_1:RecordAudio("411141008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_411141", "411141008", "story_v_out_411141.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_411141", "411141008", "story_v_out_411141.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_23 = math.max(var_34_14, arg_31_1.talkMaxDuration)

			if var_34_13 <= arg_31_1.time_ and arg_31_1.time_ < var_34_13 + var_34_23 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_13) / var_34_23

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_13 + var_34_23 and arg_31_1.time_ < var_34_13 + var_34_23 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play411141009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 411141009
		arg_35_1.duration_ = 10.2

		local var_35_0 = {
			zh = 6.4,
			ja = 10.2
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
				arg_35_0:Play411141010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1095ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1095ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["10014ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect10014ui_story == nil then
				arg_35_1.var_.characterEffect10014ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.200000002980232

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect10014ui_story then
					arg_35_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect10014ui_story then
				arg_35_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_38_10 = arg_35_1.actors_["10014ui_story"].transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.moveOldPos10014ui_story = var_38_10.localPosition
			end

			local var_38_12 = 0.001

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / var_38_12
				local var_38_14 = Vector3.New(0.7, -1.06, -6.2)

				var_38_10.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10014ui_story, var_38_14, var_38_13)

				local var_38_15 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_15.x, var_38_15.y, var_38_15.z)

				local var_38_16 = var_38_10.localEulerAngles

				var_38_16.z = 0
				var_38_16.x = 0
				var_38_10.localEulerAngles = var_38_16
			end

			if arg_35_1.time_ >= var_38_11 + var_38_12 and arg_35_1.time_ < var_38_11 + var_38_12 + arg_38_0 then
				var_38_10.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_38_17 = manager.ui.mainCamera.transform.position - var_38_10.position

				var_38_10.forward = Vector3.New(var_38_17.x, var_38_17.y, var_38_17.z)

				local var_38_18 = var_38_10.localEulerAngles

				var_38_18.z = 0
				var_38_18.x = 0
				var_38_10.localEulerAngles = var_38_18
			end

			local var_38_19 = 0
			local var_38_20 = 0.85

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_21 = arg_35_1:FormatText(StoryNameCfg[264].name)

				arg_35_1.leftNameTxt_.text = var_38_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_22 = arg_35_1:GetWordFromCfg(411141009)
				local var_38_23 = arg_35_1:FormatText(var_38_22.content)

				arg_35_1.text_.text = var_38_23

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_24 = 34
				local var_38_25 = utf8.len(var_38_23)
				local var_38_26 = var_38_24 <= 0 and var_38_20 or var_38_20 * (var_38_25 / var_38_24)

				if var_38_26 > 0 and var_38_20 < var_38_26 then
					arg_35_1.talkMaxDuration = var_38_26

					if var_38_26 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_26 + var_38_19
					end
				end

				arg_35_1.text_.text = var_38_23
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141009", "story_v_out_411141.awb") ~= 0 then
					local var_38_27 = manager.audio:GetVoiceLength("story_v_out_411141", "411141009", "story_v_out_411141.awb") / 1000

					if var_38_27 + var_38_19 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_27 + var_38_19
					end

					if var_38_22.prefab_name ~= "" and arg_35_1.actors_[var_38_22.prefab_name] ~= nil then
						local var_38_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_22.prefab_name].transform, "story_v_out_411141", "411141009", "story_v_out_411141.awb")

						arg_35_1:RecordAudio("411141009", var_38_28)
						arg_35_1:RecordAudio("411141009", var_38_28)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_411141", "411141009", "story_v_out_411141.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_411141", "411141009", "story_v_out_411141.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_29 = math.max(var_38_20, arg_35_1.talkMaxDuration)

			if var_38_19 <= arg_35_1.time_ and arg_35_1.time_ < var_38_19 + var_38_29 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_19) / var_38_29

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_19 + var_38_29 and arg_35_1.time_ < var_38_19 + var_38_29 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play411141010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 411141010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play411141011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10014ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10014ui_story == nil then
				arg_39_1.var_.characterEffect10014ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10014ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10014ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10014ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10014ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.375

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(411141010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 15
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_7 or var_42_7 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_7 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_13 and arg_39_1.time_ < var_42_6 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play411141011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 411141011
		arg_43_1.duration_ = 2.566

		local var_43_0 = {
			zh = 1.766,
			ja = 2.566
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
				arg_43_0:Play411141012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10014ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect10014ui_story == nil then
				arg_43_1.var_.characterEffect10014ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect10014ui_story then
					arg_43_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect10014ui_story then
				arg_43_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_46_4 = 0
			local var_46_5 = 0.225

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_6 = arg_43_1:FormatText(StoryNameCfg[264].name)

				arg_43_1.leftNameTxt_.text = var_46_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_7 = arg_43_1:GetWordFromCfg(411141011)
				local var_46_8 = arg_43_1:FormatText(var_46_7.content)

				arg_43_1.text_.text = var_46_8

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_9 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141011", "story_v_out_411141.awb") ~= 0 then
					local var_46_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141011", "story_v_out_411141.awb") / 1000

					if var_46_12 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_4
					end

					if var_46_7.prefab_name ~= "" and arg_43_1.actors_[var_46_7.prefab_name] ~= nil then
						local var_46_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_7.prefab_name].transform, "story_v_out_411141", "411141011", "story_v_out_411141.awb")

						arg_43_1:RecordAudio("411141011", var_46_13)
						arg_43_1:RecordAudio("411141011", var_46_13)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_411141", "411141011", "story_v_out_411141.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_411141", "411141011", "story_v_out_411141.awb")
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
	Play411141012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 411141012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play411141013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1095ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1095ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, 100, 0)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1095ui_story, var_50_4, var_50_3)

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

			local var_50_9 = arg_47_1.actors_["1095ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story == nil then
				arg_47_1.var_.characterEffect1095ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1095ui_story then
					local var_50_13 = Mathf.Lerp(0, 0.5, var_50_12)

					arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_13
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story then
				local var_50_14 = 0.5

				arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_14
			end

			local var_50_15 = arg_47_1.actors_["10014ui_story"].transform
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.var_.moveOldPos10014ui_story = var_50_15.localPosition
			end

			local var_50_17 = 0.001

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Vector3.New(0, 100, 0)

				var_50_15.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10014ui_story, var_50_19, var_50_18)

				local var_50_20 = manager.ui.mainCamera.transform.position - var_50_15.position

				var_50_15.forward = Vector3.New(var_50_20.x, var_50_20.y, var_50_20.z)

				local var_50_21 = var_50_15.localEulerAngles

				var_50_21.z = 0
				var_50_21.x = 0
				var_50_15.localEulerAngles = var_50_21
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				var_50_15.localPosition = Vector3.New(0, 100, 0)

				local var_50_22 = manager.ui.mainCamera.transform.position - var_50_15.position

				var_50_15.forward = Vector3.New(var_50_22.x, var_50_22.y, var_50_22.z)

				local var_50_23 = var_50_15.localEulerAngles

				var_50_23.z = 0
				var_50_23.x = 0
				var_50_15.localEulerAngles = var_50_23
			end

			local var_50_24 = arg_47_1.actors_["10014ui_story"]
			local var_50_25 = 0

			if var_50_25 < arg_47_1.time_ and arg_47_1.time_ <= var_50_25 + arg_50_0 and arg_47_1.var_.characterEffect10014ui_story == nil then
				arg_47_1.var_.characterEffect10014ui_story = var_50_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_26 = 0.200000002980232

			if var_50_25 <= arg_47_1.time_ and arg_47_1.time_ < var_50_25 + var_50_26 then
				local var_50_27 = (arg_47_1.time_ - var_50_25) / var_50_26

				if arg_47_1.var_.characterEffect10014ui_story then
					local var_50_28 = Mathf.Lerp(0, 0.5, var_50_27)

					arg_47_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_47_1.var_.characterEffect10014ui_story.fillRatio = var_50_28
				end
			end

			if arg_47_1.time_ >= var_50_25 + var_50_26 and arg_47_1.time_ < var_50_25 + var_50_26 + arg_50_0 and arg_47_1.var_.characterEffect10014ui_story then
				local var_50_29 = 0.5

				arg_47_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_47_1.var_.characterEffect10014ui_story.fillRatio = var_50_29
			end

			local var_50_30 = 0
			local var_50_31 = 1.2

			if var_50_30 < arg_47_1.time_ and arg_47_1.time_ <= var_50_30 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_32 = arg_47_1:GetWordFromCfg(411141012)
				local var_50_33 = arg_47_1:FormatText(var_50_32.content)

				arg_47_1.text_.text = var_50_33

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_34 = 26
				local var_50_35 = utf8.len(var_50_33)
				local var_50_36 = var_50_34 <= 0 and var_50_31 or var_50_31 * (var_50_35 / var_50_34)

				if var_50_36 > 0 and var_50_31 < var_50_36 then
					arg_47_1.talkMaxDuration = var_50_36

					if var_50_36 + var_50_30 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_36 + var_50_30
					end
				end

				arg_47_1.text_.text = var_50_33
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_37 = math.max(var_50_31, arg_47_1.talkMaxDuration)

			if var_50_30 <= arg_47_1.time_ and arg_47_1.time_ < var_50_30 + var_50_37 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_30) / var_50_37

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_30 + var_50_37 and arg_47_1.time_ < var_50_30 + var_50_37 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play411141013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 411141013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play411141014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.7

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_2 = arg_51_1:GetWordFromCfg(411141013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 33
				local var_54_5 = utf8.len(var_54_3)
				local var_54_6 = var_54_4 <= 0 and var_54_1 or var_54_1 * (var_54_5 / var_54_4)

				if var_54_6 > 0 and var_54_1 < var_54_6 then
					arg_51_1.talkMaxDuration = var_54_6

					if var_54_6 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_6 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_3
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_7 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_7 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_7

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_7 and arg_51_1.time_ < var_54_0 + var_54_7 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play411141014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 411141014
		arg_55_1.duration_ = 2.26666666666667

		local var_55_0 = {
			zh = 1.999999999999,
			ja = 2.26666666666667
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
				arg_55_0:Play411141015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10014ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10014ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, -1.06, -6.2)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10014ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["10014ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect10014ui_story == nil then
				arg_55_1.var_.characterEffect10014ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect10014ui_story then
					arg_55_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect10014ui_story then
				arg_55_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_2")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_15 = 0.666666666666667
			local var_58_16 = 0.125

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_17 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_17:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_18 = arg_55_1:FormatText(StoryNameCfg[264].name)

				arg_55_1.leftNameTxt_.text = var_58_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_19 = arg_55_1:GetWordFromCfg(411141014)
				local var_58_20 = arg_55_1:FormatText(var_58_19.content)

				arg_55_1.text_.text = var_58_20

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_21 = 5
				local var_58_22 = utf8.len(var_58_20)
				local var_58_23 = var_58_21 <= 0 and var_58_16 or var_58_16 * (var_58_22 / var_58_21)

				if var_58_23 > 0 and var_58_16 < var_58_23 then
					arg_55_1.talkMaxDuration = var_58_23
					var_58_15 = var_58_15 + 0.3

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_20
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141014", "story_v_out_411141.awb") ~= 0 then
					local var_58_24 = manager.audio:GetVoiceLength("story_v_out_411141", "411141014", "story_v_out_411141.awb") / 1000

					if var_58_24 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_24 + var_58_15
					end

					if var_58_19.prefab_name ~= "" and arg_55_1.actors_[var_58_19.prefab_name] ~= nil then
						local var_58_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_19.prefab_name].transform, "story_v_out_411141", "411141014", "story_v_out_411141.awb")

						arg_55_1:RecordAudio("411141014", var_58_25)
						arg_55_1:RecordAudio("411141014", var_58_25)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_411141", "411141014", "story_v_out_411141.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_411141", "411141014", "story_v_out_411141.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_26 = var_58_15 + 0.3
			local var_58_27 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_26 <= arg_55_1.time_ and arg_55_1.time_ < var_58_26 + var_58_27 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_26) / var_58_27

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_26 + var_58_27 and arg_55_1.time_ < var_58_26 + var_58_27 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play411141015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 411141015
		arg_61_1.duration_ = 2.133

		local var_61_0 = {
			zh = 2.066,
			ja = 2.133
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
				arg_61_0:Play411141016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10014ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect10014ui_story == nil then
				arg_61_1.var_.characterEffect10014ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect10014ui_story then
					local var_64_4 = Mathf.Lerp(0, 0.5, var_64_3)

					arg_61_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10014ui_story.fillRatio = var_64_4
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect10014ui_story then
				local var_64_5 = 0.5

				arg_61_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10014ui_story.fillRatio = var_64_5
			end

			local var_64_6 = 0
			local var_64_7 = 0.275

			if var_64_6 < arg_61_1.time_ and arg_61_1.time_ <= var_64_6 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_8 = arg_61_1:FormatText(StoryNameCfg[709].name)

				arg_61_1.leftNameTxt_.text = var_64_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_9 = arg_61_1:GetWordFromCfg(411141015)
				local var_64_10 = arg_61_1:FormatText(var_64_9.content)

				arg_61_1.text_.text = var_64_10

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_11 = 11
				local var_64_12 = utf8.len(var_64_10)
				local var_64_13 = var_64_11 <= 0 and var_64_7 or var_64_7 * (var_64_12 / var_64_11)

				if var_64_13 > 0 and var_64_7 < var_64_13 then
					arg_61_1.talkMaxDuration = var_64_13

					if var_64_13 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_13 + var_64_6
					end
				end

				arg_61_1.text_.text = var_64_10
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141015", "story_v_out_411141.awb") ~= 0 then
					local var_64_14 = manager.audio:GetVoiceLength("story_v_out_411141", "411141015", "story_v_out_411141.awb") / 1000

					if var_64_14 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_14 + var_64_6
					end

					if var_64_9.prefab_name ~= "" and arg_61_1.actors_[var_64_9.prefab_name] ~= nil then
						local var_64_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_9.prefab_name].transform, "story_v_out_411141", "411141015", "story_v_out_411141.awb")

						arg_61_1:RecordAudio("411141015", var_64_15)
						arg_61_1:RecordAudio("411141015", var_64_15)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_411141", "411141015", "story_v_out_411141.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_411141", "411141015", "story_v_out_411141.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_16 = math.max(var_64_7, arg_61_1.talkMaxDuration)

			if var_64_6 <= arg_61_1.time_ and arg_61_1.time_ < var_64_6 + var_64_16 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_6) / var_64_16

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_6 + var_64_16 and arg_61_1.time_ < var_64_6 + var_64_16 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play411141016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 411141016
		arg_65_1.duration_ = 1.999999999999

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play411141017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10014ui_story"].transform
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1.var_.moveOldPos10014ui_story = var_68_0.localPosition
			end

			local var_68_2 = 0.001

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2
				local var_68_4 = Vector3.New(0, -1.06, -6.2)

				var_68_0.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos10014ui_story, var_68_4, var_68_3)

				local var_68_5 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_5.x, var_68_5.y, var_68_5.z)

				local var_68_6 = var_68_0.localEulerAngles

				var_68_6.z = 0
				var_68_6.x = 0
				var_68_0.localEulerAngles = var_68_6
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 then
				var_68_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_68_7 = manager.ui.mainCamera.transform.position - var_68_0.position

				var_68_0.forward = Vector3.New(var_68_7.x, var_68_7.y, var_68_7.z)

				local var_68_8 = var_68_0.localEulerAngles

				var_68_8.z = 0
				var_68_8.x = 0
				var_68_0.localEulerAngles = var_68_8
			end

			local var_68_9 = arg_65_1.actors_["10014ui_story"]
			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 and arg_65_1.var_.characterEffect10014ui_story == nil then
				arg_65_1.var_.characterEffect10014ui_story = var_68_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_11 = 0.200000002980232

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_11 then
				local var_68_12 = (arg_65_1.time_ - var_68_10) / var_68_11

				if arg_65_1.var_.characterEffect10014ui_story then
					arg_65_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_10 + var_68_11 and arg_65_1.time_ < var_68_10 + var_68_11 + arg_68_0 and arg_65_1.var_.characterEffect10014ui_story then
				arg_65_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_68_13 = 0

			if var_68_13 < arg_65_1.time_ and arg_65_1.time_ <= var_68_13 + arg_68_0 then
				arg_65_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_68_14 = 0
			local var_68_15 = 0.2

			if var_68_14 < arg_65_1.time_ and arg_65_1.time_ <= var_68_14 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_16 = arg_65_1:FormatText(StoryNameCfg[264].name)

				arg_65_1.leftNameTxt_.text = var_68_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_17 = arg_65_1:GetWordFromCfg(411141016)
				local var_68_18 = arg_65_1:FormatText(var_68_17.content)

				arg_65_1.text_.text = var_68_18

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_19 = 8
				local var_68_20 = utf8.len(var_68_18)
				local var_68_21 = var_68_19 <= 0 and var_68_15 or var_68_15 * (var_68_20 / var_68_19)

				if var_68_21 > 0 and var_68_15 < var_68_21 then
					arg_65_1.talkMaxDuration = var_68_21

					if var_68_21 + var_68_14 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_21 + var_68_14
					end
				end

				arg_65_1.text_.text = var_68_18
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141016", "story_v_out_411141.awb") ~= 0 then
					local var_68_22 = manager.audio:GetVoiceLength("story_v_out_411141", "411141016", "story_v_out_411141.awb") / 1000

					if var_68_22 + var_68_14 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_22 + var_68_14
					end

					if var_68_17.prefab_name ~= "" and arg_65_1.actors_[var_68_17.prefab_name] ~= nil then
						local var_68_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_17.prefab_name].transform, "story_v_out_411141", "411141016", "story_v_out_411141.awb")

						arg_65_1:RecordAudio("411141016", var_68_23)
						arg_65_1:RecordAudio("411141016", var_68_23)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_411141", "411141016", "story_v_out_411141.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_411141", "411141016", "story_v_out_411141.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_24 = math.max(var_68_15, arg_65_1.talkMaxDuration)

			if var_68_14 <= arg_65_1.time_ and arg_65_1.time_ < var_68_14 + var_68_24 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_14) / var_68_24

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_14 + var_68_24 and arg_65_1.time_ < var_68_14 + var_68_24 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play411141017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 411141017
		arg_69_1.duration_ = 8.266

		local var_69_0 = {
			zh = 6.5,
			ja = 8.266
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
				arg_69_0:Play411141018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10014ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect10014ui_story == nil then
				arg_69_1.var_.characterEffect10014ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect10014ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_69_1.var_.characterEffect10014ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect10014ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_69_1.var_.characterEffect10014ui_story.fillRatio = var_72_5
			end

			local var_72_6 = 0
			local var_72_7 = 1

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_8 = arg_69_1:FormatText(StoryNameCfg[709].name)

				arg_69_1.leftNameTxt_.text = var_72_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_9 = arg_69_1:GetWordFromCfg(411141017)
				local var_72_10 = arg_69_1:FormatText(var_72_9.content)

				arg_69_1.text_.text = var_72_10

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_11 = 40
				local var_72_12 = utf8.len(var_72_10)
				local var_72_13 = var_72_11 <= 0 and var_72_7 or var_72_7 * (var_72_12 / var_72_11)

				if var_72_13 > 0 and var_72_7 < var_72_13 then
					arg_69_1.talkMaxDuration = var_72_13

					if var_72_13 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_13 + var_72_6
					end
				end

				arg_69_1.text_.text = var_72_10
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141017", "story_v_out_411141.awb") ~= 0 then
					local var_72_14 = manager.audio:GetVoiceLength("story_v_out_411141", "411141017", "story_v_out_411141.awb") / 1000

					if var_72_14 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_14 + var_72_6
					end

					if var_72_9.prefab_name ~= "" and arg_69_1.actors_[var_72_9.prefab_name] ~= nil then
						local var_72_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_9.prefab_name].transform, "story_v_out_411141", "411141017", "story_v_out_411141.awb")

						arg_69_1:RecordAudio("411141017", var_72_15)
						arg_69_1:RecordAudio("411141017", var_72_15)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_411141", "411141017", "story_v_out_411141.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_411141", "411141017", "story_v_out_411141.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_16 = math.max(var_72_7, arg_69_1.talkMaxDuration)

			if var_72_6 <= arg_69_1.time_ and arg_69_1.time_ < var_72_6 + var_72_16 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_6) / var_72_16

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_6 + var_72_16 and arg_69_1.time_ < var_72_6 + var_72_16 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play411141018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 411141018
		arg_73_1.duration_ = 10.433

		local var_73_0 = {
			zh = 9.066,
			ja = 10.433
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
				arg_73_0:Play411141019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.175

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[709].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(411141018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 47
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141018", "story_v_out_411141.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141018", "story_v_out_411141.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_411141", "411141018", "story_v_out_411141.awb")

						arg_73_1:RecordAudio("411141018", var_76_9)
						arg_73_1:RecordAudio("411141018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_411141", "411141018", "story_v_out_411141.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_411141", "411141018", "story_v_out_411141.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_10 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_10 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_10

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_10 and arg_73_1.time_ < var_76_0 + var_76_10 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play411141019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 411141019
		arg_77_1.duration_ = 2.866

		local var_77_0 = {
			zh = 2.2,
			ja = 2.866
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
				arg_77_0:Play411141020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10014ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10014ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, -1.06, -6.2)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10014ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["10014ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect10014ui_story == nil then
				arg_77_1.var_.characterEffect10014ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.200000002980232

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect10014ui_story then
					arg_77_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect10014ui_story then
				arg_77_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_80_15 = 0
			local var_80_16 = 0.125

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_17 = arg_77_1:FormatText(StoryNameCfg[264].name)

				arg_77_1.leftNameTxt_.text = var_80_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_18 = arg_77_1:GetWordFromCfg(411141019)
				local var_80_19 = arg_77_1:FormatText(var_80_18.content)

				arg_77_1.text_.text = var_80_19

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_20 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141019", "story_v_out_411141.awb") ~= 0 then
					local var_80_23 = manager.audio:GetVoiceLength("story_v_out_411141", "411141019", "story_v_out_411141.awb") / 1000

					if var_80_23 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_15
					end

					if var_80_18.prefab_name ~= "" and arg_77_1.actors_[var_80_18.prefab_name] ~= nil then
						local var_80_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_18.prefab_name].transform, "story_v_out_411141", "411141019", "story_v_out_411141.awb")

						arg_77_1:RecordAudio("411141019", var_80_24)
						arg_77_1:RecordAudio("411141019", var_80_24)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_411141", "411141019", "story_v_out_411141.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_411141", "411141019", "story_v_out_411141.awb")
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
	Play411141020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 411141020
		arg_81_1.duration_ = 7

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play411141021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = "STblack"

			if arg_81_1.bgs_[var_84_0] == nil then
				local var_84_1 = Object.Instantiate(arg_81_1.paintGo_)

				var_84_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_84_0)
				var_84_1.name = var_84_0
				var_84_1.transform.parent = arg_81_1.stage_.transform
				var_84_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_81_1.bgs_[var_84_0] = var_84_1
			end

			local var_84_2 = 0

			if var_84_2 < arg_81_1.time_ and arg_81_1.time_ <= var_84_2 + arg_84_0 then
				local var_84_3 = manager.ui.mainCamera.transform.localPosition
				local var_84_4 = Vector3.New(0, 0, 10) + Vector3.New(var_84_3.x, var_84_3.y, 0)
				local var_84_5 = arg_81_1.bgs_.STblack

				var_84_5.transform.localPosition = var_84_4
				var_84_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_84_6 = var_84_5:GetComponent("SpriteRenderer")

				if var_84_6 and var_84_6.sprite then
					local var_84_7 = (var_84_5.transform.localPosition - var_84_3).z
					local var_84_8 = manager.ui.mainCameraCom_
					local var_84_9 = 2 * var_84_7 * Mathf.Tan(var_84_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_84_10 = var_84_9 * var_84_8.aspect
					local var_84_11 = var_84_6.sprite.bounds.size.x
					local var_84_12 = var_84_6.sprite.bounds.size.y
					local var_84_13 = var_84_10 / var_84_11
					local var_84_14 = var_84_9 / var_84_12
					local var_84_15 = var_84_14 < var_84_13 and var_84_13 or var_84_14

					var_84_5.transform.localScale = Vector3.New(var_84_15, var_84_15, 0)
				end

				for iter_84_0, iter_84_1 in pairs(arg_81_1.bgs_) do
					if iter_84_0 ~= "STblack" then
						iter_84_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_84_16 = 0

			if var_84_16 < arg_81_1.time_ and arg_81_1.time_ <= var_84_16 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_17 = 2

			if var_84_16 <= arg_81_1.time_ and arg_81_1.time_ < var_84_16 + var_84_17 then
				local var_84_18 = (arg_81_1.time_ - var_84_16) / var_84_17
				local var_84_19 = Color.New(1, 1, 1)

				var_84_19.a = Mathf.Lerp(1, 0, var_84_18)
				arg_81_1.mask_.color = var_84_19
			end

			if arg_81_1.time_ >= var_84_16 + var_84_17 and arg_81_1.time_ < var_84_16 + var_84_17 + arg_84_0 then
				local var_84_20 = Color.New(1, 1, 1)
				local var_84_21 = 0

				arg_81_1.mask_.enabled = false
				var_84_20.a = var_84_21
				arg_81_1.mask_.color = var_84_20
			end

			local var_84_22 = arg_81_1.actors_["10014ui_story"].transform
			local var_84_23 = 0

			if var_84_23 < arg_81_1.time_ and arg_81_1.time_ <= var_84_23 + arg_84_0 then
				arg_81_1.var_.moveOldPos10014ui_story = var_84_22.localPosition
			end

			local var_84_24 = 0.001

			if var_84_23 <= arg_81_1.time_ and arg_81_1.time_ < var_84_23 + var_84_24 then
				local var_84_25 = (arg_81_1.time_ - var_84_23) / var_84_24
				local var_84_26 = Vector3.New(0, 100, 0)

				var_84_22.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10014ui_story, var_84_26, var_84_25)

				local var_84_27 = manager.ui.mainCamera.transform.position - var_84_22.position

				var_84_22.forward = Vector3.New(var_84_27.x, var_84_27.y, var_84_27.z)

				local var_84_28 = var_84_22.localEulerAngles

				var_84_28.z = 0
				var_84_28.x = 0
				var_84_22.localEulerAngles = var_84_28
			end

			if arg_81_1.time_ >= var_84_23 + var_84_24 and arg_81_1.time_ < var_84_23 + var_84_24 + arg_84_0 then
				var_84_22.localPosition = Vector3.New(0, 100, 0)

				local var_84_29 = manager.ui.mainCamera.transform.position - var_84_22.position

				var_84_22.forward = Vector3.New(var_84_29.x, var_84_29.y, var_84_29.z)

				local var_84_30 = var_84_22.localEulerAngles

				var_84_30.z = 0
				var_84_30.x = 0
				var_84_22.localEulerAngles = var_84_30
			end

			local var_84_31 = arg_81_1.actors_["10014ui_story"]
			local var_84_32 = 0

			if var_84_32 < arg_81_1.time_ and arg_81_1.time_ <= var_84_32 + arg_84_0 and arg_81_1.var_.characterEffect10014ui_story == nil then
				arg_81_1.var_.characterEffect10014ui_story = var_84_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_33 = 0.200000002980232

			if var_84_32 <= arg_81_1.time_ and arg_81_1.time_ < var_84_32 + var_84_33 then
				local var_84_34 = (arg_81_1.time_ - var_84_32) / var_84_33

				if arg_81_1.var_.characterEffect10014ui_story then
					local var_84_35 = Mathf.Lerp(0, 0.5, var_84_34)

					arg_81_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_81_1.var_.characterEffect10014ui_story.fillRatio = var_84_35
				end
			end

			if arg_81_1.time_ >= var_84_32 + var_84_33 and arg_81_1.time_ < var_84_32 + var_84_33 + arg_84_0 and arg_81_1.var_.characterEffect10014ui_story then
				local var_84_36 = 0.5

				arg_81_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_81_1.var_.characterEffect10014ui_story.fillRatio = var_84_36
			end

			local var_84_37 = 0
			local var_84_38 = 0.3

			if var_84_37 < arg_81_1.time_ and arg_81_1.time_ <= var_84_37 + arg_84_0 then
				local var_84_39 = "play"
				local var_84_40 = "effect"

				arg_81_1:AudioAction(var_84_39, var_84_40, "se_story_1211", "se_story_1211_explosionfar", "")
			end

			local var_84_41 = manager.ui.mainCamera.transform
			local var_84_42 = 1.66666666666667

			if var_84_42 < arg_81_1.time_ and arg_81_1.time_ <= var_84_42 + arg_84_0 then
				local var_84_43 = arg_81_1.var_.effectyanchen1

				if not var_84_43 then
					var_84_43 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_84_43.name = "yanchen1"
					arg_81_1.var_.effectyanchen1 = var_84_43
				end

				local var_84_44 = var_84_41:Find("")

				if var_84_44 then
					var_84_43.transform.parent = var_84_44
				else
					var_84_43.transform.parent = var_84_41
				end

				var_84_43.transform.localPosition = Vector3.New(0, 0, 0)
				var_84_43.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_84_45 = manager.ui.mainCamera.transform
			local var_84_46 = 2.66666666666667

			if var_84_46 < arg_81_1.time_ and arg_81_1.time_ <= var_84_46 + arg_84_0 then
				local var_84_47 = arg_81_1.var_.effectyanchen1

				if var_84_47 then
					Object.Destroy(var_84_47)

					arg_81_1.var_.effectyanchen1 = nil
				end
			end

			if arg_81_1.frameCnt_ <= 1 then
				arg_81_1.dialog_:SetActive(false)
			end

			local var_84_48 = 2
			local var_84_49 = 0.9

			if var_84_48 < arg_81_1.time_ and arg_81_1.time_ <= var_84_48 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				arg_81_1.dialog_:SetActive(true)

				local var_84_50 = LeanTween.value(arg_81_1.dialog_, 0, 1, 0.3)

				var_84_50:setOnUpdate(LuaHelper.FloatAction(function(arg_85_0)
					arg_81_1.dialogCg_.alpha = arg_85_0
				end))
				var_84_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_81_1.dialog_)
					var_84_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_81_1.duration_ = arg_81_1.duration_ + 0.3

				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_51 = arg_81_1:GetWordFromCfg(411141020)
				local var_84_52 = arg_81_1:FormatText(var_84_51.content)

				arg_81_1.text_.text = var_84_52

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_53 = 36
				local var_84_54 = utf8.len(var_84_52)
				local var_84_55 = var_84_53 <= 0 and var_84_49 or var_84_49 * (var_84_54 / var_84_53)

				if var_84_55 > 0 and var_84_49 < var_84_55 then
					arg_81_1.talkMaxDuration = var_84_55
					var_84_48 = var_84_48 + 0.3

					if var_84_55 + var_84_48 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_55 + var_84_48
					end
				end

				arg_81_1.text_.text = var_84_52
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_56 = var_84_48 + 0.3
			local var_84_57 = math.max(var_84_49, arg_81_1.talkMaxDuration)

			if var_84_56 <= arg_81_1.time_ and arg_81_1.time_ < var_84_56 + var_84_57 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_56) / var_84_57

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_56 + var_84_57 and arg_81_1.time_ < var_84_56 + var_84_57 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play411141021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 411141021
		arg_87_1.duration_ = 7

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play411141022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				local var_90_1 = manager.ui.mainCamera.transform.localPosition
				local var_90_2 = Vector3.New(0, 0, 10) + Vector3.New(var_90_1.x, var_90_1.y, 0)
				local var_90_3 = arg_87_1.bgs_.I07

				var_90_3.transform.localPosition = var_90_2
				var_90_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_90_4 = var_90_3:GetComponent("SpriteRenderer")

				if var_90_4 and var_90_4.sprite then
					local var_90_5 = (var_90_3.transform.localPosition - var_90_1).z
					local var_90_6 = manager.ui.mainCameraCom_
					local var_90_7 = 2 * var_90_5 * Mathf.Tan(var_90_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_90_8 = var_90_7 * var_90_6.aspect
					local var_90_9 = var_90_4.sprite.bounds.size.x
					local var_90_10 = var_90_4.sprite.bounds.size.y
					local var_90_11 = var_90_8 / var_90_9
					local var_90_12 = var_90_7 / var_90_10
					local var_90_13 = var_90_12 < var_90_11 and var_90_11 or var_90_12

					var_90_3.transform.localScale = Vector3.New(var_90_13, var_90_13, 0)
				end

				for iter_90_0, iter_90_1 in pairs(arg_87_1.bgs_) do
					if iter_90_0 ~= "I07" then
						iter_90_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1.mask_.enabled = true
				arg_87_1.mask_.raycastTarget = true

				arg_87_1:SetGaussion(false)
			end

			local var_90_15 = 2

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15
				local var_90_17 = Color.New(0, 0, 0)

				var_90_17.a = Mathf.Lerp(1, 0, var_90_16)
				arg_87_1.mask_.color = var_90_17
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 then
				local var_90_18 = Color.New(0, 0, 0)
				local var_90_19 = 0

				arg_87_1.mask_.enabled = false
				var_90_18.a = var_90_19
				arg_87_1.mask_.color = var_90_18
			end

			if arg_87_1.frameCnt_ <= 1 then
				arg_87_1.dialog_:SetActive(false)
			end

			local var_90_20 = 2
			local var_90_21 = 0.7

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0

				arg_87_1.dialog_:SetActive(true)

				local var_90_22 = LeanTween.value(arg_87_1.dialog_, 0, 1, 0.3)

				var_90_22:setOnUpdate(LuaHelper.FloatAction(function(arg_91_0)
					arg_87_1.dialogCg_.alpha = arg_91_0
				end))
				var_90_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_87_1.dialog_)
					var_90_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_87_1.duration_ = arg_87_1.duration_ + 0.3

				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_23 = arg_87_1:GetWordFromCfg(411141021)
				local var_90_24 = arg_87_1:FormatText(var_90_23.content)

				arg_87_1.text_.text = var_90_24

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_25 = 28
				local var_90_26 = utf8.len(var_90_24)
				local var_90_27 = var_90_25 <= 0 and var_90_21 or var_90_21 * (var_90_26 / var_90_25)

				if var_90_27 > 0 and var_90_21 < var_90_27 then
					arg_87_1.talkMaxDuration = var_90_27
					var_90_20 = var_90_20 + 0.3

					if var_90_27 + var_90_20 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_20
					end
				end

				arg_87_1.text_.text = var_90_24
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_28 = var_90_20 + 0.3
			local var_90_29 = math.max(var_90_21, arg_87_1.talkMaxDuration)

			if var_90_28 <= arg_87_1.time_ and arg_87_1.time_ < var_90_28 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_28) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_28 + var_90_29 and arg_87_1.time_ < var_90_28 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play411141022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 411141022
		arg_93_1.duration_ = 3.9

		local var_93_0 = {
			zh = 2.233,
			ja = 3.9
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
				arg_93_0:Play411141023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.3

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[709].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(411141022)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 12
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141022", "story_v_out_411141.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141022", "story_v_out_411141.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_411141", "411141022", "story_v_out_411141.awb")

						arg_93_1:RecordAudio("411141022", var_96_9)
						arg_93_1:RecordAudio("411141022", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_411141", "411141022", "story_v_out_411141.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_411141", "411141022", "story_v_out_411141.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_10 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_10 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_10

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_10 and arg_93_1.time_ < var_96_0 + var_96_10 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play411141023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 411141023
		arg_97_1.duration_ = 4.7

		local var_97_0 = {
			zh = 4.133,
			ja = 4.7
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
				arg_97_0:Play411141024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10014ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos10014ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, -1.06, -6.2)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos10014ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["10014ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect10014ui_story == nil then
				arg_97_1.var_.characterEffect10014ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.200000002980232

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect10014ui_story then
					arg_97_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect10014ui_story then
				arg_97_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_2")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_15 = 0
			local var_100_16 = 0.375

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[264].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(411141023)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141023", "story_v_out_411141.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_out_411141", "411141023", "story_v_out_411141.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_out_411141", "411141023", "story_v_out_411141.awb")

						arg_97_1:RecordAudio("411141023", var_100_24)
						arg_97_1:RecordAudio("411141023", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_411141", "411141023", "story_v_out_411141.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_411141", "411141023", "story_v_out_411141.awb")
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
	Play411141024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 411141024
		arg_101_1.duration_ = 6.1

		local var_101_0 = {
			zh = 4.166,
			ja = 6.1
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
				arg_101_0:Play411141025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10014ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos10014ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, -1.06, -6.2)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10014ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["10014ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect10014ui_story == nil then
				arg_101_1.var_.characterEffect10014ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect10014ui_story then
					arg_101_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect10014ui_story then
				arg_101_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_104_13 = 0

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_14 = 0
			local var_104_15 = 0.45

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_16 = arg_101_1:FormatText(StoryNameCfg[264].name)

				arg_101_1.leftNameTxt_.text = var_104_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_17 = arg_101_1:GetWordFromCfg(411141024)
				local var_104_18 = arg_101_1:FormatText(var_104_17.content)

				arg_101_1.text_.text = var_104_18

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_19 = 18
				local var_104_20 = utf8.len(var_104_18)
				local var_104_21 = var_104_19 <= 0 and var_104_15 or var_104_15 * (var_104_20 / var_104_19)

				if var_104_21 > 0 and var_104_15 < var_104_21 then
					arg_101_1.talkMaxDuration = var_104_21

					if var_104_21 + var_104_14 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_21 + var_104_14
					end
				end

				arg_101_1.text_.text = var_104_18
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141024", "story_v_out_411141.awb") ~= 0 then
					local var_104_22 = manager.audio:GetVoiceLength("story_v_out_411141", "411141024", "story_v_out_411141.awb") / 1000

					if var_104_22 + var_104_14 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_22 + var_104_14
					end

					if var_104_17.prefab_name ~= "" and arg_101_1.actors_[var_104_17.prefab_name] ~= nil then
						local var_104_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_17.prefab_name].transform, "story_v_out_411141", "411141024", "story_v_out_411141.awb")

						arg_101_1:RecordAudio("411141024", var_104_23)
						arg_101_1:RecordAudio("411141024", var_104_23)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_411141", "411141024", "story_v_out_411141.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_411141", "411141024", "story_v_out_411141.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_24 = math.max(var_104_15, arg_101_1.talkMaxDuration)

			if var_104_14 <= arg_101_1.time_ and arg_101_1.time_ < var_104_14 + var_104_24 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_14) / var_104_24

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_14 + var_104_24 and arg_101_1.time_ < var_104_14 + var_104_24 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play411141025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 411141025
		arg_105_1.duration_ = 3.1

		local var_105_0 = {
			zh = 3.1,
			ja = 1.9
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
				arg_105_0:Play411141026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10014ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect10014ui_story == nil then
				arg_105_1.var_.characterEffect10014ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect10014ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_105_1.var_.characterEffect10014ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect10014ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_105_1.var_.characterEffect10014ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.325

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[471].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_105_1.callingController_:SetSelectedState("calling")

				local var_108_9 = arg_105_1:GetWordFromCfg(411141025)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 13
				local var_108_12 = utf8.len(var_108_10)
				local var_108_13 = var_108_11 <= 0 and var_108_7 or var_108_7 * (var_108_12 / var_108_11)

				if var_108_13 > 0 and var_108_7 < var_108_13 then
					arg_105_1.talkMaxDuration = var_108_13

					if var_108_13 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_10
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141025", "story_v_out_411141.awb") ~= 0 then
					local var_108_14 = manager.audio:GetVoiceLength("story_v_out_411141", "411141025", "story_v_out_411141.awb") / 1000

					if var_108_14 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_6
					end

					if var_108_9.prefab_name ~= "" and arg_105_1.actors_[var_108_9.prefab_name] ~= nil then
						local var_108_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_9.prefab_name].transform, "story_v_out_411141", "411141025", "story_v_out_411141.awb")

						arg_105_1:RecordAudio("411141025", var_108_15)
						arg_105_1:RecordAudio("411141025", var_108_15)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_411141", "411141025", "story_v_out_411141.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_411141", "411141025", "story_v_out_411141.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_16 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_16 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_16

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_16 and arg_105_1.time_ < var_108_6 + var_108_16 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play411141026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 411141026
		arg_109_1.duration_ = 9.9

		local var_109_0 = {
			zh = 6.533,
			ja = 9.9
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
				arg_109_0:Play411141027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["10014ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect10014ui_story == nil then
				arg_109_1.var_.characterEffect10014ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect10014ui_story then
					arg_109_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect10014ui_story then
				arg_109_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_112_4 = 0
			local var_112_5 = 0.8

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_6 = arg_109_1:FormatText(StoryNameCfg[264].name)

				arg_109_1.leftNameTxt_.text = var_112_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_7 = arg_109_1:GetWordFromCfg(411141026)
				local var_112_8 = arg_109_1:FormatText(var_112_7.content)

				arg_109_1.text_.text = var_112_8

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_9 = 32
				local var_112_10 = utf8.len(var_112_8)
				local var_112_11 = var_112_9 <= 0 and var_112_5 or var_112_5 * (var_112_10 / var_112_9)

				if var_112_11 > 0 and var_112_5 < var_112_11 then
					arg_109_1.talkMaxDuration = var_112_11

					if var_112_11 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_11 + var_112_4
					end
				end

				arg_109_1.text_.text = var_112_8
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141026", "story_v_out_411141.awb") ~= 0 then
					local var_112_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141026", "story_v_out_411141.awb") / 1000

					if var_112_12 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_12 + var_112_4
					end

					if var_112_7.prefab_name ~= "" and arg_109_1.actors_[var_112_7.prefab_name] ~= nil then
						local var_112_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_7.prefab_name].transform, "story_v_out_411141", "411141026", "story_v_out_411141.awb")

						arg_109_1:RecordAudio("411141026", var_112_13)
						arg_109_1:RecordAudio("411141026", var_112_13)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_411141", "411141026", "story_v_out_411141.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_411141", "411141026", "story_v_out_411141.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_14 = math.max(var_112_5, arg_109_1.talkMaxDuration)

			if var_112_4 <= arg_109_1.time_ and arg_109_1.time_ < var_112_4 + var_112_14 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_4) / var_112_14

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_4 + var_112_14 and arg_109_1.time_ < var_112_4 + var_112_14 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play411141027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 411141027
		arg_113_1.duration_ = 10.066

		local var_113_0 = {
			zh = 5.566,
			ja = 10.066
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
				arg_113_0:Play411141028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.775

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[264].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(411141027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141027", "story_v_out_411141.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141027", "story_v_out_411141.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_411141", "411141027", "story_v_out_411141.awb")

						arg_113_1:RecordAudio("411141027", var_116_9)
						arg_113_1:RecordAudio("411141027", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_411141", "411141027", "story_v_out_411141.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_411141", "411141027", "story_v_out_411141.awb")
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
	Play411141028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 411141028
		arg_117_1.duration_ = 1.833

		local var_117_0 = {
			zh = 1,
			ja = 1.833
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
				arg_117_0:Play411141029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10014ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect10014ui_story == nil then
				arg_117_1.var_.characterEffect10014ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect10014ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_117_1.var_.characterEffect10014ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect10014ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_117_1.var_.characterEffect10014ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.075

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[471].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_117_1.callingController_:SetSelectedState("calling")

				local var_120_9 = arg_117_1:GetWordFromCfg(411141028)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141028", "story_v_out_411141.awb") ~= 0 then
					local var_120_14 = manager.audio:GetVoiceLength("story_v_out_411141", "411141028", "story_v_out_411141.awb") / 1000

					if var_120_14 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_14 + var_120_6
					end

					if var_120_9.prefab_name ~= "" and arg_117_1.actors_[var_120_9.prefab_name] ~= nil then
						local var_120_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_9.prefab_name].transform, "story_v_out_411141", "411141028", "story_v_out_411141.awb")

						arg_117_1:RecordAudio("411141028", var_120_15)
						arg_117_1:RecordAudio("411141028", var_120_15)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_411141", "411141028", "story_v_out_411141.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_411141", "411141028", "story_v_out_411141.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_16 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_16 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_16

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_16 and arg_117_1.time_ < var_120_6 + var_120_16 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play411141029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 411141029
		arg_121_1.duration_ = 9

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play411141030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = "D11"

			if arg_121_1.bgs_[var_124_0] == nil then
				local var_124_1 = Object.Instantiate(arg_121_1.paintGo_)

				var_124_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_124_0)
				var_124_1.name = var_124_0
				var_124_1.transform.parent = arg_121_1.stage_.transform
				var_124_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_121_1.bgs_[var_124_0] = var_124_1
			end

			local var_124_2 = 2

			if var_124_2 < arg_121_1.time_ and arg_121_1.time_ <= var_124_2 + arg_124_0 then
				local var_124_3 = manager.ui.mainCamera.transform.localPosition
				local var_124_4 = Vector3.New(0, 0, 10) + Vector3.New(var_124_3.x, var_124_3.y, 0)
				local var_124_5 = arg_121_1.bgs_.D11

				var_124_5.transform.localPosition = var_124_4
				var_124_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_124_6 = var_124_5:GetComponent("SpriteRenderer")

				if var_124_6 and var_124_6.sprite then
					local var_124_7 = (var_124_5.transform.localPosition - var_124_3).z
					local var_124_8 = manager.ui.mainCameraCom_
					local var_124_9 = 2 * var_124_7 * Mathf.Tan(var_124_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_124_10 = var_124_9 * var_124_8.aspect
					local var_124_11 = var_124_6.sprite.bounds.size.x
					local var_124_12 = var_124_6.sprite.bounds.size.y
					local var_124_13 = var_124_10 / var_124_11
					local var_124_14 = var_124_9 / var_124_12
					local var_124_15 = var_124_14 < var_124_13 and var_124_13 or var_124_14

					var_124_5.transform.localScale = Vector3.New(var_124_15, var_124_15, 0)
				end

				for iter_124_0, iter_124_1 in pairs(arg_121_1.bgs_) do
					if iter_124_0 ~= "D11" then
						iter_124_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.mask_.enabled = true
				arg_121_1.mask_.raycastTarget = true

				arg_121_1:SetGaussion(false)
			end

			local var_124_17 = 2

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Color.New(0, 0, 0)

				var_124_19.a = Mathf.Lerp(0, 1, var_124_18)
				arg_121_1.mask_.color = var_124_19
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 then
				local var_124_20 = Color.New(0, 0, 0)

				var_124_20.a = 1
				arg_121_1.mask_.color = var_124_20
			end

			local var_124_21 = 2

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 then
				arg_121_1.mask_.enabled = true
				arg_121_1.mask_.raycastTarget = true

				arg_121_1:SetGaussion(false)
			end

			local var_124_22 = 2

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_22 then
				local var_124_23 = (arg_121_1.time_ - var_124_21) / var_124_22
				local var_124_24 = Color.New(0, 0, 0)

				var_124_24.a = Mathf.Lerp(1, 0, var_124_23)
				arg_121_1.mask_.color = var_124_24
			end

			if arg_121_1.time_ >= var_124_21 + var_124_22 and arg_121_1.time_ < var_124_21 + var_124_22 + arg_124_0 then
				local var_124_25 = Color.New(0, 0, 0)
				local var_124_26 = 0

				arg_121_1.mask_.enabled = false
				var_124_25.a = var_124_26
				arg_121_1.mask_.color = var_124_25
			end

			local var_124_27 = arg_121_1.actors_["10014ui_story"].transform
			local var_124_28 = 2

			if var_124_28 < arg_121_1.time_ and arg_121_1.time_ <= var_124_28 + arg_124_0 then
				arg_121_1.var_.moveOldPos10014ui_story = var_124_27.localPosition
			end

			local var_124_29 = 0.001

			if var_124_28 <= arg_121_1.time_ and arg_121_1.time_ < var_124_28 + var_124_29 then
				local var_124_30 = (arg_121_1.time_ - var_124_28) / var_124_29
				local var_124_31 = Vector3.New(0, 100, 0)

				var_124_27.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10014ui_story, var_124_31, var_124_30)

				local var_124_32 = manager.ui.mainCamera.transform.position - var_124_27.position

				var_124_27.forward = Vector3.New(var_124_32.x, var_124_32.y, var_124_32.z)

				local var_124_33 = var_124_27.localEulerAngles

				var_124_33.z = 0
				var_124_33.x = 0
				var_124_27.localEulerAngles = var_124_33
			end

			if arg_121_1.time_ >= var_124_28 + var_124_29 and arg_121_1.time_ < var_124_28 + var_124_29 + arg_124_0 then
				var_124_27.localPosition = Vector3.New(0, 100, 0)

				local var_124_34 = manager.ui.mainCamera.transform.position - var_124_27.position

				var_124_27.forward = Vector3.New(var_124_34.x, var_124_34.y, var_124_34.z)

				local var_124_35 = var_124_27.localEulerAngles

				var_124_35.z = 0
				var_124_35.x = 0
				var_124_27.localEulerAngles = var_124_35
			end

			local var_124_36 = arg_121_1.actors_["10014ui_story"]
			local var_124_37 = 2

			if var_124_37 < arg_121_1.time_ and arg_121_1.time_ <= var_124_37 + arg_124_0 and arg_121_1.var_.characterEffect10014ui_story == nil then
				arg_121_1.var_.characterEffect10014ui_story = var_124_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_38 = 0.200000002980232

			if var_124_37 <= arg_121_1.time_ and arg_121_1.time_ < var_124_37 + var_124_38 then
				local var_124_39 = (arg_121_1.time_ - var_124_37) / var_124_38

				if arg_121_1.var_.characterEffect10014ui_story then
					local var_124_40 = Mathf.Lerp(0, 0.5, var_124_39)

					arg_121_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10014ui_story.fillRatio = var_124_40
				end
			end

			if arg_121_1.time_ >= var_124_37 + var_124_38 and arg_121_1.time_ < var_124_37 + var_124_38 + arg_124_0 and arg_121_1.var_.characterEffect10014ui_story then
				local var_124_41 = 0.5

				arg_121_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10014ui_story.fillRatio = var_124_41
			end

			if arg_121_1.frameCnt_ <= 1 then
				arg_121_1.dialog_:SetActive(false)
			end

			local var_124_42 = 4
			local var_124_43 = 0.275

			if var_124_42 < arg_121_1.time_ and arg_121_1.time_ <= var_124_42 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0

				arg_121_1.dialog_:SetActive(true)

				local var_124_44 = LeanTween.value(arg_121_1.dialog_, 0, 1, 0.3)

				var_124_44:setOnUpdate(LuaHelper.FloatAction(function(arg_125_0)
					arg_121_1.dialogCg_.alpha = arg_125_0
				end))
				var_124_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_121_1.dialog_)
					var_124_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_121_1.duration_ = arg_121_1.duration_ + 0.3

				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_45 = arg_121_1:GetWordFromCfg(411141029)
				local var_124_46 = arg_121_1:FormatText(var_124_45.content)

				arg_121_1.text_.text = var_124_46

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_47 = 11
				local var_124_48 = utf8.len(var_124_46)
				local var_124_49 = var_124_47 <= 0 and var_124_43 or var_124_43 * (var_124_48 / var_124_47)

				if var_124_49 > 0 and var_124_43 < var_124_49 then
					arg_121_1.talkMaxDuration = var_124_49
					var_124_42 = var_124_42 + 0.3

					if var_124_49 + var_124_42 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_49 + var_124_42
					end
				end

				arg_121_1.text_.text = var_124_46
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_50 = var_124_42 + 0.3
			local var_124_51 = math.max(var_124_43, arg_121_1.talkMaxDuration)

			if var_124_50 <= arg_121_1.time_ and arg_121_1.time_ < var_124_50 + var_124_51 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_50) / var_124_51

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_50 + var_124_51 and arg_121_1.time_ < var_124_50 + var_124_51 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play411141030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 411141030
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play411141031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = manager.ui.mainCamera.transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.shakeOldPos = var_130_0.localPosition
			end

			local var_130_2 = 0.6

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / 0.066
				local var_130_4, var_130_5 = math.modf(var_130_3)

				var_130_0.localPosition = Vector3.New(var_130_5 * 0.13, var_130_5 * 0.13, var_130_5 * 0.13) + arg_127_1.var_.shakeOldPos
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = arg_127_1.var_.shakeOldPos
			end

			local var_130_6 = 0

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.allBtn_.enabled = false
			end

			local var_130_7 = 0.6

			if arg_127_1.time_ >= var_130_6 + var_130_7 and arg_127_1.time_ < var_130_6 + var_130_7 + arg_130_0 then
				arg_127_1.allBtn_.enabled = true
			end

			local var_130_8 = 0
			local var_130_9 = 1.05

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_10 = arg_127_1:GetWordFromCfg(411141030)
				local var_130_11 = arg_127_1:FormatText(var_130_10.content)

				arg_127_1.text_.text = var_130_11

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_12 = 42
				local var_130_13 = utf8.len(var_130_11)
				local var_130_14 = var_130_12 <= 0 and var_130_9 or var_130_9 * (var_130_13 / var_130_12)

				if var_130_14 > 0 and var_130_9 < var_130_14 then
					arg_127_1.talkMaxDuration = var_130_14

					if var_130_14 + var_130_8 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_14 + var_130_8
					end
				end

				arg_127_1.text_.text = var_130_11
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_15 = math.max(var_130_9, arg_127_1.talkMaxDuration)

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_15 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_8) / var_130_15

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_8 + var_130_15 and arg_127_1.time_ < var_130_8 + var_130_15 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play411141031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 411141031
		arg_131_1.duration_ = 1.999999999999

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play411141032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "10058ui_story"

			if arg_131_1.actors_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(Asset.Load("Char/" .. var_134_0), arg_131_1.stage_.transform)

				var_134_1.name = var_134_0
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.actors_[var_134_0] = var_134_1

				local var_134_2 = var_134_1:GetComponentInChildren(typeof(CharacterEffect))

				var_134_2.enabled = true

				local var_134_3 = GameObjectTools.GetOrAddComponent(var_134_1, typeof(DynamicBoneHelper))

				if var_134_3 then
					var_134_3:EnableDynamicBone(false)
				end

				arg_131_1:ShowWeapon(var_134_2.transform, false)

				arg_131_1.var_[var_134_0 .. "Animator"] = var_134_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_131_1.var_[var_134_0 .. "Animator"].applyRootMotion = true
				arg_131_1.var_[var_134_0 .. "LipSync"] = var_134_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_134_4 = arg_131_1.actors_["10058ui_story"].transform
			local var_134_5 = 0

			if var_134_5 < arg_131_1.time_ and arg_131_1.time_ <= var_134_5 + arg_134_0 then
				arg_131_1.var_.moveOldPos10058ui_story = var_134_4.localPosition
			end

			local var_134_6 = 0.001

			if var_134_5 <= arg_131_1.time_ and arg_131_1.time_ < var_134_5 + var_134_6 then
				local var_134_7 = (arg_131_1.time_ - var_134_5) / var_134_6
				local var_134_8 = Vector3.New(0, -0.98, -6.1)

				var_134_4.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10058ui_story, var_134_8, var_134_7)

				local var_134_9 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_9.x, var_134_9.y, var_134_9.z)

				local var_134_10 = var_134_4.localEulerAngles

				var_134_10.z = 0
				var_134_10.x = 0
				var_134_4.localEulerAngles = var_134_10
			end

			if arg_131_1.time_ >= var_134_5 + var_134_6 and arg_131_1.time_ < var_134_5 + var_134_6 + arg_134_0 then
				var_134_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_134_11 = manager.ui.mainCamera.transform.position - var_134_4.position

				var_134_4.forward = Vector3.New(var_134_11.x, var_134_11.y, var_134_11.z)

				local var_134_12 = var_134_4.localEulerAngles

				var_134_12.z = 0
				var_134_12.x = 0
				var_134_4.localEulerAngles = var_134_12
			end

			local var_134_13 = arg_131_1.actors_["10058ui_story"]
			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 and arg_131_1.var_.characterEffect10058ui_story == nil then
				arg_131_1.var_.characterEffect10058ui_story = var_134_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_15 = 0.200000002980232

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_14) / var_134_15

				if arg_131_1.var_.characterEffect10058ui_story then
					arg_131_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_14 + var_134_15 and arg_131_1.time_ < var_134_14 + var_134_15 + arg_134_0 and arg_131_1.var_.characterEffect10058ui_story then
				arg_131_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_134_17 = 0

			if var_134_17 < arg_131_1.time_ and arg_131_1.time_ <= var_134_17 + arg_134_0 then
				arg_131_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_134_18 = 0

			if var_134_18 < arg_131_1.time_ and arg_131_1.time_ <= var_134_18 + arg_134_0 then
				arg_131_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_19 = 0
			local var_134_20 = 0.075

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_21 = arg_131_1:FormatText(StoryNameCfg[471].name)

				arg_131_1.leftNameTxt_.text = var_134_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_22 = arg_131_1:GetWordFromCfg(411141031)
				local var_134_23 = arg_131_1:FormatText(var_134_22.content)

				arg_131_1.text_.text = var_134_23

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_24 = 3
				local var_134_25 = utf8.len(var_134_23)
				local var_134_26 = var_134_24 <= 0 and var_134_20 or var_134_20 * (var_134_25 / var_134_24)

				if var_134_26 > 0 and var_134_20 < var_134_26 then
					arg_131_1.talkMaxDuration = var_134_26

					if var_134_26 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_26 + var_134_19
					end
				end

				arg_131_1.text_.text = var_134_23
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141031", "story_v_out_411141.awb") ~= 0 then
					local var_134_27 = manager.audio:GetVoiceLength("story_v_out_411141", "411141031", "story_v_out_411141.awb") / 1000

					if var_134_27 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_27 + var_134_19
					end

					if var_134_22.prefab_name ~= "" and arg_131_1.actors_[var_134_22.prefab_name] ~= nil then
						local var_134_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_22.prefab_name].transform, "story_v_out_411141", "411141031", "story_v_out_411141.awb")

						arg_131_1:RecordAudio("411141031", var_134_28)
						arg_131_1:RecordAudio("411141031", var_134_28)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_411141", "411141031", "story_v_out_411141.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_411141", "411141031", "story_v_out_411141.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_29 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_29 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_29

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_29 and arg_131_1.time_ < var_134_19 + var_134_29 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play411141032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 411141032
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play411141033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10058ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect10058ui_story == nil then
				arg_135_1.var_.characterEffect10058ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect10058ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10058ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect10058ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10058ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0
			local var_138_7 = 0.95

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_8 = arg_135_1:GetWordFromCfg(411141032)
				local var_138_9 = arg_135_1:FormatText(var_138_8.content)

				arg_135_1.text_.text = var_138_9

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_10 = 38
				local var_138_11 = utf8.len(var_138_9)
				local var_138_12 = var_138_10 <= 0 and var_138_7 or var_138_7 * (var_138_11 / var_138_10)

				if var_138_12 > 0 and var_138_7 < var_138_12 then
					arg_135_1.talkMaxDuration = var_138_12

					if var_138_12 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_12 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_9
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_13 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_13 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_13

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_13 and arg_135_1.time_ < var_138_6 + var_138_13 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play411141033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 411141033
		arg_139_1.duration_ = 3.6

		local var_139_0 = {
			zh = 3.6,
			ja = 3.4
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
				arg_139_0:Play411141034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = "4040ui_story"

			if arg_139_1.actors_[var_142_0] == nil then
				local var_142_1 = Object.Instantiate(Asset.Load("Char/" .. var_142_0), arg_139_1.stage_.transform)

				var_142_1.name = var_142_0
				var_142_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_139_1.actors_[var_142_0] = var_142_1

				local var_142_2 = var_142_1:GetComponentInChildren(typeof(CharacterEffect))

				var_142_2.enabled = true

				local var_142_3 = GameObjectTools.GetOrAddComponent(var_142_1, typeof(DynamicBoneHelper))

				if var_142_3 then
					var_142_3:EnableDynamicBone(false)
				end

				arg_139_1:ShowWeapon(var_142_2.transform, false)

				arg_139_1.var_[var_142_0 .. "Animator"] = var_142_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_139_1.var_[var_142_0 .. "Animator"].applyRootMotion = true
				arg_139_1.var_[var_142_0 .. "LipSync"] = var_142_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_142_4 = arg_139_1.actors_["4040ui_story"].transform
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1.var_.moveOldPos4040ui_story = var_142_4.localPosition
			end

			local var_142_6 = 0.001

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6
				local var_142_8 = Vector3.New(0, -1.55, -5.5)

				var_142_4.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos4040ui_story, var_142_8, var_142_7)

				local var_142_9 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_9.x, var_142_9.y, var_142_9.z)

				local var_142_10 = var_142_4.localEulerAngles

				var_142_10.z = 0
				var_142_10.x = 0
				var_142_4.localEulerAngles = var_142_10
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 then
				var_142_4.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_142_11 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_11.x, var_142_11.y, var_142_11.z)

				local var_142_12 = var_142_4.localEulerAngles

				var_142_12.z = 0
				var_142_12.x = 0
				var_142_4.localEulerAngles = var_142_12
			end

			local var_142_13 = arg_139_1.actors_["4040ui_story"]
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 and arg_139_1.var_.characterEffect4040ui_story == nil then
				arg_139_1.var_.characterEffect4040ui_story = var_142_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_15 = 0.200000002980232

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_15 then
				local var_142_16 = (arg_139_1.time_ - var_142_14) / var_142_15

				if arg_139_1.var_.characterEffect4040ui_story then
					arg_139_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_14 + var_142_15 and arg_139_1.time_ < var_142_14 + var_142_15 + arg_142_0 and arg_139_1.var_.characterEffect4040ui_story then
				arg_139_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_142_17 = 0

			if var_142_17 < arg_139_1.time_ and arg_139_1.time_ <= var_142_17 + arg_142_0 then
				arg_139_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_142_18 = 0

			if var_142_18 < arg_139_1.time_ and arg_139_1.time_ <= var_142_18 + arg_142_0 then
				arg_139_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_142_19 = arg_139_1.actors_["10058ui_story"].transform
			local var_142_20 = 0

			if var_142_20 < arg_139_1.time_ and arg_139_1.time_ <= var_142_20 + arg_142_0 then
				arg_139_1.var_.moveOldPos10058ui_story = var_142_19.localPosition
			end

			local var_142_21 = 0.001

			if var_142_20 <= arg_139_1.time_ and arg_139_1.time_ < var_142_20 + var_142_21 then
				local var_142_22 = (arg_139_1.time_ - var_142_20) / var_142_21
				local var_142_23 = Vector3.New(0, 100, 0)

				var_142_19.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10058ui_story, var_142_23, var_142_22)

				local var_142_24 = manager.ui.mainCamera.transform.position - var_142_19.position

				var_142_19.forward = Vector3.New(var_142_24.x, var_142_24.y, var_142_24.z)

				local var_142_25 = var_142_19.localEulerAngles

				var_142_25.z = 0
				var_142_25.x = 0
				var_142_19.localEulerAngles = var_142_25
			end

			if arg_139_1.time_ >= var_142_20 + var_142_21 and arg_139_1.time_ < var_142_20 + var_142_21 + arg_142_0 then
				var_142_19.localPosition = Vector3.New(0, 100, 0)

				local var_142_26 = manager.ui.mainCamera.transform.position - var_142_19.position

				var_142_19.forward = Vector3.New(var_142_26.x, var_142_26.y, var_142_26.z)

				local var_142_27 = var_142_19.localEulerAngles

				var_142_27.z = 0
				var_142_27.x = 0
				var_142_19.localEulerAngles = var_142_27
			end

			local var_142_28 = arg_139_1.actors_["10058ui_story"]
			local var_142_29 = 0

			if var_142_29 < arg_139_1.time_ and arg_139_1.time_ <= var_142_29 + arg_142_0 and arg_139_1.var_.characterEffect10058ui_story == nil then
				arg_139_1.var_.characterEffect10058ui_story = var_142_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_30 = 0.200000002980232

			if var_142_29 <= arg_139_1.time_ and arg_139_1.time_ < var_142_29 + var_142_30 then
				local var_142_31 = (arg_139_1.time_ - var_142_29) / var_142_30

				if arg_139_1.var_.characterEffect10058ui_story then
					local var_142_32 = Mathf.Lerp(0, 0.5, var_142_31)

					arg_139_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_139_1.var_.characterEffect10058ui_story.fillRatio = var_142_32
				end
			end

			if arg_139_1.time_ >= var_142_29 + var_142_30 and arg_139_1.time_ < var_142_29 + var_142_30 + arg_142_0 and arg_139_1.var_.characterEffect10058ui_story then
				local var_142_33 = 0.5

				arg_139_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_139_1.var_.characterEffect10058ui_story.fillRatio = var_142_33
			end

			local var_142_34 = 0
			local var_142_35 = 0.425

			if var_142_34 < arg_139_1.time_ and arg_139_1.time_ <= var_142_34 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_36 = arg_139_1:FormatText(StoryNameCfg[668].name)

				arg_139_1.leftNameTxt_.text = var_142_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_37 = arg_139_1:GetWordFromCfg(411141033)
				local var_142_38 = arg_139_1:FormatText(var_142_37.content)

				arg_139_1.text_.text = var_142_38

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_39 = 17
				local var_142_40 = utf8.len(var_142_38)
				local var_142_41 = var_142_39 <= 0 and var_142_35 or var_142_35 * (var_142_40 / var_142_39)

				if var_142_41 > 0 and var_142_35 < var_142_41 then
					arg_139_1.talkMaxDuration = var_142_41

					if var_142_41 + var_142_34 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_41 + var_142_34
					end
				end

				arg_139_1.text_.text = var_142_38
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141033", "story_v_out_411141.awb") ~= 0 then
					local var_142_42 = manager.audio:GetVoiceLength("story_v_out_411141", "411141033", "story_v_out_411141.awb") / 1000

					if var_142_42 + var_142_34 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_42 + var_142_34
					end

					if var_142_37.prefab_name ~= "" and arg_139_1.actors_[var_142_37.prefab_name] ~= nil then
						local var_142_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_37.prefab_name].transform, "story_v_out_411141", "411141033", "story_v_out_411141.awb")

						arg_139_1:RecordAudio("411141033", var_142_43)
						arg_139_1:RecordAudio("411141033", var_142_43)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_411141", "411141033", "story_v_out_411141.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_411141", "411141033", "story_v_out_411141.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_44 = math.max(var_142_35, arg_139_1.talkMaxDuration)

			if var_142_34 <= arg_139_1.time_ and arg_139_1.time_ < var_142_34 + var_142_44 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_34) / var_142_44

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_34 + var_142_44 and arg_139_1.time_ < var_142_34 + var_142_44 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play411141034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 411141034
		arg_143_1.duration_ = 1.999999999999

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play411141035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10058ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos10058ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, -0.98, -6.1)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10058ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["10058ui_story"]
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 and arg_143_1.var_.characterEffect10058ui_story == nil then
				arg_143_1.var_.characterEffect10058ui_story = var_146_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_11 = 0.200000002980232

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11

				if arg_143_1.var_.characterEffect10058ui_story then
					arg_143_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 and arg_143_1.var_.characterEffect10058ui_story then
				arg_143_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_146_13 = 0

			if var_146_13 < arg_143_1.time_ and arg_143_1.time_ <= var_146_13 + arg_146_0 then
				arg_143_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_146_15 = arg_143_1.actors_["4040ui_story"].transform
			local var_146_16 = 0

			if var_146_16 < arg_143_1.time_ and arg_143_1.time_ <= var_146_16 + arg_146_0 then
				arg_143_1.var_.moveOldPos4040ui_story = var_146_15.localPosition
			end

			local var_146_17 = 0.001

			if var_146_16 <= arg_143_1.time_ and arg_143_1.time_ < var_146_16 + var_146_17 then
				local var_146_18 = (arg_143_1.time_ - var_146_16) / var_146_17
				local var_146_19 = Vector3.New(0, 100, 0)

				var_146_15.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos4040ui_story, var_146_19, var_146_18)

				local var_146_20 = manager.ui.mainCamera.transform.position - var_146_15.position

				var_146_15.forward = Vector3.New(var_146_20.x, var_146_20.y, var_146_20.z)

				local var_146_21 = var_146_15.localEulerAngles

				var_146_21.z = 0
				var_146_21.x = 0
				var_146_15.localEulerAngles = var_146_21
			end

			if arg_143_1.time_ >= var_146_16 + var_146_17 and arg_143_1.time_ < var_146_16 + var_146_17 + arg_146_0 then
				var_146_15.localPosition = Vector3.New(0, 100, 0)

				local var_146_22 = manager.ui.mainCamera.transform.position - var_146_15.position

				var_146_15.forward = Vector3.New(var_146_22.x, var_146_22.y, var_146_22.z)

				local var_146_23 = var_146_15.localEulerAngles

				var_146_23.z = 0
				var_146_23.x = 0
				var_146_15.localEulerAngles = var_146_23
			end

			local var_146_24 = arg_143_1.actors_["4040ui_story"]
			local var_146_25 = 0

			if var_146_25 < arg_143_1.time_ and arg_143_1.time_ <= var_146_25 + arg_146_0 and arg_143_1.var_.characterEffect4040ui_story == nil then
				arg_143_1.var_.characterEffect4040ui_story = var_146_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_26 = 0.200000002980232

			if var_146_25 <= arg_143_1.time_ and arg_143_1.time_ < var_146_25 + var_146_26 then
				local var_146_27 = (arg_143_1.time_ - var_146_25) / var_146_26

				if arg_143_1.var_.characterEffect4040ui_story then
					local var_146_28 = Mathf.Lerp(0, 0.5, var_146_27)

					arg_143_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_143_1.var_.characterEffect4040ui_story.fillRatio = var_146_28
				end
			end

			if arg_143_1.time_ >= var_146_25 + var_146_26 and arg_143_1.time_ < var_146_25 + var_146_26 + arg_146_0 and arg_143_1.var_.characterEffect4040ui_story then
				local var_146_29 = 0.5

				arg_143_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_143_1.var_.characterEffect4040ui_story.fillRatio = var_146_29
			end

			local var_146_30 = 0
			local var_146_31 = 0.1

			if var_146_30 < arg_143_1.time_ and arg_143_1.time_ <= var_146_30 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_32 = arg_143_1:FormatText(StoryNameCfg[471].name)

				arg_143_1.leftNameTxt_.text = var_146_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_33 = arg_143_1:GetWordFromCfg(411141034)
				local var_146_34 = arg_143_1:FormatText(var_146_33.content)

				arg_143_1.text_.text = var_146_34

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_35 = 4
				local var_146_36 = utf8.len(var_146_34)
				local var_146_37 = var_146_35 <= 0 and var_146_31 or var_146_31 * (var_146_36 / var_146_35)

				if var_146_37 > 0 and var_146_31 < var_146_37 then
					arg_143_1.talkMaxDuration = var_146_37

					if var_146_37 + var_146_30 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_37 + var_146_30
					end
				end

				arg_143_1.text_.text = var_146_34
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141034", "story_v_out_411141.awb") ~= 0 then
					local var_146_38 = manager.audio:GetVoiceLength("story_v_out_411141", "411141034", "story_v_out_411141.awb") / 1000

					if var_146_38 + var_146_30 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_38 + var_146_30
					end

					if var_146_33.prefab_name ~= "" and arg_143_1.actors_[var_146_33.prefab_name] ~= nil then
						local var_146_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_33.prefab_name].transform, "story_v_out_411141", "411141034", "story_v_out_411141.awb")

						arg_143_1:RecordAudio("411141034", var_146_39)
						arg_143_1:RecordAudio("411141034", var_146_39)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_411141", "411141034", "story_v_out_411141.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_411141", "411141034", "story_v_out_411141.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_40 = math.max(var_146_31, arg_143_1.talkMaxDuration)

			if var_146_30 <= arg_143_1.time_ and arg_143_1.time_ < var_146_30 + var_146_40 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_30) / var_146_40

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_30 + var_146_40 and arg_143_1.time_ < var_146_30 + var_146_40 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play411141035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 411141035
		arg_147_1.duration_ = 5.1

		local var_147_0 = {
			zh = 1,
			ja = 5.1
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
				arg_147_0:Play411141036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.1

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[471].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(411141035)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 4
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141035", "story_v_out_411141.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141035", "story_v_out_411141.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_411141", "411141035", "story_v_out_411141.awb")

						arg_147_1:RecordAudio("411141035", var_150_9)
						arg_147_1:RecordAudio("411141035", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_411141", "411141035", "story_v_out_411141.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_411141", "411141035", "story_v_out_411141.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play411141036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 411141036
		arg_151_1.duration_ = 1.999999999999

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play411141037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["4040ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos4040ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos4040ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["4040ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect4040ui_story == nil then
				arg_151_1.var_.characterEffect4040ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect4040ui_story then
					arg_151_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect4040ui_story then
				arg_151_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_154_15 = arg_151_1.actors_["10058ui_story"].transform
			local var_154_16 = 0

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 then
				arg_151_1.var_.moveOldPos10058ui_story = var_154_15.localPosition
			end

			local var_154_17 = 0.001

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_17 then
				local var_154_18 = (arg_151_1.time_ - var_154_16) / var_154_17
				local var_154_19 = Vector3.New(0.7, -0.98, -6.1)

				var_154_15.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10058ui_story, var_154_19, var_154_18)

				local var_154_20 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_20.x, var_154_20.y, var_154_20.z)

				local var_154_21 = var_154_15.localEulerAngles

				var_154_21.z = 0
				var_154_21.x = 0
				var_154_15.localEulerAngles = var_154_21
			end

			if arg_151_1.time_ >= var_154_16 + var_154_17 and arg_151_1.time_ < var_154_16 + var_154_17 + arg_154_0 then
				var_154_15.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_154_22 = manager.ui.mainCamera.transform.position - var_154_15.position

				var_154_15.forward = Vector3.New(var_154_22.x, var_154_22.y, var_154_22.z)

				local var_154_23 = var_154_15.localEulerAngles

				var_154_23.z = 0
				var_154_23.x = 0
				var_154_15.localEulerAngles = var_154_23
			end

			local var_154_24 = arg_151_1.actors_["10058ui_story"]
			local var_154_25 = 0

			if var_154_25 < arg_151_1.time_ and arg_151_1.time_ <= var_154_25 + arg_154_0 and arg_151_1.var_.characterEffect10058ui_story == nil then
				arg_151_1.var_.characterEffect10058ui_story = var_154_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_26 = 0.200000002980232

			if var_154_25 <= arg_151_1.time_ and arg_151_1.time_ < var_154_25 + var_154_26 then
				local var_154_27 = (arg_151_1.time_ - var_154_25) / var_154_26

				if arg_151_1.var_.characterEffect10058ui_story then
					local var_154_28 = Mathf.Lerp(0, 0.5, var_154_27)

					arg_151_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_151_1.var_.characterEffect10058ui_story.fillRatio = var_154_28
				end
			end

			if arg_151_1.time_ >= var_154_25 + var_154_26 and arg_151_1.time_ < var_154_25 + var_154_26 + arg_154_0 and arg_151_1.var_.characterEffect10058ui_story then
				local var_154_29 = 0.5

				arg_151_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_151_1.var_.characterEffect10058ui_story.fillRatio = var_154_29
			end

			local var_154_30 = 0
			local var_154_31 = 0.05

			if var_154_30 < arg_151_1.time_ and arg_151_1.time_ <= var_154_30 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_32 = arg_151_1:FormatText(StoryNameCfg[668].name)

				arg_151_1.leftNameTxt_.text = var_154_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_33 = arg_151_1:GetWordFromCfg(411141036)
				local var_154_34 = arg_151_1:FormatText(var_154_33.content)

				arg_151_1.text_.text = var_154_34

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_35 = 2
				local var_154_36 = utf8.len(var_154_34)
				local var_154_37 = var_154_35 <= 0 and var_154_31 or var_154_31 * (var_154_36 / var_154_35)

				if var_154_37 > 0 and var_154_31 < var_154_37 then
					arg_151_1.talkMaxDuration = var_154_37

					if var_154_37 + var_154_30 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_37 + var_154_30
					end
				end

				arg_151_1.text_.text = var_154_34
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141036", "story_v_out_411141.awb") ~= 0 then
					local var_154_38 = manager.audio:GetVoiceLength("story_v_out_411141", "411141036", "story_v_out_411141.awb") / 1000

					if var_154_38 + var_154_30 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_38 + var_154_30
					end

					if var_154_33.prefab_name ~= "" and arg_151_1.actors_[var_154_33.prefab_name] ~= nil then
						local var_154_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_33.prefab_name].transform, "story_v_out_411141", "411141036", "story_v_out_411141.awb")

						arg_151_1:RecordAudio("411141036", var_154_39)
						arg_151_1:RecordAudio("411141036", var_154_39)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_411141", "411141036", "story_v_out_411141.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_411141", "411141036", "story_v_out_411141.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_40 = math.max(var_154_31, arg_151_1.talkMaxDuration)

			if var_154_30 <= arg_151_1.time_ and arg_151_1.time_ < var_154_30 + var_154_40 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_30) / var_154_40

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_30 + var_154_40 and arg_151_1.time_ < var_154_30 + var_154_40 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play411141037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 411141037
		arg_155_1.duration_ = 1.6

		local var_155_0 = {
			zh = 1.2,
			ja = 1.6
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
				arg_155_0:Play411141038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.125

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[668].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(411141037)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141037", "story_v_out_411141.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141037", "story_v_out_411141.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_411141", "411141037", "story_v_out_411141.awb")

						arg_155_1:RecordAudio("411141037", var_158_9)
						arg_155_1:RecordAudio("411141037", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_411141", "411141037", "story_v_out_411141.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_411141", "411141037", "story_v_out_411141.awb")
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
	Play411141038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 411141038
		arg_159_1.duration_ = 4.533

		local var_159_0 = {
			zh = 3.066,
			ja = 4.533
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
				arg_159_0:Play411141039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10058ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10058ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(0.7, -0.98, -6.1)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10058ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["10058ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect10058ui_story == nil then
				arg_159_1.var_.characterEffect10058ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect10058ui_story then
					arg_159_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect10058ui_story then
				arg_159_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_162_13 = 0

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_162_15 = arg_159_1.actors_["4040ui_story"]
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 and arg_159_1.var_.characterEffect4040ui_story == nil then
				arg_159_1.var_.characterEffect4040ui_story = var_162_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_17 = 0.200000002980232

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17

				if arg_159_1.var_.characterEffect4040ui_story then
					local var_162_19 = Mathf.Lerp(0, 0.5, var_162_18)

					arg_159_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_159_1.var_.characterEffect4040ui_story.fillRatio = var_162_19
				end
			end

			if arg_159_1.time_ >= var_162_16 + var_162_17 and arg_159_1.time_ < var_162_16 + var_162_17 + arg_162_0 and arg_159_1.var_.characterEffect4040ui_story then
				local var_162_20 = 0.5

				arg_159_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_159_1.var_.characterEffect4040ui_story.fillRatio = var_162_20
			end

			local var_162_21 = 0
			local var_162_22 = 0.275

			if var_162_21 < arg_159_1.time_ and arg_159_1.time_ <= var_162_21 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_23 = arg_159_1:FormatText(StoryNameCfg[471].name)

				arg_159_1.leftNameTxt_.text = var_162_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_24 = arg_159_1:GetWordFromCfg(411141038)
				local var_162_25 = arg_159_1:FormatText(var_162_24.content)

				arg_159_1.text_.text = var_162_25

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_26 = 11
				local var_162_27 = utf8.len(var_162_25)
				local var_162_28 = var_162_26 <= 0 and var_162_22 or var_162_22 * (var_162_27 / var_162_26)

				if var_162_28 > 0 and var_162_22 < var_162_28 then
					arg_159_1.talkMaxDuration = var_162_28

					if var_162_28 + var_162_21 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_28 + var_162_21
					end
				end

				arg_159_1.text_.text = var_162_25
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141038", "story_v_out_411141.awb") ~= 0 then
					local var_162_29 = manager.audio:GetVoiceLength("story_v_out_411141", "411141038", "story_v_out_411141.awb") / 1000

					if var_162_29 + var_162_21 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_29 + var_162_21
					end

					if var_162_24.prefab_name ~= "" and arg_159_1.actors_[var_162_24.prefab_name] ~= nil then
						local var_162_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_24.prefab_name].transform, "story_v_out_411141", "411141038", "story_v_out_411141.awb")

						arg_159_1:RecordAudio("411141038", var_162_30)
						arg_159_1:RecordAudio("411141038", var_162_30)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_411141", "411141038", "story_v_out_411141.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_411141", "411141038", "story_v_out_411141.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_31 = math.max(var_162_22, arg_159_1.talkMaxDuration)

			if var_162_21 <= arg_159_1.time_ and arg_159_1.time_ < var_162_21 + var_162_31 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_21) / var_162_31

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_21 + var_162_31 and arg_159_1.time_ < var_162_21 + var_162_31 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play411141039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 411141039
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play411141040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10058ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect10058ui_story == nil then
				arg_163_1.var_.characterEffect10058ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect10058ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_163_1.var_.characterEffect10058ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect10058ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_163_1.var_.characterEffect10058ui_story.fillRatio = var_166_5
			end

			local var_166_6 = 0
			local var_166_7 = 0.625

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_8 = arg_163_1:GetWordFromCfg(411141039)
				local var_166_9 = arg_163_1:FormatText(var_166_8.content)

				arg_163_1.text_.text = var_166_9

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_10 = 25
				local var_166_11 = utf8.len(var_166_9)
				local var_166_12 = var_166_10 <= 0 and var_166_7 or var_166_7 * (var_166_11 / var_166_10)

				if var_166_12 > 0 and var_166_7 < var_166_12 then
					arg_163_1.talkMaxDuration = var_166_12

					if var_166_12 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_12 + var_166_6
					end
				end

				arg_163_1.text_.text = var_166_9
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_13 = math.max(var_166_7, arg_163_1.talkMaxDuration)

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_13 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_6) / var_166_13

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_6 + var_166_13 and arg_163_1.time_ < var_166_6 + var_166_13 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play411141040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 411141040
		arg_167_1.duration_ = 4.2

		local var_167_0 = {
			zh = 2.1,
			ja = 4.2
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
				arg_167_0:Play411141041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_170_1 = 0
			local var_170_2 = 0.225

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_3 = arg_167_1:FormatText(StoryNameCfg[471].name)

				arg_167_1.leftNameTxt_.text = var_170_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_4 = arg_167_1:GetWordFromCfg(411141040)
				local var_170_5 = arg_167_1:FormatText(var_170_4.content)

				arg_167_1.text_.text = var_170_5

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_6 = 9
				local var_170_7 = utf8.len(var_170_5)
				local var_170_8 = var_170_6 <= 0 and var_170_2 or var_170_2 * (var_170_7 / var_170_6)

				if var_170_8 > 0 and var_170_2 < var_170_8 then
					arg_167_1.talkMaxDuration = var_170_8

					if var_170_8 + var_170_1 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_1
					end
				end

				arg_167_1.text_.text = var_170_5
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141040", "story_v_out_411141.awb") ~= 0 then
					local var_170_9 = manager.audio:GetVoiceLength("story_v_out_411141", "411141040", "story_v_out_411141.awb") / 1000

					if var_170_9 + var_170_1 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_9 + var_170_1
					end

					if var_170_4.prefab_name ~= "" and arg_167_1.actors_[var_170_4.prefab_name] ~= nil then
						local var_170_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_4.prefab_name].transform, "story_v_out_411141", "411141040", "story_v_out_411141.awb")

						arg_167_1:RecordAudio("411141040", var_170_10)
						arg_167_1:RecordAudio("411141040", var_170_10)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_411141", "411141040", "story_v_out_411141.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_411141", "411141040", "story_v_out_411141.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_11 = math.max(var_170_2, arg_167_1.talkMaxDuration)

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_11 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_1) / var_170_11

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_1 + var_170_11 and arg_167_1.time_ < var_170_1 + var_170_11 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play411141041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 411141041
		arg_171_1.duration_ = 3.9

		local var_171_0 = {
			zh = 2.3,
			ja = 3.9
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
				arg_171_0:Play411141042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10058ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect10058ui_story == nil then
				arg_171_1.var_.characterEffect10058ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect10058ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_171_1.var_.characterEffect10058ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect10058ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_171_1.var_.characterEffect10058ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["4040ui_story"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.characterEffect4040ui_story == nil then
				arg_171_1.var_.characterEffect4040ui_story = var_174_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_8 = 0.200000002980232

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.characterEffect4040ui_story then
					arg_171_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.characterEffect4040ui_story then
				arg_171_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_174_11 = 0

			if var_174_11 < arg_171_1.time_ and arg_171_1.time_ <= var_174_11 + arg_174_0 then
				arg_171_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_12 = 0
			local var_174_13 = 0.225

			if var_174_12 < arg_171_1.time_ and arg_171_1.time_ <= var_174_12 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_14 = arg_171_1:FormatText(StoryNameCfg[668].name)

				arg_171_1.leftNameTxt_.text = var_174_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_15 = arg_171_1:GetWordFromCfg(411141041)
				local var_174_16 = arg_171_1:FormatText(var_174_15.content)

				arg_171_1.text_.text = var_174_16

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_17 = 9
				local var_174_18 = utf8.len(var_174_16)
				local var_174_19 = var_174_17 <= 0 and var_174_13 or var_174_13 * (var_174_18 / var_174_17)

				if var_174_19 > 0 and var_174_13 < var_174_19 then
					arg_171_1.talkMaxDuration = var_174_19

					if var_174_19 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_19 + var_174_12
					end
				end

				arg_171_1.text_.text = var_174_16
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141041", "story_v_out_411141.awb") ~= 0 then
					local var_174_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141041", "story_v_out_411141.awb") / 1000

					if var_174_20 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_12
					end

					if var_174_15.prefab_name ~= "" and arg_171_1.actors_[var_174_15.prefab_name] ~= nil then
						local var_174_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_15.prefab_name].transform, "story_v_out_411141", "411141041", "story_v_out_411141.awb")

						arg_171_1:RecordAudio("411141041", var_174_21)
						arg_171_1:RecordAudio("411141041", var_174_21)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_411141", "411141041", "story_v_out_411141.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_411141", "411141041", "story_v_out_411141.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_22 = math.max(var_174_13, arg_171_1.talkMaxDuration)

			if var_174_12 <= arg_171_1.time_ and arg_171_1.time_ < var_174_12 + var_174_22 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_12) / var_174_22

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_12 + var_174_22 and arg_171_1.time_ < var_174_12 + var_174_22 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play411141042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 411141042
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play411141043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["4040ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect4040ui_story == nil then
				arg_175_1.var_.characterEffect4040ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect4040ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_175_1.var_.characterEffect4040ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect4040ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_175_1.var_.characterEffect4040ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0
			local var_178_7 = 0.925

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_8 = arg_175_1:GetWordFromCfg(411141042)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 37
				local var_178_11 = utf8.len(var_178_9)
				local var_178_12 = var_178_10 <= 0 and var_178_7 or var_178_7 * (var_178_11 / var_178_10)

				if var_178_12 > 0 and var_178_7 < var_178_12 then
					arg_175_1.talkMaxDuration = var_178_12

					if var_178_12 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_12 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_9
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_13 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_13 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_13

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_13 and arg_175_1.time_ < var_178_6 + var_178_13 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play411141043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 411141043
		arg_179_1.duration_ = 3.466

		local var_179_0 = {
			zh = 2.9,
			ja = 3.466
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play411141044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["4040ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect4040ui_story == nil then
				arg_179_1.var_.characterEffect4040ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect4040ui_story then
					arg_179_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect4040ui_story then
				arg_179_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_182_4 = 0
			local var_182_5 = 0.225

			if var_182_4 < arg_179_1.time_ and arg_179_1.time_ <= var_182_4 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_6 = arg_179_1:FormatText(StoryNameCfg[668].name)

				arg_179_1.leftNameTxt_.text = var_182_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_7 = arg_179_1:GetWordFromCfg(411141043)
				local var_182_8 = arg_179_1:FormatText(var_182_7.content)

				arg_179_1.text_.text = var_182_8

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_9 = 9
				local var_182_10 = utf8.len(var_182_8)
				local var_182_11 = var_182_9 <= 0 and var_182_5 or var_182_5 * (var_182_10 / var_182_9)

				if var_182_11 > 0 and var_182_5 < var_182_11 then
					arg_179_1.talkMaxDuration = var_182_11

					if var_182_11 + var_182_4 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_11 + var_182_4
					end
				end

				arg_179_1.text_.text = var_182_8
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141043", "story_v_out_411141.awb") ~= 0 then
					local var_182_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141043", "story_v_out_411141.awb") / 1000

					if var_182_12 + var_182_4 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_12 + var_182_4
					end

					if var_182_7.prefab_name ~= "" and arg_179_1.actors_[var_182_7.prefab_name] ~= nil then
						local var_182_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_7.prefab_name].transform, "story_v_out_411141", "411141043", "story_v_out_411141.awb")

						arg_179_1:RecordAudio("411141043", var_182_13)
						arg_179_1:RecordAudio("411141043", var_182_13)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_411141", "411141043", "story_v_out_411141.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_411141", "411141043", "story_v_out_411141.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_14 = math.max(var_182_5, arg_179_1.talkMaxDuration)

			if var_182_4 <= arg_179_1.time_ and arg_179_1.time_ < var_182_4 + var_182_14 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_4) / var_182_14

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_4 + var_182_14 and arg_179_1.time_ < var_182_4 + var_182_14 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play411141044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 411141044
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play411141045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["4040ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect4040ui_story == nil then
				arg_183_1.var_.characterEffect4040ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect4040ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_183_1.var_.characterEffect4040ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect4040ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_183_1.var_.characterEffect4040ui_story.fillRatio = var_186_5
			end

			local var_186_6 = 0

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 then
				arg_183_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_8 = 0
			local var_186_9 = 1.15

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_10 = arg_183_1:GetWordFromCfg(411141044)
				local var_186_11 = arg_183_1:FormatText(var_186_10.content)

				arg_183_1.text_.text = var_186_11

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_12 = 46
				local var_186_13 = utf8.len(var_186_11)
				local var_186_14 = var_186_12 <= 0 and var_186_9 or var_186_9 * (var_186_13 / var_186_12)

				if var_186_14 > 0 and var_186_9 < var_186_14 then
					arg_183_1.talkMaxDuration = var_186_14

					if var_186_14 + var_186_8 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_14 + var_186_8
					end
				end

				arg_183_1.text_.text = var_186_11
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_15 = math.max(var_186_9, arg_183_1.talkMaxDuration)

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_15 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_8) / var_186_15

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_8 + var_186_15 and arg_183_1.time_ < var_186_8 + var_186_15 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play411141045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 411141045
		arg_187_1.duration_ = 2.533

		local var_187_0 = {
			zh = 1.7,
			ja = 2.533
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
				arg_187_0:Play411141046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10058ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect10058ui_story == nil then
				arg_187_1.var_.characterEffect10058ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect10058ui_story then
					arg_187_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect10058ui_story then
				arg_187_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_190_4 = 0
			local var_190_5 = 0.2

			if var_190_4 < arg_187_1.time_ and arg_187_1.time_ <= var_190_4 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_6 = arg_187_1:FormatText(StoryNameCfg[471].name)

				arg_187_1.leftNameTxt_.text = var_190_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_7 = arg_187_1:GetWordFromCfg(411141045)
				local var_190_8 = arg_187_1:FormatText(var_190_7.content)

				arg_187_1.text_.text = var_190_8

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_9 = 8
				local var_190_10 = utf8.len(var_190_8)
				local var_190_11 = var_190_9 <= 0 and var_190_5 or var_190_5 * (var_190_10 / var_190_9)

				if var_190_11 > 0 and var_190_5 < var_190_11 then
					arg_187_1.talkMaxDuration = var_190_11

					if var_190_11 + var_190_4 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_11 + var_190_4
					end
				end

				arg_187_1.text_.text = var_190_8
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141045", "story_v_out_411141.awb") ~= 0 then
					local var_190_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141045", "story_v_out_411141.awb") / 1000

					if var_190_12 + var_190_4 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_12 + var_190_4
					end

					if var_190_7.prefab_name ~= "" and arg_187_1.actors_[var_190_7.prefab_name] ~= nil then
						local var_190_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_7.prefab_name].transform, "story_v_out_411141", "411141045", "story_v_out_411141.awb")

						arg_187_1:RecordAudio("411141045", var_190_13)
						arg_187_1:RecordAudio("411141045", var_190_13)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_411141", "411141045", "story_v_out_411141.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_411141", "411141045", "story_v_out_411141.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_14 = math.max(var_190_5, arg_187_1.talkMaxDuration)

			if var_190_4 <= arg_187_1.time_ and arg_187_1.time_ < var_190_4 + var_190_14 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_4) / var_190_14

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_4 + var_190_14 and arg_187_1.time_ < var_190_4 + var_190_14 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play411141046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 411141046
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play411141047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10058ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect10058ui_story == nil then
				arg_191_1.var_.characterEffect10058ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect10058ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_191_1.var_.characterEffect10058ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect10058ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_191_1.var_.characterEffect10058ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.45

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_8 = arg_191_1:GetWordFromCfg(411141046)
				local var_194_9 = arg_191_1:FormatText(var_194_8.content)

				arg_191_1.text_.text = var_194_9

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_10 = 18
				local var_194_11 = utf8.len(var_194_9)
				local var_194_12 = var_194_10 <= 0 and var_194_7 or var_194_7 * (var_194_11 / var_194_10)

				if var_194_12 > 0 and var_194_7 < var_194_12 then
					arg_191_1.talkMaxDuration = var_194_12

					if var_194_12 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_12 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_9
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_13 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_13 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_13

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_13 and arg_191_1.time_ < var_194_6 + var_194_13 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play411141047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 411141047
		arg_195_1.duration_ = 3.366

		local var_195_0 = {
			zh = 3.366,
			ja = 2.633
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
				arg_195_0:Play411141048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10058ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect10058ui_story == nil then
				arg_195_1.var_.characterEffect10058ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect10058ui_story then
					arg_195_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect10058ui_story then
				arg_195_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_198_4 = 0
			local var_198_5 = 0.35

			if var_198_4 < arg_195_1.time_ and arg_195_1.time_ <= var_198_4 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_6 = arg_195_1:FormatText(StoryNameCfg[471].name)

				arg_195_1.leftNameTxt_.text = var_198_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_7 = arg_195_1:GetWordFromCfg(411141047)
				local var_198_8 = arg_195_1:FormatText(var_198_7.content)

				arg_195_1.text_.text = var_198_8

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_9 = 14
				local var_198_10 = utf8.len(var_198_8)
				local var_198_11 = var_198_9 <= 0 and var_198_5 or var_198_5 * (var_198_10 / var_198_9)

				if var_198_11 > 0 and var_198_5 < var_198_11 then
					arg_195_1.talkMaxDuration = var_198_11

					if var_198_11 + var_198_4 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_11 + var_198_4
					end
				end

				arg_195_1.text_.text = var_198_8
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141047", "story_v_out_411141.awb") ~= 0 then
					local var_198_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141047", "story_v_out_411141.awb") / 1000

					if var_198_12 + var_198_4 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_12 + var_198_4
					end

					if var_198_7.prefab_name ~= "" and arg_195_1.actors_[var_198_7.prefab_name] ~= nil then
						local var_198_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_7.prefab_name].transform, "story_v_out_411141", "411141047", "story_v_out_411141.awb")

						arg_195_1:RecordAudio("411141047", var_198_13)
						arg_195_1:RecordAudio("411141047", var_198_13)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_411141", "411141047", "story_v_out_411141.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_411141", "411141047", "story_v_out_411141.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_14 = math.max(var_198_5, arg_195_1.talkMaxDuration)

			if var_198_4 <= arg_195_1.time_ and arg_195_1.time_ < var_198_4 + var_198_14 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_4) / var_198_14

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_4 + var_198_14 and arg_195_1.time_ < var_198_4 + var_198_14 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play411141048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 411141048
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play411141049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10058ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect10058ui_story == nil then
				arg_199_1.var_.characterEffect10058ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect10058ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_199_1.var_.characterEffect10058ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect10058ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_199_1.var_.characterEffect10058ui_story.fillRatio = var_202_5
			end

			local var_202_6 = 0
			local var_202_7 = 0.625

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_8 = arg_199_1:GetWordFromCfg(411141048)
				local var_202_9 = arg_199_1:FormatText(var_202_8.content)

				arg_199_1.text_.text = var_202_9

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_10 = 25
				local var_202_11 = utf8.len(var_202_9)
				local var_202_12 = var_202_10 <= 0 and var_202_7 or var_202_7 * (var_202_11 / var_202_10)

				if var_202_12 > 0 and var_202_7 < var_202_12 then
					arg_199_1.talkMaxDuration = var_202_12

					if var_202_12 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_12 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_9
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_13 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_13 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_13

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_13 and arg_199_1.time_ < var_202_6 + var_202_13 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play411141049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 411141049
		arg_203_1.duration_ = 4.333

		local var_203_0 = {
			zh = 4.333,
			ja = 3.8
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
				arg_203_0:Play411141050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10058ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect10058ui_story == nil then
				arg_203_1.var_.characterEffect10058ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect10058ui_story then
					arg_203_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect10058ui_story then
				arg_203_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_206_4 = 0
			local var_206_5 = 0.475

			if var_206_4 < arg_203_1.time_ and arg_203_1.time_ <= var_206_4 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_6 = arg_203_1:FormatText(StoryNameCfg[471].name)

				arg_203_1.leftNameTxt_.text = var_206_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_7 = arg_203_1:GetWordFromCfg(411141049)
				local var_206_8 = arg_203_1:FormatText(var_206_7.content)

				arg_203_1.text_.text = var_206_8

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_9 = 19
				local var_206_10 = utf8.len(var_206_8)
				local var_206_11 = var_206_9 <= 0 and var_206_5 or var_206_5 * (var_206_10 / var_206_9)

				if var_206_11 > 0 and var_206_5 < var_206_11 then
					arg_203_1.talkMaxDuration = var_206_11

					if var_206_11 + var_206_4 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_11 + var_206_4
					end
				end

				arg_203_1.text_.text = var_206_8
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141049", "story_v_out_411141.awb") ~= 0 then
					local var_206_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141049", "story_v_out_411141.awb") / 1000

					if var_206_12 + var_206_4 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_12 + var_206_4
					end

					if var_206_7.prefab_name ~= "" and arg_203_1.actors_[var_206_7.prefab_name] ~= nil then
						local var_206_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_7.prefab_name].transform, "story_v_out_411141", "411141049", "story_v_out_411141.awb")

						arg_203_1:RecordAudio("411141049", var_206_13)
						arg_203_1:RecordAudio("411141049", var_206_13)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_411141", "411141049", "story_v_out_411141.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_411141", "411141049", "story_v_out_411141.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_14 = math.max(var_206_5, arg_203_1.talkMaxDuration)

			if var_206_4 <= arg_203_1.time_ and arg_203_1.time_ < var_206_4 + var_206_14 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_4) / var_206_14

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_4 + var_206_14 and arg_203_1.time_ < var_206_4 + var_206_14 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play411141050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 411141050
		arg_207_1.duration_ = 3.766

		local var_207_0 = {
			zh = 1.999999999999,
			ja = 3.766
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
				arg_207_0:Play411141051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["4040ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos4040ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -1.55, -5.5)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos4040ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -1.55, -5.5)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["4040ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect4040ui_story == nil then
				arg_207_1.var_.characterEffect4040ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect4040ui_story then
					arg_207_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect4040ui_story then
				arg_207_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_210_13 = 0

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_210_15 = arg_207_1.actors_["10058ui_story"].transform
			local var_210_16 = 0

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 then
				arg_207_1.var_.moveOldPos10058ui_story = var_210_15.localPosition
			end

			local var_210_17 = 0.001

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_16) / var_210_17
				local var_210_19 = Vector3.New(0.7, -0.98, -6.1)

				var_210_15.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10058ui_story, var_210_19, var_210_18)

				local var_210_20 = manager.ui.mainCamera.transform.position - var_210_15.position

				var_210_15.forward = Vector3.New(var_210_20.x, var_210_20.y, var_210_20.z)

				local var_210_21 = var_210_15.localEulerAngles

				var_210_21.z = 0
				var_210_21.x = 0
				var_210_15.localEulerAngles = var_210_21
			end

			if arg_207_1.time_ >= var_210_16 + var_210_17 and arg_207_1.time_ < var_210_16 + var_210_17 + arg_210_0 then
				var_210_15.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_210_22 = manager.ui.mainCamera.transform.position - var_210_15.position

				var_210_15.forward = Vector3.New(var_210_22.x, var_210_22.y, var_210_22.z)

				local var_210_23 = var_210_15.localEulerAngles

				var_210_23.z = 0
				var_210_23.x = 0
				var_210_15.localEulerAngles = var_210_23
			end

			local var_210_24 = arg_207_1.actors_["10058ui_story"]
			local var_210_25 = 0

			if var_210_25 < arg_207_1.time_ and arg_207_1.time_ <= var_210_25 + arg_210_0 and arg_207_1.var_.characterEffect10058ui_story == nil then
				arg_207_1.var_.characterEffect10058ui_story = var_210_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_26 = 0.200000002980232

			if var_210_25 <= arg_207_1.time_ and arg_207_1.time_ < var_210_25 + var_210_26 then
				local var_210_27 = (arg_207_1.time_ - var_210_25) / var_210_26

				if arg_207_1.var_.characterEffect10058ui_story then
					local var_210_28 = Mathf.Lerp(0, 0.5, var_210_27)

					arg_207_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_207_1.var_.characterEffect10058ui_story.fillRatio = var_210_28
				end
			end

			if arg_207_1.time_ >= var_210_25 + var_210_26 and arg_207_1.time_ < var_210_25 + var_210_26 + arg_210_0 and arg_207_1.var_.characterEffect10058ui_story then
				local var_210_29 = 0.5

				arg_207_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_207_1.var_.characterEffect10058ui_story.fillRatio = var_210_29
			end

			local var_210_30 = 0
			local var_210_31 = 0.15

			if var_210_30 < arg_207_1.time_ and arg_207_1.time_ <= var_210_30 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_32 = arg_207_1:FormatText(StoryNameCfg[668].name)

				arg_207_1.leftNameTxt_.text = var_210_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_33 = arg_207_1:GetWordFromCfg(411141050)
				local var_210_34 = arg_207_1:FormatText(var_210_33.content)

				arg_207_1.text_.text = var_210_34

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_35 = 6
				local var_210_36 = utf8.len(var_210_34)
				local var_210_37 = var_210_35 <= 0 and var_210_31 or var_210_31 * (var_210_36 / var_210_35)

				if var_210_37 > 0 and var_210_31 < var_210_37 then
					arg_207_1.talkMaxDuration = var_210_37

					if var_210_37 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_37 + var_210_30
					end
				end

				arg_207_1.text_.text = var_210_34
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141050", "story_v_out_411141.awb") ~= 0 then
					local var_210_38 = manager.audio:GetVoiceLength("story_v_out_411141", "411141050", "story_v_out_411141.awb") / 1000

					if var_210_38 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_38 + var_210_30
					end

					if var_210_33.prefab_name ~= "" and arg_207_1.actors_[var_210_33.prefab_name] ~= nil then
						local var_210_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_33.prefab_name].transform, "story_v_out_411141", "411141050", "story_v_out_411141.awb")

						arg_207_1:RecordAudio("411141050", var_210_39)
						arg_207_1:RecordAudio("411141050", var_210_39)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_411141", "411141050", "story_v_out_411141.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_411141", "411141050", "story_v_out_411141.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_40 = math.max(var_210_31, arg_207_1.talkMaxDuration)

			if var_210_30 <= arg_207_1.time_ and arg_207_1.time_ < var_210_30 + var_210_40 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_30) / var_210_40

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_30 + var_210_40 and arg_207_1.time_ < var_210_30 + var_210_40 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play411141051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 411141051
		arg_211_1.duration_ = 1.999999999999

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play411141052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["4040ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect4040ui_story == nil then
				arg_211_1.var_.characterEffect4040ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect4040ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_211_1.var_.characterEffect4040ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect4040ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_211_1.var_.characterEffect4040ui_story.fillRatio = var_214_5
			end

			local var_214_6 = arg_211_1.actors_["10058ui_story"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect10058ui_story == nil then
				arg_211_1.var_.characterEffect10058ui_story = var_214_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_8 = 0.200000002980232

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.characterEffect10058ui_story then
					arg_211_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect10058ui_story then
				arg_211_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_214_11 = 0

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_214_12 = 0
			local var_214_13 = 0.075

			if var_214_12 < arg_211_1.time_ and arg_211_1.time_ <= var_214_12 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_14 = arg_211_1:FormatText(StoryNameCfg[471].name)

				arg_211_1.leftNameTxt_.text = var_214_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_15 = arg_211_1:GetWordFromCfg(411141051)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 3
				local var_214_18 = utf8.len(var_214_16)
				local var_214_19 = var_214_17 <= 0 and var_214_13 or var_214_13 * (var_214_18 / var_214_17)

				if var_214_19 > 0 and var_214_13 < var_214_19 then
					arg_211_1.talkMaxDuration = var_214_19

					if var_214_19 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_12
					end
				end

				arg_211_1.text_.text = var_214_16
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141051", "story_v_out_411141.awb") ~= 0 then
					local var_214_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141051", "story_v_out_411141.awb") / 1000

					if var_214_20 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_20 + var_214_12
					end

					if var_214_15.prefab_name ~= "" and arg_211_1.actors_[var_214_15.prefab_name] ~= nil then
						local var_214_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_15.prefab_name].transform, "story_v_out_411141", "411141051", "story_v_out_411141.awb")

						arg_211_1:RecordAudio("411141051", var_214_21)
						arg_211_1:RecordAudio("411141051", var_214_21)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_411141", "411141051", "story_v_out_411141.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_411141", "411141051", "story_v_out_411141.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_22 = math.max(var_214_13, arg_211_1.talkMaxDuration)

			if var_214_12 <= arg_211_1.time_ and arg_211_1.time_ < var_214_12 + var_214_22 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_12) / var_214_22

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_12 + var_214_22 and arg_211_1.time_ < var_214_12 + var_214_22 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play411141052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 411141052
		arg_215_1.duration_ = 3.533

		local var_215_0 = {
			zh = 3.533,
			ja = 3.266
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
				arg_215_0:Play411141053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.475

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[471].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(411141052)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141052", "story_v_out_411141.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141052", "story_v_out_411141.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_411141", "411141052", "story_v_out_411141.awb")

						arg_215_1:RecordAudio("411141052", var_218_9)
						arg_215_1:RecordAudio("411141052", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_411141", "411141052", "story_v_out_411141.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_411141", "411141052", "story_v_out_411141.awb")
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
	Play411141053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 411141053
		arg_219_1.duration_ = 2.7

		local var_219_0 = {
			zh = 2.566,
			ja = 2.7
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
				arg_219_0:Play411141054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10058ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect10058ui_story == nil then
				arg_219_1.var_.characterEffect10058ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.200000002980232

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect10058ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_219_1.var_.characterEffect10058ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect10058ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_219_1.var_.characterEffect10058ui_story.fillRatio = var_222_5
			end

			local var_222_6 = arg_219_1.actors_["4040ui_story"]
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 and arg_219_1.var_.characterEffect4040ui_story == nil then
				arg_219_1.var_.characterEffect4040ui_story = var_222_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_8 = 0.200000002980232

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8

				if arg_219_1.var_.characterEffect4040ui_story then
					arg_219_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 and arg_219_1.var_.characterEffect4040ui_story then
				arg_219_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 then
				arg_219_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_222_11 = 0

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_2")
			end

			local var_222_12 = 0
			local var_222_13 = 0.15

			if var_222_12 < arg_219_1.time_ and arg_219_1.time_ <= var_222_12 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_14 = arg_219_1:FormatText(StoryNameCfg[668].name)

				arg_219_1.leftNameTxt_.text = var_222_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_15 = arg_219_1:GetWordFromCfg(411141053)
				local var_222_16 = arg_219_1:FormatText(var_222_15.content)

				arg_219_1.text_.text = var_222_16

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_17 = 6
				local var_222_18 = utf8.len(var_222_16)
				local var_222_19 = var_222_17 <= 0 and var_222_13 or var_222_13 * (var_222_18 / var_222_17)

				if var_222_19 > 0 and var_222_13 < var_222_19 then
					arg_219_1.talkMaxDuration = var_222_19

					if var_222_19 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_12
					end
				end

				arg_219_1.text_.text = var_222_16
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141053", "story_v_out_411141.awb") ~= 0 then
					local var_222_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141053", "story_v_out_411141.awb") / 1000

					if var_222_20 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_12
					end

					if var_222_15.prefab_name ~= "" and arg_219_1.actors_[var_222_15.prefab_name] ~= nil then
						local var_222_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_15.prefab_name].transform, "story_v_out_411141", "411141053", "story_v_out_411141.awb")

						arg_219_1:RecordAudio("411141053", var_222_21)
						arg_219_1:RecordAudio("411141053", var_222_21)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_411141", "411141053", "story_v_out_411141.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_411141", "411141053", "story_v_out_411141.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_22 = math.max(var_222_13, arg_219_1.talkMaxDuration)

			if var_222_12 <= arg_219_1.time_ and arg_219_1.time_ < var_222_12 + var_222_22 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_12) / var_222_22

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_12 + var_222_22 and arg_219_1.time_ < var_222_12 + var_222_22 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play411141054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 411141054
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play411141055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["4040ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect4040ui_story == nil then
				arg_223_1.var_.characterEffect4040ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect4040ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_223_1.var_.characterEffect4040ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect4040ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_223_1.var_.characterEffect4040ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.775

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_8 = arg_223_1:GetWordFromCfg(411141054)
				local var_226_9 = arg_223_1:FormatText(var_226_8.content)

				arg_223_1.text_.text = var_226_9

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_10 = 28
				local var_226_11 = utf8.len(var_226_9)
				local var_226_12 = var_226_10 <= 0 and var_226_7 or var_226_7 * (var_226_11 / var_226_10)

				if var_226_12 > 0 and var_226_7 < var_226_12 then
					arg_223_1.talkMaxDuration = var_226_12

					if var_226_12 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_12 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_9
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_13 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_13 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_13

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_13 and arg_223_1.time_ < var_226_6 + var_226_13 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play411141055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 411141055
		arg_227_1.duration_ = 7.466

		local var_227_0 = {
			zh = 5.5,
			ja = 7.466
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
				arg_227_0:Play411141056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["4040ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect4040ui_story == nil then
				arg_227_1.var_.characterEffect4040ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect4040ui_story then
					arg_227_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect4040ui_story then
				arg_227_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_230_4 = 0

			if var_230_4 < arg_227_1.time_ and arg_227_1.time_ <= var_230_4 + arg_230_0 then
				arg_227_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_230_5 = 0
			local var_230_6 = 0.6

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_7 = arg_227_1:FormatText(StoryNameCfg[668].name)

				arg_227_1.leftNameTxt_.text = var_230_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_8 = arg_227_1:GetWordFromCfg(411141055)
				local var_230_9 = arg_227_1:FormatText(var_230_8.content)

				arg_227_1.text_.text = var_230_9

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_10 = 24
				local var_230_11 = utf8.len(var_230_9)
				local var_230_12 = var_230_10 <= 0 and var_230_6 or var_230_6 * (var_230_11 / var_230_10)

				if var_230_12 > 0 and var_230_6 < var_230_12 then
					arg_227_1.talkMaxDuration = var_230_12

					if var_230_12 + var_230_5 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_12 + var_230_5
					end
				end

				arg_227_1.text_.text = var_230_9
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141055", "story_v_out_411141.awb") ~= 0 then
					local var_230_13 = manager.audio:GetVoiceLength("story_v_out_411141", "411141055", "story_v_out_411141.awb") / 1000

					if var_230_13 + var_230_5 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_13 + var_230_5
					end

					if var_230_8.prefab_name ~= "" and arg_227_1.actors_[var_230_8.prefab_name] ~= nil then
						local var_230_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_8.prefab_name].transform, "story_v_out_411141", "411141055", "story_v_out_411141.awb")

						arg_227_1:RecordAudio("411141055", var_230_14)
						arg_227_1:RecordAudio("411141055", var_230_14)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_411141", "411141055", "story_v_out_411141.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_411141", "411141055", "story_v_out_411141.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_15 = math.max(var_230_6, arg_227_1.talkMaxDuration)

			if var_230_5 <= arg_227_1.time_ and arg_227_1.time_ < var_230_5 + var_230_15 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_5) / var_230_15

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_5 + var_230_15 and arg_227_1.time_ < var_230_5 + var_230_15 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play411141056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 411141056
		arg_231_1.duration_ = 2.46633333333333

		local var_231_0 = {
			zh = 2.03333333333333,
			ja = 2.46633333333333
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
				arg_231_0:Play411141057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10058ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect10058ui_story == nil then
				arg_231_1.var_.characterEffect10058ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect10058ui_story then
					arg_231_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect10058ui_story then
				arg_231_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_234_4 = arg_231_1.actors_["4040ui_story"]
			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 and arg_231_1.var_.characterEffect4040ui_story == nil then
				arg_231_1.var_.characterEffect4040ui_story = var_234_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_6 = 0.200000002980232

			if var_234_5 <= arg_231_1.time_ and arg_231_1.time_ < var_234_5 + var_234_6 then
				local var_234_7 = (arg_231_1.time_ - var_234_5) / var_234_6

				if arg_231_1.var_.characterEffect4040ui_story then
					local var_234_8 = Mathf.Lerp(0, 0.5, var_234_7)

					arg_231_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_231_1.var_.characterEffect4040ui_story.fillRatio = var_234_8
				end
			end

			if arg_231_1.time_ >= var_234_5 + var_234_6 and arg_231_1.time_ < var_234_5 + var_234_6 + arg_234_0 and arg_231_1.var_.characterEffect4040ui_story then
				local var_234_9 = 0.5

				arg_231_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_231_1.var_.characterEffect4040ui_story.fillRatio = var_234_9
			end

			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			if arg_231_1.frameCnt_ <= 1 then
				arg_231_1.dialog_:SetActive(false)
			end

			local var_234_11 = 0.633333333333333
			local var_234_12 = 0.15

			if var_234_11 < arg_231_1.time_ and arg_231_1.time_ <= var_234_11 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0

				arg_231_1.dialog_:SetActive(true)

				local var_234_13 = LeanTween.value(arg_231_1.dialog_, 0, 1, 0.3)

				var_234_13:setOnUpdate(LuaHelper.FloatAction(function(arg_235_0)
					arg_231_1.dialogCg_.alpha = arg_235_0
				end))
				var_234_13:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_231_1.dialog_)
					var_234_13:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_231_1.duration_ = arg_231_1.duration_ + 0.3

				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[471].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(411141056)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 6
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_12 or var_234_12 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_12 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19
					var_234_11 = var_234_11 + 0.3

					if var_234_19 + var_234_11 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_11
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141056", "story_v_out_411141.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141056", "story_v_out_411141.awb") / 1000

					if var_234_20 + var_234_11 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_11
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_out_411141", "411141056", "story_v_out_411141.awb")

						arg_231_1:RecordAudio("411141056", var_234_21)
						arg_231_1:RecordAudio("411141056", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_411141", "411141056", "story_v_out_411141.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_411141", "411141056", "story_v_out_411141.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = var_234_11 + 0.3
			local var_234_23 = math.max(var_234_12, arg_231_1.talkMaxDuration)

			if var_234_22 <= arg_231_1.time_ and arg_231_1.time_ < var_234_22 + var_234_23 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_22) / var_234_23

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_22 + var_234_23 and arg_231_1.time_ < var_234_22 + var_234_23 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play411141057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 411141057
		arg_237_1.duration_ = 4.266

		local var_237_0 = {
			zh = 3.733,
			ja = 4.266
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
				arg_237_0:Play411141058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10058ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect10058ui_story == nil then
				arg_237_1.var_.characterEffect10058ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect10058ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_237_1.var_.characterEffect10058ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect10058ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_237_1.var_.characterEffect10058ui_story.fillRatio = var_240_5
			end

			local var_240_6 = arg_237_1.actors_["4040ui_story"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.characterEffect4040ui_story == nil then
				arg_237_1.var_.characterEffect4040ui_story = var_240_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_8 = 0.200000002980232

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.characterEffect4040ui_story then
					arg_237_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.characterEffect4040ui_story then
				arg_237_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_240_10 = 0
			local var_240_11 = 0.275

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_12 = arg_237_1:FormatText(StoryNameCfg[668].name)

				arg_237_1.leftNameTxt_.text = var_240_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_13 = arg_237_1:GetWordFromCfg(411141057)
				local var_240_14 = arg_237_1:FormatText(var_240_13.content)

				arg_237_1.text_.text = var_240_14

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_15 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141057", "story_v_out_411141.awb") ~= 0 then
					local var_240_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141057", "story_v_out_411141.awb") / 1000

					if var_240_18 + var_240_10 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_18 + var_240_10
					end

					if var_240_13.prefab_name ~= "" and arg_237_1.actors_[var_240_13.prefab_name] ~= nil then
						local var_240_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_13.prefab_name].transform, "story_v_out_411141", "411141057", "story_v_out_411141.awb")

						arg_237_1:RecordAudio("411141057", var_240_19)
						arg_237_1:RecordAudio("411141057", var_240_19)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_411141", "411141057", "story_v_out_411141.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_411141", "411141057", "story_v_out_411141.awb")
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
	Play411141058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 411141058
		arg_241_1.duration_ = 2.133

		local var_241_0 = {
			zh = 1.033,
			ja = 2.133
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
				arg_241_0:Play411141059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10058ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect10058ui_story == nil then
				arg_241_1.var_.characterEffect10058ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect10058ui_story then
					arg_241_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect10058ui_story then
				arg_241_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_244_4 = arg_241_1.actors_["4040ui_story"]
			local var_244_5 = 0

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 and arg_241_1.var_.characterEffect4040ui_story == nil then
				arg_241_1.var_.characterEffect4040ui_story = var_244_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_6 = 0.200000002980232

			if var_244_5 <= arg_241_1.time_ and arg_241_1.time_ < var_244_5 + var_244_6 then
				local var_244_7 = (arg_241_1.time_ - var_244_5) / var_244_6

				if arg_241_1.var_.characterEffect4040ui_story then
					local var_244_8 = Mathf.Lerp(0, 0.5, var_244_7)

					arg_241_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_241_1.var_.characterEffect4040ui_story.fillRatio = var_244_8
				end
			end

			if arg_241_1.time_ >= var_244_5 + var_244_6 and arg_241_1.time_ < var_244_5 + var_244_6 + arg_244_0 and arg_241_1.var_.characterEffect4040ui_story then
				local var_244_9 = 0.5

				arg_241_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_241_1.var_.characterEffect4040ui_story.fillRatio = var_244_9
			end

			local var_244_10 = 0
			local var_244_11 = 0.075

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_12 = arg_241_1:FormatText(StoryNameCfg[471].name)

				arg_241_1.leftNameTxt_.text = var_244_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_13 = arg_241_1:GetWordFromCfg(411141058)
				local var_244_14 = arg_241_1:FormatText(var_244_13.content)

				arg_241_1.text_.text = var_244_14

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_15 = 3
				local var_244_16 = utf8.len(var_244_14)
				local var_244_17 = var_244_15 <= 0 and var_244_11 or var_244_11 * (var_244_16 / var_244_15)

				if var_244_17 > 0 and var_244_11 < var_244_17 then
					arg_241_1.talkMaxDuration = var_244_17

					if var_244_17 + var_244_10 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_17 + var_244_10
					end
				end

				arg_241_1.text_.text = var_244_14
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141058", "story_v_out_411141.awb") ~= 0 then
					local var_244_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141058", "story_v_out_411141.awb") / 1000

					if var_244_18 + var_244_10 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_18 + var_244_10
					end

					if var_244_13.prefab_name ~= "" and arg_241_1.actors_[var_244_13.prefab_name] ~= nil then
						local var_244_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_13.prefab_name].transform, "story_v_out_411141", "411141058", "story_v_out_411141.awb")

						arg_241_1:RecordAudio("411141058", var_244_19)
						arg_241_1:RecordAudio("411141058", var_244_19)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_411141", "411141058", "story_v_out_411141.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_411141", "411141058", "story_v_out_411141.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_20 = math.max(var_244_11, arg_241_1.talkMaxDuration)

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_20 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_10) / var_244_20

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_10 + var_244_20 and arg_241_1.time_ < var_244_10 + var_244_20 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play411141059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 411141059
		arg_245_1.duration_ = 3

		local var_245_0 = {
			zh = 2.833,
			ja = 3
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
				arg_245_0:Play411141060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10058ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect10058ui_story == nil then
				arg_245_1.var_.characterEffect10058ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect10058ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_245_1.var_.characterEffect10058ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect10058ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_245_1.var_.characterEffect10058ui_story.fillRatio = var_248_5
			end

			local var_248_6 = arg_245_1.actors_["4040ui_story"]
			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 and arg_245_1.var_.characterEffect4040ui_story == nil then
				arg_245_1.var_.characterEffect4040ui_story = var_248_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_8 = 0.200000002980232

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_8 then
				local var_248_9 = (arg_245_1.time_ - var_248_7) / var_248_8

				if arg_245_1.var_.characterEffect4040ui_story then
					arg_245_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_7 + var_248_8 and arg_245_1.time_ < var_248_7 + var_248_8 + arg_248_0 and arg_245_1.var_.characterEffect4040ui_story then
				arg_245_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_248_10 = 0
			local var_248_11 = 0.325

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_12 = arg_245_1:FormatText(StoryNameCfg[668].name)

				arg_245_1.leftNameTxt_.text = var_248_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_13 = arg_245_1:GetWordFromCfg(411141059)
				local var_248_14 = arg_245_1:FormatText(var_248_13.content)

				arg_245_1.text_.text = var_248_14

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_15 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141059", "story_v_out_411141.awb") ~= 0 then
					local var_248_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141059", "story_v_out_411141.awb") / 1000

					if var_248_18 + var_248_10 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_18 + var_248_10
					end

					if var_248_13.prefab_name ~= "" and arg_245_1.actors_[var_248_13.prefab_name] ~= nil then
						local var_248_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_13.prefab_name].transform, "story_v_out_411141", "411141059", "story_v_out_411141.awb")

						arg_245_1:RecordAudio("411141059", var_248_19)
						arg_245_1:RecordAudio("411141059", var_248_19)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_411141", "411141059", "story_v_out_411141.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_411141", "411141059", "story_v_out_411141.awb")
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
	Play411141060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 411141060
		arg_249_1.duration_ = 4.766

		local var_249_0 = {
			zh = 1.866,
			ja = 4.766
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
				arg_249_0:Play411141061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.2

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[668].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(411141060)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141060", "story_v_out_411141.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141060", "story_v_out_411141.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_411141", "411141060", "story_v_out_411141.awb")

						arg_249_1:RecordAudio("411141060", var_252_9)
						arg_249_1:RecordAudio("411141060", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_411141", "411141060", "story_v_out_411141.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_411141", "411141060", "story_v_out_411141.awb")
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
	Play411141061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 411141061
		arg_253_1.duration_ = 5.133

		local var_253_0 = {
			zh = 3.1,
			ja = 5.133
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
				arg_253_0:Play411141062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.375

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[668].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(411141061)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141061", "story_v_out_411141.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141061", "story_v_out_411141.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_411141", "411141061", "story_v_out_411141.awb")

						arg_253_1:RecordAudio("411141061", var_256_9)
						arg_253_1:RecordAudio("411141061", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_411141", "411141061", "story_v_out_411141.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_411141", "411141061", "story_v_out_411141.awb")
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
	Play411141062 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 411141062
		arg_257_1.duration_ = 12.333

		local var_257_0 = {
			zh = 6.3,
			ja = 12.333
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
				arg_257_0:Play411141063(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["10058ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect10058ui_story == nil then
				arg_257_1.var_.characterEffect10058ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect10058ui_story then
					arg_257_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect10058ui_story then
				arg_257_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_260_4 = arg_257_1.actors_["4040ui_story"]
			local var_260_5 = 0

			if var_260_5 < arg_257_1.time_ and arg_257_1.time_ <= var_260_5 + arg_260_0 and arg_257_1.var_.characterEffect4040ui_story == nil then
				arg_257_1.var_.characterEffect4040ui_story = var_260_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_6 = 0.200000002980232

			if var_260_5 <= arg_257_1.time_ and arg_257_1.time_ < var_260_5 + var_260_6 then
				local var_260_7 = (arg_257_1.time_ - var_260_5) / var_260_6

				if arg_257_1.var_.characterEffect4040ui_story then
					local var_260_8 = Mathf.Lerp(0, 0.5, var_260_7)

					arg_257_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_257_1.var_.characterEffect4040ui_story.fillRatio = var_260_8
				end
			end

			if arg_257_1.time_ >= var_260_5 + var_260_6 and arg_257_1.time_ < var_260_5 + var_260_6 + arg_260_0 and arg_257_1.var_.characterEffect4040ui_story then
				local var_260_9 = 0.5

				arg_257_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_257_1.var_.characterEffect4040ui_story.fillRatio = var_260_9
			end

			local var_260_10 = 0
			local var_260_11 = 0.725

			if var_260_10 < arg_257_1.time_ and arg_257_1.time_ <= var_260_10 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_12 = arg_257_1:FormatText(StoryNameCfg[471].name)

				arg_257_1.leftNameTxt_.text = var_260_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_13 = arg_257_1:GetWordFromCfg(411141062)
				local var_260_14 = arg_257_1:FormatText(var_260_13.content)

				arg_257_1.text_.text = var_260_14

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_15 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141062", "story_v_out_411141.awb") ~= 0 then
					local var_260_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141062", "story_v_out_411141.awb") / 1000

					if var_260_18 + var_260_10 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_18 + var_260_10
					end

					if var_260_13.prefab_name ~= "" and arg_257_1.actors_[var_260_13.prefab_name] ~= nil then
						local var_260_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_13.prefab_name].transform, "story_v_out_411141", "411141062", "story_v_out_411141.awb")

						arg_257_1:RecordAudio("411141062", var_260_19)
						arg_257_1:RecordAudio("411141062", var_260_19)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_411141", "411141062", "story_v_out_411141.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_411141", "411141062", "story_v_out_411141.awb")
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
	Play411141063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 411141063
		arg_261_1.duration_ = 6

		local var_261_0 = {
			zh = 4.766,
			ja = 6
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
				arg_261_0:Play411141064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.5

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[471].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(411141063)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 20
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141063", "story_v_out_411141.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141063", "story_v_out_411141.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_411141", "411141063", "story_v_out_411141.awb")

						arg_261_1:RecordAudio("411141063", var_264_9)
						arg_261_1:RecordAudio("411141063", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_411141", "411141063", "story_v_out_411141.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_411141", "411141063", "story_v_out_411141.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play411141064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 411141064
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play411141065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["10058ui_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.characterEffect10058ui_story == nil then
				arg_265_1.var_.characterEffect10058ui_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.200000002980232

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect10058ui_story then
					local var_268_4 = Mathf.Lerp(0, 0.5, var_268_3)

					arg_265_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_265_1.var_.characterEffect10058ui_story.fillRatio = var_268_4
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.characterEffect10058ui_story then
				local var_268_5 = 0.5

				arg_265_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_265_1.var_.characterEffect10058ui_story.fillRatio = var_268_5
			end

			local var_268_6 = 0
			local var_268_7 = 0.525

			if var_268_6 < arg_265_1.time_ and arg_265_1.time_ <= var_268_6 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_8 = arg_265_1:GetWordFromCfg(411141064)
				local var_268_9 = arg_265_1:FormatText(var_268_8.content)

				arg_265_1.text_.text = var_268_9

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_10 = 21
				local var_268_11 = utf8.len(var_268_9)
				local var_268_12 = var_268_10 <= 0 and var_268_7 or var_268_7 * (var_268_11 / var_268_10)

				if var_268_12 > 0 and var_268_7 < var_268_12 then
					arg_265_1.talkMaxDuration = var_268_12

					if var_268_12 + var_268_6 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_12 + var_268_6
					end
				end

				arg_265_1.text_.text = var_268_9
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_13 = math.max(var_268_7, arg_265_1.talkMaxDuration)

			if var_268_6 <= arg_265_1.time_ and arg_265_1.time_ < var_268_6 + var_268_13 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_6) / var_268_13

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_6 + var_268_13 and arg_265_1.time_ < var_268_6 + var_268_13 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play411141065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 411141065
		arg_269_1.duration_ = 7.033

		local var_269_0 = {
			zh = 7.033,
			ja = 6
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
				arg_269_0:Play411141066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10058ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect10058ui_story == nil then
				arg_269_1.var_.characterEffect10058ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect10058ui_story then
					arg_269_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect10058ui_story then
				arg_269_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_272_4 = 0
			local var_272_5 = 0.65

			if var_272_4 < arg_269_1.time_ and arg_269_1.time_ <= var_272_4 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_6 = arg_269_1:FormatText(StoryNameCfg[471].name)

				arg_269_1.leftNameTxt_.text = var_272_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_7 = arg_269_1:GetWordFromCfg(411141065)
				local var_272_8 = arg_269_1:FormatText(var_272_7.content)

				arg_269_1.text_.text = var_272_8

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_9 = 26
				local var_272_10 = utf8.len(var_272_8)
				local var_272_11 = var_272_9 <= 0 and var_272_5 or var_272_5 * (var_272_10 / var_272_9)

				if var_272_11 > 0 and var_272_5 < var_272_11 then
					arg_269_1.talkMaxDuration = var_272_11

					if var_272_11 + var_272_4 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_11 + var_272_4
					end
				end

				arg_269_1.text_.text = var_272_8
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141065", "story_v_out_411141.awb") ~= 0 then
					local var_272_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141065", "story_v_out_411141.awb") / 1000

					if var_272_12 + var_272_4 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_12 + var_272_4
					end

					if var_272_7.prefab_name ~= "" and arg_269_1.actors_[var_272_7.prefab_name] ~= nil then
						local var_272_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_7.prefab_name].transform, "story_v_out_411141", "411141065", "story_v_out_411141.awb")

						arg_269_1:RecordAudio("411141065", var_272_13)
						arg_269_1:RecordAudio("411141065", var_272_13)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_411141", "411141065", "story_v_out_411141.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_411141", "411141065", "story_v_out_411141.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_14 = math.max(var_272_5, arg_269_1.talkMaxDuration)

			if var_272_4 <= arg_269_1.time_ and arg_269_1.time_ < var_272_4 + var_272_14 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_4) / var_272_14

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_4 + var_272_14 and arg_269_1.time_ < var_272_4 + var_272_14 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play411141066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 411141066
		arg_273_1.duration_ = 6.133

		local var_273_0 = {
			zh = 6.133,
			ja = 5.466
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
				arg_273_0:Play411141067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.65

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[471].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(411141066)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 26
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141066", "story_v_out_411141.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141066", "story_v_out_411141.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_411141", "411141066", "story_v_out_411141.awb")

						arg_273_1:RecordAudio("411141066", var_276_9)
						arg_273_1:RecordAudio("411141066", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_411141", "411141066", "story_v_out_411141.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_411141", "411141066", "story_v_out_411141.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_10 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_10 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_10

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_10 and arg_273_1.time_ < var_276_0 + var_276_10 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play411141067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 411141067
		arg_277_1.duration_ = 9.466

		local var_277_0 = {
			zh = 9.466,
			ja = 8.3
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
				arg_277_0:Play411141068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.925

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[471].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(411141067)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 37
				local var_280_6 = utf8.len(var_280_4)
				local var_280_7 = var_280_5 <= 0 and var_280_1 or var_280_1 * (var_280_6 / var_280_5)

				if var_280_7 > 0 and var_280_1 < var_280_7 then
					arg_277_1.talkMaxDuration = var_280_7

					if var_280_7 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_7 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_4
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141067", "story_v_out_411141.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141067", "story_v_out_411141.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_411141", "411141067", "story_v_out_411141.awb")

						arg_277_1:RecordAudio("411141067", var_280_9)
						arg_277_1:RecordAudio("411141067", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_411141", "411141067", "story_v_out_411141.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_411141", "411141067", "story_v_out_411141.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_10 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_10 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_10

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_10 and arg_277_1.time_ < var_280_0 + var_280_10 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play411141068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 411141068
		arg_281_1.duration_ = 2.666

		local var_281_0 = {
			zh = 2.666,
			ja = 1.2
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
				arg_281_0:Play411141069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10058ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect10058ui_story == nil then
				arg_281_1.var_.characterEffect10058ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect10058ui_story then
					local var_284_4 = Mathf.Lerp(0, 0.5, var_284_3)

					arg_281_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_281_1.var_.characterEffect10058ui_story.fillRatio = var_284_4
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect10058ui_story then
				local var_284_5 = 0.5

				arg_281_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_281_1.var_.characterEffect10058ui_story.fillRatio = var_284_5
			end

			local var_284_6 = arg_281_1.actors_["4040ui_story"]
			local var_284_7 = 0

			if var_284_7 < arg_281_1.time_ and arg_281_1.time_ <= var_284_7 + arg_284_0 and arg_281_1.var_.characterEffect4040ui_story == nil then
				arg_281_1.var_.characterEffect4040ui_story = var_284_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_8 = 0.200000002980232

			if var_284_7 <= arg_281_1.time_ and arg_281_1.time_ < var_284_7 + var_284_8 then
				local var_284_9 = (arg_281_1.time_ - var_284_7) / var_284_8

				if arg_281_1.var_.characterEffect4040ui_story then
					arg_281_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_7 + var_284_8 and arg_281_1.time_ < var_284_7 + var_284_8 + arg_284_0 and arg_281_1.var_.characterEffect4040ui_story then
				arg_281_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_284_10 = 0
			local var_284_11 = 0.15

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_12 = arg_281_1:FormatText(StoryNameCfg[668].name)

				arg_281_1.leftNameTxt_.text = var_284_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_13 = arg_281_1:GetWordFromCfg(411141068)
				local var_284_14 = arg_281_1:FormatText(var_284_13.content)

				arg_281_1.text_.text = var_284_14

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_15 = 6
				local var_284_16 = utf8.len(var_284_14)
				local var_284_17 = var_284_15 <= 0 and var_284_11 or var_284_11 * (var_284_16 / var_284_15)

				if var_284_17 > 0 and var_284_11 < var_284_17 then
					arg_281_1.talkMaxDuration = var_284_17

					if var_284_17 + var_284_10 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_17 + var_284_10
					end
				end

				arg_281_1.text_.text = var_284_14
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141068", "story_v_out_411141.awb") ~= 0 then
					local var_284_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141068", "story_v_out_411141.awb") / 1000

					if var_284_18 + var_284_10 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_18 + var_284_10
					end

					if var_284_13.prefab_name ~= "" and arg_281_1.actors_[var_284_13.prefab_name] ~= nil then
						local var_284_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_13.prefab_name].transform, "story_v_out_411141", "411141068", "story_v_out_411141.awb")

						arg_281_1:RecordAudio("411141068", var_284_19)
						arg_281_1:RecordAudio("411141068", var_284_19)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_411141", "411141068", "story_v_out_411141.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_411141", "411141068", "story_v_out_411141.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_20 = math.max(var_284_11, arg_281_1.talkMaxDuration)

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_20 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_10) / var_284_20

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_10 + var_284_20 and arg_281_1.time_ < var_284_10 + var_284_20 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play411141069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 411141069
		arg_285_1.duration_ = 5.4

		local var_285_0 = {
			zh = 5.4,
			ja = 1.766
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
				arg_285_0:Play411141070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.6

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[668].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(411141069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141069", "story_v_out_411141.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141069", "story_v_out_411141.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_411141", "411141069", "story_v_out_411141.awb")

						arg_285_1:RecordAudio("411141069", var_288_9)
						arg_285_1:RecordAudio("411141069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_411141", "411141069", "story_v_out_411141.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_411141", "411141069", "story_v_out_411141.awb")
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
	Play411141070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 411141070
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play411141071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["4040ui_story"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 and arg_289_1.var_.characterEffect4040ui_story == nil then
				arg_289_1.var_.characterEffect4040ui_story = var_292_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_2 = 0.200000002980232

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2

				if arg_289_1.var_.characterEffect4040ui_story then
					local var_292_4 = Mathf.Lerp(0, 0.5, var_292_3)

					arg_289_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_289_1.var_.characterEffect4040ui_story.fillRatio = var_292_4
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 and arg_289_1.var_.characterEffect4040ui_story then
				local var_292_5 = 0.5

				arg_289_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_289_1.var_.characterEffect4040ui_story.fillRatio = var_292_5
			end

			local var_292_6 = 0

			if var_292_6 < arg_289_1.time_ and arg_289_1.time_ <= var_292_6 + arg_292_0 then
				arg_289_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_292_7 = 0

			if var_292_7 < arg_289_1.time_ and arg_289_1.time_ <= var_292_7 + arg_292_0 then
				arg_289_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_1")
			end

			local var_292_8 = 0
			local var_292_9 = 1

			if var_292_8 < arg_289_1.time_ and arg_289_1.time_ <= var_292_8 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_10 = arg_289_1:GetWordFromCfg(411141070)
				local var_292_11 = arg_289_1:FormatText(var_292_10.content)

				arg_289_1.text_.text = var_292_11

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_12 = 40
				local var_292_13 = utf8.len(var_292_11)
				local var_292_14 = var_292_12 <= 0 and var_292_9 or var_292_9 * (var_292_13 / var_292_12)

				if var_292_14 > 0 and var_292_9 < var_292_14 then
					arg_289_1.talkMaxDuration = var_292_14

					if var_292_14 + var_292_8 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_14 + var_292_8
					end
				end

				arg_289_1.text_.text = var_292_11
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_15 = math.max(var_292_9, arg_289_1.talkMaxDuration)

			if var_292_8 <= arg_289_1.time_ and arg_289_1.time_ < var_292_8 + var_292_15 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_8) / var_292_15

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_8 + var_292_15 and arg_289_1.time_ < var_292_8 + var_292_15 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play411141071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 411141071
		arg_293_1.duration_ = 3.8

		local var_293_0 = {
			zh = 3.233,
			ja = 3.8
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
				arg_293_0:Play411141072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["4040ui_story"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect4040ui_story == nil then
				arg_293_1.var_.characterEffect4040ui_story = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.200000002980232

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect4040ui_story then
					arg_293_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect4040ui_story then
				arg_293_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_296_4 = 0

			if var_296_4 < arg_293_1.time_ and arg_293_1.time_ <= var_296_4 + arg_296_0 then
				arg_293_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_296_5 = 0
			local var_296_6 = 0.375

			if var_296_5 < arg_293_1.time_ and arg_293_1.time_ <= var_296_5 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_7 = arg_293_1:FormatText(StoryNameCfg[668].name)

				arg_293_1.leftNameTxt_.text = var_296_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_8 = arg_293_1:GetWordFromCfg(411141071)
				local var_296_9 = arg_293_1:FormatText(var_296_8.content)

				arg_293_1.text_.text = var_296_9

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_10 = 15
				local var_296_11 = utf8.len(var_296_9)
				local var_296_12 = var_296_10 <= 0 and var_296_6 or var_296_6 * (var_296_11 / var_296_10)

				if var_296_12 > 0 and var_296_6 < var_296_12 then
					arg_293_1.talkMaxDuration = var_296_12

					if var_296_12 + var_296_5 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_12 + var_296_5
					end
				end

				arg_293_1.text_.text = var_296_9
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141071", "story_v_out_411141.awb") ~= 0 then
					local var_296_13 = manager.audio:GetVoiceLength("story_v_out_411141", "411141071", "story_v_out_411141.awb") / 1000

					if var_296_13 + var_296_5 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_13 + var_296_5
					end

					if var_296_8.prefab_name ~= "" and arg_293_1.actors_[var_296_8.prefab_name] ~= nil then
						local var_296_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_8.prefab_name].transform, "story_v_out_411141", "411141071", "story_v_out_411141.awb")

						arg_293_1:RecordAudio("411141071", var_296_14)
						arg_293_1:RecordAudio("411141071", var_296_14)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_411141", "411141071", "story_v_out_411141.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_411141", "411141071", "story_v_out_411141.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_15 = math.max(var_296_6, arg_293_1.talkMaxDuration)

			if var_296_5 <= arg_293_1.time_ and arg_293_1.time_ < var_296_5 + var_296_15 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_5) / var_296_15

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_5 + var_296_15 and arg_293_1.time_ < var_296_5 + var_296_15 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play411141072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 411141072
		arg_297_1.duration_ = 2

		local var_297_0 = {
			zh = 1.999999999999,
			ja = 2
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
				arg_297_0:Play411141073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action5_2")
			end

			local var_300_1 = 0
			local var_300_2 = 0.175

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_3 = arg_297_1:FormatText(StoryNameCfg[668].name)

				arg_297_1.leftNameTxt_.text = var_300_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_4 = arg_297_1:GetWordFromCfg(411141072)
				local var_300_5 = arg_297_1:FormatText(var_300_4.content)

				arg_297_1.text_.text = var_300_5

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_6 = 7
				local var_300_7 = utf8.len(var_300_5)
				local var_300_8 = var_300_6 <= 0 and var_300_2 or var_300_2 * (var_300_7 / var_300_6)

				if var_300_8 > 0 and var_300_2 < var_300_8 then
					arg_297_1.talkMaxDuration = var_300_8

					if var_300_8 + var_300_1 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_1
					end
				end

				arg_297_1.text_.text = var_300_5
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141072", "story_v_out_411141.awb") ~= 0 then
					local var_300_9 = manager.audio:GetVoiceLength("story_v_out_411141", "411141072", "story_v_out_411141.awb") / 1000

					if var_300_9 + var_300_1 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_9 + var_300_1
					end

					if var_300_4.prefab_name ~= "" and arg_297_1.actors_[var_300_4.prefab_name] ~= nil then
						local var_300_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_4.prefab_name].transform, "story_v_out_411141", "411141072", "story_v_out_411141.awb")

						arg_297_1:RecordAudio("411141072", var_300_10)
						arg_297_1:RecordAudio("411141072", var_300_10)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_411141", "411141072", "story_v_out_411141.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_411141", "411141072", "story_v_out_411141.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_11 = math.max(var_300_2, arg_297_1.talkMaxDuration)

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_11 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_1) / var_300_11

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_1 + var_300_11 and arg_297_1.time_ < var_300_1 + var_300_11 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play411141073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 411141073
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play411141074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["4040ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect4040ui_story == nil then
				arg_301_1.var_.characterEffect4040ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.200000002980232

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect4040ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_301_1.var_.characterEffect4040ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect4040ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_301_1.var_.characterEffect4040ui_story.fillRatio = var_304_5
			end

			local var_304_6 = 0

			if var_304_6 < arg_301_1.time_ and arg_301_1.time_ <= var_304_6 + arg_304_0 then
				arg_301_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_1")
			end

			local var_304_7 = 0
			local var_304_8 = 0.575

			if var_304_7 < arg_301_1.time_ and arg_301_1.time_ <= var_304_7 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_9 = arg_301_1:GetWordFromCfg(411141073)
				local var_304_10 = arg_301_1:FormatText(var_304_9.content)

				arg_301_1.text_.text = var_304_10

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_11 = 23
				local var_304_12 = utf8.len(var_304_10)
				local var_304_13 = var_304_11 <= 0 and var_304_8 or var_304_8 * (var_304_12 / var_304_11)

				if var_304_13 > 0 and var_304_8 < var_304_13 then
					arg_301_1.talkMaxDuration = var_304_13

					if var_304_13 + var_304_7 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_13 + var_304_7
					end
				end

				arg_301_1.text_.text = var_304_10
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_14 = math.max(var_304_8, arg_301_1.talkMaxDuration)

			if var_304_7 <= arg_301_1.time_ and arg_301_1.time_ < var_304_7 + var_304_14 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_7) / var_304_14

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_7 + var_304_14 and arg_301_1.time_ < var_304_7 + var_304_14 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play411141074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 411141074
		arg_305_1.duration_ = 4.033

		local var_305_0 = {
			zh = 1.366,
			ja = 4.033
		}
		local var_305_1 = manager.audio:GetLocalizationFlag()

		if var_305_0[var_305_1] ~= nil then
			arg_305_1.duration_ = var_305_0[var_305_1]
		end

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play411141075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["10058ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect10058ui_story == nil then
				arg_305_1.var_.characterEffect10058ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.200000002980232

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect10058ui_story then
					arg_305_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect10058ui_story then
				arg_305_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_308_4 = 0
			local var_308_5 = 0.1

			if var_308_4 < arg_305_1.time_ and arg_305_1.time_ <= var_308_4 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_6 = arg_305_1:FormatText(StoryNameCfg[471].name)

				arg_305_1.leftNameTxt_.text = var_308_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_7 = arg_305_1:GetWordFromCfg(411141074)
				local var_308_8 = arg_305_1:FormatText(var_308_7.content)

				arg_305_1.text_.text = var_308_8

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_9 = 4
				local var_308_10 = utf8.len(var_308_8)
				local var_308_11 = var_308_9 <= 0 and var_308_5 or var_308_5 * (var_308_10 / var_308_9)

				if var_308_11 > 0 and var_308_5 < var_308_11 then
					arg_305_1.talkMaxDuration = var_308_11

					if var_308_11 + var_308_4 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_11 + var_308_4
					end
				end

				arg_305_1.text_.text = var_308_8
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141074", "story_v_out_411141.awb") ~= 0 then
					local var_308_12 = manager.audio:GetVoiceLength("story_v_out_411141", "411141074", "story_v_out_411141.awb") / 1000

					if var_308_12 + var_308_4 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_12 + var_308_4
					end

					if var_308_7.prefab_name ~= "" and arg_305_1.actors_[var_308_7.prefab_name] ~= nil then
						local var_308_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_7.prefab_name].transform, "story_v_out_411141", "411141074", "story_v_out_411141.awb")

						arg_305_1:RecordAudio("411141074", var_308_13)
						arg_305_1:RecordAudio("411141074", var_308_13)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_411141", "411141074", "story_v_out_411141.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_411141", "411141074", "story_v_out_411141.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_14 = math.max(var_308_5, arg_305_1.talkMaxDuration)

			if var_308_4 <= arg_305_1.time_ and arg_305_1.time_ < var_308_4 + var_308_14 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_4) / var_308_14

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_4 + var_308_14 and arg_305_1.time_ < var_308_4 + var_308_14 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play411141075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 411141075
		arg_309_1.duration_ = 8.3

		local var_309_0 = {
			zh = 4.9,
			ja = 8.3
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
				arg_309_0:Play411141076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_2")
			end

			local var_312_1 = 0
			local var_312_2 = 0.625

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_3 = arg_309_1:FormatText(StoryNameCfg[471].name)

				arg_309_1.leftNameTxt_.text = var_312_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_4 = arg_309_1:GetWordFromCfg(411141075)
				local var_312_5 = arg_309_1:FormatText(var_312_4.content)

				arg_309_1.text_.text = var_312_5

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_6 = 25
				local var_312_7 = utf8.len(var_312_5)
				local var_312_8 = var_312_6 <= 0 and var_312_2 or var_312_2 * (var_312_7 / var_312_6)

				if var_312_8 > 0 and var_312_2 < var_312_8 then
					arg_309_1.talkMaxDuration = var_312_8

					if var_312_8 + var_312_1 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_1
					end
				end

				arg_309_1.text_.text = var_312_5
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141075", "story_v_out_411141.awb") ~= 0 then
					local var_312_9 = manager.audio:GetVoiceLength("story_v_out_411141", "411141075", "story_v_out_411141.awb") / 1000

					if var_312_9 + var_312_1 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_9 + var_312_1
					end

					if var_312_4.prefab_name ~= "" and arg_309_1.actors_[var_312_4.prefab_name] ~= nil then
						local var_312_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_4.prefab_name].transform, "story_v_out_411141", "411141075", "story_v_out_411141.awb")

						arg_309_1:RecordAudio("411141075", var_312_10)
						arg_309_1:RecordAudio("411141075", var_312_10)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_411141", "411141075", "story_v_out_411141.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_411141", "411141075", "story_v_out_411141.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_11 = math.max(var_312_2, arg_309_1.talkMaxDuration)

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_11 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_1) / var_312_11

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_1 + var_312_11 and arg_309_1.time_ < var_312_1 + var_312_11 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play411141076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 411141076
		arg_313_1.duration_ = 6.433

		local var_313_0 = {
			zh = 6.433,
			ja = 5.1
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play411141077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.725

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[471].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(411141076)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 29
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141076", "story_v_out_411141.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141076", "story_v_out_411141.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_411141", "411141076", "story_v_out_411141.awb")

						arg_313_1:RecordAudio("411141076", var_316_9)
						arg_313_1:RecordAudio("411141076", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_411141", "411141076", "story_v_out_411141.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_411141", "411141076", "story_v_out_411141.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play411141077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 411141077
		arg_317_1.duration_ = 1.1

		local var_317_0 = {
			zh = 0.999999999999,
			ja = 1.1
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play411141078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10058ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect10058ui_story == nil then
				arg_317_1.var_.characterEffect10058ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect10058ui_story then
					local var_320_4 = Mathf.Lerp(0, 0.5, var_320_3)

					arg_317_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_317_1.var_.characterEffect10058ui_story.fillRatio = var_320_4
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect10058ui_story then
				local var_320_5 = 0.5

				arg_317_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_317_1.var_.characterEffect10058ui_story.fillRatio = var_320_5
			end

			local var_320_6 = arg_317_1.actors_["4040ui_story"]
			local var_320_7 = 0

			if var_320_7 < arg_317_1.time_ and arg_317_1.time_ <= var_320_7 + arg_320_0 and arg_317_1.var_.characterEffect4040ui_story == nil then
				arg_317_1.var_.characterEffect4040ui_story = var_320_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_8 = 0.200000002980232

			if var_320_7 <= arg_317_1.time_ and arg_317_1.time_ < var_320_7 + var_320_8 then
				local var_320_9 = (arg_317_1.time_ - var_320_7) / var_320_8

				if arg_317_1.var_.characterEffect4040ui_story then
					arg_317_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_7 + var_320_8 and arg_317_1.time_ < var_320_7 + var_320_8 + arg_320_0 and arg_317_1.var_.characterEffect4040ui_story then
				arg_317_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_320_10 = 0
			local var_320_11 = 0.05

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_12 = arg_317_1:FormatText(StoryNameCfg[668].name)

				arg_317_1.leftNameTxt_.text = var_320_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_13 = arg_317_1:GetWordFromCfg(411141077)
				local var_320_14 = arg_317_1:FormatText(var_320_13.content)

				arg_317_1.text_.text = var_320_14

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_15 = 2
				local var_320_16 = utf8.len(var_320_14)
				local var_320_17 = var_320_15 <= 0 and var_320_11 or var_320_11 * (var_320_16 / var_320_15)

				if var_320_17 > 0 and var_320_11 < var_320_17 then
					arg_317_1.talkMaxDuration = var_320_17

					if var_320_17 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_17 + var_320_10
					end
				end

				arg_317_1.text_.text = var_320_14
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141077", "story_v_out_411141.awb") ~= 0 then
					local var_320_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141077", "story_v_out_411141.awb") / 1000

					if var_320_18 + var_320_10 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_18 + var_320_10
					end

					if var_320_13.prefab_name ~= "" and arg_317_1.actors_[var_320_13.prefab_name] ~= nil then
						local var_320_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_13.prefab_name].transform, "story_v_out_411141", "411141077", "story_v_out_411141.awb")

						arg_317_1:RecordAudio("411141077", var_320_19)
						arg_317_1:RecordAudio("411141077", var_320_19)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_411141", "411141077", "story_v_out_411141.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_411141", "411141077", "story_v_out_411141.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_20 = math.max(var_320_11, arg_317_1.talkMaxDuration)

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_20 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_10) / var_320_20

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_10 + var_320_20 and arg_317_1.time_ < var_320_10 + var_320_20 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play411141078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 411141078
		arg_321_1.duration_ = 4.666

		local var_321_0 = {
			zh = 1.5,
			ja = 4.666
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play411141079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10058ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect10058ui_story == nil then
				arg_321_1.var_.characterEffect10058ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect10058ui_story then
					arg_321_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect10058ui_story then
				arg_321_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_324_4 = arg_321_1.actors_["4040ui_story"]
			local var_324_5 = 0

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 and arg_321_1.var_.characterEffect4040ui_story == nil then
				arg_321_1.var_.characterEffect4040ui_story = var_324_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_6 = 0.200000002980232

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6

				if arg_321_1.var_.characterEffect4040ui_story then
					local var_324_8 = Mathf.Lerp(0, 0.5, var_324_7)

					arg_321_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_321_1.var_.characterEffect4040ui_story.fillRatio = var_324_8
				end
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 and arg_321_1.var_.characterEffect4040ui_story then
				local var_324_9 = 0.5

				arg_321_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_321_1.var_.characterEffect4040ui_story.fillRatio = var_324_9
			end

			local var_324_10 = 0
			local var_324_11 = 0.175

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_12 = arg_321_1:FormatText(StoryNameCfg[471].name)

				arg_321_1.leftNameTxt_.text = var_324_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_13 = arg_321_1:GetWordFromCfg(411141078)
				local var_324_14 = arg_321_1:FormatText(var_324_13.content)

				arg_321_1.text_.text = var_324_14

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_15 = 7
				local var_324_16 = utf8.len(var_324_14)
				local var_324_17 = var_324_15 <= 0 and var_324_11 or var_324_11 * (var_324_16 / var_324_15)

				if var_324_17 > 0 and var_324_11 < var_324_17 then
					arg_321_1.talkMaxDuration = var_324_17

					if var_324_17 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_17 + var_324_10
					end
				end

				arg_321_1.text_.text = var_324_14
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141078", "story_v_out_411141.awb") ~= 0 then
					local var_324_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141078", "story_v_out_411141.awb") / 1000

					if var_324_18 + var_324_10 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_18 + var_324_10
					end

					if var_324_13.prefab_name ~= "" and arg_321_1.actors_[var_324_13.prefab_name] ~= nil then
						local var_324_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_13.prefab_name].transform, "story_v_out_411141", "411141078", "story_v_out_411141.awb")

						arg_321_1:RecordAudio("411141078", var_324_19)
						arg_321_1:RecordAudio("411141078", var_324_19)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_411141", "411141078", "story_v_out_411141.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_411141", "411141078", "story_v_out_411141.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_20 = math.max(var_324_11, arg_321_1.talkMaxDuration)

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_20 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_10) / var_324_20

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_10 + var_324_20 and arg_321_1.time_ < var_324_10 + var_324_20 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play411141079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 411141079
		arg_325_1.duration_ = 5.7

		local var_325_0 = {
			zh = 3.966,
			ja = 5.7
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
				arg_325_0:Play411141080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10058ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect10058ui_story == nil then
				arg_325_1.var_.characterEffect10058ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect10058ui_story then
					local var_328_4 = Mathf.Lerp(0, 0.5, var_328_3)

					arg_325_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_325_1.var_.characterEffect10058ui_story.fillRatio = var_328_4
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect10058ui_story then
				local var_328_5 = 0.5

				arg_325_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_325_1.var_.characterEffect10058ui_story.fillRatio = var_328_5
			end

			local var_328_6 = arg_325_1.actors_["4040ui_story"]
			local var_328_7 = 0

			if var_328_7 < arg_325_1.time_ and arg_325_1.time_ <= var_328_7 + arg_328_0 and arg_325_1.var_.characterEffect4040ui_story == nil then
				arg_325_1.var_.characterEffect4040ui_story = var_328_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_8 = 0.200000002980232

			if var_328_7 <= arg_325_1.time_ and arg_325_1.time_ < var_328_7 + var_328_8 then
				local var_328_9 = (arg_325_1.time_ - var_328_7) / var_328_8

				if arg_325_1.var_.characterEffect4040ui_story then
					arg_325_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_7 + var_328_8 and arg_325_1.time_ < var_328_7 + var_328_8 + arg_328_0 and arg_325_1.var_.characterEffect4040ui_story then
				arg_325_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 then
				arg_325_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_328_11 = 0

			if var_328_11 < arg_325_1.time_ and arg_325_1.time_ <= var_328_11 + arg_328_0 then
				arg_325_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action6_1")
			end

			local var_328_12 = 0
			local var_328_13 = 0.375

			if var_328_12 < arg_325_1.time_ and arg_325_1.time_ <= var_328_12 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_14 = arg_325_1:FormatText(StoryNameCfg[668].name)

				arg_325_1.leftNameTxt_.text = var_328_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_15 = arg_325_1:GetWordFromCfg(411141079)
				local var_328_16 = arg_325_1:FormatText(var_328_15.content)

				arg_325_1.text_.text = var_328_16

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_17 = 15
				local var_328_18 = utf8.len(var_328_16)
				local var_328_19 = var_328_17 <= 0 and var_328_13 or var_328_13 * (var_328_18 / var_328_17)

				if var_328_19 > 0 and var_328_13 < var_328_19 then
					arg_325_1.talkMaxDuration = var_328_19

					if var_328_19 + var_328_12 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_19 + var_328_12
					end
				end

				arg_325_1.text_.text = var_328_16
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141079", "story_v_out_411141.awb") ~= 0 then
					local var_328_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141079", "story_v_out_411141.awb") / 1000

					if var_328_20 + var_328_12 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_20 + var_328_12
					end

					if var_328_15.prefab_name ~= "" and arg_325_1.actors_[var_328_15.prefab_name] ~= nil then
						local var_328_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_15.prefab_name].transform, "story_v_out_411141", "411141079", "story_v_out_411141.awb")

						arg_325_1:RecordAudio("411141079", var_328_21)
						arg_325_1:RecordAudio("411141079", var_328_21)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_411141", "411141079", "story_v_out_411141.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_411141", "411141079", "story_v_out_411141.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_22 = math.max(var_328_13, arg_325_1.talkMaxDuration)

			if var_328_12 <= arg_325_1.time_ and arg_325_1.time_ < var_328_12 + var_328_22 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_12) / var_328_22

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_12 + var_328_22 and arg_325_1.time_ < var_328_12 + var_328_22 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play411141080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 411141080
		arg_329_1.duration_ = 1.766

		local var_329_0 = {
			zh = 1.2,
			ja = 1.766
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play411141081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 0.15

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[668].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(411141080)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 6
				local var_332_6 = utf8.len(var_332_4)
				local var_332_7 = var_332_5 <= 0 and var_332_1 or var_332_1 * (var_332_6 / var_332_5)

				if var_332_7 > 0 and var_332_1 < var_332_7 then
					arg_329_1.talkMaxDuration = var_332_7

					if var_332_7 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_7 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_4
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141080", "story_v_out_411141.awb") ~= 0 then
					local var_332_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141080", "story_v_out_411141.awb") / 1000

					if var_332_8 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_0
					end

					if var_332_3.prefab_name ~= "" and arg_329_1.actors_[var_332_3.prefab_name] ~= nil then
						local var_332_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_3.prefab_name].transform, "story_v_out_411141", "411141080", "story_v_out_411141.awb")

						arg_329_1:RecordAudio("411141080", var_332_9)
						arg_329_1:RecordAudio("411141080", var_332_9)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_411141", "411141080", "story_v_out_411141.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_411141", "411141080", "story_v_out_411141.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_10 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_10 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_10

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_10 and arg_329_1.time_ < var_332_0 + var_332_10 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play411141081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 411141081
		arg_333_1.duration_ = 7.166

		local var_333_0 = {
			zh = 5.033,
			ja = 7.166
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
				arg_333_0:Play411141082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["10058ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect10058ui_story == nil then
				arg_333_1.var_.characterEffect10058ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect10058ui_story then
					arg_333_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect10058ui_story then
				arg_333_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_336_4 = arg_333_1.actors_["4040ui_story"]
			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 and arg_333_1.var_.characterEffect4040ui_story == nil then
				arg_333_1.var_.characterEffect4040ui_story = var_336_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_6 = 0.200000002980232

			if var_336_5 <= arg_333_1.time_ and arg_333_1.time_ < var_336_5 + var_336_6 then
				local var_336_7 = (arg_333_1.time_ - var_336_5) / var_336_6

				if arg_333_1.var_.characterEffect4040ui_story then
					local var_336_8 = Mathf.Lerp(0, 0.5, var_336_7)

					arg_333_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_333_1.var_.characterEffect4040ui_story.fillRatio = var_336_8
				end
			end

			if arg_333_1.time_ >= var_336_5 + var_336_6 and arg_333_1.time_ < var_336_5 + var_336_6 + arg_336_0 and arg_333_1.var_.characterEffect4040ui_story then
				local var_336_9 = 0.5

				arg_333_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_333_1.var_.characterEffect4040ui_story.fillRatio = var_336_9
			end

			local var_336_10 = 0
			local var_336_11 = 0.65

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_12 = arg_333_1:FormatText(StoryNameCfg[471].name)

				arg_333_1.leftNameTxt_.text = var_336_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_13 = arg_333_1:GetWordFromCfg(411141081)
				local var_336_14 = arg_333_1:FormatText(var_336_13.content)

				arg_333_1.text_.text = var_336_14

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_15 = 26
				local var_336_16 = utf8.len(var_336_14)
				local var_336_17 = var_336_15 <= 0 and var_336_11 or var_336_11 * (var_336_16 / var_336_15)

				if var_336_17 > 0 and var_336_11 < var_336_17 then
					arg_333_1.talkMaxDuration = var_336_17

					if var_336_17 + var_336_10 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_17 + var_336_10
					end
				end

				arg_333_1.text_.text = var_336_14
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141081", "story_v_out_411141.awb") ~= 0 then
					local var_336_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141081", "story_v_out_411141.awb") / 1000

					if var_336_18 + var_336_10 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_18 + var_336_10
					end

					if var_336_13.prefab_name ~= "" and arg_333_1.actors_[var_336_13.prefab_name] ~= nil then
						local var_336_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_13.prefab_name].transform, "story_v_out_411141", "411141081", "story_v_out_411141.awb")

						arg_333_1:RecordAudio("411141081", var_336_19)
						arg_333_1:RecordAudio("411141081", var_336_19)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_411141", "411141081", "story_v_out_411141.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_411141", "411141081", "story_v_out_411141.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_20 = math.max(var_336_11, arg_333_1.talkMaxDuration)

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_20 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_10) / var_336_20

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_10 + var_336_20 and arg_333_1.time_ < var_336_10 + var_336_20 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play411141082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 411141082
		arg_337_1.duration_ = 8.1

		local var_337_0 = {
			zh = 4.333,
			ja = 8.1
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
				arg_337_0:Play411141083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.475

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[471].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(411141082)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141082", "story_v_out_411141.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141082", "story_v_out_411141.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_411141", "411141082", "story_v_out_411141.awb")

						arg_337_1:RecordAudio("411141082", var_340_9)
						arg_337_1:RecordAudio("411141082", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_411141", "411141082", "story_v_out_411141.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_411141", "411141082", "story_v_out_411141.awb")
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
	Play411141083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 411141083
		arg_341_1.duration_ = 3.6

		local var_341_0 = {
			zh = 3.266,
			ja = 3.6
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
				arg_341_0:Play411141084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 0.475

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_2 = arg_341_1:FormatText(StoryNameCfg[471].name)

				arg_341_1.leftNameTxt_.text = var_344_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_3 = arg_341_1:GetWordFromCfg(411141083)
				local var_344_4 = arg_341_1:FormatText(var_344_3.content)

				arg_341_1.text_.text = var_344_4

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_5 = 19
				local var_344_6 = utf8.len(var_344_4)
				local var_344_7 = var_344_5 <= 0 and var_344_1 or var_344_1 * (var_344_6 / var_344_5)

				if var_344_7 > 0 and var_344_1 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_0
					end
				end

				arg_341_1.text_.text = var_344_4
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141083", "story_v_out_411141.awb") ~= 0 then
					local var_344_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141083", "story_v_out_411141.awb") / 1000

					if var_344_8 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_8 + var_344_0
					end

					if var_344_3.prefab_name ~= "" and arg_341_1.actors_[var_344_3.prefab_name] ~= nil then
						local var_344_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_3.prefab_name].transform, "story_v_out_411141", "411141083", "story_v_out_411141.awb")

						arg_341_1:RecordAudio("411141083", var_344_9)
						arg_341_1:RecordAudio("411141083", var_344_9)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_411141", "411141083", "story_v_out_411141.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_411141", "411141083", "story_v_out_411141.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_10 = math.max(var_344_1, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_10 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_0) / var_344_10

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_10 and arg_341_1.time_ < var_344_0 + var_344_10 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play411141084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 411141084
		arg_345_1.duration_ = 8.866

		local var_345_0 = {
			zh = 5.2,
			ja = 8.866
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
				arg_345_0:Play411141085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10058ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.characterEffect10058ui_story == nil then
				arg_345_1.var_.characterEffect10058ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.200000002980232

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect10058ui_story then
					local var_348_4 = Mathf.Lerp(0, 0.5, var_348_3)

					arg_345_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_345_1.var_.characterEffect10058ui_story.fillRatio = var_348_4
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.characterEffect10058ui_story then
				local var_348_5 = 0.5

				arg_345_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_345_1.var_.characterEffect10058ui_story.fillRatio = var_348_5
			end

			local var_348_6 = arg_345_1.actors_["4040ui_story"]
			local var_348_7 = 0

			if var_348_7 < arg_345_1.time_ and arg_345_1.time_ <= var_348_7 + arg_348_0 and arg_345_1.var_.characterEffect4040ui_story == nil then
				arg_345_1.var_.characterEffect4040ui_story = var_348_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_8 = 0.200000002980232

			if var_348_7 <= arg_345_1.time_ and arg_345_1.time_ < var_348_7 + var_348_8 then
				local var_348_9 = (arg_345_1.time_ - var_348_7) / var_348_8

				if arg_345_1.var_.characterEffect4040ui_story then
					arg_345_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_7 + var_348_8 and arg_345_1.time_ < var_348_7 + var_348_8 + arg_348_0 and arg_345_1.var_.characterEffect4040ui_story then
				arg_345_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 then
				arg_345_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action6_2")
			end

			local var_348_11 = 0
			local var_348_12 = 0.475

			if var_348_11 < arg_345_1.time_ and arg_345_1.time_ <= var_348_11 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_13 = arg_345_1:FormatText(StoryNameCfg[668].name)

				arg_345_1.leftNameTxt_.text = var_348_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_14 = arg_345_1:GetWordFromCfg(411141084)
				local var_348_15 = arg_345_1:FormatText(var_348_14.content)

				arg_345_1.text_.text = var_348_15

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_16 = 19
				local var_348_17 = utf8.len(var_348_15)
				local var_348_18 = var_348_16 <= 0 and var_348_12 or var_348_12 * (var_348_17 / var_348_16)

				if var_348_18 > 0 and var_348_12 < var_348_18 then
					arg_345_1.talkMaxDuration = var_348_18

					if var_348_18 + var_348_11 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_18 + var_348_11
					end
				end

				arg_345_1.text_.text = var_348_15
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141084", "story_v_out_411141.awb") ~= 0 then
					local var_348_19 = manager.audio:GetVoiceLength("story_v_out_411141", "411141084", "story_v_out_411141.awb") / 1000

					if var_348_19 + var_348_11 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_19 + var_348_11
					end

					if var_348_14.prefab_name ~= "" and arg_345_1.actors_[var_348_14.prefab_name] ~= nil then
						local var_348_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_14.prefab_name].transform, "story_v_out_411141", "411141084", "story_v_out_411141.awb")

						arg_345_1:RecordAudio("411141084", var_348_20)
						arg_345_1:RecordAudio("411141084", var_348_20)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_411141", "411141084", "story_v_out_411141.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_411141", "411141084", "story_v_out_411141.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_21 = math.max(var_348_12, arg_345_1.talkMaxDuration)

			if var_348_11 <= arg_345_1.time_ and arg_345_1.time_ < var_348_11 + var_348_21 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_11) / var_348_21

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_11 + var_348_21 and arg_345_1.time_ < var_348_11 + var_348_21 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play411141085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 411141085
		arg_349_1.duration_ = 5.166

		local var_349_0 = {
			zh = 5.166,
			ja = 5.133
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
				arg_349_0:Play411141086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.65

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[668].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(411141085)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 26
				local var_352_6 = utf8.len(var_352_4)
				local var_352_7 = var_352_5 <= 0 and var_352_1 or var_352_1 * (var_352_6 / var_352_5)

				if var_352_7 > 0 and var_352_1 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_4
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141085", "story_v_out_411141.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141085", "story_v_out_411141.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_411141", "411141085", "story_v_out_411141.awb")

						arg_349_1:RecordAudio("411141085", var_352_9)
						arg_349_1:RecordAudio("411141085", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_411141", "411141085", "story_v_out_411141.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_411141", "411141085", "story_v_out_411141.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_10 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_10 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_10

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_10 and arg_349_1.time_ < var_352_0 + var_352_10 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play411141086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 411141086
		arg_353_1.duration_ = 3.5

		local var_353_0 = {
			zh = 3.5,
			ja = 2.333
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play411141087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["10058ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect10058ui_story == nil then
				arg_353_1.var_.characterEffect10058ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect10058ui_story then
					arg_353_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect10058ui_story then
				arg_353_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_356_4 = arg_353_1.actors_["4040ui_story"]
			local var_356_5 = 0

			if var_356_5 < arg_353_1.time_ and arg_353_1.time_ <= var_356_5 + arg_356_0 and arg_353_1.var_.characterEffect4040ui_story == nil then
				arg_353_1.var_.characterEffect4040ui_story = var_356_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_6 = 0.200000002980232

			if var_356_5 <= arg_353_1.time_ and arg_353_1.time_ < var_356_5 + var_356_6 then
				local var_356_7 = (arg_353_1.time_ - var_356_5) / var_356_6

				if arg_353_1.var_.characterEffect4040ui_story then
					local var_356_8 = Mathf.Lerp(0, 0.5, var_356_7)

					arg_353_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_353_1.var_.characterEffect4040ui_story.fillRatio = var_356_8
				end
			end

			if arg_353_1.time_ >= var_356_5 + var_356_6 and arg_353_1.time_ < var_356_5 + var_356_6 + arg_356_0 and arg_353_1.var_.characterEffect4040ui_story then
				local var_356_9 = 0.5

				arg_353_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_353_1.var_.characterEffect4040ui_story.fillRatio = var_356_9
			end

			local var_356_10 = 0
			local var_356_11 = 0.35

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_12 = arg_353_1:FormatText(StoryNameCfg[471].name)

				arg_353_1.leftNameTxt_.text = var_356_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_13 = arg_353_1:GetWordFromCfg(411141086)
				local var_356_14 = arg_353_1:FormatText(var_356_13.content)

				arg_353_1.text_.text = var_356_14

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_15 = 14
				local var_356_16 = utf8.len(var_356_14)
				local var_356_17 = var_356_15 <= 0 and var_356_11 or var_356_11 * (var_356_16 / var_356_15)

				if var_356_17 > 0 and var_356_11 < var_356_17 then
					arg_353_1.talkMaxDuration = var_356_17

					if var_356_17 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_17 + var_356_10
					end
				end

				arg_353_1.text_.text = var_356_14
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141086", "story_v_out_411141.awb") ~= 0 then
					local var_356_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141086", "story_v_out_411141.awb") / 1000

					if var_356_18 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_18 + var_356_10
					end

					if var_356_13.prefab_name ~= "" and arg_353_1.actors_[var_356_13.prefab_name] ~= nil then
						local var_356_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_13.prefab_name].transform, "story_v_out_411141", "411141086", "story_v_out_411141.awb")

						arg_353_1:RecordAudio("411141086", var_356_19)
						arg_353_1:RecordAudio("411141086", var_356_19)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_411141", "411141086", "story_v_out_411141.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_411141", "411141086", "story_v_out_411141.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_20 = math.max(var_356_11, arg_353_1.talkMaxDuration)

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_20 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_10) / var_356_20

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_10 + var_356_20 and arg_353_1.time_ < var_356_10 + var_356_20 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play411141087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 411141087
		arg_357_1.duration_ = 5.4

		local var_357_0 = {
			zh = 1.566,
			ja = 5.4
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
				arg_357_0:Play411141088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10058ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect10058ui_story == nil then
				arg_357_1.var_.characterEffect10058ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect10058ui_story then
					local var_360_4 = Mathf.Lerp(0, 0.5, var_360_3)

					arg_357_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_357_1.var_.characterEffect10058ui_story.fillRatio = var_360_4
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect10058ui_story then
				local var_360_5 = 0.5

				arg_357_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_357_1.var_.characterEffect10058ui_story.fillRatio = var_360_5
			end

			local var_360_6 = arg_357_1.actors_["4040ui_story"]
			local var_360_7 = 0

			if var_360_7 < arg_357_1.time_ and arg_357_1.time_ <= var_360_7 + arg_360_0 and arg_357_1.var_.characterEffect4040ui_story == nil then
				arg_357_1.var_.characterEffect4040ui_story = var_360_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_8 = 0.200000002980232

			if var_360_7 <= arg_357_1.time_ and arg_357_1.time_ < var_360_7 + var_360_8 then
				local var_360_9 = (arg_357_1.time_ - var_360_7) / var_360_8

				if arg_357_1.var_.characterEffect4040ui_story then
					arg_357_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_7 + var_360_8 and arg_357_1.time_ < var_360_7 + var_360_8 + arg_360_0 and arg_357_1.var_.characterEffect4040ui_story then
				arg_357_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_360_10 = 0
			local var_360_11 = 0.15

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_12 = arg_357_1:FormatText(StoryNameCfg[668].name)

				arg_357_1.leftNameTxt_.text = var_360_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_13 = arg_357_1:GetWordFromCfg(411141087)
				local var_360_14 = arg_357_1:FormatText(var_360_13.content)

				arg_357_1.text_.text = var_360_14

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_15 = 6
				local var_360_16 = utf8.len(var_360_14)
				local var_360_17 = var_360_15 <= 0 and var_360_11 or var_360_11 * (var_360_16 / var_360_15)

				if var_360_17 > 0 and var_360_11 < var_360_17 then
					arg_357_1.talkMaxDuration = var_360_17

					if var_360_17 + var_360_10 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_17 + var_360_10
					end
				end

				arg_357_1.text_.text = var_360_14
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141087", "story_v_out_411141.awb") ~= 0 then
					local var_360_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141087", "story_v_out_411141.awb") / 1000

					if var_360_18 + var_360_10 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_18 + var_360_10
					end

					if var_360_13.prefab_name ~= "" and arg_357_1.actors_[var_360_13.prefab_name] ~= nil then
						local var_360_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_13.prefab_name].transform, "story_v_out_411141", "411141087", "story_v_out_411141.awb")

						arg_357_1:RecordAudio("411141087", var_360_19)
						arg_357_1:RecordAudio("411141087", var_360_19)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_411141", "411141087", "story_v_out_411141.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_411141", "411141087", "story_v_out_411141.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_20 = math.max(var_360_11, arg_357_1.talkMaxDuration)

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_20 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_10) / var_360_20

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_10 + var_360_20 and arg_357_1.time_ < var_360_10 + var_360_20 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play411141088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 411141088
		arg_361_1.duration_ = 6.566

		local var_361_0 = {
			zh = 6.566,
			ja = 4.4
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play411141089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.95

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[668].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(411141088)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 38
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141088", "story_v_out_411141.awb") ~= 0 then
					local var_364_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141088", "story_v_out_411141.awb") / 1000

					if var_364_8 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_0
					end

					if var_364_3.prefab_name ~= "" and arg_361_1.actors_[var_364_3.prefab_name] ~= nil then
						local var_364_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_3.prefab_name].transform, "story_v_out_411141", "411141088", "story_v_out_411141.awb")

						arg_361_1:RecordAudio("411141088", var_364_9)
						arg_361_1:RecordAudio("411141088", var_364_9)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_411141", "411141088", "story_v_out_411141.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_411141", "411141088", "story_v_out_411141.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_10 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_10 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_10

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_10 and arg_361_1.time_ < var_364_0 + var_364_10 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play411141089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 411141089
		arg_365_1.duration_ = 6.8

		local var_365_0 = {
			zh = 4.8,
			ja = 6.8
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
				arg_365_0:Play411141090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.525

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_2 = arg_365_1:FormatText(StoryNameCfg[668].name)

				arg_365_1.leftNameTxt_.text = var_368_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_3 = arg_365_1:GetWordFromCfg(411141089)
				local var_368_4 = arg_365_1:FormatText(var_368_3.content)

				arg_365_1.text_.text = var_368_4

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_5 = 21
				local var_368_6 = utf8.len(var_368_4)
				local var_368_7 = var_368_5 <= 0 and var_368_1 or var_368_1 * (var_368_6 / var_368_5)

				if var_368_7 > 0 and var_368_1 < var_368_7 then
					arg_365_1.talkMaxDuration = var_368_7

					if var_368_7 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_7 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_4
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141089", "story_v_out_411141.awb") ~= 0 then
					local var_368_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141089", "story_v_out_411141.awb") / 1000

					if var_368_8 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_8 + var_368_0
					end

					if var_368_3.prefab_name ~= "" and arg_365_1.actors_[var_368_3.prefab_name] ~= nil then
						local var_368_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_3.prefab_name].transform, "story_v_out_411141", "411141089", "story_v_out_411141.awb")

						arg_365_1:RecordAudio("411141089", var_368_9)
						arg_365_1:RecordAudio("411141089", var_368_9)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_411141", "411141089", "story_v_out_411141.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_411141", "411141089", "story_v_out_411141.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_10 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_10 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_10

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_10 and arg_365_1.time_ < var_368_0 + var_368_10 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play411141090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 411141090
		arg_369_1.duration_ = 2.733

		local var_369_0 = {
			zh = 2.7,
			ja = 2.733
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
				arg_369_0:Play411141091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_1")
			end

			local var_372_1 = 0
			local var_372_2 = 0.325

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_3 = arg_369_1:FormatText(StoryNameCfg[668].name)

				arg_369_1.leftNameTxt_.text = var_372_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_4 = arg_369_1:GetWordFromCfg(411141090)
				local var_372_5 = arg_369_1:FormatText(var_372_4.content)

				arg_369_1.text_.text = var_372_5

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_6 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141090", "story_v_out_411141.awb") ~= 0 then
					local var_372_9 = manager.audio:GetVoiceLength("story_v_out_411141", "411141090", "story_v_out_411141.awb") / 1000

					if var_372_9 + var_372_1 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_9 + var_372_1
					end

					if var_372_4.prefab_name ~= "" and arg_369_1.actors_[var_372_4.prefab_name] ~= nil then
						local var_372_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_4.prefab_name].transform, "story_v_out_411141", "411141090", "story_v_out_411141.awb")

						arg_369_1:RecordAudio("411141090", var_372_10)
						arg_369_1:RecordAudio("411141090", var_372_10)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_411141", "411141090", "story_v_out_411141.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_411141", "411141090", "story_v_out_411141.awb")
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
	Play411141091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 411141091
		arg_373_1.duration_ = 2.7

		local var_373_0 = {
			zh = 2.133,
			ja = 2.7
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
				arg_373_0:Play411141092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["10058ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect10058ui_story == nil then
				arg_373_1.var_.characterEffect10058ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.200000002980232

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect10058ui_story then
					arg_373_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect10058ui_story then
				arg_373_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_376_4 = arg_373_1.actors_["4040ui_story"]
			local var_376_5 = 0

			if var_376_5 < arg_373_1.time_ and arg_373_1.time_ <= var_376_5 + arg_376_0 and arg_373_1.var_.characterEffect4040ui_story == nil then
				arg_373_1.var_.characterEffect4040ui_story = var_376_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_6 = 0.200000002980232

			if var_376_5 <= arg_373_1.time_ and arg_373_1.time_ < var_376_5 + var_376_6 then
				local var_376_7 = (arg_373_1.time_ - var_376_5) / var_376_6

				if arg_373_1.var_.characterEffect4040ui_story then
					local var_376_8 = Mathf.Lerp(0, 0.5, var_376_7)

					arg_373_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_373_1.var_.characterEffect4040ui_story.fillRatio = var_376_8
				end
			end

			if arg_373_1.time_ >= var_376_5 + var_376_6 and arg_373_1.time_ < var_376_5 + var_376_6 + arg_376_0 and arg_373_1.var_.characterEffect4040ui_story then
				local var_376_9 = 0.5

				arg_373_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_373_1.var_.characterEffect4040ui_story.fillRatio = var_376_9
			end

			local var_376_10 = 0
			local var_376_11 = 0.15

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_12 = arg_373_1:FormatText(StoryNameCfg[471].name)

				arg_373_1.leftNameTxt_.text = var_376_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_13 = arg_373_1:GetWordFromCfg(411141091)
				local var_376_14 = arg_373_1:FormatText(var_376_13.content)

				arg_373_1.text_.text = var_376_14

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_15 = 6
				local var_376_16 = utf8.len(var_376_14)
				local var_376_17 = var_376_15 <= 0 and var_376_11 or var_376_11 * (var_376_16 / var_376_15)

				if var_376_17 > 0 and var_376_11 < var_376_17 then
					arg_373_1.talkMaxDuration = var_376_17

					if var_376_17 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_17 + var_376_10
					end
				end

				arg_373_1.text_.text = var_376_14
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141091", "story_v_out_411141.awb") ~= 0 then
					local var_376_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141091", "story_v_out_411141.awb") / 1000

					if var_376_18 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_18 + var_376_10
					end

					if var_376_13.prefab_name ~= "" and arg_373_1.actors_[var_376_13.prefab_name] ~= nil then
						local var_376_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_13.prefab_name].transform, "story_v_out_411141", "411141091", "story_v_out_411141.awb")

						arg_373_1:RecordAudio("411141091", var_376_19)
						arg_373_1:RecordAudio("411141091", var_376_19)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_411141", "411141091", "story_v_out_411141.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_411141", "411141091", "story_v_out_411141.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_20 = math.max(var_376_11, arg_373_1.talkMaxDuration)

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_20 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_10) / var_376_20

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_10 + var_376_20 and arg_373_1.time_ < var_376_10 + var_376_20 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play411141092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 411141092
		arg_377_1.duration_ = 7.466

		local var_377_0 = {
			zh = 6.033,
			ja = 7.466
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play411141093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.75

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_2 = arg_377_1:FormatText(StoryNameCfg[471].name)

				arg_377_1.leftNameTxt_.text = var_380_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_3 = arg_377_1:GetWordFromCfg(411141092)
				local var_380_4 = arg_377_1:FormatText(var_380_3.content)

				arg_377_1.text_.text = var_380_4

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_5 = 30
				local var_380_6 = utf8.len(var_380_4)
				local var_380_7 = var_380_5 <= 0 and var_380_1 or var_380_1 * (var_380_6 / var_380_5)

				if var_380_7 > 0 and var_380_1 < var_380_7 then
					arg_377_1.talkMaxDuration = var_380_7

					if var_380_7 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_7 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_4
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141092", "story_v_out_411141.awb") ~= 0 then
					local var_380_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141092", "story_v_out_411141.awb") / 1000

					if var_380_8 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_8 + var_380_0
					end

					if var_380_3.prefab_name ~= "" and arg_377_1.actors_[var_380_3.prefab_name] ~= nil then
						local var_380_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_3.prefab_name].transform, "story_v_out_411141", "411141092", "story_v_out_411141.awb")

						arg_377_1:RecordAudio("411141092", var_380_9)
						arg_377_1:RecordAudio("411141092", var_380_9)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_411141", "411141092", "story_v_out_411141.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_411141", "411141092", "story_v_out_411141.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_10 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_10 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_10

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_10 and arg_377_1.time_ < var_380_0 + var_380_10 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play411141093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 411141093
		arg_381_1.duration_ = 5.8

		local var_381_0 = {
			zh = 5.8,
			ja = 5.766
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
				arg_381_0:Play411141094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.7

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[471].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(411141093)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 28
				local var_384_6 = utf8.len(var_384_4)
				local var_384_7 = var_384_5 <= 0 and var_384_1 or var_384_1 * (var_384_6 / var_384_5)

				if var_384_7 > 0 and var_384_1 < var_384_7 then
					arg_381_1.talkMaxDuration = var_384_7

					if var_384_7 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_7 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_4
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141093", "story_v_out_411141.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141093", "story_v_out_411141.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_411141", "411141093", "story_v_out_411141.awb")

						arg_381_1:RecordAudio("411141093", var_384_9)
						arg_381_1:RecordAudio("411141093", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_411141", "411141093", "story_v_out_411141.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_411141", "411141093", "story_v_out_411141.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_10 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_10 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_10

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_10 and arg_381_1.time_ < var_384_0 + var_384_10 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play411141094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 411141094
		arg_385_1.duration_ = 3.833

		local var_385_0 = {
			zh = 3.833,
			ja = 3
		}
		local var_385_1 = manager.audio:GetLocalizationFlag()

		if var_385_0[var_385_1] ~= nil then
			arg_385_1.duration_ = var_385_0[var_385_1]
		end

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play411141095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["10058ui_story"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.characterEffect10058ui_story == nil then
				arg_385_1.var_.characterEffect10058ui_story = var_388_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_2 = 0.200000002980232

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.characterEffect10058ui_story then
					local var_388_4 = Mathf.Lerp(0, 0.5, var_388_3)

					arg_385_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_385_1.var_.characterEffect10058ui_story.fillRatio = var_388_4
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.characterEffect10058ui_story then
				local var_388_5 = 0.5

				arg_385_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_385_1.var_.characterEffect10058ui_story.fillRatio = var_388_5
			end

			local var_388_6 = arg_385_1.actors_["4040ui_story"]
			local var_388_7 = 0

			if var_388_7 < arg_385_1.time_ and arg_385_1.time_ <= var_388_7 + arg_388_0 and arg_385_1.var_.characterEffect4040ui_story == nil then
				arg_385_1.var_.characterEffect4040ui_story = var_388_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_8 = 0.200000002980232

			if var_388_7 <= arg_385_1.time_ and arg_385_1.time_ < var_388_7 + var_388_8 then
				local var_388_9 = (arg_385_1.time_ - var_388_7) / var_388_8

				if arg_385_1.var_.characterEffect4040ui_story then
					arg_385_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_7 + var_388_8 and arg_385_1.time_ < var_388_7 + var_388_8 + arg_388_0 and arg_385_1.var_.characterEffect4040ui_story then
				arg_385_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 then
				arg_385_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action2_2")
			end

			local var_388_11 = 0

			if var_388_11 < arg_385_1.time_ and arg_385_1.time_ <= var_388_11 + arg_388_0 then
				arg_385_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_388_12 = 0
			local var_388_13 = 0.45

			if var_388_12 < arg_385_1.time_ and arg_385_1.time_ <= var_388_12 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_14 = arg_385_1:FormatText(StoryNameCfg[668].name)

				arg_385_1.leftNameTxt_.text = var_388_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_15 = arg_385_1:GetWordFromCfg(411141094)
				local var_388_16 = arg_385_1:FormatText(var_388_15.content)

				arg_385_1.text_.text = var_388_16

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_17 = 18
				local var_388_18 = utf8.len(var_388_16)
				local var_388_19 = var_388_17 <= 0 and var_388_13 or var_388_13 * (var_388_18 / var_388_17)

				if var_388_19 > 0 and var_388_13 < var_388_19 then
					arg_385_1.talkMaxDuration = var_388_19

					if var_388_19 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_19 + var_388_12
					end
				end

				arg_385_1.text_.text = var_388_16
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141094", "story_v_out_411141.awb") ~= 0 then
					local var_388_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141094", "story_v_out_411141.awb") / 1000

					if var_388_20 + var_388_12 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_20 + var_388_12
					end

					if var_388_15.prefab_name ~= "" and arg_385_1.actors_[var_388_15.prefab_name] ~= nil then
						local var_388_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_15.prefab_name].transform, "story_v_out_411141", "411141094", "story_v_out_411141.awb")

						arg_385_1:RecordAudio("411141094", var_388_21)
						arg_385_1:RecordAudio("411141094", var_388_21)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_411141", "411141094", "story_v_out_411141.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_411141", "411141094", "story_v_out_411141.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_22 = math.max(var_388_13, arg_385_1.talkMaxDuration)

			if var_388_12 <= arg_385_1.time_ and arg_385_1.time_ < var_388_12 + var_388_22 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_12) / var_388_22

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_12 + var_388_22 and arg_385_1.time_ < var_388_12 + var_388_22 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play411141095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 411141095
		arg_389_1.duration_ = 2.066

		local var_389_0 = {
			zh = 1.533,
			ja = 2.066
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
				arg_389_0:Play411141096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["10058ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect10058ui_story == nil then
				arg_389_1.var_.characterEffect10058ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect10058ui_story then
					arg_389_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect10058ui_story then
				arg_389_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_392_4 = arg_389_1.actors_["4040ui_story"]
			local var_392_5 = 0

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 and arg_389_1.var_.characterEffect4040ui_story == nil then
				arg_389_1.var_.characterEffect4040ui_story = var_392_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_6 = 0.200000002980232

			if var_392_5 <= arg_389_1.time_ and arg_389_1.time_ < var_392_5 + var_392_6 then
				local var_392_7 = (arg_389_1.time_ - var_392_5) / var_392_6

				if arg_389_1.var_.characterEffect4040ui_story then
					local var_392_8 = Mathf.Lerp(0, 0.5, var_392_7)

					arg_389_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_389_1.var_.characterEffect4040ui_story.fillRatio = var_392_8
				end
			end

			if arg_389_1.time_ >= var_392_5 + var_392_6 and arg_389_1.time_ < var_392_5 + var_392_6 + arg_392_0 and arg_389_1.var_.characterEffect4040ui_story then
				local var_392_9 = 0.5

				arg_389_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_389_1.var_.characterEffect4040ui_story.fillRatio = var_392_9
			end

			local var_392_10 = 0
			local var_392_11 = 0.15

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_12 = arg_389_1:FormatText(StoryNameCfg[471].name)

				arg_389_1.leftNameTxt_.text = var_392_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_13 = arg_389_1:GetWordFromCfg(411141095)
				local var_392_14 = arg_389_1:FormatText(var_392_13.content)

				arg_389_1.text_.text = var_392_14

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_15 = 6
				local var_392_16 = utf8.len(var_392_14)
				local var_392_17 = var_392_15 <= 0 and var_392_11 or var_392_11 * (var_392_16 / var_392_15)

				if var_392_17 > 0 and var_392_11 < var_392_17 then
					arg_389_1.talkMaxDuration = var_392_17

					if var_392_17 + var_392_10 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_17 + var_392_10
					end
				end

				arg_389_1.text_.text = var_392_14
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141095", "story_v_out_411141.awb") ~= 0 then
					local var_392_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141095", "story_v_out_411141.awb") / 1000

					if var_392_18 + var_392_10 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_18 + var_392_10
					end

					if var_392_13.prefab_name ~= "" and arg_389_1.actors_[var_392_13.prefab_name] ~= nil then
						local var_392_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_13.prefab_name].transform, "story_v_out_411141", "411141095", "story_v_out_411141.awb")

						arg_389_1:RecordAudio("411141095", var_392_19)
						arg_389_1:RecordAudio("411141095", var_392_19)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_411141", "411141095", "story_v_out_411141.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_411141", "411141095", "story_v_out_411141.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_20 = math.max(var_392_11, arg_389_1.talkMaxDuration)

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_20 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_10) / var_392_20

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_10 + var_392_20 and arg_389_1.time_ < var_392_10 + var_392_20 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play411141096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 411141096
		arg_393_1.duration_ = 3.466

		local var_393_0 = {
			zh = 2.066,
			ja = 3.466
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
				arg_393_0:Play411141097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["10058ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect10058ui_story == nil then
				arg_393_1.var_.characterEffect10058ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.200000002980232

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect10058ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_393_1.var_.characterEffect10058ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect10058ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_393_1.var_.characterEffect10058ui_story.fillRatio = var_396_5
			end

			local var_396_6 = arg_393_1.actors_["4040ui_story"]
			local var_396_7 = 0

			if var_396_7 < arg_393_1.time_ and arg_393_1.time_ <= var_396_7 + arg_396_0 and arg_393_1.var_.characterEffect4040ui_story == nil then
				arg_393_1.var_.characterEffect4040ui_story = var_396_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_8 = 0.200000002980232

			if var_396_7 <= arg_393_1.time_ and arg_393_1.time_ < var_396_7 + var_396_8 then
				local var_396_9 = (arg_393_1.time_ - var_396_7) / var_396_8

				if arg_393_1.var_.characterEffect4040ui_story then
					arg_393_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_7 + var_396_8 and arg_393_1.time_ < var_396_7 + var_396_8 + arg_396_0 and arg_393_1.var_.characterEffect4040ui_story then
				arg_393_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_396_10 = 0
			local var_396_11 = 0.125

			if var_396_10 < arg_393_1.time_ and arg_393_1.time_ <= var_396_10 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_12 = arg_393_1:FormatText(StoryNameCfg[668].name)

				arg_393_1.leftNameTxt_.text = var_396_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_13 = arg_393_1:GetWordFromCfg(411141096)
				local var_396_14 = arg_393_1:FormatText(var_396_13.content)

				arg_393_1.text_.text = var_396_14

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_15 = 5
				local var_396_16 = utf8.len(var_396_14)
				local var_396_17 = var_396_15 <= 0 and var_396_11 or var_396_11 * (var_396_16 / var_396_15)

				if var_396_17 > 0 and var_396_11 < var_396_17 then
					arg_393_1.talkMaxDuration = var_396_17

					if var_396_17 + var_396_10 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_17 + var_396_10
					end
				end

				arg_393_1.text_.text = var_396_14
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141096", "story_v_out_411141.awb") ~= 0 then
					local var_396_18 = manager.audio:GetVoiceLength("story_v_out_411141", "411141096", "story_v_out_411141.awb") / 1000

					if var_396_18 + var_396_10 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_18 + var_396_10
					end

					if var_396_13.prefab_name ~= "" and arg_393_1.actors_[var_396_13.prefab_name] ~= nil then
						local var_396_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_13.prefab_name].transform, "story_v_out_411141", "411141096", "story_v_out_411141.awb")

						arg_393_1:RecordAudio("411141096", var_396_19)
						arg_393_1:RecordAudio("411141096", var_396_19)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_411141", "411141096", "story_v_out_411141.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_411141", "411141096", "story_v_out_411141.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_20 = math.max(var_396_11, arg_393_1.talkMaxDuration)

			if var_396_10 <= arg_393_1.time_ and arg_393_1.time_ < var_396_10 + var_396_20 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_10) / var_396_20

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_10 + var_396_20 and arg_393_1.time_ < var_396_10 + var_396_20 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play411141097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 411141097
		arg_397_1.duration_ = 3.133

		local var_397_0 = {
			zh = 3.133,
			ja = 2.633
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
				arg_397_0:Play411141098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.275

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_2 = arg_397_1:FormatText(StoryNameCfg[668].name)

				arg_397_1.leftNameTxt_.text = var_400_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_3 = arg_397_1:GetWordFromCfg(411141097)
				local var_400_4 = arg_397_1:FormatText(var_400_3.content)

				arg_397_1.text_.text = var_400_4

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_5 = 11
				local var_400_6 = utf8.len(var_400_4)
				local var_400_7 = var_400_5 <= 0 and var_400_1 or var_400_1 * (var_400_6 / var_400_5)

				if var_400_7 > 0 and var_400_1 < var_400_7 then
					arg_397_1.talkMaxDuration = var_400_7

					if var_400_7 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_7 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_4
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141097", "story_v_out_411141.awb") ~= 0 then
					local var_400_8 = manager.audio:GetVoiceLength("story_v_out_411141", "411141097", "story_v_out_411141.awb") / 1000

					if var_400_8 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_8 + var_400_0
					end

					if var_400_3.prefab_name ~= "" and arg_397_1.actors_[var_400_3.prefab_name] ~= nil then
						local var_400_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_3.prefab_name].transform, "story_v_out_411141", "411141097", "story_v_out_411141.awb")

						arg_397_1:RecordAudio("411141097", var_400_9)
						arg_397_1:RecordAudio("411141097", var_400_9)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_411141", "411141097", "story_v_out_411141.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_411141", "411141097", "story_v_out_411141.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_10 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_10 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_10

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_10 and arg_397_1.time_ < var_400_0 + var_400_10 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play411141098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 411141098
		arg_401_1.duration_ = 2.5

		local var_401_0 = {
			zh = 1.999999999999,
			ja = 2.5
		}
		local var_401_1 = manager.audio:GetLocalizationFlag()

		if var_401_0[var_401_1] ~= nil then
			arg_401_1.duration_ = var_401_0[var_401_1]
		end

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play411141099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10058ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect10058ui_story == nil then
				arg_401_1.var_.characterEffect10058ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.200000002980232

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect10058ui_story then
					arg_401_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect10058ui_story then
				arg_401_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_404_4 = 0

			if var_404_4 < arg_401_1.time_ and arg_401_1.time_ <= var_404_4 + arg_404_0 then
				arg_401_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_404_5 = 0

			if var_404_5 < arg_401_1.time_ and arg_401_1.time_ <= var_404_5 + arg_404_0 then
				arg_401_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_404_6 = arg_401_1.actors_["4040ui_story"]
			local var_404_7 = 0

			if var_404_7 < arg_401_1.time_ and arg_401_1.time_ <= var_404_7 + arg_404_0 and arg_401_1.var_.characterEffect4040ui_story == nil then
				arg_401_1.var_.characterEffect4040ui_story = var_404_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_8 = 0.200000002980232

			if var_404_7 <= arg_401_1.time_ and arg_401_1.time_ < var_404_7 + var_404_8 then
				local var_404_9 = (arg_401_1.time_ - var_404_7) / var_404_8

				if arg_401_1.var_.characterEffect4040ui_story then
					local var_404_10 = Mathf.Lerp(0, 0.5, var_404_9)

					arg_401_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_401_1.var_.characterEffect4040ui_story.fillRatio = var_404_10
				end
			end

			if arg_401_1.time_ >= var_404_7 + var_404_8 and arg_401_1.time_ < var_404_7 + var_404_8 + arg_404_0 and arg_401_1.var_.characterEffect4040ui_story then
				local var_404_11 = 0.5

				arg_401_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_401_1.var_.characterEffect4040ui_story.fillRatio = var_404_11
			end

			local var_404_12 = 0
			local var_404_13 = 0.15

			if var_404_12 < arg_401_1.time_ and arg_401_1.time_ <= var_404_12 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_14 = arg_401_1:FormatText(StoryNameCfg[471].name)

				arg_401_1.leftNameTxt_.text = var_404_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_15 = arg_401_1:GetWordFromCfg(411141098)
				local var_404_16 = arg_401_1:FormatText(var_404_15.content)

				arg_401_1.text_.text = var_404_16

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_17 = 6
				local var_404_18 = utf8.len(var_404_16)
				local var_404_19 = var_404_17 <= 0 and var_404_13 or var_404_13 * (var_404_18 / var_404_17)

				if var_404_19 > 0 and var_404_13 < var_404_19 then
					arg_401_1.talkMaxDuration = var_404_19

					if var_404_19 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_19 + var_404_12
					end
				end

				arg_401_1.text_.text = var_404_16
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141098", "story_v_out_411141.awb") ~= 0 then
					local var_404_20 = manager.audio:GetVoiceLength("story_v_out_411141", "411141098", "story_v_out_411141.awb") / 1000

					if var_404_20 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_20 + var_404_12
					end

					if var_404_15.prefab_name ~= "" and arg_401_1.actors_[var_404_15.prefab_name] ~= nil then
						local var_404_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_15.prefab_name].transform, "story_v_out_411141", "411141098", "story_v_out_411141.awb")

						arg_401_1:RecordAudio("411141098", var_404_21)
						arg_401_1:RecordAudio("411141098", var_404_21)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_411141", "411141098", "story_v_out_411141.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_411141", "411141098", "story_v_out_411141.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_22 = math.max(var_404_13, arg_401_1.talkMaxDuration)

			if var_404_12 <= arg_401_1.time_ and arg_401_1.time_ < var_404_12 + var_404_22 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_12) / var_404_22

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_12 + var_404_22 and arg_401_1.time_ < var_404_12 + var_404_22 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play411141099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 411141099
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play411141100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["10058ui_story"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos10058ui_story = var_408_0.localPosition
			end

			local var_408_2 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2
				local var_408_4 = Vector3.New(0, 100, 0)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10058ui_story, var_408_4, var_408_3)

				local var_408_5 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_5.x, var_408_5.y, var_408_5.z)

				local var_408_6 = var_408_0.localEulerAngles

				var_408_6.z = 0
				var_408_6.x = 0
				var_408_0.localEulerAngles = var_408_6
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(0, 100, 0)

				local var_408_7 = manager.ui.mainCamera.transform.position - var_408_0.position

				var_408_0.forward = Vector3.New(var_408_7.x, var_408_7.y, var_408_7.z)

				local var_408_8 = var_408_0.localEulerAngles

				var_408_8.z = 0
				var_408_8.x = 0
				var_408_0.localEulerAngles = var_408_8
			end

			local var_408_9 = arg_405_1.actors_["10058ui_story"]
			local var_408_10 = 0

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 and arg_405_1.var_.characterEffect10058ui_story == nil then
				arg_405_1.var_.characterEffect10058ui_story = var_408_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_11 = 0.200000002980232

			if var_408_10 <= arg_405_1.time_ and arg_405_1.time_ < var_408_10 + var_408_11 then
				local var_408_12 = (arg_405_1.time_ - var_408_10) / var_408_11

				if arg_405_1.var_.characterEffect10058ui_story then
					local var_408_13 = Mathf.Lerp(0, 0.5, var_408_12)

					arg_405_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_405_1.var_.characterEffect10058ui_story.fillRatio = var_408_13
				end
			end

			if arg_405_1.time_ >= var_408_10 + var_408_11 and arg_405_1.time_ < var_408_10 + var_408_11 + arg_408_0 and arg_405_1.var_.characterEffect10058ui_story then
				local var_408_14 = 0.5

				arg_405_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_405_1.var_.characterEffect10058ui_story.fillRatio = var_408_14
			end

			local var_408_15 = arg_405_1.actors_["4040ui_story"].transform
			local var_408_16 = 0

			if var_408_16 < arg_405_1.time_ and arg_405_1.time_ <= var_408_16 + arg_408_0 then
				arg_405_1.var_.moveOldPos4040ui_story = var_408_15.localPosition
			end

			local var_408_17 = 0.001

			if var_408_16 <= arg_405_1.time_ and arg_405_1.time_ < var_408_16 + var_408_17 then
				local var_408_18 = (arg_405_1.time_ - var_408_16) / var_408_17
				local var_408_19 = Vector3.New(0, 100, 0)

				var_408_15.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos4040ui_story, var_408_19, var_408_18)

				local var_408_20 = manager.ui.mainCamera.transform.position - var_408_15.position

				var_408_15.forward = Vector3.New(var_408_20.x, var_408_20.y, var_408_20.z)

				local var_408_21 = var_408_15.localEulerAngles

				var_408_21.z = 0
				var_408_21.x = 0
				var_408_15.localEulerAngles = var_408_21
			end

			if arg_405_1.time_ >= var_408_16 + var_408_17 and arg_405_1.time_ < var_408_16 + var_408_17 + arg_408_0 then
				var_408_15.localPosition = Vector3.New(0, 100, 0)

				local var_408_22 = manager.ui.mainCamera.transform.position - var_408_15.position

				var_408_15.forward = Vector3.New(var_408_22.x, var_408_22.y, var_408_22.z)

				local var_408_23 = var_408_15.localEulerAngles

				var_408_23.z = 0
				var_408_23.x = 0
				var_408_15.localEulerAngles = var_408_23
			end

			local var_408_24 = 0
			local var_408_25 = 0.9

			if var_408_24 < arg_405_1.time_ and arg_405_1.time_ <= var_408_24 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_26 = arg_405_1:GetWordFromCfg(411141099)
				local var_408_27 = arg_405_1:FormatText(var_408_26.content)

				arg_405_1.text_.text = var_408_27

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_28 = 36
				local var_408_29 = utf8.len(var_408_27)
				local var_408_30 = var_408_28 <= 0 and var_408_25 or var_408_25 * (var_408_29 / var_408_28)

				if var_408_30 > 0 and var_408_25 < var_408_30 then
					arg_405_1.talkMaxDuration = var_408_30

					if var_408_30 + var_408_24 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_30 + var_408_24
					end
				end

				arg_405_1.text_.text = var_408_27
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_31 = math.max(var_408_25, arg_405_1.talkMaxDuration)

			if var_408_24 <= arg_405_1.time_ and arg_405_1.time_ < var_408_24 + var_408_31 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_24) / var_408_31

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_24 + var_408_31 and arg_405_1.time_ < var_408_24 + var_408_31 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play411141100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 411141100
		arg_409_1.duration_ = 4.366

		local var_409_0 = {
			zh = 2.966,
			ja = 4.366
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
			arg_409_1.auto_ = false
		end

		function arg_409_1.playNext_(arg_411_0)
			arg_409_1.onStoryFinished_()
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10058ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos10058ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0, -0.98, -6.1)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos10058ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["10058ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect10058ui_story == nil then
				arg_409_1.var_.characterEffect10058ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect10058ui_story then
					arg_409_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect10058ui_story then
				arg_409_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_412_14 = 0
			local var_412_15 = 0.325

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_16 = arg_409_1:FormatText(StoryNameCfg[471].name)

				arg_409_1.leftNameTxt_.text = var_412_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_17 = arg_409_1:GetWordFromCfg(411141100)
				local var_412_18 = arg_409_1:FormatText(var_412_17.content)

				arg_409_1.text_.text = var_412_18

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_19 = 13
				local var_412_20 = utf8.len(var_412_18)
				local var_412_21 = var_412_19 <= 0 and var_412_15 or var_412_15 * (var_412_20 / var_412_19)

				if var_412_21 > 0 and var_412_15 < var_412_21 then
					arg_409_1.talkMaxDuration = var_412_21

					if var_412_21 + var_412_14 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_21 + var_412_14
					end
				end

				arg_409_1.text_.text = var_412_18
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411141", "411141100", "story_v_out_411141.awb") ~= 0 then
					local var_412_22 = manager.audio:GetVoiceLength("story_v_out_411141", "411141100", "story_v_out_411141.awb") / 1000

					if var_412_22 + var_412_14 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_22 + var_412_14
					end

					if var_412_17.prefab_name ~= "" and arg_409_1.actors_[var_412_17.prefab_name] ~= nil then
						local var_412_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_17.prefab_name].transform, "story_v_out_411141", "411141100", "story_v_out_411141.awb")

						arg_409_1:RecordAudio("411141100", var_412_23)
						arg_409_1:RecordAudio("411141100", var_412_23)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_411141", "411141100", "story_v_out_411141.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_411141", "411141100", "story_v_out_411141.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_24 = math.max(var_412_15, arg_409_1.talkMaxDuration)

			if var_412_14 <= arg_409_1.time_ and arg_409_1.time_ < var_412_14 + var_412_24 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_14) / var_412_24

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_14 + var_412_24 and arg_409_1.time_ < var_412_14 + var_412_24 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D11"
	},
	voices = {
		"story_v_out_411141.awb"
	}
}
