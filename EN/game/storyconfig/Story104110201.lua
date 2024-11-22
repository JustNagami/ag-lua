return {
	Play411021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 411021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play411021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11m"

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
				local var_4_5 = arg_1_1.bgs_.I11m

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
					if iter_4_0 ~= "I11m" then
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
			local var_4_23 = 0.366666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.6
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.85

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

				local var_4_33 = arg_1_1:GetWordFromCfg(411021001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 34
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
	Play411021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 411021002
		arg_7_1.duration_ = 3.866

		local var_7_0 = {
			zh = 3.866,
			ja = 3.766
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
				arg_7_0:Play411021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.55

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[648].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(411021002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 22
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021002", "story_v_out_411021.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021002", "story_v_out_411021.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_411021", "411021002", "story_v_out_411021.awb")

						arg_7_1:RecordAudio("411021002", var_10_9)
						arg_7_1:RecordAudio("411021002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_411021", "411021002", "story_v_out_411021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_411021", "411021002", "story_v_out_411021.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play411021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 411021003
		arg_11_1.duration_ = 4.266

		local var_11_0 = {
			zh = 3.633,
			ja = 4.266
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
				arg_11_0:Play411021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1095ui_story"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(Asset.Load("Char/" .. var_14_0), arg_11_1.stage_.transform)

				var_14_1.name = var_14_0
				var_14_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.actors_[var_14_0] = var_14_1

				local var_14_2 = var_14_1:GetComponentInChildren(typeof(CharacterEffect))

				var_14_2.enabled = true

				local var_14_3 = GameObjectTools.GetOrAddComponent(var_14_1, typeof(DynamicBoneHelper))

				if var_14_3 then
					var_14_3:EnableDynamicBone(false)
				end

				arg_11_1:ShowWeapon(var_14_2.transform, false)

				arg_11_1.var_[var_14_0 .. "Animator"] = var_14_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_11_1.var_[var_14_0 .. "Animator"].applyRootMotion = true
				arg_11_1.var_[var_14_0 .. "LipSync"] = var_14_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_14_4 = arg_11_1.actors_["1095ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1095ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -0.98, -6.1)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1095ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1095ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story == nil then
				arg_11_1.var_.characterEffect1095ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect1095ui_story then
					arg_11_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect1095ui_story then
				arg_11_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_14_19 = 0
			local var_14_20 = 0.4

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[471].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(411021003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 16
				local var_14_25 = utf8.len(var_14_23)
				local var_14_26 = var_14_24 <= 0 and var_14_20 or var_14_20 * (var_14_25 / var_14_24)

				if var_14_26 > 0 and var_14_20 < var_14_26 then
					arg_11_1.talkMaxDuration = var_14_26

					if var_14_26 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_26 + var_14_19
					end
				end

				arg_11_1.text_.text = var_14_23
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021003", "story_v_out_411021.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_411021", "411021003", "story_v_out_411021.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_411021", "411021003", "story_v_out_411021.awb")

						arg_11_1:RecordAudio("411021003", var_14_28)
						arg_11_1:RecordAudio("411021003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_411021", "411021003", "story_v_out_411021.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_411021", "411021003", "story_v_out_411021.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_29 = math.max(var_14_20, arg_11_1.talkMaxDuration)

			if var_14_19 <= arg_11_1.time_ and arg_11_1.time_ < var_14_19 + var_14_29 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_19) / var_14_29

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_19 + var_14_29 and arg_11_1.time_ < var_14_19 + var_14_29 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play411021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 411021004
		arg_15_1.duration_ = 8.5

		local var_15_0 = {
			zh = 7.433,
			ja = 8.5
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
				arg_15_0:Play411021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1095ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story == nil then
				arg_15_1.var_.characterEffect1095ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1095ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1095ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1095ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.95

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[648].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(411021004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021004", "story_v_out_411021.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_411021", "411021004", "story_v_out_411021.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_411021", "411021004", "story_v_out_411021.awb")

						arg_15_1:RecordAudio("411021004", var_18_15)
						arg_15_1:RecordAudio("411021004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_411021", "411021004", "story_v_out_411021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_411021", "411021004", "story_v_out_411021.awb")
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
	Play411021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 411021005
		arg_19_1.duration_ = 10.2

		local var_19_0 = {
			zh = 6.533,
			ja = 10.2
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
				arg_19_0:Play411021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1095ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story == nil then
				arg_19_1.var_.characterEffect1095ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.200000002980232

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1095ui_story then
					arg_19_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story then
				arg_19_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_22_4 = 0
			local var_22_5 = 0.725

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_6 = arg_19_1:FormatText(StoryNameCfg[471].name)

				arg_19_1.leftNameTxt_.text = var_22_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_7 = arg_19_1:GetWordFromCfg(411021005)
				local var_22_8 = arg_19_1:FormatText(var_22_7.content)

				arg_19_1.text_.text = var_22_8

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_9 = 29
				local var_22_10 = utf8.len(var_22_8)
				local var_22_11 = var_22_9 <= 0 and var_22_5 or var_22_5 * (var_22_10 / var_22_9)

				if var_22_11 > 0 and var_22_5 < var_22_11 then
					arg_19_1.talkMaxDuration = var_22_11

					if var_22_11 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_11 + var_22_4
					end
				end

				arg_19_1.text_.text = var_22_8
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021005", "story_v_out_411021.awb") ~= 0 then
					local var_22_12 = manager.audio:GetVoiceLength("story_v_out_411021", "411021005", "story_v_out_411021.awb") / 1000

					if var_22_12 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_4
					end

					if var_22_7.prefab_name ~= "" and arg_19_1.actors_[var_22_7.prefab_name] ~= nil then
						local var_22_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_7.prefab_name].transform, "story_v_out_411021", "411021005", "story_v_out_411021.awb")

						arg_19_1:RecordAudio("411021005", var_22_13)
						arg_19_1:RecordAudio("411021005", var_22_13)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_411021", "411021005", "story_v_out_411021.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_411021", "411021005", "story_v_out_411021.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_14 = math.max(var_22_5, arg_19_1.talkMaxDuration)

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_14 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_4) / var_22_14

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_4 + var_22_14 and arg_19_1.time_ < var_22_4 + var_22_14 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play411021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 411021006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play411021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1095ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1095ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.575

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(411021006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 23
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play411021007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 411021007
		arg_27_1.duration_ = 1.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play411021008(arg_27_1)
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
					arg_27_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1095ui_story then
				arg_27_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_30_6 = 0
			local var_30_7 = 0.175

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[471].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(411021007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021007", "story_v_out_411021.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_411021", "411021007", "story_v_out_411021.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_411021", "411021007", "story_v_out_411021.awb")

						arg_27_1:RecordAudio("411021007", var_30_15)
						arg_27_1:RecordAudio("411021007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_411021", "411021007", "story_v_out_411021.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_411021", "411021007", "story_v_out_411021.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_16 and arg_27_1.time_ < var_30_6 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play411021008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 411021008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play411021009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1095ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story == nil then
				arg_31_1.var_.characterEffect1095ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1095ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1095ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1095ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.975

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(411021008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 39
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_7 or var_34_7 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_7 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_13 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_13 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_13

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_13 and arg_31_1.time_ < var_34_6 + var_34_13 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play411021009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 411021009
		arg_35_1.duration_ = 7

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play411021010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 2

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				local var_38_1 = manager.ui.mainCamera.transform.localPosition
				local var_38_2 = Vector3.New(0, 0, 10) + Vector3.New(var_38_1.x, var_38_1.y, 0)
				local var_38_3 = arg_35_1.bgs_.I11m

				var_38_3.transform.localPosition = var_38_2
				var_38_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_4 = var_38_3:GetComponent("SpriteRenderer")

				if var_38_4 and var_38_4.sprite then
					local var_38_5 = (var_38_3.transform.localPosition - var_38_1).z
					local var_38_6 = manager.ui.mainCameraCom_
					local var_38_7 = 2 * var_38_5 * Mathf.Tan(var_38_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_8 = var_38_7 * var_38_6.aspect
					local var_38_9 = var_38_4.sprite.bounds.size.x
					local var_38_10 = var_38_4.sprite.bounds.size.y
					local var_38_11 = var_38_8 / var_38_9
					local var_38_12 = var_38_7 / var_38_10
					local var_38_13 = var_38_12 < var_38_11 and var_38_11 or var_38_12

					var_38_3.transform.localScale = Vector3.New(var_38_13, var_38_13, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "I11m" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_15 = 2

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15
				local var_38_17 = Color.New(0, 0, 0)

				var_38_17.a = Mathf.Lerp(0, 1, var_38_16)
				arg_35_1.mask_.color = var_38_17
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 then
				local var_38_18 = Color.New(0, 0, 0)

				var_38_18.a = 1
				arg_35_1.mask_.color = var_38_18
			end

			local var_38_19 = 2

			if var_38_19 < arg_35_1.time_ and arg_35_1.time_ <= var_38_19 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_20 = 2

			if var_38_19 <= arg_35_1.time_ and arg_35_1.time_ < var_38_19 + var_38_20 then
				local var_38_21 = (arg_35_1.time_ - var_38_19) / var_38_20
				local var_38_22 = Color.New(0, 0, 0)

				var_38_22.a = Mathf.Lerp(1, 0, var_38_21)
				arg_35_1.mask_.color = var_38_22
			end

			if arg_35_1.time_ >= var_38_19 + var_38_20 and arg_35_1.time_ < var_38_19 + var_38_20 + arg_38_0 then
				local var_38_23 = Color.New(0, 0, 0)
				local var_38_24 = 0

				arg_35_1.mask_.enabled = false
				var_38_23.a = var_38_24
				arg_35_1.mask_.color = var_38_23
			end

			local var_38_25 = arg_35_1.actors_["1095ui_story"]
			local var_38_26 = 2

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_27 = 0.200000002980232

			if var_38_26 <= arg_35_1.time_ and arg_35_1.time_ < var_38_26 + var_38_27 then
				local var_38_28 = (arg_35_1.time_ - var_38_26) / var_38_27

				if arg_35_1.var_.characterEffect1095ui_story then
					local var_38_29 = Mathf.Lerp(0, 0.5, var_38_28)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_29
				end
			end

			if arg_35_1.time_ >= var_38_26 + var_38_27 and arg_35_1.time_ < var_38_26 + var_38_27 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_30 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_30
			end

			local var_38_31 = 2

			if var_38_31 < arg_35_1.time_ and arg_35_1.time_ <= var_38_31 + arg_38_0 then
				arg_35_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_38_32 = 2

			if var_38_32 < arg_35_1.time_ and arg_35_1.time_ <= var_38_32 + arg_38_0 then
				arg_35_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_38_33 = arg_35_1.actors_["1095ui_story"].transform
			local var_38_34 = 2

			if var_38_34 < arg_35_1.time_ and arg_35_1.time_ <= var_38_34 + arg_38_0 then
				arg_35_1.var_.moveOldPos1095ui_story = var_38_33.localPosition
			end

			local var_38_35 = 0.001

			if var_38_34 <= arg_35_1.time_ and arg_35_1.time_ < var_38_34 + var_38_35 then
				local var_38_36 = (arg_35_1.time_ - var_38_34) / var_38_35
				local var_38_37 = Vector3.New(0, -0.98, -6.1)

				var_38_33.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1095ui_story, var_38_37, var_38_36)

				local var_38_38 = manager.ui.mainCamera.transform.position - var_38_33.position

				var_38_33.forward = Vector3.New(var_38_38.x, var_38_38.y, var_38_38.z)

				local var_38_39 = var_38_33.localEulerAngles

				var_38_39.z = 0
				var_38_39.x = 0
				var_38_33.localEulerAngles = var_38_39
			end

			if arg_35_1.time_ >= var_38_34 + var_38_35 and arg_35_1.time_ < var_38_34 + var_38_35 + arg_38_0 then
				var_38_33.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_38_40 = manager.ui.mainCamera.transform.position - var_38_33.position

				var_38_33.forward = Vector3.New(var_38_40.x, var_38_40.y, var_38_40.z)

				local var_38_41 = var_38_33.localEulerAngles

				var_38_41.z = 0
				var_38_41.x = 0
				var_38_33.localEulerAngles = var_38_41
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_42 = 2
			local var_38_43 = 1.05

			if var_38_42 < arg_35_1.time_ and arg_35_1.time_ <= var_38_42 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_44 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_44:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_45 = arg_35_1:GetWordFromCfg(411021009)
				local var_38_46 = arg_35_1:FormatText(var_38_45.content)

				arg_35_1.text_.text = var_38_46

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_47 = 46
				local var_38_48 = utf8.len(var_38_46)
				local var_38_49 = var_38_47 <= 0 and var_38_43 or var_38_43 * (var_38_48 / var_38_47)

				if var_38_49 > 0 and var_38_43 < var_38_49 then
					arg_35_1.talkMaxDuration = var_38_49
					var_38_42 = var_38_42 + 0.3

					if var_38_49 + var_38_42 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_49 + var_38_42
					end
				end

				arg_35_1.text_.text = var_38_46
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_50 = var_38_42 + 0.3
			local var_38_51 = math.max(var_38_43, arg_35_1.talkMaxDuration)

			if var_38_50 <= arg_35_1.time_ and arg_35_1.time_ < var_38_50 + var_38_51 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_50) / var_38_51

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_50 + var_38_51 and arg_35_1.time_ < var_38_50 + var_38_51 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play411021010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 411021010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play411021011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.7

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_2 = arg_41_1:GetWordFromCfg(411021010)
				local var_44_3 = arg_41_1:FormatText(var_44_2.content)

				arg_41_1.text_.text = var_44_3

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_4 = 28
				local var_44_5 = utf8.len(var_44_3)
				local var_44_6 = var_44_4 <= 0 and var_44_1 or var_44_1 * (var_44_5 / var_44_4)

				if var_44_6 > 0 and var_44_1 < var_44_6 then
					arg_41_1.talkMaxDuration = var_44_6

					if var_44_6 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_6 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_3
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_7 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_7 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_7

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_7 and arg_41_1.time_ < var_44_0 + var_44_7 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play411021011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 411021011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play411021012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.875

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_2 = arg_45_1:GetWordFromCfg(411021011)
				local var_48_3 = arg_45_1:FormatText(var_48_2.content)

				arg_45_1.text_.text = var_48_3

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_4 = 35
				local var_48_5 = utf8.len(var_48_3)
				local var_48_6 = var_48_4 <= 0 and var_48_1 or var_48_1 * (var_48_5 / var_48_4)

				if var_48_6 > 0 and var_48_1 < var_48_6 then
					arg_45_1.talkMaxDuration = var_48_6

					if var_48_6 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_6 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_3
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_7 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_7 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_7

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_7 and arg_45_1.time_ < var_48_0 + var_48_7 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play411021012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 411021012
		arg_49_1.duration_ = 4.566

		local var_49_0 = {
			zh = 4.533,
			ja = 4.566
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
				arg_49_0:Play411021013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = "ST74a"

			if arg_49_1.bgs_[var_52_0] == nil then
				local var_52_1 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_0)
				var_52_1.name = var_52_0
				var_52_1.transform.parent = arg_49_1.stage_.transform
				var_52_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_0] = var_52_1
			end

			local var_52_2 = 2

			if var_52_2 < arg_49_1.time_ and arg_49_1.time_ <= var_52_2 + arg_52_0 then
				local var_52_3 = manager.ui.mainCamera.transform.localPosition
				local var_52_4 = Vector3.New(0, 0, 10) + Vector3.New(var_52_3.x, var_52_3.y, 0)
				local var_52_5 = arg_49_1.bgs_.ST74a

				var_52_5.transform.localPosition = var_52_4
				var_52_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_6 = var_52_5:GetComponent("SpriteRenderer")

				if var_52_6 and var_52_6.sprite then
					local var_52_7 = (var_52_5.transform.localPosition - var_52_3).z
					local var_52_8 = manager.ui.mainCameraCom_
					local var_52_9 = 2 * var_52_7 * Mathf.Tan(var_52_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_10 = var_52_9 * var_52_8.aspect
					local var_52_11 = var_52_6.sprite.bounds.size.x
					local var_52_12 = var_52_6.sprite.bounds.size.y
					local var_52_13 = var_52_10 / var_52_11
					local var_52_14 = var_52_9 / var_52_12
					local var_52_15 = var_52_14 < var_52_13 and var_52_13 or var_52_14

					var_52_5.transform.localScale = Vector3.New(var_52_15, var_52_15, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "ST74a" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_16 = 0

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_17 = 2

			if var_52_16 <= arg_49_1.time_ and arg_49_1.time_ < var_52_16 + var_52_17 then
				local var_52_18 = (arg_49_1.time_ - var_52_16) / var_52_17
				local var_52_19 = Color.New(0, 0, 0)

				var_52_19.a = Mathf.Lerp(0, 1, var_52_18)
				arg_49_1.mask_.color = var_52_19
			end

			if arg_49_1.time_ >= var_52_16 + var_52_17 and arg_49_1.time_ < var_52_16 + var_52_17 + arg_52_0 then
				local var_52_20 = Color.New(0, 0, 0)

				var_52_20.a = 1
				arg_49_1.mask_.color = var_52_20
			end

			local var_52_21 = 2

			if var_52_21 < arg_49_1.time_ and arg_49_1.time_ <= var_52_21 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_22 = 2

			if var_52_21 <= arg_49_1.time_ and arg_49_1.time_ < var_52_21 + var_52_22 then
				local var_52_23 = (arg_49_1.time_ - var_52_21) / var_52_22
				local var_52_24 = Color.New(0, 0, 0)

				var_52_24.a = Mathf.Lerp(1, 0, var_52_23)
				arg_49_1.mask_.color = var_52_24
			end

			if arg_49_1.time_ >= var_52_21 + var_52_22 and arg_49_1.time_ < var_52_21 + var_52_22 + arg_52_0 then
				local var_52_25 = Color.New(0, 0, 0)
				local var_52_26 = 0

				arg_49_1.mask_.enabled = false
				var_52_25.a = var_52_26
				arg_49_1.mask_.color = var_52_25
			end

			local var_52_27 = arg_49_1.actors_["1095ui_story"].transform
			local var_52_28 = 2

			if var_52_28 < arg_49_1.time_ and arg_49_1.time_ <= var_52_28 + arg_52_0 then
				arg_49_1.var_.moveOldPos1095ui_story = var_52_27.localPosition
			end

			local var_52_29 = 0.001

			if var_52_28 <= arg_49_1.time_ and arg_49_1.time_ < var_52_28 + var_52_29 then
				local var_52_30 = (arg_49_1.time_ - var_52_28) / var_52_29
				local var_52_31 = Vector3.New(0, -0.98, -6.1)

				var_52_27.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1095ui_story, var_52_31, var_52_30)

				local var_52_32 = manager.ui.mainCamera.transform.position - var_52_27.position

				var_52_27.forward = Vector3.New(var_52_32.x, var_52_32.y, var_52_32.z)

				local var_52_33 = var_52_27.localEulerAngles

				var_52_33.z = 0
				var_52_33.x = 0
				var_52_27.localEulerAngles = var_52_33
			end

			if arg_49_1.time_ >= var_52_28 + var_52_29 and arg_49_1.time_ < var_52_28 + var_52_29 + arg_52_0 then
				var_52_27.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_52_34 = manager.ui.mainCamera.transform.position - var_52_27.position

				var_52_27.forward = Vector3.New(var_52_34.x, var_52_34.y, var_52_34.z)

				local var_52_35 = var_52_27.localEulerAngles

				var_52_35.z = 0
				var_52_35.x = 0
				var_52_27.localEulerAngles = var_52_35
			end

			local var_52_36 = arg_49_1.actors_["1095ui_story"]
			local var_52_37 = 2

			if var_52_37 < arg_49_1.time_ and arg_49_1.time_ <= var_52_37 + arg_52_0 and arg_49_1.var_.characterEffect1095ui_story == nil then
				arg_49_1.var_.characterEffect1095ui_story = var_52_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_38 = 0.200000002980232

			if var_52_37 <= arg_49_1.time_ and arg_49_1.time_ < var_52_37 + var_52_38 then
				local var_52_39 = (arg_49_1.time_ - var_52_37) / var_52_38

				if arg_49_1.var_.characterEffect1095ui_story then
					arg_49_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_37 + var_52_38 and arg_49_1.time_ < var_52_37 + var_52_38 + arg_52_0 and arg_49_1.var_.characterEffect1095ui_story then
				arg_49_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_52_40 = 2

			if var_52_40 < arg_49_1.time_ and arg_49_1.time_ <= var_52_40 + arg_52_0 then
				arg_49_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_52_41 = 0
			local var_52_42 = 0.366666666666667

			if var_52_41 < arg_49_1.time_ and arg_49_1.time_ <= var_52_41 + arg_52_0 then
				local var_52_43 = "play"
				local var_52_44 = "music"

				arg_49_1:AudioAction(var_52_43, var_52_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_52_45 = 0.6
			local var_52_46 = 1

			if var_52_45 < arg_49_1.time_ and arg_49_1.time_ <= var_52_45 + arg_52_0 then
				local var_52_47 = "play"
				local var_52_48 = "music"

				arg_49_1:AudioAction(var_52_47, var_52_48, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			if arg_49_1.frameCnt_ <= 1 then
				arg_49_1.dialog_:SetActive(false)
			end

			local var_52_49 = 2
			local var_52_50 = 0.225

			if var_52_49 < arg_49_1.time_ and arg_49_1.time_ <= var_52_49 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_51 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_51:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_52 = arg_49_1:FormatText(StoryNameCfg[471].name)

				arg_49_1.leftNameTxt_.text = var_52_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_53 = arg_49_1:GetWordFromCfg(411021012)
				local var_52_54 = arg_49_1:FormatText(var_52_53.content)

				arg_49_1.text_.text = var_52_54

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_55 = 9
				local var_52_56 = utf8.len(var_52_54)
				local var_52_57 = var_52_55 <= 0 and var_52_50 or var_52_50 * (var_52_56 / var_52_55)

				if var_52_57 > 0 and var_52_50 < var_52_57 then
					arg_49_1.talkMaxDuration = var_52_57
					var_52_49 = var_52_49 + 0.3

					if var_52_57 + var_52_49 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_57 + var_52_49
					end
				end

				arg_49_1.text_.text = var_52_54
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021012", "story_v_out_411021.awb") ~= 0 then
					local var_52_58 = manager.audio:GetVoiceLength("story_v_out_411021", "411021012", "story_v_out_411021.awb") / 1000

					if var_52_58 + var_52_49 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_58 + var_52_49
					end

					if var_52_53.prefab_name ~= "" and arg_49_1.actors_[var_52_53.prefab_name] ~= nil then
						local var_52_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_53.prefab_name].transform, "story_v_out_411021", "411021012", "story_v_out_411021.awb")

						arg_49_1:RecordAudio("411021012", var_52_59)
						arg_49_1:RecordAudio("411021012", var_52_59)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_411021", "411021012", "story_v_out_411021.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_411021", "411021012", "story_v_out_411021.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_60 = var_52_49 + 0.3
			local var_52_61 = math.max(var_52_50, arg_49_1.talkMaxDuration)

			if var_52_60 <= arg_49_1.time_ and arg_49_1.time_ < var_52_60 + var_52_61 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_60) / var_52_61

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_60 + var_52_61 and arg_49_1.time_ < var_52_60 + var_52_61 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play411021013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 411021013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play411021014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1095ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story == nil then
				arg_55_1.var_.characterEffect1095ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1095ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1095ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1095ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 0.75

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_8 = arg_55_1:GetWordFromCfg(411021013)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 30
				local var_58_11 = utf8.len(var_58_9)
				local var_58_12 = var_58_10 <= 0 and var_58_7 or var_58_7 * (var_58_11 / var_58_10)

				if var_58_12 > 0 and var_58_7 < var_58_12 then
					arg_55_1.talkMaxDuration = var_58_12

					if var_58_12 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_9
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_13 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_13 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_13

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_13 and arg_55_1.time_ < var_58_6 + var_58_13 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play411021014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 411021014
		arg_59_1.duration_ = 1.1

		local var_59_0 = {
			zh = 1.066,
			ja = 1.1
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
				arg_59_0:Play411021015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.366666666666667

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				local var_62_2 = "play"
				local var_62_3 = "effect"

				arg_59_1:AudioAction(var_62_2, var_62_3, "se_story_131", "se_story_131__bookfall", "")
			end

			local var_62_4 = 0
			local var_62_5 = 0.1

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_6 = arg_59_1:FormatText(StoryNameCfg[36].name)

				arg_59_1.leftNameTxt_.text = var_62_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_7 = arg_59_1:GetWordFromCfg(411021014)
				local var_62_8 = arg_59_1:FormatText(var_62_7.content)

				arg_59_1.text_.text = var_62_8

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_9 = 4
				local var_62_10 = utf8.len(var_62_8)
				local var_62_11 = var_62_9 <= 0 and var_62_5 or var_62_5 * (var_62_10 / var_62_9)

				if var_62_11 > 0 and var_62_5 < var_62_11 then
					arg_59_1.talkMaxDuration = var_62_11

					if var_62_11 + var_62_4 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_11 + var_62_4
					end
				end

				arg_59_1.text_.text = var_62_8
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021014", "story_v_out_411021.awb") ~= 0 then
					local var_62_12 = manager.audio:GetVoiceLength("story_v_out_411021", "411021014", "story_v_out_411021.awb") / 1000

					if var_62_12 + var_62_4 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_4
					end

					if var_62_7.prefab_name ~= "" and arg_59_1.actors_[var_62_7.prefab_name] ~= nil then
						local var_62_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_7.prefab_name].transform, "story_v_out_411021", "411021014", "story_v_out_411021.awb")

						arg_59_1:RecordAudio("411021014", var_62_13)
						arg_59_1:RecordAudio("411021014", var_62_13)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_411021", "411021014", "story_v_out_411021.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_411021", "411021014", "story_v_out_411021.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_5, arg_59_1.talkMaxDuration)

			if var_62_4 <= arg_59_1.time_ and arg_59_1.time_ < var_62_4 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_4) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_4 + var_62_14 and arg_59_1.time_ < var_62_4 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play411021015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 411021015
		arg_63_1.duration_ = 1.999999999999

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play411021016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1095ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1095ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, -0.98, -6.1)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1095ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1095ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story == nil then
				arg_63_1.var_.characterEffect1095ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1095ui_story then
					arg_63_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story then
				arg_63_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_66_15 = 0
			local var_66_16 = 0.125

			if var_66_15 < arg_63_1.time_ and arg_63_1.time_ <= var_66_15 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_17 = arg_63_1:FormatText(StoryNameCfg[471].name)

				arg_63_1.leftNameTxt_.text = var_66_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_18 = arg_63_1:GetWordFromCfg(411021015)
				local var_66_19 = arg_63_1:FormatText(var_66_18.content)

				arg_63_1.text_.text = var_66_19

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_20 = 5
				local var_66_21 = utf8.len(var_66_19)
				local var_66_22 = var_66_20 <= 0 and var_66_16 or var_66_16 * (var_66_21 / var_66_20)

				if var_66_22 > 0 and var_66_16 < var_66_22 then
					arg_63_1.talkMaxDuration = var_66_22

					if var_66_22 + var_66_15 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_22 + var_66_15
					end
				end

				arg_63_1.text_.text = var_66_19
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021015", "story_v_out_411021.awb") ~= 0 then
					local var_66_23 = manager.audio:GetVoiceLength("story_v_out_411021", "411021015", "story_v_out_411021.awb") / 1000

					if var_66_23 + var_66_15 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_23 + var_66_15
					end

					if var_66_18.prefab_name ~= "" and arg_63_1.actors_[var_66_18.prefab_name] ~= nil then
						local var_66_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_18.prefab_name].transform, "story_v_out_411021", "411021015", "story_v_out_411021.awb")

						arg_63_1:RecordAudio("411021015", var_66_24)
						arg_63_1:RecordAudio("411021015", var_66_24)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_411021", "411021015", "story_v_out_411021.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_411021", "411021015", "story_v_out_411021.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_25 = math.max(var_66_16, arg_63_1.talkMaxDuration)

			if var_66_15 <= arg_63_1.time_ and arg_63_1.time_ < var_66_15 + var_66_25 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_15) / var_66_25

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_15 + var_66_25 and arg_63_1.time_ < var_66_15 + var_66_25 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play411021016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 411021016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play411021017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1095ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story == nil then
				arg_67_1.var_.characterEffect1095ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1095ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1095ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1095ui_story.fillRatio = var_70_5
			end

			local var_70_6 = arg_67_1.actors_["1095ui_story"].transform
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 then
				arg_67_1.var_.moveOldPos1095ui_story = var_70_6.localPosition
			end

			local var_70_8 = 0.001

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_8 then
				local var_70_9 = (arg_67_1.time_ - var_70_7) / var_70_8
				local var_70_10 = Vector3.New(0, 100, 0)

				var_70_6.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1095ui_story, var_70_10, var_70_9)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_6.position

				var_70_6.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_6.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_6.localEulerAngles = var_70_12
			end

			if arg_67_1.time_ >= var_70_7 + var_70_8 and arg_67_1.time_ < var_70_7 + var_70_8 + arg_70_0 then
				var_70_6.localPosition = Vector3.New(0, 100, 0)

				local var_70_13 = manager.ui.mainCamera.transform.position - var_70_6.position

				var_70_6.forward = Vector3.New(var_70_13.x, var_70_13.y, var_70_13.z)

				local var_70_14 = var_70_6.localEulerAngles

				var_70_14.z = 0
				var_70_14.x = 0
				var_70_6.localEulerAngles = var_70_14
			end

			local var_70_15 = 0
			local var_70_16 = 0.975

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_17 = arg_67_1:GetWordFromCfg(411021016)
				local var_70_18 = arg_67_1:FormatText(var_70_17.content)

				arg_67_1.text_.text = var_70_18

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_19 = 40
				local var_70_20 = utf8.len(var_70_18)
				local var_70_21 = var_70_19 <= 0 and var_70_16 or var_70_16 * (var_70_20 / var_70_19)

				if var_70_21 > 0 and var_70_16 < var_70_21 then
					arg_67_1.talkMaxDuration = var_70_21

					if var_70_21 + var_70_15 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_15
					end
				end

				arg_67_1.text_.text = var_70_18
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_22 = math.max(var_70_16, arg_67_1.talkMaxDuration)

			if var_70_15 <= arg_67_1.time_ and arg_67_1.time_ < var_70_15 + var_70_22 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_15) / var_70_22

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_15 + var_70_22 and arg_67_1.time_ < var_70_15 + var_70_22 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play411021017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 411021017
		arg_71_1.duration_ = 4.966

		local var_71_0 = {
			zh = 3.566,
			ja = 4.966
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
				arg_71_0:Play411021018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = "10071ui_story"

			if arg_71_1.actors_[var_74_0] == nil then
				local var_74_1 = Object.Instantiate(Asset.Load("Char/" .. var_74_0), arg_71_1.stage_.transform)

				var_74_1.name = var_74_0
				var_74_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.actors_[var_74_0] = var_74_1

				local var_74_2 = var_74_1:GetComponentInChildren(typeof(CharacterEffect))

				var_74_2.enabled = true

				local var_74_3 = GameObjectTools.GetOrAddComponent(var_74_1, typeof(DynamicBoneHelper))

				if var_74_3 then
					var_74_3:EnableDynamicBone(false)
				end

				arg_71_1:ShowWeapon(var_74_2.transform, false)

				arg_71_1.var_[var_74_0 .. "Animator"] = var_74_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_71_1.var_[var_74_0 .. "Animator"].applyRootMotion = true
				arg_71_1.var_[var_74_0 .. "LipSync"] = var_74_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_74_4 = arg_71_1.actors_["10071ui_story"].transform
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1.var_.moveOldPos10071ui_story = var_74_4.localPosition
			end

			local var_74_6 = 0.001

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6
				local var_74_8 = Vector3.New(0.7, -0.9, -6.26)

				var_74_4.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10071ui_story, var_74_8, var_74_7)

				local var_74_9 = manager.ui.mainCamera.transform.position - var_74_4.position

				var_74_4.forward = Vector3.New(var_74_9.x, var_74_9.y, var_74_9.z)

				local var_74_10 = var_74_4.localEulerAngles

				var_74_10.z = 0
				var_74_10.x = 0
				var_74_4.localEulerAngles = var_74_10
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 then
				var_74_4.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_74_11 = manager.ui.mainCamera.transform.position - var_74_4.position

				var_74_4.forward = Vector3.New(var_74_11.x, var_74_11.y, var_74_11.z)

				local var_74_12 = var_74_4.localEulerAngles

				var_74_12.z = 0
				var_74_12.x = 0
				var_74_4.localEulerAngles = var_74_12
			end

			local var_74_13 = arg_71_1.actors_["10071ui_story"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 and arg_71_1.var_.characterEffect10071ui_story == nil then
				arg_71_1.var_.characterEffect10071ui_story = var_74_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_15 = 0.200000002980232

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_15 then
				local var_74_16 = (arg_71_1.time_ - var_74_14) / var_74_15

				if arg_71_1.var_.characterEffect10071ui_story then
					arg_71_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 and arg_71_1.var_.characterEffect10071ui_story then
				arg_71_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_74_17 = 0

			if var_74_17 < arg_71_1.time_ and arg_71_1.time_ <= var_74_17 + arg_74_0 then
				arg_71_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action2_2")
			end

			local var_74_18 = 0

			if var_74_18 < arg_71_1.time_ and arg_71_1.time_ <= var_74_18 + arg_74_0 then
				arg_71_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_19 = arg_71_1.actors_["1095ui_story"].transform
			local var_74_20 = 0

			if var_74_20 < arg_71_1.time_ and arg_71_1.time_ <= var_74_20 + arg_74_0 then
				arg_71_1.var_.moveOldPos1095ui_story = var_74_19.localPosition
			end

			local var_74_21 = 0.001

			if var_74_20 <= arg_71_1.time_ and arg_71_1.time_ < var_74_20 + var_74_21 then
				local var_74_22 = (arg_71_1.time_ - var_74_20) / var_74_21
				local var_74_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_74_19.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1095ui_story, var_74_23, var_74_22)

				local var_74_24 = manager.ui.mainCamera.transform.position - var_74_19.position

				var_74_19.forward = Vector3.New(var_74_24.x, var_74_24.y, var_74_24.z)

				local var_74_25 = var_74_19.localEulerAngles

				var_74_25.z = 0
				var_74_25.x = 0
				var_74_19.localEulerAngles = var_74_25
			end

			if arg_71_1.time_ >= var_74_20 + var_74_21 and arg_71_1.time_ < var_74_20 + var_74_21 + arg_74_0 then
				var_74_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_74_26 = manager.ui.mainCamera.transform.position - var_74_19.position

				var_74_19.forward = Vector3.New(var_74_26.x, var_74_26.y, var_74_26.z)

				local var_74_27 = var_74_19.localEulerAngles

				var_74_27.z = 0
				var_74_27.x = 0
				var_74_19.localEulerAngles = var_74_27
			end

			local var_74_28 = arg_71_1.actors_["1095ui_story"]
			local var_74_29 = 0

			if var_74_29 < arg_71_1.time_ and arg_71_1.time_ <= var_74_29 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story == nil then
				arg_71_1.var_.characterEffect1095ui_story = var_74_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_30 = 0.200000002980232

			if var_74_29 <= arg_71_1.time_ and arg_71_1.time_ < var_74_29 + var_74_30 then
				local var_74_31 = (arg_71_1.time_ - var_74_29) / var_74_30

				if arg_71_1.var_.characterEffect1095ui_story then
					local var_74_32 = Mathf.Lerp(0, 0.5, var_74_31)

					arg_71_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1095ui_story.fillRatio = var_74_32
				end
			end

			if arg_71_1.time_ >= var_74_29 + var_74_30 and arg_71_1.time_ < var_74_29 + var_74_30 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story then
				local var_74_33 = 0.5

				arg_71_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1095ui_story.fillRatio = var_74_33
			end

			local var_74_34 = 0
			local var_74_35 = 0.225

			if var_74_34 < arg_71_1.time_ and arg_71_1.time_ <= var_74_34 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_36 = arg_71_1:FormatText(StoryNameCfg[670].name)

				arg_71_1.leftNameTxt_.text = var_74_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_37 = arg_71_1:GetWordFromCfg(411021017)
				local var_74_38 = arg_71_1:FormatText(var_74_37.content)

				arg_71_1.text_.text = var_74_38

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_39 = 9
				local var_74_40 = utf8.len(var_74_38)
				local var_74_41 = var_74_39 <= 0 and var_74_35 or var_74_35 * (var_74_40 / var_74_39)

				if var_74_41 > 0 and var_74_35 < var_74_41 then
					arg_71_1.talkMaxDuration = var_74_41

					if var_74_41 + var_74_34 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_41 + var_74_34
					end
				end

				arg_71_1.text_.text = var_74_38
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021017", "story_v_out_411021.awb") ~= 0 then
					local var_74_42 = manager.audio:GetVoiceLength("story_v_out_411021", "411021017", "story_v_out_411021.awb") / 1000

					if var_74_42 + var_74_34 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_42 + var_74_34
					end

					if var_74_37.prefab_name ~= "" and arg_71_1.actors_[var_74_37.prefab_name] ~= nil then
						local var_74_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_37.prefab_name].transform, "story_v_out_411021", "411021017", "story_v_out_411021.awb")

						arg_71_1:RecordAudio("411021017", var_74_43)
						arg_71_1:RecordAudio("411021017", var_74_43)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_411021", "411021017", "story_v_out_411021.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_411021", "411021017", "story_v_out_411021.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_44 = math.max(var_74_35, arg_71_1.talkMaxDuration)

			if var_74_34 <= arg_71_1.time_ and arg_71_1.time_ < var_74_34 + var_74_44 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_34) / var_74_44

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_34 + var_74_44 and arg_71_1.time_ < var_74_34 + var_74_44 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play411021018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 411021018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play411021019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10071ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect10071ui_story == nil then
				arg_75_1.var_.characterEffect10071ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect10071ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_75_1.var_.characterEffect10071ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect10071ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_75_1.var_.characterEffect10071ui_story.fillRatio = var_78_5
			end

			local var_78_6 = 0
			local var_78_7 = 0.325

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_8 = arg_75_1:GetWordFromCfg(411021018)
				local var_78_9 = arg_75_1:FormatText(var_78_8.content)

				arg_75_1.text_.text = var_78_9

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_10 = 13
				local var_78_11 = utf8.len(var_78_9)
				local var_78_12 = var_78_10 <= 0 and var_78_7 or var_78_7 * (var_78_11 / var_78_10)

				if var_78_12 > 0 and var_78_7 < var_78_12 then
					arg_75_1.talkMaxDuration = var_78_12

					if var_78_12 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_12 + var_78_6
					end
				end

				arg_75_1.text_.text = var_78_9
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_13 = math.max(var_78_7, arg_75_1.talkMaxDuration)

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_13 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_6) / var_78_13

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_6 + var_78_13 and arg_75_1.time_ < var_78_6 + var_78_13 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play411021019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 411021019
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play411021020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_82_2 = 0
			local var_82_3 = 0.75

			if var_82_2 < arg_79_1.time_ and arg_79_1.time_ <= var_82_2 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_4 = arg_79_1:GetWordFromCfg(411021019)
				local var_82_5 = arg_79_1:FormatText(var_82_4.content)

				arg_79_1.text_.text = var_82_5

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_6 = 30
				local var_82_7 = utf8.len(var_82_5)
				local var_82_8 = var_82_6 <= 0 and var_82_3 or var_82_3 * (var_82_7 / var_82_6)

				if var_82_8 > 0 and var_82_3 < var_82_8 then
					arg_79_1.talkMaxDuration = var_82_8

					if var_82_8 + var_82_2 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_2
					end
				end

				arg_79_1.text_.text = var_82_5
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_9 = math.max(var_82_3, arg_79_1.talkMaxDuration)

			if var_82_2 <= arg_79_1.time_ and arg_79_1.time_ < var_82_2 + var_82_9 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_2) / var_82_9

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_2 + var_82_9 and arg_79_1.time_ < var_82_2 + var_82_9 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play411021020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 411021020
		arg_83_1.duration_ = 6

		local var_83_0 = {
			zh = 5.933,
			ja = 6
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
				arg_83_0:Play411021021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1095ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1095ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1095ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1095ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story == nil then
				arg_83_1.var_.characterEffect1095ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1095ui_story then
					arg_83_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story then
				arg_83_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095actionlink/1095action463")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_15 = 0
			local var_86_16 = 0.7

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[471].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(411021020)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 28
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021020", "story_v_out_411021.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_411021", "411021020", "story_v_out_411021.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_411021", "411021020", "story_v_out_411021.awb")

						arg_83_1:RecordAudio("411021020", var_86_24)
						arg_83_1:RecordAudio("411021020", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_411021", "411021020", "story_v_out_411021.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_411021", "411021020", "story_v_out_411021.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play411021021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 411021021
		arg_87_1.duration_ = 8.9

		local var_87_0 = {
			zh = 8.9,
			ja = 6.366
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
				arg_87_0:Play411021022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10071ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10071ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0.7, -0.9, -6.26)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10071ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["10071ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect10071ui_story == nil then
				arg_87_1.var_.characterEffect10071ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect10071ui_story then
					arg_87_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect10071ui_story then
				arg_87_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_1")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_15 = arg_87_1.actors_["1095ui_story"]
			local var_90_16 = 0

			if var_90_16 < arg_87_1.time_ and arg_87_1.time_ <= var_90_16 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story == nil then
				arg_87_1.var_.characterEffect1095ui_story = var_90_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_17 = 0.200000002980232

			if var_90_16 <= arg_87_1.time_ and arg_87_1.time_ < var_90_16 + var_90_17 then
				local var_90_18 = (arg_87_1.time_ - var_90_16) / var_90_17

				if arg_87_1.var_.characterEffect1095ui_story then
					local var_90_19 = Mathf.Lerp(0, 0.5, var_90_18)

					arg_87_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1095ui_story.fillRatio = var_90_19
				end
			end

			if arg_87_1.time_ >= var_90_16 + var_90_17 and arg_87_1.time_ < var_90_16 + var_90_17 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story then
				local var_90_20 = 0.5

				arg_87_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1095ui_story.fillRatio = var_90_20
			end

			local var_90_21 = 0
			local var_90_22 = 0.825

			if var_90_21 < arg_87_1.time_ and arg_87_1.time_ <= var_90_21 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_23 = arg_87_1:FormatText(StoryNameCfg[670].name)

				arg_87_1.leftNameTxt_.text = var_90_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_24 = arg_87_1:GetWordFromCfg(411021021)
				local var_90_25 = arg_87_1:FormatText(var_90_24.content)

				arg_87_1.text_.text = var_90_25

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_26 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021021", "story_v_out_411021.awb") ~= 0 then
					local var_90_29 = manager.audio:GetVoiceLength("story_v_out_411021", "411021021", "story_v_out_411021.awb") / 1000

					if var_90_29 + var_90_21 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_29 + var_90_21
					end

					if var_90_24.prefab_name ~= "" and arg_87_1.actors_[var_90_24.prefab_name] ~= nil then
						local var_90_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_24.prefab_name].transform, "story_v_out_411021", "411021021", "story_v_out_411021.awb")

						arg_87_1:RecordAudio("411021021", var_90_30)
						arg_87_1:RecordAudio("411021021", var_90_30)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_411021", "411021021", "story_v_out_411021.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_411021", "411021021", "story_v_out_411021.awb")
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
	Play411021022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 411021022
		arg_91_1.duration_ = 10.8

		local var_91_0 = {
			zh = 10.6,
			ja = 10.8
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
				arg_91_0:Play411021023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action3_2")
			end

			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_94_2 = 0
			local var_94_3 = 1.025

			if var_94_2 < arg_91_1.time_ and arg_91_1.time_ <= var_94_2 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_4 = arg_91_1:FormatText(StoryNameCfg[670].name)

				arg_91_1.leftNameTxt_.text = var_94_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_5 = arg_91_1:GetWordFromCfg(411021022)
				local var_94_6 = arg_91_1:FormatText(var_94_5.content)

				arg_91_1.text_.text = var_94_6

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_7 = 41
				local var_94_8 = utf8.len(var_94_6)
				local var_94_9 = var_94_7 <= 0 and var_94_3 or var_94_3 * (var_94_8 / var_94_7)

				if var_94_9 > 0 and var_94_3 < var_94_9 then
					arg_91_1.talkMaxDuration = var_94_9

					if var_94_9 + var_94_2 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_9 + var_94_2
					end
				end

				arg_91_1.text_.text = var_94_6
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021022", "story_v_out_411021.awb") ~= 0 then
					local var_94_10 = manager.audio:GetVoiceLength("story_v_out_411021", "411021022", "story_v_out_411021.awb") / 1000

					if var_94_10 + var_94_2 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_10 + var_94_2
					end

					if var_94_5.prefab_name ~= "" and arg_91_1.actors_[var_94_5.prefab_name] ~= nil then
						local var_94_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_5.prefab_name].transform, "story_v_out_411021", "411021022", "story_v_out_411021.awb")

						arg_91_1:RecordAudio("411021022", var_94_11)
						arg_91_1:RecordAudio("411021022", var_94_11)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_411021", "411021022", "story_v_out_411021.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_411021", "411021022", "story_v_out_411021.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_12 = math.max(var_94_3, arg_91_1.talkMaxDuration)

			if var_94_2 <= arg_91_1.time_ and arg_91_1.time_ < var_94_2 + var_94_12 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_2) / var_94_12

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_2 + var_94_12 and arg_91_1.time_ < var_94_2 + var_94_12 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play411021023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 411021023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play411021024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10071ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect10071ui_story == nil then
				arg_95_1.var_.characterEffect10071ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect10071ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10071ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect10071ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10071ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.675

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_8 = arg_95_1:GetWordFromCfg(411021023)
				local var_98_9 = arg_95_1:FormatText(var_98_8.content)

				arg_95_1.text_.text = var_98_9

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_10 = 27
				local var_98_11 = utf8.len(var_98_9)
				local var_98_12 = var_98_10 <= 0 and var_98_7 or var_98_7 * (var_98_11 / var_98_10)

				if var_98_12 > 0 and var_98_7 < var_98_12 then
					arg_95_1.talkMaxDuration = var_98_12

					if var_98_12 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_12 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_9
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_13 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_13 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_13

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_13 and arg_95_1.time_ < var_98_6 + var_98_13 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play411021024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 411021024
		arg_99_1.duration_ = 4.5

		local var_99_0 = {
			zh = 3.4,
			ja = 4.5
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
				arg_99_0:Play411021025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1095ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1095ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1095ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1095ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and arg_99_1.var_.characterEffect1095ui_story == nil then
				arg_99_1.var_.characterEffect1095ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1095ui_story then
					arg_99_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and arg_99_1.var_.characterEffect1095ui_story then
				arg_99_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.375

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[471].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(411021024)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021024", "story_v_out_411021.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_out_411021", "411021024", "story_v_out_411021.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_out_411021", "411021024", "story_v_out_411021.awb")

						arg_99_1:RecordAudio("411021024", var_102_24)
						arg_99_1:RecordAudio("411021024", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_411021", "411021024", "story_v_out_411021.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_411021", "411021024", "story_v_out_411021.awb")
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
	Play411021025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 411021025
		arg_103_1.duration_ = 6.133

		local var_103_0 = {
			zh = 3.766,
			ja = 6.133
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
				arg_103_0:Play411021026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10071ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10071ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -0.9, -6.26)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10071ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["10071ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect10071ui_story == nil then
				arg_103_1.var_.characterEffect10071ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect10071ui_story then
					arg_103_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect10071ui_story then
				arg_103_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action2_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_106_15 = arg_103_1.actors_["1095ui_story"]
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 and arg_103_1.var_.characterEffect1095ui_story == nil then
				arg_103_1.var_.characterEffect1095ui_story = var_106_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_17 = 0.200000002980232

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17

				if arg_103_1.var_.characterEffect1095ui_story then
					local var_106_19 = Mathf.Lerp(0, 0.5, var_106_18)

					arg_103_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1095ui_story.fillRatio = var_106_19
				end
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 and arg_103_1.var_.characterEffect1095ui_story then
				local var_106_20 = 0.5

				arg_103_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1095ui_story.fillRatio = var_106_20
			end

			local var_106_21 = 0
			local var_106_22 = 0.225

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_23 = arg_103_1:FormatText(StoryNameCfg[670].name)

				arg_103_1.leftNameTxt_.text = var_106_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_24 = arg_103_1:GetWordFromCfg(411021025)
				local var_106_25 = arg_103_1:FormatText(var_106_24.content)

				arg_103_1.text_.text = var_106_25

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_26 = 9
				local var_106_27 = utf8.len(var_106_25)
				local var_106_28 = var_106_26 <= 0 and var_106_22 or var_106_22 * (var_106_27 / var_106_26)

				if var_106_28 > 0 and var_106_22 < var_106_28 then
					arg_103_1.talkMaxDuration = var_106_28

					if var_106_28 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_28 + var_106_21
					end
				end

				arg_103_1.text_.text = var_106_25
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021025", "story_v_out_411021.awb") ~= 0 then
					local var_106_29 = manager.audio:GetVoiceLength("story_v_out_411021", "411021025", "story_v_out_411021.awb") / 1000

					if var_106_29 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_29 + var_106_21
					end

					if var_106_24.prefab_name ~= "" and arg_103_1.actors_[var_106_24.prefab_name] ~= nil then
						local var_106_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_24.prefab_name].transform, "story_v_out_411021", "411021025", "story_v_out_411021.awb")

						arg_103_1:RecordAudio("411021025", var_106_30)
						arg_103_1:RecordAudio("411021025", var_106_30)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_411021", "411021025", "story_v_out_411021.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_411021", "411021025", "story_v_out_411021.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_31 = math.max(var_106_22, arg_103_1.talkMaxDuration)

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_31 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_21) / var_106_31

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_21 + var_106_31 and arg_103_1.time_ < var_106_21 + var_106_31 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play411021026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 411021026
		arg_107_1.duration_ = 7.933

		local var_107_0 = {
			zh = 3.666,
			ja = 7.933
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
				arg_107_0:Play411021027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_110_1 = arg_107_1.actors_["10071ui_story"]
			local var_110_2 = 0

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect10071ui_story == nil then
				arg_107_1.var_.characterEffect10071ui_story = var_110_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_3 = 0.200000002980232

			if var_110_2 <= arg_107_1.time_ and arg_107_1.time_ < var_110_2 + var_110_3 then
				local var_110_4 = (arg_107_1.time_ - var_110_2) / var_110_3

				if arg_107_1.var_.characterEffect10071ui_story then
					arg_107_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_2 + var_110_3 and arg_107_1.time_ < var_110_2 + var_110_3 + arg_110_0 and arg_107_1.var_.characterEffect10071ui_story then
				arg_107_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action2_2")
			end

			local var_110_6 = 0
			local var_110_7 = 0.275

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[670].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(411021026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021026", "story_v_out_411021.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_411021", "411021026", "story_v_out_411021.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_411021", "411021026", "story_v_out_411021.awb")

						arg_107_1:RecordAudio("411021026", var_110_15)
						arg_107_1:RecordAudio("411021026", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_411021", "411021026", "story_v_out_411021.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_411021", "411021026", "story_v_out_411021.awb")
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
	Play411021027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 411021027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play411021028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10071ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect10071ui_story == nil then
				arg_111_1.var_.characterEffect10071ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect10071ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_111_1.var_.characterEffect10071ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect10071ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_111_1.var_.characterEffect10071ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.45

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_8 = arg_111_1:GetWordFromCfg(411021027)
				local var_114_9 = arg_111_1:FormatText(var_114_8.content)

				arg_111_1.text_.text = var_114_9

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_10 = 18
				local var_114_11 = utf8.len(var_114_9)
				local var_114_12 = var_114_10 <= 0 and var_114_7 or var_114_7 * (var_114_11 / var_114_10)

				if var_114_12 > 0 and var_114_7 < var_114_12 then
					arg_111_1.talkMaxDuration = var_114_12

					if var_114_12 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_12 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_9
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_13 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_13 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_13

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_13 and arg_111_1.time_ < var_114_6 + var_114_13 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play411021028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 411021028
		arg_115_1.duration_ = 3.6

		local var_115_0 = {
			zh = 3.6,
			ja = 3.5
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
				arg_115_0:Play411021029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10071ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos10071ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0.7, -0.9, -6.26)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10071ui_story, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = arg_115_1.actors_["10071ui_story"]
			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect10071ui_story == nil then
				arg_115_1.var_.characterEffect10071ui_story = var_118_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_11 = 0.200000002980232

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_10) / var_118_11

				if arg_115_1.var_.characterEffect10071ui_story then
					arg_115_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_10 + var_118_11 and arg_115_1.time_ < var_118_10 + var_118_11 + arg_118_0 and arg_115_1.var_.characterEffect10071ui_story then
				arg_115_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_118_14 = 0
			local var_118_15 = 0.45

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_16 = arg_115_1:FormatText(StoryNameCfg[670].name)

				arg_115_1.leftNameTxt_.text = var_118_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_17 = arg_115_1:GetWordFromCfg(411021028)
				local var_118_18 = arg_115_1:FormatText(var_118_17.content)

				arg_115_1.text_.text = var_118_18

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_19 = 18
				local var_118_20 = utf8.len(var_118_18)
				local var_118_21 = var_118_19 <= 0 and var_118_15 or var_118_15 * (var_118_20 / var_118_19)

				if var_118_21 > 0 and var_118_15 < var_118_21 then
					arg_115_1.talkMaxDuration = var_118_21

					if var_118_21 + var_118_14 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_21 + var_118_14
					end
				end

				arg_115_1.text_.text = var_118_18
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021028", "story_v_out_411021.awb") ~= 0 then
					local var_118_22 = manager.audio:GetVoiceLength("story_v_out_411021", "411021028", "story_v_out_411021.awb") / 1000

					if var_118_22 + var_118_14 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_22 + var_118_14
					end

					if var_118_17.prefab_name ~= "" and arg_115_1.actors_[var_118_17.prefab_name] ~= nil then
						local var_118_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_17.prefab_name].transform, "story_v_out_411021", "411021028", "story_v_out_411021.awb")

						arg_115_1:RecordAudio("411021028", var_118_23)
						arg_115_1:RecordAudio("411021028", var_118_23)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_411021", "411021028", "story_v_out_411021.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_411021", "411021028", "story_v_out_411021.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_24 = math.max(var_118_15, arg_115_1.talkMaxDuration)

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_24 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_14) / var_118_24

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_14 + var_118_24 and arg_115_1.time_ < var_118_14 + var_118_24 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play411021029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 411021029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play411021030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10071ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect10071ui_story == nil then
				arg_119_1.var_.characterEffect10071ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect10071ui_story then
					local var_122_4 = Mathf.Lerp(0, 0.5, var_122_3)

					arg_119_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_119_1.var_.characterEffect10071ui_story.fillRatio = var_122_4
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect10071ui_story then
				local var_122_5 = 0.5

				arg_119_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_119_1.var_.characterEffect10071ui_story.fillRatio = var_122_5
			end

			local var_122_6 = 0
			local var_122_7 = 0.975

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_8 = arg_119_1:GetWordFromCfg(411021029)
				local var_122_9 = arg_119_1:FormatText(var_122_8.content)

				arg_119_1.text_.text = var_122_9

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_10 = 39
				local var_122_11 = utf8.len(var_122_9)
				local var_122_12 = var_122_10 <= 0 and var_122_7 or var_122_7 * (var_122_11 / var_122_10)

				if var_122_12 > 0 and var_122_7 < var_122_12 then
					arg_119_1.talkMaxDuration = var_122_12

					if var_122_12 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_12 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_9
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_13 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_13 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_13

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_13 and arg_119_1.time_ < var_122_6 + var_122_13 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play411021030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 411021030
		arg_123_1.duration_ = 7.466

		local var_123_0 = {
			zh = 7.466,
			ja = 4.366
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
				arg_123_0:Play411021031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10071ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect10071ui_story == nil then
				arg_123_1.var_.characterEffect10071ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect10071ui_story then
					arg_123_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect10071ui_story then
				arg_123_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_126_4 = 0
			local var_126_5 = 0.35

			if var_126_4 < arg_123_1.time_ and arg_123_1.time_ <= var_126_4 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_6 = arg_123_1:FormatText(StoryNameCfg[670].name)

				arg_123_1.leftNameTxt_.text = var_126_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_7 = arg_123_1:GetWordFromCfg(411021030)
				local var_126_8 = arg_123_1:FormatText(var_126_7.content)

				arg_123_1.text_.text = var_126_8

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_9 = 14
				local var_126_10 = utf8.len(var_126_8)
				local var_126_11 = var_126_9 <= 0 and var_126_5 or var_126_5 * (var_126_10 / var_126_9)

				if var_126_11 > 0 and var_126_5 < var_126_11 then
					arg_123_1.talkMaxDuration = var_126_11

					if var_126_11 + var_126_4 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_11 + var_126_4
					end
				end

				arg_123_1.text_.text = var_126_8
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021030", "story_v_out_411021.awb") ~= 0 then
					local var_126_12 = manager.audio:GetVoiceLength("story_v_out_411021", "411021030", "story_v_out_411021.awb") / 1000

					if var_126_12 + var_126_4 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_12 + var_126_4
					end

					if var_126_7.prefab_name ~= "" and arg_123_1.actors_[var_126_7.prefab_name] ~= nil then
						local var_126_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_7.prefab_name].transform, "story_v_out_411021", "411021030", "story_v_out_411021.awb")

						arg_123_1:RecordAudio("411021030", var_126_13)
						arg_123_1:RecordAudio("411021030", var_126_13)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_411021", "411021030", "story_v_out_411021.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_411021", "411021030", "story_v_out_411021.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_14 = math.max(var_126_5, arg_123_1.talkMaxDuration)

			if var_126_4 <= arg_123_1.time_ and arg_123_1.time_ < var_126_4 + var_126_14 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_4) / var_126_14

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_4 + var_126_14 and arg_123_1.time_ < var_126_4 + var_126_14 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play411021031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 411021031
		arg_127_1.duration_ = 1.999999999999

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play411021032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1095ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1095ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1095ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1095ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1095ui_story == nil then
				arg_127_1.var_.characterEffect1095ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1095ui_story then
					arg_127_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1095ui_story then
				arg_127_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_130_14 = arg_127_1.actors_["10071ui_story"]
			local var_130_15 = 0

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 and arg_127_1.var_.characterEffect10071ui_story == nil then
				arg_127_1.var_.characterEffect10071ui_story = var_130_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_16 = 0.200000002980232

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_16 then
				local var_130_17 = (arg_127_1.time_ - var_130_15) / var_130_16

				if arg_127_1.var_.characterEffect10071ui_story then
					local var_130_18 = Mathf.Lerp(0, 0.5, var_130_17)

					arg_127_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_127_1.var_.characterEffect10071ui_story.fillRatio = var_130_18
				end
			end

			if arg_127_1.time_ >= var_130_15 + var_130_16 and arg_127_1.time_ < var_130_15 + var_130_16 + arg_130_0 and arg_127_1.var_.characterEffect10071ui_story then
				local var_130_19 = 0.5

				arg_127_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_127_1.var_.characterEffect10071ui_story.fillRatio = var_130_19
			end

			local var_130_20 = 0
			local var_130_21 = 0.1

			if var_130_20 < arg_127_1.time_ and arg_127_1.time_ <= var_130_20 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_22 = arg_127_1:FormatText(StoryNameCfg[471].name)

				arg_127_1.leftNameTxt_.text = var_130_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_23 = arg_127_1:GetWordFromCfg(411021031)
				local var_130_24 = arg_127_1:FormatText(var_130_23.content)

				arg_127_1.text_.text = var_130_24

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_25 = 4
				local var_130_26 = utf8.len(var_130_24)
				local var_130_27 = var_130_25 <= 0 and var_130_21 or var_130_21 * (var_130_26 / var_130_25)

				if var_130_27 > 0 and var_130_21 < var_130_27 then
					arg_127_1.talkMaxDuration = var_130_27

					if var_130_27 + var_130_20 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_27 + var_130_20
					end
				end

				arg_127_1.text_.text = var_130_24
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021031", "story_v_out_411021.awb") ~= 0 then
					local var_130_28 = manager.audio:GetVoiceLength("story_v_out_411021", "411021031", "story_v_out_411021.awb") / 1000

					if var_130_28 + var_130_20 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_28 + var_130_20
					end

					if var_130_23.prefab_name ~= "" and arg_127_1.actors_[var_130_23.prefab_name] ~= nil then
						local var_130_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_23.prefab_name].transform, "story_v_out_411021", "411021031", "story_v_out_411021.awb")

						arg_127_1:RecordAudio("411021031", var_130_29)
						arg_127_1:RecordAudio("411021031", var_130_29)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_411021", "411021031", "story_v_out_411021.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_411021", "411021031", "story_v_out_411021.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_30 = math.max(var_130_21, arg_127_1.talkMaxDuration)

			if var_130_20 <= arg_127_1.time_ and arg_127_1.time_ < var_130_20 + var_130_30 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_20) / var_130_30

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_20 + var_130_30 and arg_127_1.time_ < var_130_20 + var_130_30 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play411021032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 411021032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play411021033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1095ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1095ui_story == nil then
				arg_131_1.var_.characterEffect1095ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1095ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1095ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1095ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1095ui_story.fillRatio = var_134_5
			end

			local var_134_6 = arg_131_1.actors_["10071ui_story"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 and arg_131_1.var_.characterEffect10071ui_story == nil then
				arg_131_1.var_.characterEffect10071ui_story = var_134_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_8 = 0.200000002980232

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_8 then
				local var_134_9 = (arg_131_1.time_ - var_134_7) / var_134_8

				if arg_131_1.var_.characterEffect10071ui_story then
					local var_134_10 = Mathf.Lerp(0, 0.5, var_134_9)

					arg_131_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10071ui_story.fillRatio = var_134_10
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_8 and arg_131_1.time_ < var_134_7 + var_134_8 + arg_134_0 and arg_131_1.var_.characterEffect10071ui_story then
				local var_134_11 = 0.5

				arg_131_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10071ui_story.fillRatio = var_134_11
			end

			local var_134_12 = 0
			local var_134_13 = 1.125

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_14 = arg_131_1:GetWordFromCfg(411021032)
				local var_134_15 = arg_131_1:FormatText(var_134_14.content)

				arg_131_1.text_.text = var_134_15

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_16 = 45
				local var_134_17 = utf8.len(var_134_15)
				local var_134_18 = var_134_16 <= 0 and var_134_13 or var_134_13 * (var_134_17 / var_134_16)

				if var_134_18 > 0 and var_134_13 < var_134_18 then
					arg_131_1.talkMaxDuration = var_134_18

					if var_134_18 + var_134_12 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_18 + var_134_12
					end
				end

				arg_131_1.text_.text = var_134_15
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_19 = math.max(var_134_13, arg_131_1.talkMaxDuration)

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_19 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_12) / var_134_19

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_12 + var_134_19 and arg_131_1.time_ < var_134_12 + var_134_19 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play411021033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 411021033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play411021034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.825

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_2 = arg_135_1:GetWordFromCfg(411021033)
				local var_138_3 = arg_135_1:FormatText(var_138_2.content)

				arg_135_1.text_.text = var_138_3

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_4 = 33
				local var_138_5 = utf8.len(var_138_3)
				local var_138_6 = var_138_4 <= 0 and var_138_1 or var_138_1 * (var_138_5 / var_138_4)

				if var_138_6 > 0 and var_138_1 < var_138_6 then
					arg_135_1.talkMaxDuration = var_138_6

					if var_138_6 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_6 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_3
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_7 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_7 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_7

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_7 and arg_135_1.time_ < var_138_0 + var_138_7 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play411021034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 411021034
		arg_139_1.duration_ = 5.6

		local var_139_0 = {
			zh = 5.6,
			ja = 4.533
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
				arg_139_0:Play411021035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10071ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos10071ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0.7, -0.9, -6.26)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10071ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["10071ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect10071ui_story == nil then
				arg_139_1.var_.characterEffect10071ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect10071ui_story then
					arg_139_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect10071ui_story then
				arg_139_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action2_1")
			end

			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_142_15 = 0
			local var_142_16 = 0.325

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_17 = arg_139_1:FormatText(StoryNameCfg[670].name)

				arg_139_1.leftNameTxt_.text = var_142_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_18 = arg_139_1:GetWordFromCfg(411021034)
				local var_142_19 = arg_139_1:FormatText(var_142_18.content)

				arg_139_1.text_.text = var_142_19

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_20 = 13
				local var_142_21 = utf8.len(var_142_19)
				local var_142_22 = var_142_20 <= 0 and var_142_16 or var_142_16 * (var_142_21 / var_142_20)

				if var_142_22 > 0 and var_142_16 < var_142_22 then
					arg_139_1.talkMaxDuration = var_142_22

					if var_142_22 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_22 + var_142_15
					end
				end

				arg_139_1.text_.text = var_142_19
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021034", "story_v_out_411021.awb") ~= 0 then
					local var_142_23 = manager.audio:GetVoiceLength("story_v_out_411021", "411021034", "story_v_out_411021.awb") / 1000

					if var_142_23 + var_142_15 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_23 + var_142_15
					end

					if var_142_18.prefab_name ~= "" and arg_139_1.actors_[var_142_18.prefab_name] ~= nil then
						local var_142_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_18.prefab_name].transform, "story_v_out_411021", "411021034", "story_v_out_411021.awb")

						arg_139_1:RecordAudio("411021034", var_142_24)
						arg_139_1:RecordAudio("411021034", var_142_24)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_411021", "411021034", "story_v_out_411021.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_411021", "411021034", "story_v_out_411021.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_25 = math.max(var_142_16, arg_139_1.talkMaxDuration)

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_25 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_15) / var_142_25

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_15 + var_142_25 and arg_139_1.time_ < var_142_15 + var_142_25 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play411021035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 411021035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play411021036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10071ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect10071ui_story == nil then
				arg_143_1.var_.characterEffect10071ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect10071ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_143_1.var_.characterEffect10071ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect10071ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_143_1.var_.characterEffect10071ui_story.fillRatio = var_146_5
			end

			local var_146_6 = 0
			local var_146_7 = 0.65

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_8 = arg_143_1:GetWordFromCfg(411021035)
				local var_146_9 = arg_143_1:FormatText(var_146_8.content)

				arg_143_1.text_.text = var_146_9

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_10 = 26
				local var_146_11 = utf8.len(var_146_9)
				local var_146_12 = var_146_10 <= 0 and var_146_7 or var_146_7 * (var_146_11 / var_146_10)

				if var_146_12 > 0 and var_146_7 < var_146_12 then
					arg_143_1.talkMaxDuration = var_146_12

					if var_146_12 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_9
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_13 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_13 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_13

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_13 and arg_143_1.time_ < var_146_6 + var_146_13 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play411021036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 411021036
		arg_147_1.duration_ = 4.3

		local var_147_0 = {
			zh = 2.4,
			ja = 4.3
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
				arg_147_0:Play411021037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1095ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1095ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1095ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["1095ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story == nil then
				arg_147_1.var_.characterEffect1095ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect1095ui_story then
					arg_147_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect1095ui_story then
				arg_147_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_150_13 = 0

			if var_150_13 < arg_147_1.time_ and arg_147_1.time_ <= var_150_13 + arg_150_0 then
				arg_147_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_150_15 = 0
			local var_150_16 = 0.225

			if var_150_15 < arg_147_1.time_ and arg_147_1.time_ <= var_150_15 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_17 = arg_147_1:FormatText(StoryNameCfg[471].name)

				arg_147_1.leftNameTxt_.text = var_150_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_18 = arg_147_1:GetWordFromCfg(411021036)
				local var_150_19 = arg_147_1:FormatText(var_150_18.content)

				arg_147_1.text_.text = var_150_19

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_20 = 9
				local var_150_21 = utf8.len(var_150_19)
				local var_150_22 = var_150_20 <= 0 and var_150_16 or var_150_16 * (var_150_21 / var_150_20)

				if var_150_22 > 0 and var_150_16 < var_150_22 then
					arg_147_1.talkMaxDuration = var_150_22

					if var_150_22 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_22 + var_150_15
					end
				end

				arg_147_1.text_.text = var_150_19
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021036", "story_v_out_411021.awb") ~= 0 then
					local var_150_23 = manager.audio:GetVoiceLength("story_v_out_411021", "411021036", "story_v_out_411021.awb") / 1000

					if var_150_23 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_23 + var_150_15
					end

					if var_150_18.prefab_name ~= "" and arg_147_1.actors_[var_150_18.prefab_name] ~= nil then
						local var_150_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_18.prefab_name].transform, "story_v_out_411021", "411021036", "story_v_out_411021.awb")

						arg_147_1:RecordAudio("411021036", var_150_24)
						arg_147_1:RecordAudio("411021036", var_150_24)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_411021", "411021036", "story_v_out_411021.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_411021", "411021036", "story_v_out_411021.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_25 = math.max(var_150_16, arg_147_1.talkMaxDuration)

			if var_150_15 <= arg_147_1.time_ and arg_147_1.time_ < var_150_15 + var_150_25 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_15) / var_150_25

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_15 + var_150_25 and arg_147_1.time_ < var_150_15 + var_150_25 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play411021037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 411021037
		arg_151_1.duration_ = 3.7

		local var_151_0 = {
			zh = 3.7,
			ja = 2.166
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
				arg_151_0:Play411021038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_154_2 = 0
			local var_154_3 = 0.4

			if var_154_2 < arg_151_1.time_ and arg_151_1.time_ <= var_154_2 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_4 = arg_151_1:FormatText(StoryNameCfg[471].name)

				arg_151_1.leftNameTxt_.text = var_154_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_5 = arg_151_1:GetWordFromCfg(411021037)
				local var_154_6 = arg_151_1:FormatText(var_154_5.content)

				arg_151_1.text_.text = var_154_6

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_7 = 16
				local var_154_8 = utf8.len(var_154_6)
				local var_154_9 = var_154_7 <= 0 and var_154_3 or var_154_3 * (var_154_8 / var_154_7)

				if var_154_9 > 0 and var_154_3 < var_154_9 then
					arg_151_1.talkMaxDuration = var_154_9

					if var_154_9 + var_154_2 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_9 + var_154_2
					end
				end

				arg_151_1.text_.text = var_154_6
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021037", "story_v_out_411021.awb") ~= 0 then
					local var_154_10 = manager.audio:GetVoiceLength("story_v_out_411021", "411021037", "story_v_out_411021.awb") / 1000

					if var_154_10 + var_154_2 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_10 + var_154_2
					end

					if var_154_5.prefab_name ~= "" and arg_151_1.actors_[var_154_5.prefab_name] ~= nil then
						local var_154_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_5.prefab_name].transform, "story_v_out_411021", "411021037", "story_v_out_411021.awb")

						arg_151_1:RecordAudio("411021037", var_154_11)
						arg_151_1:RecordAudio("411021037", var_154_11)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_411021", "411021037", "story_v_out_411021.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_411021", "411021037", "story_v_out_411021.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_12 = math.max(var_154_3, arg_151_1.talkMaxDuration)

			if var_154_2 <= arg_151_1.time_ and arg_151_1.time_ < var_154_2 + var_154_12 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_2) / var_154_12

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_2 + var_154_12 and arg_151_1.time_ < var_154_2 + var_154_12 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play411021038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 411021038
		arg_155_1.duration_ = 4.4

		local var_155_0 = {
			zh = 4.4,
			ja = 3.733
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
				arg_155_0:Play411021039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10071ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10071ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0.7, -0.9, -6.26)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10071ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["10071ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect10071ui_story == nil then
				arg_155_1.var_.characterEffect10071ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect10071ui_story then
					arg_155_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect10071ui_story then
				arg_155_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action2_2")
			end

			local var_158_14 = arg_155_1.actors_["1095ui_story"]
			local var_158_15 = 0

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 and arg_155_1.var_.characterEffect1095ui_story == nil then
				arg_155_1.var_.characterEffect1095ui_story = var_158_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_16 = 0.200000002980232

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_16 then
				local var_158_17 = (arg_155_1.time_ - var_158_15) / var_158_16

				if arg_155_1.var_.characterEffect1095ui_story then
					local var_158_18 = Mathf.Lerp(0, 0.5, var_158_17)

					arg_155_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1095ui_story.fillRatio = var_158_18
				end
			end

			if arg_155_1.time_ >= var_158_15 + var_158_16 and arg_155_1.time_ < var_158_15 + var_158_16 + arg_158_0 and arg_155_1.var_.characterEffect1095ui_story then
				local var_158_19 = 0.5

				arg_155_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1095ui_story.fillRatio = var_158_19
			end

			local var_158_20 = 0
			local var_158_21 = 0.25

			if var_158_20 < arg_155_1.time_ and arg_155_1.time_ <= var_158_20 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_22 = arg_155_1:FormatText(StoryNameCfg[670].name)

				arg_155_1.leftNameTxt_.text = var_158_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_23 = arg_155_1:GetWordFromCfg(411021038)
				local var_158_24 = arg_155_1:FormatText(var_158_23.content)

				arg_155_1.text_.text = var_158_24

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_25 = 10
				local var_158_26 = utf8.len(var_158_24)
				local var_158_27 = var_158_25 <= 0 and var_158_21 or var_158_21 * (var_158_26 / var_158_25)

				if var_158_27 > 0 and var_158_21 < var_158_27 then
					arg_155_1.talkMaxDuration = var_158_27

					if var_158_27 + var_158_20 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_27 + var_158_20
					end
				end

				arg_155_1.text_.text = var_158_24
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021038", "story_v_out_411021.awb") ~= 0 then
					local var_158_28 = manager.audio:GetVoiceLength("story_v_out_411021", "411021038", "story_v_out_411021.awb") / 1000

					if var_158_28 + var_158_20 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_28 + var_158_20
					end

					if var_158_23.prefab_name ~= "" and arg_155_1.actors_[var_158_23.prefab_name] ~= nil then
						local var_158_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_23.prefab_name].transform, "story_v_out_411021", "411021038", "story_v_out_411021.awb")

						arg_155_1:RecordAudio("411021038", var_158_29)
						arg_155_1:RecordAudio("411021038", var_158_29)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_411021", "411021038", "story_v_out_411021.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_411021", "411021038", "story_v_out_411021.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_30 = math.max(var_158_21, arg_155_1.talkMaxDuration)

			if var_158_20 <= arg_155_1.time_ and arg_155_1.time_ < var_158_20 + var_158_30 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_20) / var_158_30

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_20 + var_158_30 and arg_155_1.time_ < var_158_20 + var_158_30 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play411021039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 411021039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play411021040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10071ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect10071ui_story == nil then
				arg_159_1.var_.characterEffect10071ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect10071ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_159_1.var_.characterEffect10071ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect10071ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_159_1.var_.characterEffect10071ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.775

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_8 = arg_159_1:GetWordFromCfg(411021039)
				local var_162_9 = arg_159_1:FormatText(var_162_8.content)

				arg_159_1.text_.text = var_162_9

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_10 = 31
				local var_162_11 = utf8.len(var_162_9)
				local var_162_12 = var_162_10 <= 0 and var_162_7 or var_162_7 * (var_162_11 / var_162_10)

				if var_162_12 > 0 and var_162_7 < var_162_12 then
					arg_159_1.talkMaxDuration = var_162_12

					if var_162_12 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_12 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_9
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_13 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_13 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_13

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_13 and arg_159_1.time_ < var_162_6 + var_162_13 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play411021040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 411021040
		arg_163_1.duration_ = 7.6

		local var_163_0 = {
			zh = 3.866,
			ja = 7.6
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
				arg_163_0:Play411021041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1095ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1095ui_story == nil then
				arg_163_1.var_.characterEffect1095ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1095ui_story then
					arg_163_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1095ui_story then
				arg_163_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_166_4 = 0
			local var_166_5 = 0.425

			if var_166_4 < arg_163_1.time_ and arg_163_1.time_ <= var_166_4 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_6 = arg_163_1:FormatText(StoryNameCfg[471].name)

				arg_163_1.leftNameTxt_.text = var_166_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_7 = arg_163_1:GetWordFromCfg(411021040)
				local var_166_8 = arg_163_1:FormatText(var_166_7.content)

				arg_163_1.text_.text = var_166_8

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_9 = 17
				local var_166_10 = utf8.len(var_166_8)
				local var_166_11 = var_166_9 <= 0 and var_166_5 or var_166_5 * (var_166_10 / var_166_9)

				if var_166_11 > 0 and var_166_5 < var_166_11 then
					arg_163_1.talkMaxDuration = var_166_11

					if var_166_11 + var_166_4 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_11 + var_166_4
					end
				end

				arg_163_1.text_.text = var_166_8
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021040", "story_v_out_411021.awb") ~= 0 then
					local var_166_12 = manager.audio:GetVoiceLength("story_v_out_411021", "411021040", "story_v_out_411021.awb") / 1000

					if var_166_12 + var_166_4 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_12 + var_166_4
					end

					if var_166_7.prefab_name ~= "" and arg_163_1.actors_[var_166_7.prefab_name] ~= nil then
						local var_166_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_7.prefab_name].transform, "story_v_out_411021", "411021040", "story_v_out_411021.awb")

						arg_163_1:RecordAudio("411021040", var_166_13)
						arg_163_1:RecordAudio("411021040", var_166_13)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_411021", "411021040", "story_v_out_411021.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_411021", "411021040", "story_v_out_411021.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_14 = math.max(var_166_5, arg_163_1.talkMaxDuration)

			if var_166_4 <= arg_163_1.time_ and arg_163_1.time_ < var_166_4 + var_166_14 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_4) / var_166_14

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_4 + var_166_14 and arg_163_1.time_ < var_166_4 + var_166_14 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play411021041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 411021041
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play411021042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1095ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1095ui_story == nil then
				arg_167_1.var_.characterEffect1095ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1095ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1095ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1095ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1095ui_story.fillRatio = var_170_5
			end

			local var_170_6 = 0
			local var_170_7 = 0.675

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

				local var_170_8 = arg_167_1:GetWordFromCfg(411021041)
				local var_170_9 = arg_167_1:FormatText(var_170_8.content)

				arg_167_1.text_.text = var_170_9

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_10 = 27
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
	Play411021042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 411021042
		arg_171_1.duration_ = 5.5

		local var_171_0 = {
			zh = 4.266,
			ja = 5.5
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
				arg_171_0:Play411021043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1095ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1095ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1095ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["1095ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story == nil then
				arg_171_1.var_.characterEffect1095ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect1095ui_story then
					arg_171_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect1095ui_story then
				arg_171_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_15 = 0
			local var_174_16 = 0.45

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_17 = arg_171_1:FormatText(StoryNameCfg[471].name)

				arg_171_1.leftNameTxt_.text = var_174_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_18 = arg_171_1:GetWordFromCfg(411021042)
				local var_174_19 = arg_171_1:FormatText(var_174_18.content)

				arg_171_1.text_.text = var_174_19

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_20 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021042", "story_v_out_411021.awb") ~= 0 then
					local var_174_23 = manager.audio:GetVoiceLength("story_v_out_411021", "411021042", "story_v_out_411021.awb") / 1000

					if var_174_23 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_23 + var_174_15
					end

					if var_174_18.prefab_name ~= "" and arg_171_1.actors_[var_174_18.prefab_name] ~= nil then
						local var_174_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_18.prefab_name].transform, "story_v_out_411021", "411021042", "story_v_out_411021.awb")

						arg_171_1:RecordAudio("411021042", var_174_24)
						arg_171_1:RecordAudio("411021042", var_174_24)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_411021", "411021042", "story_v_out_411021.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_411021", "411021042", "story_v_out_411021.awb")
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
	Play411021043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 411021043
		arg_175_1.duration_ = 4.766

		local var_175_0 = {
			zh = 4.766,
			ja = 2.866
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
				arg_175_0:Play411021044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10071ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10071ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0.7, -0.9, -6.26)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10071ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["10071ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect10071ui_story == nil then
				arg_175_1.var_.characterEffect10071ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect10071ui_story then
					arg_175_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect10071ui_story then
				arg_175_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_178_13 = arg_175_1.actors_["1095ui_story"]
			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 and arg_175_1.var_.characterEffect1095ui_story == nil then
				arg_175_1.var_.characterEffect1095ui_story = var_178_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_15 = 0.200000002980232

			if var_178_14 <= arg_175_1.time_ and arg_175_1.time_ < var_178_14 + var_178_15 then
				local var_178_16 = (arg_175_1.time_ - var_178_14) / var_178_15

				if arg_175_1.var_.characterEffect1095ui_story then
					local var_178_17 = Mathf.Lerp(0, 0.5, var_178_16)

					arg_175_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1095ui_story.fillRatio = var_178_17
				end
			end

			if arg_175_1.time_ >= var_178_14 + var_178_15 and arg_175_1.time_ < var_178_14 + var_178_15 + arg_178_0 and arg_175_1.var_.characterEffect1095ui_story then
				local var_178_18 = 0.5

				arg_175_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1095ui_story.fillRatio = var_178_18
			end

			local var_178_19 = 0
			local var_178_20 = 0.5

			if var_178_19 < arg_175_1.time_ and arg_175_1.time_ <= var_178_19 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_21 = arg_175_1:FormatText(StoryNameCfg[670].name)

				arg_175_1.leftNameTxt_.text = var_178_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_22 = arg_175_1:GetWordFromCfg(411021043)
				local var_178_23 = arg_175_1:FormatText(var_178_22.content)

				arg_175_1.text_.text = var_178_23

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_24 = 20
				local var_178_25 = utf8.len(var_178_23)
				local var_178_26 = var_178_24 <= 0 and var_178_20 or var_178_20 * (var_178_25 / var_178_24)

				if var_178_26 > 0 and var_178_20 < var_178_26 then
					arg_175_1.talkMaxDuration = var_178_26

					if var_178_26 + var_178_19 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_26 + var_178_19
					end
				end

				arg_175_1.text_.text = var_178_23
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021043", "story_v_out_411021.awb") ~= 0 then
					local var_178_27 = manager.audio:GetVoiceLength("story_v_out_411021", "411021043", "story_v_out_411021.awb") / 1000

					if var_178_27 + var_178_19 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_27 + var_178_19
					end

					if var_178_22.prefab_name ~= "" and arg_175_1.actors_[var_178_22.prefab_name] ~= nil then
						local var_178_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_22.prefab_name].transform, "story_v_out_411021", "411021043", "story_v_out_411021.awb")

						arg_175_1:RecordAudio("411021043", var_178_28)
						arg_175_1:RecordAudio("411021043", var_178_28)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_411021", "411021043", "story_v_out_411021.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_411021", "411021043", "story_v_out_411021.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_29 = math.max(var_178_20, arg_175_1.talkMaxDuration)

			if var_178_19 <= arg_175_1.time_ and arg_175_1.time_ < var_178_19 + var_178_29 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_19) / var_178_29

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_19 + var_178_29 and arg_175_1.time_ < var_178_19 + var_178_29 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play411021044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 411021044
		arg_179_1.duration_ = 9.633

		local var_179_0 = {
			zh = 7.233,
			ja = 9.633
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
				arg_179_0:Play411021045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.85

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[670].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(411021044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021044", "story_v_out_411021.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021044", "story_v_out_411021.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_411021", "411021044", "story_v_out_411021.awb")

						arg_179_1:RecordAudio("411021044", var_182_9)
						arg_179_1:RecordAudio("411021044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_411021", "411021044", "story_v_out_411021.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_411021", "411021044", "story_v_out_411021.awb")
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
	Play411021045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 411021045
		arg_183_1.duration_ = 10.9

		local var_183_0 = {
			zh = 8.066,
			ja = 10.9
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
				arg_183_0:Play411021046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10071ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect10071ui_story == nil then
				arg_183_1.var_.characterEffect10071ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect10071ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_183_1.var_.characterEffect10071ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect10071ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_183_1.var_.characterEffect10071ui_story.fillRatio = var_186_5
			end

			local var_186_6 = arg_183_1.actors_["1095ui_story"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story == nil then
				arg_183_1.var_.characterEffect1095ui_story = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.200000002980232

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect1095ui_story then
					arg_183_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story then
				arg_183_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_186_10 = 0
			local var_186_11 = 1.05

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_12 = arg_183_1:FormatText(StoryNameCfg[471].name)

				arg_183_1.leftNameTxt_.text = var_186_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_13 = arg_183_1:GetWordFromCfg(411021045)
				local var_186_14 = arg_183_1:FormatText(var_186_13.content)

				arg_183_1.text_.text = var_186_14

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_15 = 42
				local var_186_16 = utf8.len(var_186_14)
				local var_186_17 = var_186_15 <= 0 and var_186_11 or var_186_11 * (var_186_16 / var_186_15)

				if var_186_17 > 0 and var_186_11 < var_186_17 then
					arg_183_1.talkMaxDuration = var_186_17

					if var_186_17 + var_186_10 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_17 + var_186_10
					end
				end

				arg_183_1.text_.text = var_186_14
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021045", "story_v_out_411021.awb") ~= 0 then
					local var_186_18 = manager.audio:GetVoiceLength("story_v_out_411021", "411021045", "story_v_out_411021.awb") / 1000

					if var_186_18 + var_186_10 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_18 + var_186_10
					end

					if var_186_13.prefab_name ~= "" and arg_183_1.actors_[var_186_13.prefab_name] ~= nil then
						local var_186_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_13.prefab_name].transform, "story_v_out_411021", "411021045", "story_v_out_411021.awb")

						arg_183_1:RecordAudio("411021045", var_186_19)
						arg_183_1:RecordAudio("411021045", var_186_19)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_411021", "411021045", "story_v_out_411021.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_411021", "411021045", "story_v_out_411021.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_20 = math.max(var_186_11, arg_183_1.talkMaxDuration)

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_20 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_10) / var_186_20

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_10 + var_186_20 and arg_183_1.time_ < var_186_10 + var_186_20 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play411021046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 411021046
		arg_187_1.duration_ = 8.633

		local var_187_0 = {
			zh = 7.8,
			ja = 8.633
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
				arg_187_0:Play411021047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 1

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[471].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(411021046)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021046", "story_v_out_411021.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021046", "story_v_out_411021.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_411021", "411021046", "story_v_out_411021.awb")

						arg_187_1:RecordAudio("411021046", var_190_9)
						arg_187_1:RecordAudio("411021046", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_411021", "411021046", "story_v_out_411021.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_411021", "411021046", "story_v_out_411021.awb")
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
	Play411021047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 411021047
		arg_191_1.duration_ = 6

		local var_191_0 = {
			zh = 5.433,
			ja = 6
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
				arg_191_0:Play411021048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10071ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10071ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0.7, -0.9, -6.26)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10071ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0.7, -0.9, -6.26)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["10071ui_story"]
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 and arg_191_1.var_.characterEffect10071ui_story == nil then
				arg_191_1.var_.characterEffect10071ui_story = var_194_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_11 = 0.200000002980232

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11

				if arg_191_1.var_.characterEffect10071ui_story then
					arg_191_1.var_.characterEffect10071ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 and arg_191_1.var_.characterEffect10071ui_story then
				arg_191_1.var_.characterEffect10071ui_story.fillFlat = false
			end

			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/story10071/story10071action/10071action1_1")
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1:PlayTimeline("10071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_194_15 = arg_191_1.actors_["1095ui_story"]
			local var_194_16 = 0

			if var_194_16 < arg_191_1.time_ and arg_191_1.time_ <= var_194_16 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story == nil then
				arg_191_1.var_.characterEffect1095ui_story = var_194_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_17 = 0.200000002980232

			if var_194_16 <= arg_191_1.time_ and arg_191_1.time_ < var_194_16 + var_194_17 then
				local var_194_18 = (arg_191_1.time_ - var_194_16) / var_194_17

				if arg_191_1.var_.characterEffect1095ui_story then
					local var_194_19 = Mathf.Lerp(0, 0.5, var_194_18)

					arg_191_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1095ui_story.fillRatio = var_194_19
				end
			end

			if arg_191_1.time_ >= var_194_16 + var_194_17 and arg_191_1.time_ < var_194_16 + var_194_17 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story then
				local var_194_20 = 0.5

				arg_191_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1095ui_story.fillRatio = var_194_20
			end

			local var_194_21 = 0
			local var_194_22 = 0.575

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_23 = arg_191_1:FormatText(StoryNameCfg[670].name)

				arg_191_1.leftNameTxt_.text = var_194_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_24 = arg_191_1:GetWordFromCfg(411021047)
				local var_194_25 = arg_191_1:FormatText(var_194_24.content)

				arg_191_1.text_.text = var_194_25

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_26 = 23
				local var_194_27 = utf8.len(var_194_25)
				local var_194_28 = var_194_26 <= 0 and var_194_22 or var_194_22 * (var_194_27 / var_194_26)

				if var_194_28 > 0 and var_194_22 < var_194_28 then
					arg_191_1.talkMaxDuration = var_194_28

					if var_194_28 + var_194_21 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_28 + var_194_21
					end
				end

				arg_191_1.text_.text = var_194_25
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021047", "story_v_out_411021.awb") ~= 0 then
					local var_194_29 = manager.audio:GetVoiceLength("story_v_out_411021", "411021047", "story_v_out_411021.awb") / 1000

					if var_194_29 + var_194_21 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_29 + var_194_21
					end

					if var_194_24.prefab_name ~= "" and arg_191_1.actors_[var_194_24.prefab_name] ~= nil then
						local var_194_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_24.prefab_name].transform, "story_v_out_411021", "411021047", "story_v_out_411021.awb")

						arg_191_1:RecordAudio("411021047", var_194_30)
						arg_191_1:RecordAudio("411021047", var_194_30)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_411021", "411021047", "story_v_out_411021.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_411021", "411021047", "story_v_out_411021.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_31 = math.max(var_194_22, arg_191_1.talkMaxDuration)

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_31 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_21) / var_194_31

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_21 + var_194_31 and arg_191_1.time_ < var_194_21 + var_194_31 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play411021048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 411021048
		arg_195_1.duration_ = 7

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play411021049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = "ML0502"

			if arg_195_1.bgs_[var_198_0] == nil then
				local var_198_1 = Object.Instantiate(arg_195_1.paintGo_)

				var_198_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_198_0)
				var_198_1.name = var_198_0
				var_198_1.transform.parent = arg_195_1.stage_.transform
				var_198_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_195_1.bgs_[var_198_0] = var_198_1
			end

			local var_198_2 = 2

			if var_198_2 < arg_195_1.time_ and arg_195_1.time_ <= var_198_2 + arg_198_0 then
				local var_198_3 = manager.ui.mainCamera.transform.localPosition
				local var_198_4 = Vector3.New(0, 0, 10) + Vector3.New(var_198_3.x, var_198_3.y, 0)
				local var_198_5 = arg_195_1.bgs_.ML0502

				var_198_5.transform.localPosition = var_198_4
				var_198_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_198_6 = var_198_5:GetComponent("SpriteRenderer")

				if var_198_6 and var_198_6.sprite then
					local var_198_7 = (var_198_5.transform.localPosition - var_198_3).z
					local var_198_8 = manager.ui.mainCameraCom_
					local var_198_9 = 2 * var_198_7 * Mathf.Tan(var_198_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_198_10 = var_198_9 * var_198_8.aspect
					local var_198_11 = var_198_6.sprite.bounds.size.x
					local var_198_12 = var_198_6.sprite.bounds.size.y
					local var_198_13 = var_198_10 / var_198_11
					local var_198_14 = var_198_9 / var_198_12
					local var_198_15 = var_198_14 < var_198_13 and var_198_13 or var_198_14

					var_198_5.transform.localScale = Vector3.New(var_198_15, var_198_15, 0)
				end

				for iter_198_0, iter_198_1 in pairs(arg_195_1.bgs_) do
					if iter_198_0 ~= "ML0502" then
						iter_198_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_198_16 = 0

			if var_198_16 < arg_195_1.time_ and arg_195_1.time_ <= var_198_16 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_17 = 2

			if var_198_16 <= arg_195_1.time_ and arg_195_1.time_ < var_198_16 + var_198_17 then
				local var_198_18 = (arg_195_1.time_ - var_198_16) / var_198_17
				local var_198_19 = Color.New(0, 0, 0)

				var_198_19.a = Mathf.Lerp(0, 1, var_198_18)
				arg_195_1.mask_.color = var_198_19
			end

			if arg_195_1.time_ >= var_198_16 + var_198_17 and arg_195_1.time_ < var_198_16 + var_198_17 + arg_198_0 then
				local var_198_20 = Color.New(0, 0, 0)

				var_198_20.a = 1
				arg_195_1.mask_.color = var_198_20
			end

			local var_198_21 = 2

			if var_198_21 < arg_195_1.time_ and arg_195_1.time_ <= var_198_21 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_22 = 2

			if var_198_21 <= arg_195_1.time_ and arg_195_1.time_ < var_198_21 + var_198_22 then
				local var_198_23 = (arg_195_1.time_ - var_198_21) / var_198_22
				local var_198_24 = Color.New(0, 0, 0)

				var_198_24.a = Mathf.Lerp(1, 0, var_198_23)
				arg_195_1.mask_.color = var_198_24
			end

			if arg_195_1.time_ >= var_198_21 + var_198_22 and arg_195_1.time_ < var_198_21 + var_198_22 + arg_198_0 then
				local var_198_25 = Color.New(0, 0, 0)
				local var_198_26 = 0

				arg_195_1.mask_.enabled = false
				var_198_25.a = var_198_26
				arg_195_1.mask_.color = var_198_25
			end

			local var_198_27 = arg_195_1.actors_["10071ui_story"]
			local var_198_28 = 2

			if var_198_28 < arg_195_1.time_ and arg_195_1.time_ <= var_198_28 + arg_198_0 and arg_195_1.var_.characterEffect10071ui_story == nil then
				arg_195_1.var_.characterEffect10071ui_story = var_198_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_29 = 0.200000002980232

			if var_198_28 <= arg_195_1.time_ and arg_195_1.time_ < var_198_28 + var_198_29 then
				local var_198_30 = (arg_195_1.time_ - var_198_28) / var_198_29

				if arg_195_1.var_.characterEffect10071ui_story then
					local var_198_31 = Mathf.Lerp(0, 0.5, var_198_30)

					arg_195_1.var_.characterEffect10071ui_story.fillFlat = true
					arg_195_1.var_.characterEffect10071ui_story.fillRatio = var_198_31
				end
			end

			if arg_195_1.time_ >= var_198_28 + var_198_29 and arg_195_1.time_ < var_198_28 + var_198_29 + arg_198_0 and arg_195_1.var_.characterEffect10071ui_story then
				local var_198_32 = 0.5

				arg_195_1.var_.characterEffect10071ui_story.fillFlat = true
				arg_195_1.var_.characterEffect10071ui_story.fillRatio = var_198_32
			end

			local var_198_33 = arg_195_1.actors_["10071ui_story"].transform
			local var_198_34 = 2

			if var_198_34 < arg_195_1.time_ and arg_195_1.time_ <= var_198_34 + arg_198_0 then
				arg_195_1.var_.moveOldPos10071ui_story = var_198_33.localPosition
			end

			local var_198_35 = 0.001

			if var_198_34 <= arg_195_1.time_ and arg_195_1.time_ < var_198_34 + var_198_35 then
				local var_198_36 = (arg_195_1.time_ - var_198_34) / var_198_35
				local var_198_37 = Vector3.New(0, 100, 0)

				var_198_33.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10071ui_story, var_198_37, var_198_36)

				local var_198_38 = manager.ui.mainCamera.transform.position - var_198_33.position

				var_198_33.forward = Vector3.New(var_198_38.x, var_198_38.y, var_198_38.z)

				local var_198_39 = var_198_33.localEulerAngles

				var_198_39.z = 0
				var_198_39.x = 0
				var_198_33.localEulerAngles = var_198_39
			end

			if arg_195_1.time_ >= var_198_34 + var_198_35 and arg_195_1.time_ < var_198_34 + var_198_35 + arg_198_0 then
				var_198_33.localPosition = Vector3.New(0, 100, 0)

				local var_198_40 = manager.ui.mainCamera.transform.position - var_198_33.position

				var_198_33.forward = Vector3.New(var_198_40.x, var_198_40.y, var_198_40.z)

				local var_198_41 = var_198_33.localEulerAngles

				var_198_41.z = 0
				var_198_41.x = 0
				var_198_33.localEulerAngles = var_198_41
			end

			local var_198_42 = arg_195_1.actors_["1095ui_story"].transform
			local var_198_43 = 2

			if var_198_43 < arg_195_1.time_ and arg_195_1.time_ <= var_198_43 + arg_198_0 then
				arg_195_1.var_.moveOldPos1095ui_story = var_198_42.localPosition
			end

			local var_198_44 = 0.001

			if var_198_43 <= arg_195_1.time_ and arg_195_1.time_ < var_198_43 + var_198_44 then
				local var_198_45 = (arg_195_1.time_ - var_198_43) / var_198_44
				local var_198_46 = Vector3.New(0, 100, 0)

				var_198_42.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1095ui_story, var_198_46, var_198_45)

				local var_198_47 = manager.ui.mainCamera.transform.position - var_198_42.position

				var_198_42.forward = Vector3.New(var_198_47.x, var_198_47.y, var_198_47.z)

				local var_198_48 = var_198_42.localEulerAngles

				var_198_48.z = 0
				var_198_48.x = 0
				var_198_42.localEulerAngles = var_198_48
			end

			if arg_195_1.time_ >= var_198_43 + var_198_44 and arg_195_1.time_ < var_198_43 + var_198_44 + arg_198_0 then
				var_198_42.localPosition = Vector3.New(0, 100, 0)

				local var_198_49 = manager.ui.mainCamera.transform.position - var_198_42.position

				var_198_42.forward = Vector3.New(var_198_49.x, var_198_49.y, var_198_49.z)

				local var_198_50 = var_198_42.localEulerAngles

				var_198_50.z = 0
				var_198_50.x = 0
				var_198_42.localEulerAngles = var_198_50
			end

			local var_198_51 = arg_195_1.bgs_.ML0502.transform
			local var_198_52 = 2

			if var_198_52 < arg_195_1.time_ and arg_195_1.time_ <= var_198_52 + arg_198_0 then
				arg_195_1.var_.moveOldPosML0502 = var_198_51.localPosition
			end

			local var_198_53 = 0.001

			if var_198_52 <= arg_195_1.time_ and arg_195_1.time_ < var_198_52 + var_198_53 then
				local var_198_54 = (arg_195_1.time_ - var_198_52) / var_198_53
				local var_198_55 = Vector3.New(0, 1, 9.5)

				var_198_51.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPosML0502, var_198_55, var_198_54)
			end

			if arg_195_1.time_ >= var_198_52 + var_198_53 and arg_195_1.time_ < var_198_52 + var_198_53 + arg_198_0 then
				var_198_51.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_198_56 = arg_195_1.bgs_.ML0502.transform
			local var_198_57 = 2.01666666666667

			if var_198_57 < arg_195_1.time_ and arg_195_1.time_ <= var_198_57 + arg_198_0 then
				arg_195_1.var_.moveOldPosML0502 = var_198_56.localPosition
			end

			local var_198_58 = 4

			if var_198_57 <= arg_195_1.time_ and arg_195_1.time_ < var_198_57 + var_198_58 then
				local var_198_59 = (arg_195_1.time_ - var_198_57) / var_198_58
				local var_198_60 = Vector3.New(0, 1, 10)

				var_198_56.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPosML0502, var_198_60, var_198_59)
			end

			if arg_195_1.time_ >= var_198_57 + var_198_58 and arg_195_1.time_ < var_198_57 + var_198_58 + arg_198_0 then
				var_198_56.localPosition = Vector3.New(0, 1, 10)
			end

			local var_198_61 = 4

			if var_198_61 < arg_195_1.time_ and arg_195_1.time_ <= var_198_61 + arg_198_0 then
				arg_195_1.allBtn_.enabled = false
			end

			local var_198_62 = 2.01666666666667

			if arg_195_1.time_ >= var_198_61 + var_198_62 and arg_195_1.time_ < var_198_61 + var_198_62 + arg_198_0 then
				arg_195_1.allBtn_.enabled = true
			end

			if arg_195_1.frameCnt_ <= 1 then
				arg_195_1.dialog_:SetActive(false)
			end

			local var_198_63 = 2
			local var_198_64 = 1.425

			if var_198_63 < arg_195_1.time_ and arg_195_1.time_ <= var_198_63 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				arg_195_1.dialog_:SetActive(true)

				local var_198_65 = LeanTween.value(arg_195_1.dialog_, 0, 1, 0.3)

				var_198_65:setOnUpdate(LuaHelper.FloatAction(function(arg_199_0)
					arg_195_1.dialogCg_.alpha = arg_199_0
				end))
				var_198_65:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_195_1.dialog_)
					var_198_65:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_195_1.duration_ = arg_195_1.duration_ + 0.3

				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_66 = arg_195_1:GetWordFromCfg(411021048)
				local var_198_67 = arg_195_1:FormatText(var_198_66.content)

				arg_195_1.text_.text = var_198_67

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_68 = 57
				local var_198_69 = utf8.len(var_198_67)
				local var_198_70 = var_198_68 <= 0 and var_198_64 or var_198_64 * (var_198_69 / var_198_68)

				if var_198_70 > 0 and var_198_64 < var_198_70 then
					arg_195_1.talkMaxDuration = var_198_70
					var_198_63 = var_198_63 + 0.3

					if var_198_70 + var_198_63 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_70 + var_198_63
					end
				end

				arg_195_1.text_.text = var_198_67
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_71 = var_198_63 + 0.3
			local var_198_72 = math.max(var_198_64, arg_195_1.talkMaxDuration)

			if var_198_71 <= arg_195_1.time_ and arg_195_1.time_ < var_198_71 + var_198_72 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_71) / var_198_72

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_71 + var_198_72 and arg_195_1.time_ < var_198_71 + var_198_72 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play411021049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 411021049
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play411021050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.95

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_2 = arg_201_1:GetWordFromCfg(411021049)
				local var_204_3 = arg_201_1:FormatText(var_204_2.content)

				arg_201_1.text_.text = var_204_3

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_4 = 38
				local var_204_5 = utf8.len(var_204_3)
				local var_204_6 = var_204_4 <= 0 and var_204_1 or var_204_1 * (var_204_5 / var_204_4)

				if var_204_6 > 0 and var_204_1 < var_204_6 then
					arg_201_1.talkMaxDuration = var_204_6

					if var_204_6 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_6 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_3
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_7 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_7 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_7

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_7 and arg_201_1.time_ < var_204_0 + var_204_7 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play411021050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 411021050
		arg_205_1.duration_ = 5.933

		local var_205_0 = {
			zh = 5.4,
			ja = 5.933
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
				arg_205_0:Play411021051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.55

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[670].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(411021050)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021050", "story_v_out_411021.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021050", "story_v_out_411021.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_411021", "411021050", "story_v_out_411021.awb")

						arg_205_1:RecordAudio("411021050", var_208_9)
						arg_205_1:RecordAudio("411021050", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_411021", "411021050", "story_v_out_411021.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_411021", "411021050", "story_v_out_411021.awb")
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
	Play411021051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 411021051
		arg_209_1.duration_ = 12.1

		local var_209_0 = {
			zh = 7.9,
			ja = 12.1
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
				arg_209_0:Play411021052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.825

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[471].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(411021051)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021051", "story_v_out_411021.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021051", "story_v_out_411021.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_411021", "411021051", "story_v_out_411021.awb")

						arg_209_1:RecordAudio("411021051", var_212_9)
						arg_209_1:RecordAudio("411021051", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_411021", "411021051", "story_v_out_411021.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_411021", "411021051", "story_v_out_411021.awb")
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
	Play411021052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 411021052
		arg_213_1.duration_ = 9.466

		local var_213_0 = {
			zh = 9.466,
			ja = 8.3
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
				arg_213_0:Play411021053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.925

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[670].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(411021052)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021052", "story_v_out_411021.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021052", "story_v_out_411021.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_411021", "411021052", "story_v_out_411021.awb")

						arg_213_1:RecordAudio("411021052", var_216_9)
						arg_213_1:RecordAudio("411021052", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_411021", "411021052", "story_v_out_411021.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_411021", "411021052", "story_v_out_411021.awb")
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
	Play411021053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 411021053
		arg_217_1.duration_ = 7.733

		local var_217_0 = {
			zh = 7.4,
			ja = 7.733
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
				arg_217_0:Play411021054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.725

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[471].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(411021053)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021053", "story_v_out_411021.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021053", "story_v_out_411021.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_411021", "411021053", "story_v_out_411021.awb")

						arg_217_1:RecordAudio("411021053", var_220_9)
						arg_217_1:RecordAudio("411021053", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_411021", "411021053", "story_v_out_411021.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_411021", "411021053", "story_v_out_411021.awb")
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
	Play411021054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 411021054
		arg_221_1.duration_ = 16.1

		local var_221_0 = {
			zh = 16.1,
			ja = 11.9
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
				arg_221_0:Play411021055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 1.325

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[670].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(411021054)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021054", "story_v_out_411021.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021054", "story_v_out_411021.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_411021", "411021054", "story_v_out_411021.awb")

						arg_221_1:RecordAudio("411021054", var_224_9)
						arg_221_1:RecordAudio("411021054", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_411021", "411021054", "story_v_out_411021.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_411021", "411021054", "story_v_out_411021.awb")
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
	Play411021055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 411021055
		arg_225_1.duration_ = 14.566

		local var_225_0 = {
			zh = 14.566,
			ja = 11.2
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
				arg_225_0:Play411021056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = "ML0501"

			if arg_225_1.bgs_[var_228_0] == nil then
				local var_228_1 = Object.Instantiate(arg_225_1.paintGo_)

				var_228_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_228_0)
				var_228_1.name = var_228_0
				var_228_1.transform.parent = arg_225_1.stage_.transform
				var_228_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_225_1.bgs_[var_228_0] = var_228_1
			end

			local var_228_2 = 2

			if var_228_2 < arg_225_1.time_ and arg_225_1.time_ <= var_228_2 + arg_228_0 then
				local var_228_3 = manager.ui.mainCamera.transform.localPosition
				local var_228_4 = Vector3.New(0, 0, 10) + Vector3.New(var_228_3.x, var_228_3.y, 0)
				local var_228_5 = arg_225_1.bgs_.ML0501

				var_228_5.transform.localPosition = var_228_4
				var_228_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_228_6 = var_228_5:GetComponent("SpriteRenderer")

				if var_228_6 and var_228_6.sprite then
					local var_228_7 = (var_228_5.transform.localPosition - var_228_3).z
					local var_228_8 = manager.ui.mainCameraCom_
					local var_228_9 = 2 * var_228_7 * Mathf.Tan(var_228_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_228_10 = var_228_9 * var_228_8.aspect
					local var_228_11 = var_228_6.sprite.bounds.size.x
					local var_228_12 = var_228_6.sprite.bounds.size.y
					local var_228_13 = var_228_10 / var_228_11
					local var_228_14 = var_228_9 / var_228_12
					local var_228_15 = var_228_14 < var_228_13 and var_228_13 or var_228_14

					var_228_5.transform.localScale = Vector3.New(var_228_15, var_228_15, 0)
				end

				for iter_228_0, iter_228_1 in pairs(arg_225_1.bgs_) do
					if iter_228_0 ~= "ML0501" then
						iter_228_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_228_16 = 0

			if var_228_16 < arg_225_1.time_ and arg_225_1.time_ <= var_228_16 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_17 = 2

			if var_228_16 <= arg_225_1.time_ and arg_225_1.time_ < var_228_16 + var_228_17 then
				local var_228_18 = (arg_225_1.time_ - var_228_16) / var_228_17
				local var_228_19 = Color.New(0, 0, 0)

				var_228_19.a = Mathf.Lerp(0, 1, var_228_18)
				arg_225_1.mask_.color = var_228_19
			end

			if arg_225_1.time_ >= var_228_16 + var_228_17 and arg_225_1.time_ < var_228_16 + var_228_17 + arg_228_0 then
				local var_228_20 = Color.New(0, 0, 0)

				var_228_20.a = 1
				arg_225_1.mask_.color = var_228_20
			end

			local var_228_21 = 2

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_22 = 2

			if var_228_21 <= arg_225_1.time_ and arg_225_1.time_ < var_228_21 + var_228_22 then
				local var_228_23 = (arg_225_1.time_ - var_228_21) / var_228_22
				local var_228_24 = Color.New(0, 0, 0)

				var_228_24.a = Mathf.Lerp(1, 0, var_228_23)
				arg_225_1.mask_.color = var_228_24
			end

			if arg_225_1.time_ >= var_228_21 + var_228_22 and arg_225_1.time_ < var_228_21 + var_228_22 + arg_228_0 then
				local var_228_25 = Color.New(0, 0, 0)
				local var_228_26 = 0

				arg_225_1.mask_.enabled = false
				var_228_25.a = var_228_26
				arg_225_1.mask_.color = var_228_25
			end

			local var_228_27 = arg_225_1.bgs_.ML0501.transform
			local var_228_28 = 2

			if var_228_28 < arg_225_1.time_ and arg_225_1.time_ <= var_228_28 + arg_228_0 then
				arg_225_1.var_.moveOldPosML0501 = var_228_27.localPosition
			end

			local var_228_29 = 0.001

			if var_228_28 <= arg_225_1.time_ and arg_225_1.time_ < var_228_28 + var_228_29 then
				local var_228_30 = (arg_225_1.time_ - var_228_28) / var_228_29
				local var_228_31 = Vector3.New(0.5, 0, 5)

				var_228_27.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPosML0501, var_228_31, var_228_30)
			end

			if arg_225_1.time_ >= var_228_28 + var_228_29 and arg_225_1.time_ < var_228_28 + var_228_29 + arg_228_0 then
				var_228_27.localPosition = Vector3.New(0.5, 0, 5)
			end

			local var_228_32 = arg_225_1.bgs_.ML0501.transform
			local var_228_33 = 2.01666666666667

			if var_228_33 < arg_225_1.time_ and arg_225_1.time_ <= var_228_33 + arg_228_0 then
				arg_225_1.var_.moveOldPosML0501 = var_228_32.localPosition
			end

			local var_228_34 = 6.2

			if var_228_33 <= arg_225_1.time_ and arg_225_1.time_ < var_228_33 + var_228_34 then
				local var_228_35 = (arg_225_1.time_ - var_228_33) / var_228_34
				local var_228_36 = Vector3.New(-1, 0, 5)

				var_228_32.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPosML0501, var_228_36, var_228_35)
			end

			if arg_225_1.time_ >= var_228_33 + var_228_34 and arg_225_1.time_ < var_228_33 + var_228_34 + arg_228_0 then
				var_228_32.localPosition = Vector3.New(-1, 0, 5)
			end

			if arg_225_1.frameCnt_ <= 1 then
				arg_225_1.dialog_:SetActive(false)
			end

			local var_228_37 = 4
			local var_228_38 = 0.975

			if var_228_37 < arg_225_1.time_ and arg_225_1.time_ <= var_228_37 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0

				arg_225_1.dialog_:SetActive(true)

				local var_228_39 = LeanTween.value(arg_225_1.dialog_, 0, 1, 0.3)

				var_228_39:setOnUpdate(LuaHelper.FloatAction(function(arg_229_0)
					arg_225_1.dialogCg_.alpha = arg_229_0
				end))
				var_228_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_225_1.dialog_)
					var_228_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_225_1.duration_ = arg_225_1.duration_ + 0.3

				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_40 = arg_225_1:FormatText(StoryNameCfg[670].name)

				arg_225_1.leftNameTxt_.text = var_228_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, true)
				arg_225_1.iconController_:SetSelectedState("hero")

				arg_225_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_41 = arg_225_1:GetWordFromCfg(411021055)
				local var_228_42 = arg_225_1:FormatText(var_228_41.content)

				arg_225_1.text_.text = var_228_42

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_43 = 39
				local var_228_44 = utf8.len(var_228_42)
				local var_228_45 = var_228_43 <= 0 and var_228_38 or var_228_38 * (var_228_44 / var_228_43)

				if var_228_45 > 0 and var_228_38 < var_228_45 then
					arg_225_1.talkMaxDuration = var_228_45
					var_228_37 = var_228_37 + 0.3

					if var_228_45 + var_228_37 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_45 + var_228_37
					end
				end

				arg_225_1.text_.text = var_228_42
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021055", "story_v_out_411021.awb") ~= 0 then
					local var_228_46 = manager.audio:GetVoiceLength("story_v_out_411021", "411021055", "story_v_out_411021.awb") / 1000

					if var_228_46 + var_228_37 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_46 + var_228_37
					end

					if var_228_41.prefab_name ~= "" and arg_225_1.actors_[var_228_41.prefab_name] ~= nil then
						local var_228_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_41.prefab_name].transform, "story_v_out_411021", "411021055", "story_v_out_411021.awb")

						arg_225_1:RecordAudio("411021055", var_228_47)
						arg_225_1:RecordAudio("411021055", var_228_47)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_411021", "411021055", "story_v_out_411021.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_411021", "411021055", "story_v_out_411021.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_48 = var_228_37 + 0.3
			local var_228_49 = math.max(var_228_38, arg_225_1.talkMaxDuration)

			if var_228_48 <= arg_225_1.time_ and arg_225_1.time_ < var_228_48 + var_228_49 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_48) / var_228_49

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_48 + var_228_49 and arg_225_1.time_ < var_228_48 + var_228_49 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play411021056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 411021056
		arg_231_1.duration_ = 11.8

		local var_231_0 = {
			zh = 10.466,
			ja = 11.8
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
				arg_231_0:Play411021057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 1.15

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[670].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, true)
				arg_231_1.iconController_:SetSelectedState("hero")

				arg_231_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(411021056)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 46
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021056", "story_v_out_411021.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021056", "story_v_out_411021.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_411021", "411021056", "story_v_out_411021.awb")

						arg_231_1:RecordAudio("411021056", var_234_9)
						arg_231_1:RecordAudio("411021056", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_411021", "411021056", "story_v_out_411021.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_411021", "411021056", "story_v_out_411021.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_10 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_10 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_10

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_10 and arg_231_1.time_ < var_234_0 + var_234_10 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play411021057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 411021057
		arg_235_1.duration_ = 11.433

		local var_235_0 = {
			zh = 11.433,
			ja = 11.366
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
				arg_235_0:Play411021058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 1.225

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[670].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, true)
				arg_235_1.iconController_:SetSelectedState("hero")

				arg_235_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(411021057)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021057", "story_v_out_411021.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021057", "story_v_out_411021.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_411021", "411021057", "story_v_out_411021.awb")

						arg_235_1:RecordAudio("411021057", var_238_9)
						arg_235_1:RecordAudio("411021057", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_411021", "411021057", "story_v_out_411021.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_411021", "411021057", "story_v_out_411021.awb")
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
	Play411021058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 411021058
		arg_239_1.duration_ = 17.766

		local var_239_0 = {
			zh = 17.766,
			ja = 9.966
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
				arg_239_0:Play411021059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 1.475

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[670].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, true)
				arg_239_1.iconController_:SetSelectedState("hero")

				arg_239_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(411021058)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 60
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021058", "story_v_out_411021.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021058", "story_v_out_411021.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_411021", "411021058", "story_v_out_411021.awb")

						arg_239_1:RecordAudio("411021058", var_242_9)
						arg_239_1:RecordAudio("411021058", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_411021", "411021058", "story_v_out_411021.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_411021", "411021058", "story_v_out_411021.awb")
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
	Play411021059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 411021059
		arg_243_1.duration_ = 13.566

		local var_243_0 = {
			zh = 13.566,
			ja = 12.966
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
				arg_243_0:Play411021060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 1.125

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[670].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, true)
				arg_243_1.iconController_:SetSelectedState("hero")

				arg_243_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(411021059)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021059", "story_v_out_411021.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021059", "story_v_out_411021.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_411021", "411021059", "story_v_out_411021.awb")

						arg_243_1:RecordAudio("411021059", var_246_9)
						arg_243_1:RecordAudio("411021059", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_411021", "411021059", "story_v_out_411021.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_411021", "411021059", "story_v_out_411021.awb")
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
	Play411021060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 411021060
		arg_247_1.duration_ = 16.366

		local var_247_0 = {
			zh = 16.366,
			ja = 12.1
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
				arg_247_0:Play411021061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 1.325

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[670].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(411021060)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 53
				local var_250_6 = utf8.len(var_250_4)
				local var_250_7 = var_250_5 <= 0 and var_250_1 or var_250_1 * (var_250_6 / var_250_5)

				if var_250_7 > 0 and var_250_1 < var_250_7 then
					arg_247_1.talkMaxDuration = var_250_7

					if var_250_7 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_7 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_4
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021060", "story_v_out_411021.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021060", "story_v_out_411021.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_411021", "411021060", "story_v_out_411021.awb")

						arg_247_1:RecordAudio("411021060", var_250_9)
						arg_247_1:RecordAudio("411021060", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_411021", "411021060", "story_v_out_411021.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_411021", "411021060", "story_v_out_411021.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_10 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_10 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_10

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_10 and arg_247_1.time_ < var_250_0 + var_250_10 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play411021061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 411021061
		arg_251_1.duration_ = 10.9

		local var_251_0 = {
			zh = 10.9,
			ja = 6
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
				arg_251_0:Play411021062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.95

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[670].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10071")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(411021061)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 38
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021061", "story_v_out_411021.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021061", "story_v_out_411021.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_411021", "411021061", "story_v_out_411021.awb")

						arg_251_1:RecordAudio("411021061", var_254_9)
						arg_251_1:RecordAudio("411021061", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_411021", "411021061", "story_v_out_411021.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_411021", "411021061", "story_v_out_411021.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play411021062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 411021062
		arg_255_1.duration_ = 4.766

		local var_255_0 = {
			zh = 4.766,
			ja = 3.999999999999
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
				arg_255_0:Play411021063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 2

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				local var_258_1 = manager.ui.mainCamera.transform.localPosition
				local var_258_2 = Vector3.New(0, 0, 10) + Vector3.New(var_258_1.x, var_258_1.y, 0)
				local var_258_3 = arg_255_1.bgs_.ML0502

				var_258_3.transform.localPosition = var_258_2
				var_258_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_258_4 = var_258_3:GetComponent("SpriteRenderer")

				if var_258_4 and var_258_4.sprite then
					local var_258_5 = (var_258_3.transform.localPosition - var_258_1).z
					local var_258_6 = manager.ui.mainCameraCom_
					local var_258_7 = 2 * var_258_5 * Mathf.Tan(var_258_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_258_8 = var_258_7 * var_258_6.aspect
					local var_258_9 = var_258_4.sprite.bounds.size.x
					local var_258_10 = var_258_4.sprite.bounds.size.y
					local var_258_11 = var_258_8 / var_258_9
					local var_258_12 = var_258_7 / var_258_10
					local var_258_13 = var_258_12 < var_258_11 and var_258_11 or var_258_12

					var_258_3.transform.localScale = Vector3.New(var_258_13, var_258_13, 0)
				end

				for iter_258_0, iter_258_1 in pairs(arg_255_1.bgs_) do
					if iter_258_0 ~= "ML0502" then
						iter_258_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_14 = 0

			if var_258_14 < arg_255_1.time_ and arg_255_1.time_ <= var_258_14 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_15 = 2

			if var_258_14 <= arg_255_1.time_ and arg_255_1.time_ < var_258_14 + var_258_15 then
				local var_258_16 = (arg_255_1.time_ - var_258_14) / var_258_15
				local var_258_17 = Color.New(1, 1, 1)

				var_258_17.a = Mathf.Lerp(0, 1, var_258_16)
				arg_255_1.mask_.color = var_258_17
			end

			if arg_255_1.time_ >= var_258_14 + var_258_15 and arg_255_1.time_ < var_258_14 + var_258_15 + arg_258_0 then
				local var_258_18 = Color.New(1, 1, 1)

				var_258_18.a = 1
				arg_255_1.mask_.color = var_258_18
			end

			local var_258_19 = 2

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_20 = 2

			if var_258_19 <= arg_255_1.time_ and arg_255_1.time_ < var_258_19 + var_258_20 then
				local var_258_21 = (arg_255_1.time_ - var_258_19) / var_258_20
				local var_258_22 = Color.New(1, 1, 1)

				var_258_22.a = Mathf.Lerp(1, 0, var_258_21)
				arg_255_1.mask_.color = var_258_22
			end

			if arg_255_1.time_ >= var_258_19 + var_258_20 and arg_255_1.time_ < var_258_19 + var_258_20 + arg_258_0 then
				local var_258_23 = Color.New(1, 1, 1)
				local var_258_24 = 0

				arg_255_1.mask_.enabled = false
				var_258_23.a = var_258_24
				arg_255_1.mask_.color = var_258_23
			end

			if arg_255_1.frameCnt_ <= 1 then
				arg_255_1.dialog_:SetActive(false)
			end

			local var_258_25 = 2
			local var_258_26 = 0.05

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0

				arg_255_1.dialog_:SetActive(true)

				local var_258_27 = LeanTween.value(arg_255_1.dialog_, 0, 1, 0.3)

				var_258_27:setOnUpdate(LuaHelper.FloatAction(function(arg_259_0)
					arg_255_1.dialogCg_.alpha = arg_259_0
				end))
				var_258_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_255_1.dialog_)
					var_258_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_255_1.duration_ = arg_255_1.duration_ + 0.3

				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_28 = arg_255_1:FormatText(StoryNameCfg[471].name)

				arg_255_1.leftNameTxt_.text = var_258_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_29 = arg_255_1:GetWordFromCfg(411021062)
				local var_258_30 = arg_255_1:FormatText(var_258_29.content)

				arg_255_1.text_.text = var_258_30

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_31 = 2
				local var_258_32 = utf8.len(var_258_30)
				local var_258_33 = var_258_31 <= 0 and var_258_26 or var_258_26 * (var_258_32 / var_258_31)

				if var_258_33 > 0 and var_258_26 < var_258_33 then
					arg_255_1.talkMaxDuration = var_258_33
					var_258_25 = var_258_25 + 0.3

					if var_258_33 + var_258_25 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_33 + var_258_25
					end
				end

				arg_255_1.text_.text = var_258_30
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021062", "story_v_out_411021.awb") ~= 0 then
					local var_258_34 = manager.audio:GetVoiceLength("story_v_out_411021", "411021062", "story_v_out_411021.awb") / 1000

					if var_258_34 + var_258_25 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_34 + var_258_25
					end

					if var_258_29.prefab_name ~= "" and arg_255_1.actors_[var_258_29.prefab_name] ~= nil then
						local var_258_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_29.prefab_name].transform, "story_v_out_411021", "411021062", "story_v_out_411021.awb")

						arg_255_1:RecordAudio("411021062", var_258_35)
						arg_255_1:RecordAudio("411021062", var_258_35)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_411021", "411021062", "story_v_out_411021.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_411021", "411021062", "story_v_out_411021.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_36 = var_258_25 + 0.3
			local var_258_37 = math.max(var_258_26, arg_255_1.talkMaxDuration)

			if var_258_36 <= arg_255_1.time_ and arg_255_1.time_ < var_258_36 + var_258_37 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_36) / var_258_37

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_36 + var_258_37 and arg_255_1.time_ < var_258_36 + var_258_37 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play411021063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 411021063
		arg_261_1.duration_ = 2.9

		local var_261_0 = {
			zh = 2.9,
			ja = 1.766
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
				arg_261_0:Play411021064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.2

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[670].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(411021063)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021063", "story_v_out_411021.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021063", "story_v_out_411021.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_411021", "411021063", "story_v_out_411021.awb")

						arg_261_1:RecordAudio("411021063", var_264_9)
						arg_261_1:RecordAudio("411021063", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_411021", "411021063", "story_v_out_411021.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_411021", "411021063", "story_v_out_411021.awb")
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
	Play411021064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 411021064
		arg_265_1.duration_ = 5.9

		local var_265_0 = {
			zh = 5.866,
			ja = 5.9
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
				arg_265_0:Play411021065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.625

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[471].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(411021064)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021064", "story_v_out_411021.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021064", "story_v_out_411021.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_411021", "411021064", "story_v_out_411021.awb")

						arg_265_1:RecordAudio("411021064", var_268_9)
						arg_265_1:RecordAudio("411021064", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_411021", "411021064", "story_v_out_411021.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_411021", "411021064", "story_v_out_411021.awb")
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
	Play411021065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 411021065
		arg_269_1.duration_ = 8.7

		local var_269_0 = {
			zh = 7.6,
			ja = 8.7
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
				arg_269_0:Play411021066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.8

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[670].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(411021065)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021065", "story_v_out_411021.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021065", "story_v_out_411021.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_411021", "411021065", "story_v_out_411021.awb")

						arg_269_1:RecordAudio("411021065", var_272_9)
						arg_269_1:RecordAudio("411021065", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_411021", "411021065", "story_v_out_411021.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_411021", "411021065", "story_v_out_411021.awb")
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
	Play411021066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 411021066
		arg_273_1.duration_ = 13

		local var_273_0 = {
			zh = 3.833,
			ja = 13
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
				arg_273_0:Play411021067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.425

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

				local var_276_3 = arg_273_1:GetWordFromCfg(411021066)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021066", "story_v_out_411021.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021066", "story_v_out_411021.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_411021", "411021066", "story_v_out_411021.awb")

						arg_273_1:RecordAudio("411021066", var_276_9)
						arg_273_1:RecordAudio("411021066", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_411021", "411021066", "story_v_out_411021.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_411021", "411021066", "story_v_out_411021.awb")
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
	Play411021067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 411021067
		arg_277_1.duration_ = 10.366

		local var_277_0 = {
			zh = 10.366,
			ja = 8.133
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
				arg_277_0:Play411021068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 1.15

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[670].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(411021067)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021067", "story_v_out_411021.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021067", "story_v_out_411021.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_411021", "411021067", "story_v_out_411021.awb")

						arg_277_1:RecordAudio("411021067", var_280_9)
						arg_277_1:RecordAudio("411021067", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_411021", "411021067", "story_v_out_411021.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_411021", "411021067", "story_v_out_411021.awb")
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
	Play411021068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 411021068
		arg_281_1.duration_ = 6

		local var_281_0 = {
			zh = 6,
			ja = 5.733
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
				arg_281_0:Play411021069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.6

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[471].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(411021068)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021068", "story_v_out_411021.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021068", "story_v_out_411021.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_411021", "411021068", "story_v_out_411021.awb")

						arg_281_1:RecordAudio("411021068", var_284_9)
						arg_281_1:RecordAudio("411021068", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_411021", "411021068", "story_v_out_411021.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_411021", "411021068", "story_v_out_411021.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_10 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_10

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_10 and arg_281_1.time_ < var_284_0 + var_284_10 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play411021069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 411021069
		arg_285_1.duration_ = 12.3

		local var_285_0 = {
			zh = 7.6,
			ja = 12.3
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
				arg_285_0:Play411021070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.625

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[670].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(411021069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021069", "story_v_out_411021.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021069", "story_v_out_411021.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_411021", "411021069", "story_v_out_411021.awb")

						arg_285_1:RecordAudio("411021069", var_288_9)
						arg_285_1:RecordAudio("411021069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_411021", "411021069", "story_v_out_411021.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_411021", "411021069", "story_v_out_411021.awb")
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
	Play411021070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 411021070
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play411021071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.366666666666667

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				local var_292_2 = "play"
				local var_292_3 = "music"

				arg_289_1:AudioAction(var_292_2, var_292_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_292_4 = 0
			local var_292_5 = 0.65

			if var_292_4 < arg_289_1.time_ and arg_289_1.time_ <= var_292_4 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_6 = arg_289_1:GetWordFromCfg(411021070)
				local var_292_7 = arg_289_1:FormatText(var_292_6.content)

				arg_289_1.text_.text = var_292_7

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_8 = 26
				local var_292_9 = utf8.len(var_292_7)
				local var_292_10 = var_292_8 <= 0 and var_292_5 or var_292_5 * (var_292_9 / var_292_8)

				if var_292_10 > 0 and var_292_5 < var_292_10 then
					arg_289_1.talkMaxDuration = var_292_10

					if var_292_10 + var_292_4 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_10 + var_292_4
					end
				end

				arg_289_1.text_.text = var_292_7
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_11 = math.max(var_292_5, arg_289_1.talkMaxDuration)

			if var_292_4 <= arg_289_1.time_ and arg_289_1.time_ < var_292_4 + var_292_11 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_4) / var_292_11

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_4 + var_292_11 and arg_289_1.time_ < var_292_4 + var_292_11 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play411021071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 411021071
		arg_293_1.duration_ = 9

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play411021072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 2

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				local var_296_1 = manager.ui.mainCamera.transform.localPosition
				local var_296_2 = Vector3.New(0, 0, 10) + Vector3.New(var_296_1.x, var_296_1.y, 0)
				local var_296_3 = arg_293_1.bgs_.I11m

				var_296_3.transform.localPosition = var_296_2
				var_296_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_296_4 = var_296_3:GetComponent("SpriteRenderer")

				if var_296_4 and var_296_4.sprite then
					local var_296_5 = (var_296_3.transform.localPosition - var_296_1).z
					local var_296_6 = manager.ui.mainCameraCom_
					local var_296_7 = 2 * var_296_5 * Mathf.Tan(var_296_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_296_8 = var_296_7 * var_296_6.aspect
					local var_296_9 = var_296_4.sprite.bounds.size.x
					local var_296_10 = var_296_4.sprite.bounds.size.y
					local var_296_11 = var_296_8 / var_296_9
					local var_296_12 = var_296_7 / var_296_10
					local var_296_13 = var_296_12 < var_296_11 and var_296_11 or var_296_12

					var_296_3.transform.localScale = Vector3.New(var_296_13, var_296_13, 0)
				end

				for iter_296_0, iter_296_1 in pairs(arg_293_1.bgs_) do
					if iter_296_0 ~= "I11m" then
						iter_296_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1.mask_.enabled = true
				arg_293_1.mask_.raycastTarget = true

				arg_293_1:SetGaussion(false)
			end

			local var_296_15 = 2

			if var_296_14 <= arg_293_1.time_ and arg_293_1.time_ < var_296_14 + var_296_15 then
				local var_296_16 = (arg_293_1.time_ - var_296_14) / var_296_15
				local var_296_17 = Color.New(0, 0, 0)

				var_296_17.a = Mathf.Lerp(0, 1, var_296_16)
				arg_293_1.mask_.color = var_296_17
			end

			if arg_293_1.time_ >= var_296_14 + var_296_15 and arg_293_1.time_ < var_296_14 + var_296_15 + arg_296_0 then
				local var_296_18 = Color.New(0, 0, 0)

				var_296_18.a = 1
				arg_293_1.mask_.color = var_296_18
			end

			local var_296_19 = 2

			if var_296_19 < arg_293_1.time_ and arg_293_1.time_ <= var_296_19 + arg_296_0 then
				arg_293_1.mask_.enabled = true
				arg_293_1.mask_.raycastTarget = true

				arg_293_1:SetGaussion(false)
			end

			local var_296_20 = 2

			if var_296_19 <= arg_293_1.time_ and arg_293_1.time_ < var_296_19 + var_296_20 then
				local var_296_21 = (arg_293_1.time_ - var_296_19) / var_296_20
				local var_296_22 = Color.New(0, 0, 0)

				var_296_22.a = Mathf.Lerp(1, 0, var_296_21)
				arg_293_1.mask_.color = var_296_22
			end

			if arg_293_1.time_ >= var_296_19 + var_296_20 and arg_293_1.time_ < var_296_19 + var_296_20 + arg_296_0 then
				local var_296_23 = Color.New(0, 0, 0)
				local var_296_24 = 0

				arg_293_1.mask_.enabled = false
				var_296_23.a = var_296_24
				arg_293_1.mask_.color = var_296_23
			end

			local var_296_25 = 4
			local var_296_26 = 0.366666666666667

			if var_296_25 < arg_293_1.time_ and arg_293_1.time_ <= var_296_25 + arg_296_0 then
				local var_296_27 = "play"
				local var_296_28 = "effect"

				arg_293_1:AudioAction(var_296_27, var_296_28, "se_story", "se_story_communication", "")
			end

			if arg_293_1.frameCnt_ <= 1 then
				arg_293_1.dialog_:SetActive(false)
			end

			local var_296_29 = 4
			local var_296_30 = 0.8

			if var_296_29 < arg_293_1.time_ and arg_293_1.time_ <= var_296_29 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0

				arg_293_1.dialog_:SetActive(true)

				local var_296_31 = LeanTween.value(arg_293_1.dialog_, 0, 1, 0.3)

				var_296_31:setOnUpdate(LuaHelper.FloatAction(function(arg_297_0)
					arg_293_1.dialogCg_.alpha = arg_297_0
				end))
				var_296_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_293_1.dialog_)
					var_296_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_293_1.duration_ = arg_293_1.duration_ + 0.3

				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_32 = arg_293_1:GetWordFromCfg(411021071)
				local var_296_33 = arg_293_1:FormatText(var_296_32.content)

				arg_293_1.text_.text = var_296_33

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_34 = 32
				local var_296_35 = utf8.len(var_296_33)
				local var_296_36 = var_296_34 <= 0 and var_296_30 or var_296_30 * (var_296_35 / var_296_34)

				if var_296_36 > 0 and var_296_30 < var_296_36 then
					arg_293_1.talkMaxDuration = var_296_36
					var_296_29 = var_296_29 + 0.3

					if var_296_36 + var_296_29 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_36 + var_296_29
					end
				end

				arg_293_1.text_.text = var_296_33
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_37 = var_296_29 + 0.3
			local var_296_38 = math.max(var_296_30, arg_293_1.talkMaxDuration)

			if var_296_37 <= arg_293_1.time_ and arg_293_1.time_ < var_296_37 + var_296_38 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_37) / var_296_38

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_37 + var_296_38 and arg_293_1.time_ < var_296_37 + var_296_38 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play411021072 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 411021072
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play411021073(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.5

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

				local var_302_2 = arg_299_1:GetWordFromCfg(411021072)
				local var_302_3 = arg_299_1:FormatText(var_302_2.content)

				arg_299_1.text_.text = var_302_3

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_4 = 20
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
	Play411021073 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 411021073
		arg_303_1.duration_ = 4.999999999999

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play411021074(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = "10014ui_story"

			if arg_303_1.actors_[var_306_0] == nil then
				local var_306_1 = Object.Instantiate(Asset.Load("Char/" .. var_306_0), arg_303_1.stage_.transform)

				var_306_1.name = var_306_0
				var_306_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_303_1.actors_[var_306_0] = var_306_1

				local var_306_2 = var_306_1:GetComponentInChildren(typeof(CharacterEffect))

				var_306_2.enabled = true

				local var_306_3 = GameObjectTools.GetOrAddComponent(var_306_1, typeof(DynamicBoneHelper))

				if var_306_3 then
					var_306_3:EnableDynamicBone(false)
				end

				arg_303_1:ShowWeapon(var_306_2.transform, false)

				arg_303_1.var_[var_306_0 .. "Animator"] = var_306_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_303_1.var_[var_306_0 .. "Animator"].applyRootMotion = true
				arg_303_1.var_[var_306_0 .. "LipSync"] = var_306_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_306_4 = arg_303_1.actors_["10014ui_story"].transform
			local var_306_5 = 0

			if var_306_5 < arg_303_1.time_ and arg_303_1.time_ <= var_306_5 + arg_306_0 then
				arg_303_1.var_.moveOldPos10014ui_story = var_306_4.localPosition
			end

			local var_306_6 = 0.001

			if var_306_5 <= arg_303_1.time_ and arg_303_1.time_ < var_306_5 + var_306_6 then
				local var_306_7 = (arg_303_1.time_ - var_306_5) / var_306_6
				local var_306_8 = Vector3.New(0, -1.06, -6.2)

				var_306_4.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos10014ui_story, var_306_8, var_306_7)

				local var_306_9 = manager.ui.mainCamera.transform.position - var_306_4.position

				var_306_4.forward = Vector3.New(var_306_9.x, var_306_9.y, var_306_9.z)

				local var_306_10 = var_306_4.localEulerAngles

				var_306_10.z = 0
				var_306_10.x = 0
				var_306_4.localEulerAngles = var_306_10
			end

			if arg_303_1.time_ >= var_306_5 + var_306_6 and arg_303_1.time_ < var_306_5 + var_306_6 + arg_306_0 then
				var_306_4.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_306_11 = manager.ui.mainCamera.transform.position - var_306_4.position

				var_306_4.forward = Vector3.New(var_306_11.x, var_306_11.y, var_306_11.z)

				local var_306_12 = var_306_4.localEulerAngles

				var_306_12.z = 0
				var_306_12.x = 0
				var_306_4.localEulerAngles = var_306_12
			end

			local var_306_13 = arg_303_1.actors_["10014ui_story"]
			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 and arg_303_1.var_.characterEffect10014ui_story == nil then
				arg_303_1.var_.characterEffect10014ui_story = var_306_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_15 = 0.200000002980232

			if var_306_14 <= arg_303_1.time_ and arg_303_1.time_ < var_306_14 + var_306_15 then
				local var_306_16 = (arg_303_1.time_ - var_306_14) / var_306_15

				if arg_303_1.var_.characterEffect10014ui_story then
					arg_303_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_14 + var_306_15 and arg_303_1.time_ < var_306_14 + var_306_15 + arg_306_0 and arg_303_1.var_.characterEffect10014ui_story then
				arg_303_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_306_17 = 0

			if var_306_17 < arg_303_1.time_ and arg_303_1.time_ <= var_306_17 + arg_306_0 then
				arg_303_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_306_18 = 0

			if var_306_18 < arg_303_1.time_ and arg_303_1.time_ <= var_306_18 + arg_306_0 then
				arg_303_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_306_19 = arg_303_1.actors_["10014ui_story"]
			local var_306_20 = 0

			if var_306_20 < arg_303_1.time_ and arg_303_1.time_ <= var_306_20 + arg_306_0 then
				if arg_303_1.var_.characterEffect10014ui_story == nil then
					arg_303_1.var_.characterEffect10014ui_story = var_306_19:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_306_21 = arg_303_1.var_.characterEffect10014ui_story

				var_306_21.imageEffect:turnOff()

				var_306_21.interferenceEffect.enabled = true
				var_306_21.interferenceEffect.noise = 0.01
				var_306_21.interferenceEffect.simTimeScale = 1
				var_306_21.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_306_22 = arg_303_1.actors_["10014ui_story"]
			local var_306_23 = 0
			local var_306_24 = 5

			if var_306_23 < arg_303_1.time_ and arg_303_1.time_ <= var_306_23 + arg_306_0 then
				if arg_303_1.var_.characterEffect10014ui_story == nil then
					arg_303_1.var_.characterEffect10014ui_story = var_306_22:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_303_1.var_.characterEffect10014ui_story.imageEffect:turnOn(false)
			end

			local var_306_25 = 0
			local var_306_26 = 0.366666666666667

			if var_306_25 < arg_303_1.time_ and arg_303_1.time_ <= var_306_25 + arg_306_0 then
				local var_306_27 = "play"
				local var_306_28 = "music"

				arg_303_1:AudioAction(var_306_27, var_306_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_306_29 = 0.6
			local var_306_30 = 1

			if var_306_29 < arg_303_1.time_ and arg_303_1.time_ <= var_306_29 + arg_306_0 then
				local var_306_31 = "play"
				local var_306_32 = "music"

				arg_303_1:AudioAction(var_306_31, var_306_32, "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano.awb")
			end

			local var_306_33 = 0
			local var_306_34 = 0.375

			if var_306_33 < arg_303_1.time_ and arg_303_1.time_ <= var_306_33 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_35 = arg_303_1:FormatText(StoryNameCfg[264].name)

				arg_303_1.leftNameTxt_.text = var_306_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_36 = arg_303_1:GetWordFromCfg(411021073)
				local var_306_37 = arg_303_1:FormatText(var_306_36.content)

				arg_303_1.text_.text = var_306_37

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_38 = 15
				local var_306_39 = utf8.len(var_306_37)
				local var_306_40 = var_306_38 <= 0 and var_306_34 or var_306_34 * (var_306_39 / var_306_38)

				if var_306_40 > 0 and var_306_34 < var_306_40 then
					arg_303_1.talkMaxDuration = var_306_40

					if var_306_40 + var_306_33 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_40 + var_306_33
					end
				end

				arg_303_1.text_.text = var_306_37
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021073", "story_v_out_411021.awb") ~= 0 then
					local var_306_41 = manager.audio:GetVoiceLength("story_v_out_411021", "411021073", "story_v_out_411021.awb") / 1000

					if var_306_41 + var_306_33 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_41 + var_306_33
					end

					if var_306_36.prefab_name ~= "" and arg_303_1.actors_[var_306_36.prefab_name] ~= nil then
						local var_306_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_36.prefab_name].transform, "story_v_out_411021", "411021073", "story_v_out_411021.awb")

						arg_303_1:RecordAudio("411021073", var_306_42)
						arg_303_1:RecordAudio("411021073", var_306_42)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_411021", "411021073", "story_v_out_411021.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_411021", "411021073", "story_v_out_411021.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_43 = math.max(var_306_34, arg_303_1.talkMaxDuration)

			if var_306_33 <= arg_303_1.time_ and arg_303_1.time_ < var_306_33 + var_306_43 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_33) / var_306_43

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_33 + var_306_43 and arg_303_1.time_ < var_306_33 + var_306_43 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play411021074 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 411021074
		arg_307_1.duration_ = 6.366

		local var_307_0 = {
			zh = 6.366,
			ja = 6.033
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
				arg_307_0:Play411021075(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.85

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_2 = arg_307_1:FormatText(StoryNameCfg[264].name)

				arg_307_1.leftNameTxt_.text = var_310_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_3 = arg_307_1:GetWordFromCfg(411021074)
				local var_310_4 = arg_307_1:FormatText(var_310_3.content)

				arg_307_1.text_.text = var_310_4

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021074", "story_v_out_411021.awb") ~= 0 then
					local var_310_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021074", "story_v_out_411021.awb") / 1000

					if var_310_8 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_8 + var_310_0
					end

					if var_310_3.prefab_name ~= "" and arg_307_1.actors_[var_310_3.prefab_name] ~= nil then
						local var_310_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_3.prefab_name].transform, "story_v_out_411021", "411021074", "story_v_out_411021.awb")

						arg_307_1:RecordAudio("411021074", var_310_9)
						arg_307_1:RecordAudio("411021074", var_310_9)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_411021", "411021074", "story_v_out_411021.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_411021", "411021074", "story_v_out_411021.awb")
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
	Play411021075 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 411021075
		arg_311_1.duration_ = 2.033

		local var_311_0 = {
			zh = 1.999999999999,
			ja = 2.033
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
				arg_311_0:Play411021076(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1095ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos1095ui_story = var_314_0.localPosition
			end

			local var_314_2 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2
				local var_314_4 = Vector3.New(0.7, -0.98, -6.1)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1095ui_story, var_314_4, var_314_3)

				local var_314_5 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_5.x, var_314_5.y, var_314_5.z)

				local var_314_6 = var_314_0.localEulerAngles

				var_314_6.z = 0
				var_314_6.x = 0
				var_314_0.localEulerAngles = var_314_6
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_314_7 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_7.x, var_314_7.y, var_314_7.z)

				local var_314_8 = var_314_0.localEulerAngles

				var_314_8.z = 0
				var_314_8.x = 0
				var_314_0.localEulerAngles = var_314_8
			end

			local var_314_9 = arg_311_1.actors_["1095ui_story"]
			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 and arg_311_1.var_.characterEffect1095ui_story == nil then
				arg_311_1.var_.characterEffect1095ui_story = var_314_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_11 = 0.200000002980232

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_11 then
				local var_314_12 = (arg_311_1.time_ - var_314_10) / var_314_11

				if arg_311_1.var_.characterEffect1095ui_story then
					arg_311_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_10 + var_314_11 and arg_311_1.time_ < var_314_10 + var_314_11 + arg_314_0 and arg_311_1.var_.characterEffect1095ui_story then
				arg_311_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_314_13 = 0

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_314_15 = arg_311_1.actors_["10014ui_story"].transform
			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.var_.moveOldPos10014ui_story = var_314_15.localPosition
			end

			local var_314_17 = 0.001

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Vector3.New(-0.7, -1.06, -6.2)

				var_314_15.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10014ui_story, var_314_19, var_314_18)

				local var_314_20 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_20.x, var_314_20.y, var_314_20.z)

				local var_314_21 = var_314_15.localEulerAngles

				var_314_21.z = 0
				var_314_21.x = 0
				var_314_15.localEulerAngles = var_314_21
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				var_314_15.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_314_22 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_22.x, var_314_22.y, var_314_22.z)

				local var_314_23 = var_314_15.localEulerAngles

				var_314_23.z = 0
				var_314_23.x = 0
				var_314_15.localEulerAngles = var_314_23
			end

			local var_314_24 = arg_311_1.actors_["10014ui_story"]
			local var_314_25 = 0

			if var_314_25 < arg_311_1.time_ and arg_311_1.time_ <= var_314_25 + arg_314_0 and arg_311_1.var_.characterEffect10014ui_story == nil then
				arg_311_1.var_.characterEffect10014ui_story = var_314_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_26 = 0.200000002980232

			if var_314_25 <= arg_311_1.time_ and arg_311_1.time_ < var_314_25 + var_314_26 then
				local var_314_27 = (arg_311_1.time_ - var_314_25) / var_314_26

				if arg_311_1.var_.characterEffect10014ui_story then
					local var_314_28 = Mathf.Lerp(0, 0.5, var_314_27)

					arg_311_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_311_1.var_.characterEffect10014ui_story.fillRatio = var_314_28
				end
			end

			if arg_311_1.time_ >= var_314_25 + var_314_26 and arg_311_1.time_ < var_314_25 + var_314_26 + arg_314_0 and arg_311_1.var_.characterEffect10014ui_story then
				local var_314_29 = 0.5

				arg_311_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_311_1.var_.characterEffect10014ui_story.fillRatio = var_314_29
			end

			local var_314_30 = 0
			local var_314_31 = 0.175

			if var_314_30 < arg_311_1.time_ and arg_311_1.time_ <= var_314_30 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_32 = arg_311_1:FormatText(StoryNameCfg[471].name)

				arg_311_1.leftNameTxt_.text = var_314_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_33 = arg_311_1:GetWordFromCfg(411021075)
				local var_314_34 = arg_311_1:FormatText(var_314_33.content)

				arg_311_1.text_.text = var_314_34

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_35 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021075", "story_v_out_411021.awb") ~= 0 then
					local var_314_38 = manager.audio:GetVoiceLength("story_v_out_411021", "411021075", "story_v_out_411021.awb") / 1000

					if var_314_38 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_38 + var_314_30
					end

					if var_314_33.prefab_name ~= "" and arg_311_1.actors_[var_314_33.prefab_name] ~= nil then
						local var_314_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_33.prefab_name].transform, "story_v_out_411021", "411021075", "story_v_out_411021.awb")

						arg_311_1:RecordAudio("411021075", var_314_39)
						arg_311_1:RecordAudio("411021075", var_314_39)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_411021", "411021075", "story_v_out_411021.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_411021", "411021075", "story_v_out_411021.awb")
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
	Play411021076 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 411021076
		arg_315_1.duration_ = 8.266

		local var_315_0 = {
			zh = 4.2,
			ja = 8.266
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
				arg_315_0:Play411021077(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1095ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect1095ui_story == nil then
				arg_315_1.var_.characterEffect1095ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.200000002980232

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect1095ui_story then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1095ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect1095ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1095ui_story.fillRatio = var_318_5
			end

			local var_318_6 = arg_315_1.actors_["10014ui_story"]
			local var_318_7 = 0

			if var_318_7 < arg_315_1.time_ and arg_315_1.time_ <= var_318_7 + arg_318_0 and arg_315_1.var_.characterEffect10014ui_story == nil then
				arg_315_1.var_.characterEffect10014ui_story = var_318_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_8 = 0.200000002980232

			if var_318_7 <= arg_315_1.time_ and arg_315_1.time_ < var_318_7 + var_318_8 then
				local var_318_9 = (arg_315_1.time_ - var_318_7) / var_318_8

				if arg_315_1.var_.characterEffect10014ui_story then
					arg_315_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_7 + var_318_8 and arg_315_1.time_ < var_318_7 + var_318_8 + arg_318_0 and arg_315_1.var_.characterEffect10014ui_story then
				arg_315_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_318_10 = 0
			local var_318_11 = 0.525

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_12 = arg_315_1:FormatText(StoryNameCfg[264].name)

				arg_315_1.leftNameTxt_.text = var_318_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_13 = arg_315_1:GetWordFromCfg(411021076)
				local var_318_14 = arg_315_1:FormatText(var_318_13.content)

				arg_315_1.text_.text = var_318_14

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_15 = 21
				local var_318_16 = utf8.len(var_318_14)
				local var_318_17 = var_318_15 <= 0 and var_318_11 or var_318_11 * (var_318_16 / var_318_15)

				if var_318_17 > 0 and var_318_11 < var_318_17 then
					arg_315_1.talkMaxDuration = var_318_17

					if var_318_17 + var_318_10 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_17 + var_318_10
					end
				end

				arg_315_1.text_.text = var_318_14
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021076", "story_v_out_411021.awb") ~= 0 then
					local var_318_18 = manager.audio:GetVoiceLength("story_v_out_411021", "411021076", "story_v_out_411021.awb") / 1000

					if var_318_18 + var_318_10 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_18 + var_318_10
					end

					if var_318_13.prefab_name ~= "" and arg_315_1.actors_[var_318_13.prefab_name] ~= nil then
						local var_318_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_13.prefab_name].transform, "story_v_out_411021", "411021076", "story_v_out_411021.awb")

						arg_315_1:RecordAudio("411021076", var_318_19)
						arg_315_1:RecordAudio("411021076", var_318_19)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_411021", "411021076", "story_v_out_411021.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_411021", "411021076", "story_v_out_411021.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_20 = math.max(var_318_11, arg_315_1.talkMaxDuration)

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_20 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_10) / var_318_20

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_10 + var_318_20 and arg_315_1.time_ < var_318_10 + var_318_20 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play411021077 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 411021077
		arg_319_1.duration_ = 7.066

		local var_319_0 = {
			zh = 5.2,
			ja = 7.066
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
				arg_319_0:Play411021078(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1095ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1095ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0.7, -0.98, -6.1)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1095ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["1095ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect1095ui_story == nil then
				arg_319_1.var_.characterEffect1095ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect1095ui_story then
					arg_319_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect1095ui_story then
				arg_319_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_322_15 = arg_319_1.actors_["10014ui_story"]
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 and arg_319_1.var_.characterEffect10014ui_story == nil then
				arg_319_1.var_.characterEffect10014ui_story = var_322_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_17 = 0.200000002980232

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17

				if arg_319_1.var_.characterEffect10014ui_story then
					local var_322_19 = Mathf.Lerp(0, 0.5, var_322_18)

					arg_319_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_319_1.var_.characterEffect10014ui_story.fillRatio = var_322_19
				end
			end

			if arg_319_1.time_ >= var_322_16 + var_322_17 and arg_319_1.time_ < var_322_16 + var_322_17 + arg_322_0 and arg_319_1.var_.characterEffect10014ui_story then
				local var_322_20 = 0.5

				arg_319_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_319_1.var_.characterEffect10014ui_story.fillRatio = var_322_20
			end

			local var_322_21 = 0
			local var_322_22 = 0.675

			if var_322_21 < arg_319_1.time_ and arg_319_1.time_ <= var_322_21 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_23 = arg_319_1:FormatText(StoryNameCfg[471].name)

				arg_319_1.leftNameTxt_.text = var_322_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_24 = arg_319_1:GetWordFromCfg(411021077)
				local var_322_25 = arg_319_1:FormatText(var_322_24.content)

				arg_319_1.text_.text = var_322_25

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_26 = 27
				local var_322_27 = utf8.len(var_322_25)
				local var_322_28 = var_322_26 <= 0 and var_322_22 or var_322_22 * (var_322_27 / var_322_26)

				if var_322_28 > 0 and var_322_22 < var_322_28 then
					arg_319_1.talkMaxDuration = var_322_28

					if var_322_28 + var_322_21 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_28 + var_322_21
					end
				end

				arg_319_1.text_.text = var_322_25
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021077", "story_v_out_411021.awb") ~= 0 then
					local var_322_29 = manager.audio:GetVoiceLength("story_v_out_411021", "411021077", "story_v_out_411021.awb") / 1000

					if var_322_29 + var_322_21 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_29 + var_322_21
					end

					if var_322_24.prefab_name ~= "" and arg_319_1.actors_[var_322_24.prefab_name] ~= nil then
						local var_322_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_24.prefab_name].transform, "story_v_out_411021", "411021077", "story_v_out_411021.awb")

						arg_319_1:RecordAudio("411021077", var_322_30)
						arg_319_1:RecordAudio("411021077", var_322_30)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_411021", "411021077", "story_v_out_411021.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_411021", "411021077", "story_v_out_411021.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_31 = math.max(var_322_22, arg_319_1.talkMaxDuration)

			if var_322_21 <= arg_319_1.time_ and arg_319_1.time_ < var_322_21 + var_322_31 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_21) / var_322_31

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_21 + var_322_31 and arg_319_1.time_ < var_322_21 + var_322_31 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play411021078 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 411021078
		arg_323_1.duration_ = 7.3

		local var_323_0 = {
			zh = 6.066,
			ja = 7.3
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
				arg_323_0:Play411021079(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["10014ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos10014ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos10014ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["10014ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect10014ui_story == nil then
				arg_323_1.var_.characterEffect10014ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect10014ui_story then
					arg_323_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect10014ui_story then
				arg_323_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_326_13 = 0

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				arg_323_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_326_15 = arg_323_1.actors_["1095ui_story"]
			local var_326_16 = 0

			if var_326_16 < arg_323_1.time_ and arg_323_1.time_ <= var_326_16 + arg_326_0 and arg_323_1.var_.characterEffect1095ui_story == nil then
				arg_323_1.var_.characterEffect1095ui_story = var_326_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_17 = 0.200000002980232

			if var_326_16 <= arg_323_1.time_ and arg_323_1.time_ < var_326_16 + var_326_17 then
				local var_326_18 = (arg_323_1.time_ - var_326_16) / var_326_17

				if arg_323_1.var_.characterEffect1095ui_story then
					local var_326_19 = Mathf.Lerp(0, 0.5, var_326_18)

					arg_323_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1095ui_story.fillRatio = var_326_19
				end
			end

			if arg_323_1.time_ >= var_326_16 + var_326_17 and arg_323_1.time_ < var_326_16 + var_326_17 + arg_326_0 and arg_323_1.var_.characterEffect1095ui_story then
				local var_326_20 = 0.5

				arg_323_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1095ui_story.fillRatio = var_326_20
			end

			local var_326_21 = 0
			local var_326_22 = 0.775

			if var_326_21 < arg_323_1.time_ and arg_323_1.time_ <= var_326_21 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_23 = arg_323_1:FormatText(StoryNameCfg[264].name)

				arg_323_1.leftNameTxt_.text = var_326_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_24 = arg_323_1:GetWordFromCfg(411021078)
				local var_326_25 = arg_323_1:FormatText(var_326_24.content)

				arg_323_1.text_.text = var_326_25

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_26 = 31
				local var_326_27 = utf8.len(var_326_25)
				local var_326_28 = var_326_26 <= 0 and var_326_22 or var_326_22 * (var_326_27 / var_326_26)

				if var_326_28 > 0 and var_326_22 < var_326_28 then
					arg_323_1.talkMaxDuration = var_326_28

					if var_326_28 + var_326_21 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_28 + var_326_21
					end
				end

				arg_323_1.text_.text = var_326_25
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021078", "story_v_out_411021.awb") ~= 0 then
					local var_326_29 = manager.audio:GetVoiceLength("story_v_out_411021", "411021078", "story_v_out_411021.awb") / 1000

					if var_326_29 + var_326_21 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_29 + var_326_21
					end

					if var_326_24.prefab_name ~= "" and arg_323_1.actors_[var_326_24.prefab_name] ~= nil then
						local var_326_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_24.prefab_name].transform, "story_v_out_411021", "411021078", "story_v_out_411021.awb")

						arg_323_1:RecordAudio("411021078", var_326_30)
						arg_323_1:RecordAudio("411021078", var_326_30)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_411021", "411021078", "story_v_out_411021.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_411021", "411021078", "story_v_out_411021.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_31 = math.max(var_326_22, arg_323_1.talkMaxDuration)

			if var_326_21 <= arg_323_1.time_ and arg_323_1.time_ < var_326_21 + var_326_31 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_21) / var_326_31

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_21 + var_326_31 and arg_323_1.time_ < var_326_21 + var_326_31 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play411021079 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 411021079
		arg_327_1.duration_ = 4.533

		local var_327_0 = {
			zh = 3.666,
			ja = 4.533
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
				arg_327_0:Play411021080(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.5

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[264].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(411021079)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021079", "story_v_out_411021.awb") ~= 0 then
					local var_330_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021079", "story_v_out_411021.awb") / 1000

					if var_330_8 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_8 + var_330_0
					end

					if var_330_3.prefab_name ~= "" and arg_327_1.actors_[var_330_3.prefab_name] ~= nil then
						local var_330_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_3.prefab_name].transform, "story_v_out_411021", "411021079", "story_v_out_411021.awb")

						arg_327_1:RecordAudio("411021079", var_330_9)
						arg_327_1:RecordAudio("411021079", var_330_9)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_411021", "411021079", "story_v_out_411021.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_411021", "411021079", "story_v_out_411021.awb")
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
	Play411021080 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 411021080
		arg_331_1.duration_ = 3.633

		local var_331_0 = {
			zh = 2.166,
			ja = 3.633
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
				arg_331_0:Play411021081(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1095ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1095ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(0.7, -0.98, -6.1)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1095ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = arg_331_1.actors_["1095ui_story"]
			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 and arg_331_1.var_.characterEffect1095ui_story == nil then
				arg_331_1.var_.characterEffect1095ui_story = var_334_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_11 = 0.200000002980232

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_11 then
				local var_334_12 = (arg_331_1.time_ - var_334_10) / var_334_11

				if arg_331_1.var_.characterEffect1095ui_story then
					arg_331_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_10 + var_334_11 and arg_331_1.time_ < var_334_10 + var_334_11 + arg_334_0 and arg_331_1.var_.characterEffect1095ui_story then
				arg_331_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_334_13 = 0

			if var_334_13 < arg_331_1.time_ and arg_331_1.time_ <= var_334_13 + arg_334_0 then
				arg_331_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_334_14 = 0

			if var_334_14 < arg_331_1.time_ and arg_331_1.time_ <= var_334_14 + arg_334_0 then
				arg_331_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_334_15 = arg_331_1.actors_["10014ui_story"]
			local var_334_16 = 0

			if var_334_16 < arg_331_1.time_ and arg_331_1.time_ <= var_334_16 + arg_334_0 and arg_331_1.var_.characterEffect10014ui_story == nil then
				arg_331_1.var_.characterEffect10014ui_story = var_334_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_17 = 0.200000002980232

			if var_334_16 <= arg_331_1.time_ and arg_331_1.time_ < var_334_16 + var_334_17 then
				local var_334_18 = (arg_331_1.time_ - var_334_16) / var_334_17

				if arg_331_1.var_.characterEffect10014ui_story then
					local var_334_19 = Mathf.Lerp(0, 0.5, var_334_18)

					arg_331_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_331_1.var_.characterEffect10014ui_story.fillRatio = var_334_19
				end
			end

			if arg_331_1.time_ >= var_334_16 + var_334_17 and arg_331_1.time_ < var_334_16 + var_334_17 + arg_334_0 and arg_331_1.var_.characterEffect10014ui_story then
				local var_334_20 = 0.5

				arg_331_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_331_1.var_.characterEffect10014ui_story.fillRatio = var_334_20
			end

			local var_334_21 = 0
			local var_334_22 = 0.275

			if var_334_21 < arg_331_1.time_ and arg_331_1.time_ <= var_334_21 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_23 = arg_331_1:FormatText(StoryNameCfg[471].name)

				arg_331_1.leftNameTxt_.text = var_334_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_24 = arg_331_1:GetWordFromCfg(411021080)
				local var_334_25 = arg_331_1:FormatText(var_334_24.content)

				arg_331_1.text_.text = var_334_25

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_26 = 11
				local var_334_27 = utf8.len(var_334_25)
				local var_334_28 = var_334_26 <= 0 and var_334_22 or var_334_22 * (var_334_27 / var_334_26)

				if var_334_28 > 0 and var_334_22 < var_334_28 then
					arg_331_1.talkMaxDuration = var_334_28

					if var_334_28 + var_334_21 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_28 + var_334_21
					end
				end

				arg_331_1.text_.text = var_334_25
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021080", "story_v_out_411021.awb") ~= 0 then
					local var_334_29 = manager.audio:GetVoiceLength("story_v_out_411021", "411021080", "story_v_out_411021.awb") / 1000

					if var_334_29 + var_334_21 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_29 + var_334_21
					end

					if var_334_24.prefab_name ~= "" and arg_331_1.actors_[var_334_24.prefab_name] ~= nil then
						local var_334_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_24.prefab_name].transform, "story_v_out_411021", "411021080", "story_v_out_411021.awb")

						arg_331_1:RecordAudio("411021080", var_334_30)
						arg_331_1:RecordAudio("411021080", var_334_30)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_411021", "411021080", "story_v_out_411021.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_411021", "411021080", "story_v_out_411021.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_31 = math.max(var_334_22, arg_331_1.talkMaxDuration)

			if var_334_21 <= arg_331_1.time_ and arg_331_1.time_ < var_334_21 + var_334_31 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_21) / var_334_31

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_21 + var_334_31 and arg_331_1.time_ < var_334_21 + var_334_31 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play411021081 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 411021081
		arg_335_1.duration_ = 2.4

		local var_335_0 = {
			zh = 2.4,
			ja = 2.333
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
				arg_335_0:Play411021082(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1095ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1095ui_story == nil then
				arg_335_1.var_.characterEffect1095ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1095ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1095ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1095ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1095ui_story.fillRatio = var_338_5
			end

			local var_338_6 = arg_335_1.actors_["10014ui_story"]
			local var_338_7 = 0

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 and arg_335_1.var_.characterEffect10014ui_story == nil then
				arg_335_1.var_.characterEffect10014ui_story = var_338_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_8 = 0.200000002980232

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_8 then
				local var_338_9 = (arg_335_1.time_ - var_338_7) / var_338_8

				if arg_335_1.var_.characterEffect10014ui_story then
					arg_335_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_7 + var_338_8 and arg_335_1.time_ < var_338_7 + var_338_8 + arg_338_0 and arg_335_1.var_.characterEffect10014ui_story then
				arg_335_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_338_10 = 0
			local var_338_11 = 0.25

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_12 = arg_335_1:FormatText(StoryNameCfg[264].name)

				arg_335_1.leftNameTxt_.text = var_338_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_13 = arg_335_1:GetWordFromCfg(411021081)
				local var_338_14 = arg_335_1:FormatText(var_338_13.content)

				arg_335_1.text_.text = var_338_14

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_15 = 10
				local var_338_16 = utf8.len(var_338_14)
				local var_338_17 = var_338_15 <= 0 and var_338_11 or var_338_11 * (var_338_16 / var_338_15)

				if var_338_17 > 0 and var_338_11 < var_338_17 then
					arg_335_1.talkMaxDuration = var_338_17

					if var_338_17 + var_338_10 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_17 + var_338_10
					end
				end

				arg_335_1.text_.text = var_338_14
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021081", "story_v_out_411021.awb") ~= 0 then
					local var_338_18 = manager.audio:GetVoiceLength("story_v_out_411021", "411021081", "story_v_out_411021.awb") / 1000

					if var_338_18 + var_338_10 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_18 + var_338_10
					end

					if var_338_13.prefab_name ~= "" and arg_335_1.actors_[var_338_13.prefab_name] ~= nil then
						local var_338_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_13.prefab_name].transform, "story_v_out_411021", "411021081", "story_v_out_411021.awb")

						arg_335_1:RecordAudio("411021081", var_338_19)
						arg_335_1:RecordAudio("411021081", var_338_19)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_411021", "411021081", "story_v_out_411021.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_411021", "411021081", "story_v_out_411021.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_20 = math.max(var_338_11, arg_335_1.talkMaxDuration)

			if var_338_10 <= arg_335_1.time_ and arg_335_1.time_ < var_338_10 + var_338_20 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_10) / var_338_20

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_10 + var_338_20 and arg_335_1.time_ < var_338_10 + var_338_20 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play411021082 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 411021082
		arg_339_1.duration_ = 2.833

		local var_339_0 = {
			zh = 1.2,
			ja = 2.833
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
				arg_339_0:Play411021083(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["10014ui_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and arg_339_1.var_.characterEffect10014ui_story == nil then
				arg_339_1.var_.characterEffect10014ui_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.200000002980232

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect10014ui_story then
					local var_342_4 = Mathf.Lerp(0, 0.5, var_342_3)

					arg_339_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_339_1.var_.characterEffect10014ui_story.fillRatio = var_342_4
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and arg_339_1.var_.characterEffect10014ui_story then
				local var_342_5 = 0.5

				arg_339_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_339_1.var_.characterEffect10014ui_story.fillRatio = var_342_5
			end

			local var_342_6 = arg_339_1.actors_["1095ui_story"]
			local var_342_7 = 0

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 and arg_339_1.var_.characterEffect1095ui_story == nil then
				arg_339_1.var_.characterEffect1095ui_story = var_342_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_8 = 0.200000002980232

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_8 then
				local var_342_9 = (arg_339_1.time_ - var_342_7) / var_342_8

				if arg_339_1.var_.characterEffect1095ui_story then
					arg_339_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_7 + var_342_8 and arg_339_1.time_ < var_342_7 + var_342_8 + arg_342_0 and arg_339_1.var_.characterEffect1095ui_story then
				arg_339_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_342_10 = 0
			local var_342_11 = 0.125

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_12 = arg_339_1:FormatText(StoryNameCfg[471].name)

				arg_339_1.leftNameTxt_.text = var_342_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_13 = arg_339_1:GetWordFromCfg(411021082)
				local var_342_14 = arg_339_1:FormatText(var_342_13.content)

				arg_339_1.text_.text = var_342_14

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_15 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021082", "story_v_out_411021.awb") ~= 0 then
					local var_342_18 = manager.audio:GetVoiceLength("story_v_out_411021", "411021082", "story_v_out_411021.awb") / 1000

					if var_342_18 + var_342_10 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_18 + var_342_10
					end

					if var_342_13.prefab_name ~= "" and arg_339_1.actors_[var_342_13.prefab_name] ~= nil then
						local var_342_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_13.prefab_name].transform, "story_v_out_411021", "411021082", "story_v_out_411021.awb")

						arg_339_1:RecordAudio("411021082", var_342_19)
						arg_339_1:RecordAudio("411021082", var_342_19)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_411021", "411021082", "story_v_out_411021.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_411021", "411021082", "story_v_out_411021.awb")
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
	Play411021083 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 411021083
		arg_343_1.duration_ = 7.033

		local var_343_0 = {
			zh = 6.866,
			ja = 7.033
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
				arg_343_0:Play411021084(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["10014ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect10014ui_story == nil then
				arg_343_1.var_.characterEffect10014ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect10014ui_story then
					arg_343_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect10014ui_story then
				arg_343_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_346_4 = 0

			if var_346_4 < arg_343_1.time_ and arg_343_1.time_ <= var_346_4 + arg_346_0 then
				arg_343_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_2")
			end

			local var_346_5 = 0

			if var_346_5 < arg_343_1.time_ and arg_343_1.time_ <= var_346_5 + arg_346_0 then
				arg_343_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_346_6 = arg_343_1.actors_["1095ui_story"]
			local var_346_7 = 0

			if var_346_7 < arg_343_1.time_ and arg_343_1.time_ <= var_346_7 + arg_346_0 and arg_343_1.var_.characterEffect1095ui_story == nil then
				arg_343_1.var_.characterEffect1095ui_story = var_346_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_8 = 0.200000002980232

			if var_346_7 <= arg_343_1.time_ and arg_343_1.time_ < var_346_7 + var_346_8 then
				local var_346_9 = (arg_343_1.time_ - var_346_7) / var_346_8

				if arg_343_1.var_.characterEffect1095ui_story then
					local var_346_10 = Mathf.Lerp(0, 0.5, var_346_9)

					arg_343_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1095ui_story.fillRatio = var_346_10
				end
			end

			if arg_343_1.time_ >= var_346_7 + var_346_8 and arg_343_1.time_ < var_346_7 + var_346_8 + arg_346_0 and arg_343_1.var_.characterEffect1095ui_story then
				local var_346_11 = 0.5

				arg_343_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1095ui_story.fillRatio = var_346_11
			end

			local var_346_12 = 0
			local var_346_13 = 0.925

			if var_346_12 < arg_343_1.time_ and arg_343_1.time_ <= var_346_12 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_14 = arg_343_1:FormatText(StoryNameCfg[264].name)

				arg_343_1.leftNameTxt_.text = var_346_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_15 = arg_343_1:GetWordFromCfg(411021083)
				local var_346_16 = arg_343_1:FormatText(var_346_15.content)

				arg_343_1.text_.text = var_346_16

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_17 = 37
				local var_346_18 = utf8.len(var_346_16)
				local var_346_19 = var_346_17 <= 0 and var_346_13 or var_346_13 * (var_346_18 / var_346_17)

				if var_346_19 > 0 and var_346_13 < var_346_19 then
					arg_343_1.talkMaxDuration = var_346_19

					if var_346_19 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_19 + var_346_12
					end
				end

				arg_343_1.text_.text = var_346_16
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021083", "story_v_out_411021.awb") ~= 0 then
					local var_346_20 = manager.audio:GetVoiceLength("story_v_out_411021", "411021083", "story_v_out_411021.awb") / 1000

					if var_346_20 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_20 + var_346_12
					end

					if var_346_15.prefab_name ~= "" and arg_343_1.actors_[var_346_15.prefab_name] ~= nil then
						local var_346_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_15.prefab_name].transform, "story_v_out_411021", "411021083", "story_v_out_411021.awb")

						arg_343_1:RecordAudio("411021083", var_346_21)
						arg_343_1:RecordAudio("411021083", var_346_21)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_411021", "411021083", "story_v_out_411021.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_411021", "411021083", "story_v_out_411021.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_22 = math.max(var_346_13, arg_343_1.talkMaxDuration)

			if var_346_12 <= arg_343_1.time_ and arg_343_1.time_ < var_346_12 + var_346_22 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_12) / var_346_22

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_12 + var_346_22 and arg_343_1.time_ < var_346_12 + var_346_22 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play411021084 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 411021084
		arg_347_1.duration_ = 4.8

		local var_347_0 = {
			zh = 4.8,
			ja = 4.066
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
			arg_347_1.auto_ = false
		end

		function arg_347_1.playNext_(arg_349_0)
			arg_347_1.onStoryFinished_()
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 0.475

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[264].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(411021084)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 19
				local var_350_6 = utf8.len(var_350_4)
				local var_350_7 = var_350_5 <= 0 and var_350_1 or var_350_1 * (var_350_6 / var_350_5)

				if var_350_7 > 0 and var_350_1 < var_350_7 then
					arg_347_1.talkMaxDuration = var_350_7

					if var_350_7 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_7 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_4
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411021", "411021084", "story_v_out_411021.awb") ~= 0 then
					local var_350_8 = manager.audio:GetVoiceLength("story_v_out_411021", "411021084", "story_v_out_411021.awb") / 1000

					if var_350_8 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_8 + var_350_0
					end

					if var_350_3.prefab_name ~= "" and arg_347_1.actors_[var_350_3.prefab_name] ~= nil then
						local var_350_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_3.prefab_name].transform, "story_v_out_411021", "411021084", "story_v_out_411021.awb")

						arg_347_1:RecordAudio("411021084", var_350_9)
						arg_347_1:RecordAudio("411021084", var_350_9)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_411021", "411021084", "story_v_out_411021.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_411021", "411021084", "story_v_out_411021.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_10 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_10 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_10

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_10 and arg_347_1.time_ < var_350_0 + var_350_10 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11m",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ML0502",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ML0501"
	},
	voices = {
		"story_v_out_411021.awb"
	}
}
