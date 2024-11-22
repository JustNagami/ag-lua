return {
	Play411221001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 411221001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play411221002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST74"

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
				local var_4_5 = arg_1_1.bgs_.ST74

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
					if iter_4_0 ~= "ST74" then
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
			local var_4_23 = 0.3

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.433333333333333
			local var_4_27 = 0.3

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			local var_4_30 = 0

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_31 = 0.3

			if arg_1_1.time_ >= var_4_30 + var_4_31 and arg_1_1.time_ < var_4_30 + var_4_31 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 2
			local var_4_33 = 0.875

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_35 = arg_1_1:GetWordFromCfg(411221001)
				local var_4_36 = arg_1_1:FormatText(var_4_35.content)

				arg_1_1.text_.text = var_4_36

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_37 = 35
				local var_4_38 = utf8.len(var_4_36)
				local var_4_39 = var_4_37 <= 0 and var_4_33 or var_4_33 * (var_4_38 / var_4_37)

				if var_4_39 > 0 and var_4_33 < var_4_39 then
					arg_1_1.talkMaxDuration = var_4_39
					var_4_32 = var_4_32 + 0.3

					if var_4_39 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_36
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_40 = var_4_32 + 0.3
			local var_4_41 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_40 <= arg_1_1.time_ and arg_1_1.time_ < var_4_40 + var_4_41 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_40) / var_4_41

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play411221002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 411221002
		arg_7_1.duration_ = 8.5

		local var_7_0 = {
			zh = 5.566,
			ja = 8.5
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
				arg_7_0:Play411221003(arg_7_1)
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
				arg_7_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_10_19 = 0
			local var_10_20 = 0.675

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[471].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(411221002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 27
				local var_10_25 = utf8.len(var_10_23)
				local var_10_26 = var_10_24 <= 0 and var_10_20 or var_10_20 * (var_10_25 / var_10_24)

				if var_10_26 > 0 and var_10_20 < var_10_26 then
					arg_7_1.talkMaxDuration = var_10_26

					if var_10_26 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_26 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_23
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221002", "story_v_out_411221.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_411221", "411221002", "story_v_out_411221.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_411221", "411221002", "story_v_out_411221.awb")

						arg_7_1:RecordAudio("411221002", var_10_28)
						arg_7_1:RecordAudio("411221002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_411221", "411221002", "story_v_out_411221.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_411221", "411221002", "story_v_out_411221.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_29 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_29 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_29

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_29 and arg_7_1.time_ < var_10_19 + var_10_29 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play411221003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 411221003
		arg_11_1.duration_ = 5.6

		local var_11_0 = {
			zh = 5.033,
			ja = 5.6
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
				arg_11_0:Play411221004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.45

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

				local var_14_3 = arg_11_1:GetWordFromCfg(411221003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221003", "story_v_out_411221.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221003", "story_v_out_411221.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_411221", "411221003", "story_v_out_411221.awb")

						arg_11_1:RecordAudio("411221003", var_14_9)
						arg_11_1:RecordAudio("411221003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_411221", "411221003", "story_v_out_411221.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_411221", "411221003", "story_v_out_411221.awb")
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
	Play411221004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 411221004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play411221005(arg_15_1)
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

			local var_18_15 = 0
			local var_18_16 = 0.925

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_17 = arg_15_1:GetWordFromCfg(411221004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 37
				local var_18_20 = utf8.len(var_18_18)
				local var_18_21 = var_18_19 <= 0 and var_18_16 or var_18_16 * (var_18_20 / var_18_19)

				if var_18_21 > 0 and var_18_16 < var_18_21 then
					arg_15_1.talkMaxDuration = var_18_21

					if var_18_21 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_15
					end
				end

				arg_15_1.text_.text = var_18_18
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_16, arg_15_1.talkMaxDuration)

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_15) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_15 + var_18_22 and arg_15_1.time_ < var_18_15 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play411221005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 411221005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play411221006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 1.125

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_2 = arg_19_1:GetWordFromCfg(411221005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 45
				local var_22_5 = utf8.len(var_22_3)
				local var_22_6 = var_22_4 <= 0 and var_22_1 or var_22_1 * (var_22_5 / var_22_4)

				if var_22_6 > 0 and var_22_1 < var_22_6 then
					arg_19_1.talkMaxDuration = var_22_6

					if var_22_6 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_6 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_3
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_7 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_7 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_7

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_7 and arg_19_1.time_ < var_22_0 + var_22_7 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play411221006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 411221006
		arg_23_1.duration_ = 4.066

		local var_23_0 = {
			zh = 3.2,
			ja = 4.066
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
				arg_23_0:Play411221007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1095ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1095ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, -0.98, -6.1)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1095ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1095ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1095ui_story then
					arg_23_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				arg_23_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = 0
			local var_26_16 = 0.325

			if var_26_15 < arg_23_1.time_ and arg_23_1.time_ <= var_26_15 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_17 = arg_23_1:FormatText(StoryNameCfg[471].name)

				arg_23_1.leftNameTxt_.text = var_26_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_18 = arg_23_1:GetWordFromCfg(411221006)
				local var_26_19 = arg_23_1:FormatText(var_26_18.content)

				arg_23_1.text_.text = var_26_19

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_20 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221006", "story_v_out_411221.awb") ~= 0 then
					local var_26_23 = manager.audio:GetVoiceLength("story_v_out_411221", "411221006", "story_v_out_411221.awb") / 1000

					if var_26_23 + var_26_15 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_15
					end

					if var_26_18.prefab_name ~= "" and arg_23_1.actors_[var_26_18.prefab_name] ~= nil then
						local var_26_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_18.prefab_name].transform, "story_v_out_411221", "411221006", "story_v_out_411221.awb")

						arg_23_1:RecordAudio("411221006", var_26_24)
						arg_23_1:RecordAudio("411221006", var_26_24)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_411221", "411221006", "story_v_out_411221.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_411221", "411221006", "story_v_out_411221.awb")
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
	Play411221007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 411221007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play411221008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1095ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story == nil then
				arg_27_1.var_.characterEffect1095ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1095ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1095ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1095ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.925

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(411221007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 37
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play411221008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 411221008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play411221009(arg_31_1)
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

				local var_34_2 = arg_31_1:GetWordFromCfg(411221008)
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
	Play411221009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 411221009
		arg_35_1.duration_ = 4.766

		local var_35_0 = {
			zh = 3.9,
			ja = 4.766
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
				arg_35_0:Play411221010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1095ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1095ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -0.98, -6.1)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1095ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1095ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1095ui_story then
					arg_35_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				arg_35_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_15 = 0
			local var_38_16 = 0.4

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[471].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(411221009)
				local var_38_19 = arg_35_1:FormatText(var_38_18.content)

				arg_35_1.text_.text = var_38_19

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_20 = 16
				local var_38_21 = utf8.len(var_38_19)
				local var_38_22 = var_38_20 <= 0 and var_38_16 or var_38_16 * (var_38_21 / var_38_20)

				if var_38_22 > 0 and var_38_16 < var_38_22 then
					arg_35_1.talkMaxDuration = var_38_22

					if var_38_22 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_19
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221009", "story_v_out_411221.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_out_411221", "411221009", "story_v_out_411221.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_out_411221", "411221009", "story_v_out_411221.awb")

						arg_35_1:RecordAudio("411221009", var_38_24)
						arg_35_1:RecordAudio("411221009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_411221", "411221009", "story_v_out_411221.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_411221", "411221009", "story_v_out_411221.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_25 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_25 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_25

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_25 and arg_35_1.time_ < var_38_15 + var_38_25 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play411221010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 411221010
		arg_39_1.duration_ = 6.366

		local var_39_0 = {
			zh = 6.366,
			ja = 6.066
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
				arg_39_0:Play411221011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 2

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				local var_42_1 = manager.ui.mainCamera.transform.localPosition
				local var_42_2 = Vector3.New(0, 0, 10) + Vector3.New(var_42_1.x, var_42_1.y, 0)
				local var_42_3 = arg_39_1.bgs_.ST74

				var_42_3.transform.localPosition = var_42_2
				var_42_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_4 = var_42_3:GetComponent("SpriteRenderer")

				if var_42_4 and var_42_4.sprite then
					local var_42_5 = (var_42_3.transform.localPosition - var_42_1).z
					local var_42_6 = manager.ui.mainCameraCom_
					local var_42_7 = 2 * var_42_5 * Mathf.Tan(var_42_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_8 = var_42_7 * var_42_6.aspect
					local var_42_9 = var_42_4.sprite.bounds.size.x
					local var_42_10 = var_42_4.sprite.bounds.size.y
					local var_42_11 = var_42_8 / var_42_9
					local var_42_12 = var_42_7 / var_42_10
					local var_42_13 = var_42_12 < var_42_11 and var_42_11 or var_42_12

					var_42_3.transform.localScale = Vector3.New(var_42_13, var_42_13, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "ST74" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_15 = 2

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_15 then
				local var_42_16 = (arg_39_1.time_ - var_42_14) / var_42_15
				local var_42_17 = Color.New(0, 0, 0)

				var_42_17.a = Mathf.Lerp(0, 1, var_42_16)
				arg_39_1.mask_.color = var_42_17
			end

			if arg_39_1.time_ >= var_42_14 + var_42_15 and arg_39_1.time_ < var_42_14 + var_42_15 + arg_42_0 then
				local var_42_18 = Color.New(0, 0, 0)

				var_42_18.a = 1
				arg_39_1.mask_.color = var_42_18
			end

			local var_42_19 = 2

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_20 = 2

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / var_42_20
				local var_42_22 = Color.New(0, 0, 0)

				var_42_22.a = Mathf.Lerp(1, 0, var_42_21)
				arg_39_1.mask_.color = var_42_22
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 then
				local var_42_23 = Color.New(0, 0, 0)
				local var_42_24 = 0

				arg_39_1.mask_.enabled = false
				var_42_23.a = var_42_24
				arg_39_1.mask_.color = var_42_23
			end

			local var_42_25 = "10058ui_story"

			if arg_39_1.actors_[var_42_25] == nil then
				local var_42_26 = Object.Instantiate(Asset.Load("Char/" .. var_42_25), arg_39_1.stage_.transform)

				var_42_26.name = var_42_25
				var_42_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_39_1.actors_[var_42_25] = var_42_26

				local var_42_27 = var_42_26:GetComponentInChildren(typeof(CharacterEffect))

				var_42_27.enabled = true

				local var_42_28 = GameObjectTools.GetOrAddComponent(var_42_26, typeof(DynamicBoneHelper))

				if var_42_28 then
					var_42_28:EnableDynamicBone(false)
				end

				arg_39_1:ShowWeapon(var_42_27.transform, false)

				arg_39_1.var_[var_42_25 .. "Animator"] = var_42_27.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_39_1.var_[var_42_25 .. "Animator"].applyRootMotion = true
				arg_39_1.var_[var_42_25 .. "LipSync"] = var_42_27.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_42_29 = arg_39_1.actors_["10058ui_story"].transform
			local var_42_30 = 3.93333333333333

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.var_.moveOldPos10058ui_story = var_42_29.localPosition
			end

			local var_42_31 = 0.001

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_31 then
				local var_42_32 = (arg_39_1.time_ - var_42_30) / var_42_31
				local var_42_33 = Vector3.New(0, -0.98, -6.1)

				var_42_29.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10058ui_story, var_42_33, var_42_32)

				local var_42_34 = manager.ui.mainCamera.transform.position - var_42_29.position

				var_42_29.forward = Vector3.New(var_42_34.x, var_42_34.y, var_42_34.z)

				local var_42_35 = var_42_29.localEulerAngles

				var_42_35.z = 0
				var_42_35.x = 0
				var_42_29.localEulerAngles = var_42_35
			end

			if arg_39_1.time_ >= var_42_30 + var_42_31 and arg_39_1.time_ < var_42_30 + var_42_31 + arg_42_0 then
				var_42_29.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_42_36 = manager.ui.mainCamera.transform.position - var_42_29.position

				var_42_29.forward = Vector3.New(var_42_36.x, var_42_36.y, var_42_36.z)

				local var_42_37 = var_42_29.localEulerAngles

				var_42_37.z = 0
				var_42_37.x = 0
				var_42_29.localEulerAngles = var_42_37
			end

			local var_42_38 = arg_39_1.actors_["10058ui_story"]
			local var_42_39 = 3.93333333333333

			if var_42_39 < arg_39_1.time_ and arg_39_1.time_ <= var_42_39 + arg_42_0 and arg_39_1.var_.characterEffect10058ui_story == nil then
				arg_39_1.var_.characterEffect10058ui_story = var_42_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_40 = 0.200000002980232

			if var_42_39 <= arg_39_1.time_ and arg_39_1.time_ < var_42_39 + var_42_40 then
				local var_42_41 = (arg_39_1.time_ - var_42_39) / var_42_40

				if arg_39_1.var_.characterEffect10058ui_story then
					arg_39_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_39 + var_42_40 and arg_39_1.time_ < var_42_39 + var_42_40 + arg_42_0 and arg_39_1.var_.characterEffect10058ui_story then
				arg_39_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_42_42 = 3.93333333333333

			if var_42_42 < arg_39_1.time_ and arg_39_1.time_ <= var_42_42 + arg_42_0 then
				arg_39_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_42_43 = 3.93333333333333

			if var_42_43 < arg_39_1.time_ and arg_39_1.time_ <= var_42_43 + arg_42_0 then
				arg_39_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_44 = arg_39_1.actors_["1095ui_story"].transform
			local var_42_45 = 1.96599999815226

			if var_42_45 < arg_39_1.time_ and arg_39_1.time_ <= var_42_45 + arg_42_0 then
				arg_39_1.var_.moveOldPos1095ui_story = var_42_44.localPosition
			end

			local var_42_46 = 0.001

			if var_42_45 <= arg_39_1.time_ and arg_39_1.time_ < var_42_45 + var_42_46 then
				local var_42_47 = (arg_39_1.time_ - var_42_45) / var_42_46
				local var_42_48 = Vector3.New(0, 100, 0)

				var_42_44.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1095ui_story, var_42_48, var_42_47)

				local var_42_49 = manager.ui.mainCamera.transform.position - var_42_44.position

				var_42_44.forward = Vector3.New(var_42_49.x, var_42_49.y, var_42_49.z)

				local var_42_50 = var_42_44.localEulerAngles

				var_42_50.z = 0
				var_42_50.x = 0
				var_42_44.localEulerAngles = var_42_50
			end

			if arg_39_1.time_ >= var_42_45 + var_42_46 and arg_39_1.time_ < var_42_45 + var_42_46 + arg_42_0 then
				var_42_44.localPosition = Vector3.New(0, 100, 0)

				local var_42_51 = manager.ui.mainCamera.transform.position - var_42_44.position

				var_42_44.forward = Vector3.New(var_42_51.x, var_42_51.y, var_42_51.z)

				local var_42_52 = var_42_44.localEulerAngles

				var_42_52.z = 0
				var_42_52.x = 0
				var_42_44.localEulerAngles = var_42_52
			end

			if arg_39_1.frameCnt_ <= 1 then
				arg_39_1.dialog_:SetActive(false)
			end

			local var_42_53 = 4
			local var_42_54 = 0.175

			if var_42_53 < arg_39_1.time_ and arg_39_1.time_ <= var_42_53 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_55 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_55:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_56 = arg_39_1:FormatText(StoryNameCfg[471].name)

				arg_39_1.leftNameTxt_.text = var_42_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_57 = arg_39_1:GetWordFromCfg(411221010)
				local var_42_58 = arg_39_1:FormatText(var_42_57.content)

				arg_39_1.text_.text = var_42_58

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_59 = 7
				local var_42_60 = utf8.len(var_42_58)
				local var_42_61 = var_42_59 <= 0 and var_42_54 or var_42_54 * (var_42_60 / var_42_59)

				if var_42_61 > 0 and var_42_54 < var_42_61 then
					arg_39_1.talkMaxDuration = var_42_61
					var_42_53 = var_42_53 + 0.3

					if var_42_61 + var_42_53 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_61 + var_42_53
					end
				end

				arg_39_1.text_.text = var_42_58
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221010", "story_v_out_411221.awb") ~= 0 then
					local var_42_62 = manager.audio:GetVoiceLength("story_v_out_411221", "411221010", "story_v_out_411221.awb") / 1000

					if var_42_62 + var_42_53 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_62 + var_42_53
					end

					if var_42_57.prefab_name ~= "" and arg_39_1.actors_[var_42_57.prefab_name] ~= nil then
						local var_42_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_57.prefab_name].transform, "story_v_out_411221", "411221010", "story_v_out_411221.awb")

						arg_39_1:RecordAudio("411221010", var_42_63)
						arg_39_1:RecordAudio("411221010", var_42_63)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_411221", "411221010", "story_v_out_411221.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_411221", "411221010", "story_v_out_411221.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_64 = var_42_53 + 0.3
			local var_42_65 = math.max(var_42_54, arg_39_1.talkMaxDuration)

			if var_42_64 <= arg_39_1.time_ and arg_39_1.time_ < var_42_64 + var_42_65 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_64) / var_42_65

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_64 + var_42_65 and arg_39_1.time_ < var_42_64 + var_42_65 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play411221011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 411221011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play411221012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10058ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect10058ui_story == nil then
				arg_45_1.var_.characterEffect10058ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect10058ui_story then
					local var_48_4 = Mathf.Lerp(0, 0.5, var_48_3)

					arg_45_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_45_1.var_.characterEffect10058ui_story.fillRatio = var_48_4
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect10058ui_story then
				local var_48_5 = 0.5

				arg_45_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_45_1.var_.characterEffect10058ui_story.fillRatio = var_48_5
			end

			local var_48_6 = 0
			local var_48_7 = 0.925

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_8 = arg_45_1:GetWordFromCfg(411221011)
				local var_48_9 = arg_45_1:FormatText(var_48_8.content)

				arg_45_1.text_.text = var_48_9

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_10 = 37
				local var_48_11 = utf8.len(var_48_9)
				local var_48_12 = var_48_10 <= 0 and var_48_7 or var_48_7 * (var_48_11 / var_48_10)

				if var_48_12 > 0 and var_48_7 < var_48_12 then
					arg_45_1.talkMaxDuration = var_48_12

					if var_48_12 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_12 + var_48_6
					end
				end

				arg_45_1.text_.text = var_48_9
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_13 = math.max(var_48_7, arg_45_1.talkMaxDuration)

			if var_48_6 <= arg_45_1.time_ and arg_45_1.time_ < var_48_6 + var_48_13 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_6) / var_48_13

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_6 + var_48_13 and arg_45_1.time_ < var_48_6 + var_48_13 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play411221012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 411221012
		arg_49_1.duration_ = 5.766

		local var_49_0 = {
			zh = 4.233,
			ja = 5.766
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
				arg_49_0:Play411221013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10058ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect10058ui_story == nil then
				arg_49_1.var_.characterEffect10058ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect10058ui_story then
					arg_49_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect10058ui_story then
				arg_49_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_52_4 = 0

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 then
				arg_49_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_52_6 = 0
			local var_52_7 = 0.675

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_8 = arg_49_1:FormatText(StoryNameCfg[471].name)

				arg_49_1.leftNameTxt_.text = var_52_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_9 = arg_49_1:GetWordFromCfg(411221012)
				local var_52_10 = arg_49_1:FormatText(var_52_9.content)

				arg_49_1.text_.text = var_52_10

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_11 = 27
				local var_52_12 = utf8.len(var_52_10)
				local var_52_13 = var_52_11 <= 0 and var_52_7 or var_52_7 * (var_52_12 / var_52_11)

				if var_52_13 > 0 and var_52_7 < var_52_13 then
					arg_49_1.talkMaxDuration = var_52_13

					if var_52_13 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_13 + var_52_6
					end
				end

				arg_49_1.text_.text = var_52_10
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221012", "story_v_out_411221.awb") ~= 0 then
					local var_52_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221012", "story_v_out_411221.awb") / 1000

					if var_52_14 + var_52_6 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_14 + var_52_6
					end

					if var_52_9.prefab_name ~= "" and arg_49_1.actors_[var_52_9.prefab_name] ~= nil then
						local var_52_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_9.prefab_name].transform, "story_v_out_411221", "411221012", "story_v_out_411221.awb")

						arg_49_1:RecordAudio("411221012", var_52_15)
						arg_49_1:RecordAudio("411221012", var_52_15)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_411221", "411221012", "story_v_out_411221.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_411221", "411221012", "story_v_out_411221.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_16 = math.max(var_52_7, arg_49_1.talkMaxDuration)

			if var_52_6 <= arg_49_1.time_ and arg_49_1.time_ < var_52_6 + var_52_16 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_6) / var_52_16

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_6 + var_52_16 and arg_49_1.time_ < var_52_6 + var_52_16 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play411221013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 411221013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play411221014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10058ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect10058ui_story == nil then
				arg_53_1.var_.characterEffect10058ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect10058ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_53_1.var_.characterEffect10058ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect10058ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_53_1.var_.characterEffect10058ui_story.fillRatio = var_56_5
			end

			local var_56_6 = 0
			local var_56_7 = 0.9

			if var_56_6 < arg_53_1.time_ and arg_53_1.time_ <= var_56_6 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_8 = arg_53_1:GetWordFromCfg(411221013)
				local var_56_9 = arg_53_1:FormatText(var_56_8.content)

				arg_53_1.text_.text = var_56_9

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_10 = 36
				local var_56_11 = utf8.len(var_56_9)
				local var_56_12 = var_56_10 <= 0 and var_56_7 or var_56_7 * (var_56_11 / var_56_10)

				if var_56_12 > 0 and var_56_7 < var_56_12 then
					arg_53_1.talkMaxDuration = var_56_12

					if var_56_12 + var_56_6 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_12 + var_56_6
					end
				end

				arg_53_1.text_.text = var_56_9
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_13 = math.max(var_56_7, arg_53_1.talkMaxDuration)

			if var_56_6 <= arg_53_1.time_ and arg_53_1.time_ < var_56_6 + var_56_13 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_6) / var_56_13

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_6 + var_56_13 and arg_53_1.time_ < var_56_6 + var_56_13 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play411221014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 411221014
		arg_57_1.duration_ = 5.433

		local var_57_0 = {
			zh = 4.966,
			ja = 5.433
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
				arg_57_0:Play411221015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10058ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect10058ui_story == nil then
				arg_57_1.var_.characterEffect10058ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect10058ui_story then
					arg_57_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect10058ui_story then
				arg_57_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_60_4 = 0
			local var_60_5 = 0.45

			if var_60_4 < arg_57_1.time_ and arg_57_1.time_ <= var_60_4 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_6 = arg_57_1:FormatText(StoryNameCfg[471].name)

				arg_57_1.leftNameTxt_.text = var_60_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_7 = arg_57_1:GetWordFromCfg(411221014)
				local var_60_8 = arg_57_1:FormatText(var_60_7.content)

				arg_57_1.text_.text = var_60_8

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_9 = 18
				local var_60_10 = utf8.len(var_60_8)
				local var_60_11 = var_60_9 <= 0 and var_60_5 or var_60_5 * (var_60_10 / var_60_9)

				if var_60_11 > 0 and var_60_5 < var_60_11 then
					arg_57_1.talkMaxDuration = var_60_11

					if var_60_11 + var_60_4 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_11 + var_60_4
					end
				end

				arg_57_1.text_.text = var_60_8
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221014", "story_v_out_411221.awb") ~= 0 then
					local var_60_12 = manager.audio:GetVoiceLength("story_v_out_411221", "411221014", "story_v_out_411221.awb") / 1000

					if var_60_12 + var_60_4 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_12 + var_60_4
					end

					if var_60_7.prefab_name ~= "" and arg_57_1.actors_[var_60_7.prefab_name] ~= nil then
						local var_60_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_7.prefab_name].transform, "story_v_out_411221", "411221014", "story_v_out_411221.awb")

						arg_57_1:RecordAudio("411221014", var_60_13)
						arg_57_1:RecordAudio("411221014", var_60_13)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_411221", "411221014", "story_v_out_411221.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_411221", "411221014", "story_v_out_411221.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_14 = math.max(var_60_5, arg_57_1.talkMaxDuration)

			if var_60_4 <= arg_57_1.time_ and arg_57_1.time_ < var_60_4 + var_60_14 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_4) / var_60_14

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_4 + var_60_14 and arg_57_1.time_ < var_60_4 + var_60_14 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play411221015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 411221015
		arg_61_1.duration_ = 4.733

		local var_61_0 = {
			zh = 3.733,
			ja = 4.733
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
				arg_61_0:Play411221016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_2")
			end

			local var_64_1 = 0
			local var_64_2 = 0.4

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_3 = arg_61_1:FormatText(StoryNameCfg[471].name)

				arg_61_1.leftNameTxt_.text = var_64_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_4 = arg_61_1:GetWordFromCfg(411221015)
				local var_64_5 = arg_61_1:FormatText(var_64_4.content)

				arg_61_1.text_.text = var_64_5

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_6 = 16
				local var_64_7 = utf8.len(var_64_5)
				local var_64_8 = var_64_6 <= 0 and var_64_2 or var_64_2 * (var_64_7 / var_64_6)

				if var_64_8 > 0 and var_64_2 < var_64_8 then
					arg_61_1.talkMaxDuration = var_64_8

					if var_64_8 + var_64_1 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_1
					end
				end

				arg_61_1.text_.text = var_64_5
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221015", "story_v_out_411221.awb") ~= 0 then
					local var_64_9 = manager.audio:GetVoiceLength("story_v_out_411221", "411221015", "story_v_out_411221.awb") / 1000

					if var_64_9 + var_64_1 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_9 + var_64_1
					end

					if var_64_4.prefab_name ~= "" and arg_61_1.actors_[var_64_4.prefab_name] ~= nil then
						local var_64_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_4.prefab_name].transform, "story_v_out_411221", "411221015", "story_v_out_411221.awb")

						arg_61_1:RecordAudio("411221015", var_64_10)
						arg_61_1:RecordAudio("411221015", var_64_10)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_411221", "411221015", "story_v_out_411221.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_411221", "411221015", "story_v_out_411221.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_11 = math.max(var_64_2, arg_61_1.talkMaxDuration)

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_11 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_1) / var_64_11

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_1 + var_64_11 and arg_61_1.time_ < var_64_1 + var_64_11 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play411221016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 411221016
		arg_65_1.duration_ = 9

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play411221017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = "I06"

			if arg_65_1.bgs_[var_68_0] == nil then
				local var_68_1 = Object.Instantiate(arg_65_1.paintGo_)

				var_68_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_68_0)
				var_68_1.name = var_68_0
				var_68_1.transform.parent = arg_65_1.stage_.transform
				var_68_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_65_1.bgs_[var_68_0] = var_68_1
			end

			local var_68_2 = 2

			if var_68_2 < arg_65_1.time_ and arg_65_1.time_ <= var_68_2 + arg_68_0 then
				local var_68_3 = manager.ui.mainCamera.transform.localPosition
				local var_68_4 = Vector3.New(0, 0, 10) + Vector3.New(var_68_3.x, var_68_3.y, 0)
				local var_68_5 = arg_65_1.bgs_.I06

				var_68_5.transform.localPosition = var_68_4
				var_68_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_68_6 = var_68_5:GetComponent("SpriteRenderer")

				if var_68_6 and var_68_6.sprite then
					local var_68_7 = (var_68_5.transform.localPosition - var_68_3).z
					local var_68_8 = manager.ui.mainCameraCom_
					local var_68_9 = 2 * var_68_7 * Mathf.Tan(var_68_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_68_10 = var_68_9 * var_68_8.aspect
					local var_68_11 = var_68_6.sprite.bounds.size.x
					local var_68_12 = var_68_6.sprite.bounds.size.y
					local var_68_13 = var_68_10 / var_68_11
					local var_68_14 = var_68_9 / var_68_12
					local var_68_15 = var_68_14 < var_68_13 and var_68_13 or var_68_14

					var_68_5.transform.localScale = Vector3.New(var_68_15, var_68_15, 0)
				end

				for iter_68_0, iter_68_1 in pairs(arg_65_1.bgs_) do
					if iter_68_0 ~= "I06" then
						iter_68_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_68_16 = 0

			if var_68_16 < arg_65_1.time_ and arg_65_1.time_ <= var_68_16 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_17 = 2

			if var_68_16 <= arg_65_1.time_ and arg_65_1.time_ < var_68_16 + var_68_17 then
				local var_68_18 = (arg_65_1.time_ - var_68_16) / var_68_17
				local var_68_19 = Color.New(0, 0, 0)

				var_68_19.a = Mathf.Lerp(0, 1, var_68_18)
				arg_65_1.mask_.color = var_68_19
			end

			if arg_65_1.time_ >= var_68_16 + var_68_17 and arg_65_1.time_ < var_68_16 + var_68_17 + arg_68_0 then
				local var_68_20 = Color.New(0, 0, 0)

				var_68_20.a = 1
				arg_65_1.mask_.color = var_68_20
			end

			local var_68_21 = 2

			if var_68_21 < arg_65_1.time_ and arg_65_1.time_ <= var_68_21 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_22 = 2

			if var_68_21 <= arg_65_1.time_ and arg_65_1.time_ < var_68_21 + var_68_22 then
				local var_68_23 = (arg_65_1.time_ - var_68_21) / var_68_22
				local var_68_24 = Color.New(0, 0, 0)

				var_68_24.a = Mathf.Lerp(1, 0, var_68_23)
				arg_65_1.mask_.color = var_68_24
			end

			if arg_65_1.time_ >= var_68_21 + var_68_22 and arg_65_1.time_ < var_68_21 + var_68_22 + arg_68_0 then
				local var_68_25 = Color.New(0, 0, 0)
				local var_68_26 = 0

				arg_65_1.mask_.enabled = false
				var_68_25.a = var_68_26
				arg_65_1.mask_.color = var_68_25
			end

			local var_68_27 = arg_65_1.actors_["10058ui_story"].transform
			local var_68_28 = 2

			if var_68_28 < arg_65_1.time_ and arg_65_1.time_ <= var_68_28 + arg_68_0 then
				arg_65_1.var_.moveOldPos10058ui_story = var_68_27.localPosition
			end

			local var_68_29 = 0.001

			if var_68_28 <= arg_65_1.time_ and arg_65_1.time_ < var_68_28 + var_68_29 then
				local var_68_30 = (arg_65_1.time_ - var_68_28) / var_68_29
				local var_68_31 = Vector3.New(0, 100, 0)

				var_68_27.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos10058ui_story, var_68_31, var_68_30)

				local var_68_32 = manager.ui.mainCamera.transform.position - var_68_27.position

				var_68_27.forward = Vector3.New(var_68_32.x, var_68_32.y, var_68_32.z)

				local var_68_33 = var_68_27.localEulerAngles

				var_68_33.z = 0
				var_68_33.x = 0
				var_68_27.localEulerAngles = var_68_33
			end

			if arg_65_1.time_ >= var_68_28 + var_68_29 and arg_65_1.time_ < var_68_28 + var_68_29 + arg_68_0 then
				var_68_27.localPosition = Vector3.New(0, 100, 0)

				local var_68_34 = manager.ui.mainCamera.transform.position - var_68_27.position

				var_68_27.forward = Vector3.New(var_68_34.x, var_68_34.y, var_68_34.z)

				local var_68_35 = var_68_27.localEulerAngles

				var_68_35.z = 0
				var_68_35.x = 0
				var_68_27.localEulerAngles = var_68_35
			end

			local var_68_36 = arg_65_1.actors_["10058ui_story"]
			local var_68_37 = 2

			if var_68_37 < arg_65_1.time_ and arg_65_1.time_ <= var_68_37 + arg_68_0 and arg_65_1.var_.characterEffect10058ui_story == nil then
				arg_65_1.var_.characterEffect10058ui_story = var_68_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_38 = 0.200000002980232

			if var_68_37 <= arg_65_1.time_ and arg_65_1.time_ < var_68_37 + var_68_38 then
				local var_68_39 = (arg_65_1.time_ - var_68_37) / var_68_38

				if arg_65_1.var_.characterEffect10058ui_story then
					local var_68_40 = Mathf.Lerp(0, 0.5, var_68_39)

					arg_65_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_65_1.var_.characterEffect10058ui_story.fillRatio = var_68_40
				end
			end

			if arg_65_1.time_ >= var_68_37 + var_68_38 and arg_65_1.time_ < var_68_37 + var_68_38 + arg_68_0 and arg_65_1.var_.characterEffect10058ui_story then
				local var_68_41 = 0.5

				arg_65_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_65_1.var_.characterEffect10058ui_story.fillRatio = var_68_41
			end

			if arg_65_1.frameCnt_ <= 1 then
				arg_65_1.dialog_:SetActive(false)
			end

			local var_68_42 = 4
			local var_68_43 = 0.925

			if var_68_42 < arg_65_1.time_ and arg_65_1.time_ <= var_68_42 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				arg_65_1.dialog_:SetActive(true)

				local var_68_44 = LeanTween.value(arg_65_1.dialog_, 0, 1, 0.3)

				var_68_44:setOnUpdate(LuaHelper.FloatAction(function(arg_69_0)
					arg_65_1.dialogCg_.alpha = arg_69_0
				end))
				var_68_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_65_1.dialog_)
					var_68_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_65_1.duration_ = arg_65_1.duration_ + 0.3

				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_45 = arg_65_1:GetWordFromCfg(411221016)
				local var_68_46 = arg_65_1:FormatText(var_68_45.content)

				arg_65_1.text_.text = var_68_46

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_47 = 37
				local var_68_48 = utf8.len(var_68_46)
				local var_68_49 = var_68_47 <= 0 and var_68_43 or var_68_43 * (var_68_48 / var_68_47)

				if var_68_49 > 0 and var_68_43 < var_68_49 then
					arg_65_1.talkMaxDuration = var_68_49
					var_68_42 = var_68_42 + 0.3

					if var_68_49 + var_68_42 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_49 + var_68_42
					end
				end

				arg_65_1.text_.text = var_68_46
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_50 = var_68_42 + 0.3
			local var_68_51 = math.max(var_68_43, arg_65_1.talkMaxDuration)

			if var_68_50 <= arg_65_1.time_ and arg_65_1.time_ < var_68_50 + var_68_51 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_50) / var_68_51

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_50 + var_68_51 and arg_65_1.time_ < var_68_50 + var_68_51 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play411221017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 411221017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play411221018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.95

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(411221017)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 38
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play411221018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 411221018
		arg_75_1.duration_ = 5.266

		local var_75_0 = {
			zh = 4.166,
			ja = 5.266
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
				arg_75_0:Play411221019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10058ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10058ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -0.98, -6.1)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10058ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["10058ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect10058ui_story == nil then
				arg_75_1.var_.characterEffect10058ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect10058ui_story then
					arg_75_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect10058ui_story then
				arg_75_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_15 = 0
			local var_78_16 = 0.5

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_17 = arg_75_1:FormatText(StoryNameCfg[471].name)

				arg_75_1.leftNameTxt_.text = var_78_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_18 = arg_75_1:GetWordFromCfg(411221018)
				local var_78_19 = arg_75_1:FormatText(var_78_18.content)

				arg_75_1.text_.text = var_78_19

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_20 = 20
				local var_78_21 = utf8.len(var_78_19)
				local var_78_22 = var_78_20 <= 0 and var_78_16 or var_78_16 * (var_78_21 / var_78_20)

				if var_78_22 > 0 and var_78_16 < var_78_22 then
					arg_75_1.talkMaxDuration = var_78_22

					if var_78_22 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_22 + var_78_15
					end
				end

				arg_75_1.text_.text = var_78_19
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221018", "story_v_out_411221.awb") ~= 0 then
					local var_78_23 = manager.audio:GetVoiceLength("story_v_out_411221", "411221018", "story_v_out_411221.awb") / 1000

					if var_78_23 + var_78_15 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_23 + var_78_15
					end

					if var_78_18.prefab_name ~= "" and arg_75_1.actors_[var_78_18.prefab_name] ~= nil then
						local var_78_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_18.prefab_name].transform, "story_v_out_411221", "411221018", "story_v_out_411221.awb")

						arg_75_1:RecordAudio("411221018", var_78_24)
						arg_75_1:RecordAudio("411221018", var_78_24)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_411221", "411221018", "story_v_out_411221.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_411221", "411221018", "story_v_out_411221.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_16, arg_75_1.talkMaxDuration)

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_15) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_15 + var_78_25 and arg_75_1.time_ < var_78_15 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play411221019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 411221019
		arg_79_1.duration_ = 8.2

		local var_79_0 = {
			zh = 6.833,
			ja = 8.2
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
				arg_79_0:Play411221020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = "10002_tpose"

			if arg_79_1.actors_[var_82_0] == nil then
				local var_82_1 = Object.Instantiate(Asset.Load("Char/" .. var_82_0), arg_79_1.stage_.transform)

				var_82_1.name = var_82_0
				var_82_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_79_1.actors_[var_82_0] = var_82_1

				local var_82_2 = var_82_1:GetComponentInChildren(typeof(CharacterEffect))

				var_82_2.enabled = true

				local var_82_3 = GameObjectTools.GetOrAddComponent(var_82_1, typeof(DynamicBoneHelper))

				if var_82_3 then
					var_82_3:EnableDynamicBone(false)
				end

				arg_79_1:ShowWeapon(var_82_2.transform, false)

				arg_79_1.var_[var_82_0 .. "Animator"] = var_82_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_79_1.var_[var_82_0 .. "Animator"].applyRootMotion = true
				arg_79_1.var_[var_82_0 .. "LipSync"] = var_82_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_82_4 = arg_79_1.actors_["10002_tpose"].transform
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.var_.moveOldPos10002_tpose = var_82_4.localPosition
			end

			local var_82_6 = 0.001

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6
				local var_82_8 = Vector3.New(0, -1.2, -5.8)

				var_82_4.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10002_tpose, var_82_8, var_82_7)

				local var_82_9 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_9.x, var_82_9.y, var_82_9.z)

				local var_82_10 = var_82_4.localEulerAngles

				var_82_10.z = 0
				var_82_10.x = 0
				var_82_4.localEulerAngles = var_82_10
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 then
				var_82_4.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_4.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_4.localEulerAngles = var_82_12
			end

			local var_82_13 = arg_79_1.actors_["10002_tpose"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.characterEffect10002_tpose == nil then
				arg_79_1.var_.characterEffect10002_tpose = var_82_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_15 = 0.200000002980232

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.characterEffect10002_tpose then
					arg_79_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.characterEffect10002_tpose then
				arg_79_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_82_17 = 0

			if var_82_17 < arg_79_1.time_ and arg_79_1.time_ <= var_82_17 + arg_82_0 then
				arg_79_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_82_18 = 0

			if var_82_18 < arg_79_1.time_ and arg_79_1.time_ <= var_82_18 + arg_82_0 then
				arg_79_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_19 = arg_79_1.actors_["10058ui_story"].transform
			local var_82_20 = 0

			if var_82_20 < arg_79_1.time_ and arg_79_1.time_ <= var_82_20 + arg_82_0 then
				arg_79_1.var_.moveOldPos10058ui_story = var_82_19.localPosition
			end

			local var_82_21 = 0.001

			if var_82_20 <= arg_79_1.time_ and arg_79_1.time_ < var_82_20 + var_82_21 then
				local var_82_22 = (arg_79_1.time_ - var_82_20) / var_82_21
				local var_82_23 = Vector3.New(0, 100, 0)

				var_82_19.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10058ui_story, var_82_23, var_82_22)

				local var_82_24 = manager.ui.mainCamera.transform.position - var_82_19.position

				var_82_19.forward = Vector3.New(var_82_24.x, var_82_24.y, var_82_24.z)

				local var_82_25 = var_82_19.localEulerAngles

				var_82_25.z = 0
				var_82_25.x = 0
				var_82_19.localEulerAngles = var_82_25
			end

			if arg_79_1.time_ >= var_82_20 + var_82_21 and arg_79_1.time_ < var_82_20 + var_82_21 + arg_82_0 then
				var_82_19.localPosition = Vector3.New(0, 100, 0)

				local var_82_26 = manager.ui.mainCamera.transform.position - var_82_19.position

				var_82_19.forward = Vector3.New(var_82_26.x, var_82_26.y, var_82_26.z)

				local var_82_27 = var_82_19.localEulerAngles

				var_82_27.z = 0
				var_82_27.x = 0
				var_82_19.localEulerAngles = var_82_27
			end

			local var_82_28 = arg_79_1.actors_["10058ui_story"]
			local var_82_29 = 0

			if var_82_29 < arg_79_1.time_ and arg_79_1.time_ <= var_82_29 + arg_82_0 and arg_79_1.var_.characterEffect10058ui_story == nil then
				arg_79_1.var_.characterEffect10058ui_story = var_82_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_30 = 0.200000002980232

			if var_82_29 <= arg_79_1.time_ and arg_79_1.time_ < var_82_29 + var_82_30 then
				local var_82_31 = (arg_79_1.time_ - var_82_29) / var_82_30

				if arg_79_1.var_.characterEffect10058ui_story then
					local var_82_32 = Mathf.Lerp(0, 0.5, var_82_31)

					arg_79_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10058ui_story.fillRatio = var_82_32
				end
			end

			if arg_79_1.time_ >= var_82_29 + var_82_30 and arg_79_1.time_ < var_82_29 + var_82_30 + arg_82_0 and arg_79_1.var_.characterEffect10058ui_story then
				local var_82_33 = 0.5

				arg_79_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10058ui_story.fillRatio = var_82_33
			end

			local var_82_34 = 0
			local var_82_35 = 0.575

			if var_82_34 < arg_79_1.time_ and arg_79_1.time_ <= var_82_34 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_36 = arg_79_1:FormatText(StoryNameCfg[39].name)

				arg_79_1.leftNameTxt_.text = var_82_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_37 = arg_79_1:GetWordFromCfg(411221019)
				local var_82_38 = arg_79_1:FormatText(var_82_37.content)

				arg_79_1.text_.text = var_82_38

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_39 = 23
				local var_82_40 = utf8.len(var_82_38)
				local var_82_41 = var_82_39 <= 0 and var_82_35 or var_82_35 * (var_82_40 / var_82_39)

				if var_82_41 > 0 and var_82_35 < var_82_41 then
					arg_79_1.talkMaxDuration = var_82_41

					if var_82_41 + var_82_34 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_41 + var_82_34
					end
				end

				arg_79_1.text_.text = var_82_38
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221019", "story_v_out_411221.awb") ~= 0 then
					local var_82_42 = manager.audio:GetVoiceLength("story_v_out_411221", "411221019", "story_v_out_411221.awb") / 1000

					if var_82_42 + var_82_34 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_42 + var_82_34
					end

					if var_82_37.prefab_name ~= "" and arg_79_1.actors_[var_82_37.prefab_name] ~= nil then
						local var_82_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_37.prefab_name].transform, "story_v_out_411221", "411221019", "story_v_out_411221.awb")

						arg_79_1:RecordAudio("411221019", var_82_43)
						arg_79_1:RecordAudio("411221019", var_82_43)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_411221", "411221019", "story_v_out_411221.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_411221", "411221019", "story_v_out_411221.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_44 = math.max(var_82_35, arg_79_1.talkMaxDuration)

			if var_82_34 <= arg_79_1.time_ and arg_79_1.time_ < var_82_34 + var_82_44 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_34) / var_82_44

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_34 + var_82_44 and arg_79_1.time_ < var_82_34 + var_82_44 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play411221020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 411221020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play411221021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10002_tpose"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos10002_tpose = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, 100, 0)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10002_tpose, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, 100, 0)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["10002_tpose"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect10002_tpose == nil then
				arg_83_1.var_.characterEffect10002_tpose = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect10002_tpose then
					local var_86_13 = Mathf.Lerp(0, 0.5, var_86_12)

					arg_83_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_83_1.var_.characterEffect10002_tpose.fillRatio = var_86_13
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect10002_tpose then
				local var_86_14 = 0.5

				arg_83_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_83_1.var_.characterEffect10002_tpose.fillRatio = var_86_14
			end

			local var_86_15 = 0
			local var_86_16 = 0.85

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_17 = arg_83_1:GetWordFromCfg(411221020)
				local var_86_18 = arg_83_1:FormatText(var_86_17.content)

				arg_83_1.text_.text = var_86_18

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_19 = 34
				local var_86_20 = utf8.len(var_86_18)
				local var_86_21 = var_86_19 <= 0 and var_86_16 or var_86_16 * (var_86_20 / var_86_19)

				if var_86_21 > 0 and var_86_16 < var_86_21 then
					arg_83_1.talkMaxDuration = var_86_21

					if var_86_21 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_18
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_22 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_22 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_22

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_22 and arg_83_1.time_ < var_86_15 + var_86_22 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play411221021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 411221021
		arg_87_1.duration_ = 4.733

		local var_87_0 = {
			zh = 2.633,
			ja = 4.733
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
				arg_87_0:Play411221022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.125

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[60].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2045")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(411221021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221021", "story_v_out_411221.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221021", "story_v_out_411221.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_411221", "411221021", "story_v_out_411221.awb")

						arg_87_1:RecordAudio("411221021", var_90_9)
						arg_87_1:RecordAudio("411221021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_411221", "411221021", "story_v_out_411221.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_411221", "411221021", "story_v_out_411221.awb")
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
	Play411221022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 411221022
		arg_91_1.duration_ = 1.999999999999

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play411221023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10002_tpose"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos10002_tpose = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -1.2, -5.8)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10002_tpose, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["10002_tpose"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect10002_tpose == nil then
				arg_91_1.var_.characterEffect10002_tpose = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect10002_tpose then
					arg_91_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect10002_tpose then
				arg_91_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action2_1")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_94_15 = 0
			local var_94_16 = 0.1

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_17 = arg_91_1:FormatText(StoryNameCfg[39].name)

				arg_91_1.leftNameTxt_.text = var_94_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_18 = arg_91_1:GetWordFromCfg(411221022)
				local var_94_19 = arg_91_1:FormatText(var_94_18.content)

				arg_91_1.text_.text = var_94_19

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_20 = 4
				local var_94_21 = utf8.len(var_94_19)
				local var_94_22 = var_94_20 <= 0 and var_94_16 or var_94_16 * (var_94_21 / var_94_20)

				if var_94_22 > 0 and var_94_16 < var_94_22 then
					arg_91_1.talkMaxDuration = var_94_22

					if var_94_22 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_15
					end
				end

				arg_91_1.text_.text = var_94_19
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221022", "story_v_out_411221.awb") ~= 0 then
					local var_94_23 = manager.audio:GetVoiceLength("story_v_out_411221", "411221022", "story_v_out_411221.awb") / 1000

					if var_94_23 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_23 + var_94_15
					end

					if var_94_18.prefab_name ~= "" and arg_91_1.actors_[var_94_18.prefab_name] ~= nil then
						local var_94_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_18.prefab_name].transform, "story_v_out_411221", "411221022", "story_v_out_411221.awb")

						arg_91_1:RecordAudio("411221022", var_94_24)
						arg_91_1:RecordAudio("411221022", var_94_24)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_411221", "411221022", "story_v_out_411221.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_411221", "411221022", "story_v_out_411221.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_25 = math.max(var_94_16, arg_91_1.talkMaxDuration)

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_25 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_15) / var_94_25

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_15 + var_94_25 and arg_91_1.time_ < var_94_15 + var_94_25 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play411221023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 411221023
		arg_95_1.duration_ = 3.4

		local var_95_0 = {
			zh = 3.3,
			ja = 3.4
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
				arg_95_0:Play411221024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10058ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10058ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0.7, -0.98, -6.1)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10058ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["10058ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect10058ui_story == nil then
				arg_95_1.var_.characterEffect10058ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect10058ui_story then
					arg_95_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect10058ui_story then
				arg_95_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_15 = arg_95_1.actors_["10002_tpose"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos10002_tpose = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(-0.7, -1.2, -5.8)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10002_tpose, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_15.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_15.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				var_98_15.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_15.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_15.localEulerAngles = var_98_23
			end

			local var_98_24 = arg_95_1.actors_["10002_tpose"]
			local var_98_25 = 0

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 and arg_95_1.var_.characterEffect10002_tpose == nil then
				arg_95_1.var_.characterEffect10002_tpose = var_98_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_26 = 0.200000002980232

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_26 then
				local var_98_27 = (arg_95_1.time_ - var_98_25) / var_98_26

				if arg_95_1.var_.characterEffect10002_tpose then
					local var_98_28 = Mathf.Lerp(0, 0.5, var_98_27)

					arg_95_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_95_1.var_.characterEffect10002_tpose.fillRatio = var_98_28
				end
			end

			if arg_95_1.time_ >= var_98_25 + var_98_26 and arg_95_1.time_ < var_98_25 + var_98_26 + arg_98_0 and arg_95_1.var_.characterEffect10002_tpose then
				local var_98_29 = 0.5

				arg_95_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_95_1.var_.characterEffect10002_tpose.fillRatio = var_98_29
			end

			local var_98_30 = 0
			local var_98_31 = 0.35

			if var_98_30 < arg_95_1.time_ and arg_95_1.time_ <= var_98_30 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_32 = arg_95_1:FormatText(StoryNameCfg[471].name)

				arg_95_1.leftNameTxt_.text = var_98_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_33 = arg_95_1:GetWordFromCfg(411221023)
				local var_98_34 = arg_95_1:FormatText(var_98_33.content)

				arg_95_1.text_.text = var_98_34

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_35 = 14
				local var_98_36 = utf8.len(var_98_34)
				local var_98_37 = var_98_35 <= 0 and var_98_31 or var_98_31 * (var_98_36 / var_98_35)

				if var_98_37 > 0 and var_98_31 < var_98_37 then
					arg_95_1.talkMaxDuration = var_98_37

					if var_98_37 + var_98_30 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_37 + var_98_30
					end
				end

				arg_95_1.text_.text = var_98_34
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221023", "story_v_out_411221.awb") ~= 0 then
					local var_98_38 = manager.audio:GetVoiceLength("story_v_out_411221", "411221023", "story_v_out_411221.awb") / 1000

					if var_98_38 + var_98_30 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_38 + var_98_30
					end

					if var_98_33.prefab_name ~= "" and arg_95_1.actors_[var_98_33.prefab_name] ~= nil then
						local var_98_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_33.prefab_name].transform, "story_v_out_411221", "411221023", "story_v_out_411221.awb")

						arg_95_1:RecordAudio("411221023", var_98_39)
						arg_95_1:RecordAudio("411221023", var_98_39)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_411221", "411221023", "story_v_out_411221.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_411221", "411221023", "story_v_out_411221.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_40 = math.max(var_98_31, arg_95_1.talkMaxDuration)

			if var_98_30 <= arg_95_1.time_ and arg_95_1.time_ < var_98_30 + var_98_40 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_30) / var_98_40

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_30 + var_98_40 and arg_95_1.time_ < var_98_30 + var_98_40 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play411221024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 411221024
		arg_99_1.duration_ = 3.333

		local var_99_0 = {
			zh = 3.333,
			ja = 2.933
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
				arg_99_0:Play411221025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10058ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect10058ui_story == nil then
				arg_99_1.var_.characterEffect10058ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect10058ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_99_1.var_.characterEffect10058ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect10058ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_99_1.var_.characterEffect10058ui_story.fillRatio = var_102_5
			end

			local var_102_6 = arg_99_1.actors_["10002_tpose"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.characterEffect10002_tpose == nil then
				arg_99_1.var_.characterEffect10002_tpose = var_102_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_8 = 0.200000002980232

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.characterEffect10002_tpose then
					arg_99_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect10002_tpose then
				arg_99_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action2_2")
			end

			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_12 = 0
			local var_102_13 = 0.225

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[39].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(411221024)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 9
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221024", "story_v_out_411221.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221024", "story_v_out_411221.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_411221", "411221024", "story_v_out_411221.awb")

						arg_99_1:RecordAudio("411221024", var_102_21)
						arg_99_1:RecordAudio("411221024", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_411221", "411221024", "story_v_out_411221.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_411221", "411221024", "story_v_out_411221.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play411221025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 411221025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play411221026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10002_tpose"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect10002_tpose == nil then
				arg_103_1.var_.characterEffect10002_tpose = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect10002_tpose then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_103_1.var_.characterEffect10002_tpose.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect10002_tpose then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_103_1.var_.characterEffect10002_tpose.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.7

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_8 = arg_103_1:GetWordFromCfg(411221025)
				local var_106_9 = arg_103_1:FormatText(var_106_8.content)

				arg_103_1.text_.text = var_106_9

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_10 = 28
				local var_106_11 = utf8.len(var_106_9)
				local var_106_12 = var_106_10 <= 0 and var_106_7 or var_106_7 * (var_106_11 / var_106_10)

				if var_106_12 > 0 and var_106_7 < var_106_12 then
					arg_103_1.talkMaxDuration = var_106_12

					if var_106_12 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_12 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_9
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_13 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_13 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_13

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_13 and arg_103_1.time_ < var_106_6 + var_106_13 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play411221026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 411221026
		arg_107_1.duration_ = 7.166

		local var_107_0 = {
			zh = 7.166,
			ja = 4.033
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
				arg_107_0:Play411221027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10002_tpose"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect10002_tpose == nil then
				arg_107_1.var_.characterEffect10002_tpose = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect10002_tpose then
					arg_107_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect10002_tpose then
				arg_107_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_110_4 = 0

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_110_6 = 0
			local var_110_7 = 0.35

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[39].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(411221026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221026", "story_v_out_411221.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221026", "story_v_out_411221.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_411221", "411221026", "story_v_out_411221.awb")

						arg_107_1:RecordAudio("411221026", var_110_15)
						arg_107_1:RecordAudio("411221026", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_411221", "411221026", "story_v_out_411221.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_411221", "411221026", "story_v_out_411221.awb")
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
	Play411221027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 411221027
		arg_111_1.duration_ = 11.7

		local var_111_0 = {
			zh = 6.733,
			ja = 11.7
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
				arg_111_0:Play411221028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10058ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect10058ui_story == nil then
				arg_111_1.var_.characterEffect10058ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect10058ui_story then
					arg_111_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect10058ui_story then
				arg_111_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_114_4 = 0

			if var_114_4 < arg_111_1.time_ and arg_111_1.time_ <= var_114_4 + arg_114_0 then
				arg_111_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 then
				arg_111_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_114_6 = arg_111_1.actors_["10002_tpose"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.characterEffect10002_tpose == nil then
				arg_111_1.var_.characterEffect10002_tpose = var_114_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_8 = 0.200000002980232

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.characterEffect10002_tpose then
					local var_114_10 = Mathf.Lerp(0, 0.5, var_114_9)

					arg_111_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_111_1.var_.characterEffect10002_tpose.fillRatio = var_114_10
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.characterEffect10002_tpose then
				local var_114_11 = 0.5

				arg_111_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_111_1.var_.characterEffect10002_tpose.fillRatio = var_114_11
			end

			local var_114_12 = 0
			local var_114_13 = 0.85

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_14 = arg_111_1:FormatText(StoryNameCfg[471].name)

				arg_111_1.leftNameTxt_.text = var_114_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_15 = arg_111_1:GetWordFromCfg(411221027)
				local var_114_16 = arg_111_1:FormatText(var_114_15.content)

				arg_111_1.text_.text = var_114_16

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_17 = 34
				local var_114_18 = utf8.len(var_114_16)
				local var_114_19 = var_114_17 <= 0 and var_114_13 or var_114_13 * (var_114_18 / var_114_17)

				if var_114_19 > 0 and var_114_13 < var_114_19 then
					arg_111_1.talkMaxDuration = var_114_19

					if var_114_19 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_19 + var_114_12
					end
				end

				arg_111_1.text_.text = var_114_16
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221027", "story_v_out_411221.awb") ~= 0 then
					local var_114_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221027", "story_v_out_411221.awb") / 1000

					if var_114_20 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_12
					end

					if var_114_15.prefab_name ~= "" and arg_111_1.actors_[var_114_15.prefab_name] ~= nil then
						local var_114_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_15.prefab_name].transform, "story_v_out_411221", "411221027", "story_v_out_411221.awb")

						arg_111_1:RecordAudio("411221027", var_114_21)
						arg_111_1:RecordAudio("411221027", var_114_21)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_411221", "411221027", "story_v_out_411221.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_411221", "411221027", "story_v_out_411221.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_22 = math.max(var_114_13, arg_111_1.talkMaxDuration)

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_22 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_12) / var_114_22

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_12 + var_114_22 and arg_111_1.time_ < var_114_12 + var_114_22 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play411221028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 411221028
		arg_115_1.duration_ = 12.833

		local var_115_0 = {
			zh = 10.566,
			ja = 12.833
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
				arg_115_0:Play411221029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 1.3

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[471].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(411221028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221028", "story_v_out_411221.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221028", "story_v_out_411221.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_411221", "411221028", "story_v_out_411221.awb")

						arg_115_1:RecordAudio("411221028", var_118_9)
						arg_115_1:RecordAudio("411221028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_411221", "411221028", "story_v_out_411221.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_411221", "411221028", "story_v_out_411221.awb")
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
	Play411221029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 411221029
		arg_119_1.duration_ = 12.6

		local var_119_0 = {
			zh = 7.1,
			ja = 12.6
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
				arg_119_0:Play411221030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.95

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[471].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(411221029)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 38
				local var_122_6 = utf8.len(var_122_4)
				local var_122_7 = var_122_5 <= 0 and var_122_1 or var_122_1 * (var_122_6 / var_122_5)

				if var_122_7 > 0 and var_122_1 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_4
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221029", "story_v_out_411221.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221029", "story_v_out_411221.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_411221", "411221029", "story_v_out_411221.awb")

						arg_119_1:RecordAudio("411221029", var_122_9)
						arg_119_1:RecordAudio("411221029", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_411221", "411221029", "story_v_out_411221.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_411221", "411221029", "story_v_out_411221.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_10 and arg_119_1.time_ < var_122_0 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play411221030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 411221030
		arg_123_1.duration_ = 10.566

		local var_123_0 = {
			zh = 10.566,
			ja = 8.533
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
				arg_123_0:Play411221031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10058ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect10058ui_story == nil then
				arg_123_1.var_.characterEffect10058ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect10058ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_123_1.var_.characterEffect10058ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect10058ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_123_1.var_.characterEffect10058ui_story.fillRatio = var_126_5
			end

			local var_126_6 = arg_123_1.actors_["10002_tpose"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 and arg_123_1.var_.characterEffect10002_tpose == nil then
				arg_123_1.var_.characterEffect10002_tpose = var_126_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_8 = 0.200000002980232

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8

				if arg_123_1.var_.characterEffect10002_tpose then
					arg_123_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 and arg_123_1.var_.characterEffect10002_tpose then
				arg_123_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_126_10 = 0
			local var_126_11 = 0.725

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_12 = arg_123_1:FormatText(StoryNameCfg[39].name)

				arg_123_1.leftNameTxt_.text = var_126_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_13 = arg_123_1:GetWordFromCfg(411221030)
				local var_126_14 = arg_123_1:FormatText(var_126_13.content)

				arg_123_1.text_.text = var_126_14

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_15 = 29
				local var_126_16 = utf8.len(var_126_14)
				local var_126_17 = var_126_15 <= 0 and var_126_11 or var_126_11 * (var_126_16 / var_126_15)

				if var_126_17 > 0 and var_126_11 < var_126_17 then
					arg_123_1.talkMaxDuration = var_126_17

					if var_126_17 + var_126_10 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_17 + var_126_10
					end
				end

				arg_123_1.text_.text = var_126_14
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221030", "story_v_out_411221.awb") ~= 0 then
					local var_126_18 = manager.audio:GetVoiceLength("story_v_out_411221", "411221030", "story_v_out_411221.awb") / 1000

					if var_126_18 + var_126_10 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_18 + var_126_10
					end

					if var_126_13.prefab_name ~= "" and arg_123_1.actors_[var_126_13.prefab_name] ~= nil then
						local var_126_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_13.prefab_name].transform, "story_v_out_411221", "411221030", "story_v_out_411221.awb")

						arg_123_1:RecordAudio("411221030", var_126_19)
						arg_123_1:RecordAudio("411221030", var_126_19)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_411221", "411221030", "story_v_out_411221.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_411221", "411221030", "story_v_out_411221.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_20 = math.max(var_126_11, arg_123_1.talkMaxDuration)

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_20 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_10) / var_126_20

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_10 + var_126_20 and arg_123_1.time_ < var_126_10 + var_126_20 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play411221031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 411221031
		arg_127_1.duration_ = 8.5

		local var_127_0 = {
			zh = 8.5,
			ja = 7.2
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
				arg_127_0:Play411221032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_130_1 = 0
			local var_130_2 = 0.675

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_3 = arg_127_1:FormatText(StoryNameCfg[39].name)

				arg_127_1.leftNameTxt_.text = var_130_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_4 = arg_127_1:GetWordFromCfg(411221031)
				local var_130_5 = arg_127_1:FormatText(var_130_4.content)

				arg_127_1.text_.text = var_130_5

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_6 = 27
				local var_130_7 = utf8.len(var_130_5)
				local var_130_8 = var_130_6 <= 0 and var_130_2 or var_130_2 * (var_130_7 / var_130_6)

				if var_130_8 > 0 and var_130_2 < var_130_8 then
					arg_127_1.talkMaxDuration = var_130_8

					if var_130_8 + var_130_1 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_1
					end
				end

				arg_127_1.text_.text = var_130_5
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221031", "story_v_out_411221.awb") ~= 0 then
					local var_130_9 = manager.audio:GetVoiceLength("story_v_out_411221", "411221031", "story_v_out_411221.awb") / 1000

					if var_130_9 + var_130_1 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_9 + var_130_1
					end

					if var_130_4.prefab_name ~= "" and arg_127_1.actors_[var_130_4.prefab_name] ~= nil then
						local var_130_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_4.prefab_name].transform, "story_v_out_411221", "411221031", "story_v_out_411221.awb")

						arg_127_1:RecordAudio("411221031", var_130_10)
						arg_127_1:RecordAudio("411221031", var_130_10)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_411221", "411221031", "story_v_out_411221.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_411221", "411221031", "story_v_out_411221.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_11 = math.max(var_130_2, arg_127_1.talkMaxDuration)

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_11 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_1) / var_130_11

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_1 + var_130_11 and arg_127_1.time_ < var_130_1 + var_130_11 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play411221032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 411221032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play411221033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10058ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10058ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, 100, 0)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10058ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, 100, 0)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["10058ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect10058ui_story == nil then
				arg_131_1.var_.characterEffect10058ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect10058ui_story then
					local var_134_13 = Mathf.Lerp(0, 0.5, var_134_12)

					arg_131_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10058ui_story.fillRatio = var_134_13
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect10058ui_story then
				local var_134_14 = 0.5

				arg_131_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10058ui_story.fillRatio = var_134_14
			end

			local var_134_15 = arg_131_1.actors_["10002_tpose"].transform
			local var_134_16 = 0

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 then
				arg_131_1.var_.moveOldPos10002_tpose = var_134_15.localPosition
			end

			local var_134_17 = 0.001

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17
				local var_134_19 = Vector3.New(0, 100, 0)

				var_134_15.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10002_tpose, var_134_19, var_134_18)

				local var_134_20 = manager.ui.mainCamera.transform.position - var_134_15.position

				var_134_15.forward = Vector3.New(var_134_20.x, var_134_20.y, var_134_20.z)

				local var_134_21 = var_134_15.localEulerAngles

				var_134_21.z = 0
				var_134_21.x = 0
				var_134_15.localEulerAngles = var_134_21
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 then
				var_134_15.localPosition = Vector3.New(0, 100, 0)

				local var_134_22 = manager.ui.mainCamera.transform.position - var_134_15.position

				var_134_15.forward = Vector3.New(var_134_22.x, var_134_22.y, var_134_22.z)

				local var_134_23 = var_134_15.localEulerAngles

				var_134_23.z = 0
				var_134_23.x = 0
				var_134_15.localEulerAngles = var_134_23
			end

			local var_134_24 = arg_131_1.actors_["10002_tpose"]
			local var_134_25 = 0

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 and arg_131_1.var_.characterEffect10002_tpose == nil then
				arg_131_1.var_.characterEffect10002_tpose = var_134_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_26 = 0.200000002980232

			if var_134_25 <= arg_131_1.time_ and arg_131_1.time_ < var_134_25 + var_134_26 then
				local var_134_27 = (arg_131_1.time_ - var_134_25) / var_134_26

				if arg_131_1.var_.characterEffect10002_tpose then
					local var_134_28 = Mathf.Lerp(0, 0.5, var_134_27)

					arg_131_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_131_1.var_.characterEffect10002_tpose.fillRatio = var_134_28
				end
			end

			if arg_131_1.time_ >= var_134_25 + var_134_26 and arg_131_1.time_ < var_134_25 + var_134_26 + arg_134_0 and arg_131_1.var_.characterEffect10002_tpose then
				local var_134_29 = 0.5

				arg_131_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_131_1.var_.characterEffect10002_tpose.fillRatio = var_134_29
			end

			local var_134_30 = 0
			local var_134_31 = 1.35

			if var_134_30 < arg_131_1.time_ and arg_131_1.time_ <= var_134_30 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_32 = arg_131_1:GetWordFromCfg(411221032)
				local var_134_33 = arg_131_1:FormatText(var_134_32.content)

				arg_131_1.text_.text = var_134_33

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_34 = 54
				local var_134_35 = utf8.len(var_134_33)
				local var_134_36 = var_134_34 <= 0 and var_134_31 or var_134_31 * (var_134_35 / var_134_34)

				if var_134_36 > 0 and var_134_31 < var_134_36 then
					arg_131_1.talkMaxDuration = var_134_36

					if var_134_36 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_36 + var_134_30
					end
				end

				arg_131_1.text_.text = var_134_33
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_37 = math.max(var_134_31, arg_131_1.talkMaxDuration)

			if var_134_30 <= arg_131_1.time_ and arg_131_1.time_ < var_134_30 + var_134_37 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_30) / var_134_37

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_30 + var_134_37 and arg_131_1.time_ < var_134_30 + var_134_37 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play411221033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 411221033
		arg_135_1.duration_ = 9.4

		local var_135_0 = {
			zh = 9.1,
			ja = 9.4
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
				arg_135_0:Play411221034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_138_2 = arg_135_1.actors_["10002_tpose"].transform
			local var_138_3 = 0

			if var_138_3 < arg_135_1.time_ and arg_135_1.time_ <= var_138_3 + arg_138_0 then
				arg_135_1.var_.moveOldPos10002_tpose = var_138_2.localPosition
			end

			local var_138_4 = 0.001

			if var_138_3 <= arg_135_1.time_ and arg_135_1.time_ < var_138_3 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_3) / var_138_4
				local var_138_6 = Vector3.New(-0.7, -1.2, -5.8)

				var_138_2.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10002_tpose, var_138_6, var_138_5)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_2.position

				var_138_2.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_2.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_2.localEulerAngles = var_138_8
			end

			if arg_135_1.time_ >= var_138_3 + var_138_4 and arg_135_1.time_ < var_138_3 + var_138_4 + arg_138_0 then
				var_138_2.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_138_9 = manager.ui.mainCamera.transform.position - var_138_2.position

				var_138_2.forward = Vector3.New(var_138_9.x, var_138_9.y, var_138_9.z)

				local var_138_10 = var_138_2.localEulerAngles

				var_138_10.z = 0
				var_138_10.x = 0
				var_138_2.localEulerAngles = var_138_10
			end

			local var_138_11 = arg_135_1.actors_["10002_tpose"]
			local var_138_12 = 0

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 and arg_135_1.var_.characterEffect10002_tpose == nil then
				arg_135_1.var_.characterEffect10002_tpose = var_138_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_13 = 0.200000002980232

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_13 then
				local var_138_14 = (arg_135_1.time_ - var_138_12) / var_138_13

				if arg_135_1.var_.characterEffect10002_tpose then
					arg_135_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_12 + var_138_13 and arg_135_1.time_ < var_138_12 + var_138_13 + arg_138_0 and arg_135_1.var_.characterEffect10002_tpose then
				arg_135_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_138_15 = 0
			local var_138_16 = 0.75

			if var_138_15 < arg_135_1.time_ and arg_135_1.time_ <= var_138_15 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_17 = arg_135_1:FormatText(StoryNameCfg[39].name)

				arg_135_1.leftNameTxt_.text = var_138_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_18 = arg_135_1:GetWordFromCfg(411221033)
				local var_138_19 = arg_135_1:FormatText(var_138_18.content)

				arg_135_1.text_.text = var_138_19

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_20 = 30
				local var_138_21 = utf8.len(var_138_19)
				local var_138_22 = var_138_20 <= 0 and var_138_16 or var_138_16 * (var_138_21 / var_138_20)

				if var_138_22 > 0 and var_138_16 < var_138_22 then
					arg_135_1.talkMaxDuration = var_138_22

					if var_138_22 + var_138_15 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_22 + var_138_15
					end
				end

				arg_135_1.text_.text = var_138_19
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221033", "story_v_out_411221.awb") ~= 0 then
					local var_138_23 = manager.audio:GetVoiceLength("story_v_out_411221", "411221033", "story_v_out_411221.awb") / 1000

					if var_138_23 + var_138_15 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_23 + var_138_15
					end

					if var_138_18.prefab_name ~= "" and arg_135_1.actors_[var_138_18.prefab_name] ~= nil then
						local var_138_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_18.prefab_name].transform, "story_v_out_411221", "411221033", "story_v_out_411221.awb")

						arg_135_1:RecordAudio("411221033", var_138_24)
						arg_135_1:RecordAudio("411221033", var_138_24)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_411221", "411221033", "story_v_out_411221.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_411221", "411221033", "story_v_out_411221.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_25 = math.max(var_138_16, arg_135_1.talkMaxDuration)

			if var_138_15 <= arg_135_1.time_ and arg_135_1.time_ < var_138_15 + var_138_25 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_15) / var_138_25

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_15 + var_138_25 and arg_135_1.time_ < var_138_15 + var_138_25 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play411221034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 411221034
		arg_139_1.duration_ = 2.066

		local var_139_0 = {
			zh = 1.999999999999,
			ja = 2.066
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
				arg_139_0:Play411221035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10058ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect10058ui_story == nil then
				arg_139_1.var_.characterEffect10058ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect10058ui_story then
					arg_139_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect10058ui_story then
				arg_139_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["10058ui_story"].transform
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1.var_.moveOldPos10058ui_story = var_142_4.localPosition
			end

			local var_142_6 = 0.001

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6
				local var_142_8 = Vector3.New(0.7, -0.98, -6.1)

				var_142_4.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10058ui_story, var_142_8, var_142_7)

				local var_142_9 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_9.x, var_142_9.y, var_142_9.z)

				local var_142_10 = var_142_4.localEulerAngles

				var_142_10.z = 0
				var_142_10.x = 0
				var_142_4.localEulerAngles = var_142_10
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 then
				var_142_4.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_142_11 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_11.x, var_142_11.y, var_142_11.z)

				local var_142_12 = var_142_4.localEulerAngles

				var_142_12.z = 0
				var_142_12.x = 0
				var_142_4.localEulerAngles = var_142_12
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_142_15 = arg_139_1.actors_["10002_tpose"].transform
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.var_.moveOldPos10002_tpose = var_142_15.localPosition
			end

			local var_142_17 = 0.001

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17
				local var_142_19 = Vector3.New(-0.7, -1.2, -5.8)

				var_142_15.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10002_tpose, var_142_19, var_142_18)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_15.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_15.localEulerAngles = var_142_21
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 then
				var_142_15.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_142_22 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_22.x, var_142_22.y, var_142_22.z)

				local var_142_23 = var_142_15.localEulerAngles

				var_142_23.z = 0
				var_142_23.x = 0
				var_142_15.localEulerAngles = var_142_23
			end

			local var_142_24 = arg_139_1.actors_["10002_tpose"]
			local var_142_25 = 0

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 and arg_139_1.var_.characterEffect10002_tpose == nil then
				arg_139_1.var_.characterEffect10002_tpose = var_142_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_26 = 0.200000002980232

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_26 then
				local var_142_27 = (arg_139_1.time_ - var_142_25) / var_142_26

				if arg_139_1.var_.characterEffect10002_tpose then
					local var_142_28 = Mathf.Lerp(0, 0.5, var_142_27)

					arg_139_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_139_1.var_.characterEffect10002_tpose.fillRatio = var_142_28
				end
			end

			if arg_139_1.time_ >= var_142_25 + var_142_26 and arg_139_1.time_ < var_142_25 + var_142_26 + arg_142_0 and arg_139_1.var_.characterEffect10002_tpose then
				local var_142_29 = 0.5

				arg_139_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_139_1.var_.characterEffect10002_tpose.fillRatio = var_142_29
			end

			local var_142_30 = 0
			local var_142_31 = 0.25

			if var_142_30 < arg_139_1.time_ and arg_139_1.time_ <= var_142_30 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_32 = arg_139_1:FormatText(StoryNameCfg[471].name)

				arg_139_1.leftNameTxt_.text = var_142_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_33 = arg_139_1:GetWordFromCfg(411221034)
				local var_142_34 = arg_139_1:FormatText(var_142_33.content)

				arg_139_1.text_.text = var_142_34

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_35 = 10
				local var_142_36 = utf8.len(var_142_34)
				local var_142_37 = var_142_35 <= 0 and var_142_31 or var_142_31 * (var_142_36 / var_142_35)

				if var_142_37 > 0 and var_142_31 < var_142_37 then
					arg_139_1.talkMaxDuration = var_142_37

					if var_142_37 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_37 + var_142_30
					end
				end

				arg_139_1.text_.text = var_142_34
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221034", "story_v_out_411221.awb") ~= 0 then
					local var_142_38 = manager.audio:GetVoiceLength("story_v_out_411221", "411221034", "story_v_out_411221.awb") / 1000

					if var_142_38 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_38 + var_142_30
					end

					if var_142_33.prefab_name ~= "" and arg_139_1.actors_[var_142_33.prefab_name] ~= nil then
						local var_142_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_33.prefab_name].transform, "story_v_out_411221", "411221034", "story_v_out_411221.awb")

						arg_139_1:RecordAudio("411221034", var_142_39)
						arg_139_1:RecordAudio("411221034", var_142_39)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_411221", "411221034", "story_v_out_411221.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_411221", "411221034", "story_v_out_411221.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_40 = math.max(var_142_31, arg_139_1.talkMaxDuration)

			if var_142_30 <= arg_139_1.time_ and arg_139_1.time_ < var_142_30 + var_142_40 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_30) / var_142_40

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_30 + var_142_40 and arg_139_1.time_ < var_142_30 + var_142_40 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play411221035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 411221035
		arg_143_1.duration_ = 9

		local var_143_0 = {
			zh = 9,
			ja = 8.133
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
				arg_143_0:Play411221036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10002_tpose"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect10002_tpose == nil then
				arg_143_1.var_.characterEffect10002_tpose = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect10002_tpose then
					arg_143_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect10002_tpose then
				arg_143_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_146_4 = 0

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 then
				arg_143_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_146_6 = arg_143_1.actors_["10058ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect10058ui_story == nil then
				arg_143_1.var_.characterEffect10058ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.200000002980232

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect10058ui_story then
					local var_146_10 = Mathf.Lerp(0, 0.5, var_146_9)

					arg_143_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_143_1.var_.characterEffect10058ui_story.fillRatio = var_146_10
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect10058ui_story then
				local var_146_11 = 0.5

				arg_143_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_143_1.var_.characterEffect10058ui_story.fillRatio = var_146_11
			end

			local var_146_12 = 0
			local var_146_13 = 0.625

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[39].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(411221035)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221035", "story_v_out_411221.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221035", "story_v_out_411221.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_out_411221", "411221035", "story_v_out_411221.awb")

						arg_143_1:RecordAudio("411221035", var_146_21)
						arg_143_1:RecordAudio("411221035", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_411221", "411221035", "story_v_out_411221.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_411221", "411221035", "story_v_out_411221.awb")
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
	Play411221036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 411221036
		arg_147_1.duration_ = 11.566

		local var_147_0 = {
			zh = 11.566,
			ja = 9.766
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
				arg_147_0:Play411221037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 1.05

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[39].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(411221036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221036", "story_v_out_411221.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221036", "story_v_out_411221.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_411221", "411221036", "story_v_out_411221.awb")

						arg_147_1:RecordAudio("411221036", var_150_9)
						arg_147_1:RecordAudio("411221036", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_411221", "411221036", "story_v_out_411221.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_411221", "411221036", "story_v_out_411221.awb")
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
	Play411221037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 411221037
		arg_151_1.duration_ = 6.9

		local var_151_0 = {
			zh = 6.9,
			ja = 5.566
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
				arg_151_0:Play411221038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.425

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[39].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(411221037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221037", "story_v_out_411221.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221037", "story_v_out_411221.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_411221", "411221037", "story_v_out_411221.awb")

						arg_151_1:RecordAudio("411221037", var_154_9)
						arg_151_1:RecordAudio("411221037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_411221", "411221037", "story_v_out_411221.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_411221", "411221037", "story_v_out_411221.awb")
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
	Play411221038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 411221038
		arg_155_1.duration_ = 7.233

		local var_155_0 = {
			zh = 4.733,
			ja = 7.233
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
				arg_155_0:Play411221039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10058ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect10058ui_story == nil then
				arg_155_1.var_.characterEffect10058ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect10058ui_story then
					arg_155_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect10058ui_story then
				arg_155_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_158_4 = 0

			if var_158_4 < arg_155_1.time_ and arg_155_1.time_ <= var_158_4 + arg_158_0 then
				arg_155_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_158_5 = 0

			if var_158_5 < arg_155_1.time_ and arg_155_1.time_ <= var_158_5 + arg_158_0 then
				arg_155_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_158_6 = arg_155_1.actors_["10002_tpose"]
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 and arg_155_1.var_.characterEffect10002_tpose == nil then
				arg_155_1.var_.characterEffect10002_tpose = var_158_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_8 = 0.200000002980232

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8

				if arg_155_1.var_.characterEffect10002_tpose then
					local var_158_10 = Mathf.Lerp(0, 0.5, var_158_9)

					arg_155_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_155_1.var_.characterEffect10002_tpose.fillRatio = var_158_10
				end
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 and arg_155_1.var_.characterEffect10002_tpose then
				local var_158_11 = 0.5

				arg_155_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_155_1.var_.characterEffect10002_tpose.fillRatio = var_158_11
			end

			local var_158_12 = 0
			local var_158_13 = 0.525

			if var_158_12 < arg_155_1.time_ and arg_155_1.time_ <= var_158_12 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_14 = arg_155_1:FormatText(StoryNameCfg[471].name)

				arg_155_1.leftNameTxt_.text = var_158_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_15 = arg_155_1:GetWordFromCfg(411221038)
				local var_158_16 = arg_155_1:FormatText(var_158_15.content)

				arg_155_1.text_.text = var_158_16

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_17 = 21
				local var_158_18 = utf8.len(var_158_16)
				local var_158_19 = var_158_17 <= 0 and var_158_13 or var_158_13 * (var_158_18 / var_158_17)

				if var_158_19 > 0 and var_158_13 < var_158_19 then
					arg_155_1.talkMaxDuration = var_158_19

					if var_158_19 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_12
					end
				end

				arg_155_1.text_.text = var_158_16
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221038", "story_v_out_411221.awb") ~= 0 then
					local var_158_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221038", "story_v_out_411221.awb") / 1000

					if var_158_20 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_12
					end

					if var_158_15.prefab_name ~= "" and arg_155_1.actors_[var_158_15.prefab_name] ~= nil then
						local var_158_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_15.prefab_name].transform, "story_v_out_411221", "411221038", "story_v_out_411221.awb")

						arg_155_1:RecordAudio("411221038", var_158_21)
						arg_155_1:RecordAudio("411221038", var_158_21)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_411221", "411221038", "story_v_out_411221.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_411221", "411221038", "story_v_out_411221.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_22 = math.max(var_158_13, arg_155_1.talkMaxDuration)

			if var_158_12 <= arg_155_1.time_ and arg_155_1.time_ < var_158_12 + var_158_22 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_12) / var_158_22

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_12 + var_158_22 and arg_155_1.time_ < var_158_12 + var_158_22 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play411221039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 411221039
		arg_159_1.duration_ = 5.566

		local var_159_0 = {
			zh = 5.566,
			ja = 0.999999999999
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
				arg_159_0:Play411221040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10058ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect10058ui_story == nil then
				arg_159_1.var_.characterEffect10058ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect10058ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_159_1.var_.characterEffect10058ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect10058ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_159_1.var_.characterEffect10058ui_story.fillRatio = var_162_5
			end

			local var_162_6 = arg_159_1.actors_["10002_tpose"]
			local var_162_7 = 0

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 and arg_159_1.var_.characterEffect10002_tpose == nil then
				arg_159_1.var_.characterEffect10002_tpose = var_162_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_8 = 0.200000002980232

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_8 then
				local var_162_9 = (arg_159_1.time_ - var_162_7) / var_162_8

				if arg_159_1.var_.characterEffect10002_tpose then
					arg_159_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_7 + var_162_8 and arg_159_1.time_ < var_162_7 + var_162_8 + arg_162_0 and arg_159_1.var_.characterEffect10002_tpose then
				arg_159_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_162_10 = 0
			local var_162_11 = 0.475

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_12 = arg_159_1:FormatText(StoryNameCfg[39].name)

				arg_159_1.leftNameTxt_.text = var_162_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_13 = arg_159_1:GetWordFromCfg(411221039)
				local var_162_14 = arg_159_1:FormatText(var_162_13.content)

				arg_159_1.text_.text = var_162_14

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_15 = 19
				local var_162_16 = utf8.len(var_162_14)
				local var_162_17 = var_162_15 <= 0 and var_162_11 or var_162_11 * (var_162_16 / var_162_15)

				if var_162_17 > 0 and var_162_11 < var_162_17 then
					arg_159_1.talkMaxDuration = var_162_17

					if var_162_17 + var_162_10 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_17 + var_162_10
					end
				end

				arg_159_1.text_.text = var_162_14
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221039", "story_v_out_411221.awb") ~= 0 then
					local var_162_18 = manager.audio:GetVoiceLength("story_v_out_411221", "411221039", "story_v_out_411221.awb") / 1000

					if var_162_18 + var_162_10 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_18 + var_162_10
					end

					if var_162_13.prefab_name ~= "" and arg_159_1.actors_[var_162_13.prefab_name] ~= nil then
						local var_162_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_13.prefab_name].transform, "story_v_out_411221", "411221039", "story_v_out_411221.awb")

						arg_159_1:RecordAudio("411221039", var_162_19)
						arg_159_1:RecordAudio("411221039", var_162_19)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_411221", "411221039", "story_v_out_411221.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_411221", "411221039", "story_v_out_411221.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_20 = math.max(var_162_11, arg_159_1.talkMaxDuration)

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_20 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_10) / var_162_20

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_10 + var_162_20 and arg_159_1.time_ < var_162_10 + var_162_20 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play411221040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 411221040
		arg_163_1.duration_ = 8.7

		local var_163_0 = {
			zh = 8.033,
			ja = 8.7
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play411221041(arg_163_1)
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
					arg_163_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect10058ui_story then
				arg_163_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_166_4 = arg_163_1.actors_["10002_tpose"]
			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 and arg_163_1.var_.characterEffect10002_tpose == nil then
				arg_163_1.var_.characterEffect10002_tpose = var_166_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_6 = 0.200000002980232

			if var_166_5 <= arg_163_1.time_ and arg_163_1.time_ < var_166_5 + var_166_6 then
				local var_166_7 = (arg_163_1.time_ - var_166_5) / var_166_6

				if arg_163_1.var_.characterEffect10002_tpose then
					local var_166_8 = Mathf.Lerp(0, 0.5, var_166_7)

					arg_163_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_163_1.var_.characterEffect10002_tpose.fillRatio = var_166_8
				end
			end

			if arg_163_1.time_ >= var_166_5 + var_166_6 and arg_163_1.time_ < var_166_5 + var_166_6 + arg_166_0 and arg_163_1.var_.characterEffect10002_tpose then
				local var_166_9 = 0.5

				arg_163_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_163_1.var_.characterEffect10002_tpose.fillRatio = var_166_9
			end

			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_166_11 = 0
			local var_166_12 = 0.95

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_13 = arg_163_1:FormatText(StoryNameCfg[471].name)

				arg_163_1.leftNameTxt_.text = var_166_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_14 = arg_163_1:GetWordFromCfg(411221040)
				local var_166_15 = arg_163_1:FormatText(var_166_14.content)

				arg_163_1.text_.text = var_166_15

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_16 = 38
				local var_166_17 = utf8.len(var_166_15)
				local var_166_18 = var_166_16 <= 0 and var_166_12 or var_166_12 * (var_166_17 / var_166_16)

				if var_166_18 > 0 and var_166_12 < var_166_18 then
					arg_163_1.talkMaxDuration = var_166_18

					if var_166_18 + var_166_11 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_18 + var_166_11
					end
				end

				arg_163_1.text_.text = var_166_15
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221040", "story_v_out_411221.awb") ~= 0 then
					local var_166_19 = manager.audio:GetVoiceLength("story_v_out_411221", "411221040", "story_v_out_411221.awb") / 1000

					if var_166_19 + var_166_11 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_19 + var_166_11
					end

					if var_166_14.prefab_name ~= "" and arg_163_1.actors_[var_166_14.prefab_name] ~= nil then
						local var_166_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_14.prefab_name].transform, "story_v_out_411221", "411221040", "story_v_out_411221.awb")

						arg_163_1:RecordAudio("411221040", var_166_20)
						arg_163_1:RecordAudio("411221040", var_166_20)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_411221", "411221040", "story_v_out_411221.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_411221", "411221040", "story_v_out_411221.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_21 = math.max(var_166_12, arg_163_1.talkMaxDuration)

			if var_166_11 <= arg_163_1.time_ and arg_163_1.time_ < var_166_11 + var_166_21 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_11) / var_166_21

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_11 + var_166_21 and arg_163_1.time_ < var_166_11 + var_166_21 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play411221041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 411221041
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play411221042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10058ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect10058ui_story == nil then
				arg_167_1.var_.characterEffect10058ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect10058ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_167_1.var_.characterEffect10058ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect10058ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_167_1.var_.characterEffect10058ui_story.fillRatio = var_170_5
			end

			local var_170_6 = 0
			local var_170_7 = 0.7

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_8 = arg_167_1:GetWordFromCfg(411221041)
				local var_170_9 = arg_167_1:FormatText(var_170_8.content)

				arg_167_1.text_.text = var_170_9

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_10 = 28
				local var_170_11 = utf8.len(var_170_9)
				local var_170_12 = var_170_10 <= 0 and var_170_7 or var_170_7 * (var_170_11 / var_170_10)

				if var_170_12 > 0 and var_170_7 < var_170_12 then
					arg_167_1.talkMaxDuration = var_170_12

					if var_170_12 + var_170_6 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_12 + var_170_6
					end
				end

				arg_167_1.text_.text = var_170_9
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_13 = math.max(var_170_7, arg_167_1.talkMaxDuration)

			if var_170_6 <= arg_167_1.time_ and arg_167_1.time_ < var_170_6 + var_170_13 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_6) / var_170_13

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_6 + var_170_13 and arg_167_1.time_ < var_170_6 + var_170_13 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play411221042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 411221042
		arg_171_1.duration_ = 11.333

		local var_171_0 = {
			zh = 11.333,
			ja = 5.833
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
				arg_171_0:Play411221043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10002_tpose"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect10002_tpose == nil then
				arg_171_1.var_.characterEffect10002_tpose = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect10002_tpose then
					arg_171_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect10002_tpose then
				arg_171_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_174_4 = 0

			if var_174_4 < arg_171_1.time_ and arg_171_1.time_ <= var_174_4 + arg_174_0 then
				arg_171_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 then
				arg_171_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_6 = 0
			local var_174_7 = 0.975

			if var_174_6 < arg_171_1.time_ and arg_171_1.time_ <= var_174_6 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_8 = arg_171_1:FormatText(StoryNameCfg[39].name)

				arg_171_1.leftNameTxt_.text = var_174_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_9 = arg_171_1:GetWordFromCfg(411221042)
				local var_174_10 = arg_171_1:FormatText(var_174_9.content)

				arg_171_1.text_.text = var_174_10

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_11 = 39
				local var_174_12 = utf8.len(var_174_10)
				local var_174_13 = var_174_11 <= 0 and var_174_7 or var_174_7 * (var_174_12 / var_174_11)

				if var_174_13 > 0 and var_174_7 < var_174_13 then
					arg_171_1.talkMaxDuration = var_174_13

					if var_174_13 + var_174_6 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_13 + var_174_6
					end
				end

				arg_171_1.text_.text = var_174_10
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221042", "story_v_out_411221.awb") ~= 0 then
					local var_174_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221042", "story_v_out_411221.awb") / 1000

					if var_174_14 + var_174_6 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_14 + var_174_6
					end

					if var_174_9.prefab_name ~= "" and arg_171_1.actors_[var_174_9.prefab_name] ~= nil then
						local var_174_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_9.prefab_name].transform, "story_v_out_411221", "411221042", "story_v_out_411221.awb")

						arg_171_1:RecordAudio("411221042", var_174_15)
						arg_171_1:RecordAudio("411221042", var_174_15)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_411221", "411221042", "story_v_out_411221.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_411221", "411221042", "story_v_out_411221.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_16 = math.max(var_174_7, arg_171_1.talkMaxDuration)

			if var_174_6 <= arg_171_1.time_ and arg_171_1.time_ < var_174_6 + var_174_16 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_6) / var_174_16

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_6 + var_174_16 and arg_171_1.time_ < var_174_6 + var_174_16 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play411221043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 411221043
		arg_175_1.duration_ = 14.166

		local var_175_0 = {
			zh = 14.166,
			ja = 8.8
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
				arg_175_0:Play411221044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.85

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[39].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(411221043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221043", "story_v_out_411221.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221043", "story_v_out_411221.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_411221", "411221043", "story_v_out_411221.awb")

						arg_175_1:RecordAudio("411221043", var_178_9)
						arg_175_1:RecordAudio("411221043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_411221", "411221043", "story_v_out_411221.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_411221", "411221043", "story_v_out_411221.awb")
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
	Play411221044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 411221044
		arg_179_1.duration_ = 8.333

		local var_179_0 = {
			zh = 8.333,
			ja = 6.2
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
				arg_179_0:Play411221045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.575

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[39].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(411221044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 23
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221044", "story_v_out_411221.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221044", "story_v_out_411221.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_411221", "411221044", "story_v_out_411221.awb")

						arg_179_1:RecordAudio("411221044", var_182_9)
						arg_179_1:RecordAudio("411221044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_411221", "411221044", "story_v_out_411221.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_411221", "411221044", "story_v_out_411221.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play411221045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 411221045
		arg_183_1.duration_ = 4.933

		local var_183_0 = {
			zh = 3.766,
			ja = 4.933
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
				arg_183_0:Play411221046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10058ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect10058ui_story == nil then
				arg_183_1.var_.characterEffect10058ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect10058ui_story then
					arg_183_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect10058ui_story then
				arg_183_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_186_4 = 0

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_186_6 = arg_183_1.actors_["10002_tpose"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect10002_tpose == nil then
				arg_183_1.var_.characterEffect10002_tpose = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.200000002980232

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect10002_tpose then
					local var_186_10 = Mathf.Lerp(0, 0.5, var_186_9)

					arg_183_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_183_1.var_.characterEffect10002_tpose.fillRatio = var_186_10
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect10002_tpose then
				local var_186_11 = 0.5

				arg_183_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_183_1.var_.characterEffect10002_tpose.fillRatio = var_186_11
			end

			local var_186_12 = 0
			local var_186_13 = 0.275

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[471].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(411221045)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 11
				local var_186_18 = utf8.len(var_186_16)
				local var_186_19 = var_186_17 <= 0 and var_186_13 or var_186_13 * (var_186_18 / var_186_17)

				if var_186_19 > 0 and var_186_13 < var_186_19 then
					arg_183_1.talkMaxDuration = var_186_19

					if var_186_19 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_19 + var_186_12
					end
				end

				arg_183_1.text_.text = var_186_16
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221045", "story_v_out_411221.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221045", "story_v_out_411221.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_411221", "411221045", "story_v_out_411221.awb")

						arg_183_1:RecordAudio("411221045", var_186_21)
						arg_183_1:RecordAudio("411221045", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_411221", "411221045", "story_v_out_411221.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_411221", "411221045", "story_v_out_411221.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_22 = math.max(var_186_13, arg_183_1.talkMaxDuration)

			if var_186_12 <= arg_183_1.time_ and arg_183_1.time_ < var_186_12 + var_186_22 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_12) / var_186_22

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_12 + var_186_22 and arg_183_1.time_ < var_186_12 + var_186_22 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play411221046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 411221046
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play411221047(arg_187_1)
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
					local var_190_4 = Mathf.Lerp(0, 0.5, var_190_3)

					arg_187_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_187_1.var_.characterEffect10058ui_story.fillRatio = var_190_4
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect10058ui_story then
				local var_190_5 = 0.5

				arg_187_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_187_1.var_.characterEffect10058ui_story.fillRatio = var_190_5
			end

			local var_190_6 = arg_187_1.actors_["10002_tpose"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.characterEffect10002_tpose == nil then
				arg_187_1.var_.characterEffect10002_tpose = var_190_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_8 = 0.200000002980232

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.characterEffect10002_tpose then
					local var_190_10 = Mathf.Lerp(0, 0.5, var_190_9)

					arg_187_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_187_1.var_.characterEffect10002_tpose.fillRatio = var_190_10
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.characterEffect10002_tpose then
				local var_190_11 = 0.5

				arg_187_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_187_1.var_.characterEffect10002_tpose.fillRatio = var_190_11
			end

			local var_190_12 = 0

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_190_13 = 0
			local var_190_14 = 0.925

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(411221046)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 37
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_14 or var_190_14 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_14 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_13
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_20 = math.max(var_190_14, arg_187_1.talkMaxDuration)

			if var_190_13 <= arg_187_1.time_ and arg_187_1.time_ < var_190_13 + var_190_20 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_13) / var_190_20

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_13 + var_190_20 and arg_187_1.time_ < var_190_13 + var_190_20 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play411221047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 411221047
		arg_191_1.duration_ = 6.333

		local var_191_0 = {
			zh = 3.433,
			ja = 6.333
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
				arg_191_0:Play411221048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10002_tpose"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect10002_tpose == nil then
				arg_191_1.var_.characterEffect10002_tpose = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect10002_tpose then
					arg_191_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect10002_tpose then
				arg_191_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_194_4 = 0

			if var_194_4 < arg_191_1.time_ and arg_191_1.time_ <= var_194_4 + arg_194_0 then
				arg_191_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_194_5 = 0

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 then
				arg_191_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_194_6 = 0
			local var_194_7 = 0.35

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[39].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(411221047)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221047", "story_v_out_411221.awb") ~= 0 then
					local var_194_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221047", "story_v_out_411221.awb") / 1000

					if var_194_14 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_14 + var_194_6
					end

					if var_194_9.prefab_name ~= "" and arg_191_1.actors_[var_194_9.prefab_name] ~= nil then
						local var_194_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_9.prefab_name].transform, "story_v_out_411221", "411221047", "story_v_out_411221.awb")

						arg_191_1:RecordAudio("411221047", var_194_15)
						arg_191_1:RecordAudio("411221047", var_194_15)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_411221", "411221047", "story_v_out_411221.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_411221", "411221047", "story_v_out_411221.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_16 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_16 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_16

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_16 and arg_191_1.time_ < var_194_6 + var_194_16 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play411221048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 411221048
		arg_195_1.duration_ = 7.5

		local var_195_0 = {
			zh = 7.5,
			ja = 5.6
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
				arg_195_0:Play411221049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_198_1 = 0
			local var_198_2 = 0.625

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_3 = arg_195_1:FormatText(StoryNameCfg[39].name)

				arg_195_1.leftNameTxt_.text = var_198_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_4 = arg_195_1:GetWordFromCfg(411221048)
				local var_198_5 = arg_195_1:FormatText(var_198_4.content)

				arg_195_1.text_.text = var_198_5

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_6 = 25
				local var_198_7 = utf8.len(var_198_5)
				local var_198_8 = var_198_6 <= 0 and var_198_2 or var_198_2 * (var_198_7 / var_198_6)

				if var_198_8 > 0 and var_198_2 < var_198_8 then
					arg_195_1.talkMaxDuration = var_198_8

					if var_198_8 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_1
					end
				end

				arg_195_1.text_.text = var_198_5
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221048", "story_v_out_411221.awb") ~= 0 then
					local var_198_9 = manager.audio:GetVoiceLength("story_v_out_411221", "411221048", "story_v_out_411221.awb") / 1000

					if var_198_9 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_9 + var_198_1
					end

					if var_198_4.prefab_name ~= "" and arg_195_1.actors_[var_198_4.prefab_name] ~= nil then
						local var_198_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_4.prefab_name].transform, "story_v_out_411221", "411221048", "story_v_out_411221.awb")

						arg_195_1:RecordAudio("411221048", var_198_10)
						arg_195_1:RecordAudio("411221048", var_198_10)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_411221", "411221048", "story_v_out_411221.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_411221", "411221048", "story_v_out_411221.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_11 = math.max(var_198_2, arg_195_1.talkMaxDuration)

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_11 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_1) / var_198_11

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_1 + var_198_11 and arg_195_1.time_ < var_198_1 + var_198_11 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play411221049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 411221049
		arg_199_1.duration_ = 7.766

		local var_199_0 = {
			zh = 7.766,
			ja = 5.066
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
				arg_199_0:Play411221050(arg_199_1)
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
					arg_199_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect10058ui_story then
				arg_199_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_202_4 = arg_199_1.actors_["10002_tpose"]
			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 and arg_199_1.var_.characterEffect10002_tpose == nil then
				arg_199_1.var_.characterEffect10002_tpose = var_202_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_6 = 0.200000002980232

			if var_202_5 <= arg_199_1.time_ and arg_199_1.time_ < var_202_5 + var_202_6 then
				local var_202_7 = (arg_199_1.time_ - var_202_5) / var_202_6

				if arg_199_1.var_.characterEffect10002_tpose then
					local var_202_8 = Mathf.Lerp(0, 0.5, var_202_7)

					arg_199_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_199_1.var_.characterEffect10002_tpose.fillRatio = var_202_8
				end
			end

			if arg_199_1.time_ >= var_202_5 + var_202_6 and arg_199_1.time_ < var_202_5 + var_202_6 + arg_202_0 and arg_199_1.var_.characterEffect10002_tpose then
				local var_202_9 = 0.5

				arg_199_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_199_1.var_.characterEffect10002_tpose.fillRatio = var_202_9
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_202_11 = 0

			if var_202_11 < arg_199_1.time_ and arg_199_1.time_ <= var_202_11 + arg_202_0 then
				arg_199_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_202_12 = 0
			local var_202_13 = 0.95

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[471].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(411221049)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 38
				local var_202_18 = utf8.len(var_202_16)
				local var_202_19 = var_202_17 <= 0 and var_202_13 or var_202_13 * (var_202_18 / var_202_17)

				if var_202_19 > 0 and var_202_13 < var_202_19 then
					arg_199_1.talkMaxDuration = var_202_19

					if var_202_19 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_19 + var_202_12
					end
				end

				arg_199_1.text_.text = var_202_16
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221049", "story_v_out_411221.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221049", "story_v_out_411221.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_411221", "411221049", "story_v_out_411221.awb")

						arg_199_1:RecordAudio("411221049", var_202_21)
						arg_199_1:RecordAudio("411221049", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_411221", "411221049", "story_v_out_411221.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_411221", "411221049", "story_v_out_411221.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_13, arg_199_1.talkMaxDuration)

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_12) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_12 + var_202_22 and arg_199_1.time_ < var_202_12 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play411221050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 411221050
		arg_203_1.duration_ = 11.333

		local var_203_0 = {
			zh = 11.333,
			ja = 7.766
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
				arg_203_0:Play411221051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action2_1")
			end

			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_206_2 = arg_203_1.actors_["10058ui_story"]
			local var_206_3 = 0

			if var_206_3 < arg_203_1.time_ and arg_203_1.time_ <= var_206_3 + arg_206_0 and arg_203_1.var_.characterEffect10058ui_story == nil then
				arg_203_1.var_.characterEffect10058ui_story = var_206_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_4 = 0.200000002980232

			if var_206_3 <= arg_203_1.time_ and arg_203_1.time_ < var_206_3 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_3) / var_206_4

				if arg_203_1.var_.characterEffect10058ui_story then
					local var_206_6 = Mathf.Lerp(0, 0.5, var_206_5)

					arg_203_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_203_1.var_.characterEffect10058ui_story.fillRatio = var_206_6
				end
			end

			if arg_203_1.time_ >= var_206_3 + var_206_4 and arg_203_1.time_ < var_206_3 + var_206_4 + arg_206_0 and arg_203_1.var_.characterEffect10058ui_story then
				local var_206_7 = 0.5

				arg_203_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_203_1.var_.characterEffect10058ui_story.fillRatio = var_206_7
			end

			local var_206_8 = arg_203_1.actors_["10002_tpose"]
			local var_206_9 = 0

			if var_206_9 < arg_203_1.time_ and arg_203_1.time_ <= var_206_9 + arg_206_0 and arg_203_1.var_.characterEffect10002_tpose == nil then
				arg_203_1.var_.characterEffect10002_tpose = var_206_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_10 = 0.200000002980232

			if var_206_9 <= arg_203_1.time_ and arg_203_1.time_ < var_206_9 + var_206_10 then
				local var_206_11 = (arg_203_1.time_ - var_206_9) / var_206_10

				if arg_203_1.var_.characterEffect10002_tpose then
					arg_203_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_9 + var_206_10 and arg_203_1.time_ < var_206_9 + var_206_10 + arg_206_0 and arg_203_1.var_.characterEffect10002_tpose then
				arg_203_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_206_12 = 0
			local var_206_13 = 0.775

			if var_206_12 < arg_203_1.time_ and arg_203_1.time_ <= var_206_12 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_14 = arg_203_1:FormatText(StoryNameCfg[39].name)

				arg_203_1.leftNameTxt_.text = var_206_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_15 = arg_203_1:GetWordFromCfg(411221050)
				local var_206_16 = arg_203_1:FormatText(var_206_15.content)

				arg_203_1.text_.text = var_206_16

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_17 = 31
				local var_206_18 = utf8.len(var_206_16)
				local var_206_19 = var_206_17 <= 0 and var_206_13 or var_206_13 * (var_206_18 / var_206_17)

				if var_206_19 > 0 and var_206_13 < var_206_19 then
					arg_203_1.talkMaxDuration = var_206_19

					if var_206_19 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_19 + var_206_12
					end
				end

				arg_203_1.text_.text = var_206_16
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221050", "story_v_out_411221.awb") ~= 0 then
					local var_206_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221050", "story_v_out_411221.awb") / 1000

					if var_206_20 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_12
					end

					if var_206_15.prefab_name ~= "" and arg_203_1.actors_[var_206_15.prefab_name] ~= nil then
						local var_206_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_15.prefab_name].transform, "story_v_out_411221", "411221050", "story_v_out_411221.awb")

						arg_203_1:RecordAudio("411221050", var_206_21)
						arg_203_1:RecordAudio("411221050", var_206_21)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_411221", "411221050", "story_v_out_411221.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_411221", "411221050", "story_v_out_411221.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_22 = math.max(var_206_13, arg_203_1.talkMaxDuration)

			if var_206_12 <= arg_203_1.time_ and arg_203_1.time_ < var_206_12 + var_206_22 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_12) / var_206_22

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_12 + var_206_22 and arg_203_1.time_ < var_206_12 + var_206_22 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play411221051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 411221051
		arg_207_1.duration_ = 8.933

		local var_207_0 = {
			zh = 8.666,
			ja = 8.933
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
				arg_207_0:Play411221052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_210_1 = 0
			local var_210_2 = 0.8

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_3 = arg_207_1:FormatText(StoryNameCfg[39].name)

				arg_207_1.leftNameTxt_.text = var_210_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_4 = arg_207_1:GetWordFromCfg(411221051)
				local var_210_5 = arg_207_1:FormatText(var_210_4.content)

				arg_207_1.text_.text = var_210_5

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_6 = 32
				local var_210_7 = utf8.len(var_210_5)
				local var_210_8 = var_210_6 <= 0 and var_210_2 or var_210_2 * (var_210_7 / var_210_6)

				if var_210_8 > 0 and var_210_2 < var_210_8 then
					arg_207_1.talkMaxDuration = var_210_8

					if var_210_8 + var_210_1 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_1
					end
				end

				arg_207_1.text_.text = var_210_5
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221051", "story_v_out_411221.awb") ~= 0 then
					local var_210_9 = manager.audio:GetVoiceLength("story_v_out_411221", "411221051", "story_v_out_411221.awb") / 1000

					if var_210_9 + var_210_1 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_9 + var_210_1
					end

					if var_210_4.prefab_name ~= "" and arg_207_1.actors_[var_210_4.prefab_name] ~= nil then
						local var_210_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_4.prefab_name].transform, "story_v_out_411221", "411221051", "story_v_out_411221.awb")

						arg_207_1:RecordAudio("411221051", var_210_10)
						arg_207_1:RecordAudio("411221051", var_210_10)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_411221", "411221051", "story_v_out_411221.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_411221", "411221051", "story_v_out_411221.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_11 = math.max(var_210_2, arg_207_1.talkMaxDuration)

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_11 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_1) / var_210_11

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_1 + var_210_11 and arg_207_1.time_ < var_210_1 + var_210_11 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play411221052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 411221052
		arg_211_1.duration_ = 4.1

		local var_211_0 = {
			zh = 4.1,
			ja = 3.833
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
				arg_211_0:Play411221053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10058ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect10058ui_story == nil then
				arg_211_1.var_.characterEffect10058ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect10058ui_story then
					arg_211_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect10058ui_story then
				arg_211_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_214_4 = 0

			if var_214_4 < arg_211_1.time_ and arg_211_1.time_ <= var_214_4 + arg_214_0 then
				arg_211_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_214_5 = 0

			if var_214_5 < arg_211_1.time_ and arg_211_1.time_ <= var_214_5 + arg_214_0 then
				arg_211_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_214_6 = arg_211_1.actors_["10002_tpose"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect10002_tpose == nil then
				arg_211_1.var_.characterEffect10002_tpose = var_214_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_8 = 0.200000002980232

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.characterEffect10002_tpose then
					local var_214_10 = Mathf.Lerp(0, 0.5, var_214_9)

					arg_211_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_211_1.var_.characterEffect10002_tpose.fillRatio = var_214_10
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect10002_tpose then
				local var_214_11 = 0.5

				arg_211_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_211_1.var_.characterEffect10002_tpose.fillRatio = var_214_11
			end

			local var_214_12 = 0
			local var_214_13 = 0.475

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

				local var_214_15 = arg_211_1:GetWordFromCfg(411221052)
				local var_214_16 = arg_211_1:FormatText(var_214_15.content)

				arg_211_1.text_.text = var_214_16

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_17 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221052", "story_v_out_411221.awb") ~= 0 then
					local var_214_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221052", "story_v_out_411221.awb") / 1000

					if var_214_20 + var_214_12 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_20 + var_214_12
					end

					if var_214_15.prefab_name ~= "" and arg_211_1.actors_[var_214_15.prefab_name] ~= nil then
						local var_214_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_15.prefab_name].transform, "story_v_out_411221", "411221052", "story_v_out_411221.awb")

						arg_211_1:RecordAudio("411221052", var_214_21)
						arg_211_1:RecordAudio("411221052", var_214_21)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_411221", "411221052", "story_v_out_411221.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_411221", "411221052", "story_v_out_411221.awb")
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
	Play411221053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 411221053
		arg_215_1.duration_ = 3.4

		local var_215_0 = {
			zh = 3.4,
			ja = 3.1
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
				arg_215_0:Play411221054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10058ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect10058ui_story == nil then
				arg_215_1.var_.characterEffect10058ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect10058ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_215_1.var_.characterEffect10058ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect10058ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_215_1.var_.characterEffect10058ui_story.fillRatio = var_218_5
			end

			local var_218_6 = arg_215_1.actors_["10002_tpose"]
			local var_218_7 = 0

			if var_218_7 < arg_215_1.time_ and arg_215_1.time_ <= var_218_7 + arg_218_0 and arg_215_1.var_.characterEffect10002_tpose == nil then
				arg_215_1.var_.characterEffect10002_tpose = var_218_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_8 = 0.200000002980232

			if var_218_7 <= arg_215_1.time_ and arg_215_1.time_ < var_218_7 + var_218_8 then
				local var_218_9 = (arg_215_1.time_ - var_218_7) / var_218_8

				if arg_215_1.var_.characterEffect10002_tpose then
					arg_215_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_7 + var_218_8 and arg_215_1.time_ < var_218_7 + var_218_8 + arg_218_0 and arg_215_1.var_.characterEffect10002_tpose then
				arg_215_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action2_2")
			end

			local var_218_11 = 0

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 then
				arg_215_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_218_12 = 0
			local var_218_13 = 0.3

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_14 = arg_215_1:FormatText(StoryNameCfg[39].name)

				arg_215_1.leftNameTxt_.text = var_218_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_15 = arg_215_1:GetWordFromCfg(411221053)
				local var_218_16 = arg_215_1:FormatText(var_218_15.content)

				arg_215_1.text_.text = var_218_16

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_17 = 12
				local var_218_18 = utf8.len(var_218_16)
				local var_218_19 = var_218_17 <= 0 and var_218_13 or var_218_13 * (var_218_18 / var_218_17)

				if var_218_19 > 0 and var_218_13 < var_218_19 then
					arg_215_1.talkMaxDuration = var_218_19

					if var_218_19 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_19 + var_218_12
					end
				end

				arg_215_1.text_.text = var_218_16
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221053", "story_v_out_411221.awb") ~= 0 then
					local var_218_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221053", "story_v_out_411221.awb") / 1000

					if var_218_20 + var_218_12 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_20 + var_218_12
					end

					if var_218_15.prefab_name ~= "" and arg_215_1.actors_[var_218_15.prefab_name] ~= nil then
						local var_218_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_15.prefab_name].transform, "story_v_out_411221", "411221053", "story_v_out_411221.awb")

						arg_215_1:RecordAudio("411221053", var_218_21)
						arg_215_1:RecordAudio("411221053", var_218_21)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_411221", "411221053", "story_v_out_411221.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_411221", "411221053", "story_v_out_411221.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_22 = math.max(var_218_13, arg_215_1.talkMaxDuration)

			if var_218_12 <= arg_215_1.time_ and arg_215_1.time_ < var_218_12 + var_218_22 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_12) / var_218_22

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_12 + var_218_22 and arg_215_1.time_ < var_218_12 + var_218_22 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play411221054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 411221054
		arg_219_1.duration_ = 8.133

		local var_219_0 = {
			zh = 4.866,
			ja = 8.133
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
				arg_219_0:Play411221055(arg_219_1)
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
					arg_219_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect10058ui_story then
				arg_219_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_222_4 = 0

			if var_222_4 < arg_219_1.time_ and arg_219_1.time_ <= var_222_4 + arg_222_0 then
				arg_219_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_222_5 = arg_219_1.actors_["10002_tpose"]
			local var_222_6 = 0

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 and arg_219_1.var_.characterEffect10002_tpose == nil then
				arg_219_1.var_.characterEffect10002_tpose = var_222_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_7 = 0.200000002980232

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_7 then
				local var_222_8 = (arg_219_1.time_ - var_222_6) / var_222_7

				if arg_219_1.var_.characterEffect10002_tpose then
					local var_222_9 = Mathf.Lerp(0, 0.5, var_222_8)

					arg_219_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_219_1.var_.characterEffect10002_tpose.fillRatio = var_222_9
				end
			end

			if arg_219_1.time_ >= var_222_6 + var_222_7 and arg_219_1.time_ < var_222_6 + var_222_7 + arg_222_0 and arg_219_1.var_.characterEffect10002_tpose then
				local var_222_10 = 0.5

				arg_219_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_219_1.var_.characterEffect10002_tpose.fillRatio = var_222_10
			end

			local var_222_11 = 0
			local var_222_12 = 0.625

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_13 = arg_219_1:FormatText(StoryNameCfg[471].name)

				arg_219_1.leftNameTxt_.text = var_222_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_14 = arg_219_1:GetWordFromCfg(411221054)
				local var_222_15 = arg_219_1:FormatText(var_222_14.content)

				arg_219_1.text_.text = var_222_15

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_16 = 25
				local var_222_17 = utf8.len(var_222_15)
				local var_222_18 = var_222_16 <= 0 and var_222_12 or var_222_12 * (var_222_17 / var_222_16)

				if var_222_18 > 0 and var_222_12 < var_222_18 then
					arg_219_1.talkMaxDuration = var_222_18

					if var_222_18 + var_222_11 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_18 + var_222_11
					end
				end

				arg_219_1.text_.text = var_222_15
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221054", "story_v_out_411221.awb") ~= 0 then
					local var_222_19 = manager.audio:GetVoiceLength("story_v_out_411221", "411221054", "story_v_out_411221.awb") / 1000

					if var_222_19 + var_222_11 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_11
					end

					if var_222_14.prefab_name ~= "" and arg_219_1.actors_[var_222_14.prefab_name] ~= nil then
						local var_222_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_14.prefab_name].transform, "story_v_out_411221", "411221054", "story_v_out_411221.awb")

						arg_219_1:RecordAudio("411221054", var_222_20)
						arg_219_1:RecordAudio("411221054", var_222_20)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_411221", "411221054", "story_v_out_411221.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_411221", "411221054", "story_v_out_411221.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_21 = math.max(var_222_12, arg_219_1.talkMaxDuration)

			if var_222_11 <= arg_219_1.time_ and arg_219_1.time_ < var_222_11 + var_222_21 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_11) / var_222_21

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_11 + var_222_21 and arg_219_1.time_ < var_222_11 + var_222_21 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play411221055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 411221055
		arg_223_1.duration_ = 6.266

		local var_223_0 = {
			zh = 6.266,
			ja = 6
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
				arg_223_0:Play411221056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10058ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect10058ui_story == nil then
				arg_223_1.var_.characterEffect10058ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect10058ui_story then
					arg_223_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect10058ui_story then
				arg_223_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_226_4 = 0

			if var_226_4 < arg_223_1.time_ and arg_223_1.time_ <= var_226_4 + arg_226_0 then
				arg_223_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 then
				arg_223_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_226_6 = 0
			local var_226_7 = 0.825

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[471].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(411221055)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 33
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221055", "story_v_out_411221.awb") ~= 0 then
					local var_226_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221055", "story_v_out_411221.awb") / 1000

					if var_226_14 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_14 + var_226_6
					end

					if var_226_9.prefab_name ~= "" and arg_223_1.actors_[var_226_9.prefab_name] ~= nil then
						local var_226_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_9.prefab_name].transform, "story_v_out_411221", "411221055", "story_v_out_411221.awb")

						arg_223_1:RecordAudio("411221055", var_226_15)
						arg_223_1:RecordAudio("411221055", var_226_15)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_411221", "411221055", "story_v_out_411221.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_411221", "411221055", "story_v_out_411221.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_16 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_16 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_16

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_16 and arg_223_1.time_ < var_226_6 + var_226_16 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play411221056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 411221056
		arg_227_1.duration_ = 2.833

		local var_227_0 = {
			zh = 2.633,
			ja = 2.833
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
				arg_227_0:Play411221057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10058ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect10058ui_story == nil then
				arg_227_1.var_.characterEffect10058ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect10058ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_227_1.var_.characterEffect10058ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect10058ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_227_1.var_.characterEffect10058ui_story.fillRatio = var_230_5
			end

			local var_230_6 = arg_227_1.actors_["10002_tpose"]
			local var_230_7 = 0

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 and arg_227_1.var_.characterEffect10002_tpose == nil then
				arg_227_1.var_.characterEffect10002_tpose = var_230_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_8 = 0.200000002980232

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_8 then
				local var_230_9 = (arg_227_1.time_ - var_230_7) / var_230_8

				if arg_227_1.var_.characterEffect10002_tpose then
					arg_227_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_7 + var_230_8 and arg_227_1.time_ < var_230_7 + var_230_8 + arg_230_0 and arg_227_1.var_.characterEffect10002_tpose then
				arg_227_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_230_11 = 0
			local var_230_12 = 0.275

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_13 = arg_227_1:FormatText(StoryNameCfg[39].name)

				arg_227_1.leftNameTxt_.text = var_230_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_14 = arg_227_1:GetWordFromCfg(411221056)
				local var_230_15 = arg_227_1:FormatText(var_230_14.content)

				arg_227_1.text_.text = var_230_15

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_16 = 11
				local var_230_17 = utf8.len(var_230_15)
				local var_230_18 = var_230_16 <= 0 and var_230_12 or var_230_12 * (var_230_17 / var_230_16)

				if var_230_18 > 0 and var_230_12 < var_230_18 then
					arg_227_1.talkMaxDuration = var_230_18

					if var_230_18 + var_230_11 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_18 + var_230_11
					end
				end

				arg_227_1.text_.text = var_230_15
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221056", "story_v_out_411221.awb") ~= 0 then
					local var_230_19 = manager.audio:GetVoiceLength("story_v_out_411221", "411221056", "story_v_out_411221.awb") / 1000

					if var_230_19 + var_230_11 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_11
					end

					if var_230_14.prefab_name ~= "" and arg_227_1.actors_[var_230_14.prefab_name] ~= nil then
						local var_230_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_14.prefab_name].transform, "story_v_out_411221", "411221056", "story_v_out_411221.awb")

						arg_227_1:RecordAudio("411221056", var_230_20)
						arg_227_1:RecordAudio("411221056", var_230_20)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_411221", "411221056", "story_v_out_411221.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_411221", "411221056", "story_v_out_411221.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_21 = math.max(var_230_12, arg_227_1.talkMaxDuration)

			if var_230_11 <= arg_227_1.time_ and arg_227_1.time_ < var_230_11 + var_230_21 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_11) / var_230_21

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_11 + var_230_21 and arg_227_1.time_ < var_230_11 + var_230_21 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play411221057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 411221057
		arg_231_1.duration_ = 6.533

		local var_231_0 = {
			zh = 5.7,
			ja = 6.533
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
				arg_231_0:Play411221058(arg_231_1)
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

			local var_234_4 = 0

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 then
				arg_231_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_234_6 = arg_231_1.actors_["10002_tpose"]
			local var_234_7 = 0

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 and arg_231_1.var_.characterEffect10002_tpose == nil then
				arg_231_1.var_.characterEffect10002_tpose = var_234_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_8 = 0.200000002980232

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_8 then
				local var_234_9 = (arg_231_1.time_ - var_234_7) / var_234_8

				if arg_231_1.var_.characterEffect10002_tpose then
					local var_234_10 = Mathf.Lerp(0, 0.5, var_234_9)

					arg_231_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_231_1.var_.characterEffect10002_tpose.fillRatio = var_234_10
				end
			end

			if arg_231_1.time_ >= var_234_7 + var_234_8 and arg_231_1.time_ < var_234_7 + var_234_8 + arg_234_0 and arg_231_1.var_.characterEffect10002_tpose then
				local var_234_11 = 0.5

				arg_231_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_231_1.var_.characterEffect10002_tpose.fillRatio = var_234_11
			end

			local var_234_12 = 0
			local var_234_13 = 0.75

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[471].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(411221057)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 30
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221057", "story_v_out_411221.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221057", "story_v_out_411221.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_out_411221", "411221057", "story_v_out_411221.awb")

						arg_231_1:RecordAudio("411221057", var_234_21)
						arg_231_1:RecordAudio("411221057", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_411221", "411221057", "story_v_out_411221.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_411221", "411221057", "story_v_out_411221.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_22 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_12) / var_234_22

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_12 + var_234_22 and arg_231_1.time_ < var_234_12 + var_234_22 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play411221058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 411221058
		arg_235_1.duration_ = 2.766

		local var_235_0 = {
			zh = 2.233,
			ja = 2.766
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
				arg_235_0:Play411221059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10002_tpose"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect10002_tpose == nil then
				arg_235_1.var_.characterEffect10002_tpose = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.200000002980232

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect10002_tpose then
					arg_235_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect10002_tpose then
				arg_235_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_238_4 = 0

			if var_238_4 < arg_235_1.time_ and arg_235_1.time_ <= var_238_4 + arg_238_0 then
				arg_235_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_238_5 = 0

			if var_238_5 < arg_235_1.time_ and arg_235_1.time_ <= var_238_5 + arg_238_0 then
				arg_235_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_238_6 = arg_235_1.actors_["10058ui_story"]
			local var_238_7 = 0

			if var_238_7 < arg_235_1.time_ and arg_235_1.time_ <= var_238_7 + arg_238_0 and arg_235_1.var_.characterEffect10058ui_story == nil then
				arg_235_1.var_.characterEffect10058ui_story = var_238_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_8 = 0.200000002980232

			if var_238_7 <= arg_235_1.time_ and arg_235_1.time_ < var_238_7 + var_238_8 then
				local var_238_9 = (arg_235_1.time_ - var_238_7) / var_238_8

				if arg_235_1.var_.characterEffect10058ui_story then
					local var_238_10 = Mathf.Lerp(0, 0.5, var_238_9)

					arg_235_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_235_1.var_.characterEffect10058ui_story.fillRatio = var_238_10
				end
			end

			if arg_235_1.time_ >= var_238_7 + var_238_8 and arg_235_1.time_ < var_238_7 + var_238_8 + arg_238_0 and arg_235_1.var_.characterEffect10058ui_story then
				local var_238_11 = 0.5

				arg_235_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_235_1.var_.characterEffect10058ui_story.fillRatio = var_238_11
			end

			local var_238_12 = 0
			local var_238_13 = 0.25

			if var_238_12 < arg_235_1.time_ and arg_235_1.time_ <= var_238_12 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_14 = arg_235_1:FormatText(StoryNameCfg[39].name)

				arg_235_1.leftNameTxt_.text = var_238_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_15 = arg_235_1:GetWordFromCfg(411221058)
				local var_238_16 = arg_235_1:FormatText(var_238_15.content)

				arg_235_1.text_.text = var_238_16

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_17 = 10
				local var_238_18 = utf8.len(var_238_16)
				local var_238_19 = var_238_17 <= 0 and var_238_13 or var_238_13 * (var_238_18 / var_238_17)

				if var_238_19 > 0 and var_238_13 < var_238_19 then
					arg_235_1.talkMaxDuration = var_238_19

					if var_238_19 + var_238_12 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_19 + var_238_12
					end
				end

				arg_235_1.text_.text = var_238_16
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221058", "story_v_out_411221.awb") ~= 0 then
					local var_238_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221058", "story_v_out_411221.awb") / 1000

					if var_238_20 + var_238_12 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_20 + var_238_12
					end

					if var_238_15.prefab_name ~= "" and arg_235_1.actors_[var_238_15.prefab_name] ~= nil then
						local var_238_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_15.prefab_name].transform, "story_v_out_411221", "411221058", "story_v_out_411221.awb")

						arg_235_1:RecordAudio("411221058", var_238_21)
						arg_235_1:RecordAudio("411221058", var_238_21)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_411221", "411221058", "story_v_out_411221.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_411221", "411221058", "story_v_out_411221.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_22 = math.max(var_238_13, arg_235_1.talkMaxDuration)

			if var_238_12 <= arg_235_1.time_ and arg_235_1.time_ < var_238_12 + var_238_22 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_12) / var_238_22

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_12 + var_238_22 and arg_235_1.time_ < var_238_12 + var_238_22 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play411221059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 411221059
		arg_239_1.duration_ = 8.9

		local var_239_0 = {
			zh = 8.9,
			ja = 5.4
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
				arg_239_0:Play411221060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.95

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[39].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(411221059)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 38
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221059", "story_v_out_411221.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221059", "story_v_out_411221.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_411221", "411221059", "story_v_out_411221.awb")

						arg_239_1:RecordAudio("411221059", var_242_9)
						arg_239_1:RecordAudio("411221059", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_411221", "411221059", "story_v_out_411221.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_411221", "411221059", "story_v_out_411221.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_10 and arg_239_1.time_ < var_242_0 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play411221060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 411221060
		arg_243_1.duration_ = 11.9

		local var_243_0 = {
			zh = 8.333,
			ja = 11.9
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
				arg_243_0:Play411221061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.875

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[39].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(411221060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 35
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221060", "story_v_out_411221.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221060", "story_v_out_411221.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_411221", "411221060", "story_v_out_411221.awb")

						arg_243_1:RecordAudio("411221060", var_246_9)
						arg_243_1:RecordAudio("411221060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_411221", "411221060", "story_v_out_411221.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_411221", "411221060", "story_v_out_411221.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play411221061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 411221061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play411221062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10002_tpose"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect10002_tpose == nil then
				arg_247_1.var_.characterEffect10002_tpose = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect10002_tpose then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_247_1.var_.characterEffect10002_tpose.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect10002_tpose then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_247_1.var_.characterEffect10002_tpose.fillRatio = var_250_5
			end

			local var_250_6 = 0
			local var_250_7 = 1.2

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_8 = arg_247_1:GetWordFromCfg(411221061)
				local var_250_9 = arg_247_1:FormatText(var_250_8.content)

				arg_247_1.text_.text = var_250_9

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_10 = 48
				local var_250_11 = utf8.len(var_250_9)
				local var_250_12 = var_250_10 <= 0 and var_250_7 or var_250_7 * (var_250_11 / var_250_10)

				if var_250_12 > 0 and var_250_7 < var_250_12 then
					arg_247_1.talkMaxDuration = var_250_12

					if var_250_12 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_9
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_13 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_13 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_13

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_13 and arg_247_1.time_ < var_250_6 + var_250_13 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play411221062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 411221062
		arg_251_1.duration_ = 11.6

		local var_251_0 = {
			zh = 11.6,
			ja = 5.666
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
				arg_251_0:Play411221063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10002_tpose"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect10002_tpose == nil then
				arg_251_1.var_.characterEffect10002_tpose = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect10002_tpose then
					arg_251_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect10002_tpose then
				arg_251_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_254_4 = 0

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_254_6 = 0
			local var_254_7 = 0.725

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_8 = arg_251_1:FormatText(StoryNameCfg[39].name)

				arg_251_1.leftNameTxt_.text = var_254_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_9 = arg_251_1:GetWordFromCfg(411221062)
				local var_254_10 = arg_251_1:FormatText(var_254_9.content)

				arg_251_1.text_.text = var_254_10

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_11 = 29
				local var_254_12 = utf8.len(var_254_10)
				local var_254_13 = var_254_11 <= 0 and var_254_7 or var_254_7 * (var_254_12 / var_254_11)

				if var_254_13 > 0 and var_254_7 < var_254_13 then
					arg_251_1.talkMaxDuration = var_254_13

					if var_254_13 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_13 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_10
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221062", "story_v_out_411221.awb") ~= 0 then
					local var_254_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221062", "story_v_out_411221.awb") / 1000

					if var_254_14 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_14 + var_254_6
					end

					if var_254_9.prefab_name ~= "" and arg_251_1.actors_[var_254_9.prefab_name] ~= nil then
						local var_254_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_9.prefab_name].transform, "story_v_out_411221", "411221062", "story_v_out_411221.awb")

						arg_251_1:RecordAudio("411221062", var_254_15)
						arg_251_1:RecordAudio("411221062", var_254_15)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_411221", "411221062", "story_v_out_411221.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_411221", "411221062", "story_v_out_411221.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_16 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_16 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_16

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_16 and arg_251_1.time_ < var_254_6 + var_254_16 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play411221063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 411221063
		arg_255_1.duration_ = 6.666

		local var_255_0 = {
			zh = 6.666,
			ja = 4.733
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
				arg_255_0:Play411221064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_258_2 = arg_255_1.actors_["10058ui_story"]
			local var_258_3 = 0

			if var_258_3 < arg_255_1.time_ and arg_255_1.time_ <= var_258_3 + arg_258_0 and arg_255_1.var_.characterEffect10058ui_story == nil then
				arg_255_1.var_.characterEffect10058ui_story = var_258_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_4 = 0.200000002980232

			if var_258_3 <= arg_255_1.time_ and arg_255_1.time_ < var_258_3 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_3) / var_258_4

				if arg_255_1.var_.characterEffect10058ui_story then
					arg_255_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_3 + var_258_4 and arg_255_1.time_ < var_258_3 + var_258_4 + arg_258_0 and arg_255_1.var_.characterEffect10058ui_story then
				arg_255_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_258_6 = arg_255_1.actors_["10002_tpose"]
			local var_258_7 = 0

			if var_258_7 < arg_255_1.time_ and arg_255_1.time_ <= var_258_7 + arg_258_0 and arg_255_1.var_.characterEffect10002_tpose == nil then
				arg_255_1.var_.characterEffect10002_tpose = var_258_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_8 = 0.200000002980232

			if var_258_7 <= arg_255_1.time_ and arg_255_1.time_ < var_258_7 + var_258_8 then
				local var_258_9 = (arg_255_1.time_ - var_258_7) / var_258_8

				if arg_255_1.var_.characterEffect10002_tpose then
					local var_258_10 = Mathf.Lerp(0, 0.5, var_258_9)

					arg_255_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_255_1.var_.characterEffect10002_tpose.fillRatio = var_258_10
				end
			end

			if arg_255_1.time_ >= var_258_7 + var_258_8 and arg_255_1.time_ < var_258_7 + var_258_8 + arg_258_0 and arg_255_1.var_.characterEffect10002_tpose then
				local var_258_11 = 0.5

				arg_255_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_255_1.var_.characterEffect10002_tpose.fillRatio = var_258_11
			end

			local var_258_12 = 0
			local var_258_13 = 0.65

			if var_258_12 < arg_255_1.time_ and arg_255_1.time_ <= var_258_12 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_14 = arg_255_1:FormatText(StoryNameCfg[471].name)

				arg_255_1.leftNameTxt_.text = var_258_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_15 = arg_255_1:GetWordFromCfg(411221063)
				local var_258_16 = arg_255_1:FormatText(var_258_15.content)

				arg_255_1.text_.text = var_258_16

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_17 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221063", "story_v_out_411221.awb") ~= 0 then
					local var_258_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221063", "story_v_out_411221.awb") / 1000

					if var_258_20 + var_258_12 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_20 + var_258_12
					end

					if var_258_15.prefab_name ~= "" and arg_255_1.actors_[var_258_15.prefab_name] ~= nil then
						local var_258_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_15.prefab_name].transform, "story_v_out_411221", "411221063", "story_v_out_411221.awb")

						arg_255_1:RecordAudio("411221063", var_258_21)
						arg_255_1:RecordAudio("411221063", var_258_21)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_411221", "411221063", "story_v_out_411221.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_411221", "411221063", "story_v_out_411221.awb")
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
	Play411221064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 411221064
		arg_259_1.duration_ = 8.833

		local var_259_0 = {
			zh = 7.266,
			ja = 8.833
		}
		local var_259_1 = manager.audio:GetLocalizationFlag()

		if var_259_0[var_259_1] ~= nil then
			arg_259_1.duration_ = var_259_0[var_259_1]
		end

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play411221065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.8

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[471].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(411221064)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 32
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221064", "story_v_out_411221.awb") ~= 0 then
					local var_262_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221064", "story_v_out_411221.awb") / 1000

					if var_262_8 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_8 + var_262_0
					end

					if var_262_3.prefab_name ~= "" and arg_259_1.actors_[var_262_3.prefab_name] ~= nil then
						local var_262_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_3.prefab_name].transform, "story_v_out_411221", "411221064", "story_v_out_411221.awb")

						arg_259_1:RecordAudio("411221064", var_262_9)
						arg_259_1:RecordAudio("411221064", var_262_9)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_411221", "411221064", "story_v_out_411221.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_411221", "411221064", "story_v_out_411221.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_10 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_10 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_10

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_10 and arg_259_1.time_ < var_262_0 + var_262_10 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play411221065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 411221065
		arg_263_1.duration_ = 7.8

		local var_263_0 = {
			zh = 7.8,
			ja = 6.7
		}
		local var_263_1 = manager.audio:GetLocalizationFlag()

		if var_263_0[var_263_1] ~= nil then
			arg_263_1.duration_ = var_263_0[var_263_1]
		end

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play411221066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_266_2 = arg_263_1.actors_["10058ui_story"]
			local var_266_3 = 0

			if var_266_3 < arg_263_1.time_ and arg_263_1.time_ <= var_266_3 + arg_266_0 and arg_263_1.var_.characterEffect10058ui_story == nil then
				arg_263_1.var_.characterEffect10058ui_story = var_266_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_4 = 0.200000002980232

			if var_266_3 <= arg_263_1.time_ and arg_263_1.time_ < var_266_3 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_3) / var_266_4

				if arg_263_1.var_.characterEffect10058ui_story then
					local var_266_6 = Mathf.Lerp(0, 0.5, var_266_5)

					arg_263_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_263_1.var_.characterEffect10058ui_story.fillRatio = var_266_6
				end
			end

			if arg_263_1.time_ >= var_266_3 + var_266_4 and arg_263_1.time_ < var_266_3 + var_266_4 + arg_266_0 and arg_263_1.var_.characterEffect10058ui_story then
				local var_266_7 = 0.5

				arg_263_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_263_1.var_.characterEffect10058ui_story.fillRatio = var_266_7
			end

			local var_266_8 = arg_263_1.actors_["10002_tpose"]
			local var_266_9 = 0

			if var_266_9 < arg_263_1.time_ and arg_263_1.time_ <= var_266_9 + arg_266_0 and arg_263_1.var_.characterEffect10002_tpose == nil then
				arg_263_1.var_.characterEffect10002_tpose = var_266_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_10 = 0.200000002980232

			if var_266_9 <= arg_263_1.time_ and arg_263_1.time_ < var_266_9 + var_266_10 then
				local var_266_11 = (arg_263_1.time_ - var_266_9) / var_266_10

				if arg_263_1.var_.characterEffect10002_tpose then
					arg_263_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_9 + var_266_10 and arg_263_1.time_ < var_266_9 + var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect10002_tpose then
				arg_263_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_266_12 = 0
			local var_266_13 = 0.625

			if var_266_12 < arg_263_1.time_ and arg_263_1.time_ <= var_266_12 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_14 = arg_263_1:FormatText(StoryNameCfg[39].name)

				arg_263_1.leftNameTxt_.text = var_266_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_15 = arg_263_1:GetWordFromCfg(411221065)
				local var_266_16 = arg_263_1:FormatText(var_266_15.content)

				arg_263_1.text_.text = var_266_16

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_17 = 25
				local var_266_18 = utf8.len(var_266_16)
				local var_266_19 = var_266_17 <= 0 and var_266_13 or var_266_13 * (var_266_18 / var_266_17)

				if var_266_19 > 0 and var_266_13 < var_266_19 then
					arg_263_1.talkMaxDuration = var_266_19

					if var_266_19 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_19 + var_266_12
					end
				end

				arg_263_1.text_.text = var_266_16
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221065", "story_v_out_411221.awb") ~= 0 then
					local var_266_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221065", "story_v_out_411221.awb") / 1000

					if var_266_20 + var_266_12 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_20 + var_266_12
					end

					if var_266_15.prefab_name ~= "" and arg_263_1.actors_[var_266_15.prefab_name] ~= nil then
						local var_266_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_15.prefab_name].transform, "story_v_out_411221", "411221065", "story_v_out_411221.awb")

						arg_263_1:RecordAudio("411221065", var_266_21)
						arg_263_1:RecordAudio("411221065", var_266_21)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_411221", "411221065", "story_v_out_411221.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_411221", "411221065", "story_v_out_411221.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_22 = math.max(var_266_13, arg_263_1.talkMaxDuration)

			if var_266_12 <= arg_263_1.time_ and arg_263_1.time_ < var_266_12 + var_266_22 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_12) / var_266_22

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_12 + var_266_22 and arg_263_1.time_ < var_266_12 + var_266_22 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play411221066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 411221066
		arg_267_1.duration_ = 1.999999999999

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play411221067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10058ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect10058ui_story == nil then
				arg_267_1.var_.characterEffect10058ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.200000002980232

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect10058ui_story then
					arg_267_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect10058ui_story then
				arg_267_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_270_4 = 0

			if var_270_4 < arg_267_1.time_ and arg_267_1.time_ <= var_270_4 + arg_270_0 then
				arg_267_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_270_5 = 0

			if var_270_5 < arg_267_1.time_ and arg_267_1.time_ <= var_270_5 + arg_270_0 then
				arg_267_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_270_6 = arg_267_1.actors_["10002_tpose"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.characterEffect10002_tpose == nil then
				arg_267_1.var_.characterEffect10002_tpose = var_270_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_8 = 0.200000002980232

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.characterEffect10002_tpose then
					local var_270_10 = Mathf.Lerp(0, 0.5, var_270_9)

					arg_267_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_267_1.var_.characterEffect10002_tpose.fillRatio = var_270_10
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.characterEffect10002_tpose then
				local var_270_11 = 0.5

				arg_267_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_267_1.var_.characterEffect10002_tpose.fillRatio = var_270_11
			end

			local var_270_12 = 0
			local var_270_13 = 0.125

			if var_270_12 < arg_267_1.time_ and arg_267_1.time_ <= var_270_12 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_14 = arg_267_1:FormatText(StoryNameCfg[471].name)

				arg_267_1.leftNameTxt_.text = var_270_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_15 = arg_267_1:GetWordFromCfg(411221066)
				local var_270_16 = arg_267_1:FormatText(var_270_15.content)

				arg_267_1.text_.text = var_270_16

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_17 = 5
				local var_270_18 = utf8.len(var_270_16)
				local var_270_19 = var_270_17 <= 0 and var_270_13 or var_270_13 * (var_270_18 / var_270_17)

				if var_270_19 > 0 and var_270_13 < var_270_19 then
					arg_267_1.talkMaxDuration = var_270_19

					if var_270_19 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_12
					end
				end

				arg_267_1.text_.text = var_270_16
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221066", "story_v_out_411221.awb") ~= 0 then
					local var_270_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221066", "story_v_out_411221.awb") / 1000

					if var_270_20 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_12
					end

					if var_270_15.prefab_name ~= "" and arg_267_1.actors_[var_270_15.prefab_name] ~= nil then
						local var_270_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_15.prefab_name].transform, "story_v_out_411221", "411221066", "story_v_out_411221.awb")

						arg_267_1:RecordAudio("411221066", var_270_21)
						arg_267_1:RecordAudio("411221066", var_270_21)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_411221", "411221066", "story_v_out_411221.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_411221", "411221066", "story_v_out_411221.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_13, arg_267_1.talkMaxDuration)

			if var_270_12 <= arg_267_1.time_ and arg_267_1.time_ < var_270_12 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_12) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_12 + var_270_22 and arg_267_1.time_ < var_270_12 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play411221067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 411221067
		arg_271_1.duration_ = 5.666

		local var_271_0 = {
			zh = 5.266,
			ja = 5.666
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play411221068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["10058ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect10058ui_story == nil then
				arg_271_1.var_.characterEffect10058ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.200000002980232

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect10058ui_story then
					local var_274_4 = Mathf.Lerp(0, 0.5, var_274_3)

					arg_271_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_271_1.var_.characterEffect10058ui_story.fillRatio = var_274_4
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect10058ui_story then
				local var_274_5 = 0.5

				arg_271_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_271_1.var_.characterEffect10058ui_story.fillRatio = var_274_5
			end

			local var_274_6 = arg_271_1.actors_["10002_tpose"]
			local var_274_7 = 0

			if var_274_7 < arg_271_1.time_ and arg_271_1.time_ <= var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect10002_tpose == nil then
				arg_271_1.var_.characterEffect10002_tpose = var_274_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_8 = 0.200000002980232

			if var_274_7 <= arg_271_1.time_ and arg_271_1.time_ < var_274_7 + var_274_8 then
				local var_274_9 = (arg_271_1.time_ - var_274_7) / var_274_8

				if arg_271_1.var_.characterEffect10002_tpose then
					arg_271_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_7 + var_274_8 and arg_271_1.time_ < var_274_7 + var_274_8 + arg_274_0 and arg_271_1.var_.characterEffect10002_tpose then
				arg_271_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_274_11 = 0
			local var_274_12 = 0.45

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_13 = arg_271_1:FormatText(StoryNameCfg[39].name)

				arg_271_1.leftNameTxt_.text = var_274_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_14 = arg_271_1:GetWordFromCfg(411221067)
				local var_274_15 = arg_271_1:FormatText(var_274_14.content)

				arg_271_1.text_.text = var_274_15

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_16 = 18
				local var_274_17 = utf8.len(var_274_15)
				local var_274_18 = var_274_16 <= 0 and var_274_12 or var_274_12 * (var_274_17 / var_274_16)

				if var_274_18 > 0 and var_274_12 < var_274_18 then
					arg_271_1.talkMaxDuration = var_274_18

					if var_274_18 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_18 + var_274_11
					end
				end

				arg_271_1.text_.text = var_274_15
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221067", "story_v_out_411221.awb") ~= 0 then
					local var_274_19 = manager.audio:GetVoiceLength("story_v_out_411221", "411221067", "story_v_out_411221.awb") / 1000

					if var_274_19 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_11
					end

					if var_274_14.prefab_name ~= "" and arg_271_1.actors_[var_274_14.prefab_name] ~= nil then
						local var_274_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_14.prefab_name].transform, "story_v_out_411221", "411221067", "story_v_out_411221.awb")

						arg_271_1:RecordAudio("411221067", var_274_20)
						arg_271_1:RecordAudio("411221067", var_274_20)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_411221", "411221067", "story_v_out_411221.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_411221", "411221067", "story_v_out_411221.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_21 = math.max(var_274_12, arg_271_1.talkMaxDuration)

			if var_274_11 <= arg_271_1.time_ and arg_271_1.time_ < var_274_11 + var_274_21 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_11) / var_274_21

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_11 + var_274_21 and arg_271_1.time_ < var_274_11 + var_274_21 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play411221068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 411221068
		arg_275_1.duration_ = 12.366

		local var_275_0 = {
			zh = 12.166,
			ja = 12.366
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
				arg_275_0:Play411221069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10058ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect10058ui_story == nil then
				arg_275_1.var_.characterEffect10058ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.200000002980232

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect10058ui_story then
					arg_275_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect10058ui_story then
				arg_275_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_278_4 = arg_275_1.actors_["10002_tpose"]
			local var_278_5 = 0

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 and arg_275_1.var_.characterEffect10002_tpose == nil then
				arg_275_1.var_.characterEffect10002_tpose = var_278_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_6 = 0.200000002980232

			if var_278_5 <= arg_275_1.time_ and arg_275_1.time_ < var_278_5 + var_278_6 then
				local var_278_7 = (arg_275_1.time_ - var_278_5) / var_278_6

				if arg_275_1.var_.characterEffect10002_tpose then
					local var_278_8 = Mathf.Lerp(0, 0.5, var_278_7)

					arg_275_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_275_1.var_.characterEffect10002_tpose.fillRatio = var_278_8
				end
			end

			if arg_275_1.time_ >= var_278_5 + var_278_6 and arg_275_1.time_ < var_278_5 + var_278_6 + arg_278_0 and arg_275_1.var_.characterEffect10002_tpose then
				local var_278_9 = 0.5

				arg_275_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_275_1.var_.characterEffect10002_tpose.fillRatio = var_278_9
			end

			local var_278_10 = 0
			local var_278_11 = 1.3

			if var_278_10 < arg_275_1.time_ and arg_275_1.time_ <= var_278_10 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_12 = arg_275_1:FormatText(StoryNameCfg[471].name)

				arg_275_1.leftNameTxt_.text = var_278_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_13 = arg_275_1:GetWordFromCfg(411221068)
				local var_278_14 = arg_275_1:FormatText(var_278_13.content)

				arg_275_1.text_.text = var_278_14

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_15 = 52
				local var_278_16 = utf8.len(var_278_14)
				local var_278_17 = var_278_15 <= 0 and var_278_11 or var_278_11 * (var_278_16 / var_278_15)

				if var_278_17 > 0 and var_278_11 < var_278_17 then
					arg_275_1.talkMaxDuration = var_278_17

					if var_278_17 + var_278_10 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_17 + var_278_10
					end
				end

				arg_275_1.text_.text = var_278_14
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221068", "story_v_out_411221.awb") ~= 0 then
					local var_278_18 = manager.audio:GetVoiceLength("story_v_out_411221", "411221068", "story_v_out_411221.awb") / 1000

					if var_278_18 + var_278_10 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_18 + var_278_10
					end

					if var_278_13.prefab_name ~= "" and arg_275_1.actors_[var_278_13.prefab_name] ~= nil then
						local var_278_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_13.prefab_name].transform, "story_v_out_411221", "411221068", "story_v_out_411221.awb")

						arg_275_1:RecordAudio("411221068", var_278_19)
						arg_275_1:RecordAudio("411221068", var_278_19)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_411221", "411221068", "story_v_out_411221.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_411221", "411221068", "story_v_out_411221.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_20 = math.max(var_278_11, arg_275_1.talkMaxDuration)

			if var_278_10 <= arg_275_1.time_ and arg_275_1.time_ < var_278_10 + var_278_20 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_10) / var_278_20

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_10 + var_278_20 and arg_275_1.time_ < var_278_10 + var_278_20 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play411221069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 411221069
		arg_279_1.duration_ = 17.2

		local var_279_0 = {
			zh = 17.2,
			ja = 7.066
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
				arg_279_0:Play411221070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["10002_tpose"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect10002_tpose == nil then
				arg_279_1.var_.characterEffect10002_tpose = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.200000002980232

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect10002_tpose then
					arg_279_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect10002_tpose then
				arg_279_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_282_4 = 0

			if var_282_4 < arg_279_1.time_ and arg_279_1.time_ <= var_282_4 + arg_282_0 then
				arg_279_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 then
				arg_279_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_282_6 = arg_279_1.actors_["10058ui_story"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect10058ui_story == nil then
				arg_279_1.var_.characterEffect10058ui_story = var_282_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_8 = 0.200000002980232

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.characterEffect10058ui_story then
					local var_282_10 = Mathf.Lerp(0, 0.5, var_282_9)

					arg_279_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_279_1.var_.characterEffect10058ui_story.fillRatio = var_282_10
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect10058ui_story then
				local var_282_11 = 0.5

				arg_279_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_279_1.var_.characterEffect10058ui_story.fillRatio = var_282_11
			end

			local var_282_12 = 0
			local var_282_13 = 1.725

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[39].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(411221069)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 69
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221069", "story_v_out_411221.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221069", "story_v_out_411221.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_411221", "411221069", "story_v_out_411221.awb")

						arg_279_1:RecordAudio("411221069", var_282_21)
						arg_279_1:RecordAudio("411221069", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_411221", "411221069", "story_v_out_411221.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_411221", "411221069", "story_v_out_411221.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play411221070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 411221070
		arg_283_1.duration_ = 13.266

		local var_283_0 = {
			zh = 13.266,
			ja = 10.333
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play411221071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 1.4

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[39].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(411221070)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 56
				local var_286_6 = utf8.len(var_286_4)
				local var_286_7 = var_286_5 <= 0 and var_286_1 or var_286_1 * (var_286_6 / var_286_5)

				if var_286_7 > 0 and var_286_1 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_4
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221070", "story_v_out_411221.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221070", "story_v_out_411221.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_out_411221", "411221070", "story_v_out_411221.awb")

						arg_283_1:RecordAudio("411221070", var_286_9)
						arg_283_1:RecordAudio("411221070", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_411221", "411221070", "story_v_out_411221.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_411221", "411221070", "story_v_out_411221.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_10 and arg_283_1.time_ < var_286_0 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play411221071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 411221071
		arg_287_1.duration_ = 2.3

		local var_287_0 = {
			zh = 1.999999999999,
			ja = 2.3
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
				arg_287_0:Play411221072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_290_2 = arg_287_1.actors_["10058ui_story"]
			local var_290_3 = 0

			if var_290_3 < arg_287_1.time_ and arg_287_1.time_ <= var_290_3 + arg_290_0 and arg_287_1.var_.characterEffect10058ui_story == nil then
				arg_287_1.var_.characterEffect10058ui_story = var_290_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_4 = 0.200000002980232

			if var_290_3 <= arg_287_1.time_ and arg_287_1.time_ < var_290_3 + var_290_4 then
				local var_290_5 = (arg_287_1.time_ - var_290_3) / var_290_4

				if arg_287_1.var_.characterEffect10058ui_story then
					arg_287_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_287_1.time_ >= var_290_3 + var_290_4 and arg_287_1.time_ < var_290_3 + var_290_4 + arg_290_0 and arg_287_1.var_.characterEffect10058ui_story then
				arg_287_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_290_6 = arg_287_1.actors_["10002_tpose"]
			local var_290_7 = 0

			if var_290_7 < arg_287_1.time_ and arg_287_1.time_ <= var_290_7 + arg_290_0 and arg_287_1.var_.characterEffect10002_tpose == nil then
				arg_287_1.var_.characterEffect10002_tpose = var_290_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_8 = 0.200000002980232

			if var_290_7 <= arg_287_1.time_ and arg_287_1.time_ < var_290_7 + var_290_8 then
				local var_290_9 = (arg_287_1.time_ - var_290_7) / var_290_8

				if arg_287_1.var_.characterEffect10002_tpose then
					local var_290_10 = Mathf.Lerp(0, 0.5, var_290_9)

					arg_287_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_287_1.var_.characterEffect10002_tpose.fillRatio = var_290_10
				end
			end

			if arg_287_1.time_ >= var_290_7 + var_290_8 and arg_287_1.time_ < var_290_7 + var_290_8 + arg_290_0 and arg_287_1.var_.characterEffect10002_tpose then
				local var_290_11 = 0.5

				arg_287_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_287_1.var_.characterEffect10002_tpose.fillRatio = var_290_11
			end

			local var_290_12 = 0
			local var_290_13 = 0.1

			if var_290_12 < arg_287_1.time_ and arg_287_1.time_ <= var_290_12 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_14 = arg_287_1:FormatText(StoryNameCfg[471].name)

				arg_287_1.leftNameTxt_.text = var_290_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_15 = arg_287_1:GetWordFromCfg(411221071)
				local var_290_16 = arg_287_1:FormatText(var_290_15.content)

				arg_287_1.text_.text = var_290_16

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_17 = 4
				local var_290_18 = utf8.len(var_290_16)
				local var_290_19 = var_290_17 <= 0 and var_290_13 or var_290_13 * (var_290_18 / var_290_17)

				if var_290_19 > 0 and var_290_13 < var_290_19 then
					arg_287_1.talkMaxDuration = var_290_19

					if var_290_19 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_12
					end
				end

				arg_287_1.text_.text = var_290_16
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221071", "story_v_out_411221.awb") ~= 0 then
					local var_290_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221071", "story_v_out_411221.awb") / 1000

					if var_290_20 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_20 + var_290_12
					end

					if var_290_15.prefab_name ~= "" and arg_287_1.actors_[var_290_15.prefab_name] ~= nil then
						local var_290_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_15.prefab_name].transform, "story_v_out_411221", "411221071", "story_v_out_411221.awb")

						arg_287_1:RecordAudio("411221071", var_290_21)
						arg_287_1:RecordAudio("411221071", var_290_21)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_411221", "411221071", "story_v_out_411221.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_411221", "411221071", "story_v_out_411221.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_22 = math.max(var_290_13, arg_287_1.talkMaxDuration)

			if var_290_12 <= arg_287_1.time_ and arg_287_1.time_ < var_290_12 + var_290_22 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_12) / var_290_22

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_12 + var_290_22 and arg_287_1.time_ < var_290_12 + var_290_22 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play411221072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 411221072
		arg_291_1.duration_ = 5.1

		local var_291_0 = {
			zh = 5.066,
			ja = 5.1
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
				arg_291_0:Play411221073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10058ui_story"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.characterEffect10058ui_story == nil then
				arg_291_1.var_.characterEffect10058ui_story = var_294_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_2 = 0.200000002980232

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.characterEffect10058ui_story then
					local var_294_4 = Mathf.Lerp(0, 0.5, var_294_3)

					arg_291_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_291_1.var_.characterEffect10058ui_story.fillRatio = var_294_4
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.characterEffect10058ui_story then
				local var_294_5 = 0.5

				arg_291_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_291_1.var_.characterEffect10058ui_story.fillRatio = var_294_5
			end

			local var_294_6 = arg_291_1.actors_["10002_tpose"]
			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 and arg_291_1.var_.characterEffect10002_tpose == nil then
				arg_291_1.var_.characterEffect10002_tpose = var_294_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_8 = 0.200000002980232

			if var_294_7 <= arg_291_1.time_ and arg_291_1.time_ < var_294_7 + var_294_8 then
				local var_294_9 = (arg_291_1.time_ - var_294_7) / var_294_8

				if arg_291_1.var_.characterEffect10002_tpose then
					arg_291_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_7 + var_294_8 and arg_291_1.time_ < var_294_7 + var_294_8 + arg_294_0 and arg_291_1.var_.characterEffect10002_tpose then
				arg_291_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_294_10 = 0
			local var_294_11 = 0.35

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_12 = arg_291_1:FormatText(StoryNameCfg[39].name)

				arg_291_1.leftNameTxt_.text = var_294_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_13 = arg_291_1:GetWordFromCfg(411221072)
				local var_294_14 = arg_291_1:FormatText(var_294_13.content)

				arg_291_1.text_.text = var_294_14

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_15 = 14
				local var_294_16 = utf8.len(var_294_14)
				local var_294_17 = var_294_15 <= 0 and var_294_11 or var_294_11 * (var_294_16 / var_294_15)

				if var_294_17 > 0 and var_294_11 < var_294_17 then
					arg_291_1.talkMaxDuration = var_294_17

					if var_294_17 + var_294_10 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_17 + var_294_10
					end
				end

				arg_291_1.text_.text = var_294_14
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221072", "story_v_out_411221.awb") ~= 0 then
					local var_294_18 = manager.audio:GetVoiceLength("story_v_out_411221", "411221072", "story_v_out_411221.awb") / 1000

					if var_294_18 + var_294_10 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_18 + var_294_10
					end

					if var_294_13.prefab_name ~= "" and arg_291_1.actors_[var_294_13.prefab_name] ~= nil then
						local var_294_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_13.prefab_name].transform, "story_v_out_411221", "411221072", "story_v_out_411221.awb")

						arg_291_1:RecordAudio("411221072", var_294_19)
						arg_291_1:RecordAudio("411221072", var_294_19)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_411221", "411221072", "story_v_out_411221.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_411221", "411221072", "story_v_out_411221.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_20 = math.max(var_294_11, arg_291_1.talkMaxDuration)

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_20 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_10) / var_294_20

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_10 + var_294_20 and arg_291_1.time_ < var_294_10 + var_294_20 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play411221073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 411221073
		arg_295_1.duration_ = 2.366

		local var_295_0 = {
			zh = 2.366,
			ja = 1.999999999999
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play411221074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10058ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect10058ui_story == nil then
				arg_295_1.var_.characterEffect10058ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect10058ui_story then
					arg_295_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect10058ui_story then
				arg_295_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_298_4 = arg_295_1.actors_["10002_tpose"]
			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 and arg_295_1.var_.characterEffect10002_tpose == nil then
				arg_295_1.var_.characterEffect10002_tpose = var_298_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_6 = 0.200000002980232

			if var_298_5 <= arg_295_1.time_ and arg_295_1.time_ < var_298_5 + var_298_6 then
				local var_298_7 = (arg_295_1.time_ - var_298_5) / var_298_6

				if arg_295_1.var_.characterEffect10002_tpose then
					local var_298_8 = Mathf.Lerp(0, 0.5, var_298_7)

					arg_295_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_295_1.var_.characterEffect10002_tpose.fillRatio = var_298_8
				end
			end

			if arg_295_1.time_ >= var_298_5 + var_298_6 and arg_295_1.time_ < var_298_5 + var_298_6 + arg_298_0 and arg_295_1.var_.characterEffect10002_tpose then
				local var_298_9 = 0.5

				arg_295_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_295_1.var_.characterEffect10002_tpose.fillRatio = var_298_9
			end

			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_298_11 = 0

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				arg_295_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_298_12 = 0
			local var_298_13 = 0.275

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_14 = arg_295_1:FormatText(StoryNameCfg[471].name)

				arg_295_1.leftNameTxt_.text = var_298_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_15 = arg_295_1:GetWordFromCfg(411221073)
				local var_298_16 = arg_295_1:FormatText(var_298_15.content)

				arg_295_1.text_.text = var_298_16

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_17 = 11
				local var_298_18 = utf8.len(var_298_16)
				local var_298_19 = var_298_17 <= 0 and var_298_13 or var_298_13 * (var_298_18 / var_298_17)

				if var_298_19 > 0 and var_298_13 < var_298_19 then
					arg_295_1.talkMaxDuration = var_298_19

					if var_298_19 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_12
					end
				end

				arg_295_1.text_.text = var_298_16
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221073", "story_v_out_411221.awb") ~= 0 then
					local var_298_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221073", "story_v_out_411221.awb") / 1000

					if var_298_20 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_12
					end

					if var_298_15.prefab_name ~= "" and arg_295_1.actors_[var_298_15.prefab_name] ~= nil then
						local var_298_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_15.prefab_name].transform, "story_v_out_411221", "411221073", "story_v_out_411221.awb")

						arg_295_1:RecordAudio("411221073", var_298_21)
						arg_295_1:RecordAudio("411221073", var_298_21)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_411221", "411221073", "story_v_out_411221.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_411221", "411221073", "story_v_out_411221.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_22 = math.max(var_298_13, arg_295_1.talkMaxDuration)

			if var_298_12 <= arg_295_1.time_ and arg_295_1.time_ < var_298_12 + var_298_22 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_12) / var_298_22

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_12 + var_298_22 and arg_295_1.time_ < var_298_12 + var_298_22 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play411221074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 411221074
		arg_299_1.duration_ = 13.7

		local var_299_0 = {
			zh = 13.7,
			ja = 13.233
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
				arg_299_0:Play411221075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["10058ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect10058ui_story == nil then
				arg_299_1.var_.characterEffect10058ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.200000002980232

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect10058ui_story then
					local var_302_4 = Mathf.Lerp(0, 0.5, var_302_3)

					arg_299_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_299_1.var_.characterEffect10058ui_story.fillRatio = var_302_4
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect10058ui_story then
				local var_302_5 = 0.5

				arg_299_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_299_1.var_.characterEffect10058ui_story.fillRatio = var_302_5
			end

			local var_302_6 = arg_299_1.actors_["10002_tpose"]
			local var_302_7 = 0

			if var_302_7 < arg_299_1.time_ and arg_299_1.time_ <= var_302_7 + arg_302_0 and arg_299_1.var_.characterEffect10002_tpose == nil then
				arg_299_1.var_.characterEffect10002_tpose = var_302_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_8 = 0.200000002980232

			if var_302_7 <= arg_299_1.time_ and arg_299_1.time_ < var_302_7 + var_302_8 then
				local var_302_9 = (arg_299_1.time_ - var_302_7) / var_302_8

				if arg_299_1.var_.characterEffect10002_tpose then
					arg_299_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_7 + var_302_8 and arg_299_1.time_ < var_302_7 + var_302_8 + arg_302_0 and arg_299_1.var_.characterEffect10002_tpose then
				arg_299_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_302_10 = 0
			local var_302_11 = 1.3

			if var_302_10 < arg_299_1.time_ and arg_299_1.time_ <= var_302_10 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_12 = arg_299_1:FormatText(StoryNameCfg[39].name)

				arg_299_1.leftNameTxt_.text = var_302_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_13 = arg_299_1:GetWordFromCfg(411221074)
				local var_302_14 = arg_299_1:FormatText(var_302_13.content)

				arg_299_1.text_.text = var_302_14

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_15 = 52
				local var_302_16 = utf8.len(var_302_14)
				local var_302_17 = var_302_15 <= 0 and var_302_11 or var_302_11 * (var_302_16 / var_302_15)

				if var_302_17 > 0 and var_302_11 < var_302_17 then
					arg_299_1.talkMaxDuration = var_302_17

					if var_302_17 + var_302_10 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_17 + var_302_10
					end
				end

				arg_299_1.text_.text = var_302_14
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221074", "story_v_out_411221.awb") ~= 0 then
					local var_302_18 = manager.audio:GetVoiceLength("story_v_out_411221", "411221074", "story_v_out_411221.awb") / 1000

					if var_302_18 + var_302_10 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_18 + var_302_10
					end

					if var_302_13.prefab_name ~= "" and arg_299_1.actors_[var_302_13.prefab_name] ~= nil then
						local var_302_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_13.prefab_name].transform, "story_v_out_411221", "411221074", "story_v_out_411221.awb")

						arg_299_1:RecordAudio("411221074", var_302_19)
						arg_299_1:RecordAudio("411221074", var_302_19)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_411221", "411221074", "story_v_out_411221.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_411221", "411221074", "story_v_out_411221.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_20 = math.max(var_302_11, arg_299_1.talkMaxDuration)

			if var_302_10 <= arg_299_1.time_ and arg_299_1.time_ < var_302_10 + var_302_20 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_10) / var_302_20

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_10 + var_302_20 and arg_299_1.time_ < var_302_10 + var_302_20 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play411221075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 411221075
		arg_303_1.duration_ = 6.866

		local var_303_0 = {
			zh = 6.866,
			ja = 3.6
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
				arg_303_0:Play411221076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.75

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[39].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(411221075)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 30
				local var_306_6 = utf8.len(var_306_4)
				local var_306_7 = var_306_5 <= 0 and var_306_1 or var_306_1 * (var_306_6 / var_306_5)

				if var_306_7 > 0 and var_306_1 < var_306_7 then
					arg_303_1.talkMaxDuration = var_306_7

					if var_306_7 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_7 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_4
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221075", "story_v_out_411221.awb") ~= 0 then
					local var_306_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221075", "story_v_out_411221.awb") / 1000

					if var_306_8 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_0
					end

					if var_306_3.prefab_name ~= "" and arg_303_1.actors_[var_306_3.prefab_name] ~= nil then
						local var_306_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_3.prefab_name].transform, "story_v_out_411221", "411221075", "story_v_out_411221.awb")

						arg_303_1:RecordAudio("411221075", var_306_9)
						arg_303_1:RecordAudio("411221075", var_306_9)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_411221", "411221075", "story_v_out_411221.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_411221", "411221075", "story_v_out_411221.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_10 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_10 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_10

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_10 and arg_303_1.time_ < var_306_0 + var_306_10 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play411221076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 411221076
		arg_307_1.duration_ = 3.4

		local var_307_0 = {
			zh = 3.4,
			ja = 3.166
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
				arg_307_0:Play411221077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["10058ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect10058ui_story == nil then
				arg_307_1.var_.characterEffect10058ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.200000002980232

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect10058ui_story then
					arg_307_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect10058ui_story then
				arg_307_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_310_4 = 0

			if var_310_4 < arg_307_1.time_ and arg_307_1.time_ <= var_310_4 + arg_310_0 then
				arg_307_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095actionlink/1095action465")
			end

			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 then
				arg_307_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_310_6 = arg_307_1.actors_["10002_tpose"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.characterEffect10002_tpose == nil then
				arg_307_1.var_.characterEffect10002_tpose = var_310_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_8 = 0.200000002980232

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.characterEffect10002_tpose then
					local var_310_10 = Mathf.Lerp(0, 0.5, var_310_9)

					arg_307_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_307_1.var_.characterEffect10002_tpose.fillRatio = var_310_10
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.characterEffect10002_tpose then
				local var_310_11 = 0.5

				arg_307_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_307_1.var_.characterEffect10002_tpose.fillRatio = var_310_11
			end

			local var_310_12 = 0
			local var_310_13 = 0.425

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[471].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(411221076)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 17
				local var_310_18 = utf8.len(var_310_16)
				local var_310_19 = var_310_17 <= 0 and var_310_13 or var_310_13 * (var_310_18 / var_310_17)

				if var_310_19 > 0 and var_310_13 < var_310_19 then
					arg_307_1.talkMaxDuration = var_310_19

					if var_310_19 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_19 + var_310_12
					end
				end

				arg_307_1.text_.text = var_310_16
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221076", "story_v_out_411221.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221076", "story_v_out_411221.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_411221", "411221076", "story_v_out_411221.awb")

						arg_307_1:RecordAudio("411221076", var_310_21)
						arg_307_1:RecordAudio("411221076", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_411221", "411221076", "story_v_out_411221.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_411221", "411221076", "story_v_out_411221.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_22 = math.max(var_310_13, arg_307_1.talkMaxDuration)

			if var_310_12 <= arg_307_1.time_ and arg_307_1.time_ < var_310_12 + var_310_22 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_12) / var_310_22

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_12 + var_310_22 and arg_307_1.time_ < var_310_12 + var_310_22 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play411221077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 411221077
		arg_311_1.duration_ = 9.666

		local var_311_0 = {
			zh = 9.666,
			ja = 5.8
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
				arg_311_0:Play411221078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.875

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[471].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(411221077)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 35
				local var_314_6 = utf8.len(var_314_4)
				local var_314_7 = var_314_5 <= 0 and var_314_1 or var_314_1 * (var_314_6 / var_314_5)

				if var_314_7 > 0 and var_314_1 < var_314_7 then
					arg_311_1.talkMaxDuration = var_314_7

					if var_314_7 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_7 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_4
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221077", "story_v_out_411221.awb") ~= 0 then
					local var_314_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221077", "story_v_out_411221.awb") / 1000

					if var_314_8 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_8 + var_314_0
					end

					if var_314_3.prefab_name ~= "" and arg_311_1.actors_[var_314_3.prefab_name] ~= nil then
						local var_314_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_3.prefab_name].transform, "story_v_out_411221", "411221077", "story_v_out_411221.awb")

						arg_311_1:RecordAudio("411221077", var_314_9)
						arg_311_1:RecordAudio("411221077", var_314_9)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_411221", "411221077", "story_v_out_411221.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_411221", "411221077", "story_v_out_411221.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_10 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_10 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_10

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_10 and arg_311_1.time_ < var_314_0 + var_314_10 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play411221078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 411221078
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play411221079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10058ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect10058ui_story == nil then
				arg_315_1.var_.characterEffect10058ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.200000002980232

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect10058ui_story then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_315_1.var_.characterEffect10058ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect10058ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_315_1.var_.characterEffect10058ui_story.fillRatio = var_318_5
			end

			local var_318_6 = 0
			local var_318_7 = 0.525

			if var_318_6 < arg_315_1.time_ and arg_315_1.time_ <= var_318_6 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_8 = arg_315_1:GetWordFromCfg(411221078)
				local var_318_9 = arg_315_1:FormatText(var_318_8.content)

				arg_315_1.text_.text = var_318_9

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_10 = 21
				local var_318_11 = utf8.len(var_318_9)
				local var_318_12 = var_318_10 <= 0 and var_318_7 or var_318_7 * (var_318_11 / var_318_10)

				if var_318_12 > 0 and var_318_7 < var_318_12 then
					arg_315_1.talkMaxDuration = var_318_12

					if var_318_12 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_12 + var_318_6
					end
				end

				arg_315_1.text_.text = var_318_9
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_13 = math.max(var_318_7, arg_315_1.talkMaxDuration)

			if var_318_6 <= arg_315_1.time_ and arg_315_1.time_ < var_318_6 + var_318_13 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_6) / var_318_13

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_6 + var_318_13 and arg_315_1.time_ < var_318_6 + var_318_13 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play411221079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 411221079
		arg_319_1.duration_ = 12.766

		local var_319_0 = {
			zh = 12.766,
			ja = 12.233
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
				arg_319_0:Play411221080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10002_tpose"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect10002_tpose == nil then
				arg_319_1.var_.characterEffect10002_tpose = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.200000002980232

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect10002_tpose then
					arg_319_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect10002_tpose then
				arg_319_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_322_4 = 0

			if var_322_4 < arg_319_1.time_ and arg_319_1.time_ <= var_322_4 + arg_322_0 then
				arg_319_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 then
				arg_319_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_322_6 = 0
			local var_322_7 = 1.025

			if var_322_6 < arg_319_1.time_ and arg_319_1.time_ <= var_322_6 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_8 = arg_319_1:FormatText(StoryNameCfg[39].name)

				arg_319_1.leftNameTxt_.text = var_322_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_9 = arg_319_1:GetWordFromCfg(411221079)
				local var_322_10 = arg_319_1:FormatText(var_322_9.content)

				arg_319_1.text_.text = var_322_10

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_11 = 41
				local var_322_12 = utf8.len(var_322_10)
				local var_322_13 = var_322_11 <= 0 and var_322_7 or var_322_7 * (var_322_12 / var_322_11)

				if var_322_13 > 0 and var_322_7 < var_322_13 then
					arg_319_1.talkMaxDuration = var_322_13

					if var_322_13 + var_322_6 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_13 + var_322_6
					end
				end

				arg_319_1.text_.text = var_322_10
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221079", "story_v_out_411221.awb") ~= 0 then
					local var_322_14 = manager.audio:GetVoiceLength("story_v_out_411221", "411221079", "story_v_out_411221.awb") / 1000

					if var_322_14 + var_322_6 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_14 + var_322_6
					end

					if var_322_9.prefab_name ~= "" and arg_319_1.actors_[var_322_9.prefab_name] ~= nil then
						local var_322_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_9.prefab_name].transform, "story_v_out_411221", "411221079", "story_v_out_411221.awb")

						arg_319_1:RecordAudio("411221079", var_322_15)
						arg_319_1:RecordAudio("411221079", var_322_15)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_411221", "411221079", "story_v_out_411221.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_411221", "411221079", "story_v_out_411221.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_16 = math.max(var_322_7, arg_319_1.talkMaxDuration)

			if var_322_6 <= arg_319_1.time_ and arg_319_1.time_ < var_322_6 + var_322_16 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_6) / var_322_16

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_6 + var_322_16 and arg_319_1.time_ < var_322_6 + var_322_16 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play411221080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 411221080
		arg_323_1.duration_ = 10.4

		local var_323_0 = {
			zh = 5.733,
			ja = 10.4
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
				arg_323_0:Play411221081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.575

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_2 = arg_323_1:FormatText(StoryNameCfg[39].name)

				arg_323_1.leftNameTxt_.text = var_326_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_3 = arg_323_1:GetWordFromCfg(411221080)
				local var_326_4 = arg_323_1:FormatText(var_326_3.content)

				arg_323_1.text_.text = var_326_4

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_5 = 23
				local var_326_6 = utf8.len(var_326_4)
				local var_326_7 = var_326_5 <= 0 and var_326_1 or var_326_1 * (var_326_6 / var_326_5)

				if var_326_7 > 0 and var_326_1 < var_326_7 then
					arg_323_1.talkMaxDuration = var_326_7

					if var_326_7 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_7 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_4
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221080", "story_v_out_411221.awb") ~= 0 then
					local var_326_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221080", "story_v_out_411221.awb") / 1000

					if var_326_8 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_8 + var_326_0
					end

					if var_326_3.prefab_name ~= "" and arg_323_1.actors_[var_326_3.prefab_name] ~= nil then
						local var_326_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_3.prefab_name].transform, "story_v_out_411221", "411221080", "story_v_out_411221.awb")

						arg_323_1:RecordAudio("411221080", var_326_9)
						arg_323_1:RecordAudio("411221080", var_326_9)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_411221", "411221080", "story_v_out_411221.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_411221", "411221080", "story_v_out_411221.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_10 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_10 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_10

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_10 and arg_323_1.time_ < var_326_0 + var_326_10 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play411221081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 411221081
		arg_327_1.duration_ = 3.2

		local var_327_0 = {
			zh = 1.999999999999,
			ja = 3.2
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
				arg_327_0:Play411221082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["10058ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect10058ui_story == nil then
				arg_327_1.var_.characterEffect10058ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect10058ui_story then
					arg_327_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect10058ui_story then
				arg_327_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_330_4 = 0

			if var_330_4 < arg_327_1.time_ and arg_327_1.time_ <= var_330_4 + arg_330_0 then
				arg_327_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action5_2")
			end

			local var_330_5 = 0

			if var_330_5 < arg_327_1.time_ and arg_327_1.time_ <= var_330_5 + arg_330_0 then
				arg_327_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_330_6 = arg_327_1.actors_["10002_tpose"]
			local var_330_7 = 0

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 and arg_327_1.var_.characterEffect10002_tpose == nil then
				arg_327_1.var_.characterEffect10002_tpose = var_330_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_8 = 0.200000002980232

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_8 then
				local var_330_9 = (arg_327_1.time_ - var_330_7) / var_330_8

				if arg_327_1.var_.characterEffect10002_tpose then
					local var_330_10 = Mathf.Lerp(0, 0.5, var_330_9)

					arg_327_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_327_1.var_.characterEffect10002_tpose.fillRatio = var_330_10
				end
			end

			if arg_327_1.time_ >= var_330_7 + var_330_8 and arg_327_1.time_ < var_330_7 + var_330_8 + arg_330_0 and arg_327_1.var_.characterEffect10002_tpose then
				local var_330_11 = 0.5

				arg_327_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_327_1.var_.characterEffect10002_tpose.fillRatio = var_330_11
			end

			local var_330_12 = 0
			local var_330_13 = 0.075

			if var_330_12 < arg_327_1.time_ and arg_327_1.time_ <= var_330_12 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_14 = arg_327_1:FormatText(StoryNameCfg[471].name)

				arg_327_1.leftNameTxt_.text = var_330_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_15 = arg_327_1:GetWordFromCfg(411221081)
				local var_330_16 = arg_327_1:FormatText(var_330_15.content)

				arg_327_1.text_.text = var_330_16

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_17 = 3
				local var_330_18 = utf8.len(var_330_16)
				local var_330_19 = var_330_17 <= 0 and var_330_13 or var_330_13 * (var_330_18 / var_330_17)

				if var_330_19 > 0 and var_330_13 < var_330_19 then
					arg_327_1.talkMaxDuration = var_330_19

					if var_330_19 + var_330_12 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_19 + var_330_12
					end
				end

				arg_327_1.text_.text = var_330_16
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221081", "story_v_out_411221.awb") ~= 0 then
					local var_330_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221081", "story_v_out_411221.awb") / 1000

					if var_330_20 + var_330_12 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_20 + var_330_12
					end

					if var_330_15.prefab_name ~= "" and arg_327_1.actors_[var_330_15.prefab_name] ~= nil then
						local var_330_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_15.prefab_name].transform, "story_v_out_411221", "411221081", "story_v_out_411221.awb")

						arg_327_1:RecordAudio("411221081", var_330_21)
						arg_327_1:RecordAudio("411221081", var_330_21)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_411221", "411221081", "story_v_out_411221.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_411221", "411221081", "story_v_out_411221.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_22 = math.max(var_330_13, arg_327_1.talkMaxDuration)

			if var_330_12 <= arg_327_1.time_ and arg_327_1.time_ < var_330_12 + var_330_22 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_12) / var_330_22

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_12 + var_330_22 and arg_327_1.time_ < var_330_12 + var_330_22 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play411221082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 411221082
		arg_331_1.duration_ = 8.266

		local var_331_0 = {
			zh = 8.266,
			ja = 4.2
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
				arg_331_0:Play411221083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 0.85

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[471].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_3 = arg_331_1:GetWordFromCfg(411221082)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 34
				local var_334_6 = utf8.len(var_334_4)
				local var_334_7 = var_334_5 <= 0 and var_334_1 or var_334_1 * (var_334_6 / var_334_5)

				if var_334_7 > 0 and var_334_1 < var_334_7 then
					arg_331_1.talkMaxDuration = var_334_7

					if var_334_7 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_7 + var_334_0
					end
				end

				arg_331_1.text_.text = var_334_4
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221082", "story_v_out_411221.awb") ~= 0 then
					local var_334_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221082", "story_v_out_411221.awb") / 1000

					if var_334_8 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_8 + var_334_0
					end

					if var_334_3.prefab_name ~= "" and arg_331_1.actors_[var_334_3.prefab_name] ~= nil then
						local var_334_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_3.prefab_name].transform, "story_v_out_411221", "411221082", "story_v_out_411221.awb")

						arg_331_1:RecordAudio("411221082", var_334_9)
						arg_331_1:RecordAudio("411221082", var_334_9)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_411221", "411221082", "story_v_out_411221.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_411221", "411221082", "story_v_out_411221.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_10 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_10 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_10

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_10 and arg_331_1.time_ < var_334_0 + var_334_10 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play411221083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 411221083
		arg_335_1.duration_ = 4.466

		local var_335_0 = {
			zh = 3,
			ja = 4.466
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
				arg_335_0:Play411221084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["10058ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect10058ui_story == nil then
				arg_335_1.var_.characterEffect10058ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect10058ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_335_1.var_.characterEffect10058ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect10058ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_335_1.var_.characterEffect10058ui_story.fillRatio = var_338_5
			end

			local var_338_6 = arg_335_1.actors_["10002_tpose"]
			local var_338_7 = 0

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 and arg_335_1.var_.characterEffect10002_tpose == nil then
				arg_335_1.var_.characterEffect10002_tpose = var_338_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_8 = 0.200000002980232

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_8 then
				local var_338_9 = (arg_335_1.time_ - var_338_7) / var_338_8

				if arg_335_1.var_.characterEffect10002_tpose then
					arg_335_1.var_.characterEffect10002_tpose.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_7 + var_338_8 and arg_335_1.time_ < var_338_7 + var_338_8 + arg_338_0 and arg_335_1.var_.characterEffect10002_tpose then
				arg_335_1.var_.characterEffect10002_tpose.fillFlat = false
			end

			local var_338_10 = 0

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 then
				arg_335_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_338_11 = 0

			if var_338_11 < arg_335_1.time_ and arg_335_1.time_ <= var_338_11 + arg_338_0 then
				arg_335_1:PlayTimeline("10002_tpose", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_338_12 = 0
			local var_338_13 = 0.3

			if var_338_12 < arg_335_1.time_ and arg_335_1.time_ <= var_338_12 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_14 = arg_335_1:FormatText(StoryNameCfg[39].name)

				arg_335_1.leftNameTxt_.text = var_338_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_15 = arg_335_1:GetWordFromCfg(411221083)
				local var_338_16 = arg_335_1:FormatText(var_338_15.content)

				arg_335_1.text_.text = var_338_16

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_17 = 12
				local var_338_18 = utf8.len(var_338_16)
				local var_338_19 = var_338_17 <= 0 and var_338_13 or var_338_13 * (var_338_18 / var_338_17)

				if var_338_19 > 0 and var_338_13 < var_338_19 then
					arg_335_1.talkMaxDuration = var_338_19

					if var_338_19 + var_338_12 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_19 + var_338_12
					end
				end

				arg_335_1.text_.text = var_338_16
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221083", "story_v_out_411221.awb") ~= 0 then
					local var_338_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221083", "story_v_out_411221.awb") / 1000

					if var_338_20 + var_338_12 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_20 + var_338_12
					end

					if var_338_15.prefab_name ~= "" and arg_335_1.actors_[var_338_15.prefab_name] ~= nil then
						local var_338_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_15.prefab_name].transform, "story_v_out_411221", "411221083", "story_v_out_411221.awb")

						arg_335_1:RecordAudio("411221083", var_338_21)
						arg_335_1:RecordAudio("411221083", var_338_21)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_411221", "411221083", "story_v_out_411221.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_411221", "411221083", "story_v_out_411221.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_22 = math.max(var_338_13, arg_335_1.talkMaxDuration)

			if var_338_12 <= arg_335_1.time_ and arg_335_1.time_ < var_338_12 + var_338_22 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_12) / var_338_22

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_12 + var_338_22 and arg_335_1.time_ < var_338_12 + var_338_22 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play411221084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 411221084
		arg_339_1.duration_ = 4.6

		local var_339_0 = {
			zh = 4.466,
			ja = 4.6
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
				arg_339_0:Play411221085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["10058ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect10058ui_story == nil then
				arg_339_1.var_.characterEffect10058ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.200000002980232

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect10058ui_story then
					arg_339_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect10058ui_story then
				arg_339_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_342_4 = 0

			if var_342_4 < arg_339_1.time_ and arg_339_1.time_ <= var_342_4 + arg_342_0 then
				arg_339_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_342_5 = 0

			if var_342_5 < arg_339_1.time_ and arg_339_1.time_ <= var_342_5 + arg_342_0 then
				arg_339_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_6 = arg_339_1.actors_["10002_tpose"]
			local var_342_7 = 0

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 and arg_339_1.var_.characterEffect10002_tpose == nil then
				arg_339_1.var_.characterEffect10002_tpose = var_342_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_8 = 0.200000002980232

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_8 then
				local var_342_9 = (arg_339_1.time_ - var_342_7) / var_342_8

				if arg_339_1.var_.characterEffect10002_tpose then
					local var_342_10 = Mathf.Lerp(0, 0.5, var_342_9)

					arg_339_1.var_.characterEffect10002_tpose.fillFlat = true
					arg_339_1.var_.characterEffect10002_tpose.fillRatio = var_342_10
				end
			end

			if arg_339_1.time_ >= var_342_7 + var_342_8 and arg_339_1.time_ < var_342_7 + var_342_8 + arg_342_0 and arg_339_1.var_.characterEffect10002_tpose then
				local var_342_11 = 0.5

				arg_339_1.var_.characterEffect10002_tpose.fillFlat = true
				arg_339_1.var_.characterEffect10002_tpose.fillRatio = var_342_11
			end

			local var_342_12 = 0
			local var_342_13 = 0.5

			if var_342_12 < arg_339_1.time_ and arg_339_1.time_ <= var_342_12 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_14 = arg_339_1:FormatText(StoryNameCfg[471].name)

				arg_339_1.leftNameTxt_.text = var_342_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_15 = arg_339_1:GetWordFromCfg(411221084)
				local var_342_16 = arg_339_1:FormatText(var_342_15.content)

				arg_339_1.text_.text = var_342_16

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_17 = 20
				local var_342_18 = utf8.len(var_342_16)
				local var_342_19 = var_342_17 <= 0 and var_342_13 or var_342_13 * (var_342_18 / var_342_17)

				if var_342_19 > 0 and var_342_13 < var_342_19 then
					arg_339_1.talkMaxDuration = var_342_19

					if var_342_19 + var_342_12 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_19 + var_342_12
					end
				end

				arg_339_1.text_.text = var_342_16
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221084", "story_v_out_411221.awb") ~= 0 then
					local var_342_20 = manager.audio:GetVoiceLength("story_v_out_411221", "411221084", "story_v_out_411221.awb") / 1000

					if var_342_20 + var_342_12 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_20 + var_342_12
					end

					if var_342_15.prefab_name ~= "" and arg_339_1.actors_[var_342_15.prefab_name] ~= nil then
						local var_342_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_15.prefab_name].transform, "story_v_out_411221", "411221084", "story_v_out_411221.awb")

						arg_339_1:RecordAudio("411221084", var_342_21)
						arg_339_1:RecordAudio("411221084", var_342_21)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_411221", "411221084", "story_v_out_411221.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_411221", "411221084", "story_v_out_411221.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_22 = math.max(var_342_13, arg_339_1.talkMaxDuration)

			if var_342_12 <= arg_339_1.time_ and arg_339_1.time_ < var_342_12 + var_342_22 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_12) / var_342_22

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_12 + var_342_22 and arg_339_1.time_ < var_342_12 + var_342_22 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play411221085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 411221085
		arg_343_1.duration_ = 5.666

		local var_343_0 = {
			zh = 4.533,
			ja = 5.666
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
			arg_343_1.auto_ = false
		end

		function arg_343_1.playNext_(arg_345_0)
			arg_343_1.onStoryFinished_()
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.45

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_2 = arg_343_1:FormatText(StoryNameCfg[471].name)

				arg_343_1.leftNameTxt_.text = var_346_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_3 = arg_343_1:GetWordFromCfg(411221085)
				local var_346_4 = arg_343_1:FormatText(var_346_3.content)

				arg_343_1.text_.text = var_346_4

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_5 = 18
				local var_346_6 = utf8.len(var_346_4)
				local var_346_7 = var_346_5 <= 0 and var_346_1 or var_346_1 * (var_346_6 / var_346_5)

				if var_346_7 > 0 and var_346_1 < var_346_7 then
					arg_343_1.talkMaxDuration = var_346_7

					if var_346_7 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_7 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_4
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411221", "411221085", "story_v_out_411221.awb") ~= 0 then
					local var_346_8 = manager.audio:GetVoiceLength("story_v_out_411221", "411221085", "story_v_out_411221.awb") / 1000

					if var_346_8 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_8 + var_346_0
					end

					if var_346_3.prefab_name ~= "" and arg_343_1.actors_[var_346_3.prefab_name] ~= nil then
						local var_346_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_3.prefab_name].transform, "story_v_out_411221", "411221085", "story_v_out_411221.awb")

						arg_343_1:RecordAudio("411221085", var_346_9)
						arg_343_1:RecordAudio("411221085", var_346_9)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_411221", "411221085", "story_v_out_411221.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_411221", "411221085", "story_v_out_411221.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_10 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_10 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_10

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_10 and arg_343_1.time_ < var_346_0 + var_346_10 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I06"
	},
	voices = {
		"story_v_out_411221.awb"
	}
}
