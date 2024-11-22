return {
	Play411201001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 411201001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play411201002(arg_1_1)
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

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_5_story_2", "bgm_activity_1_5_story_2", "bgm_activity_1_5_story_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.325

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

				local var_4_33 = arg_1_1:GetWordFromCfg(411201001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 13
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
	Play411201002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 411201002
		arg_7_1.duration_ = 2.666

		local var_7_0 = {
			zh = 2.133,
			ja = 2.666
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
				arg_7_0:Play411201003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.35

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[718].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(411201002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201002", "story_v_out_411201.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201002", "story_v_out_411201.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_411201", "411201002", "story_v_out_411201.awb")

						arg_7_1:RecordAudio("411201002", var_10_9)
						arg_7_1:RecordAudio("411201002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_411201", "411201002", "story_v_out_411201.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_411201", "411201002", "story_v_out_411201.awb")
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
	Play411201003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 411201003
		arg_11_1.duration_ = 5.366

		local var_11_0 = {
			zh = 5.366,
			ja = 2.133
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
				arg_11_0:Play411201004(arg_11_1)
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
			local var_14_20 = 0.775

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

				local var_14_22 = arg_11_1:GetWordFromCfg(411201003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201003", "story_v_out_411201.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_411201", "411201003", "story_v_out_411201.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_411201", "411201003", "story_v_out_411201.awb")

						arg_11_1:RecordAudio("411201003", var_14_28)
						arg_11_1:RecordAudio("411201003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_411201", "411201003", "story_v_out_411201.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_411201", "411201003", "story_v_out_411201.awb")
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
	Play411201004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 411201004
		arg_15_1.duration_ = 3.866

		local var_15_0 = {
			zh = 3.766,
			ja = 3.866
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
				arg_15_0:Play411201005(arg_15_1)
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
					arg_15_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1095ui_story then
				arg_15_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_18_4 = 0
			local var_18_5 = 0.425

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_6 = arg_15_1:FormatText(StoryNameCfg[471].name)

				arg_15_1.leftNameTxt_.text = var_18_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_7 = arg_15_1:GetWordFromCfg(411201004)
				local var_18_8 = arg_15_1:FormatText(var_18_7.content)

				arg_15_1.text_.text = var_18_8

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_9 = 17
				local var_18_10 = utf8.len(var_18_8)
				local var_18_11 = var_18_9 <= 0 and var_18_5 or var_18_5 * (var_18_10 / var_18_9)

				if var_18_11 > 0 and var_18_5 < var_18_11 then
					arg_15_1.talkMaxDuration = var_18_11

					if var_18_11 + var_18_4 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_11 + var_18_4
					end
				end

				arg_15_1.text_.text = var_18_8
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201004", "story_v_out_411201.awb") ~= 0 then
					local var_18_12 = manager.audio:GetVoiceLength("story_v_out_411201", "411201004", "story_v_out_411201.awb") / 1000

					if var_18_12 + var_18_4 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_12 + var_18_4
					end

					if var_18_7.prefab_name ~= "" and arg_15_1.actors_[var_18_7.prefab_name] ~= nil then
						local var_18_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_7.prefab_name].transform, "story_v_out_411201", "411201004", "story_v_out_411201.awb")

						arg_15_1:RecordAudio("411201004", var_18_13)
						arg_15_1:RecordAudio("411201004", var_18_13)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_411201", "411201004", "story_v_out_411201.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_411201", "411201004", "story_v_out_411201.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_5, arg_15_1.talkMaxDuration)

			if var_18_4 <= arg_15_1.time_ and arg_15_1.time_ < var_18_4 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_4) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_4 + var_18_14 and arg_15_1.time_ < var_18_4 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play411201005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 411201005
		arg_19_1.duration_ = 1.833

		local var_19_0 = {
			zh = 1.833,
			ja = 1.333
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
				arg_19_0:Play411201006(arg_19_1)
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
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1095ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1095ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.15

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[718].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(411201005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201005", "story_v_out_411201.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_411201", "411201005", "story_v_out_411201.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_411201", "411201005", "story_v_out_411201.awb")

						arg_19_1:RecordAudio("411201005", var_22_15)
						arg_19_1:RecordAudio("411201005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_411201", "411201005", "story_v_out_411201.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_411201", "411201005", "story_v_out_411201.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play411201006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 411201006
		arg_23_1.duration_ = 3.2

		local var_23_0 = {
			zh = 3.2,
			ja = 2.566
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
				arg_23_0:Play411201007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.425

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[718].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(411201006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 17
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201006", "story_v_out_411201.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201006", "story_v_out_411201.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_411201", "411201006", "story_v_out_411201.awb")

						arg_23_1:RecordAudio("411201006", var_26_9)
						arg_23_1:RecordAudio("411201006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_411201", "411201006", "story_v_out_411201.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_411201", "411201006", "story_v_out_411201.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play411201007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 411201007
		arg_27_1.duration_ = 2.766

		local var_27_0 = {
			zh = 2.5,
			ja = 2.766
		}
		local var_27_1 = manager.audio:GetLocalizationFlag()

		if var_27_0[var_27_1] ~= nil then
			arg_27_1.duration_ = var_27_0[var_27_1]
		end

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play411201008(arg_27_1)
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
				arg_27_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_30_6 = 0
			local var_30_7 = 0.3

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

				local var_30_9 = arg_27_1:GetWordFromCfg(411201007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201007", "story_v_out_411201.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_411201", "411201007", "story_v_out_411201.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_411201", "411201007", "story_v_out_411201.awb")

						arg_27_1:RecordAudio("411201007", var_30_15)
						arg_27_1:RecordAudio("411201007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_411201", "411201007", "story_v_out_411201.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_411201", "411201007", "story_v_out_411201.awb")
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
	Play411201008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 411201008
		arg_31_1.duration_ = 6.533

		local var_31_0 = {
			zh = 3.766,
			ja = 6.533
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
				arg_31_0:Play411201009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.55

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[471].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(411201008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201008", "story_v_out_411201.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201008", "story_v_out_411201.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_411201", "411201008", "story_v_out_411201.awb")

						arg_31_1:RecordAudio("411201008", var_34_9)
						arg_31_1:RecordAudio("411201008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_411201", "411201008", "story_v_out_411201.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_411201", "411201008", "story_v_out_411201.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play411201009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 411201009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play411201010(arg_35_1)
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
				local var_38_4 = Vector3.New(0, 100, 0)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1095ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, 100, 0)

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
					local var_38_13 = Mathf.Lerp(0, 0.5, var_38_12)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_13
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_14 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_14
			end

			local var_38_15 = 0
			local var_38_16 = 1

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_17 = arg_35_1:GetWordFromCfg(411201009)
				local var_38_18 = arg_35_1:FormatText(var_38_17.content)

				arg_35_1.text_.text = var_38_18

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_19 = 40
				local var_38_20 = utf8.len(var_38_18)
				local var_38_21 = var_38_19 <= 0 and var_38_16 or var_38_16 * (var_38_20 / var_38_19)

				if var_38_21 > 0 and var_38_16 < var_38_21 then
					arg_35_1.talkMaxDuration = var_38_21

					if var_38_21 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_21 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_18
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_22 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_22 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_22

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_22 and arg_35_1.time_ < var_38_15 + var_38_22 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play411201010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 411201010
		arg_39_1.duration_ = 6.133

		local var_39_0 = {
			zh = 6.133,
			ja = 2.5
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
				arg_39_0:Play411201011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1095ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1095ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, -0.98, -6.1)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1095ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1095ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1095ui_story then
					arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_15 = 0
			local var_42_16 = 0.75

			if var_42_15 < arg_39_1.time_ and arg_39_1.time_ <= var_42_15 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_17 = arg_39_1:FormatText(StoryNameCfg[471].name)

				arg_39_1.leftNameTxt_.text = var_42_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_18 = arg_39_1:GetWordFromCfg(411201010)
				local var_42_19 = arg_39_1:FormatText(var_42_18.content)

				arg_39_1.text_.text = var_42_19

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_20 = 30
				local var_42_21 = utf8.len(var_42_19)
				local var_42_22 = var_42_20 <= 0 and var_42_16 or var_42_16 * (var_42_21 / var_42_20)

				if var_42_22 > 0 and var_42_16 < var_42_22 then
					arg_39_1.talkMaxDuration = var_42_22

					if var_42_22 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_22 + var_42_15
					end
				end

				arg_39_1.text_.text = var_42_19
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201010", "story_v_out_411201.awb") ~= 0 then
					local var_42_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201010", "story_v_out_411201.awb") / 1000

					if var_42_23 + var_42_15 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_23 + var_42_15
					end

					if var_42_18.prefab_name ~= "" and arg_39_1.actors_[var_42_18.prefab_name] ~= nil then
						local var_42_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_18.prefab_name].transform, "story_v_out_411201", "411201010", "story_v_out_411201.awb")

						arg_39_1:RecordAudio("411201010", var_42_24)
						arg_39_1:RecordAudio("411201010", var_42_24)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_411201", "411201010", "story_v_out_411201.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_411201", "411201010", "story_v_out_411201.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_25 = math.max(var_42_16, arg_39_1.talkMaxDuration)

			if var_42_15 <= arg_39_1.time_ and arg_39_1.time_ < var_42_15 + var_42_25 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_15) / var_42_25

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_15 + var_42_25 and arg_39_1.time_ < var_42_15 + var_42_25 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play411201011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 411201011
		arg_43_1.duration_ = 4.166

		local var_43_0 = {
			zh = 4.166,
			ja = 1.866
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
				arg_43_0:Play411201012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.525

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[471].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(411201011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 21
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201011", "story_v_out_411201.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201011", "story_v_out_411201.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_411201", "411201011", "story_v_out_411201.awb")

						arg_43_1:RecordAudio("411201011", var_46_9)
						arg_43_1:RecordAudio("411201011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_411201", "411201011", "story_v_out_411201.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_411201", "411201011", "story_v_out_411201.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play411201012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 411201012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play411201013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1095ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story == nil then
				arg_47_1.var_.characterEffect1095ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1095ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 1.5

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

				local var_50_8 = arg_47_1:GetWordFromCfg(411201012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 60
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
	Play411201013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 411201013
		arg_51_1.duration_ = 4.866

		local var_51_0 = {
			zh = 4.766,
			ja = 4.866
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
				arg_51_0:Play411201014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1095ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story == nil then
				arg_51_1.var_.characterEffect1095ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1095ui_story then
					arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story then
				arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_54_4 = 0
			local var_54_5 = 0.475

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_6 = arg_51_1:FormatText(StoryNameCfg[471].name)

				arg_51_1.leftNameTxt_.text = var_54_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_7 = arg_51_1:GetWordFromCfg(411201013)
				local var_54_8 = arg_51_1:FormatText(var_54_7.content)

				arg_51_1.text_.text = var_54_8

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_9 = 19
				local var_54_10 = utf8.len(var_54_8)
				local var_54_11 = var_54_9 <= 0 and var_54_5 or var_54_5 * (var_54_10 / var_54_9)

				if var_54_11 > 0 and var_54_5 < var_54_11 then
					arg_51_1.talkMaxDuration = var_54_11

					if var_54_11 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_11 + var_54_4
					end
				end

				arg_51_1.text_.text = var_54_8
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201013", "story_v_out_411201.awb") ~= 0 then
					local var_54_12 = manager.audio:GetVoiceLength("story_v_out_411201", "411201013", "story_v_out_411201.awb") / 1000

					if var_54_12 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_4
					end

					if var_54_7.prefab_name ~= "" and arg_51_1.actors_[var_54_7.prefab_name] ~= nil then
						local var_54_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_7.prefab_name].transform, "story_v_out_411201", "411201013", "story_v_out_411201.awb")

						arg_51_1:RecordAudio("411201013", var_54_13)
						arg_51_1:RecordAudio("411201013", var_54_13)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_411201", "411201013", "story_v_out_411201.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_411201", "411201013", "story_v_out_411201.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_14 = math.max(var_54_5, arg_51_1.talkMaxDuration)

			if var_54_4 <= arg_51_1.time_ and arg_51_1.time_ < var_54_4 + var_54_14 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_4) / var_54_14

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_4 + var_54_14 and arg_51_1.time_ < var_54_4 + var_54_14 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play411201014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 411201014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play411201015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1095ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1095ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, 100, 0)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1095ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, 100, 0)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1095ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story == nil then
				arg_55_1.var_.characterEffect1095ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1095ui_story then
					local var_58_13 = Mathf.Lerp(0, 0.5, var_58_12)

					arg_55_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1095ui_story.fillRatio = var_58_13
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story then
				local var_58_14 = 0.5

				arg_55_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1095ui_story.fillRatio = var_58_14
			end

			local var_58_15 = 0
			local var_58_16 = 0.8

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_17 = arg_55_1:GetWordFromCfg(411201014)
				local var_58_18 = arg_55_1:FormatText(var_58_17.content)

				arg_55_1.text_.text = var_58_18

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_19 = 32
				local var_58_20 = utf8.len(var_58_18)
				local var_58_21 = var_58_19 <= 0 and var_58_16 or var_58_16 * (var_58_20 / var_58_19)

				if var_58_21 > 0 and var_58_16 < var_58_21 then
					arg_55_1.talkMaxDuration = var_58_21

					if var_58_21 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_18
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_22 and arg_55_1.time_ < var_58_15 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play411201015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 411201015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play411201016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.775

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(411201015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 31
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play411201016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 411201016
		arg_63_1.duration_ = 3.366

		local var_63_0 = {
			zh = 3.366,
			ja = 3
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
				arg_63_0:Play411201017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "1024ui_story"

			if arg_63_1.actors_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(Asset.Load("Char/" .. var_66_0), arg_63_1.stage_.transform)

				var_66_1.name = var_66_0
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_0] = var_66_1

				local var_66_2 = var_66_1:GetComponentInChildren(typeof(CharacterEffect))

				var_66_2.enabled = true

				local var_66_3 = GameObjectTools.GetOrAddComponent(var_66_1, typeof(DynamicBoneHelper))

				if var_66_3 then
					var_66_3:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_2.transform, false)

				arg_63_1.var_[var_66_0 .. "Animator"] = var_66_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_0 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_0 .. "LipSync"] = var_66_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_4 = arg_63_1.actors_["1024ui_story"].transform
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.var_.moveOldPos1024ui_story = var_66_4.localPosition
			end

			local var_66_6 = 0.001

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6
				local var_66_8 = Vector3.New(0, -1, -6.05)

				var_66_4.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1024ui_story, var_66_8, var_66_7)

				local var_66_9 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_9.x, var_66_9.y, var_66_9.z)

				local var_66_10 = var_66_4.localEulerAngles

				var_66_10.z = 0
				var_66_10.x = 0
				var_66_4.localEulerAngles = var_66_10
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 then
				var_66_4.localPosition = Vector3.New(0, -1, -6.05)

				local var_66_11 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_11.x, var_66_11.y, var_66_11.z)

				local var_66_12 = var_66_4.localEulerAngles

				var_66_12.z = 0
				var_66_12.x = 0
				var_66_4.localEulerAngles = var_66_12
			end

			local var_66_13 = arg_63_1.actors_["1024ui_story"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.characterEffect1024ui_story == nil then
				arg_63_1.var_.characterEffect1024ui_story = var_66_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_15 = 0.200000002980232

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.characterEffect1024ui_story then
					arg_63_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.characterEffect1024ui_story then
				arg_63_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_66_17 = 0

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				arg_63_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_66_18 = 0

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_19 = arg_63_1.actors_["1024ui_story"]
			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				if arg_63_1.var_.characterEffect1024ui_story == nil then
					arg_63_1.var_.characterEffect1024ui_story = var_66_19:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_66_21 = arg_63_1.var_.characterEffect1024ui_story

				var_66_21.imageEffect:turnOff()

				var_66_21.interferenceEffect.enabled = true
				var_66_21.interferenceEffect.noise = 0.01
				var_66_21.interferenceEffect.simTimeScale = 1
				var_66_21.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_66_22 = arg_63_1.actors_["1024ui_story"]
			local var_66_23 = 0
			local var_66_24 = 2

			if var_66_23 < arg_63_1.time_ and arg_63_1.time_ <= var_66_23 + arg_66_0 then
				if arg_63_1.var_.characterEffect1024ui_story == nil then
					arg_63_1.var_.characterEffect1024ui_story = var_66_22:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_63_1.var_.characterEffect1024ui_story.imageEffect:turnOn(false)
			end

			local var_66_25 = 0
			local var_66_26 = 0.45

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_27 = arg_63_1:FormatText(StoryNameCfg[265].name)

				arg_63_1.leftNameTxt_.text = var_66_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_28 = arg_63_1:GetWordFromCfg(411201016)
				local var_66_29 = arg_63_1:FormatText(var_66_28.content)

				arg_63_1.text_.text = var_66_29

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_30 = 18
				local var_66_31 = utf8.len(var_66_29)
				local var_66_32 = var_66_30 <= 0 and var_66_26 or var_66_26 * (var_66_31 / var_66_30)

				if var_66_32 > 0 and var_66_26 < var_66_32 then
					arg_63_1.talkMaxDuration = var_66_32

					if var_66_32 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_32 + var_66_25
					end
				end

				arg_63_1.text_.text = var_66_29
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201016", "story_v_out_411201.awb") ~= 0 then
					local var_66_33 = manager.audio:GetVoiceLength("story_v_out_411201", "411201016", "story_v_out_411201.awb") / 1000

					if var_66_33 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_33 + var_66_25
					end

					if var_66_28.prefab_name ~= "" and arg_63_1.actors_[var_66_28.prefab_name] ~= nil then
						local var_66_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_28.prefab_name].transform, "story_v_out_411201", "411201016", "story_v_out_411201.awb")

						arg_63_1:RecordAudio("411201016", var_66_34)
						arg_63_1:RecordAudio("411201016", var_66_34)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_411201", "411201016", "story_v_out_411201.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_411201", "411201016", "story_v_out_411201.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_35 = math.max(var_66_26, arg_63_1.talkMaxDuration)

			if var_66_25 <= arg_63_1.time_ and arg_63_1.time_ < var_66_25 + var_66_35 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_25) / var_66_35

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_25 + var_66_35 and arg_63_1.time_ < var_66_25 + var_66_35 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play411201017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 411201017
		arg_67_1.duration_ = 5.333

		local var_67_0 = {
			zh = 4.4,
			ja = 5.333
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
				arg_67_0:Play411201018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1024ui_story"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1024ui_story = var_70_0.localPosition
			end

			local var_70_2 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2
				local var_70_4 = Vector3.New(0, 100, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1024ui_story, var_70_4, var_70_3)

				local var_70_5 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_5.x, var_70_5.y, var_70_5.z)

				local var_70_6 = var_70_0.localEulerAngles

				var_70_6.z = 0
				var_70_6.x = 0
				var_70_0.localEulerAngles = var_70_6
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, 100, 0)

				local var_70_7 = manager.ui.mainCamera.transform.position - var_70_0.position

				var_70_0.forward = Vector3.New(var_70_7.x, var_70_7.y, var_70_7.z)

				local var_70_8 = var_70_0.localEulerAngles

				var_70_8.z = 0
				var_70_8.x = 0
				var_70_0.localEulerAngles = var_70_8
			end

			local var_70_9 = arg_67_1.actors_["1024ui_story"]
			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 and arg_67_1.var_.characterEffect1024ui_story == nil then
				arg_67_1.var_.characterEffect1024ui_story = var_70_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_11 = 0.200000002980232

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_11 then
				local var_70_12 = (arg_67_1.time_ - var_70_10) / var_70_11

				if arg_67_1.var_.characterEffect1024ui_story then
					local var_70_13 = Mathf.Lerp(0, 0.5, var_70_12)

					arg_67_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1024ui_story.fillRatio = var_70_13
				end
			end

			if arg_67_1.time_ >= var_70_10 + var_70_11 and arg_67_1.time_ < var_70_10 + var_70_11 + arg_70_0 and arg_67_1.var_.characterEffect1024ui_story then
				local var_70_14 = 0.5

				arg_67_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1024ui_story.fillRatio = var_70_14
			end

			local var_70_15 = "10014ui_story"

			if arg_67_1.actors_[var_70_15] == nil then
				local var_70_16 = Object.Instantiate(Asset.Load("Char/" .. var_70_15), arg_67_1.stage_.transform)

				var_70_16.name = var_70_15
				var_70_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_15] = var_70_16

				local var_70_17 = var_70_16:GetComponentInChildren(typeof(CharacterEffect))

				var_70_17.enabled = true

				local var_70_18 = GameObjectTools.GetOrAddComponent(var_70_16, typeof(DynamicBoneHelper))

				if var_70_18 then
					var_70_18:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_17.transform, false)

				arg_67_1.var_[var_70_15 .. "Animator"] = var_70_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_15 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_15 .. "LipSync"] = var_70_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_19 = arg_67_1.actors_["10014ui_story"].transform
			local var_70_20 = 0

			if var_70_20 < arg_67_1.time_ and arg_67_1.time_ <= var_70_20 + arg_70_0 then
				arg_67_1.var_.moveOldPos10014ui_story = var_70_19.localPosition
			end

			local var_70_21 = 0.001

			if var_70_20 <= arg_67_1.time_ and arg_67_1.time_ < var_70_20 + var_70_21 then
				local var_70_22 = (arg_67_1.time_ - var_70_20) / var_70_21
				local var_70_23 = Vector3.New(0, -1.06, -6.2)

				var_70_19.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10014ui_story, var_70_23, var_70_22)

				local var_70_24 = manager.ui.mainCamera.transform.position - var_70_19.position

				var_70_19.forward = Vector3.New(var_70_24.x, var_70_24.y, var_70_24.z)

				local var_70_25 = var_70_19.localEulerAngles

				var_70_25.z = 0
				var_70_25.x = 0
				var_70_19.localEulerAngles = var_70_25
			end

			if arg_67_1.time_ >= var_70_20 + var_70_21 and arg_67_1.time_ < var_70_20 + var_70_21 + arg_70_0 then
				var_70_19.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_70_26 = manager.ui.mainCamera.transform.position - var_70_19.position

				var_70_19.forward = Vector3.New(var_70_26.x, var_70_26.y, var_70_26.z)

				local var_70_27 = var_70_19.localEulerAngles

				var_70_27.z = 0
				var_70_27.x = 0
				var_70_19.localEulerAngles = var_70_27
			end

			local var_70_28 = arg_67_1.actors_["10014ui_story"]
			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 and arg_67_1.var_.characterEffect10014ui_story == nil then
				arg_67_1.var_.characterEffect10014ui_story = var_70_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_30 = 0.200000002980232

			if var_70_29 <= arg_67_1.time_ and arg_67_1.time_ < var_70_29 + var_70_30 then
				local var_70_31 = (arg_67_1.time_ - var_70_29) / var_70_30

				if arg_67_1.var_.characterEffect10014ui_story then
					arg_67_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_29 + var_70_30 and arg_67_1.time_ < var_70_29 + var_70_30 + arg_70_0 and arg_67_1.var_.characterEffect10014ui_story then
				arg_67_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_70_32 = 0

			if var_70_32 < arg_67_1.time_ and arg_67_1.time_ <= var_70_32 + arg_70_0 then
				arg_67_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_70_33 = 0

			if var_70_33 < arg_67_1.time_ and arg_67_1.time_ <= var_70_33 + arg_70_0 then
				arg_67_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_34 = arg_67_1.actors_["10014ui_story"]
			local var_70_35 = 0

			if var_70_35 < arg_67_1.time_ and arg_67_1.time_ <= var_70_35 + arg_70_0 then
				if arg_67_1.var_.characterEffect10014ui_story == nil then
					arg_67_1.var_.characterEffect10014ui_story = var_70_34:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_70_36 = arg_67_1.var_.characterEffect10014ui_story

				var_70_36.imageEffect:turnOn(false)

				var_70_36.interferenceEffect.enabled = true
				var_70_36.interferenceEffect.noise = 0.01
				var_70_36.interferenceEffect.simTimeScale = 1
				var_70_36.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_70_37 = arg_67_1.actors_["10014ui_story"]
			local var_70_38 = 0
			local var_70_39 = 2

			if var_70_38 < arg_67_1.time_ and arg_67_1.time_ <= var_70_38 + arg_70_0 then
				if arg_67_1.var_.characterEffect10014ui_story == nil then
					arg_67_1.var_.characterEffect10014ui_story = var_70_37:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_67_1.var_.characterEffect10014ui_story.imageEffect:turnOn(false)
			end

			local var_70_40 = 0
			local var_70_41 = 0.525

			if var_70_40 < arg_67_1.time_ and arg_67_1.time_ <= var_70_40 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_42 = arg_67_1:FormatText(StoryNameCfg[264].name)

				arg_67_1.leftNameTxt_.text = var_70_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_43 = arg_67_1:GetWordFromCfg(411201017)
				local var_70_44 = arg_67_1:FormatText(var_70_43.content)

				arg_67_1.text_.text = var_70_44

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_45 = 21
				local var_70_46 = utf8.len(var_70_44)
				local var_70_47 = var_70_45 <= 0 and var_70_41 or var_70_41 * (var_70_46 / var_70_45)

				if var_70_47 > 0 and var_70_41 < var_70_47 then
					arg_67_1.talkMaxDuration = var_70_47

					if var_70_47 + var_70_40 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_47 + var_70_40
					end
				end

				arg_67_1.text_.text = var_70_44
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201017", "story_v_out_411201.awb") ~= 0 then
					local var_70_48 = manager.audio:GetVoiceLength("story_v_out_411201", "411201017", "story_v_out_411201.awb") / 1000

					if var_70_48 + var_70_40 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_48 + var_70_40
					end

					if var_70_43.prefab_name ~= "" and arg_67_1.actors_[var_70_43.prefab_name] ~= nil then
						local var_70_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_43.prefab_name].transform, "story_v_out_411201", "411201017", "story_v_out_411201.awb")

						arg_67_1:RecordAudio("411201017", var_70_49)
						arg_67_1:RecordAudio("411201017", var_70_49)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_411201", "411201017", "story_v_out_411201.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_411201", "411201017", "story_v_out_411201.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_50 = math.max(var_70_41, arg_67_1.talkMaxDuration)

			if var_70_40 <= arg_67_1.time_ and arg_67_1.time_ < var_70_40 + var_70_50 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_40) / var_70_50

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_40 + var_70_50 and arg_67_1.time_ < var_70_40 + var_70_50 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play411201018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 411201018
		arg_71_1.duration_ = 5.3

		local var_71_0 = {
			zh = 3.833,
			ja = 5.3
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
				arg_71_0:Play411201019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1024ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1024ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(-0.7, -1, -6.05)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1024ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-0.7, -1, -6.05)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["1024ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect1024ui_story == nil then
				arg_71_1.var_.characterEffect1024ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect1024ui_story then
					arg_71_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect1024ui_story then
				arg_71_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_74_15 = arg_71_1.actors_["10014ui_story"].transform
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.var_.moveOldPos10014ui_story = var_74_15.localPosition
			end

			local var_74_17 = 0.001

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17
				local var_74_19 = Vector3.New(0.7, -1.06, -6.2)

				var_74_15.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10014ui_story, var_74_19, var_74_18)

				local var_74_20 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_20.x, var_74_20.y, var_74_20.z)

				local var_74_21 = var_74_15.localEulerAngles

				var_74_21.z = 0
				var_74_21.x = 0
				var_74_15.localEulerAngles = var_74_21
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				var_74_15.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_74_22 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_22.x, var_74_22.y, var_74_22.z)

				local var_74_23 = var_74_15.localEulerAngles

				var_74_23.z = 0
				var_74_23.x = 0
				var_74_15.localEulerAngles = var_74_23
			end

			local var_74_24 = arg_71_1.actors_["10014ui_story"]
			local var_74_25 = 0

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 and arg_71_1.var_.characterEffect10014ui_story == nil then
				arg_71_1.var_.characterEffect10014ui_story = var_74_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_26 = 0.200000002980232

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				local var_74_27 = (arg_71_1.time_ - var_74_25) / var_74_26

				if arg_71_1.var_.characterEffect10014ui_story then
					local var_74_28 = Mathf.Lerp(0, 0.5, var_74_27)

					arg_71_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_71_1.var_.characterEffect10014ui_story.fillRatio = var_74_28
				end
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 and arg_71_1.var_.characterEffect10014ui_story then
				local var_74_29 = 0.5

				arg_71_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_71_1.var_.characterEffect10014ui_story.fillRatio = var_74_29
			end

			local var_74_30 = 0
			local var_74_31 = 0.475

			if var_74_30 < arg_71_1.time_ and arg_71_1.time_ <= var_74_30 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_32 = arg_71_1:FormatText(StoryNameCfg[265].name)

				arg_71_1.leftNameTxt_.text = var_74_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_33 = arg_71_1:GetWordFromCfg(411201018)
				local var_74_34 = arg_71_1:FormatText(var_74_33.content)

				arg_71_1.text_.text = var_74_34

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_35 = 19
				local var_74_36 = utf8.len(var_74_34)
				local var_74_37 = var_74_35 <= 0 and var_74_31 or var_74_31 * (var_74_36 / var_74_35)

				if var_74_37 > 0 and var_74_31 < var_74_37 then
					arg_71_1.talkMaxDuration = var_74_37

					if var_74_37 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_37 + var_74_30
					end
				end

				arg_71_1.text_.text = var_74_34
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201018", "story_v_out_411201.awb") ~= 0 then
					local var_74_38 = manager.audio:GetVoiceLength("story_v_out_411201", "411201018", "story_v_out_411201.awb") / 1000

					if var_74_38 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_30
					end

					if var_74_33.prefab_name ~= "" and arg_71_1.actors_[var_74_33.prefab_name] ~= nil then
						local var_74_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_33.prefab_name].transform, "story_v_out_411201", "411201018", "story_v_out_411201.awb")

						arg_71_1:RecordAudio("411201018", var_74_39)
						arg_71_1:RecordAudio("411201018", var_74_39)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_411201", "411201018", "story_v_out_411201.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_411201", "411201018", "story_v_out_411201.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_40 = math.max(var_74_31, arg_71_1.talkMaxDuration)

			if var_74_30 <= arg_71_1.time_ and arg_71_1.time_ < var_74_30 + var_74_40 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_30) / var_74_40

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_30 + var_74_40 and arg_71_1.time_ < var_74_30 + var_74_40 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play411201019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 411201019
		arg_75_1.duration_ = 4.066

		local var_75_0 = {
			zh = 4.066,
			ja = 2.9
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
				arg_75_0:Play411201020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1024ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1024ui_story == nil then
				arg_75_1.var_.characterEffect1024ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1024ui_story then
					local var_78_4 = Mathf.Lerp(0, 0.5, var_78_3)

					arg_75_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1024ui_story.fillRatio = var_78_4
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1024ui_story then
				local var_78_5 = 0.5

				arg_75_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1024ui_story.fillRatio = var_78_5
			end

			local var_78_6 = arg_75_1.actors_["10014ui_story"]
			local var_78_7 = 0

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 and arg_75_1.var_.characterEffect10014ui_story == nil then
				arg_75_1.var_.characterEffect10014ui_story = var_78_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_8 = 0.200000002980232

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_8 then
				local var_78_9 = (arg_75_1.time_ - var_78_7) / var_78_8

				if arg_75_1.var_.characterEffect10014ui_story then
					arg_75_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_7 + var_78_8 and arg_75_1.time_ < var_78_7 + var_78_8 + arg_78_0 and arg_75_1.var_.characterEffect10014ui_story then
				arg_75_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_1")
			end

			local var_78_11 = 0
			local var_78_12 = 0.4

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_13 = arg_75_1:FormatText(StoryNameCfg[264].name)

				arg_75_1.leftNameTxt_.text = var_78_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_14 = arg_75_1:GetWordFromCfg(411201019)
				local var_78_15 = arg_75_1:FormatText(var_78_14.content)

				arg_75_1.text_.text = var_78_15

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_16 = 16
				local var_78_17 = utf8.len(var_78_15)
				local var_78_18 = var_78_16 <= 0 and var_78_12 or var_78_12 * (var_78_17 / var_78_16)

				if var_78_18 > 0 and var_78_12 < var_78_18 then
					arg_75_1.talkMaxDuration = var_78_18

					if var_78_18 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_11
					end
				end

				arg_75_1.text_.text = var_78_15
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201019", "story_v_out_411201.awb") ~= 0 then
					local var_78_19 = manager.audio:GetVoiceLength("story_v_out_411201", "411201019", "story_v_out_411201.awb") / 1000

					if var_78_19 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_11
					end

					if var_78_14.prefab_name ~= "" and arg_75_1.actors_[var_78_14.prefab_name] ~= nil then
						local var_78_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_14.prefab_name].transform, "story_v_out_411201", "411201019", "story_v_out_411201.awb")

						arg_75_1:RecordAudio("411201019", var_78_20)
						arg_75_1:RecordAudio("411201019", var_78_20)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_411201", "411201019", "story_v_out_411201.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_411201", "411201019", "story_v_out_411201.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_21 = math.max(var_78_12, arg_75_1.talkMaxDuration)

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_21 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_11) / var_78_21

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_11 + var_78_21 and arg_75_1.time_ < var_78_11 + var_78_21 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play411201020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 411201020
		arg_79_1.duration_ = 5.333

		local var_79_0 = {
			zh = 3,
			ja = 5.333
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
				arg_79_0:Play411201021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1024ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1024ui_story == nil then
				arg_79_1.var_.characterEffect1024ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1024ui_story then
					arg_79_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1024ui_story then
				arg_79_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["10014ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect10014ui_story == nil then
				arg_79_1.var_.characterEffect10014ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.200000002980232

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect10014ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10014ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect10014ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10014ui_story.fillRatio = var_82_9
			end

			local var_82_10 = 0
			local var_82_11 = 0.375

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_12 = arg_79_1:FormatText(StoryNameCfg[265].name)

				arg_79_1.leftNameTxt_.text = var_82_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_13 = arg_79_1:GetWordFromCfg(411201020)
				local var_82_14 = arg_79_1:FormatText(var_82_13.content)

				arg_79_1.text_.text = var_82_14

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_15 = 15
				local var_82_16 = utf8.len(var_82_14)
				local var_82_17 = var_82_15 <= 0 and var_82_11 or var_82_11 * (var_82_16 / var_82_15)

				if var_82_17 > 0 and var_82_11 < var_82_17 then
					arg_79_1.talkMaxDuration = var_82_17

					if var_82_17 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_17 + var_82_10
					end
				end

				arg_79_1.text_.text = var_82_14
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201020", "story_v_out_411201.awb") ~= 0 then
					local var_82_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201020", "story_v_out_411201.awb") / 1000

					if var_82_18 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_18 + var_82_10
					end

					if var_82_13.prefab_name ~= "" and arg_79_1.actors_[var_82_13.prefab_name] ~= nil then
						local var_82_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_13.prefab_name].transform, "story_v_out_411201", "411201020", "story_v_out_411201.awb")

						arg_79_1:RecordAudio("411201020", var_82_19)
						arg_79_1:RecordAudio("411201020", var_82_19)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_411201", "411201020", "story_v_out_411201.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_411201", "411201020", "story_v_out_411201.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_20 = math.max(var_82_11, arg_79_1.talkMaxDuration)

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_20 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_10) / var_82_20

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_10 + var_82_20 and arg_79_1.time_ < var_82_10 + var_82_20 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play411201021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 411201021
		arg_83_1.duration_ = 6.766

		local var_83_0 = {
			zh = 5.466,
			ja = 6.766
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
				arg_83_0:Play411201022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1024ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1024ui_story == nil then
				arg_83_1.var_.characterEffect1024ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1024ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1024ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1024ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1024ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["10014ui_story"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.characterEffect10014ui_story == nil then
				arg_83_1.var_.characterEffect10014ui_story = var_86_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_8 = 0.200000002980232

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.characterEffect10014ui_story then
					arg_83_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.characterEffect10014ui_story then
				arg_83_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_86_10 = 0
			local var_86_11 = 0.475

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_12 = arg_83_1:FormatText(StoryNameCfg[264].name)

				arg_83_1.leftNameTxt_.text = var_86_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_13 = arg_83_1:GetWordFromCfg(411201021)
				local var_86_14 = arg_83_1:FormatText(var_86_13.content)

				arg_83_1.text_.text = var_86_14

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_15 = 19
				local var_86_16 = utf8.len(var_86_14)
				local var_86_17 = var_86_15 <= 0 and var_86_11 or var_86_11 * (var_86_16 / var_86_15)

				if var_86_17 > 0 and var_86_11 < var_86_17 then
					arg_83_1.talkMaxDuration = var_86_17

					if var_86_17 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_17 + var_86_10
					end
				end

				arg_83_1.text_.text = var_86_14
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201021", "story_v_out_411201.awb") ~= 0 then
					local var_86_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201021", "story_v_out_411201.awb") / 1000

					if var_86_18 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_10
					end

					if var_86_13.prefab_name ~= "" and arg_83_1.actors_[var_86_13.prefab_name] ~= nil then
						local var_86_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_13.prefab_name].transform, "story_v_out_411201", "411201021", "story_v_out_411201.awb")

						arg_83_1:RecordAudio("411201021", var_86_19)
						arg_83_1:RecordAudio("411201021", var_86_19)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_411201", "411201021", "story_v_out_411201.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_411201", "411201021", "story_v_out_411201.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_20 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_20 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_10) / var_86_20

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_10 + var_86_20 and arg_83_1.time_ < var_86_10 + var_86_20 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play411201022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 411201022
		arg_87_1.duration_ = 2.066

		local var_87_0 = {
			zh = 1.6,
			ja = 2.066
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
				arg_87_0:Play411201023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1024ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1024ui_story == nil then
				arg_87_1.var_.characterEffect1024ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1024ui_story then
					arg_87_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1024ui_story then
				arg_87_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["10014ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect10014ui_story == nil then
				arg_87_1.var_.characterEffect10014ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.200000002980232

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect10014ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10014ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect10014ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10014ui_story.fillRatio = var_90_9
			end

			local var_90_10 = 0
			local var_90_11 = 0.225

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_12 = arg_87_1:FormatText(StoryNameCfg[265].name)

				arg_87_1.leftNameTxt_.text = var_90_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_13 = arg_87_1:GetWordFromCfg(411201022)
				local var_90_14 = arg_87_1:FormatText(var_90_13.content)

				arg_87_1.text_.text = var_90_14

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_15 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201022", "story_v_out_411201.awb") ~= 0 then
					local var_90_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201022", "story_v_out_411201.awb") / 1000

					if var_90_18 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_18 + var_90_10
					end

					if var_90_13.prefab_name ~= "" and arg_87_1.actors_[var_90_13.prefab_name] ~= nil then
						local var_90_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_13.prefab_name].transform, "story_v_out_411201", "411201022", "story_v_out_411201.awb")

						arg_87_1:RecordAudio("411201022", var_90_19)
						arg_87_1:RecordAudio("411201022", var_90_19)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_411201", "411201022", "story_v_out_411201.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_411201", "411201022", "story_v_out_411201.awb")
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
	Play411201023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 411201023
		arg_91_1.duration_ = 5.533

		local var_91_0 = {
			zh = 4.533,
			ja = 5.533
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
				arg_91_0:Play411201024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1024ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1024ui_story == nil then
				arg_91_1.var_.characterEffect1024ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1024ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1024ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1024ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1024ui_story.fillRatio = var_94_5
			end

			local var_94_6 = arg_91_1.actors_["10014ui_story"]
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 and arg_91_1.var_.characterEffect10014ui_story == nil then
				arg_91_1.var_.characterEffect10014ui_story = var_94_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_8 = 0.200000002980232

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8

				if arg_91_1.var_.characterEffect10014ui_story then
					arg_91_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 and arg_91_1.var_.characterEffect10014ui_story then
				arg_91_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_2")
			end

			local var_94_11 = 0
			local var_94_12 = 0.475

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_13 = arg_91_1:FormatText(StoryNameCfg[264].name)

				arg_91_1.leftNameTxt_.text = var_94_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_14 = arg_91_1:GetWordFromCfg(411201023)
				local var_94_15 = arg_91_1:FormatText(var_94_14.content)

				arg_91_1.text_.text = var_94_15

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_16 = 19
				local var_94_17 = utf8.len(var_94_15)
				local var_94_18 = var_94_16 <= 0 and var_94_12 or var_94_12 * (var_94_17 / var_94_16)

				if var_94_18 > 0 and var_94_12 < var_94_18 then
					arg_91_1.talkMaxDuration = var_94_18

					if var_94_18 + var_94_11 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_18 + var_94_11
					end
				end

				arg_91_1.text_.text = var_94_15
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201023", "story_v_out_411201.awb") ~= 0 then
					local var_94_19 = manager.audio:GetVoiceLength("story_v_out_411201", "411201023", "story_v_out_411201.awb") / 1000

					if var_94_19 + var_94_11 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_11
					end

					if var_94_14.prefab_name ~= "" and arg_91_1.actors_[var_94_14.prefab_name] ~= nil then
						local var_94_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_14.prefab_name].transform, "story_v_out_411201", "411201023", "story_v_out_411201.awb")

						arg_91_1:RecordAudio("411201023", var_94_20)
						arg_91_1:RecordAudio("411201023", var_94_20)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_411201", "411201023", "story_v_out_411201.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_411201", "411201023", "story_v_out_411201.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_21 = math.max(var_94_12, arg_91_1.talkMaxDuration)

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_21 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_11) / var_94_21

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_11 + var_94_21 and arg_91_1.time_ < var_94_11 + var_94_21 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play411201024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 411201024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play411201025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1024ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1024ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1024ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1024ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1024ui_story == nil then
				arg_95_1.var_.characterEffect1024ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1024ui_story then
					local var_98_13 = Mathf.Lerp(0, 0.5, var_98_12)

					arg_95_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1024ui_story.fillRatio = var_98_13
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1024ui_story then
				local var_98_14 = 0.5

				arg_95_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1024ui_story.fillRatio = var_98_14
			end

			local var_98_15 = arg_95_1.actors_["10014ui_story"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos10014ui_story = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(0, 100, 0)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10014ui_story, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_15.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_15.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				var_98_15.localPosition = Vector3.New(0, 100, 0)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_15.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_15.localEulerAngles = var_98_23
			end

			local var_98_24 = arg_95_1.actors_["10014ui_story"]
			local var_98_25 = 0

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 and arg_95_1.var_.characterEffect10014ui_story == nil then
				arg_95_1.var_.characterEffect10014ui_story = var_98_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_26 = 0.200000002980232

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_26 then
				local var_98_27 = (arg_95_1.time_ - var_98_25) / var_98_26

				if arg_95_1.var_.characterEffect10014ui_story then
					local var_98_28 = Mathf.Lerp(0, 0.5, var_98_27)

					arg_95_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10014ui_story.fillRatio = var_98_28
				end
			end

			if arg_95_1.time_ >= var_98_25 + var_98_26 and arg_95_1.time_ < var_98_25 + var_98_26 + arg_98_0 and arg_95_1.var_.characterEffect10014ui_story then
				local var_98_29 = 0.5

				arg_95_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10014ui_story.fillRatio = var_98_29
			end

			local var_98_30 = arg_95_1.actors_["1024ui_story"]
			local var_98_31 = 0
			local var_98_32 = 2

			if var_98_31 < arg_95_1.time_ and arg_95_1.time_ <= var_98_31 + arg_98_0 then
				if arg_95_1.var_.characterEffect1024ui_story == nil then
					arg_95_1.var_.characterEffect1024ui_story = var_98_30:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_95_1.var_.characterEffect1024ui_story.imageEffect:turnOff()
			end

			if arg_95_1.time_ >= var_98_31 + var_98_32 and arg_95_1.time_ < var_98_31 + var_98_32 + arg_98_0 then
				if arg_95_1.var_.characterEffect1024ui_story == nil then
					arg_95_1.var_.characterEffect1024ui_story = var_98_30:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_95_1.var_.characterEffect1024ui_story.imageEffect:turnOn(false)
			end

			local var_98_33 = 0
			local var_98_34 = 0.9

			if var_98_33 < arg_95_1.time_ and arg_95_1.time_ <= var_98_33 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_35 = arg_95_1:GetWordFromCfg(411201024)
				local var_98_36 = arg_95_1:FormatText(var_98_35.content)

				arg_95_1.text_.text = var_98_36

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_37 = 36
				local var_98_38 = utf8.len(var_98_36)
				local var_98_39 = var_98_37 <= 0 and var_98_34 or var_98_34 * (var_98_38 / var_98_37)

				if var_98_39 > 0 and var_98_34 < var_98_39 then
					arg_95_1.talkMaxDuration = var_98_39

					if var_98_39 + var_98_33 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_39 + var_98_33
					end
				end

				arg_95_1.text_.text = var_98_36
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_40 = math.max(var_98_34, arg_95_1.talkMaxDuration)

			if var_98_33 <= arg_95_1.time_ and arg_95_1.time_ < var_98_33 + var_98_40 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_33) / var_98_40

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_33 + var_98_40 and arg_95_1.time_ < var_98_33 + var_98_40 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play411201025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 411201025
		arg_99_1.duration_ = 1.666

		local var_99_0 = {
			zh = 1.033,
			ja = 1.666
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
				arg_99_0:Play411201026(arg_99_1)
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
				local var_102_4 = Vector3.New(0, -0.98, -6.1)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1095ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -0.98, -6.1)

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
				arg_99_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.1

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

				local var_102_18 = arg_99_1:GetWordFromCfg(411201025)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201025", "story_v_out_411201.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201025", "story_v_out_411201.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_out_411201", "411201025", "story_v_out_411201.awb")

						arg_99_1:RecordAudio("411201025", var_102_24)
						arg_99_1:RecordAudio("411201025", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_411201", "411201025", "story_v_out_411201.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_411201", "411201025", "story_v_out_411201.awb")
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
	Play411201026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 411201026
		arg_103_1.duration_ = 5.133

		local var_103_0 = {
			zh = 2.966,
			ja = 5.133
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
				arg_103_0:Play411201027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1095ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1095ui_story == nil then
				arg_103_1.var_.characterEffect1095ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1095ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1095ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1095ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1095ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0
			local var_106_7 = 0.4

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[718].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(411201026)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201026", "story_v_out_411201.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_411201", "411201026", "story_v_out_411201.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_411201", "411201026", "story_v_out_411201.awb")

						arg_103_1:RecordAudio("411201026", var_106_15)
						arg_103_1:RecordAudio("411201026", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_411201", "411201026", "story_v_out_411201.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_411201", "411201026", "story_v_out_411201.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_16 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_16 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_16

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_16 and arg_103_1.time_ < var_106_6 + var_106_16 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play411201027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 411201027
		arg_107_1.duration_ = 5.566

		local var_107_0 = {
			zh = 2.6,
			ja = 5.566
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
				arg_107_0:Play411201028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1095ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story == nil then
				arg_107_1.var_.characterEffect1095ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1095ui_story then
					arg_107_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story then
				arg_107_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_110_4 = 0
			local var_110_5 = 0.425

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_6 = arg_107_1:FormatText(StoryNameCfg[471].name)

				arg_107_1.leftNameTxt_.text = var_110_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_7 = arg_107_1:GetWordFromCfg(411201027)
				local var_110_8 = arg_107_1:FormatText(var_110_7.content)

				arg_107_1.text_.text = var_110_8

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_9 = 17
				local var_110_10 = utf8.len(var_110_8)
				local var_110_11 = var_110_9 <= 0 and var_110_5 or var_110_5 * (var_110_10 / var_110_9)

				if var_110_11 > 0 and var_110_5 < var_110_11 then
					arg_107_1.talkMaxDuration = var_110_11

					if var_110_11 + var_110_4 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_11 + var_110_4
					end
				end

				arg_107_1.text_.text = var_110_8
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201027", "story_v_out_411201.awb") ~= 0 then
					local var_110_12 = manager.audio:GetVoiceLength("story_v_out_411201", "411201027", "story_v_out_411201.awb") / 1000

					if var_110_12 + var_110_4 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_12 + var_110_4
					end

					if var_110_7.prefab_name ~= "" and arg_107_1.actors_[var_110_7.prefab_name] ~= nil then
						local var_110_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_7.prefab_name].transform, "story_v_out_411201", "411201027", "story_v_out_411201.awb")

						arg_107_1:RecordAudio("411201027", var_110_13)
						arg_107_1:RecordAudio("411201027", var_110_13)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_411201", "411201027", "story_v_out_411201.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_411201", "411201027", "story_v_out_411201.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_14 = math.max(var_110_5, arg_107_1.talkMaxDuration)

			if var_110_4 <= arg_107_1.time_ and arg_107_1.time_ < var_110_4 + var_110_14 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_4) / var_110_14

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_4 + var_110_14 and arg_107_1.time_ < var_110_4 + var_110_14 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play411201028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 411201028
		arg_111_1.duration_ = 5.666

		local var_111_0 = {
			zh = 4.166,
			ja = 5.666
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
				arg_111_0:Play411201029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.625

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[471].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(411201028)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 25
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201028", "story_v_out_411201.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201028", "story_v_out_411201.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_411201", "411201028", "story_v_out_411201.awb")

						arg_111_1:RecordAudio("411201028", var_114_9)
						arg_111_1:RecordAudio("411201028", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_411201", "411201028", "story_v_out_411201.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_411201", "411201028", "story_v_out_411201.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play411201029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 411201029
		arg_115_1.duration_ = 4.666

		local var_115_0 = {
			zh = 4.666,
			ja = 3.3
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
				arg_115_0:Play411201030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.675

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

				local var_118_3 = arg_115_1:GetWordFromCfg(411201029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201029", "story_v_out_411201.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201029", "story_v_out_411201.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_411201", "411201029", "story_v_out_411201.awb")

						arg_115_1:RecordAudio("411201029", var_118_9)
						arg_115_1:RecordAudio("411201029", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_411201", "411201029", "story_v_out_411201.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_411201", "411201029", "story_v_out_411201.awb")
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
	Play411201030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 411201030
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play411201031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1095ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1095ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, 100, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1095ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, 100, 0)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1095ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1095ui_story == nil then
				arg_119_1.var_.characterEffect1095ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1095ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1095ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1095ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1095ui_story.fillRatio = var_122_14
			end

			local var_122_15 = 0
			local var_122_16 = 1

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_17 = arg_119_1:GetWordFromCfg(411201030)
				local var_122_18 = arg_119_1:FormatText(var_122_17.content)

				arg_119_1.text_.text = var_122_18

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_19 = 40
				local var_122_20 = utf8.len(var_122_18)
				local var_122_21 = var_122_19 <= 0 and var_122_16 or var_122_16 * (var_122_20 / var_122_19)

				if var_122_21 > 0 and var_122_16 < var_122_21 then
					arg_119_1.talkMaxDuration = var_122_21

					if var_122_21 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_18
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_22 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_22 and arg_119_1.time_ < var_122_15 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play411201031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 411201031
		arg_123_1.duration_ = 2.266

		local var_123_0 = {
			zh = 1.9,
			ja = 2.266
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
				arg_123_0:Play411201032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.25

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[718].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_badboya")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(411201031)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201031", "story_v_out_411201.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201031", "story_v_out_411201.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_411201", "411201031", "story_v_out_411201.awb")

						arg_123_1:RecordAudio("411201031", var_126_9)
						arg_123_1:RecordAudio("411201031", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_411201", "411201031", "story_v_out_411201.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_411201", "411201031", "story_v_out_411201.awb")
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
	Play411201032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 411201032
		arg_127_1.duration_ = 6.3

		local var_127_0 = {
			zh = 6.3,
			ja = 5.2
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
				arg_127_0:Play411201033(arg_127_1)
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
				local var_130_4 = Vector3.New(0, -0.98, -6.1)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1095ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -0.98, -6.1)

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
				arg_127_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_15 = 0
			local var_130_16 = 0.775

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[471].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_18 = arg_127_1:GetWordFromCfg(411201032)
				local var_130_19 = arg_127_1:FormatText(var_130_18.content)

				arg_127_1.text_.text = var_130_19

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_20 = 31
				local var_130_21 = utf8.len(var_130_19)
				local var_130_22 = var_130_20 <= 0 and var_130_16 or var_130_16 * (var_130_21 / var_130_20)

				if var_130_22 > 0 and var_130_16 < var_130_22 then
					arg_127_1.talkMaxDuration = var_130_22

					if var_130_22 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_19
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201032", "story_v_out_411201.awb") ~= 0 then
					local var_130_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201032", "story_v_out_411201.awb") / 1000

					if var_130_23 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_15
					end

					if var_130_18.prefab_name ~= "" and arg_127_1.actors_[var_130_18.prefab_name] ~= nil then
						local var_130_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_18.prefab_name].transform, "story_v_out_411201", "411201032", "story_v_out_411201.awb")

						arg_127_1:RecordAudio("411201032", var_130_24)
						arg_127_1:RecordAudio("411201032", var_130_24)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_411201", "411201032", "story_v_out_411201.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_411201", "411201032", "story_v_out_411201.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_25 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_25 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_25

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_25 and arg_127_1.time_ < var_130_15 + var_130_25 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play411201033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 411201033
		arg_131_1.duration_ = 7.233

		local var_131_0 = {
			zh = 7.233,
			ja = 6.9
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
				arg_131_0:Play411201034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.775

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[471].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(411201033)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201033", "story_v_out_411201.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201033", "story_v_out_411201.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_411201", "411201033", "story_v_out_411201.awb")

						arg_131_1:RecordAudio("411201033", var_134_9)
						arg_131_1:RecordAudio("411201033", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_411201", "411201033", "story_v_out_411201.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_411201", "411201033", "story_v_out_411201.awb")
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
	Play411201034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 411201034
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play411201035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1095ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1095ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, 100, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1095ui_story, var_138_4, var_138_3)

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

			local var_138_9 = arg_135_1.actors_["1095ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story == nil then
				arg_135_1.var_.characterEffect1095ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1095ui_story then
					local var_138_13 = Mathf.Lerp(0, 0.5, var_138_12)

					arg_135_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1095ui_story.fillRatio = var_138_13
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1095ui_story then
				local var_138_14 = 0.5

				arg_135_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1095ui_story.fillRatio = var_138_14
			end

			local var_138_15 = 0
			local var_138_16 = 0.825

			if var_138_15 < arg_135_1.time_ and arg_135_1.time_ <= var_138_15 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_17 = arg_135_1:GetWordFromCfg(411201034)
				local var_138_18 = arg_135_1:FormatText(var_138_17.content)

				arg_135_1.text_.text = var_138_18

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_19 = 33
				local var_138_20 = utf8.len(var_138_18)
				local var_138_21 = var_138_19 <= 0 and var_138_16 or var_138_16 * (var_138_20 / var_138_19)

				if var_138_21 > 0 and var_138_16 < var_138_21 then
					arg_135_1.talkMaxDuration = var_138_21

					if var_138_21 + var_138_15 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_15
					end
				end

				arg_135_1.text_.text = var_138_18
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_16, arg_135_1.talkMaxDuration)

			if var_138_15 <= arg_135_1.time_ and arg_135_1.time_ < var_138_15 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_15) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_15 + var_138_22 and arg_135_1.time_ < var_138_15 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play411201035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 411201035
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play411201036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.85

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_2 = arg_139_1:GetWordFromCfg(411201035)
				local var_142_3 = arg_139_1:FormatText(var_142_2.content)

				arg_139_1.text_.text = var_142_3

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_4 = 34
				local var_142_5 = utf8.len(var_142_3)
				local var_142_6 = var_142_4 <= 0 and var_142_1 or var_142_1 * (var_142_5 / var_142_4)

				if var_142_6 > 0 and var_142_1 < var_142_6 then
					arg_139_1.talkMaxDuration = var_142_6

					if var_142_6 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_6 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_3
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_7 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_7 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_7

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_7 and arg_139_1.time_ < var_142_0 + var_142_7 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play411201036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 411201036
		arg_143_1.duration_ = 9

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play411201037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = "ST75"

			if arg_143_1.bgs_[var_146_0] == nil then
				local var_146_1 = Object.Instantiate(arg_143_1.paintGo_)

				var_146_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_146_0)
				var_146_1.name = var_146_0
				var_146_1.transform.parent = arg_143_1.stage_.transform
				var_146_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_143_1.bgs_[var_146_0] = var_146_1
			end

			local var_146_2 = 2

			if var_146_2 < arg_143_1.time_ and arg_143_1.time_ <= var_146_2 + arg_146_0 then
				local var_146_3 = manager.ui.mainCamera.transform.localPosition
				local var_146_4 = Vector3.New(0, 0, 10) + Vector3.New(var_146_3.x, var_146_3.y, 0)
				local var_146_5 = arg_143_1.bgs_.ST75

				var_146_5.transform.localPosition = var_146_4
				var_146_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_6 = var_146_5:GetComponent("SpriteRenderer")

				if var_146_6 and var_146_6.sprite then
					local var_146_7 = (var_146_5.transform.localPosition - var_146_3).z
					local var_146_8 = manager.ui.mainCameraCom_
					local var_146_9 = 2 * var_146_7 * Mathf.Tan(var_146_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_10 = var_146_9 * var_146_8.aspect
					local var_146_11 = var_146_6.sprite.bounds.size.x
					local var_146_12 = var_146_6.sprite.bounds.size.y
					local var_146_13 = var_146_10 / var_146_11
					local var_146_14 = var_146_9 / var_146_12
					local var_146_15 = var_146_14 < var_146_13 and var_146_13 or var_146_14

					var_146_5.transform.localScale = Vector3.New(var_146_15, var_146_15, 0)
				end

				for iter_146_0, iter_146_1 in pairs(arg_143_1.bgs_) do
					if iter_146_0 ~= "ST75" then
						iter_146_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_146_16 = 0

			if var_146_16 < arg_143_1.time_ and arg_143_1.time_ <= var_146_16 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_17 = 2

			if var_146_16 <= arg_143_1.time_ and arg_143_1.time_ < var_146_16 + var_146_17 then
				local var_146_18 = (arg_143_1.time_ - var_146_16) / var_146_17
				local var_146_19 = Color.New(0, 0, 0)

				var_146_19.a = Mathf.Lerp(0, 1, var_146_18)
				arg_143_1.mask_.color = var_146_19
			end

			if arg_143_1.time_ >= var_146_16 + var_146_17 and arg_143_1.time_ < var_146_16 + var_146_17 + arg_146_0 then
				local var_146_20 = Color.New(0, 0, 0)

				var_146_20.a = 1
				arg_143_1.mask_.color = var_146_20
			end

			local var_146_21 = 2

			if var_146_21 < arg_143_1.time_ and arg_143_1.time_ <= var_146_21 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = true

				arg_143_1:SetGaussion(false)
			end

			local var_146_22 = 2

			if var_146_21 <= arg_143_1.time_ and arg_143_1.time_ < var_146_21 + var_146_22 then
				local var_146_23 = (arg_143_1.time_ - var_146_21) / var_146_22
				local var_146_24 = Color.New(0, 0, 0)

				var_146_24.a = Mathf.Lerp(1, 0, var_146_23)
				arg_143_1.mask_.color = var_146_24
			end

			if arg_143_1.time_ >= var_146_21 + var_146_22 and arg_143_1.time_ < var_146_21 + var_146_22 + arg_146_0 then
				local var_146_25 = Color.New(0, 0, 0)
				local var_146_26 = 0

				arg_143_1.mask_.enabled = false
				var_146_25.a = var_146_26
				arg_143_1.mask_.color = var_146_25
			end

			if arg_143_1.frameCnt_ <= 1 then
				arg_143_1.dialog_:SetActive(false)
			end

			local var_146_27 = 4
			local var_146_28 = 1.25

			if var_146_27 < arg_143_1.time_ and arg_143_1.time_ <= var_146_27 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				arg_143_1.dialog_:SetActive(true)

				local var_146_29 = LeanTween.value(arg_143_1.dialog_, 0, 1, 0.3)

				var_146_29:setOnUpdate(LuaHelper.FloatAction(function(arg_147_0)
					arg_143_1.dialogCg_.alpha = arg_147_0
				end))
				var_146_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_143_1.dialog_)
					var_146_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_143_1.duration_ = arg_143_1.duration_ + 0.3

				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_30 = arg_143_1:GetWordFromCfg(411201036)
				local var_146_31 = arg_143_1:FormatText(var_146_30.content)

				arg_143_1.text_.text = var_146_31

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_32 = 50
				local var_146_33 = utf8.len(var_146_31)
				local var_146_34 = var_146_32 <= 0 and var_146_28 or var_146_28 * (var_146_33 / var_146_32)

				if var_146_34 > 0 and var_146_28 < var_146_34 then
					arg_143_1.talkMaxDuration = var_146_34
					var_146_27 = var_146_27 + 0.3

					if var_146_34 + var_146_27 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_34 + var_146_27
					end
				end

				arg_143_1.text_.text = var_146_31
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_35 = var_146_27 + 0.3
			local var_146_36 = math.max(var_146_28, arg_143_1.talkMaxDuration)

			if var_146_35 <= arg_143_1.time_ and arg_143_1.time_ < var_146_35 + var_146_36 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_35) / var_146_36

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_35 + var_146_36 and arg_143_1.time_ < var_146_35 + var_146_36 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play411201037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 411201037
		arg_149_1.duration_ = 1.999999999999

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play411201038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1024ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1024ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0, -1, -6.05)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1024ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, -1, -6.05)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["1024ui_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.characterEffect1024ui_story == nil then
				arg_149_1.var_.characterEffect1024ui_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect1024ui_story then
					arg_149_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.characterEffect1024ui_story then
				arg_149_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_152_14 = 0

			if var_152_14 < arg_149_1.time_ and arg_149_1.time_ <= var_152_14 + arg_152_0 then
				arg_149_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_15 = arg_149_1.actors_["1024ui_story"]
			local var_152_16 = 0
			local var_152_17 = 2

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 then
				if arg_149_1.var_.characterEffect1024ui_story == nil then
					arg_149_1.var_.characterEffect1024ui_story = var_152_15:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_149_1.var_.characterEffect1024ui_story.imageEffect:turnOff()
			end

			local var_152_18 = arg_149_1.actors_["1024ui_story"]
			local var_152_19 = 0

			if var_152_19 < arg_149_1.time_ and arg_149_1.time_ <= var_152_19 + arg_152_0 then
				if arg_149_1.var_.characterEffect1024ui_story == nil then
					arg_149_1.var_.characterEffect1024ui_story = var_152_18:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_152_20 = arg_149_1.var_.characterEffect1024ui_story

				var_152_20.imageEffect:turnOff()

				var_152_20.interferenceEffect.enabled = false
				var_152_20.interferenceEffect.noise = 0.01
				var_152_20.interferenceEffect.simTimeScale = 1
				var_152_20.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_152_21 = 0
			local var_152_22 = 0.175

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_23 = arg_149_1:FormatText(StoryNameCfg[265].name)

				arg_149_1.leftNameTxt_.text = var_152_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_24 = arg_149_1:GetWordFromCfg(411201037)
				local var_152_25 = arg_149_1:FormatText(var_152_24.content)

				arg_149_1.text_.text = var_152_25

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_26 = 7
				local var_152_27 = utf8.len(var_152_25)
				local var_152_28 = var_152_26 <= 0 and var_152_22 or var_152_22 * (var_152_27 / var_152_26)

				if var_152_28 > 0 and var_152_22 < var_152_28 then
					arg_149_1.talkMaxDuration = var_152_28

					if var_152_28 + var_152_21 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_28 + var_152_21
					end
				end

				arg_149_1.text_.text = var_152_25
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201037", "story_v_out_411201.awb") ~= 0 then
					local var_152_29 = manager.audio:GetVoiceLength("story_v_out_411201", "411201037", "story_v_out_411201.awb") / 1000

					if var_152_29 + var_152_21 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_29 + var_152_21
					end

					if var_152_24.prefab_name ~= "" and arg_149_1.actors_[var_152_24.prefab_name] ~= nil then
						local var_152_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_24.prefab_name].transform, "story_v_out_411201", "411201037", "story_v_out_411201.awb")

						arg_149_1:RecordAudio("411201037", var_152_30)
						arg_149_1:RecordAudio("411201037", var_152_30)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_411201", "411201037", "story_v_out_411201.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_411201", "411201037", "story_v_out_411201.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_31 = math.max(var_152_22, arg_149_1.talkMaxDuration)

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_31 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_21) / var_152_31

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_21 + var_152_31 and arg_149_1.time_ < var_152_21 + var_152_31 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play411201038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 411201038
		arg_153_1.duration_ = 3.266

		local var_153_0 = {
			zh = 1.999999999999,
			ja = 3.266
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
				arg_153_0:Play411201039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1024ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1024ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(-0.7, -1, -6.05)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1024ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(-0.7, -1, -6.05)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = arg_153_1.actors_["1024ui_story"]
			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 and arg_153_1.var_.characterEffect1024ui_story == nil then
				arg_153_1.var_.characterEffect1024ui_story = var_156_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_11 = 0.200000002980232

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_10) / var_156_11

				if arg_153_1.var_.characterEffect1024ui_story then
					local var_156_13 = Mathf.Lerp(0, 0.5, var_156_12)

					arg_153_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1024ui_story.fillRatio = var_156_13
				end
			end

			if arg_153_1.time_ >= var_156_10 + var_156_11 and arg_153_1.time_ < var_156_10 + var_156_11 + arg_156_0 and arg_153_1.var_.characterEffect1024ui_story then
				local var_156_14 = 0.5

				arg_153_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1024ui_story.fillRatio = var_156_14
			end

			local var_156_15 = "4010ui_story"

			if arg_153_1.actors_[var_156_15] == nil then
				local var_156_16 = Object.Instantiate(Asset.Load("Char/" .. var_156_15), arg_153_1.stage_.transform)

				var_156_16.name = var_156_15
				var_156_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_153_1.actors_[var_156_15] = var_156_16

				local var_156_17 = var_156_16:GetComponentInChildren(typeof(CharacterEffect))

				var_156_17.enabled = true

				local var_156_18 = GameObjectTools.GetOrAddComponent(var_156_16, typeof(DynamicBoneHelper))

				if var_156_18 then
					var_156_18:EnableDynamicBone(false)
				end

				arg_153_1:ShowWeapon(var_156_17.transform, false)

				arg_153_1.var_[var_156_15 .. "Animator"] = var_156_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_153_1.var_[var_156_15 .. "Animator"].applyRootMotion = true
				arg_153_1.var_[var_156_15 .. "LipSync"] = var_156_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_156_19 = arg_153_1.actors_["4010ui_story"].transform
			local var_156_20 = 0

			if var_156_20 < arg_153_1.time_ and arg_153_1.time_ <= var_156_20 + arg_156_0 then
				arg_153_1.var_.moveOldPos4010ui_story = var_156_19.localPosition
			end

			local var_156_21 = 0.001

			if var_156_20 <= arg_153_1.time_ and arg_153_1.time_ < var_156_20 + var_156_21 then
				local var_156_22 = (arg_153_1.time_ - var_156_20) / var_156_21
				local var_156_23 = Vector3.New(0.7, -1.59, -5.2)

				var_156_19.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos4010ui_story, var_156_23, var_156_22)

				local var_156_24 = manager.ui.mainCamera.transform.position - var_156_19.position

				var_156_19.forward = Vector3.New(var_156_24.x, var_156_24.y, var_156_24.z)

				local var_156_25 = var_156_19.localEulerAngles

				var_156_25.z = 0
				var_156_25.x = 0
				var_156_19.localEulerAngles = var_156_25
			end

			if arg_153_1.time_ >= var_156_20 + var_156_21 and arg_153_1.time_ < var_156_20 + var_156_21 + arg_156_0 then
				var_156_19.localPosition = Vector3.New(0.7, -1.59, -5.2)

				local var_156_26 = manager.ui.mainCamera.transform.position - var_156_19.position

				var_156_19.forward = Vector3.New(var_156_26.x, var_156_26.y, var_156_26.z)

				local var_156_27 = var_156_19.localEulerAngles

				var_156_27.z = 0
				var_156_27.x = 0
				var_156_19.localEulerAngles = var_156_27
			end

			local var_156_28 = arg_153_1.actors_["4010ui_story"]
			local var_156_29 = 0

			if var_156_29 < arg_153_1.time_ and arg_153_1.time_ <= var_156_29 + arg_156_0 and arg_153_1.var_.characterEffect4010ui_story == nil then
				arg_153_1.var_.characterEffect4010ui_story = var_156_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_30 = 0.200000002980232

			if var_156_29 <= arg_153_1.time_ and arg_153_1.time_ < var_156_29 + var_156_30 then
				local var_156_31 = (arg_153_1.time_ - var_156_29) / var_156_30

				if arg_153_1.var_.characterEffect4010ui_story then
					arg_153_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_29 + var_156_30 and arg_153_1.time_ < var_156_29 + var_156_30 + arg_156_0 and arg_153_1.var_.characterEffect4010ui_story then
				arg_153_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_156_32 = 0

			if var_156_32 < arg_153_1.time_ and arg_153_1.time_ <= var_156_32 + arg_156_0 then
				arg_153_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_156_33 = 0

			if var_156_33 < arg_153_1.time_ and arg_153_1.time_ <= var_156_33 + arg_156_0 then
				arg_153_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_156_34 = 0
			local var_156_35 = 0.125

			if var_156_34 < arg_153_1.time_ and arg_153_1.time_ <= var_156_34 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_36 = arg_153_1:FormatText(StoryNameCfg[42].name)

				arg_153_1.leftNameTxt_.text = var_156_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_37 = arg_153_1:GetWordFromCfg(411201038)
				local var_156_38 = arg_153_1:FormatText(var_156_37.content)

				arg_153_1.text_.text = var_156_38

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_39 = 5
				local var_156_40 = utf8.len(var_156_38)
				local var_156_41 = var_156_39 <= 0 and var_156_35 or var_156_35 * (var_156_40 / var_156_39)

				if var_156_41 > 0 and var_156_35 < var_156_41 then
					arg_153_1.talkMaxDuration = var_156_41

					if var_156_41 + var_156_34 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_41 + var_156_34
					end
				end

				arg_153_1.text_.text = var_156_38
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201038", "story_v_out_411201.awb") ~= 0 then
					local var_156_42 = manager.audio:GetVoiceLength("story_v_out_411201", "411201038", "story_v_out_411201.awb") / 1000

					if var_156_42 + var_156_34 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_42 + var_156_34
					end

					if var_156_37.prefab_name ~= "" and arg_153_1.actors_[var_156_37.prefab_name] ~= nil then
						local var_156_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_37.prefab_name].transform, "story_v_out_411201", "411201038", "story_v_out_411201.awb")

						arg_153_1:RecordAudio("411201038", var_156_43)
						arg_153_1:RecordAudio("411201038", var_156_43)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_411201", "411201038", "story_v_out_411201.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_411201", "411201038", "story_v_out_411201.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_44 = math.max(var_156_35, arg_153_1.talkMaxDuration)

			if var_156_34 <= arg_153_1.time_ and arg_153_1.time_ < var_156_34 + var_156_44 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_34) / var_156_44

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_34 + var_156_44 and arg_153_1.time_ < var_156_34 + var_156_44 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play411201039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 411201039
		arg_157_1.duration_ = 2.3

		local var_157_0 = {
			zh = 1.999999999999,
			ja = 2.3
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
				arg_157_0:Play411201040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1024ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1024ui_story == nil then
				arg_157_1.var_.characterEffect1024ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1024ui_story then
					arg_157_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1024ui_story then
				arg_157_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_160_4 = 0

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 then
				arg_157_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_160_6 = arg_157_1.actors_["4010ui_story"]
			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 and arg_157_1.var_.characterEffect4010ui_story == nil then
				arg_157_1.var_.characterEffect4010ui_story = var_160_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_8 = 0.200000002980232

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_8 then
				local var_160_9 = (arg_157_1.time_ - var_160_7) / var_160_8

				if arg_157_1.var_.characterEffect4010ui_story then
					local var_160_10 = Mathf.Lerp(0, 0.5, var_160_9)

					arg_157_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_157_1.var_.characterEffect4010ui_story.fillRatio = var_160_10
				end
			end

			if arg_157_1.time_ >= var_160_7 + var_160_8 and arg_157_1.time_ < var_160_7 + var_160_8 + arg_160_0 and arg_157_1.var_.characterEffect4010ui_story then
				local var_160_11 = 0.5

				arg_157_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_157_1.var_.characterEffect4010ui_story.fillRatio = var_160_11
			end

			local var_160_12 = 0
			local var_160_13 = 0.1

			if var_160_12 < arg_157_1.time_ and arg_157_1.time_ <= var_160_12 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_14 = arg_157_1:FormatText(StoryNameCfg[265].name)

				arg_157_1.leftNameTxt_.text = var_160_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_15 = arg_157_1:GetWordFromCfg(411201039)
				local var_160_16 = arg_157_1:FormatText(var_160_15.content)

				arg_157_1.text_.text = var_160_16

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_17 = 4
				local var_160_18 = utf8.len(var_160_16)
				local var_160_19 = var_160_17 <= 0 and var_160_13 or var_160_13 * (var_160_18 / var_160_17)

				if var_160_19 > 0 and var_160_13 < var_160_19 then
					arg_157_1.talkMaxDuration = var_160_19

					if var_160_19 + var_160_12 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_19 + var_160_12
					end
				end

				arg_157_1.text_.text = var_160_16
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201039", "story_v_out_411201.awb") ~= 0 then
					local var_160_20 = manager.audio:GetVoiceLength("story_v_out_411201", "411201039", "story_v_out_411201.awb") / 1000

					if var_160_20 + var_160_12 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_20 + var_160_12
					end

					if var_160_15.prefab_name ~= "" and arg_157_1.actors_[var_160_15.prefab_name] ~= nil then
						local var_160_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_15.prefab_name].transform, "story_v_out_411201", "411201039", "story_v_out_411201.awb")

						arg_157_1:RecordAudio("411201039", var_160_21)
						arg_157_1:RecordAudio("411201039", var_160_21)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_411201", "411201039", "story_v_out_411201.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_411201", "411201039", "story_v_out_411201.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_22 = math.max(var_160_13, arg_157_1.talkMaxDuration)

			if var_160_12 <= arg_157_1.time_ and arg_157_1.time_ < var_160_12 + var_160_22 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_12) / var_160_22

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_12 + var_160_22 and arg_157_1.time_ < var_160_12 + var_160_22 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play411201040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 411201040
		arg_161_1.duration_ = 4.7

		local var_161_0 = {
			zh = 4.266,
			ja = 4.7
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
				arg_161_0:Play411201041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1024ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1024ui_story == nil then
				arg_161_1.var_.characterEffect1024ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1024ui_story then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1024ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1024ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1024ui_story.fillRatio = var_164_5
			end

			local var_164_6 = arg_161_1.actors_["4010ui_story"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 and arg_161_1.var_.characterEffect4010ui_story == nil then
				arg_161_1.var_.characterEffect4010ui_story = var_164_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_8 = 0.200000002980232

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_8 then
				local var_164_9 = (arg_161_1.time_ - var_164_7) / var_164_8

				if arg_161_1.var_.characterEffect4010ui_story then
					arg_161_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_8 and arg_161_1.time_ < var_164_7 + var_164_8 + arg_164_0 and arg_161_1.var_.characterEffect4010ui_story then
				arg_161_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_164_10 = 0
			local var_164_11 = 0.325

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_12 = arg_161_1:FormatText(StoryNameCfg[42].name)

				arg_161_1.leftNameTxt_.text = var_164_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_13 = arg_161_1:GetWordFromCfg(411201040)
				local var_164_14 = arg_161_1:FormatText(var_164_13.content)

				arg_161_1.text_.text = var_164_14

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_15 = 13
				local var_164_16 = utf8.len(var_164_14)
				local var_164_17 = var_164_15 <= 0 and var_164_11 or var_164_11 * (var_164_16 / var_164_15)

				if var_164_17 > 0 and var_164_11 < var_164_17 then
					arg_161_1.talkMaxDuration = var_164_17

					if var_164_17 + var_164_10 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_17 + var_164_10
					end
				end

				arg_161_1.text_.text = var_164_14
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201040", "story_v_out_411201.awb") ~= 0 then
					local var_164_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201040", "story_v_out_411201.awb") / 1000

					if var_164_18 + var_164_10 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_18 + var_164_10
					end

					if var_164_13.prefab_name ~= "" and arg_161_1.actors_[var_164_13.prefab_name] ~= nil then
						local var_164_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_13.prefab_name].transform, "story_v_out_411201", "411201040", "story_v_out_411201.awb")

						arg_161_1:RecordAudio("411201040", var_164_19)
						arg_161_1:RecordAudio("411201040", var_164_19)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_411201", "411201040", "story_v_out_411201.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_411201", "411201040", "story_v_out_411201.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_20 = math.max(var_164_11, arg_161_1.talkMaxDuration)

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_20 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_10) / var_164_20

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_10 + var_164_20 and arg_161_1.time_ < var_164_10 + var_164_20 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play411201041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 411201041
		arg_165_1.duration_ = 3.466

		local var_165_0 = {
			zh = 3.466,
			ja = 3.133
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
				arg_165_0:Play411201042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["4010ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect4010ui_story == nil then
				arg_165_1.var_.characterEffect4010ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect4010ui_story then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_165_1.var_.characterEffect4010ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect4010ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_165_1.var_.characterEffect4010ui_story.fillRatio = var_168_5
			end

			local var_168_6 = arg_165_1.actors_["1024ui_story"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 and arg_165_1.var_.characterEffect1024ui_story == nil then
				arg_165_1.var_.characterEffect1024ui_story = var_168_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_8 = 0.200000002980232

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_8 then
				local var_168_9 = (arg_165_1.time_ - var_168_7) / var_168_8

				if arg_165_1.var_.characterEffect1024ui_story then
					arg_165_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_8 and arg_165_1.time_ < var_168_7 + var_168_8 + arg_168_0 and arg_165_1.var_.characterEffect1024ui_story then
				arg_165_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_168_10 = 0
			local var_168_11 = 0.475

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_12 = arg_165_1:FormatText(StoryNameCfg[265].name)

				arg_165_1.leftNameTxt_.text = var_168_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_13 = arg_165_1:GetWordFromCfg(411201041)
				local var_168_14 = arg_165_1:FormatText(var_168_13.content)

				arg_165_1.text_.text = var_168_14

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_15 = 19
				local var_168_16 = utf8.len(var_168_14)
				local var_168_17 = var_168_15 <= 0 and var_168_11 or var_168_11 * (var_168_16 / var_168_15)

				if var_168_17 > 0 and var_168_11 < var_168_17 then
					arg_165_1.talkMaxDuration = var_168_17

					if var_168_17 + var_168_10 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_17 + var_168_10
					end
				end

				arg_165_1.text_.text = var_168_14
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201041", "story_v_out_411201.awb") ~= 0 then
					local var_168_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201041", "story_v_out_411201.awb") / 1000

					if var_168_18 + var_168_10 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_18 + var_168_10
					end

					if var_168_13.prefab_name ~= "" and arg_165_1.actors_[var_168_13.prefab_name] ~= nil then
						local var_168_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_13.prefab_name].transform, "story_v_out_411201", "411201041", "story_v_out_411201.awb")

						arg_165_1:RecordAudio("411201041", var_168_19)
						arg_165_1:RecordAudio("411201041", var_168_19)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_411201", "411201041", "story_v_out_411201.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_411201", "411201041", "story_v_out_411201.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_20 = math.max(var_168_11, arg_165_1.talkMaxDuration)

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_20 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_10) / var_168_20

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_10 + var_168_20 and arg_165_1.time_ < var_168_10 + var_168_20 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play411201042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 411201042
		arg_169_1.duration_ = 7.533

		local var_169_0 = {
			zh = 5.033,
			ja = 7.533
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
				arg_169_0:Play411201043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.6

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[265].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(411201042)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201042", "story_v_out_411201.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201042", "story_v_out_411201.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_411201", "411201042", "story_v_out_411201.awb")

						arg_169_1:RecordAudio("411201042", var_172_9)
						arg_169_1:RecordAudio("411201042", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_411201", "411201042", "story_v_out_411201.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_411201", "411201042", "story_v_out_411201.awb")
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
	Play411201043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 411201043
		arg_173_1.duration_ = 10.166

		local var_173_0 = {
			zh = 6.366,
			ja = 10.166
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
				arg_173_0:Play411201044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.825

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[265].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(411201043)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201043", "story_v_out_411201.awb") ~= 0 then
					local var_176_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201043", "story_v_out_411201.awb") / 1000

					if var_176_8 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_0
					end

					if var_176_3.prefab_name ~= "" and arg_173_1.actors_[var_176_3.prefab_name] ~= nil then
						local var_176_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_3.prefab_name].transform, "story_v_out_411201", "411201043", "story_v_out_411201.awb")

						arg_173_1:RecordAudio("411201043", var_176_9)
						arg_173_1:RecordAudio("411201043", var_176_9)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_411201", "411201043", "story_v_out_411201.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_411201", "411201043", "story_v_out_411201.awb")
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
	Play411201044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 411201044
		arg_177_1.duration_ = 2.666

		local var_177_0 = {
			zh = 2.433,
			ja = 2.666
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
				arg_177_0:Play411201045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.325

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[265].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(411201044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201044", "story_v_out_411201.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201044", "story_v_out_411201.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_411201", "411201044", "story_v_out_411201.awb")

						arg_177_1:RecordAudio("411201044", var_180_9)
						arg_177_1:RecordAudio("411201044", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_411201", "411201044", "story_v_out_411201.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_411201", "411201044", "story_v_out_411201.awb")
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
	Play411201045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 411201045
		arg_181_1.duration_ = 3.2

		local var_181_0 = {
			zh = 3.2,
			ja = 2.3
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
				arg_181_0:Play411201046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1024ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1024ui_story == nil then
				arg_181_1.var_.characterEffect1024ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1024ui_story then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1024ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1024ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1024ui_story.fillRatio = var_184_5
			end

			local var_184_6 = arg_181_1.actors_["4010ui_story"]
			local var_184_7 = 0

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 and arg_181_1.var_.characterEffect4010ui_story == nil then
				arg_181_1.var_.characterEffect4010ui_story = var_184_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_8 = 0.200000002980232

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_8 then
				local var_184_9 = (arg_181_1.time_ - var_184_7) / var_184_8

				if arg_181_1.var_.characterEffect4010ui_story then
					arg_181_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_7 + var_184_8 and arg_181_1.time_ < var_184_7 + var_184_8 + arg_184_0 and arg_181_1.var_.characterEffect4010ui_story then
				arg_181_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				arg_181_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_184_11 = 0
			local var_184_12 = 0.275

			if var_184_11 < arg_181_1.time_ and arg_181_1.time_ <= var_184_11 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_13 = arg_181_1:FormatText(StoryNameCfg[42].name)

				arg_181_1.leftNameTxt_.text = var_184_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(411201045)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 11
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_12 or var_184_12 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_12 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_11
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201045", "story_v_out_411201.awb") ~= 0 then
					local var_184_19 = manager.audio:GetVoiceLength("story_v_out_411201", "411201045", "story_v_out_411201.awb") / 1000

					if var_184_19 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_11
					end

					if var_184_14.prefab_name ~= "" and arg_181_1.actors_[var_184_14.prefab_name] ~= nil then
						local var_184_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_14.prefab_name].transform, "story_v_out_411201", "411201045", "story_v_out_411201.awb")

						arg_181_1:RecordAudio("411201045", var_184_20)
						arg_181_1:RecordAudio("411201045", var_184_20)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_411201", "411201045", "story_v_out_411201.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_411201", "411201045", "story_v_out_411201.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_12, arg_181_1.talkMaxDuration)

			if var_184_11 <= arg_181_1.time_ and arg_181_1.time_ < var_184_11 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_11) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_11 + var_184_21 and arg_181_1.time_ < var_184_11 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play411201046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 411201046
		arg_185_1.duration_ = 6.833

		local var_185_0 = {
			zh = 6.833,
			ja = 2.6
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
				arg_185_0:Play411201047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.625

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[42].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(411201046)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201046", "story_v_out_411201.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201046", "story_v_out_411201.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_411201", "411201046", "story_v_out_411201.awb")

						arg_185_1:RecordAudio("411201046", var_188_9)
						arg_185_1:RecordAudio("411201046", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_411201", "411201046", "story_v_out_411201.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_411201", "411201046", "story_v_out_411201.awb")
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
	Play411201047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 411201047
		arg_189_1.duration_ = 5.166

		local var_189_0 = {
			zh = 5.166,
			ja = 3.433
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
				arg_189_0:Play411201048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.35

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[42].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(411201047)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201047", "story_v_out_411201.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201047", "story_v_out_411201.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_411201", "411201047", "story_v_out_411201.awb")

						arg_189_1:RecordAudio("411201047", var_192_9)
						arg_189_1:RecordAudio("411201047", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_411201", "411201047", "story_v_out_411201.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_411201", "411201047", "story_v_out_411201.awb")
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
	Play411201048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 411201048
		arg_193_1.duration_ = 2.433

		local var_193_0 = {
			zh = 2.433,
			ja = 2
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
				arg_193_0:Play411201049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.2

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[42].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(411201048)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201048", "story_v_out_411201.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201048", "story_v_out_411201.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_411201", "411201048", "story_v_out_411201.awb")

						arg_193_1:RecordAudio("411201048", var_196_9)
						arg_193_1:RecordAudio("411201048", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_411201", "411201048", "story_v_out_411201.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_411201", "411201048", "story_v_out_411201.awb")
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
	Play411201049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 411201049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play411201050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["4010ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect4010ui_story == nil then
				arg_197_1.var_.characterEffect4010ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect4010ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_197_1.var_.characterEffect4010ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect4010ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_197_1.var_.characterEffect4010ui_story.fillRatio = var_200_5
			end

			local var_200_6 = 0
			local var_200_7 = 0.825

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_8 = arg_197_1:GetWordFromCfg(411201049)
				local var_200_9 = arg_197_1:FormatText(var_200_8.content)

				arg_197_1.text_.text = var_200_9

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_10 = 33
				local var_200_11 = utf8.len(var_200_9)
				local var_200_12 = var_200_10 <= 0 and var_200_7 or var_200_7 * (var_200_11 / var_200_10)

				if var_200_12 > 0 and var_200_7 < var_200_12 then
					arg_197_1.talkMaxDuration = var_200_12

					if var_200_12 + var_200_6 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_12 + var_200_6
					end
				end

				arg_197_1.text_.text = var_200_9
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_13 = math.max(var_200_7, arg_197_1.talkMaxDuration)

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_13 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_6) / var_200_13

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_6 + var_200_13 and arg_197_1.time_ < var_200_6 + var_200_13 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play411201050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 411201050
		arg_201_1.duration_ = 8.733

		local var_201_0 = {
			zh = 8.733,
			ja = 3.533
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
				arg_201_0:Play411201051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["4010ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect4010ui_story == nil then
				arg_201_1.var_.characterEffect4010ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect4010ui_story then
					arg_201_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect4010ui_story then
				arg_201_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_204_4 = 0

			if var_204_4 < arg_201_1.time_ and arg_201_1.time_ <= var_204_4 + arg_204_0 then
				arg_201_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action3_1")
			end

			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 then
				arg_201_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_6 = 0
			local var_204_7 = 0.8

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_8 = arg_201_1:FormatText(StoryNameCfg[42].name)

				arg_201_1.leftNameTxt_.text = var_204_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_9 = arg_201_1:GetWordFromCfg(411201050)
				local var_204_10 = arg_201_1:FormatText(var_204_9.content)

				arg_201_1.text_.text = var_204_10

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_11 = 32
				local var_204_12 = utf8.len(var_204_10)
				local var_204_13 = var_204_11 <= 0 and var_204_7 or var_204_7 * (var_204_12 / var_204_11)

				if var_204_13 > 0 and var_204_7 < var_204_13 then
					arg_201_1.talkMaxDuration = var_204_13

					if var_204_13 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_13 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_10
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201050", "story_v_out_411201.awb") ~= 0 then
					local var_204_14 = manager.audio:GetVoiceLength("story_v_out_411201", "411201050", "story_v_out_411201.awb") / 1000

					if var_204_14 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_14 + var_204_6
					end

					if var_204_9.prefab_name ~= "" and arg_201_1.actors_[var_204_9.prefab_name] ~= nil then
						local var_204_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_9.prefab_name].transform, "story_v_out_411201", "411201050", "story_v_out_411201.awb")

						arg_201_1:RecordAudio("411201050", var_204_15)
						arg_201_1:RecordAudio("411201050", var_204_15)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_411201", "411201050", "story_v_out_411201.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_411201", "411201050", "story_v_out_411201.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_16 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_16 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_16

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_16 and arg_201_1.time_ < var_204_6 + var_204_16 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play411201051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 411201051
		arg_205_1.duration_ = 8.3

		local var_205_0 = {
			zh = 8.3,
			ja = 6.6
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
				arg_205_0:Play411201052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action3_2")
			end

			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_208_2 = 0
			local var_208_3 = 0.725

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_4 = arg_205_1:FormatText(StoryNameCfg[42].name)

				arg_205_1.leftNameTxt_.text = var_208_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_5 = arg_205_1:GetWordFromCfg(411201051)
				local var_208_6 = arg_205_1:FormatText(var_208_5.content)

				arg_205_1.text_.text = var_208_6

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_7 = 29
				local var_208_8 = utf8.len(var_208_6)
				local var_208_9 = var_208_7 <= 0 and var_208_3 or var_208_3 * (var_208_8 / var_208_7)

				if var_208_9 > 0 and var_208_3 < var_208_9 then
					arg_205_1.talkMaxDuration = var_208_9

					if var_208_9 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_9 + var_208_2
					end
				end

				arg_205_1.text_.text = var_208_6
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201051", "story_v_out_411201.awb") ~= 0 then
					local var_208_10 = manager.audio:GetVoiceLength("story_v_out_411201", "411201051", "story_v_out_411201.awb") / 1000

					if var_208_10 + var_208_2 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_10 + var_208_2
					end

					if var_208_5.prefab_name ~= "" and arg_205_1.actors_[var_208_5.prefab_name] ~= nil then
						local var_208_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_5.prefab_name].transform, "story_v_out_411201", "411201051", "story_v_out_411201.awb")

						arg_205_1:RecordAudio("411201051", var_208_11)
						arg_205_1:RecordAudio("411201051", var_208_11)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_411201", "411201051", "story_v_out_411201.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_411201", "411201051", "story_v_out_411201.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_12 = math.max(var_208_3, arg_205_1.talkMaxDuration)

			if var_208_2 <= arg_205_1.time_ and arg_205_1.time_ < var_208_2 + var_208_12 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_2) / var_208_12

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_2 + var_208_12 and arg_205_1.time_ < var_208_2 + var_208_12 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play411201052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 411201052
		arg_209_1.duration_ = 2.7

		local var_209_0 = {
			zh = 1.999999999999,
			ja = 2.7
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
				arg_209_0:Play411201053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1024ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1024ui_story == nil then
				arg_209_1.var_.characterEffect1024ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1024ui_story then
					arg_209_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1024ui_story then
				arg_209_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_212_4 = 0

			if var_212_4 < arg_209_1.time_ and arg_209_1.time_ <= var_212_4 + arg_212_0 then
				arg_209_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action6_1")
			end

			local var_212_5 = 0

			if var_212_5 < arg_209_1.time_ and arg_209_1.time_ <= var_212_5 + arg_212_0 then
				arg_209_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_212_6 = arg_209_1.actors_["4010ui_story"]
			local var_212_7 = 0

			if var_212_7 < arg_209_1.time_ and arg_209_1.time_ <= var_212_7 + arg_212_0 and arg_209_1.var_.characterEffect4010ui_story == nil then
				arg_209_1.var_.characterEffect4010ui_story = var_212_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_8 = 0.200000002980232

			if var_212_7 <= arg_209_1.time_ and arg_209_1.time_ < var_212_7 + var_212_8 then
				local var_212_9 = (arg_209_1.time_ - var_212_7) / var_212_8

				if arg_209_1.var_.characterEffect4010ui_story then
					local var_212_10 = Mathf.Lerp(0, 0.5, var_212_9)

					arg_209_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_209_1.var_.characterEffect4010ui_story.fillRatio = var_212_10
				end
			end

			if arg_209_1.time_ >= var_212_7 + var_212_8 and arg_209_1.time_ < var_212_7 + var_212_8 + arg_212_0 and arg_209_1.var_.characterEffect4010ui_story then
				local var_212_11 = 0.5

				arg_209_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_209_1.var_.characterEffect4010ui_story.fillRatio = var_212_11
			end

			local var_212_12 = 0
			local var_212_13 = 0.225

			if var_212_12 < arg_209_1.time_ and arg_209_1.time_ <= var_212_12 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_14 = arg_209_1:FormatText(StoryNameCfg[265].name)

				arg_209_1.leftNameTxt_.text = var_212_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_15 = arg_209_1:GetWordFromCfg(411201052)
				local var_212_16 = arg_209_1:FormatText(var_212_15.content)

				arg_209_1.text_.text = var_212_16

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_17 = 9
				local var_212_18 = utf8.len(var_212_16)
				local var_212_19 = var_212_17 <= 0 and var_212_13 or var_212_13 * (var_212_18 / var_212_17)

				if var_212_19 > 0 and var_212_13 < var_212_19 then
					arg_209_1.talkMaxDuration = var_212_19

					if var_212_19 + var_212_12 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_12
					end
				end

				arg_209_1.text_.text = var_212_16
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201052", "story_v_out_411201.awb") ~= 0 then
					local var_212_20 = manager.audio:GetVoiceLength("story_v_out_411201", "411201052", "story_v_out_411201.awb") / 1000

					if var_212_20 + var_212_12 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_20 + var_212_12
					end

					if var_212_15.prefab_name ~= "" and arg_209_1.actors_[var_212_15.prefab_name] ~= nil then
						local var_212_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_15.prefab_name].transform, "story_v_out_411201", "411201052", "story_v_out_411201.awb")

						arg_209_1:RecordAudio("411201052", var_212_21)
						arg_209_1:RecordAudio("411201052", var_212_21)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_411201", "411201052", "story_v_out_411201.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_411201", "411201052", "story_v_out_411201.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_22 = math.max(var_212_13, arg_209_1.talkMaxDuration)

			if var_212_12 <= arg_209_1.time_ and arg_209_1.time_ < var_212_12 + var_212_22 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_12) / var_212_22

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_12 + var_212_22 and arg_209_1.time_ < var_212_12 + var_212_22 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play411201053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 411201053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play411201054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1024ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1024ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1024ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1024ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1024ui_story == nil then
				arg_213_1.var_.characterEffect1024ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1024ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1024ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1024ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1024ui_story.fillRatio = var_216_14
			end

			local var_216_15 = arg_213_1.actors_["4010ui_story"].transform
			local var_216_16 = 0

			if var_216_16 < arg_213_1.time_ and arg_213_1.time_ <= var_216_16 + arg_216_0 then
				arg_213_1.var_.moveOldPos4010ui_story = var_216_15.localPosition
			end

			local var_216_17 = 0.001

			if var_216_16 <= arg_213_1.time_ and arg_213_1.time_ < var_216_16 + var_216_17 then
				local var_216_18 = (arg_213_1.time_ - var_216_16) / var_216_17
				local var_216_19 = Vector3.New(0, 100, 0)

				var_216_15.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos4010ui_story, var_216_19, var_216_18)

				local var_216_20 = manager.ui.mainCamera.transform.position - var_216_15.position

				var_216_15.forward = Vector3.New(var_216_20.x, var_216_20.y, var_216_20.z)

				local var_216_21 = var_216_15.localEulerAngles

				var_216_21.z = 0
				var_216_21.x = 0
				var_216_15.localEulerAngles = var_216_21
			end

			if arg_213_1.time_ >= var_216_16 + var_216_17 and arg_213_1.time_ < var_216_16 + var_216_17 + arg_216_0 then
				var_216_15.localPosition = Vector3.New(0, 100, 0)

				local var_216_22 = manager.ui.mainCamera.transform.position - var_216_15.position

				var_216_15.forward = Vector3.New(var_216_22.x, var_216_22.y, var_216_22.z)

				local var_216_23 = var_216_15.localEulerAngles

				var_216_23.z = 0
				var_216_23.x = 0
				var_216_15.localEulerAngles = var_216_23
			end

			local var_216_24 = 0

			if var_216_24 < arg_213_1.time_ and arg_213_1.time_ <= var_216_24 + arg_216_0 then
				arg_213_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_216_25 = 0
			local var_216_26 = 1.4

			if var_216_25 < arg_213_1.time_ and arg_213_1.time_ <= var_216_25 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_27 = arg_213_1:GetWordFromCfg(411201053)
				local var_216_28 = arg_213_1:FormatText(var_216_27.content)

				arg_213_1.text_.text = var_216_28

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_29 = 56
				local var_216_30 = utf8.len(var_216_28)
				local var_216_31 = var_216_29 <= 0 and var_216_26 or var_216_26 * (var_216_30 / var_216_29)

				if var_216_31 > 0 and var_216_26 < var_216_31 then
					arg_213_1.talkMaxDuration = var_216_31

					if var_216_31 + var_216_25 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_31 + var_216_25
					end
				end

				arg_213_1.text_.text = var_216_28
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_32 = math.max(var_216_26, arg_213_1.talkMaxDuration)

			if var_216_25 <= arg_213_1.time_ and arg_213_1.time_ < var_216_25 + var_216_32 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_25) / var_216_32

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_25 + var_216_32 and arg_213_1.time_ < var_216_25 + var_216_32 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play411201054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 411201054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play411201055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(411201054)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 40
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_7 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_7 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_7

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_7 and arg_217_1.time_ < var_220_0 + var_220_7 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play411201055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 411201055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play411201056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.7

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_2 = arg_221_1:GetWordFromCfg(411201055)
				local var_224_3 = arg_221_1:FormatText(var_224_2.content)

				arg_221_1.text_.text = var_224_3

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_4 = 28
				local var_224_5 = utf8.len(var_224_3)
				local var_224_6 = var_224_4 <= 0 and var_224_1 or var_224_1 * (var_224_5 / var_224_4)

				if var_224_6 > 0 and var_224_1 < var_224_6 then
					arg_221_1.talkMaxDuration = var_224_6

					if var_224_6 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_6 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_3
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_7 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_7 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_7

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_7 and arg_221_1.time_ < var_224_0 + var_224_7 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play411201056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 411201056
		arg_225_1.duration_ = 12.7

		local var_225_0 = {
			zh = 11.5,
			ja = 12.7
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
				arg_225_0:Play411201057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["4010ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos4010ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, -1.59, -5.2)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos4010ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["4010ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect4010ui_story == nil then
				arg_225_1.var_.characterEffect4010ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect4010ui_story then
					arg_225_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect4010ui_story then
				arg_225_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_228_13 = 0

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_1")
			end

			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_228_15 = 0
			local var_228_16 = 1.125

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_17 = arg_225_1:FormatText(StoryNameCfg[42].name)

				arg_225_1.leftNameTxt_.text = var_228_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_18 = arg_225_1:GetWordFromCfg(411201056)
				local var_228_19 = arg_225_1:FormatText(var_228_18.content)

				arg_225_1.text_.text = var_228_19

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_20 = 45
				local var_228_21 = utf8.len(var_228_19)
				local var_228_22 = var_228_20 <= 0 and var_228_16 or var_228_16 * (var_228_21 / var_228_20)

				if var_228_22 > 0 and var_228_16 < var_228_22 then
					arg_225_1.talkMaxDuration = var_228_22

					if var_228_22 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_22 + var_228_15
					end
				end

				arg_225_1.text_.text = var_228_19
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201056", "story_v_out_411201.awb") ~= 0 then
					local var_228_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201056", "story_v_out_411201.awb") / 1000

					if var_228_23 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_23 + var_228_15
					end

					if var_228_18.prefab_name ~= "" and arg_225_1.actors_[var_228_18.prefab_name] ~= nil then
						local var_228_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_18.prefab_name].transform, "story_v_out_411201", "411201056", "story_v_out_411201.awb")

						arg_225_1:RecordAudio("411201056", var_228_24)
						arg_225_1:RecordAudio("411201056", var_228_24)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_411201", "411201056", "story_v_out_411201.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_411201", "411201056", "story_v_out_411201.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_25 = math.max(var_228_16, arg_225_1.talkMaxDuration)

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_25 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_15) / var_228_25

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_15 + var_228_25 and arg_225_1.time_ < var_228_15 + var_228_25 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play411201057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 411201057
		arg_229_1.duration_ = 7.2

		local var_229_0 = {
			zh = 7.033,
			ja = 7.2
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
				arg_229_0:Play411201058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["4010ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos4010ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0.7, -1.59, -5.2)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos4010ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0.7, -1.59, -5.2)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["4010ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect4010ui_story == nil then
				arg_229_1.var_.characterEffect4010ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect4010ui_story then
					local var_232_13 = Mathf.Lerp(0, 0.5, var_232_12)

					arg_229_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_229_1.var_.characterEffect4010ui_story.fillRatio = var_232_13
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect4010ui_story then
				local var_232_14 = 0.5

				arg_229_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_229_1.var_.characterEffect4010ui_story.fillRatio = var_232_14
			end

			local var_232_15 = arg_229_1.actors_["1024ui_story"].transform
			local var_232_16 = 0

			if var_232_16 < arg_229_1.time_ and arg_229_1.time_ <= var_232_16 + arg_232_0 then
				arg_229_1.var_.moveOldPos1024ui_story = var_232_15.localPosition
			end

			local var_232_17 = 0.001

			if var_232_16 <= arg_229_1.time_ and arg_229_1.time_ < var_232_16 + var_232_17 then
				local var_232_18 = (arg_229_1.time_ - var_232_16) / var_232_17
				local var_232_19 = Vector3.New(-0.7, -1, -6.05)

				var_232_15.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1024ui_story, var_232_19, var_232_18)

				local var_232_20 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_20.x, var_232_20.y, var_232_20.z)

				local var_232_21 = var_232_15.localEulerAngles

				var_232_21.z = 0
				var_232_21.x = 0
				var_232_15.localEulerAngles = var_232_21
			end

			if arg_229_1.time_ >= var_232_16 + var_232_17 and arg_229_1.time_ < var_232_16 + var_232_17 + arg_232_0 then
				var_232_15.localPosition = Vector3.New(-0.7, -1, -6.05)

				local var_232_22 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_22.x, var_232_22.y, var_232_22.z)

				local var_232_23 = var_232_15.localEulerAngles

				var_232_23.z = 0
				var_232_23.x = 0
				var_232_15.localEulerAngles = var_232_23
			end

			local var_232_24 = arg_229_1.actors_["1024ui_story"]
			local var_232_25 = 0

			if var_232_25 < arg_229_1.time_ and arg_229_1.time_ <= var_232_25 + arg_232_0 and arg_229_1.var_.characterEffect1024ui_story == nil then
				arg_229_1.var_.characterEffect1024ui_story = var_232_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_26 = 0.200000002980232

			if var_232_25 <= arg_229_1.time_ and arg_229_1.time_ < var_232_25 + var_232_26 then
				local var_232_27 = (arg_229_1.time_ - var_232_25) / var_232_26

				if arg_229_1.var_.characterEffect1024ui_story then
					arg_229_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_25 + var_232_26 and arg_229_1.time_ < var_232_25 + var_232_26 + arg_232_0 and arg_229_1.var_.characterEffect1024ui_story then
				arg_229_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_232_28 = 0

			if var_232_28 < arg_229_1.time_ and arg_229_1.time_ <= var_232_28 + arg_232_0 then
				arg_229_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_232_29 = 0

			if var_232_29 < arg_229_1.time_ and arg_229_1.time_ <= var_232_29 + arg_232_0 then
				arg_229_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_232_30 = arg_229_1.actors_["4010ui_story"]
			local var_232_31 = 0

			if var_232_31 < arg_229_1.time_ and arg_229_1.time_ <= var_232_31 + arg_232_0 and arg_229_1.var_.characterEffect4010ui_story == nil then
				arg_229_1.var_.characterEffect4010ui_story = var_232_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_32 = 0.200000002980232

			if var_232_31 <= arg_229_1.time_ and arg_229_1.time_ < var_232_31 + var_232_32 then
				local var_232_33 = (arg_229_1.time_ - var_232_31) / var_232_32

				if arg_229_1.var_.characterEffect4010ui_story then
					local var_232_34 = Mathf.Lerp(0, 0.5, var_232_33)

					arg_229_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_229_1.var_.characterEffect4010ui_story.fillRatio = var_232_34
				end
			end

			if arg_229_1.time_ >= var_232_31 + var_232_32 and arg_229_1.time_ < var_232_31 + var_232_32 + arg_232_0 and arg_229_1.var_.characterEffect4010ui_story then
				local var_232_35 = 0.5

				arg_229_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_229_1.var_.characterEffect4010ui_story.fillRatio = var_232_35
			end

			local var_232_36 = 0
			local var_232_37 = 0.875

			if var_232_36 < arg_229_1.time_ and arg_229_1.time_ <= var_232_36 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_38 = arg_229_1:FormatText(StoryNameCfg[265].name)

				arg_229_1.leftNameTxt_.text = var_232_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_39 = arg_229_1:GetWordFromCfg(411201057)
				local var_232_40 = arg_229_1:FormatText(var_232_39.content)

				arg_229_1.text_.text = var_232_40

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_41 = 35
				local var_232_42 = utf8.len(var_232_40)
				local var_232_43 = var_232_41 <= 0 and var_232_37 or var_232_37 * (var_232_42 / var_232_41)

				if var_232_43 > 0 and var_232_37 < var_232_43 then
					arg_229_1.talkMaxDuration = var_232_43

					if var_232_43 + var_232_36 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_43 + var_232_36
					end
				end

				arg_229_1.text_.text = var_232_40
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201057", "story_v_out_411201.awb") ~= 0 then
					local var_232_44 = manager.audio:GetVoiceLength("story_v_out_411201", "411201057", "story_v_out_411201.awb") / 1000

					if var_232_44 + var_232_36 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_44 + var_232_36
					end

					if var_232_39.prefab_name ~= "" and arg_229_1.actors_[var_232_39.prefab_name] ~= nil then
						local var_232_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_39.prefab_name].transform, "story_v_out_411201", "411201057", "story_v_out_411201.awb")

						arg_229_1:RecordAudio("411201057", var_232_45)
						arg_229_1:RecordAudio("411201057", var_232_45)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_411201", "411201057", "story_v_out_411201.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_411201", "411201057", "story_v_out_411201.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_46 = math.max(var_232_37, arg_229_1.talkMaxDuration)

			if var_232_36 <= arg_229_1.time_ and arg_229_1.time_ < var_232_36 + var_232_46 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_36) / var_232_46

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_36 + var_232_46 and arg_229_1.time_ < var_232_36 + var_232_46 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play411201058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 411201058
		arg_233_1.duration_ = 4.1

		local var_233_0 = {
			zh = 1.999999999999,
			ja = 4.1
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
				arg_233_0:Play411201059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1024ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1024ui_story == nil then
				arg_233_1.var_.characterEffect1024ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1024ui_story then
					local var_236_4 = Mathf.Lerp(0, 0.5, var_236_3)

					arg_233_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1024ui_story.fillRatio = var_236_4
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1024ui_story then
				local var_236_5 = 0.5

				arg_233_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1024ui_story.fillRatio = var_236_5
			end

			local var_236_6 = arg_233_1.actors_["4010ui_story"]
			local var_236_7 = 0

			if var_236_7 < arg_233_1.time_ and arg_233_1.time_ <= var_236_7 + arg_236_0 and arg_233_1.var_.characterEffect4010ui_story == nil then
				arg_233_1.var_.characterEffect4010ui_story = var_236_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_8 = 0.200000002980232

			if var_236_7 <= arg_233_1.time_ and arg_233_1.time_ < var_236_7 + var_236_8 then
				local var_236_9 = (arg_233_1.time_ - var_236_7) / var_236_8

				if arg_233_1.var_.characterEffect4010ui_story then
					arg_233_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_7 + var_236_8 and arg_233_1.time_ < var_236_7 + var_236_8 + arg_236_0 and arg_233_1.var_.characterEffect4010ui_story then
				arg_233_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 then
				arg_233_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_2")
			end

			local var_236_11 = 0

			if var_236_11 < arg_233_1.time_ and arg_233_1.time_ <= var_236_11 + arg_236_0 then
				arg_233_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_236_12 = 0
			local var_236_13 = 0.15

			if var_236_12 < arg_233_1.time_ and arg_233_1.time_ <= var_236_12 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_14 = arg_233_1:FormatText(StoryNameCfg[42].name)

				arg_233_1.leftNameTxt_.text = var_236_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_15 = arg_233_1:GetWordFromCfg(411201058)
				local var_236_16 = arg_233_1:FormatText(var_236_15.content)

				arg_233_1.text_.text = var_236_16

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_17 = 6
				local var_236_18 = utf8.len(var_236_16)
				local var_236_19 = var_236_17 <= 0 and var_236_13 or var_236_13 * (var_236_18 / var_236_17)

				if var_236_19 > 0 and var_236_13 < var_236_19 then
					arg_233_1.talkMaxDuration = var_236_19

					if var_236_19 + var_236_12 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_19 + var_236_12
					end
				end

				arg_233_1.text_.text = var_236_16
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201058", "story_v_out_411201.awb") ~= 0 then
					local var_236_20 = manager.audio:GetVoiceLength("story_v_out_411201", "411201058", "story_v_out_411201.awb") / 1000

					if var_236_20 + var_236_12 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_20 + var_236_12
					end

					if var_236_15.prefab_name ~= "" and arg_233_1.actors_[var_236_15.prefab_name] ~= nil then
						local var_236_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_15.prefab_name].transform, "story_v_out_411201", "411201058", "story_v_out_411201.awb")

						arg_233_1:RecordAudio("411201058", var_236_21)
						arg_233_1:RecordAudio("411201058", var_236_21)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_411201", "411201058", "story_v_out_411201.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_411201", "411201058", "story_v_out_411201.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_22 = math.max(var_236_13, arg_233_1.talkMaxDuration)

			if var_236_12 <= arg_233_1.time_ and arg_233_1.time_ < var_236_12 + var_236_22 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_12) / var_236_22

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_12 + var_236_22 and arg_233_1.time_ < var_236_12 + var_236_22 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play411201059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 411201059
		arg_237_1.duration_ = 6.966

		local var_237_0 = {
			zh = 6.966,
			ja = 6.233
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
				arg_237_0:Play411201060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.55

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[42].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(411201059)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 22
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201059", "story_v_out_411201.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201059", "story_v_out_411201.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_411201", "411201059", "story_v_out_411201.awb")

						arg_237_1:RecordAudio("411201059", var_240_9)
						arg_237_1:RecordAudio("411201059", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_411201", "411201059", "story_v_out_411201.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_411201", "411201059", "story_v_out_411201.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play411201060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 411201060
		arg_241_1.duration_ = 6.233

		local var_241_0 = {
			zh = 6.233,
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
				arg_241_0:Play411201061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action2_1")
			end

			local var_244_1 = 0
			local var_244_2 = 0.7

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_3 = arg_241_1:FormatText(StoryNameCfg[42].name)

				arg_241_1.leftNameTxt_.text = var_244_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_4 = arg_241_1:GetWordFromCfg(411201060)
				local var_244_5 = arg_241_1:FormatText(var_244_4.content)

				arg_241_1.text_.text = var_244_5

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_6 = 28
				local var_244_7 = utf8.len(var_244_5)
				local var_244_8 = var_244_6 <= 0 and var_244_2 or var_244_2 * (var_244_7 / var_244_6)

				if var_244_8 > 0 and var_244_2 < var_244_8 then
					arg_241_1.talkMaxDuration = var_244_8

					if var_244_8 + var_244_1 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_1
					end
				end

				arg_241_1.text_.text = var_244_5
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201060", "story_v_out_411201.awb") ~= 0 then
					local var_244_9 = manager.audio:GetVoiceLength("story_v_out_411201", "411201060", "story_v_out_411201.awb") / 1000

					if var_244_9 + var_244_1 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_9 + var_244_1
					end

					if var_244_4.prefab_name ~= "" and arg_241_1.actors_[var_244_4.prefab_name] ~= nil then
						local var_244_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_4.prefab_name].transform, "story_v_out_411201", "411201060", "story_v_out_411201.awb")

						arg_241_1:RecordAudio("411201060", var_244_10)
						arg_241_1:RecordAudio("411201060", var_244_10)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_411201", "411201060", "story_v_out_411201.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_411201", "411201060", "story_v_out_411201.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_11 = math.max(var_244_2, arg_241_1.talkMaxDuration)

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_11 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_1) / var_244_11

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_1 + var_244_11 and arg_241_1.time_ < var_244_1 + var_244_11 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play411201061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 411201061
		arg_245_1.duration_ = 7.5

		local var_245_0 = {
			zh = 7.466,
			ja = 7.5
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
				arg_245_0:Play411201062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.85

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[42].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(411201061)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201061", "story_v_out_411201.awb") ~= 0 then
					local var_248_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201061", "story_v_out_411201.awb") / 1000

					if var_248_8 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_0
					end

					if var_248_3.prefab_name ~= "" and arg_245_1.actors_[var_248_3.prefab_name] ~= nil then
						local var_248_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_3.prefab_name].transform, "story_v_out_411201", "411201061", "story_v_out_411201.awb")

						arg_245_1:RecordAudio("411201061", var_248_9)
						arg_245_1:RecordAudio("411201061", var_248_9)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_411201", "411201061", "story_v_out_411201.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_411201", "411201061", "story_v_out_411201.awb")
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
	Play411201062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 411201062
		arg_249_1.duration_ = 12.366

		local var_249_0 = {
			zh = 12.366,
			ja = 7.966
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
				arg_249_0:Play411201063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 1.275

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[42].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(411201062)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201062", "story_v_out_411201.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201062", "story_v_out_411201.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_411201", "411201062", "story_v_out_411201.awb")

						arg_249_1:RecordAudio("411201062", var_252_9)
						arg_249_1:RecordAudio("411201062", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_411201", "411201062", "story_v_out_411201.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_411201", "411201062", "story_v_out_411201.awb")
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
	Play411201063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 411201063
		arg_253_1.duration_ = 6.533

		local var_253_0 = {
			zh = 6.233,
			ja = 6.533
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
				arg_253_0:Play411201064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.625

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[42].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(411201063)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201063", "story_v_out_411201.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201063", "story_v_out_411201.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_411201", "411201063", "story_v_out_411201.awb")

						arg_253_1:RecordAudio("411201063", var_256_9)
						arg_253_1:RecordAudio("411201063", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_411201", "411201063", "story_v_out_411201.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_411201", "411201063", "story_v_out_411201.awb")
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
	Play411201064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 411201064
		arg_257_1.duration_ = 9.2

		local var_257_0 = {
			zh = 9.2,
			ja = 8.566
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
				arg_257_0:Play411201065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.925

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[42].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(411201064)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 37
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201064", "story_v_out_411201.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201064", "story_v_out_411201.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_411201", "411201064", "story_v_out_411201.awb")

						arg_257_1:RecordAudio("411201064", var_260_9)
						arg_257_1:RecordAudio("411201064", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_411201", "411201064", "story_v_out_411201.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_411201", "411201064", "story_v_out_411201.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_10 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_10 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_10

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_10 and arg_257_1.time_ < var_260_0 + var_260_10 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play411201065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 411201065
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play411201066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["4010ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos4010ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, 100, 0)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos4010ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, 100, 0)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = arg_261_1.actors_["4010ui_story"]
			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 and arg_261_1.var_.characterEffect4010ui_story == nil then
				arg_261_1.var_.characterEffect4010ui_story = var_264_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_11 = 0.200000002980232

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				local var_264_12 = (arg_261_1.time_ - var_264_10) / var_264_11

				if arg_261_1.var_.characterEffect4010ui_story then
					local var_264_13 = Mathf.Lerp(0, 0.5, var_264_12)

					arg_261_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_261_1.var_.characterEffect4010ui_story.fillRatio = var_264_13
				end
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 and arg_261_1.var_.characterEffect4010ui_story then
				local var_264_14 = 0.5

				arg_261_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_261_1.var_.characterEffect4010ui_story.fillRatio = var_264_14
			end

			local var_264_15 = arg_261_1.actors_["1024ui_story"].transform
			local var_264_16 = 0

			if var_264_16 < arg_261_1.time_ and arg_261_1.time_ <= var_264_16 + arg_264_0 then
				arg_261_1.var_.moveOldPos1024ui_story = var_264_15.localPosition
			end

			local var_264_17 = 0.001

			if var_264_16 <= arg_261_1.time_ and arg_261_1.time_ < var_264_16 + var_264_17 then
				local var_264_18 = (arg_261_1.time_ - var_264_16) / var_264_17
				local var_264_19 = Vector3.New(0, 100, 0)

				var_264_15.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1024ui_story, var_264_19, var_264_18)

				local var_264_20 = manager.ui.mainCamera.transform.position - var_264_15.position

				var_264_15.forward = Vector3.New(var_264_20.x, var_264_20.y, var_264_20.z)

				local var_264_21 = var_264_15.localEulerAngles

				var_264_21.z = 0
				var_264_21.x = 0
				var_264_15.localEulerAngles = var_264_21
			end

			if arg_261_1.time_ >= var_264_16 + var_264_17 and arg_261_1.time_ < var_264_16 + var_264_17 + arg_264_0 then
				var_264_15.localPosition = Vector3.New(0, 100, 0)

				local var_264_22 = manager.ui.mainCamera.transform.position - var_264_15.position

				var_264_15.forward = Vector3.New(var_264_22.x, var_264_22.y, var_264_22.z)

				local var_264_23 = var_264_15.localEulerAngles

				var_264_23.z = 0
				var_264_23.x = 0
				var_264_15.localEulerAngles = var_264_23
			end

			local var_264_24 = arg_261_1.actors_["1024ui_story"]
			local var_264_25 = 0

			if var_264_25 < arg_261_1.time_ and arg_261_1.time_ <= var_264_25 + arg_264_0 and arg_261_1.var_.characterEffect1024ui_story == nil then
				arg_261_1.var_.characterEffect1024ui_story = var_264_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_26 = 0.200000002980232

			if var_264_25 <= arg_261_1.time_ and arg_261_1.time_ < var_264_25 + var_264_26 then
				local var_264_27 = (arg_261_1.time_ - var_264_25) / var_264_26

				if arg_261_1.var_.characterEffect1024ui_story then
					local var_264_28 = Mathf.Lerp(0, 0.5, var_264_27)

					arg_261_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1024ui_story.fillRatio = var_264_28
				end
			end

			if arg_261_1.time_ >= var_264_25 + var_264_26 and arg_261_1.time_ < var_264_25 + var_264_26 + arg_264_0 and arg_261_1.var_.characterEffect1024ui_story then
				local var_264_29 = 0.5

				arg_261_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1024ui_story.fillRatio = var_264_29
			end

			local var_264_30 = 0
			local var_264_31 = 1

			if var_264_30 < arg_261_1.time_ and arg_261_1.time_ <= var_264_30 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_32 = arg_261_1:GetWordFromCfg(411201065)
				local var_264_33 = arg_261_1:FormatText(var_264_32.content)

				arg_261_1.text_.text = var_264_33

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_34 = 40
				local var_264_35 = utf8.len(var_264_33)
				local var_264_36 = var_264_34 <= 0 and var_264_31 or var_264_31 * (var_264_35 / var_264_34)

				if var_264_36 > 0 and var_264_31 < var_264_36 then
					arg_261_1.talkMaxDuration = var_264_36

					if var_264_36 + var_264_30 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_36 + var_264_30
					end
				end

				arg_261_1.text_.text = var_264_33
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_37 = math.max(var_264_31, arg_261_1.talkMaxDuration)

			if var_264_30 <= arg_261_1.time_ and arg_261_1.time_ < var_264_30 + var_264_37 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_30) / var_264_37

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_30 + var_264_37 and arg_261_1.time_ < var_264_30 + var_264_37 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play411201066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 411201066
		arg_265_1.duration_ = 5.866

		local var_265_0 = {
			zh = 5.866,
			ja = 4.133
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
				arg_265_0:Play411201067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1024ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1024ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(0, -1, -6.05)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1024ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -1, -6.05)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = arg_265_1.actors_["1024ui_story"]
			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect1024ui_story == nil then
				arg_265_1.var_.characterEffect1024ui_story = var_268_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_11 = 0.200000002980232

			if var_268_10 <= arg_265_1.time_ and arg_265_1.time_ < var_268_10 + var_268_11 then
				local var_268_12 = (arg_265_1.time_ - var_268_10) / var_268_11

				if arg_265_1.var_.characterEffect1024ui_story then
					arg_265_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_10 + var_268_11 and arg_265_1.time_ < var_268_10 + var_268_11 + arg_268_0 and arg_265_1.var_.characterEffect1024ui_story then
				arg_265_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_268_13 = 0

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 then
				arg_265_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_268_15 = 0
			local var_268_16 = 0.8

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_17 = arg_265_1:FormatText(StoryNameCfg[265].name)

				arg_265_1.leftNameTxt_.text = var_268_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_18 = arg_265_1:GetWordFromCfg(411201066)
				local var_268_19 = arg_265_1:FormatText(var_268_18.content)

				arg_265_1.text_.text = var_268_19

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_20 = 32
				local var_268_21 = utf8.len(var_268_19)
				local var_268_22 = var_268_20 <= 0 and var_268_16 or var_268_16 * (var_268_21 / var_268_20)

				if var_268_22 > 0 and var_268_16 < var_268_22 then
					arg_265_1.talkMaxDuration = var_268_22

					if var_268_22 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_22 + var_268_15
					end
				end

				arg_265_1.text_.text = var_268_19
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201066", "story_v_out_411201.awb") ~= 0 then
					local var_268_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201066", "story_v_out_411201.awb") / 1000

					if var_268_23 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_23 + var_268_15
					end

					if var_268_18.prefab_name ~= "" and arg_265_1.actors_[var_268_18.prefab_name] ~= nil then
						local var_268_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_18.prefab_name].transform, "story_v_out_411201", "411201066", "story_v_out_411201.awb")

						arg_265_1:RecordAudio("411201066", var_268_24)
						arg_265_1:RecordAudio("411201066", var_268_24)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_411201", "411201066", "story_v_out_411201.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_411201", "411201066", "story_v_out_411201.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_25 = math.max(var_268_16, arg_265_1.talkMaxDuration)

			if var_268_15 <= arg_265_1.time_ and arg_265_1.time_ < var_268_15 + var_268_25 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_15) / var_268_25

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_15 + var_268_25 and arg_265_1.time_ < var_268_15 + var_268_25 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play411201067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 411201067
		arg_269_1.duration_ = 8.9

		local var_269_0 = {
			zh = 7.766,
			ja = 8.9
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
				arg_269_0:Play411201068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 1.025

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[265].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(411201067)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201067", "story_v_out_411201.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201067", "story_v_out_411201.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_411201", "411201067", "story_v_out_411201.awb")

						arg_269_1:RecordAudio("411201067", var_272_9)
						arg_269_1:RecordAudio("411201067", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_411201", "411201067", "story_v_out_411201.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_411201", "411201067", "story_v_out_411201.awb")
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
	Play411201068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 411201068
		arg_273_1.duration_ = 5.033

		local var_273_0 = {
			zh = 5.033,
			ja = 3.1
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
				arg_273_0:Play411201069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["4010ui_story"].transform
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				arg_273_1.var_.moveOldPos4010ui_story = var_276_0.localPosition
			end

			local var_276_2 = 0.001

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2
				local var_276_4 = Vector3.New(0.7, -1.59, -5.2)

				var_276_0.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos4010ui_story, var_276_4, var_276_3)

				local var_276_5 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_5.x, var_276_5.y, var_276_5.z)

				local var_276_6 = var_276_0.localEulerAngles

				var_276_6.z = 0
				var_276_6.x = 0
				var_276_0.localEulerAngles = var_276_6
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 then
				var_276_0.localPosition = Vector3.New(0.7, -1.59, -5.2)

				local var_276_7 = manager.ui.mainCamera.transform.position - var_276_0.position

				var_276_0.forward = Vector3.New(var_276_7.x, var_276_7.y, var_276_7.z)

				local var_276_8 = var_276_0.localEulerAngles

				var_276_8.z = 0
				var_276_8.x = 0
				var_276_0.localEulerAngles = var_276_8
			end

			local var_276_9 = arg_273_1.actors_["4010ui_story"]
			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 and arg_273_1.var_.characterEffect4010ui_story == nil then
				arg_273_1.var_.characterEffect4010ui_story = var_276_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_11 = 0.200000002980232

			if var_276_10 <= arg_273_1.time_ and arg_273_1.time_ < var_276_10 + var_276_11 then
				local var_276_12 = (arg_273_1.time_ - var_276_10) / var_276_11

				if arg_273_1.var_.characterEffect4010ui_story then
					arg_273_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_10 + var_276_11 and arg_273_1.time_ < var_276_10 + var_276_11 + arg_276_0 and arg_273_1.var_.characterEffect4010ui_story then
				arg_273_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_276_13 = arg_273_1.actors_["1024ui_story"].transform
			local var_276_14 = 0

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				arg_273_1.var_.moveOldPos1024ui_story = var_276_13.localPosition
			end

			local var_276_15 = 0.001

			if var_276_14 <= arg_273_1.time_ and arg_273_1.time_ < var_276_14 + var_276_15 then
				local var_276_16 = (arg_273_1.time_ - var_276_14) / var_276_15
				local var_276_17 = Vector3.New(-0.7, -1, -6.05)

				var_276_13.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1024ui_story, var_276_17, var_276_16)

				local var_276_18 = manager.ui.mainCamera.transform.position - var_276_13.position

				var_276_13.forward = Vector3.New(var_276_18.x, var_276_18.y, var_276_18.z)

				local var_276_19 = var_276_13.localEulerAngles

				var_276_19.z = 0
				var_276_19.x = 0
				var_276_13.localEulerAngles = var_276_19
			end

			if arg_273_1.time_ >= var_276_14 + var_276_15 and arg_273_1.time_ < var_276_14 + var_276_15 + arg_276_0 then
				var_276_13.localPosition = Vector3.New(-0.7, -1, -6.05)

				local var_276_20 = manager.ui.mainCamera.transform.position - var_276_13.position

				var_276_13.forward = Vector3.New(var_276_20.x, var_276_20.y, var_276_20.z)

				local var_276_21 = var_276_13.localEulerAngles

				var_276_21.z = 0
				var_276_21.x = 0
				var_276_13.localEulerAngles = var_276_21
			end

			local var_276_22 = arg_273_1.actors_["1024ui_story"]
			local var_276_23 = 0

			if var_276_23 < arg_273_1.time_ and arg_273_1.time_ <= var_276_23 + arg_276_0 and arg_273_1.var_.characterEffect1024ui_story == nil then
				arg_273_1.var_.characterEffect1024ui_story = var_276_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_24 = 0.200000002980232

			if var_276_23 <= arg_273_1.time_ and arg_273_1.time_ < var_276_23 + var_276_24 then
				local var_276_25 = (arg_273_1.time_ - var_276_23) / var_276_24

				if arg_273_1.var_.characterEffect1024ui_story then
					local var_276_26 = Mathf.Lerp(0, 0.5, var_276_25)

					arg_273_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1024ui_story.fillRatio = var_276_26
				end
			end

			if arg_273_1.time_ >= var_276_23 + var_276_24 and arg_273_1.time_ < var_276_23 + var_276_24 + arg_276_0 and arg_273_1.var_.characterEffect1024ui_story then
				local var_276_27 = 0.5

				arg_273_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1024ui_story.fillRatio = var_276_27
			end

			local var_276_28 = 0

			if var_276_28 < arg_273_1.time_ and arg_273_1.time_ <= var_276_28 + arg_276_0 then
				arg_273_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action2_2")
			end

			local var_276_29 = 0

			if var_276_29 < arg_273_1.time_ and arg_273_1.time_ <= var_276_29 + arg_276_0 then
				arg_273_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_276_30 = 0
			local var_276_31 = 0.475

			if var_276_30 < arg_273_1.time_ and arg_273_1.time_ <= var_276_30 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_32 = arg_273_1:FormatText(StoryNameCfg[42].name)

				arg_273_1.leftNameTxt_.text = var_276_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_33 = arg_273_1:GetWordFromCfg(411201068)
				local var_276_34 = arg_273_1:FormatText(var_276_33.content)

				arg_273_1.text_.text = var_276_34

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_35 = 19
				local var_276_36 = utf8.len(var_276_34)
				local var_276_37 = var_276_35 <= 0 and var_276_31 or var_276_31 * (var_276_36 / var_276_35)

				if var_276_37 > 0 and var_276_31 < var_276_37 then
					arg_273_1.talkMaxDuration = var_276_37

					if var_276_37 + var_276_30 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_37 + var_276_30
					end
				end

				arg_273_1.text_.text = var_276_34
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201068", "story_v_out_411201.awb") ~= 0 then
					local var_276_38 = manager.audio:GetVoiceLength("story_v_out_411201", "411201068", "story_v_out_411201.awb") / 1000

					if var_276_38 + var_276_30 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_38 + var_276_30
					end

					if var_276_33.prefab_name ~= "" and arg_273_1.actors_[var_276_33.prefab_name] ~= nil then
						local var_276_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_33.prefab_name].transform, "story_v_out_411201", "411201068", "story_v_out_411201.awb")

						arg_273_1:RecordAudio("411201068", var_276_39)
						arg_273_1:RecordAudio("411201068", var_276_39)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_411201", "411201068", "story_v_out_411201.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_411201", "411201068", "story_v_out_411201.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_40 = math.max(var_276_31, arg_273_1.talkMaxDuration)

			if var_276_30 <= arg_273_1.time_ and arg_273_1.time_ < var_276_30 + var_276_40 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_30) / var_276_40

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_30 + var_276_40 and arg_273_1.time_ < var_276_30 + var_276_40 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play411201069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 411201069
		arg_277_1.duration_ = 5.333

		local var_277_0 = {
			zh = 5.333,
			ja = 2.5
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
				arg_277_0:Play411201070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["4010ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect4010ui_story == nil then
				arg_277_1.var_.characterEffect4010ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect4010ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_277_1.var_.characterEffect4010ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect4010ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_277_1.var_.characterEffect4010ui_story.fillRatio = var_280_5
			end

			local var_280_6 = arg_277_1.actors_["1024ui_story"]
			local var_280_7 = 0

			if var_280_7 < arg_277_1.time_ and arg_277_1.time_ <= var_280_7 + arg_280_0 and arg_277_1.var_.characterEffect1024ui_story == nil then
				arg_277_1.var_.characterEffect1024ui_story = var_280_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_8 = 0.200000002980232

			if var_280_7 <= arg_277_1.time_ and arg_277_1.time_ < var_280_7 + var_280_8 then
				local var_280_9 = (arg_277_1.time_ - var_280_7) / var_280_8

				if arg_277_1.var_.characterEffect1024ui_story then
					arg_277_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_7 + var_280_8 and arg_277_1.time_ < var_280_7 + var_280_8 + arg_280_0 and arg_277_1.var_.characterEffect1024ui_story then
				arg_277_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_280_10 = 0
			local var_280_11 = 0.65

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_12 = arg_277_1:FormatText(StoryNameCfg[265].name)

				arg_277_1.leftNameTxt_.text = var_280_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_13 = arg_277_1:GetWordFromCfg(411201069)
				local var_280_14 = arg_277_1:FormatText(var_280_13.content)

				arg_277_1.text_.text = var_280_14

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_15 = 26
				local var_280_16 = utf8.len(var_280_14)
				local var_280_17 = var_280_15 <= 0 and var_280_11 or var_280_11 * (var_280_16 / var_280_15)

				if var_280_17 > 0 and var_280_11 < var_280_17 then
					arg_277_1.talkMaxDuration = var_280_17

					if var_280_17 + var_280_10 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_17 + var_280_10
					end
				end

				arg_277_1.text_.text = var_280_14
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201069", "story_v_out_411201.awb") ~= 0 then
					local var_280_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201069", "story_v_out_411201.awb") / 1000

					if var_280_18 + var_280_10 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_18 + var_280_10
					end

					if var_280_13.prefab_name ~= "" and arg_277_1.actors_[var_280_13.prefab_name] ~= nil then
						local var_280_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_13.prefab_name].transform, "story_v_out_411201", "411201069", "story_v_out_411201.awb")

						arg_277_1:RecordAudio("411201069", var_280_19)
						arg_277_1:RecordAudio("411201069", var_280_19)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_411201", "411201069", "story_v_out_411201.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_411201", "411201069", "story_v_out_411201.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_20 = math.max(var_280_11, arg_277_1.talkMaxDuration)

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_20 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_10) / var_280_20

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_10 + var_280_20 and arg_277_1.time_ < var_280_10 + var_280_20 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play411201070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 411201070
		arg_281_1.duration_ = 6.033

		local var_281_0 = {
			zh = 6.033,
			ja = 4.8
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
				arg_281_0:Play411201071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["4010ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect4010ui_story == nil then
				arg_281_1.var_.characterEffect4010ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect4010ui_story then
					arg_281_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect4010ui_story then
				arg_281_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_284_4 = arg_281_1.actors_["1024ui_story"]
			local var_284_5 = 0

			if var_284_5 < arg_281_1.time_ and arg_281_1.time_ <= var_284_5 + arg_284_0 and arg_281_1.var_.characterEffect1024ui_story == nil then
				arg_281_1.var_.characterEffect1024ui_story = var_284_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_6 = 0.200000002980232

			if var_284_5 <= arg_281_1.time_ and arg_281_1.time_ < var_284_5 + var_284_6 then
				local var_284_7 = (arg_281_1.time_ - var_284_5) / var_284_6

				if arg_281_1.var_.characterEffect1024ui_story then
					local var_284_8 = Mathf.Lerp(0, 0.5, var_284_7)

					arg_281_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1024ui_story.fillRatio = var_284_8
				end
			end

			if arg_281_1.time_ >= var_284_5 + var_284_6 and arg_281_1.time_ < var_284_5 + var_284_6 + arg_284_0 and arg_281_1.var_.characterEffect1024ui_story then
				local var_284_9 = 0.5

				arg_281_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1024ui_story.fillRatio = var_284_9
			end

			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 then
				arg_281_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_284_11 = 0
			local var_284_12 = 0.6

			if var_284_11 < arg_281_1.time_ and arg_281_1.time_ <= var_284_11 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_13 = arg_281_1:FormatText(StoryNameCfg[42].name)

				arg_281_1.leftNameTxt_.text = var_284_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_14 = arg_281_1:GetWordFromCfg(411201070)
				local var_284_15 = arg_281_1:FormatText(var_284_14.content)

				arg_281_1.text_.text = var_284_15

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_16 = 24
				local var_284_17 = utf8.len(var_284_15)
				local var_284_18 = var_284_16 <= 0 and var_284_12 or var_284_12 * (var_284_17 / var_284_16)

				if var_284_18 > 0 and var_284_12 < var_284_18 then
					arg_281_1.talkMaxDuration = var_284_18

					if var_284_18 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_18 + var_284_11
					end
				end

				arg_281_1.text_.text = var_284_15
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201070", "story_v_out_411201.awb") ~= 0 then
					local var_284_19 = manager.audio:GetVoiceLength("story_v_out_411201", "411201070", "story_v_out_411201.awb") / 1000

					if var_284_19 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_11
					end

					if var_284_14.prefab_name ~= "" and arg_281_1.actors_[var_284_14.prefab_name] ~= nil then
						local var_284_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_14.prefab_name].transform, "story_v_out_411201", "411201070", "story_v_out_411201.awb")

						arg_281_1:RecordAudio("411201070", var_284_20)
						arg_281_1:RecordAudio("411201070", var_284_20)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_411201", "411201070", "story_v_out_411201.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_411201", "411201070", "story_v_out_411201.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_21 = math.max(var_284_12, arg_281_1.talkMaxDuration)

			if var_284_11 <= arg_281_1.time_ and arg_281_1.time_ < var_284_11 + var_284_21 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_11) / var_284_21

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_11 + var_284_21 and arg_281_1.time_ < var_284_11 + var_284_21 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play411201071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 411201071
		arg_285_1.duration_ = 3.066

		local var_285_0 = {
			zh = 2.6,
			ja = 3.066
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
				arg_285_0:Play411201072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.2

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[42].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(411201071)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201071", "story_v_out_411201.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201071", "story_v_out_411201.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_411201", "411201071", "story_v_out_411201.awb")

						arg_285_1:RecordAudio("411201071", var_288_9)
						arg_285_1:RecordAudio("411201071", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_411201", "411201071", "story_v_out_411201.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_411201", "411201071", "story_v_out_411201.awb")
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
	Play411201072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 411201072
		arg_289_1.duration_ = 2.566

		local var_289_0 = {
			zh = 2.166,
			ja = 2.566
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
				arg_289_0:Play411201073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["4010ui_story"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 and arg_289_1.var_.characterEffect4010ui_story == nil then
				arg_289_1.var_.characterEffect4010ui_story = var_292_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_2 = 0.200000002980232

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2

				if arg_289_1.var_.characterEffect4010ui_story then
					local var_292_4 = Mathf.Lerp(0, 0.5, var_292_3)

					arg_289_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_289_1.var_.characterEffect4010ui_story.fillRatio = var_292_4
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 and arg_289_1.var_.characterEffect4010ui_story then
				local var_292_5 = 0.5

				arg_289_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_289_1.var_.characterEffect4010ui_story.fillRatio = var_292_5
			end

			local var_292_6 = arg_289_1.actors_["1024ui_story"]
			local var_292_7 = 0

			if var_292_7 < arg_289_1.time_ and arg_289_1.time_ <= var_292_7 + arg_292_0 and arg_289_1.var_.characterEffect1024ui_story == nil then
				arg_289_1.var_.characterEffect1024ui_story = var_292_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_8 = 0.200000002980232

			if var_292_7 <= arg_289_1.time_ and arg_289_1.time_ < var_292_7 + var_292_8 then
				local var_292_9 = (arg_289_1.time_ - var_292_7) / var_292_8

				if arg_289_1.var_.characterEffect1024ui_story then
					arg_289_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_7 + var_292_8 and arg_289_1.time_ < var_292_7 + var_292_8 + arg_292_0 and arg_289_1.var_.characterEffect1024ui_story then
				arg_289_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_292_10 = 0

			if var_292_10 < arg_289_1.time_ and arg_289_1.time_ <= var_292_10 + arg_292_0 then
				arg_289_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action2_1")
			end

			local var_292_11 = 0
			local var_292_12 = 0.3

			if var_292_11 < arg_289_1.time_ and arg_289_1.time_ <= var_292_11 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_13 = arg_289_1:FormatText(StoryNameCfg[265].name)

				arg_289_1.leftNameTxt_.text = var_292_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_14 = arg_289_1:GetWordFromCfg(411201072)
				local var_292_15 = arg_289_1:FormatText(var_292_14.content)

				arg_289_1.text_.text = var_292_15

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_16 = 12
				local var_292_17 = utf8.len(var_292_15)
				local var_292_18 = var_292_16 <= 0 and var_292_12 or var_292_12 * (var_292_17 / var_292_16)

				if var_292_18 > 0 and var_292_12 < var_292_18 then
					arg_289_1.talkMaxDuration = var_292_18

					if var_292_18 + var_292_11 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_18 + var_292_11
					end
				end

				arg_289_1.text_.text = var_292_15
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201072", "story_v_out_411201.awb") ~= 0 then
					local var_292_19 = manager.audio:GetVoiceLength("story_v_out_411201", "411201072", "story_v_out_411201.awb") / 1000

					if var_292_19 + var_292_11 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_19 + var_292_11
					end

					if var_292_14.prefab_name ~= "" and arg_289_1.actors_[var_292_14.prefab_name] ~= nil then
						local var_292_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_14.prefab_name].transform, "story_v_out_411201", "411201072", "story_v_out_411201.awb")

						arg_289_1:RecordAudio("411201072", var_292_20)
						arg_289_1:RecordAudio("411201072", var_292_20)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_411201", "411201072", "story_v_out_411201.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_411201", "411201072", "story_v_out_411201.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_21 = math.max(var_292_12, arg_289_1.talkMaxDuration)

			if var_292_11 <= arg_289_1.time_ and arg_289_1.time_ < var_292_11 + var_292_21 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_11) / var_292_21

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_11 + var_292_21 and arg_289_1.time_ < var_292_11 + var_292_21 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play411201073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 411201073
		arg_293_1.duration_ = 6.366

		local var_293_0 = {
			zh = 6.366,
			ja = 4.3
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
				arg_293_0:Play411201074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["4010ui_story"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect4010ui_story == nil then
				arg_293_1.var_.characterEffect4010ui_story = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.200000002980232

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect4010ui_story then
					arg_293_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect4010ui_story then
				arg_293_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_296_4 = arg_293_1.actors_["1024ui_story"]
			local var_296_5 = 0

			if var_296_5 < arg_293_1.time_ and arg_293_1.time_ <= var_296_5 + arg_296_0 and arg_293_1.var_.characterEffect1024ui_story == nil then
				arg_293_1.var_.characterEffect1024ui_story = var_296_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_6 = 0.200000002980232

			if var_296_5 <= arg_293_1.time_ and arg_293_1.time_ < var_296_5 + var_296_6 then
				local var_296_7 = (arg_293_1.time_ - var_296_5) / var_296_6

				if arg_293_1.var_.characterEffect1024ui_story then
					local var_296_8 = Mathf.Lerp(0, 0.5, var_296_7)

					arg_293_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1024ui_story.fillRatio = var_296_8
				end
			end

			if arg_293_1.time_ >= var_296_5 + var_296_6 and arg_293_1.time_ < var_296_5 + var_296_6 + arg_296_0 and arg_293_1.var_.characterEffect1024ui_story then
				local var_296_9 = 0.5

				arg_293_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1024ui_story.fillRatio = var_296_9
			end

			local var_296_10 = 0
			local var_296_11 = 0.375

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_12 = arg_293_1:FormatText(StoryNameCfg[42].name)

				arg_293_1.leftNameTxt_.text = var_296_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_13 = arg_293_1:GetWordFromCfg(411201073)
				local var_296_14 = arg_293_1:FormatText(var_296_13.content)

				arg_293_1.text_.text = var_296_14

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_15 = 15
				local var_296_16 = utf8.len(var_296_14)
				local var_296_17 = var_296_15 <= 0 and var_296_11 or var_296_11 * (var_296_16 / var_296_15)

				if var_296_17 > 0 and var_296_11 < var_296_17 then
					arg_293_1.talkMaxDuration = var_296_17

					if var_296_17 + var_296_10 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_17 + var_296_10
					end
				end

				arg_293_1.text_.text = var_296_14
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201073", "story_v_out_411201.awb") ~= 0 then
					local var_296_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201073", "story_v_out_411201.awb") / 1000

					if var_296_18 + var_296_10 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_18 + var_296_10
					end

					if var_296_13.prefab_name ~= "" and arg_293_1.actors_[var_296_13.prefab_name] ~= nil then
						local var_296_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_13.prefab_name].transform, "story_v_out_411201", "411201073", "story_v_out_411201.awb")

						arg_293_1:RecordAudio("411201073", var_296_19)
						arg_293_1:RecordAudio("411201073", var_296_19)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_411201", "411201073", "story_v_out_411201.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_411201", "411201073", "story_v_out_411201.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_20 = math.max(var_296_11, arg_293_1.talkMaxDuration)

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_20 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_10) / var_296_20

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_10 + var_296_20 and arg_293_1.time_ < var_296_10 + var_296_20 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play411201074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 411201074
		arg_297_1.duration_ = 7.4

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play411201075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = "B10b"

			if arg_297_1.bgs_[var_300_0] == nil then
				local var_300_1 = Object.Instantiate(arg_297_1.paintGo_)

				var_300_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_300_0)
				var_300_1.name = var_300_0
				var_300_1.transform.parent = arg_297_1.stage_.transform
				var_300_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_297_1.bgs_[var_300_0] = var_300_1
			end

			local var_300_2 = 0.866666666666668

			if var_300_2 < arg_297_1.time_ and arg_297_1.time_ <= var_300_2 + arg_300_0 then
				local var_300_3 = manager.ui.mainCamera.transform.localPosition
				local var_300_4 = Vector3.New(0, 0, 10) + Vector3.New(var_300_3.x, var_300_3.y, 0)
				local var_300_5 = arg_297_1.bgs_.B10b

				var_300_5.transform.localPosition = var_300_4
				var_300_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_300_6 = var_300_5:GetComponent("SpriteRenderer")

				if var_300_6 and var_300_6.sprite then
					local var_300_7 = (var_300_5.transform.localPosition - var_300_3).z
					local var_300_8 = manager.ui.mainCameraCom_
					local var_300_9 = 2 * var_300_7 * Mathf.Tan(var_300_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_300_10 = var_300_9 * var_300_8.aspect
					local var_300_11 = var_300_6.sprite.bounds.size.x
					local var_300_12 = var_300_6.sprite.bounds.size.y
					local var_300_13 = var_300_10 / var_300_11
					local var_300_14 = var_300_9 / var_300_12
					local var_300_15 = var_300_14 < var_300_13 and var_300_13 or var_300_14

					var_300_5.transform.localScale = Vector3.New(var_300_15, var_300_15, 0)
				end

				for iter_300_0, iter_300_1 in pairs(arg_297_1.bgs_) do
					if iter_300_0 ~= "B10b" then
						iter_300_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_300_16 = 0

			if var_300_16 < arg_297_1.time_ and arg_297_1.time_ <= var_300_16 + arg_300_0 then
				arg_297_1.mask_.enabled = true
				arg_297_1.mask_.raycastTarget = true

				arg_297_1:SetGaussion(false)
			end

			local var_300_17 = 0.866666666666668

			if var_300_16 <= arg_297_1.time_ and arg_297_1.time_ < var_300_16 + var_300_17 then
				local var_300_18 = (arg_297_1.time_ - var_300_16) / var_300_17
				local var_300_19 = Color.New(1, 0.9669811, 0.9669811)

				var_300_19.a = Mathf.Lerp(0, 1, var_300_18)
				arg_297_1.mask_.color = var_300_19
			end

			if arg_297_1.time_ >= var_300_16 + var_300_17 and arg_297_1.time_ < var_300_16 + var_300_17 + arg_300_0 then
				local var_300_20 = Color.New(1, 0.9669811, 0.9669811)

				var_300_20.a = 1
				arg_297_1.mask_.color = var_300_20
			end

			local var_300_21 = 0.866666666666668

			if var_300_21 < arg_297_1.time_ and arg_297_1.time_ <= var_300_21 + arg_300_0 then
				arg_297_1.mask_.enabled = true
				arg_297_1.mask_.raycastTarget = true

				arg_297_1:SetGaussion(false)
			end

			local var_300_22 = 1.53333333333333

			if var_300_21 <= arg_297_1.time_ and arg_297_1.time_ < var_300_21 + var_300_22 then
				local var_300_23 = (arg_297_1.time_ - var_300_21) / var_300_22
				local var_300_24 = Color.New(1, 1, 1)

				var_300_24.a = Mathf.Lerp(1, 0, var_300_23)
				arg_297_1.mask_.color = var_300_24
			end

			if arg_297_1.time_ >= var_300_21 + var_300_22 and arg_297_1.time_ < var_300_21 + var_300_22 + arg_300_0 then
				local var_300_25 = Color.New(1, 1, 1)
				local var_300_26 = 0

				arg_297_1.mask_.enabled = false
				var_300_25.a = var_300_26
				arg_297_1.mask_.color = var_300_25
			end

			local var_300_27 = arg_297_1.actors_["4010ui_story"].transform
			local var_300_28 = 0.866666666666668

			if var_300_28 < arg_297_1.time_ and arg_297_1.time_ <= var_300_28 + arg_300_0 then
				arg_297_1.var_.moveOldPos4010ui_story = var_300_27.localPosition
			end

			local var_300_29 = 0.001

			if var_300_28 <= arg_297_1.time_ and arg_297_1.time_ < var_300_28 + var_300_29 then
				local var_300_30 = (arg_297_1.time_ - var_300_28) / var_300_29
				local var_300_31 = Vector3.New(0, 100, 0)

				var_300_27.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos4010ui_story, var_300_31, var_300_30)

				local var_300_32 = manager.ui.mainCamera.transform.position - var_300_27.position

				var_300_27.forward = Vector3.New(var_300_32.x, var_300_32.y, var_300_32.z)

				local var_300_33 = var_300_27.localEulerAngles

				var_300_33.z = 0
				var_300_33.x = 0
				var_300_27.localEulerAngles = var_300_33
			end

			if arg_297_1.time_ >= var_300_28 + var_300_29 and arg_297_1.time_ < var_300_28 + var_300_29 + arg_300_0 then
				var_300_27.localPosition = Vector3.New(0, 100, 0)

				local var_300_34 = manager.ui.mainCamera.transform.position - var_300_27.position

				var_300_27.forward = Vector3.New(var_300_34.x, var_300_34.y, var_300_34.z)

				local var_300_35 = var_300_27.localEulerAngles

				var_300_35.z = 0
				var_300_35.x = 0
				var_300_27.localEulerAngles = var_300_35
			end

			local var_300_36 = arg_297_1.actors_["4010ui_story"]
			local var_300_37 = 0.866666666666668

			if var_300_37 < arg_297_1.time_ and arg_297_1.time_ <= var_300_37 + arg_300_0 and arg_297_1.var_.characterEffect4010ui_story == nil then
				arg_297_1.var_.characterEffect4010ui_story = var_300_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_38 = 0.200000002980232

			if var_300_37 <= arg_297_1.time_ and arg_297_1.time_ < var_300_37 + var_300_38 then
				local var_300_39 = (arg_297_1.time_ - var_300_37) / var_300_38

				if arg_297_1.var_.characterEffect4010ui_story then
					local var_300_40 = Mathf.Lerp(0, 0.5, var_300_39)

					arg_297_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_297_1.var_.characterEffect4010ui_story.fillRatio = var_300_40
				end
			end

			if arg_297_1.time_ >= var_300_37 + var_300_38 and arg_297_1.time_ < var_300_37 + var_300_38 + arg_300_0 and arg_297_1.var_.characterEffect4010ui_story then
				local var_300_41 = 0.5

				arg_297_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_297_1.var_.characterEffect4010ui_story.fillRatio = var_300_41
			end

			local var_300_42 = arg_297_1.actors_["1024ui_story"].transform
			local var_300_43 = 0.866666666666668

			if var_300_43 < arg_297_1.time_ and arg_297_1.time_ <= var_300_43 + arg_300_0 then
				arg_297_1.var_.moveOldPos1024ui_story = var_300_42.localPosition
			end

			local var_300_44 = 0.001

			if var_300_43 <= arg_297_1.time_ and arg_297_1.time_ < var_300_43 + var_300_44 then
				local var_300_45 = (arg_297_1.time_ - var_300_43) / var_300_44
				local var_300_46 = Vector3.New(0, 100, 0)

				var_300_42.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1024ui_story, var_300_46, var_300_45)

				local var_300_47 = manager.ui.mainCamera.transform.position - var_300_42.position

				var_300_42.forward = Vector3.New(var_300_47.x, var_300_47.y, var_300_47.z)

				local var_300_48 = var_300_42.localEulerAngles

				var_300_48.z = 0
				var_300_48.x = 0
				var_300_42.localEulerAngles = var_300_48
			end

			if arg_297_1.time_ >= var_300_43 + var_300_44 and arg_297_1.time_ < var_300_43 + var_300_44 + arg_300_0 then
				var_300_42.localPosition = Vector3.New(0, 100, 0)

				local var_300_49 = manager.ui.mainCamera.transform.position - var_300_42.position

				var_300_42.forward = Vector3.New(var_300_49.x, var_300_49.y, var_300_49.z)

				local var_300_50 = var_300_42.localEulerAngles

				var_300_50.z = 0
				var_300_50.x = 0
				var_300_42.localEulerAngles = var_300_50
			end

			local var_300_51 = arg_297_1.actors_["1024ui_story"]
			local var_300_52 = 0.866666666666668

			if var_300_52 < arg_297_1.time_ and arg_297_1.time_ <= var_300_52 + arg_300_0 and arg_297_1.var_.characterEffect1024ui_story == nil then
				arg_297_1.var_.characterEffect1024ui_story = var_300_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_53 = 0.200000002980232

			if var_300_52 <= arg_297_1.time_ and arg_297_1.time_ < var_300_52 + var_300_53 then
				local var_300_54 = (arg_297_1.time_ - var_300_52) / var_300_53

				if arg_297_1.var_.characterEffect1024ui_story then
					local var_300_55 = Mathf.Lerp(0, 0.5, var_300_54)

					arg_297_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1024ui_story.fillRatio = var_300_55
				end
			end

			if arg_297_1.time_ >= var_300_52 + var_300_53 and arg_297_1.time_ < var_300_52 + var_300_53 + arg_300_0 and arg_297_1.var_.characterEffect1024ui_story then
				local var_300_56 = 0.5

				arg_297_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1024ui_story.fillRatio = var_300_56
			end

			local var_300_57 = 0.866666666666668
			local var_300_58 = 0.3

			if var_300_57 < arg_297_1.time_ and arg_297_1.time_ <= var_300_57 + arg_300_0 then
				local var_300_59 = "play"
				local var_300_60 = "effect"

				arg_297_1:AudioAction(var_300_59, var_300_60, "se_story_122_01", "se_story_122_01_smoke", "")
			end

			local var_300_61 = manager.ui.mainCamera.transform
			local var_300_62 = 1.16666666666667

			if var_300_62 < arg_297_1.time_ and arg_297_1.time_ <= var_300_62 + arg_300_0 then
				arg_297_1.var_.shakeOldPos = var_300_61.localPosition
			end

			local var_300_63 = 1.23333333333333

			if var_300_62 <= arg_297_1.time_ and arg_297_1.time_ < var_300_62 + var_300_63 then
				local var_300_64 = (arg_297_1.time_ - var_300_62) / 0.066
				local var_300_65, var_300_66 = math.modf(var_300_64)

				var_300_61.localPosition = Vector3.New(var_300_66 * 0.13, var_300_66 * 0.13, var_300_66 * 0.13) + arg_297_1.var_.shakeOldPos
			end

			if arg_297_1.time_ >= var_300_62 + var_300_63 and arg_297_1.time_ < var_300_62 + var_300_63 + arg_300_0 then
				var_300_61.localPosition = arg_297_1.var_.shakeOldPos
			end

			if arg_297_1.frameCnt_ <= 1 then
				arg_297_1.dialog_:SetActive(false)
			end

			local var_300_67 = 2.4
			local var_300_68 = 1.15

			if var_300_67 < arg_297_1.time_ and arg_297_1.time_ <= var_300_67 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0

				arg_297_1.dialog_:SetActive(true)

				local var_300_69 = LeanTween.value(arg_297_1.dialog_, 0, 1, 0.3)

				var_300_69:setOnUpdate(LuaHelper.FloatAction(function(arg_301_0)
					arg_297_1.dialogCg_.alpha = arg_301_0
				end))
				var_300_69:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_297_1.dialog_)
					var_300_69:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_297_1.duration_ = arg_297_1.duration_ + 0.3

				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_70 = arg_297_1:GetWordFromCfg(411201074)
				local var_300_71 = arg_297_1:FormatText(var_300_70.content)

				arg_297_1.text_.text = var_300_71

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_72 = 46
				local var_300_73 = utf8.len(var_300_71)
				local var_300_74 = var_300_72 <= 0 and var_300_68 or var_300_68 * (var_300_73 / var_300_72)

				if var_300_74 > 0 and var_300_68 < var_300_74 then
					arg_297_1.talkMaxDuration = var_300_74
					var_300_67 = var_300_67 + 0.3

					if var_300_74 + var_300_67 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_74 + var_300_67
					end
				end

				arg_297_1.text_.text = var_300_71
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_75 = var_300_67 + 0.3
			local var_300_76 = math.max(var_300_68, arg_297_1.talkMaxDuration)

			if var_300_75 <= arg_297_1.time_ and arg_297_1.time_ < var_300_75 + var_300_76 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_75) / var_300_76

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_75 + var_300_76 and arg_297_1.time_ < var_300_75 + var_300_76 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play411201075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 411201075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play411201076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 1.175

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

				local var_306_2 = arg_303_1:GetWordFromCfg(411201075)
				local var_306_3 = arg_303_1:FormatText(var_306_2.content)

				arg_303_1.text_.text = var_306_3

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_4 = 47
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
	Play411201076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 411201076
		arg_307_1.duration_ = 2.833

		local var_307_0 = {
			zh = 1.6,
			ja = 2.833
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
				arg_307_0:Play411201077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = "2079ui_story"

			if arg_307_1.actors_[var_310_0] == nil then
				local var_310_1 = Object.Instantiate(Asset.Load("Char/" .. var_310_0), arg_307_1.stage_.transform)

				var_310_1.name = var_310_0
				var_310_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_307_1.actors_[var_310_0] = var_310_1

				local var_310_2 = var_310_1:GetComponentInChildren(typeof(CharacterEffect))

				var_310_2.enabled = true

				local var_310_3 = GameObjectTools.GetOrAddComponent(var_310_1, typeof(DynamicBoneHelper))

				if var_310_3 then
					var_310_3:EnableDynamicBone(false)
				end

				arg_307_1:ShowWeapon(var_310_2.transform, false)

				arg_307_1.var_[var_310_0 .. "Animator"] = var_310_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_307_1.var_[var_310_0 .. "Animator"].applyRootMotion = true
				arg_307_1.var_[var_310_0 .. "LipSync"] = var_310_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_310_4 = arg_307_1.actors_["2079ui_story"].transform
			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 then
				arg_307_1.var_.moveOldPos2079ui_story = var_310_4.localPosition
			end

			local var_310_6 = 0.001

			if var_310_5 <= arg_307_1.time_ and arg_307_1.time_ < var_310_5 + var_310_6 then
				local var_310_7 = (arg_307_1.time_ - var_310_5) / var_310_6
				local var_310_8 = Vector3.New(0, -1.28, -5.6)

				var_310_4.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos2079ui_story, var_310_8, var_310_7)

				local var_310_9 = manager.ui.mainCamera.transform.position - var_310_4.position

				var_310_4.forward = Vector3.New(var_310_9.x, var_310_9.y, var_310_9.z)

				local var_310_10 = var_310_4.localEulerAngles

				var_310_10.z = 0
				var_310_10.x = 0
				var_310_4.localEulerAngles = var_310_10
			end

			if arg_307_1.time_ >= var_310_5 + var_310_6 and arg_307_1.time_ < var_310_5 + var_310_6 + arg_310_0 then
				var_310_4.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_310_11 = manager.ui.mainCamera.transform.position - var_310_4.position

				var_310_4.forward = Vector3.New(var_310_11.x, var_310_11.y, var_310_11.z)

				local var_310_12 = var_310_4.localEulerAngles

				var_310_12.z = 0
				var_310_12.x = 0
				var_310_4.localEulerAngles = var_310_12
			end

			local var_310_13 = arg_307_1.actors_["2079ui_story"]
			local var_310_14 = 0

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 and arg_307_1.var_.characterEffect2079ui_story == nil then
				arg_307_1.var_.characterEffect2079ui_story = var_310_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_15 = 0.200000002980232

			if var_310_14 <= arg_307_1.time_ and arg_307_1.time_ < var_310_14 + var_310_15 then
				local var_310_16 = (arg_307_1.time_ - var_310_14) / var_310_15

				if arg_307_1.var_.characterEffect2079ui_story then
					arg_307_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_14 + var_310_15 and arg_307_1.time_ < var_310_14 + var_310_15 + arg_310_0 and arg_307_1.var_.characterEffect2079ui_story then
				arg_307_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_310_17 = 0

			if var_310_17 < arg_307_1.time_ and arg_307_1.time_ <= var_310_17 + arg_310_0 then
				arg_307_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_310_18 = 0

			if var_310_18 < arg_307_1.time_ and arg_307_1.time_ <= var_310_18 + arg_310_0 then
				arg_307_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_310_19 = 0
			local var_310_20 = 0.225

			if var_310_19 < arg_307_1.time_ and arg_307_1.time_ <= var_310_19 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_21 = arg_307_1:FormatText(StoryNameCfg[711].name)

				arg_307_1.leftNameTxt_.text = var_310_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_22 = arg_307_1:GetWordFromCfg(411201076)
				local var_310_23 = arg_307_1:FormatText(var_310_22.content)

				arg_307_1.text_.text = var_310_23

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_24 = 9
				local var_310_25 = utf8.len(var_310_23)
				local var_310_26 = var_310_24 <= 0 and var_310_20 or var_310_20 * (var_310_25 / var_310_24)

				if var_310_26 > 0 and var_310_20 < var_310_26 then
					arg_307_1.talkMaxDuration = var_310_26

					if var_310_26 + var_310_19 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_26 + var_310_19
					end
				end

				arg_307_1.text_.text = var_310_23
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201076", "story_v_out_411201.awb") ~= 0 then
					local var_310_27 = manager.audio:GetVoiceLength("story_v_out_411201", "411201076", "story_v_out_411201.awb") / 1000

					if var_310_27 + var_310_19 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_27 + var_310_19
					end

					if var_310_22.prefab_name ~= "" and arg_307_1.actors_[var_310_22.prefab_name] ~= nil then
						local var_310_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_22.prefab_name].transform, "story_v_out_411201", "411201076", "story_v_out_411201.awb")

						arg_307_1:RecordAudio("411201076", var_310_28)
						arg_307_1:RecordAudio("411201076", var_310_28)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_411201", "411201076", "story_v_out_411201.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_411201", "411201076", "story_v_out_411201.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_29 = math.max(var_310_20, arg_307_1.talkMaxDuration)

			if var_310_19 <= arg_307_1.time_ and arg_307_1.time_ < var_310_19 + var_310_29 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_19) / var_310_29

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_19 + var_310_29 and arg_307_1.time_ < var_310_19 + var_310_29 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play411201077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 411201077
		arg_311_1.duration_ = 1.999999999999

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play411201078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["2079ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos2079ui_story = var_314_0.localPosition
			end

			local var_314_2 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2
				local var_314_4 = Vector3.New(0, 100, 0)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos2079ui_story, var_314_4, var_314_3)

				local var_314_5 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_5.x, var_314_5.y, var_314_5.z)

				local var_314_6 = var_314_0.localEulerAngles

				var_314_6.z = 0
				var_314_6.x = 0
				var_314_0.localEulerAngles = var_314_6
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0, 100, 0)

				local var_314_7 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_7.x, var_314_7.y, var_314_7.z)

				local var_314_8 = var_314_0.localEulerAngles

				var_314_8.z = 0
				var_314_8.x = 0
				var_314_0.localEulerAngles = var_314_8
			end

			local var_314_9 = arg_311_1.actors_["2079ui_story"]
			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 and arg_311_1.var_.characterEffect2079ui_story == nil then
				arg_311_1.var_.characterEffect2079ui_story = var_314_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_11 = 0.200000002980232

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_11 then
				local var_314_12 = (arg_311_1.time_ - var_314_10) / var_314_11

				if arg_311_1.var_.characterEffect2079ui_story then
					local var_314_13 = Mathf.Lerp(0, 0.5, var_314_12)

					arg_311_1.var_.characterEffect2079ui_story.fillFlat = true
					arg_311_1.var_.characterEffect2079ui_story.fillRatio = var_314_13
				end
			end

			if arg_311_1.time_ >= var_314_10 + var_314_11 and arg_311_1.time_ < var_314_10 + var_314_11 + arg_314_0 and arg_311_1.var_.characterEffect2079ui_story then
				local var_314_14 = 0.5

				arg_311_1.var_.characterEffect2079ui_story.fillFlat = true
				arg_311_1.var_.characterEffect2079ui_story.fillRatio = var_314_14
			end

			local var_314_15 = arg_311_1.actors_["1024ui_story"].transform
			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.var_.moveOldPos1024ui_story = var_314_15.localPosition

				local var_314_17 = "1024ui_story"

				arg_311_1:ShowWeapon(arg_311_1.var_[var_314_17 .. "Animator"].transform, true)
			end

			local var_314_18 = 0.001

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_18 then
				local var_314_19 = (arg_311_1.time_ - var_314_16) / var_314_18
				local var_314_20 = Vector3.New(0, -1, -6.05)

				var_314_15.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1024ui_story, var_314_20, var_314_19)

				local var_314_21 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_21.x, var_314_21.y, var_314_21.z)

				local var_314_22 = var_314_15.localEulerAngles

				var_314_22.z = 0
				var_314_22.x = 0
				var_314_15.localEulerAngles = var_314_22
			end

			if arg_311_1.time_ >= var_314_16 + var_314_18 and arg_311_1.time_ < var_314_16 + var_314_18 + arg_314_0 then
				var_314_15.localPosition = Vector3.New(0, -1, -6.05)

				local var_314_23 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_23.x, var_314_23.y, var_314_23.z)

				local var_314_24 = var_314_15.localEulerAngles

				var_314_24.z = 0
				var_314_24.x = 0
				var_314_15.localEulerAngles = var_314_24
			end

			local var_314_25 = arg_311_1.actors_["1024ui_story"]
			local var_314_26 = 0

			if var_314_26 < arg_311_1.time_ and arg_311_1.time_ <= var_314_26 + arg_314_0 and arg_311_1.var_.characterEffect1024ui_story == nil then
				arg_311_1.var_.characterEffect1024ui_story = var_314_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_27 = 0.200000002980232

			if var_314_26 <= arg_311_1.time_ and arg_311_1.time_ < var_314_26 + var_314_27 then
				local var_314_28 = (arg_311_1.time_ - var_314_26) / var_314_27

				if arg_311_1.var_.characterEffect1024ui_story then
					arg_311_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_26 + var_314_27 and arg_311_1.time_ < var_314_26 + var_314_27 + arg_314_0 and arg_311_1.var_.characterEffect1024ui_story then
				arg_311_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_314_29 = 0

			if var_314_29 < arg_311_1.time_ and arg_311_1.time_ <= var_314_29 + arg_314_0 then
				arg_311_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action7_1")
			end

			local var_314_30 = 0

			if var_314_30 < arg_311_1.time_ and arg_311_1.time_ <= var_314_30 + arg_314_0 then
				arg_311_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_314_31 = 0
			local var_314_32 = 0.1

			if var_314_31 < arg_311_1.time_ and arg_311_1.time_ <= var_314_31 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_33 = arg_311_1:FormatText(StoryNameCfg[265].name)

				arg_311_1.leftNameTxt_.text = var_314_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_34 = arg_311_1:GetWordFromCfg(411201077)
				local var_314_35 = arg_311_1:FormatText(var_314_34.content)

				arg_311_1.text_.text = var_314_35

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_36 = 4
				local var_314_37 = utf8.len(var_314_35)
				local var_314_38 = var_314_36 <= 0 and var_314_32 or var_314_32 * (var_314_37 / var_314_36)

				if var_314_38 > 0 and var_314_32 < var_314_38 then
					arg_311_1.talkMaxDuration = var_314_38

					if var_314_38 + var_314_31 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_38 + var_314_31
					end
				end

				arg_311_1.text_.text = var_314_35
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201077", "story_v_out_411201.awb") ~= 0 then
					local var_314_39 = manager.audio:GetVoiceLength("story_v_out_411201", "411201077", "story_v_out_411201.awb") / 1000

					if var_314_39 + var_314_31 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_39 + var_314_31
					end

					if var_314_34.prefab_name ~= "" and arg_311_1.actors_[var_314_34.prefab_name] ~= nil then
						local var_314_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_34.prefab_name].transform, "story_v_out_411201", "411201077", "story_v_out_411201.awb")

						arg_311_1:RecordAudio("411201077", var_314_40)
						arg_311_1:RecordAudio("411201077", var_314_40)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_411201", "411201077", "story_v_out_411201.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_411201", "411201077", "story_v_out_411201.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_41 = math.max(var_314_32, arg_311_1.talkMaxDuration)

			if var_314_31 <= arg_311_1.time_ and arg_311_1.time_ < var_314_31 + var_314_41 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_31) / var_314_41

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_31 + var_314_41 and arg_311_1.time_ < var_314_31 + var_314_41 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play411201078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 411201078
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play411201079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1024ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1024ui_story = var_318_0.localPosition

				local var_318_2 = "1024ui_story"

				arg_315_1:ShowWeapon(arg_315_1.var_[var_318_2 .. "Animator"].transform, false)
			end

			local var_318_3 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_3 then
				local var_318_4 = (arg_315_1.time_ - var_318_1) / var_318_3
				local var_318_5 = Vector3.New(0, 100, 0)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1024ui_story, var_318_5, var_318_4)

				local var_318_6 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_6.x, var_318_6.y, var_318_6.z)

				local var_318_7 = var_318_0.localEulerAngles

				var_318_7.z = 0
				var_318_7.x = 0
				var_318_0.localEulerAngles = var_318_7
			end

			if arg_315_1.time_ >= var_318_1 + var_318_3 and arg_315_1.time_ < var_318_1 + var_318_3 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, 100, 0)

				local var_318_8 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_8.x, var_318_8.y, var_318_8.z)

				local var_318_9 = var_318_0.localEulerAngles

				var_318_9.z = 0
				var_318_9.x = 0
				var_318_0.localEulerAngles = var_318_9
			end

			local var_318_10 = arg_315_1.actors_["1024ui_story"]
			local var_318_11 = 0

			if var_318_11 < arg_315_1.time_ and arg_315_1.time_ <= var_318_11 + arg_318_0 and arg_315_1.var_.characterEffect1024ui_story == nil then
				arg_315_1.var_.characterEffect1024ui_story = var_318_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_12 = 0.200000002980232

			if var_318_11 <= arg_315_1.time_ and arg_315_1.time_ < var_318_11 + var_318_12 then
				local var_318_13 = (arg_315_1.time_ - var_318_11) / var_318_12

				if arg_315_1.var_.characterEffect1024ui_story then
					local var_318_14 = Mathf.Lerp(0, 0.5, var_318_13)

					arg_315_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1024ui_story.fillRatio = var_318_14
				end
			end

			if arg_315_1.time_ >= var_318_11 + var_318_12 and arg_315_1.time_ < var_318_11 + var_318_12 + arg_318_0 and arg_315_1.var_.characterEffect1024ui_story then
				local var_318_15 = 0.5

				arg_315_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1024ui_story.fillRatio = var_318_15
			end

			local var_318_16 = 0
			local var_318_17 = 1.575

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_18 = arg_315_1:GetWordFromCfg(411201078)
				local var_318_19 = arg_315_1:FormatText(var_318_18.content)

				arg_315_1.text_.text = var_318_19

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_20 = 63
				local var_318_21 = utf8.len(var_318_19)
				local var_318_22 = var_318_20 <= 0 and var_318_17 or var_318_17 * (var_318_21 / var_318_20)

				if var_318_22 > 0 and var_318_17 < var_318_22 then
					arg_315_1.talkMaxDuration = var_318_22

					if var_318_22 + var_318_16 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_22 + var_318_16
					end
				end

				arg_315_1.text_.text = var_318_19
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_23 = math.max(var_318_17, arg_315_1.talkMaxDuration)

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_23 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_16) / var_318_23

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_16 + var_318_23 and arg_315_1.time_ < var_318_16 + var_318_23 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play411201079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 411201079
		arg_319_1.duration_ = 9

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play411201080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 2

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				local var_322_1 = manager.ui.mainCamera.transform.localPosition
				local var_322_2 = Vector3.New(0, 0, 10) + Vector3.New(var_322_1.x, var_322_1.y, 0)
				local var_322_3 = arg_319_1.bgs_.B10b

				var_322_3.transform.localPosition = var_322_2
				var_322_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_322_4 = var_322_3:GetComponent("SpriteRenderer")

				if var_322_4 and var_322_4.sprite then
					local var_322_5 = (var_322_3.transform.localPosition - var_322_1).z
					local var_322_6 = manager.ui.mainCameraCom_
					local var_322_7 = 2 * var_322_5 * Mathf.Tan(var_322_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_322_8 = var_322_7 * var_322_6.aspect
					local var_322_9 = var_322_4.sprite.bounds.size.x
					local var_322_10 = var_322_4.sprite.bounds.size.y
					local var_322_11 = var_322_8 / var_322_9
					local var_322_12 = var_322_7 / var_322_10
					local var_322_13 = var_322_12 < var_322_11 and var_322_11 or var_322_12

					var_322_3.transform.localScale = Vector3.New(var_322_13, var_322_13, 0)
				end

				for iter_322_0, iter_322_1 in pairs(arg_319_1.bgs_) do
					if iter_322_0 ~= "B10b" then
						iter_322_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1.mask_.enabled = true
				arg_319_1.mask_.raycastTarget = true

				arg_319_1:SetGaussion(false)
			end

			local var_322_15 = 2

			if var_322_14 <= arg_319_1.time_ and arg_319_1.time_ < var_322_14 + var_322_15 then
				local var_322_16 = (arg_319_1.time_ - var_322_14) / var_322_15
				local var_322_17 = Color.New(0, 0, 0)

				var_322_17.a = Mathf.Lerp(0, 1, var_322_16)
				arg_319_1.mask_.color = var_322_17
			end

			if arg_319_1.time_ >= var_322_14 + var_322_15 and arg_319_1.time_ < var_322_14 + var_322_15 + arg_322_0 then
				local var_322_18 = Color.New(0, 0, 0)

				var_322_18.a = 1
				arg_319_1.mask_.color = var_322_18
			end

			local var_322_19 = 2

			if var_322_19 < arg_319_1.time_ and arg_319_1.time_ <= var_322_19 + arg_322_0 then
				arg_319_1.mask_.enabled = true
				arg_319_1.mask_.raycastTarget = true

				arg_319_1:SetGaussion(false)
			end

			local var_322_20 = 2

			if var_322_19 <= arg_319_1.time_ and arg_319_1.time_ < var_322_19 + var_322_20 then
				local var_322_21 = (arg_319_1.time_ - var_322_19) / var_322_20
				local var_322_22 = Color.New(0, 0, 0)

				var_322_22.a = Mathf.Lerp(1, 0, var_322_21)
				arg_319_1.mask_.color = var_322_22
			end

			if arg_319_1.time_ >= var_322_19 + var_322_20 and arg_319_1.time_ < var_322_19 + var_322_20 + arg_322_0 then
				local var_322_23 = Color.New(0, 0, 0)
				local var_322_24 = 0

				arg_319_1.mask_.enabled = false
				var_322_23.a = var_322_24
				arg_319_1.mask_.color = var_322_23
			end

			if arg_319_1.frameCnt_ <= 1 then
				arg_319_1.dialog_:SetActive(false)
			end

			local var_322_25 = 4
			local var_322_26 = 0.875

			if var_322_25 < arg_319_1.time_ and arg_319_1.time_ <= var_322_25 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0

				arg_319_1.dialog_:SetActive(true)

				local var_322_27 = LeanTween.value(arg_319_1.dialog_, 0, 1, 0.3)

				var_322_27:setOnUpdate(LuaHelper.FloatAction(function(arg_323_0)
					arg_319_1.dialogCg_.alpha = arg_323_0
				end))
				var_322_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_319_1.dialog_)
					var_322_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_319_1.duration_ = arg_319_1.duration_ + 0.3

				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_28 = arg_319_1:GetWordFromCfg(411201079)
				local var_322_29 = arg_319_1:FormatText(var_322_28.content)

				arg_319_1.text_.text = var_322_29

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_30 = 35
				local var_322_31 = utf8.len(var_322_29)
				local var_322_32 = var_322_30 <= 0 and var_322_26 or var_322_26 * (var_322_31 / var_322_30)

				if var_322_32 > 0 and var_322_26 < var_322_32 then
					arg_319_1.talkMaxDuration = var_322_32
					var_322_25 = var_322_25 + 0.3

					if var_322_32 + var_322_25 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_32 + var_322_25
					end
				end

				arg_319_1.text_.text = var_322_29
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_33 = var_322_25 + 0.3
			local var_322_34 = math.max(var_322_26, arg_319_1.talkMaxDuration)

			if var_322_33 <= arg_319_1.time_ and arg_319_1.time_ < var_322_33 + var_322_34 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_33) / var_322_34

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_33 + var_322_34 and arg_319_1.time_ < var_322_33 + var_322_34 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play411201080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 411201080
		arg_325_1.duration_ = 5.5

		local var_325_0 = {
			zh = 5.5,
			ja = 5.033
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
				arg_325_0:Play411201081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["4010ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos4010ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(0, -1.59, -5.2)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos4010ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = arg_325_1.actors_["4010ui_story"]
			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 and arg_325_1.var_.characterEffect4010ui_story == nil then
				arg_325_1.var_.characterEffect4010ui_story = var_328_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_11 = 0.200000002980232

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_11 then
				local var_328_12 = (arg_325_1.time_ - var_328_10) / var_328_11

				if arg_325_1.var_.characterEffect4010ui_story then
					arg_325_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_10 + var_328_11 and arg_325_1.time_ < var_328_10 + var_328_11 + arg_328_0 and arg_325_1.var_.characterEffect4010ui_story then
				arg_325_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_328_13 = 0

			if var_328_13 < arg_325_1.time_ and arg_325_1.time_ <= var_328_13 + arg_328_0 then
				arg_325_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action8_2")
			end

			local var_328_14 = 0

			if var_328_14 < arg_325_1.time_ and arg_325_1.time_ <= var_328_14 + arg_328_0 then
				arg_325_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_328_15 = 0
			local var_328_16 = 0.425

			if var_328_15 < arg_325_1.time_ and arg_325_1.time_ <= var_328_15 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_17 = arg_325_1:FormatText(StoryNameCfg[42].name)

				arg_325_1.leftNameTxt_.text = var_328_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_18 = arg_325_1:GetWordFromCfg(411201080)
				local var_328_19 = arg_325_1:FormatText(var_328_18.content)

				arg_325_1.text_.text = var_328_19

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_20 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201080", "story_v_out_411201.awb") ~= 0 then
					local var_328_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201080", "story_v_out_411201.awb") / 1000

					if var_328_23 + var_328_15 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_23 + var_328_15
					end

					if var_328_18.prefab_name ~= "" and arg_325_1.actors_[var_328_18.prefab_name] ~= nil then
						local var_328_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_18.prefab_name].transform, "story_v_out_411201", "411201080", "story_v_out_411201.awb")

						arg_325_1:RecordAudio("411201080", var_328_24)
						arg_325_1:RecordAudio("411201080", var_328_24)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_411201", "411201080", "story_v_out_411201.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_411201", "411201080", "story_v_out_411201.awb")
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
	Play411201081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 411201081
		arg_329_1.duration_ = 1.999999999999

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play411201082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["4010ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos4010ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0, 100, 0)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos4010ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, 100, 0)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["4010ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and arg_329_1.var_.characterEffect4010ui_story == nil then
				arg_329_1.var_.characterEffect4010ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.200000002980232

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect4010ui_story then
					local var_332_13 = Mathf.Lerp(0, 0.5, var_332_12)

					arg_329_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_329_1.var_.characterEffect4010ui_story.fillRatio = var_332_13
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and arg_329_1.var_.characterEffect4010ui_story then
				local var_332_14 = 0.5

				arg_329_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_329_1.var_.characterEffect4010ui_story.fillRatio = var_332_14
			end

			local var_332_15 = arg_329_1.actors_["1024ui_story"].transform
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.var_.moveOldPos1024ui_story = var_332_15.localPosition
			end

			local var_332_17 = 0.001

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Vector3.New(0, -1, -6.05)

				var_332_15.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1024ui_story, var_332_19, var_332_18)

				local var_332_20 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_20.x, var_332_20.y, var_332_20.z)

				local var_332_21 = var_332_15.localEulerAngles

				var_332_21.z = 0
				var_332_21.x = 0
				var_332_15.localEulerAngles = var_332_21
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				var_332_15.localPosition = Vector3.New(0, -1, -6.05)

				local var_332_22 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_22.x, var_332_22.y, var_332_22.z)

				local var_332_23 = var_332_15.localEulerAngles

				var_332_23.z = 0
				var_332_23.x = 0
				var_332_15.localEulerAngles = var_332_23
			end

			local var_332_24 = arg_329_1.actors_["1024ui_story"]
			local var_332_25 = 0

			if var_332_25 < arg_329_1.time_ and arg_329_1.time_ <= var_332_25 + arg_332_0 and arg_329_1.var_.characterEffect1024ui_story == nil then
				arg_329_1.var_.characterEffect1024ui_story = var_332_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_26 = 0.200000002980232

			if var_332_25 <= arg_329_1.time_ and arg_329_1.time_ < var_332_25 + var_332_26 then
				local var_332_27 = (arg_329_1.time_ - var_332_25) / var_332_26

				if arg_329_1.var_.characterEffect1024ui_story then
					arg_329_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_25 + var_332_26 and arg_329_1.time_ < var_332_25 + var_332_26 + arg_332_0 and arg_329_1.var_.characterEffect1024ui_story then
				arg_329_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_332_28 = 0

			if var_332_28 < arg_329_1.time_ and arg_329_1.time_ <= var_332_28 + arg_332_0 then
				arg_329_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_332_29 = 0

			if var_332_29 < arg_329_1.time_ and arg_329_1.time_ <= var_332_29 + arg_332_0 then
				arg_329_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_332_30 = 0
			local var_332_31 = 0.175

			if var_332_30 < arg_329_1.time_ and arg_329_1.time_ <= var_332_30 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_32 = arg_329_1:FormatText(StoryNameCfg[265].name)

				arg_329_1.leftNameTxt_.text = var_332_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_33 = arg_329_1:GetWordFromCfg(411201081)
				local var_332_34 = arg_329_1:FormatText(var_332_33.content)

				arg_329_1.text_.text = var_332_34

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_35 = 7
				local var_332_36 = utf8.len(var_332_34)
				local var_332_37 = var_332_35 <= 0 and var_332_31 or var_332_31 * (var_332_36 / var_332_35)

				if var_332_37 > 0 and var_332_31 < var_332_37 then
					arg_329_1.talkMaxDuration = var_332_37

					if var_332_37 + var_332_30 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_37 + var_332_30
					end
				end

				arg_329_1.text_.text = var_332_34
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201081", "story_v_out_411201.awb") ~= 0 then
					local var_332_38 = manager.audio:GetVoiceLength("story_v_out_411201", "411201081", "story_v_out_411201.awb") / 1000

					if var_332_38 + var_332_30 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_38 + var_332_30
					end

					if var_332_33.prefab_name ~= "" and arg_329_1.actors_[var_332_33.prefab_name] ~= nil then
						local var_332_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_33.prefab_name].transform, "story_v_out_411201", "411201081", "story_v_out_411201.awb")

						arg_329_1:RecordAudio("411201081", var_332_39)
						arg_329_1:RecordAudio("411201081", var_332_39)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_411201", "411201081", "story_v_out_411201.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_411201", "411201081", "story_v_out_411201.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_40 = math.max(var_332_31, arg_329_1.talkMaxDuration)

			if var_332_30 <= arg_329_1.time_ and arg_329_1.time_ < var_332_30 + var_332_40 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_30) / var_332_40

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_30 + var_332_40 and arg_329_1.time_ < var_332_30 + var_332_40 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play411201082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 411201082
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play411201083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1024ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect1024ui_story == nil then
				arg_333_1.var_.characterEffect1024ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1024ui_story then
					local var_336_4 = Mathf.Lerp(0, 0.5, var_336_3)

					arg_333_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1024ui_story.fillRatio = var_336_4
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect1024ui_story then
				local var_336_5 = 0.5

				arg_333_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1024ui_story.fillRatio = var_336_5
			end

			local var_336_6 = arg_333_1.actors_["1024ui_story"].transform
			local var_336_7 = 0

			if var_336_7 < arg_333_1.time_ and arg_333_1.time_ <= var_336_7 + arg_336_0 then
				arg_333_1.var_.moveOldPos1024ui_story = var_336_6.localPosition
			end

			local var_336_8 = 0.001

			if var_336_7 <= arg_333_1.time_ and arg_333_1.time_ < var_336_7 + var_336_8 then
				local var_336_9 = (arg_333_1.time_ - var_336_7) / var_336_8
				local var_336_10 = Vector3.New(0, 100, 0)

				var_336_6.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1024ui_story, var_336_10, var_336_9)

				local var_336_11 = manager.ui.mainCamera.transform.position - var_336_6.position

				var_336_6.forward = Vector3.New(var_336_11.x, var_336_11.y, var_336_11.z)

				local var_336_12 = var_336_6.localEulerAngles

				var_336_12.z = 0
				var_336_12.x = 0
				var_336_6.localEulerAngles = var_336_12
			end

			if arg_333_1.time_ >= var_336_7 + var_336_8 and arg_333_1.time_ < var_336_7 + var_336_8 + arg_336_0 then
				var_336_6.localPosition = Vector3.New(0, 100, 0)

				local var_336_13 = manager.ui.mainCamera.transform.position - var_336_6.position

				var_336_6.forward = Vector3.New(var_336_13.x, var_336_13.y, var_336_13.z)

				local var_336_14 = var_336_6.localEulerAngles

				var_336_14.z = 0
				var_336_14.x = 0
				var_336_6.localEulerAngles = var_336_14
			end

			local var_336_15 = 0
			local var_336_16 = 1.1

			if var_336_15 < arg_333_1.time_ and arg_333_1.time_ <= var_336_15 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_17 = arg_333_1:GetWordFromCfg(411201082)
				local var_336_18 = arg_333_1:FormatText(var_336_17.content)

				arg_333_1.text_.text = var_336_18

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_19 = 44
				local var_336_20 = utf8.len(var_336_18)
				local var_336_21 = var_336_19 <= 0 and var_336_16 or var_336_16 * (var_336_20 / var_336_19)

				if var_336_21 > 0 and var_336_16 < var_336_21 then
					arg_333_1.talkMaxDuration = var_336_21

					if var_336_21 + var_336_15 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_21 + var_336_15
					end
				end

				arg_333_1.text_.text = var_336_18
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_22 = math.max(var_336_16, arg_333_1.talkMaxDuration)

			if var_336_15 <= arg_333_1.time_ and arg_333_1.time_ < var_336_15 + var_336_22 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_15) / var_336_22

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_15 + var_336_22 and arg_333_1.time_ < var_336_15 + var_336_22 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play411201083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 411201083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play411201084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.8

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_2 = arg_337_1:GetWordFromCfg(411201083)
				local var_340_3 = arg_337_1:FormatText(var_340_2.content)

				arg_337_1.text_.text = var_340_3

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_4 = 32
				local var_340_5 = utf8.len(var_340_3)
				local var_340_6 = var_340_4 <= 0 and var_340_1 or var_340_1 * (var_340_5 / var_340_4)

				if var_340_6 > 0 and var_340_1 < var_340_6 then
					arg_337_1.talkMaxDuration = var_340_6

					if var_340_6 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_6 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_3
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_7 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_7 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_7

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_7 and arg_337_1.time_ < var_340_0 + var_340_7 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play411201084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 411201084
		arg_341_1.duration_ = 1.3

		local var_341_0 = {
			zh = 1.2,
			ja = 1.3
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
				arg_341_0:Play411201085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1024ui_story"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1024ui_story = var_344_0.localPosition
			end

			local var_344_2 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2
				local var_344_4 = Vector3.New(0, 100, 0)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1024ui_story, var_344_4, var_344_3)

				local var_344_5 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_5.x, var_344_5.y, var_344_5.z)

				local var_344_6 = var_344_0.localEulerAngles

				var_344_6.z = 0
				var_344_6.x = 0
				var_344_0.localEulerAngles = var_344_6
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, 100, 0)

				local var_344_7 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_7.x, var_344_7.y, var_344_7.z)

				local var_344_8 = var_344_0.localEulerAngles

				var_344_8.z = 0
				var_344_8.x = 0
				var_344_0.localEulerAngles = var_344_8
			end

			local var_344_9 = arg_341_1.actors_["1024ui_story"]
			local var_344_10 = 0

			if var_344_10 < arg_341_1.time_ and arg_341_1.time_ <= var_344_10 + arg_344_0 and arg_341_1.var_.characterEffect1024ui_story == nil then
				arg_341_1.var_.characterEffect1024ui_story = var_344_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_11 = 0.200000002980232

			if var_344_10 <= arg_341_1.time_ and arg_341_1.time_ < var_344_10 + var_344_11 then
				local var_344_12 = (arg_341_1.time_ - var_344_10) / var_344_11

				if arg_341_1.var_.characterEffect1024ui_story then
					local var_344_13 = Mathf.Lerp(0, 0.5, var_344_12)

					arg_341_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1024ui_story.fillRatio = var_344_13
				end
			end

			if arg_341_1.time_ >= var_344_10 + var_344_11 and arg_341_1.time_ < var_344_10 + var_344_11 + arg_344_0 and arg_341_1.var_.characterEffect1024ui_story then
				local var_344_14 = 0.5

				arg_341_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1024ui_story.fillRatio = var_344_14
			end

			local var_344_15 = 0
			local var_344_16 = 0.1

			if var_344_15 < arg_341_1.time_ and arg_341_1.time_ <= var_344_15 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_17 = arg_341_1:FormatText(StoryNameCfg[22].name)

				arg_341_1.leftNameTxt_.text = var_344_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, true)
				arg_341_1.iconController_:SetSelectedState("hero")

				arg_341_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_18 = arg_341_1:GetWordFromCfg(411201084)
				local var_344_19 = arg_341_1:FormatText(var_344_18.content)

				arg_341_1.text_.text = var_344_19

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_20 = 4
				local var_344_21 = utf8.len(var_344_19)
				local var_344_22 = var_344_20 <= 0 and var_344_16 or var_344_16 * (var_344_21 / var_344_20)

				if var_344_22 > 0 and var_344_16 < var_344_22 then
					arg_341_1.talkMaxDuration = var_344_22

					if var_344_22 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_22 + var_344_15
					end
				end

				arg_341_1.text_.text = var_344_19
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201084", "story_v_out_411201.awb") ~= 0 then
					local var_344_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201084", "story_v_out_411201.awb") / 1000

					if var_344_23 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_23 + var_344_15
					end

					if var_344_18.prefab_name ~= "" and arg_341_1.actors_[var_344_18.prefab_name] ~= nil then
						local var_344_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_18.prefab_name].transform, "story_v_out_411201", "411201084", "story_v_out_411201.awb")

						arg_341_1:RecordAudio("411201084", var_344_24)
						arg_341_1:RecordAudio("411201084", var_344_24)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_411201", "411201084", "story_v_out_411201.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_411201", "411201084", "story_v_out_411201.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_25 = math.max(var_344_16, arg_341_1.talkMaxDuration)

			if var_344_15 <= arg_341_1.time_ and arg_341_1.time_ < var_344_15 + var_344_25 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_15) / var_344_25

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_15 + var_344_25 and arg_341_1.time_ < var_344_15 + var_344_25 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play411201085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 411201085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play411201086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = "3008ui_story"

			if arg_345_1.actors_[var_348_0] == nil then
				local var_348_1 = Object.Instantiate(Asset.Load("Char/" .. var_348_0), arg_345_1.stage_.transform)

				var_348_1.name = var_348_0
				var_348_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_345_1.actors_[var_348_0] = var_348_1

				local var_348_2 = var_348_1:GetComponentInChildren(typeof(CharacterEffect))

				var_348_2.enabled = true

				local var_348_3 = GameObjectTools.GetOrAddComponent(var_348_1, typeof(DynamicBoneHelper))

				if var_348_3 then
					var_348_3:EnableDynamicBone(false)
				end

				arg_345_1:ShowWeapon(var_348_2.transform, false)

				arg_345_1.var_[var_348_0 .. "Animator"] = var_348_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_345_1.var_[var_348_0 .. "Animator"].applyRootMotion = true
				arg_345_1.var_[var_348_0 .. "LipSync"] = var_348_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_348_4 = arg_345_1.actors_["3008ui_story"].transform
			local var_348_5 = 0

			if var_348_5 < arg_345_1.time_ and arg_345_1.time_ <= var_348_5 + arg_348_0 then
				arg_345_1.var_.moveOldPos3008ui_story = var_348_4.localPosition
			end

			local var_348_6 = 0.001

			if var_348_5 <= arg_345_1.time_ and arg_345_1.time_ < var_348_5 + var_348_6 then
				local var_348_7 = (arg_345_1.time_ - var_348_5) / var_348_6
				local var_348_8 = Vector3.New(0, 100, 0)

				var_348_4.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos3008ui_story, var_348_8, var_348_7)

				local var_348_9 = manager.ui.mainCamera.transform.position - var_348_4.position

				var_348_4.forward = Vector3.New(var_348_9.x, var_348_9.y, var_348_9.z)

				local var_348_10 = var_348_4.localEulerAngles

				var_348_10.z = 0
				var_348_10.x = 0
				var_348_4.localEulerAngles = var_348_10
			end

			if arg_345_1.time_ >= var_348_5 + var_348_6 and arg_345_1.time_ < var_348_5 + var_348_6 + arg_348_0 then
				var_348_4.localPosition = Vector3.New(0, 100, 0)

				local var_348_11 = manager.ui.mainCamera.transform.position - var_348_4.position

				var_348_4.forward = Vector3.New(var_348_11.x, var_348_11.y, var_348_11.z)

				local var_348_12 = var_348_4.localEulerAngles

				var_348_12.z = 0
				var_348_12.x = 0
				var_348_4.localEulerAngles = var_348_12
			end

			local var_348_13 = arg_345_1.actors_["3008ui_story"]
			local var_348_14 = 0

			if var_348_14 < arg_345_1.time_ and arg_345_1.time_ <= var_348_14 + arg_348_0 and arg_345_1.var_.characterEffect3008ui_story == nil then
				arg_345_1.var_.characterEffect3008ui_story = var_348_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_15 = 0.200000002980232

			if var_348_14 <= arg_345_1.time_ and arg_345_1.time_ < var_348_14 + var_348_15 then
				local var_348_16 = (arg_345_1.time_ - var_348_14) / var_348_15

				if arg_345_1.var_.characterEffect3008ui_story then
					local var_348_17 = Mathf.Lerp(0, 0.5, var_348_16)

					arg_345_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_345_1.var_.characterEffect3008ui_story.fillRatio = var_348_17
				end
			end

			if arg_345_1.time_ >= var_348_14 + var_348_15 and arg_345_1.time_ < var_348_14 + var_348_15 + arg_348_0 and arg_345_1.var_.characterEffect3008ui_story then
				local var_348_18 = 0.5

				arg_345_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_345_1.var_.characterEffect3008ui_story.fillRatio = var_348_18
			end

			local var_348_19 = 0
			local var_348_20 = 0.975

			if var_348_19 < arg_345_1.time_ and arg_345_1.time_ <= var_348_19 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_21 = arg_345_1:GetWordFromCfg(411201085)
				local var_348_22 = arg_345_1:FormatText(var_348_21.content)

				arg_345_1.text_.text = var_348_22

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_23 = 39
				local var_348_24 = utf8.len(var_348_22)
				local var_348_25 = var_348_23 <= 0 and var_348_20 or var_348_20 * (var_348_24 / var_348_23)

				if var_348_25 > 0 and var_348_20 < var_348_25 then
					arg_345_1.talkMaxDuration = var_348_25

					if var_348_25 + var_348_19 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_25 + var_348_19
					end
				end

				arg_345_1.text_.text = var_348_22
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_26 = math.max(var_348_20, arg_345_1.talkMaxDuration)

			if var_348_19 <= arg_345_1.time_ and arg_345_1.time_ < var_348_19 + var_348_26 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_19) / var_348_26

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_19 + var_348_26 and arg_345_1.time_ < var_348_19 + var_348_26 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play411201086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 411201086
		arg_349_1.duration_ = 3.1

		local var_349_0 = {
			zh = 3.1,
			ja = 2.366
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
				arg_349_0:Play411201087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.35

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[22].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, true)
				arg_349_1.iconController_:SetSelectedState("hero")

				arg_349_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(411201086)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201086", "story_v_out_411201.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201086", "story_v_out_411201.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_411201", "411201086", "story_v_out_411201.awb")

						arg_349_1:RecordAudio("411201086", var_352_9)
						arg_349_1:RecordAudio("411201086", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_411201", "411201086", "story_v_out_411201.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_411201", "411201086", "story_v_out_411201.awb")
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
	Play411201087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 411201087
		arg_353_1.duration_ = 3.533

		local var_353_0 = {
			zh = 1.999999999999,
			ja = 3.533
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
				arg_353_0:Play411201088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["4010ui_story"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos4010ui_story = var_356_0.localPosition
			end

			local var_356_2 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2
				local var_356_4 = Vector3.New(0, -1.59, -5.2)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos4010ui_story, var_356_4, var_356_3)

				local var_356_5 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_5.x, var_356_5.y, var_356_5.z)

				local var_356_6 = var_356_0.localEulerAngles

				var_356_6.z = 0
				var_356_6.x = 0
				var_356_0.localEulerAngles = var_356_6
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_356_7 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_7.x, var_356_7.y, var_356_7.z)

				local var_356_8 = var_356_0.localEulerAngles

				var_356_8.z = 0
				var_356_8.x = 0
				var_356_0.localEulerAngles = var_356_8
			end

			local var_356_9 = arg_353_1.actors_["4010ui_story"]
			local var_356_10 = 0

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 and arg_353_1.var_.characterEffect4010ui_story == nil then
				arg_353_1.var_.characterEffect4010ui_story = var_356_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_11 = 0.200000002980232

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_11 then
				local var_356_12 = (arg_353_1.time_ - var_356_10) / var_356_11

				if arg_353_1.var_.characterEffect4010ui_story then
					arg_353_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_10 + var_356_11 and arg_353_1.time_ < var_356_10 + var_356_11 + arg_356_0 and arg_353_1.var_.characterEffect4010ui_story then
				arg_353_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_356_13 = 0

			if var_356_13 < arg_353_1.time_ and arg_353_1.time_ <= var_356_13 + arg_356_0 then
				arg_353_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action8_2")
			end

			local var_356_14 = 0

			if var_356_14 < arg_353_1.time_ and arg_353_1.time_ <= var_356_14 + arg_356_0 then
				arg_353_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_356_15 = 0
			local var_356_16 = 0.175

			if var_356_15 < arg_353_1.time_ and arg_353_1.time_ <= var_356_15 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_17 = arg_353_1:FormatText(StoryNameCfg[42].name)

				arg_353_1.leftNameTxt_.text = var_356_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_18 = arg_353_1:GetWordFromCfg(411201087)
				local var_356_19 = arg_353_1:FormatText(var_356_18.content)

				arg_353_1.text_.text = var_356_19

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_20 = 7
				local var_356_21 = utf8.len(var_356_19)
				local var_356_22 = var_356_20 <= 0 and var_356_16 or var_356_16 * (var_356_21 / var_356_20)

				if var_356_22 > 0 and var_356_16 < var_356_22 then
					arg_353_1.talkMaxDuration = var_356_22

					if var_356_22 + var_356_15 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_22 + var_356_15
					end
				end

				arg_353_1.text_.text = var_356_19
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201087", "story_v_out_411201.awb") ~= 0 then
					local var_356_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201087", "story_v_out_411201.awb") / 1000

					if var_356_23 + var_356_15 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_23 + var_356_15
					end

					if var_356_18.prefab_name ~= "" and arg_353_1.actors_[var_356_18.prefab_name] ~= nil then
						local var_356_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_18.prefab_name].transform, "story_v_out_411201", "411201087", "story_v_out_411201.awb")

						arg_353_1:RecordAudio("411201087", var_356_24)
						arg_353_1:RecordAudio("411201087", var_356_24)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_411201", "411201087", "story_v_out_411201.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_411201", "411201087", "story_v_out_411201.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_25 = math.max(var_356_16, arg_353_1.talkMaxDuration)

			if var_356_15 <= arg_353_1.time_ and arg_353_1.time_ < var_356_15 + var_356_25 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_15) / var_356_25

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_15 + var_356_25 and arg_353_1.time_ < var_356_15 + var_356_25 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play411201088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 411201088
		arg_357_1.duration_ = 1.999999999999

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play411201089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["4010ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect4010ui_story == nil then
				arg_357_1.var_.characterEffect4010ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.200000002980232

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect4010ui_story then
					local var_360_4 = Mathf.Lerp(0, 0.5, var_360_3)

					arg_357_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_357_1.var_.characterEffect4010ui_story.fillRatio = var_360_4
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect4010ui_story then
				local var_360_5 = 0.5

				arg_357_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_357_1.var_.characterEffect4010ui_story.fillRatio = var_360_5
			end

			local var_360_6 = arg_357_1.actors_["3008ui_story"]
			local var_360_7 = 0

			if var_360_7 < arg_357_1.time_ and arg_357_1.time_ <= var_360_7 + arg_360_0 and arg_357_1.var_.characterEffect3008ui_story == nil then
				arg_357_1.var_.characterEffect3008ui_story = var_360_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_8 = 0.200000002980232

			if var_360_7 <= arg_357_1.time_ and arg_357_1.time_ < var_360_7 + var_360_8 then
				local var_360_9 = (arg_357_1.time_ - var_360_7) / var_360_8

				if arg_357_1.var_.characterEffect3008ui_story then
					arg_357_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_7 + var_360_8 and arg_357_1.time_ < var_360_7 + var_360_8 + arg_360_0 and arg_357_1.var_.characterEffect3008ui_story then
				arg_357_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_360_10 = 0

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 then
				arg_357_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action5_2")
			end

			local var_360_11 = 0

			if var_360_11 < arg_357_1.time_ and arg_357_1.time_ <= var_360_11 + arg_360_0 then
				arg_357_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_360_12 = 0
			local var_360_13 = 0.225

			if var_360_12 < arg_357_1.time_ and arg_357_1.time_ <= var_360_12 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_14 = arg_357_1:FormatText(StoryNameCfg[22].name)

				arg_357_1.leftNameTxt_.text = var_360_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_15 = arg_357_1:GetWordFromCfg(411201088)
				local var_360_16 = arg_357_1:FormatText(var_360_15.content)

				arg_357_1.text_.text = var_360_16

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_17 = 9
				local var_360_18 = utf8.len(var_360_16)
				local var_360_19 = var_360_17 <= 0 and var_360_13 or var_360_13 * (var_360_18 / var_360_17)

				if var_360_19 > 0 and var_360_13 < var_360_19 then
					arg_357_1.talkMaxDuration = var_360_19

					if var_360_19 + var_360_12 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_19 + var_360_12
					end
				end

				arg_357_1.text_.text = var_360_16
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201088", "story_v_out_411201.awb") ~= 0 then
					local var_360_20 = manager.audio:GetVoiceLength("story_v_out_411201", "411201088", "story_v_out_411201.awb") / 1000

					if var_360_20 + var_360_12 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_20 + var_360_12
					end

					if var_360_15.prefab_name ~= "" and arg_357_1.actors_[var_360_15.prefab_name] ~= nil then
						local var_360_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_15.prefab_name].transform, "story_v_out_411201", "411201088", "story_v_out_411201.awb")

						arg_357_1:RecordAudio("411201088", var_360_21)
						arg_357_1:RecordAudio("411201088", var_360_21)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_411201", "411201088", "story_v_out_411201.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_411201", "411201088", "story_v_out_411201.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_22 = math.max(var_360_13, arg_357_1.talkMaxDuration)

			if var_360_12 <= arg_357_1.time_ and arg_357_1.time_ < var_360_12 + var_360_22 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_12) / var_360_22

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_12 + var_360_22 and arg_357_1.time_ < var_360_12 + var_360_22 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play411201089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 411201089
		arg_361_1.duration_ = 2.2

		local var_361_0 = {
			zh = 2,
			ja = 2.2
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
				arg_361_0:Play411201090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["3008ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect3008ui_story == nil then
				arg_361_1.var_.characterEffect3008ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.200000002980232

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect3008ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_361_1.var_.characterEffect3008ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect3008ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_361_1.var_.characterEffect3008ui_story.fillRatio = var_364_5
			end

			local var_364_6 = arg_361_1.actors_["4010ui_story"]
			local var_364_7 = 0

			if var_364_7 < arg_361_1.time_ and arg_361_1.time_ <= var_364_7 + arg_364_0 and arg_361_1.var_.characterEffect4010ui_story == nil then
				arg_361_1.var_.characterEffect4010ui_story = var_364_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_8 = 0.200000002980232

			if var_364_7 <= arg_361_1.time_ and arg_361_1.time_ < var_364_7 + var_364_8 then
				local var_364_9 = (arg_361_1.time_ - var_364_7) / var_364_8

				if arg_361_1.var_.characterEffect4010ui_story then
					arg_361_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_7 + var_364_8 and arg_361_1.time_ < var_364_7 + var_364_8 + arg_364_0 and arg_361_1.var_.characterEffect4010ui_story then
				arg_361_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_364_10 = 0
			local var_364_11 = 0.25

			if var_364_10 < arg_361_1.time_ and arg_361_1.time_ <= var_364_10 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_12 = arg_361_1:FormatText(StoryNameCfg[42].name)

				arg_361_1.leftNameTxt_.text = var_364_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_13 = arg_361_1:GetWordFromCfg(411201089)
				local var_364_14 = arg_361_1:FormatText(var_364_13.content)

				arg_361_1.text_.text = var_364_14

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_15 = 10
				local var_364_16 = utf8.len(var_364_14)
				local var_364_17 = var_364_15 <= 0 and var_364_11 or var_364_11 * (var_364_16 / var_364_15)

				if var_364_17 > 0 and var_364_11 < var_364_17 then
					arg_361_1.talkMaxDuration = var_364_17

					if var_364_17 + var_364_10 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_17 + var_364_10
					end
				end

				arg_361_1.text_.text = var_364_14
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201089", "story_v_out_411201.awb") ~= 0 then
					local var_364_18 = manager.audio:GetVoiceLength("story_v_out_411201", "411201089", "story_v_out_411201.awb") / 1000

					if var_364_18 + var_364_10 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_18 + var_364_10
					end

					if var_364_13.prefab_name ~= "" and arg_361_1.actors_[var_364_13.prefab_name] ~= nil then
						local var_364_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_13.prefab_name].transform, "story_v_out_411201", "411201089", "story_v_out_411201.awb")

						arg_361_1:RecordAudio("411201089", var_364_19)
						arg_361_1:RecordAudio("411201089", var_364_19)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_411201", "411201089", "story_v_out_411201.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_411201", "411201089", "story_v_out_411201.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_20 = math.max(var_364_11, arg_361_1.talkMaxDuration)

			if var_364_10 <= arg_361_1.time_ and arg_361_1.time_ < var_364_10 + var_364_20 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_10) / var_364_20

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_10 + var_364_20 and arg_361_1.time_ < var_364_10 + var_364_20 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play411201090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 411201090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play411201091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["3008ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos3008ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(0, 100, 0)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos3008ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(0, 100, 0)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = arg_365_1.actors_["3008ui_story"]
			local var_368_10 = 0

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 and arg_365_1.var_.characterEffect3008ui_story == nil then
				arg_365_1.var_.characterEffect3008ui_story = var_368_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_11 = 0.200000002980232

			if var_368_10 <= arg_365_1.time_ and arg_365_1.time_ < var_368_10 + var_368_11 then
				local var_368_12 = (arg_365_1.time_ - var_368_10) / var_368_11

				if arg_365_1.var_.characterEffect3008ui_story then
					local var_368_13 = Mathf.Lerp(0, 0.5, var_368_12)

					arg_365_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_365_1.var_.characterEffect3008ui_story.fillRatio = var_368_13
				end
			end

			if arg_365_1.time_ >= var_368_10 + var_368_11 and arg_365_1.time_ < var_368_10 + var_368_11 + arg_368_0 and arg_365_1.var_.characterEffect3008ui_story then
				local var_368_14 = 0.5

				arg_365_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_365_1.var_.characterEffect3008ui_story.fillRatio = var_368_14
			end

			local var_368_15 = arg_365_1.actors_["4010ui_story"].transform
			local var_368_16 = 0

			if var_368_16 < arg_365_1.time_ and arg_365_1.time_ <= var_368_16 + arg_368_0 then
				arg_365_1.var_.moveOldPos4010ui_story = var_368_15.localPosition
			end

			local var_368_17 = 0.001

			if var_368_16 <= arg_365_1.time_ and arg_365_1.time_ < var_368_16 + var_368_17 then
				local var_368_18 = (arg_365_1.time_ - var_368_16) / var_368_17
				local var_368_19 = Vector3.New(0, 100, 0)

				var_368_15.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos4010ui_story, var_368_19, var_368_18)

				local var_368_20 = manager.ui.mainCamera.transform.position - var_368_15.position

				var_368_15.forward = Vector3.New(var_368_20.x, var_368_20.y, var_368_20.z)

				local var_368_21 = var_368_15.localEulerAngles

				var_368_21.z = 0
				var_368_21.x = 0
				var_368_15.localEulerAngles = var_368_21
			end

			if arg_365_1.time_ >= var_368_16 + var_368_17 and arg_365_1.time_ < var_368_16 + var_368_17 + arg_368_0 then
				var_368_15.localPosition = Vector3.New(0, 100, 0)

				local var_368_22 = manager.ui.mainCamera.transform.position - var_368_15.position

				var_368_15.forward = Vector3.New(var_368_22.x, var_368_22.y, var_368_22.z)

				local var_368_23 = var_368_15.localEulerAngles

				var_368_23.z = 0
				var_368_23.x = 0
				var_368_15.localEulerAngles = var_368_23
			end

			local var_368_24 = arg_365_1.actors_["4010ui_story"]
			local var_368_25 = 0

			if var_368_25 < arg_365_1.time_ and arg_365_1.time_ <= var_368_25 + arg_368_0 and arg_365_1.var_.characterEffect4010ui_story == nil then
				arg_365_1.var_.characterEffect4010ui_story = var_368_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_26 = 0.200000002980232

			if var_368_25 <= arg_365_1.time_ and arg_365_1.time_ < var_368_25 + var_368_26 then
				local var_368_27 = (arg_365_1.time_ - var_368_25) / var_368_26

				if arg_365_1.var_.characterEffect4010ui_story then
					local var_368_28 = Mathf.Lerp(0, 0.5, var_368_27)

					arg_365_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_365_1.var_.characterEffect4010ui_story.fillRatio = var_368_28
				end
			end

			if arg_365_1.time_ >= var_368_25 + var_368_26 and arg_365_1.time_ < var_368_25 + var_368_26 + arg_368_0 and arg_365_1.var_.characterEffect4010ui_story then
				local var_368_29 = 0.5

				arg_365_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_365_1.var_.characterEffect4010ui_story.fillRatio = var_368_29
			end

			local var_368_30 = 0
			local var_368_31 = 1.125

			if var_368_30 < arg_365_1.time_ and arg_365_1.time_ <= var_368_30 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_32 = arg_365_1:GetWordFromCfg(411201090)
				local var_368_33 = arg_365_1:FormatText(var_368_32.content)

				arg_365_1.text_.text = var_368_33

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_34 = 45
				local var_368_35 = utf8.len(var_368_33)
				local var_368_36 = var_368_34 <= 0 and var_368_31 or var_368_31 * (var_368_35 / var_368_34)

				if var_368_36 > 0 and var_368_31 < var_368_36 then
					arg_365_1.talkMaxDuration = var_368_36

					if var_368_36 + var_368_30 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_36 + var_368_30
					end
				end

				arg_365_1.text_.text = var_368_33
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_37 = math.max(var_368_31, arg_365_1.talkMaxDuration)

			if var_368_30 <= arg_365_1.time_ and arg_365_1.time_ < var_368_30 + var_368_37 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_30) / var_368_37

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_30 + var_368_37 and arg_365_1.time_ < var_368_30 + var_368_37 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play411201091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 411201091
		arg_369_1.duration_ = 4.166

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play411201092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.075

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[266].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, true)
				arg_369_1.iconController_:SetSelectedState("hero")

				arg_369_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1024_1")

				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(411201091)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 3
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201091", "story_v_out_411201.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_411201", "411201091", "story_v_out_411201.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_411201", "411201091", "story_v_out_411201.awb")

						arg_369_1:RecordAudio("411201091", var_372_9)
						arg_369_1:RecordAudio("411201091", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_411201", "411201091", "story_v_out_411201.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_411201", "411201091", "story_v_out_411201.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play411201092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 411201092
		arg_373_1.duration_ = 1.7

		local var_373_0 = {
			zh = 1.366,
			ja = 1.7
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
				arg_373_0:Play411201093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1024ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1024ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(0, -1, -6.05)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1024ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, -1, -6.05)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = arg_373_1.actors_["1024ui_story"]
			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 and arg_373_1.var_.characterEffect1024ui_story == nil then
				arg_373_1.var_.characterEffect1024ui_story = var_376_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_11 = 0.200000002980232

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_11 then
				local var_376_12 = (arg_373_1.time_ - var_376_10) / var_376_11

				if arg_373_1.var_.characterEffect1024ui_story then
					arg_373_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_10 + var_376_11 and arg_373_1.time_ < var_376_10 + var_376_11 + arg_376_0 and arg_373_1.var_.characterEffect1024ui_story then
				arg_373_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_376_13 = 0

			if var_376_13 < arg_373_1.time_ and arg_373_1.time_ <= var_376_13 + arg_376_0 then
				arg_373_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_376_14 = 0

			if var_376_14 < arg_373_1.time_ and arg_373_1.time_ <= var_376_14 + arg_376_0 then
				arg_373_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_376_15 = 0
			local var_376_16 = 0.175

			if var_376_15 < arg_373_1.time_ and arg_373_1.time_ <= var_376_15 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_17 = arg_373_1:FormatText(StoryNameCfg[265].name)

				arg_373_1.leftNameTxt_.text = var_376_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_18 = arg_373_1:GetWordFromCfg(411201092)
				local var_376_19 = arg_373_1:FormatText(var_376_18.content)

				arg_373_1.text_.text = var_376_19

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_20 = 7
				local var_376_21 = utf8.len(var_376_19)
				local var_376_22 = var_376_20 <= 0 and var_376_16 or var_376_16 * (var_376_21 / var_376_20)

				if var_376_22 > 0 and var_376_16 < var_376_22 then
					arg_373_1.talkMaxDuration = var_376_22

					if var_376_22 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_22 + var_376_15
					end
				end

				arg_373_1.text_.text = var_376_19
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201092", "story_v_out_411201.awb") ~= 0 then
					local var_376_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201092", "story_v_out_411201.awb") / 1000

					if var_376_23 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_23 + var_376_15
					end

					if var_376_18.prefab_name ~= "" and arg_373_1.actors_[var_376_18.prefab_name] ~= nil then
						local var_376_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_18.prefab_name].transform, "story_v_out_411201", "411201092", "story_v_out_411201.awb")

						arg_373_1:RecordAudio("411201092", var_376_24)
						arg_373_1:RecordAudio("411201092", var_376_24)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_411201", "411201092", "story_v_out_411201.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_411201", "411201092", "story_v_out_411201.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_25 = math.max(var_376_16, arg_373_1.talkMaxDuration)

			if var_376_15 <= arg_373_1.time_ and arg_373_1.time_ < var_376_15 + var_376_25 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_15) / var_376_25

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_15 + var_376_25 and arg_373_1.time_ < var_376_15 + var_376_25 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play411201093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 411201093
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play411201094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1024ui_story"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos1024ui_story = var_380_0.localPosition
			end

			local var_380_2 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2
				local var_380_4 = Vector3.New(0, 100, 0)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1024ui_story, var_380_4, var_380_3)

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

			local var_380_9 = arg_377_1.actors_["1024ui_story"]
			local var_380_10 = 0

			if var_380_10 < arg_377_1.time_ and arg_377_1.time_ <= var_380_10 + arg_380_0 and arg_377_1.var_.characterEffect1024ui_story == nil then
				arg_377_1.var_.characterEffect1024ui_story = var_380_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_11 = 0.200000002980232

			if var_380_10 <= arg_377_1.time_ and arg_377_1.time_ < var_380_10 + var_380_11 then
				local var_380_12 = (arg_377_1.time_ - var_380_10) / var_380_11

				if arg_377_1.var_.characterEffect1024ui_story then
					local var_380_13 = Mathf.Lerp(0, 0.5, var_380_12)

					arg_377_1.var_.characterEffect1024ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1024ui_story.fillRatio = var_380_13
				end
			end

			if arg_377_1.time_ >= var_380_10 + var_380_11 and arg_377_1.time_ < var_380_10 + var_380_11 + arg_380_0 and arg_377_1.var_.characterEffect1024ui_story then
				local var_380_14 = 0.5

				arg_377_1.var_.characterEffect1024ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1024ui_story.fillRatio = var_380_14
			end

			local var_380_15 = 0
			local var_380_16 = 0.875

			if var_380_15 < arg_377_1.time_ and arg_377_1.time_ <= var_380_15 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_17 = arg_377_1:GetWordFromCfg(411201093)
				local var_380_18 = arg_377_1:FormatText(var_380_17.content)

				arg_377_1.text_.text = var_380_18

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_19 = 35
				local var_380_20 = utf8.len(var_380_18)
				local var_380_21 = var_380_19 <= 0 and var_380_16 or var_380_16 * (var_380_20 / var_380_19)

				if var_380_21 > 0 and var_380_16 < var_380_21 then
					arg_377_1.talkMaxDuration = var_380_21

					if var_380_21 + var_380_15 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_21 + var_380_15
					end
				end

				arg_377_1.text_.text = var_380_18
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_22 = math.max(var_380_16, arg_377_1.talkMaxDuration)

			if var_380_15 <= arg_377_1.time_ and arg_377_1.time_ < var_380_15 + var_380_22 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_15) / var_380_22

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_15 + var_380_22 and arg_377_1.time_ < var_380_15 + var_380_22 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play411201094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 411201094
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play411201095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 1.075

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

				local var_384_2 = arg_381_1:GetWordFromCfg(411201094)
				local var_384_3 = arg_381_1:FormatText(var_384_2.content)

				arg_381_1.text_.text = var_384_3

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_4 = 43
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
	Play411201095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 411201095
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play411201096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.55

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_2 = arg_385_1:GetWordFromCfg(411201095)
				local var_388_3 = arg_385_1:FormatText(var_388_2.content)

				arg_385_1.text_.text = var_388_3

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_4 = 22
				local var_388_5 = utf8.len(var_388_3)
				local var_388_6 = var_388_4 <= 0 and var_388_1 or var_388_1 * (var_388_5 / var_388_4)

				if var_388_6 > 0 and var_388_1 < var_388_6 then
					arg_385_1.talkMaxDuration = var_388_6

					if var_388_6 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_6 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_3
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_7 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_7 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_7

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_7 and arg_385_1.time_ < var_388_0 + var_388_7 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play411201096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 411201096
		arg_389_1.duration_ = 2.9

		local var_389_0 = {
			zh = 2.9,
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
			arg_389_1.auto_ = false
		end

		function arg_389_1.playNext_(arg_391_0)
			arg_389_1.onStoryFinished_()
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1024ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1024ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(0, -1, -6.05)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1024ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(0, -1, -6.05)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1024ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1024ui_story == nil then
				arg_389_1.var_.characterEffect1024ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1024ui_story then
					arg_389_1.var_.characterEffect1024ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1024ui_story then
				arg_389_1.var_.characterEffect1024ui_story.fillFlat = false
			end

			local var_392_13 = 0

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/1024/1024action/1024action1_1")
			end

			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 then
				arg_389_1:PlayTimeline("1024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_392_15 = 0
			local var_392_16 = 0.325

			if var_392_15 < arg_389_1.time_ and arg_389_1.time_ <= var_392_15 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_17 = arg_389_1:FormatText(StoryNameCfg[265].name)

				arg_389_1.leftNameTxt_.text = var_392_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_18 = arg_389_1:GetWordFromCfg(411201096)
				local var_392_19 = arg_389_1:FormatText(var_392_18.content)

				arg_389_1.text_.text = var_392_19

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_20 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_411201", "411201096", "story_v_out_411201.awb") ~= 0 then
					local var_392_23 = manager.audio:GetVoiceLength("story_v_out_411201", "411201096", "story_v_out_411201.awb") / 1000

					if var_392_23 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_23 + var_392_15
					end

					if var_392_18.prefab_name ~= "" and arg_389_1.actors_[var_392_18.prefab_name] ~= nil then
						local var_392_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_18.prefab_name].transform, "story_v_out_411201", "411201096", "story_v_out_411201.awb")

						arg_389_1:RecordAudio("411201096", var_392_24)
						arg_389_1:RecordAudio("411201096", var_392_24)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_411201", "411201096", "story_v_out_411201.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_411201", "411201096", "story_v_out_411201.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST75",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B10b"
	},
	voices = {
		"story_v_out_411201.awb"
	}
}
