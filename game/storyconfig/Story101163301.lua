return {
	Play116331001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116331001
		arg_1_1.duration_ = 5.766

		local var_1_0 = {
			zh = 4.6,
			ja = 5.766
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
				arg_1_0:Play116331002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I07a"

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
				local var_4_5 = arg_1_1.bgs_.I07a

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
					if iter_4_0 ~= "I07a" then
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
			local var_4_23 = 0.266666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.4
			local var_4_27 = 0.6

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story.awb")
			end

			local var_4_30 = 0.575
			local var_4_31 = 0.425

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_1_6_story_story", "corg", "bgm_activity_1_6_story_story.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.3

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[337].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(116331001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 12
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_35 or var_4_35 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_35 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42
					var_4_34 = var_4_34 + 0.3

					if var_4_42 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331001", "story_v_out_116331.awb") ~= 0 then
					local var_4_43 = manager.audio:GetVoiceLength("story_v_out_116331", "116331001", "story_v_out_116331.awb") / 1000

					if var_4_43 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_34
					end

					if var_4_38.prefab_name ~= "" and arg_1_1.actors_[var_4_38.prefab_name] ~= nil then
						local var_4_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_38.prefab_name].transform, "story_v_out_116331", "116331001", "story_v_out_116331.awb")

						arg_1_1:RecordAudio("116331001", var_4_44)
						arg_1_1:RecordAudio("116331001", var_4_44)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116331", "116331001", "story_v_out_116331.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116331", "116331001", "story_v_out_116331.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_45 = var_4_34 + 0.3
			local var_4_46 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_45) / var_4_46

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play116331002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 116331002
		arg_7_1.duration_ = 13.766

		local var_7_0 = {
			zh = 11.8,
			ja = 13.766
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
				arg_7_0:Play116331003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10032ui_story"

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

			local var_10_4 = arg_7_1.actors_["10032ui_story"].transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.var_.moveOldPos10032ui_story = var_10_4.localPosition
			end

			local var_10_6 = 0.001

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6
				local var_10_8 = Vector3.New(0, -1.1, -5.9)

				var_10_4.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10032ui_story, var_10_8, var_10_7)

				local var_10_9 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_9.x, var_10_9.y, var_10_9.z)

				local var_10_10 = var_10_4.localEulerAngles

				var_10_10.z = 0
				var_10_10.x = 0
				var_10_4.localEulerAngles = var_10_10
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 then
				var_10_4.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_10_11 = manager.ui.mainCamera.transform.position - var_10_4.position

				var_10_4.forward = Vector3.New(var_10_11.x, var_10_11.y, var_10_11.z)

				local var_10_12 = var_10_4.localEulerAngles

				var_10_12.z = 0
				var_10_12.x = 0
				var_10_4.localEulerAngles = var_10_12
			end

			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 then
				arg_7_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action1_1")
			end

			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_10_15 = arg_7_1.actors_["10032ui_story"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 and arg_7_1.var_.characterEffect10032ui_story == nil then
				arg_7_1.var_.characterEffect10032ui_story = var_10_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_17 = 0.2

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_16) / var_10_17

				if arg_7_1.var_.characterEffect10032ui_story then
					arg_7_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_17 and arg_7_1.time_ < var_10_16 + var_10_17 + arg_10_0 and arg_7_1.var_.characterEffect10032ui_story then
				arg_7_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_10_19 = 0
			local var_10_20 = 0.975

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_21 = arg_7_1:FormatText(StoryNameCfg[328].name)

				arg_7_1.leftNameTxt_.text = var_10_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_22 = arg_7_1:GetWordFromCfg(116331002)
				local var_10_23 = arg_7_1:FormatText(var_10_22.content)

				arg_7_1.text_.text = var_10_23

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_24 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331002", "story_v_out_116331.awb") ~= 0 then
					local var_10_27 = manager.audio:GetVoiceLength("story_v_out_116331", "116331002", "story_v_out_116331.awb") / 1000

					if var_10_27 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_27 + var_10_19
					end

					if var_10_22.prefab_name ~= "" and arg_7_1.actors_[var_10_22.prefab_name] ~= nil then
						local var_10_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_22.prefab_name].transform, "story_v_out_116331", "116331002", "story_v_out_116331.awb")

						arg_7_1:RecordAudio("116331002", var_10_28)
						arg_7_1:RecordAudio("116331002", var_10_28)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_116331", "116331002", "story_v_out_116331.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_116331", "116331002", "story_v_out_116331.awb")
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
	Play116331003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 116331003
		arg_11_1.duration_ = 1.9

		local var_11_0 = {
			zh = 1.9,
			ja = 1.433
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
				arg_11_0:Play116331004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10032ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect10032ui_story == nil then
				arg_11_1.var_.characterEffect10032ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.2

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect10032ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_11_1.var_.characterEffect10032ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect10032ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_11_1.var_.characterEffect10032ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.25

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[337].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(116331003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331003", "story_v_out_116331.awb") ~= 0 then
					local var_14_14 = manager.audio:GetVoiceLength("story_v_out_116331", "116331003", "story_v_out_116331.awb") / 1000

					if var_14_14 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_6
					end

					if var_14_9.prefab_name ~= "" and arg_11_1.actors_[var_14_9.prefab_name] ~= nil then
						local var_14_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_9.prefab_name].transform, "story_v_out_116331", "116331003", "story_v_out_116331.awb")

						arg_11_1:RecordAudio("116331003", var_14_15)
						arg_11_1:RecordAudio("116331003", var_14_15)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_116331", "116331003", "story_v_out_116331.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_116331", "116331003", "story_v_out_116331.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_16 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_16 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_16

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_16 and arg_11_1.time_ < var_14_6 + var_14_16 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play116331004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 116331004
		arg_15_1.duration_ = 2.966

		local var_15_0 = {
			zh = 2.966,
			ja = 2.666
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
				arg_15_0:Play116331005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10032ui_story"].transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.var_.moveOldPos10032ui_story = var_18_0.localPosition
			end

			local var_18_2 = 0.001

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2
				local var_18_4 = Vector3.New(0, -1.1, -5.9)

				var_18_0.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10032ui_story, var_18_4, var_18_3)

				local var_18_5 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_5.x, var_18_5.y, var_18_5.z)

				local var_18_6 = var_18_0.localEulerAngles

				var_18_6.z = 0
				var_18_6.x = 0
				var_18_0.localEulerAngles = var_18_6
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 then
				var_18_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_18_7 = manager.ui.mainCamera.transform.position - var_18_0.position

				var_18_0.forward = Vector3.New(var_18_7.x, var_18_7.y, var_18_7.z)

				local var_18_8 = var_18_0.localEulerAngles

				var_18_8.z = 0
				var_18_8.x = 0
				var_18_0.localEulerAngles = var_18_8
			end

			local var_18_9 = 0

			if var_18_9 < arg_15_1.time_ and arg_15_1.time_ <= var_18_9 + arg_18_0 then
				arg_15_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_18_10 = 0

			if var_18_10 < arg_15_1.time_ and arg_15_1.time_ <= var_18_10 + arg_18_0 then
				arg_15_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_18_11 = arg_15_1.actors_["10032ui_story"]
			local var_18_12 = 0

			if var_18_12 < arg_15_1.time_ and arg_15_1.time_ <= var_18_12 + arg_18_0 and arg_15_1.var_.characterEffect10032ui_story == nil then
				arg_15_1.var_.characterEffect10032ui_story = var_18_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_13 = 0.2

			if var_18_12 <= arg_15_1.time_ and arg_15_1.time_ < var_18_12 + var_18_13 then
				local var_18_14 = (arg_15_1.time_ - var_18_12) / var_18_13

				if arg_15_1.var_.characterEffect10032ui_story then
					arg_15_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_12 + var_18_13 and arg_15_1.time_ < var_18_12 + var_18_13 + arg_18_0 and arg_15_1.var_.characterEffect10032ui_story then
				arg_15_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_18_15 = 0
			local var_18_16 = 0.2

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_17 = arg_15_1:FormatText(StoryNameCfg[328].name)

				arg_15_1.leftNameTxt_.text = var_18_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_18 = arg_15_1:GetWordFromCfg(116331004)
				local var_18_19 = arg_15_1:FormatText(var_18_18.content)

				arg_15_1.text_.text = var_18_19

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_20 = 8
				local var_18_21 = utf8.len(var_18_19)
				local var_18_22 = var_18_20 <= 0 and var_18_16 or var_18_16 * (var_18_21 / var_18_20)

				if var_18_22 > 0 and var_18_16 < var_18_22 then
					arg_15_1.talkMaxDuration = var_18_22

					if var_18_22 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_22 + var_18_15
					end
				end

				arg_15_1.text_.text = var_18_19
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331004", "story_v_out_116331.awb") ~= 0 then
					local var_18_23 = manager.audio:GetVoiceLength("story_v_out_116331", "116331004", "story_v_out_116331.awb") / 1000

					if var_18_23 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_23 + var_18_15
					end

					if var_18_18.prefab_name ~= "" and arg_15_1.actors_[var_18_18.prefab_name] ~= nil then
						local var_18_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_18.prefab_name].transform, "story_v_out_116331", "116331004", "story_v_out_116331.awb")

						arg_15_1:RecordAudio("116331004", var_18_24)
						arg_15_1:RecordAudio("116331004", var_18_24)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_116331", "116331004", "story_v_out_116331.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_116331", "116331004", "story_v_out_116331.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_25 = math.max(var_18_16, arg_15_1.talkMaxDuration)

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_25 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_15) / var_18_25

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_15 + var_18_25 and arg_15_1.time_ < var_18_15 + var_18_25 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play116331005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 116331005
		arg_19_1.duration_ = 8.7

		local var_19_0 = {
			zh = 5.333,
			ja = 8.7
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
				arg_19_0:Play116331006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10032ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect10032ui_story == nil then
				arg_19_1.var_.characterEffect10032ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect10032ui_story then
					local var_22_4 = Mathf.Lerp(0, 0.5, var_22_3)

					arg_19_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_19_1.var_.characterEffect10032ui_story.fillRatio = var_22_4
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect10032ui_story then
				local var_22_5 = 0.5

				arg_19_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_19_1.var_.characterEffect10032ui_story.fillRatio = var_22_5
			end

			local var_22_6 = 0
			local var_22_7 = 0.725

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[337].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(116331005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331005", "story_v_out_116331.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_116331", "116331005", "story_v_out_116331.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_116331", "116331005", "story_v_out_116331.awb")

						arg_19_1:RecordAudio("116331005", var_22_15)
						arg_19_1:RecordAudio("116331005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_116331", "116331005", "story_v_out_116331.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_116331", "116331005", "story_v_out_116331.awb")
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
	Play116331006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 116331006
		arg_23_1.duration_ = 11.6

		local var_23_0 = {
			zh = 11.6,
			ja = 7.066
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
				arg_23_0:Play116331007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.2

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[337].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(116331006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331006", "story_v_out_116331.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331006", "story_v_out_116331.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_116331", "116331006", "story_v_out_116331.awb")

						arg_23_1:RecordAudio("116331006", var_26_9)
						arg_23_1:RecordAudio("116331006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_116331", "116331006", "story_v_out_116331.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_116331", "116331006", "story_v_out_116331.awb")
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
	Play116331007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 116331007
		arg_27_1.duration_ = 7.633

		local var_27_0 = {
			zh = 7.633,
			ja = 6.7
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
				arg_27_0:Play116331008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10032ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10032ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, -1.1, -5.9)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10032ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_2")
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_30_11 = arg_27_1.actors_["10032ui_story"]
			local var_30_12 = 0

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 and arg_27_1.var_.characterEffect10032ui_story == nil then
				arg_27_1.var_.characterEffect10032ui_story = var_30_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_13 = 0.2

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_13 then
				local var_30_14 = (arg_27_1.time_ - var_30_12) / var_30_13

				if arg_27_1.var_.characterEffect10032ui_story then
					arg_27_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_12 + var_30_13 and arg_27_1.time_ < var_30_12 + var_30_13 + arg_30_0 and arg_27_1.var_.characterEffect10032ui_story then
				arg_27_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_30_15 = 0
			local var_30_16 = 0.65

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_17 = arg_27_1:FormatText(StoryNameCfg[328].name)

				arg_27_1.leftNameTxt_.text = var_30_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_18 = arg_27_1:GetWordFromCfg(116331007)
				local var_30_19 = arg_27_1:FormatText(var_30_18.content)

				arg_27_1.text_.text = var_30_19

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_20 = 26
				local var_30_21 = utf8.len(var_30_19)
				local var_30_22 = var_30_20 <= 0 and var_30_16 or var_30_16 * (var_30_21 / var_30_20)

				if var_30_22 > 0 and var_30_16 < var_30_22 then
					arg_27_1.talkMaxDuration = var_30_22

					if var_30_22 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_22 + var_30_15
					end
				end

				arg_27_1.text_.text = var_30_19
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331007", "story_v_out_116331.awb") ~= 0 then
					local var_30_23 = manager.audio:GetVoiceLength("story_v_out_116331", "116331007", "story_v_out_116331.awb") / 1000

					if var_30_23 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_23 + var_30_15
					end

					if var_30_18.prefab_name ~= "" and arg_27_1.actors_[var_30_18.prefab_name] ~= nil then
						local var_30_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_18.prefab_name].transform, "story_v_out_116331", "116331007", "story_v_out_116331.awb")

						arg_27_1:RecordAudio("116331007", var_30_24)
						arg_27_1:RecordAudio("116331007", var_30_24)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_116331", "116331007", "story_v_out_116331.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_116331", "116331007", "story_v_out_116331.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_25 = math.max(var_30_16, arg_27_1.talkMaxDuration)

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_25 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_15) / var_30_25

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_15 + var_30_25 and arg_27_1.time_ < var_30_15 + var_30_25 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play116331008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 116331008
		arg_31_1.duration_ = 8.5

		local var_31_0 = {
			zh = 8.5,
			ja = 8.1
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
				arg_31_0:Play116331009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10032ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10032ui_story == nil then
				arg_31_1.var_.characterEffect10032ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10032ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10032ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10032ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10032ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 1.025

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[337].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(116331008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 41
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331008", "story_v_out_116331.awb") ~= 0 then
					local var_34_14 = manager.audio:GetVoiceLength("story_v_out_116331", "116331008", "story_v_out_116331.awb") / 1000

					if var_34_14 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_14 + var_34_6
					end

					if var_34_9.prefab_name ~= "" and arg_31_1.actors_[var_34_9.prefab_name] ~= nil then
						local var_34_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_9.prefab_name].transform, "story_v_out_116331", "116331008", "story_v_out_116331.awb")

						arg_31_1:RecordAudio("116331008", var_34_15)
						arg_31_1:RecordAudio("116331008", var_34_15)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_116331", "116331008", "story_v_out_116331.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_116331", "116331008", "story_v_out_116331.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_16 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_16 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_16

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_16 and arg_31_1.time_ < var_34_6 + var_34_16 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play116331009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 116331009
		arg_35_1.duration_ = 3.333

		local var_35_0 = {
			zh = 3.333,
			ja = 2.866
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
				arg_35_0:Play116331010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10032ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos10032ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(0, -1.1, -5.9)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10032ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 then
				arg_35_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_1")
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_38_11 = arg_35_1.actors_["10032ui_story"]
			local var_38_12 = 0

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 and arg_35_1.var_.characterEffect10032ui_story == nil then
				arg_35_1.var_.characterEffect10032ui_story = var_38_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_13 = 0.2

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_13 then
				local var_38_14 = (arg_35_1.time_ - var_38_12) / var_38_13

				if arg_35_1.var_.characterEffect10032ui_story then
					arg_35_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_12 + var_38_13 and arg_35_1.time_ < var_38_12 + var_38_13 + arg_38_0 and arg_35_1.var_.characterEffect10032ui_story then
				arg_35_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_38_15 = 0
			local var_38_16 = 0.175

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[328].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(116331009)
				local var_38_19 = arg_35_1:FormatText(var_38_18.content)

				arg_35_1.text_.text = var_38_19

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331009", "story_v_out_116331.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_out_116331", "116331009", "story_v_out_116331.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_out_116331", "116331009", "story_v_out_116331.awb")

						arg_35_1:RecordAudio("116331009", var_38_24)
						arg_35_1:RecordAudio("116331009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_116331", "116331009", "story_v_out_116331.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_116331", "116331009", "story_v_out_116331.awb")
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
	Play116331010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 116331010
		arg_39_1.duration_ = 14.533

		local var_39_0 = {
			zh = 6.3,
			ja = 14.533
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
				arg_39_0:Play116331011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10032ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10032ui_story == nil then
				arg_39_1.var_.characterEffect10032ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10032ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect10032ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10032ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10032ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect10032ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10032ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.725

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[337].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(116331010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331010", "story_v_out_116331.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_116331", "116331010", "story_v_out_116331.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_116331", "116331010", "story_v_out_116331.awb")

						arg_39_1:RecordAudio("116331010", var_42_15)
						arg_39_1:RecordAudio("116331010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_116331", "116331010", "story_v_out_116331.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_116331", "116331010", "story_v_out_116331.awb")
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
	Play116331011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 116331011
		arg_43_1.duration_ = 8.366

		local var_43_0 = {
			zh = 6.566,
			ja = 8.366
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
				arg_43_0:Play116331012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.775

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[337].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(116331011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331011", "story_v_out_116331.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331011", "story_v_out_116331.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_116331", "116331011", "story_v_out_116331.awb")

						arg_43_1:RecordAudio("116331011", var_46_9)
						arg_43_1:RecordAudio("116331011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_116331", "116331011", "story_v_out_116331.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_116331", "116331011", "story_v_out_116331.awb")
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
	Play116331012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 116331012
		arg_47_1.duration_ = 9.7

		local var_47_0 = {
			zh = 9.7,
			ja = 8.266
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
				arg_47_0:Play116331013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "I07"

			if arg_47_1.bgs_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(arg_47_1.paintGo_)

				var_50_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_50_0)
				var_50_1.name = var_50_0
				var_50_1.transform.parent = arg_47_1.stage_.transform
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.bgs_[var_50_0] = var_50_1
			end

			local var_50_2 = 2

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				local var_50_3 = manager.ui.mainCamera.transform.localPosition
				local var_50_4 = Vector3.New(0, 0, 10) + Vector3.New(var_50_3.x, var_50_3.y, 0)
				local var_50_5 = arg_47_1.bgs_.I07

				var_50_5.transform.localPosition = var_50_4
				var_50_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_6 = var_50_5:GetComponent("SpriteRenderer")

				if var_50_6 and var_50_6.sprite then
					local var_50_7 = (var_50_5.transform.localPosition - var_50_3).z
					local var_50_8 = manager.ui.mainCameraCom_
					local var_50_9 = 2 * var_50_7 * Mathf.Tan(var_50_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_10 = var_50_9 * var_50_8.aspect
					local var_50_11 = var_50_6.sprite.bounds.size.x
					local var_50_12 = var_50_6.sprite.bounds.size.y
					local var_50_13 = var_50_10 / var_50_11
					local var_50_14 = var_50_9 / var_50_12
					local var_50_15 = var_50_14 < var_50_13 and var_50_13 or var_50_14

					var_50_5.transform.localScale = Vector3.New(var_50_15, var_50_15, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "I07" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_17 = 2

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Color.New(0, 0, 0)

				var_50_19.a = Mathf.Lerp(0, 1, var_50_18)
				arg_47_1.mask_.color = var_50_19
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				local var_50_20 = Color.New(0, 0, 0)

				var_50_20.a = 1
				arg_47_1.mask_.color = var_50_20
			end

			local var_50_21 = 2

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_22 = 2

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_22 then
				local var_50_23 = (arg_47_1.time_ - var_50_21) / var_50_22
				local var_50_24 = Color.New(0, 0, 0)

				var_50_24.a = Mathf.Lerp(1, 0, var_50_23)
				arg_47_1.mask_.color = var_50_24
			end

			if arg_47_1.time_ >= var_50_21 + var_50_22 and arg_47_1.time_ < var_50_21 + var_50_22 + arg_50_0 then
				local var_50_25 = Color.New(0, 0, 0)
				local var_50_26 = 0

				arg_47_1.mask_.enabled = false
				var_50_25.a = var_50_26
				arg_47_1.mask_.color = var_50_25
			end

			local var_50_27 = arg_47_1.actors_["10032ui_story"].transform
			local var_50_28 = 2

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1.var_.moveOldPos10032ui_story = var_50_27.localPosition
			end

			local var_50_29 = 0.001

			if var_50_28 <= arg_47_1.time_ and arg_47_1.time_ < var_50_28 + var_50_29 then
				local var_50_30 = (arg_47_1.time_ - var_50_28) / var_50_29
				local var_50_31 = Vector3.New(0, 100, 0)

				var_50_27.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10032ui_story, var_50_31, var_50_30)

				local var_50_32 = manager.ui.mainCamera.transform.position - var_50_27.position

				var_50_27.forward = Vector3.New(var_50_32.x, var_50_32.y, var_50_32.z)

				local var_50_33 = var_50_27.localEulerAngles

				var_50_33.z = 0
				var_50_33.x = 0
				var_50_27.localEulerAngles = var_50_33
			end

			if arg_47_1.time_ >= var_50_28 + var_50_29 and arg_47_1.time_ < var_50_28 + var_50_29 + arg_50_0 then
				var_50_27.localPosition = Vector3.New(0, 100, 0)

				local var_50_34 = manager.ui.mainCamera.transform.position - var_50_27.position

				var_50_27.forward = Vector3.New(var_50_34.x, var_50_34.y, var_50_34.z)

				local var_50_35 = var_50_27.localEulerAngles

				var_50_35.z = 0
				var_50_35.x = 0
				var_50_27.localEulerAngles = var_50_35
			end

			local var_50_36 = 2
			local var_50_37 = 1

			if var_50_36 < arg_47_1.time_ and arg_47_1.time_ <= var_50_36 + arg_50_0 then
				local var_50_38 = "play"
				local var_50_39 = "music"

				arg_47_1:AudioAction(var_50_38, var_50_39, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_40 = 4
			local var_50_41 = 0.25

			if var_50_40 < arg_47_1.time_ and arg_47_1.time_ <= var_50_40 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_42 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_42:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_43 = arg_47_1:FormatText(StoryNameCfg[332].name)

				arg_47_1.leftNameTxt_.text = var_50_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_44 = arg_47_1:GetWordFromCfg(116331012)
				local var_50_45 = arg_47_1:FormatText(var_50_44.content)

				arg_47_1.text_.text = var_50_45

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_46 = 10
				local var_50_47 = utf8.len(var_50_45)
				local var_50_48 = var_50_46 <= 0 and var_50_41 or var_50_41 * (var_50_47 / var_50_46)

				if var_50_48 > 0 and var_50_41 < var_50_48 then
					arg_47_1.talkMaxDuration = var_50_48
					var_50_40 = var_50_40 + 0.3

					if var_50_48 + var_50_40 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_48 + var_50_40
					end
				end

				arg_47_1.text_.text = var_50_45
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331012", "story_v_out_116331.awb") ~= 0 then
					local var_50_49 = manager.audio:GetVoiceLength("story_v_out_116331", "116331012", "story_v_out_116331.awb") / 1000

					if var_50_49 + var_50_40 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_49 + var_50_40
					end

					if var_50_44.prefab_name ~= "" and arg_47_1.actors_[var_50_44.prefab_name] ~= nil then
						local var_50_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_44.prefab_name].transform, "story_v_out_116331", "116331012", "story_v_out_116331.awb")

						arg_47_1:RecordAudio("116331012", var_50_50)
						arg_47_1:RecordAudio("116331012", var_50_50)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_116331", "116331012", "story_v_out_116331.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_116331", "116331012", "story_v_out_116331.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_51 = var_50_40 + 0.3
			local var_50_52 = math.max(var_50_41, arg_47_1.talkMaxDuration)

			if var_50_51 <= arg_47_1.time_ and arg_47_1.time_ < var_50_51 + var_50_52 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_51) / var_50_52

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_51 + var_50_52 and arg_47_1.time_ < var_50_51 + var_50_52 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play116331013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 116331013
		arg_53_1.duration_ = 5.133

		local var_53_0 = {
			zh = 4.6,
			ja = 5.133
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
				arg_53_0:Play116331014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.575

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[338].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, true)
				arg_53_1.iconController_:SetSelectedState("hero")

				arg_53_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(116331013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 23
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331013", "story_v_out_116331.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331013", "story_v_out_116331.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_116331", "116331013", "story_v_out_116331.awb")

						arg_53_1:RecordAudio("116331013", var_56_9)
						arg_53_1:RecordAudio("116331013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_116331", "116331013", "story_v_out_116331.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_116331", "116331013", "story_v_out_116331.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play116331014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 116331014
		arg_57_1.duration_ = 6.766

		local var_57_0 = {
			zh = 6.766,
			ja = 6.4
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
				arg_57_0:Play116331015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.75

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[338].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, true)
				arg_57_1.iconController_:SetSelectedState("hero")

				arg_57_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(116331014)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331014", "story_v_out_116331.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331014", "story_v_out_116331.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_116331", "116331014", "story_v_out_116331.awb")

						arg_57_1:RecordAudio("116331014", var_60_9)
						arg_57_1:RecordAudio("116331014", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_116331", "116331014", "story_v_out_116331.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_116331", "116331014", "story_v_out_116331.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_10 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_10 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_10

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_10 and arg_57_1.time_ < var_60_0 + var_60_10 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play116331015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 116331015
		arg_61_1.duration_ = 3.4

		local var_61_0 = {
			zh = 2.566,
			ja = 3.4
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
				arg_61_0:Play116331016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.325

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[332].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(116331015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 13
				local var_64_6 = utf8.len(var_64_4)
				local var_64_7 = var_64_5 <= 0 and var_64_1 or var_64_1 * (var_64_6 / var_64_5)

				if var_64_7 > 0 and var_64_1 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_4
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331015", "story_v_out_116331.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331015", "story_v_out_116331.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_116331", "116331015", "story_v_out_116331.awb")

						arg_61_1:RecordAudio("116331015", var_64_9)
						arg_61_1:RecordAudio("116331015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_116331", "116331015", "story_v_out_116331.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_116331", "116331015", "story_v_out_116331.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_10 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_10 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_10

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_10 and arg_61_1.time_ < var_64_0 + var_64_10 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play116331016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 116331016
		arg_65_1.duration_ = 8.8

		local var_65_0 = {
			zh = 8.733,
			ja = 8.8
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
				arg_65_0:Play116331017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 1.2

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[339].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(116331016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 48
				local var_68_6 = utf8.len(var_68_4)
				local var_68_7 = var_68_5 <= 0 and var_68_1 or var_68_1 * (var_68_6 / var_68_5)

				if var_68_7 > 0 and var_68_1 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_4
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331016", "story_v_out_116331.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331016", "story_v_out_116331.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_116331", "116331016", "story_v_out_116331.awb")

						arg_65_1:RecordAudio("116331016", var_68_9)
						arg_65_1:RecordAudio("116331016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_116331", "116331016", "story_v_out_116331.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_116331", "116331016", "story_v_out_116331.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_10 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_10 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_10

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_10 and arg_65_1.time_ < var_68_0 + var_68_10 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play116331017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 116331017
		arg_69_1.duration_ = 7.033

		local var_69_0 = {
			zh = 7.033,
			ja = 6.9
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
				arg_69_0:Play116331018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.8

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[339].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(116331017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 32
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331017", "story_v_out_116331.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331017", "story_v_out_116331.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_116331", "116331017", "story_v_out_116331.awb")

						arg_69_1:RecordAudio("116331017", var_72_9)
						arg_69_1:RecordAudio("116331017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_116331", "116331017", "story_v_out_116331.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_116331", "116331017", "story_v_out_116331.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play116331018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 116331018
		arg_73_1.duration_ = 5.033

		local var_73_0 = {
			zh = 3.9,
			ja = 5.033
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
				arg_73_0:Play116331019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.25

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[338].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(116331018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331018", "story_v_out_116331.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331018", "story_v_out_116331.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_116331", "116331018", "story_v_out_116331.awb")

						arg_73_1:RecordAudio("116331018", var_76_9)
						arg_73_1:RecordAudio("116331018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_116331", "116331018", "story_v_out_116331.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_116331", "116331018", "story_v_out_116331.awb")
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
	Play116331019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 116331019
		arg_77_1.duration_ = 6.8

		local var_77_0 = {
			zh = 6.8,
			ja = 6.233
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
				arg_77_0:Play116331020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.8

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[338].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(116331019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 32
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331019", "story_v_out_116331.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331019", "story_v_out_116331.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_116331", "116331019", "story_v_out_116331.awb")

						arg_77_1:RecordAudio("116331019", var_80_9)
						arg_77_1:RecordAudio("116331019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_116331", "116331019", "story_v_out_116331.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_116331", "116331019", "story_v_out_116331.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_10 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_10 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_10

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_10 and arg_77_1.time_ < var_80_0 + var_80_10 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play116331020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 116331020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play116331021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				local var_84_2 = "play"
				local var_84_3 = "effect"

				arg_81_1:AudioAction(var_84_2, var_84_3, "se_story_16", "se_story_16_thunder", "")
			end

			local var_84_4 = 0
			local var_84_5 = 0.175

			if var_84_4 < arg_81_1.time_ and arg_81_1.time_ <= var_84_4 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_6 = arg_81_1:GetWordFromCfg(116331020)
				local var_84_7 = arg_81_1:FormatText(var_84_6.content)

				arg_81_1.text_.text = var_84_7

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_8 = 7
				local var_84_9 = utf8.len(var_84_7)
				local var_84_10 = var_84_8 <= 0 and var_84_5 or var_84_5 * (var_84_9 / var_84_8)

				if var_84_10 > 0 and var_84_5 < var_84_10 then
					arg_81_1.talkMaxDuration = var_84_10

					if var_84_10 + var_84_4 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_10 + var_84_4
					end
				end

				arg_81_1.text_.text = var_84_7
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_11 = math.max(var_84_5, arg_81_1.talkMaxDuration)

			if var_84_4 <= arg_81_1.time_ and arg_81_1.time_ < var_84_4 + var_84_11 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_4) / var_84_11

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_4 + var_84_11 and arg_81_1.time_ < var_84_4 + var_84_11 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play116331021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 116331021
		arg_85_1.duration_ = 9.5

		local var_85_0 = {
			zh = 9.5,
			ja = 7.4
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
				arg_85_0:Play116331022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 2

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				local var_88_1 = manager.ui.mainCamera.transform.localPosition
				local var_88_2 = Vector3.New(0, 0, 10) + Vector3.New(var_88_1.x, var_88_1.y, 0)
				local var_88_3 = arg_85_1.bgs_.I07

				var_88_3.transform.localPosition = var_88_2
				var_88_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_88_4 = var_88_3:GetComponent("SpriteRenderer")

				if var_88_4 and var_88_4.sprite then
					local var_88_5 = (var_88_3.transform.localPosition - var_88_1).z
					local var_88_6 = manager.ui.mainCameraCom_
					local var_88_7 = 2 * var_88_5 * Mathf.Tan(var_88_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_88_8 = var_88_7 * var_88_6.aspect
					local var_88_9 = var_88_4.sprite.bounds.size.x
					local var_88_10 = var_88_4.sprite.bounds.size.y
					local var_88_11 = var_88_8 / var_88_9
					local var_88_12 = var_88_7 / var_88_10
					local var_88_13 = var_88_12 < var_88_11 and var_88_11 or var_88_12

					var_88_3.transform.localScale = Vector3.New(var_88_13, var_88_13, 0)
				end

				for iter_88_0, iter_88_1 in pairs(arg_85_1.bgs_) do
					if iter_88_0 ~= "I07" then
						iter_88_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_15 = 2

			if var_88_14 <= arg_85_1.time_ and arg_85_1.time_ < var_88_14 + var_88_15 then
				local var_88_16 = (arg_85_1.time_ - var_88_14) / var_88_15
				local var_88_17 = Color.New(0, 0, 0)

				var_88_17.a = Mathf.Lerp(0, 1, var_88_16)
				arg_85_1.mask_.color = var_88_17
			end

			if arg_85_1.time_ >= var_88_14 + var_88_15 and arg_85_1.time_ < var_88_14 + var_88_15 + arg_88_0 then
				local var_88_18 = Color.New(0, 0, 0)

				var_88_18.a = 1
				arg_85_1.mask_.color = var_88_18
			end

			local var_88_19 = 2

			if var_88_19 < arg_85_1.time_ and arg_85_1.time_ <= var_88_19 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_20 = 2

			if var_88_19 <= arg_85_1.time_ and arg_85_1.time_ < var_88_19 + var_88_20 then
				local var_88_21 = (arg_85_1.time_ - var_88_19) / var_88_20
				local var_88_22 = Color.New(0, 0, 0)

				var_88_22.a = Mathf.Lerp(1, 0, var_88_21)
				arg_85_1.mask_.color = var_88_22
			end

			if arg_85_1.time_ >= var_88_19 + var_88_20 and arg_85_1.time_ < var_88_19 + var_88_20 + arg_88_0 then
				local var_88_23 = Color.New(0, 0, 0)
				local var_88_24 = 0

				arg_85_1.mask_.enabled = false
				var_88_23.a = var_88_24
				arg_85_1.mask_.color = var_88_23
			end

			local var_88_25 = 2

			if var_88_25 < arg_85_1.time_ and arg_85_1.time_ <= var_88_25 + arg_88_0 then
				arg_85_1.screenFilterGo_:SetActive(true)

				arg_85_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_88_26 = 0.0166666666666667

			if var_88_25 <= arg_85_1.time_ and arg_85_1.time_ < var_88_25 + var_88_26 then
				local var_88_27 = (arg_85_1.time_ - var_88_25) / var_88_26

				arg_85_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_88_27)
			end

			if arg_85_1.time_ >= var_88_25 + var_88_26 and arg_85_1.time_ < var_88_25 + var_88_26 + arg_88_0 then
				arg_85_1.screenFilterEffect_.weight = 1
			end

			local var_88_28 = "10014ui_story"

			if arg_85_1.actors_[var_88_28] == nil then
				local var_88_29 = Object.Instantiate(Asset.Load("Char/" .. var_88_28), arg_85_1.stage_.transform)

				var_88_29.name = var_88_28
				var_88_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_85_1.actors_[var_88_28] = var_88_29

				local var_88_30 = var_88_29:GetComponentInChildren(typeof(CharacterEffect))

				var_88_30.enabled = true

				local var_88_31 = GameObjectTools.GetOrAddComponent(var_88_29, typeof(DynamicBoneHelper))

				if var_88_31 then
					var_88_31:EnableDynamicBone(false)
				end

				arg_85_1:ShowWeapon(var_88_30.transform, false)

				arg_85_1.var_[var_88_28 .. "Animator"] = var_88_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_85_1.var_[var_88_28 .. "Animator"].applyRootMotion = true
				arg_85_1.var_[var_88_28 .. "LipSync"] = var_88_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_88_32 = arg_85_1.actors_["10014ui_story"].transform
			local var_88_33 = 4

			if var_88_33 < arg_85_1.time_ and arg_85_1.time_ <= var_88_33 + arg_88_0 then
				arg_85_1.var_.moveOldPos10014ui_story = var_88_32.localPosition
			end

			local var_88_34 = 0.001

			if var_88_33 <= arg_85_1.time_ and arg_85_1.time_ < var_88_33 + var_88_34 then
				local var_88_35 = (arg_85_1.time_ - var_88_33) / var_88_34
				local var_88_36 = Vector3.New(0, -1.06, -6.2)

				var_88_32.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10014ui_story, var_88_36, var_88_35)

				local var_88_37 = manager.ui.mainCamera.transform.position - var_88_32.position

				var_88_32.forward = Vector3.New(var_88_37.x, var_88_37.y, var_88_37.z)

				local var_88_38 = var_88_32.localEulerAngles

				var_88_38.z = 0
				var_88_38.x = 0
				var_88_32.localEulerAngles = var_88_38
			end

			if arg_85_1.time_ >= var_88_33 + var_88_34 and arg_85_1.time_ < var_88_33 + var_88_34 + arg_88_0 then
				var_88_32.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_88_39 = manager.ui.mainCamera.transform.position - var_88_32.position

				var_88_32.forward = Vector3.New(var_88_39.x, var_88_39.y, var_88_39.z)

				local var_88_40 = var_88_32.localEulerAngles

				var_88_40.z = 0
				var_88_40.x = 0
				var_88_32.localEulerAngles = var_88_40
			end

			local var_88_41 = arg_85_1.actors_["10014ui_story"]
			local var_88_42 = 4

			if var_88_42 < arg_85_1.time_ and arg_85_1.time_ <= var_88_42 + arg_88_0 and arg_85_1.var_.characterEffect10014ui_story == nil then
				arg_85_1.var_.characterEffect10014ui_story = var_88_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_43 = 0.2

			if var_88_42 <= arg_85_1.time_ and arg_85_1.time_ < var_88_42 + var_88_43 then
				local var_88_44 = (arg_85_1.time_ - var_88_42) / var_88_43

				if arg_85_1.var_.characterEffect10014ui_story then
					arg_85_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_42 + var_88_43 and arg_85_1.time_ < var_88_42 + var_88_43 + arg_88_0 and arg_85_1.var_.characterEffect10014ui_story then
				arg_85_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_88_45 = 4

			if var_88_45 < arg_85_1.time_ and arg_85_1.time_ <= var_88_45 + arg_88_0 then
				arg_85_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_88_46 = 4

			if var_88_46 < arg_85_1.time_ and arg_85_1.time_ <= var_88_46 + arg_88_0 then
				arg_85_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			if arg_85_1.frameCnt_ <= 1 then
				arg_85_1.dialog_:SetActive(false)
			end

			local var_88_47 = 4
			local var_88_48 = 0.575

			if var_88_47 < arg_85_1.time_ and arg_85_1.time_ <= var_88_47 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				arg_85_1.dialog_:SetActive(true)

				local var_88_49 = LeanTween.value(arg_85_1.dialog_, 0, 1, 0.3)

				var_88_49:setOnUpdate(LuaHelper.FloatAction(function(arg_89_0)
					arg_85_1.dialogCg_.alpha = arg_89_0
				end))
				var_88_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_85_1.dialog_)
					var_88_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_85_1.duration_ = arg_85_1.duration_ + 0.3

				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_50 = arg_85_1:FormatText(StoryNameCfg[264].name)

				arg_85_1.leftNameTxt_.text = var_88_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_51 = arg_85_1:GetWordFromCfg(116331021)
				local var_88_52 = arg_85_1:FormatText(var_88_51.content)

				arg_85_1.text_.text = var_88_52

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_53 = 23
				local var_88_54 = utf8.len(var_88_52)
				local var_88_55 = var_88_53 <= 0 and var_88_48 or var_88_48 * (var_88_54 / var_88_53)

				if var_88_55 > 0 and var_88_48 < var_88_55 then
					arg_85_1.talkMaxDuration = var_88_55
					var_88_47 = var_88_47 + 0.3

					if var_88_55 + var_88_47 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_55 + var_88_47
					end
				end

				arg_85_1.text_.text = var_88_52
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331021", "story_v_out_116331.awb") ~= 0 then
					local var_88_56 = manager.audio:GetVoiceLength("story_v_out_116331", "116331021", "story_v_out_116331.awb") / 1000

					if var_88_56 + var_88_47 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_56 + var_88_47
					end

					if var_88_51.prefab_name ~= "" and arg_85_1.actors_[var_88_51.prefab_name] ~= nil then
						local var_88_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_51.prefab_name].transform, "story_v_out_116331", "116331021", "story_v_out_116331.awb")

						arg_85_1:RecordAudio("116331021", var_88_57)
						arg_85_1:RecordAudio("116331021", var_88_57)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_116331", "116331021", "story_v_out_116331.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_116331", "116331021", "story_v_out_116331.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_58 = var_88_47 + 0.3
			local var_88_59 = math.max(var_88_48, arg_85_1.talkMaxDuration)

			if var_88_58 <= arg_85_1.time_ and arg_85_1.time_ < var_88_58 + var_88_59 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_58) / var_88_59

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_58 + var_88_59 and arg_85_1.time_ < var_88_58 + var_88_59 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play116331022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116331022
		arg_91_1.duration_ = 11.333

		local var_91_0 = {
			zh = 7.733,
			ja = 11.333
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
				arg_91_0:Play116331023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_94_1 = 0
			local var_94_2 = 0.95

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_3 = arg_91_1:FormatText(StoryNameCfg[264].name)

				arg_91_1.leftNameTxt_.text = var_94_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_4 = arg_91_1:GetWordFromCfg(116331022)
				local var_94_5 = arg_91_1:FormatText(var_94_4.content)

				arg_91_1.text_.text = var_94_5

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_6 = 38
				local var_94_7 = utf8.len(var_94_5)
				local var_94_8 = var_94_6 <= 0 and var_94_2 or var_94_2 * (var_94_7 / var_94_6)

				if var_94_8 > 0 and var_94_2 < var_94_8 then
					arg_91_1.talkMaxDuration = var_94_8

					if var_94_8 + var_94_1 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_1
					end
				end

				arg_91_1.text_.text = var_94_5
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331022", "story_v_out_116331.awb") ~= 0 then
					local var_94_9 = manager.audio:GetVoiceLength("story_v_out_116331", "116331022", "story_v_out_116331.awb") / 1000

					if var_94_9 + var_94_1 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_9 + var_94_1
					end

					if var_94_4.prefab_name ~= "" and arg_91_1.actors_[var_94_4.prefab_name] ~= nil then
						local var_94_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_4.prefab_name].transform, "story_v_out_116331", "116331022", "story_v_out_116331.awb")

						arg_91_1:RecordAudio("116331022", var_94_10)
						arg_91_1:RecordAudio("116331022", var_94_10)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_116331", "116331022", "story_v_out_116331.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_116331", "116331022", "story_v_out_116331.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_11 = math.max(var_94_2, arg_91_1.talkMaxDuration)

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_11 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_1) / var_94_11

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_1 + var_94_11 and arg_91_1.time_ < var_94_1 + var_94_11 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play116331023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116331023
		arg_95_1.duration_ = 10.766

		local var_95_0 = {
			zh = 10.4,
			ja = 10.766
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
				arg_95_0:Play116331024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 2

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				local var_98_1 = manager.ui.mainCamera.transform.localPosition
				local var_98_2 = Vector3.New(0, 0, 10) + Vector3.New(var_98_1.x, var_98_1.y, 0)
				local var_98_3 = arg_95_1.bgs_.I07a

				var_98_3.transform.localPosition = var_98_2
				var_98_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_98_4 = var_98_3:GetComponent("SpriteRenderer")

				if var_98_4 and var_98_4.sprite then
					local var_98_5 = (var_98_3.transform.localPosition - var_98_1).z
					local var_98_6 = manager.ui.mainCameraCom_
					local var_98_7 = 2 * var_98_5 * Mathf.Tan(var_98_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_98_8 = var_98_7 * var_98_6.aspect
					local var_98_9 = var_98_4.sprite.bounds.size.x
					local var_98_10 = var_98_4.sprite.bounds.size.y
					local var_98_11 = var_98_8 / var_98_9
					local var_98_12 = var_98_7 / var_98_10
					local var_98_13 = var_98_12 < var_98_11 and var_98_11 or var_98_12

					var_98_3.transform.localScale = Vector3.New(var_98_13, var_98_13, 0)
				end

				for iter_98_0, iter_98_1 in pairs(arg_95_1.bgs_) do
					if iter_98_0 ~= "I07a" then
						iter_98_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1.mask_.enabled = true
				arg_95_1.mask_.raycastTarget = true

				arg_95_1:SetGaussion(false)
			end

			local var_98_15 = 2

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_15 then
				local var_98_16 = (arg_95_1.time_ - var_98_14) / var_98_15
				local var_98_17 = Color.New(0, 0, 0)

				var_98_17.a = Mathf.Lerp(0, 1, var_98_16)
				arg_95_1.mask_.color = var_98_17
			end

			if arg_95_1.time_ >= var_98_14 + var_98_15 and arg_95_1.time_ < var_98_14 + var_98_15 + arg_98_0 then
				local var_98_18 = Color.New(0, 0, 0)

				var_98_18.a = 1
				arg_95_1.mask_.color = var_98_18
			end

			local var_98_19 = 2

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				arg_95_1.mask_.enabled = true
				arg_95_1.mask_.raycastTarget = true

				arg_95_1:SetGaussion(false)
			end

			local var_98_20 = 2

			if var_98_19 <= arg_95_1.time_ and arg_95_1.time_ < var_98_19 + var_98_20 then
				local var_98_21 = (arg_95_1.time_ - var_98_19) / var_98_20
				local var_98_22 = Color.New(0, 0, 0)

				var_98_22.a = Mathf.Lerp(1, 0, var_98_21)
				arg_95_1.mask_.color = var_98_22
			end

			if arg_95_1.time_ >= var_98_19 + var_98_20 and arg_95_1.time_ < var_98_19 + var_98_20 + arg_98_0 then
				local var_98_23 = Color.New(0, 0, 0)
				local var_98_24 = 0

				arg_95_1.mask_.enabled = false
				var_98_23.a = var_98_24
				arg_95_1.mask_.color = var_98_23
			end

			local var_98_25 = arg_95_1.actors_["10014ui_story"].transform
			local var_98_26 = 2

			if var_98_26 < arg_95_1.time_ and arg_95_1.time_ <= var_98_26 + arg_98_0 then
				arg_95_1.var_.moveOldPos10014ui_story = var_98_25.localPosition
			end

			local var_98_27 = 0.001

			if var_98_26 <= arg_95_1.time_ and arg_95_1.time_ < var_98_26 + var_98_27 then
				local var_98_28 = (arg_95_1.time_ - var_98_26) / var_98_27
				local var_98_29 = Vector3.New(0, 100, 0)

				var_98_25.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10014ui_story, var_98_29, var_98_28)

				local var_98_30 = manager.ui.mainCamera.transform.position - var_98_25.position

				var_98_25.forward = Vector3.New(var_98_30.x, var_98_30.y, var_98_30.z)

				local var_98_31 = var_98_25.localEulerAngles

				var_98_31.z = 0
				var_98_31.x = 0
				var_98_25.localEulerAngles = var_98_31
			end

			if arg_95_1.time_ >= var_98_26 + var_98_27 and arg_95_1.time_ < var_98_26 + var_98_27 + arg_98_0 then
				var_98_25.localPosition = Vector3.New(0, 100, 0)

				local var_98_32 = manager.ui.mainCamera.transform.position - var_98_25.position

				var_98_25.forward = Vector3.New(var_98_32.x, var_98_32.y, var_98_32.z)

				local var_98_33 = var_98_25.localEulerAngles

				var_98_33.z = 0
				var_98_33.x = 0
				var_98_25.localEulerAngles = var_98_33
			end

			if arg_95_1.frameCnt_ <= 1 then
				arg_95_1.dialog_:SetActive(false)
			end

			local var_98_34 = 4
			local var_98_35 = 0.85

			if var_98_34 < arg_95_1.time_ and arg_95_1.time_ <= var_98_34 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0

				arg_95_1.dialog_:SetActive(true)

				local var_98_36 = LeanTween.value(arg_95_1.dialog_, 0, 1, 0.3)

				var_98_36:setOnUpdate(LuaHelper.FloatAction(function(arg_99_0)
					arg_95_1.dialogCg_.alpha = arg_99_0
				end))
				var_98_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_95_1.dialog_)
					var_98_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_95_1.duration_ = arg_95_1.duration_ + 0.3

				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_37 = arg_95_1:FormatText(StoryNameCfg[337].name)

				arg_95_1.leftNameTxt_.text = var_98_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_38 = arg_95_1:GetWordFromCfg(116331023)
				local var_98_39 = arg_95_1:FormatText(var_98_38.content)

				arg_95_1.text_.text = var_98_39

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_40 = 34
				local var_98_41 = utf8.len(var_98_39)
				local var_98_42 = var_98_40 <= 0 and var_98_35 or var_98_35 * (var_98_41 / var_98_40)

				if var_98_42 > 0 and var_98_35 < var_98_42 then
					arg_95_1.talkMaxDuration = var_98_42
					var_98_34 = var_98_34 + 0.3

					if var_98_42 + var_98_34 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_42 + var_98_34
					end
				end

				arg_95_1.text_.text = var_98_39
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331023", "story_v_out_116331.awb") ~= 0 then
					local var_98_43 = manager.audio:GetVoiceLength("story_v_out_116331", "116331023", "story_v_out_116331.awb") / 1000

					if var_98_43 + var_98_34 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_43 + var_98_34
					end

					if var_98_38.prefab_name ~= "" and arg_95_1.actors_[var_98_38.prefab_name] ~= nil then
						local var_98_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_38.prefab_name].transform, "story_v_out_116331", "116331023", "story_v_out_116331.awb")

						arg_95_1:RecordAudio("116331023", var_98_44)
						arg_95_1:RecordAudio("116331023", var_98_44)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_116331", "116331023", "story_v_out_116331.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_116331", "116331023", "story_v_out_116331.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_45 = var_98_34 + 0.3
			local var_98_46 = math.max(var_98_35, arg_95_1.talkMaxDuration)

			if var_98_45 <= arg_95_1.time_ and arg_95_1.time_ < var_98_45 + var_98_46 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_45) / var_98_46

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_45 + var_98_46 and arg_95_1.time_ < var_98_45 + var_98_46 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play116331024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 116331024
		arg_101_1.duration_ = 5.966

		local var_101_0 = {
			zh = 3.666,
			ja = 5.966
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
				arg_101_0:Play116331025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.475

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[337].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(116331024)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 19
				local var_104_6 = utf8.len(var_104_4)
				local var_104_7 = var_104_5 <= 0 and var_104_1 or var_104_1 * (var_104_6 / var_104_5)

				if var_104_7 > 0 and var_104_1 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_4
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331024", "story_v_out_116331.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331024", "story_v_out_116331.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_116331", "116331024", "story_v_out_116331.awb")

						arg_101_1:RecordAudio("116331024", var_104_9)
						arg_101_1:RecordAudio("116331024", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_116331", "116331024", "story_v_out_116331.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_116331", "116331024", "story_v_out_116331.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_10 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_10 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_10

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_10 and arg_101_1.time_ < var_104_0 + var_104_10 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play116331025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 116331025
		arg_105_1.duration_ = 9

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play116331026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 2

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				local var_108_1 = manager.ui.mainCamera.transform.localPosition
				local var_108_2 = Vector3.New(0, 0, 10) + Vector3.New(var_108_1.x, var_108_1.y, 0)
				local var_108_3 = arg_105_1.bgs_.I07a

				var_108_3.transform.localPosition = var_108_2
				var_108_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_108_4 = var_108_3:GetComponent("SpriteRenderer")

				if var_108_4 and var_108_4.sprite then
					local var_108_5 = (var_108_3.transform.localPosition - var_108_1).z
					local var_108_6 = manager.ui.mainCameraCom_
					local var_108_7 = 2 * var_108_5 * Mathf.Tan(var_108_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_108_8 = var_108_7 * var_108_6.aspect
					local var_108_9 = var_108_4.sprite.bounds.size.x
					local var_108_10 = var_108_4.sprite.bounds.size.y
					local var_108_11 = var_108_8 / var_108_9
					local var_108_12 = var_108_7 / var_108_10
					local var_108_13 = var_108_12 < var_108_11 and var_108_11 or var_108_12

					var_108_3.transform.localScale = Vector3.New(var_108_13, var_108_13, 0)
				end

				for iter_108_0, iter_108_1 in pairs(arg_105_1.bgs_) do
					if iter_108_0 ~= "I07a" then
						iter_108_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_15 = 2

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_15 then
				local var_108_16 = (arg_105_1.time_ - var_108_14) / var_108_15
				local var_108_17 = Color.New(0, 0, 0)

				var_108_17.a = Mathf.Lerp(0, 1, var_108_16)
				arg_105_1.mask_.color = var_108_17
			end

			if arg_105_1.time_ >= var_108_14 + var_108_15 and arg_105_1.time_ < var_108_14 + var_108_15 + arg_108_0 then
				local var_108_18 = Color.New(0, 0, 0)

				var_108_18.a = 1
				arg_105_1.mask_.color = var_108_18
			end

			local var_108_19 = 2

			if var_108_19 < arg_105_1.time_ and arg_105_1.time_ <= var_108_19 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_20 = 2

			if var_108_19 <= arg_105_1.time_ and arg_105_1.time_ < var_108_19 + var_108_20 then
				local var_108_21 = (arg_105_1.time_ - var_108_19) / var_108_20
				local var_108_22 = Color.New(0, 0, 0)

				var_108_22.a = Mathf.Lerp(1, 0, var_108_21)
				arg_105_1.mask_.color = var_108_22
			end

			if arg_105_1.time_ >= var_108_19 + var_108_20 and arg_105_1.time_ < var_108_19 + var_108_20 + arg_108_0 then
				local var_108_23 = Color.New(0, 0, 0)
				local var_108_24 = 0

				arg_105_1.mask_.enabled = false
				var_108_23.a = var_108_24
				arg_105_1.mask_.color = var_108_23
			end

			local var_108_25 = 0
			local var_108_26 = 0.266666666666667

			if var_108_25 < arg_105_1.time_ and arg_105_1.time_ <= var_108_25 + arg_108_0 then
				local var_108_27 = "play"
				local var_108_28 = "music"

				arg_105_1:AudioAction(var_108_27, var_108_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_108_29 = 2

			if var_108_29 < arg_105_1.time_ and arg_105_1.time_ <= var_108_29 + arg_108_0 then
				arg_105_1.screenFilterGo_:SetActive(false)
			end

			local var_108_30 = 0.0166666666666667

			if var_108_29 <= arg_105_1.time_ and arg_105_1.time_ < var_108_29 + var_108_30 then
				local var_108_31 = (arg_105_1.time_ - var_108_29) / var_108_30

				arg_105_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_108_31)
			end

			if arg_105_1.time_ >= var_108_29 + var_108_30 and arg_105_1.time_ < var_108_29 + var_108_30 + arg_108_0 then
				arg_105_1.screenFilterEffect_.weight = 0
			end

			if arg_105_1.frameCnt_ <= 1 then
				arg_105_1.dialog_:SetActive(false)
			end

			local var_108_32 = 4
			local var_108_33 = 0.925

			if var_108_32 < arg_105_1.time_ and arg_105_1.time_ <= var_108_32 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0

				arg_105_1.dialog_:SetActive(true)

				local var_108_34 = LeanTween.value(arg_105_1.dialog_, 0, 1, 0.3)

				var_108_34:setOnUpdate(LuaHelper.FloatAction(function(arg_109_0)
					arg_105_1.dialogCg_.alpha = arg_109_0
				end))
				var_108_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_105_1.dialog_)
					var_108_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_105_1.duration_ = arg_105_1.duration_ + 0.3

				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_35 = arg_105_1:GetWordFromCfg(116331025)
				local var_108_36 = arg_105_1:FormatText(var_108_35.content)

				arg_105_1.text_.text = var_108_36

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_37 = 37
				local var_108_38 = utf8.len(var_108_36)
				local var_108_39 = var_108_37 <= 0 and var_108_33 or var_108_33 * (var_108_38 / var_108_37)

				if var_108_39 > 0 and var_108_33 < var_108_39 then
					arg_105_1.talkMaxDuration = var_108_39
					var_108_32 = var_108_32 + 0.3

					if var_108_39 + var_108_32 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_39 + var_108_32
					end
				end

				arg_105_1.text_.text = var_108_36
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_40 = var_108_32 + 0.3
			local var_108_41 = math.max(var_108_33, arg_105_1.talkMaxDuration)

			if var_108_40 <= arg_105_1.time_ and arg_105_1.time_ < var_108_40 + var_108_41 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_40) / var_108_41

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_40 + var_108_41 and arg_105_1.time_ < var_108_40 + var_108_41 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play116331026 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116331026
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play116331027(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.875

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_2 = arg_111_1:GetWordFromCfg(116331026)
				local var_114_3 = arg_111_1:FormatText(var_114_2.content)

				arg_111_1.text_.text = var_114_3

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_4 = 35
				local var_114_5 = utf8.len(var_114_3)
				local var_114_6 = var_114_4 <= 0 and var_114_1 or var_114_1 * (var_114_5 / var_114_4)

				if var_114_6 > 0 and var_114_1 < var_114_6 then
					arg_111_1.talkMaxDuration = var_114_6

					if var_114_6 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_6 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_3
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_7 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_7 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_7

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_7 and arg_111_1.time_ < var_114_0 + var_114_7 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play116331027 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116331027
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play116331028(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.85

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

				local var_118_2 = arg_115_1:GetWordFromCfg(116331027)
				local var_118_3 = arg_115_1:FormatText(var_118_2.content)

				arg_115_1.text_.text = var_118_3

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_4 = 34
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
	Play116331028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116331028
		arg_119_1.duration_ = 6.8

		local var_119_0 = {
			zh = 4.7,
			ja = 6.8
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
				arg_119_0:Play116331029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10032ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10032ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, -1.1, -5.9)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10032ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = 0

			if var_122_9 < arg_119_1.time_ and arg_119_1.time_ <= var_122_9 + arg_122_0 then
				arg_119_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				arg_119_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_122_11 = arg_119_1.actors_["10032ui_story"]
			local var_122_12 = 0

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 and arg_119_1.var_.characterEffect10032ui_story == nil then
				arg_119_1.var_.characterEffect10032ui_story = var_122_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_13 = 0.2

			if var_122_12 <= arg_119_1.time_ and arg_119_1.time_ < var_122_12 + var_122_13 then
				local var_122_14 = (arg_119_1.time_ - var_122_12) / var_122_13

				if arg_119_1.var_.characterEffect10032ui_story then
					arg_119_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_12 + var_122_13 and arg_119_1.time_ < var_122_12 + var_122_13 + arg_122_0 and arg_119_1.var_.characterEffect10032ui_story then
				arg_119_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_122_15 = 0
			local var_122_16 = 0.475

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[328].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(116331028)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331028", "story_v_out_116331.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_out_116331", "116331028", "story_v_out_116331.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_out_116331", "116331028", "story_v_out_116331.awb")

						arg_119_1:RecordAudio("116331028", var_122_24)
						arg_119_1:RecordAudio("116331028", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_116331", "116331028", "story_v_out_116331.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_116331", "116331028", "story_v_out_116331.awb")
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
	Play116331029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116331029
		arg_123_1.duration_ = 16.250999999999

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play116331030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = "STwhite"

			if arg_123_1.bgs_[var_126_0] == nil then
				local var_126_1 = Object.Instantiate(arg_123_1.paintGo_)

				var_126_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_126_0)
				var_126_1.name = var_126_0
				var_126_1.transform.parent = arg_123_1.stage_.transform
				var_126_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.bgs_[var_126_0] = var_126_1
			end

			local var_126_2 = 2

			if var_126_2 < arg_123_1.time_ and arg_123_1.time_ <= var_126_2 + arg_126_0 then
				local var_126_3 = manager.ui.mainCamera.transform.localPosition
				local var_126_4 = Vector3.New(0, 0, 10) + Vector3.New(var_126_3.x, var_126_3.y, 0)
				local var_126_5 = arg_123_1.bgs_.STwhite

				var_126_5.transform.localPosition = var_126_4
				var_126_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_6 = var_126_5:GetComponent("SpriteRenderer")

				if var_126_6 and var_126_6.sprite then
					local var_126_7 = (var_126_5.transform.localPosition - var_126_3).z
					local var_126_8 = manager.ui.mainCameraCom_
					local var_126_9 = 2 * var_126_7 * Mathf.Tan(var_126_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_10 = var_126_9 * var_126_8.aspect
					local var_126_11 = var_126_6.sprite.bounds.size.x
					local var_126_12 = var_126_6.sprite.bounds.size.y
					local var_126_13 = var_126_10 / var_126_11
					local var_126_14 = var_126_9 / var_126_12
					local var_126_15 = var_126_14 < var_126_13 and var_126_13 or var_126_14

					var_126_5.transform.localScale = Vector3.New(var_126_15, var_126_15, 0)
				end

				for iter_126_0, iter_126_1 in pairs(arg_123_1.bgs_) do
					if iter_126_0 ~= "STwhite" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_16 = 2

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.fswbg_:SetActive(true)
				arg_123_1.dialog_:SetActive(false)

				arg_123_1.fswtw_.percent = 0

				local var_126_17 = arg_123_1:GetWordFromCfg(116331029)
				local var_126_18 = arg_123_1:FormatText(var_126_17.content)

				arg_123_1.fswt_.text = var_126_18

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.fswt_)

				arg_123_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_123_1.fswtw_:SetDirty()

				arg_123_1.typewritterCharCountI18N = 0

				arg_123_1:ShowNextGo(false)
			end

			local var_126_19 = 4

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				arg_123_1.var_.oldValueTypewriter = arg_123_1.fswtw_.percent

				arg_123_1:ShowNextGo(false)
			end

			local var_126_20 = 59
			local var_126_21 = 2.95
			local var_126_22 = arg_123_1:GetWordFromCfg(116331029)
			local var_126_23 = arg_123_1:FormatText(var_126_22.content)
			local var_126_24, var_126_25 = arg_123_1:GetPercentByPara(var_126_23, 1)

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				local var_126_26 = var_126_20 <= 0 and var_126_21 or var_126_21 * ((var_126_25 - arg_123_1.typewritterCharCountI18N) / var_126_20)

				if var_126_26 > 0 and var_126_21 < var_126_26 then
					arg_123_1.talkMaxDuration = var_126_26

					if var_126_26 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_26 + var_126_19
					end
				end
			end

			local var_126_27 = 2.95
			local var_126_28 = math.max(var_126_27, arg_123_1.talkMaxDuration)

			if var_126_19 <= arg_123_1.time_ and arg_123_1.time_ < var_126_19 + var_126_28 then
				local var_126_29 = (arg_123_1.time_ - var_126_19) / var_126_28

				arg_123_1.fswtw_.percent = Mathf.Lerp(arg_123_1.var_.oldValueTypewriter, var_126_24, var_126_29)
				arg_123_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_123_1.fswtw_:SetDirty()
			end

			if arg_123_1.time_ >= var_126_19 + var_126_28 and arg_123_1.time_ < var_126_19 + var_126_28 + arg_126_0 then
				arg_123_1.fswtw_.percent = var_126_24

				arg_123_1.fswtw_:SetDirty()
				arg_123_1:ShowNextGo(true)

				arg_123_1.typewritterCharCountI18N = var_126_25
			end

			local var_126_30 = 4
			local var_126_31 = 12.251
			local var_126_32 = manager.audio:GetVoiceLength("story_v_out_116331", "116331029", "story_v_out_116331.awb") / 1000

			if var_126_32 > 0 and var_126_31 < var_126_32 and var_126_32 + var_126_30 > arg_123_1.duration_ then
				local var_126_33 = var_126_32

				arg_123_1.duration_ = var_126_32 + var_126_30
			end

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				local var_126_34 = "play"
				local var_126_35 = "voice"

				arg_123_1:AudioAction(var_126_34, var_126_35, "story_v_out_116331", "116331029", "story_v_out_116331.awb")
			end

			local var_126_36 = arg_123_1.actors_["10032ui_story"].transform
			local var_126_37 = 2

			if var_126_37 < arg_123_1.time_ and arg_123_1.time_ <= var_126_37 + arg_126_0 then
				arg_123_1.var_.moveOldPos10032ui_story = var_126_36.localPosition
			end

			local var_126_38 = 0.001

			if var_126_37 <= arg_123_1.time_ and arg_123_1.time_ < var_126_37 + var_126_38 then
				local var_126_39 = (arg_123_1.time_ - var_126_37) / var_126_38
				local var_126_40 = Vector3.New(0, 100, 0)

				var_126_36.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10032ui_story, var_126_40, var_126_39)

				local var_126_41 = manager.ui.mainCamera.transform.position - var_126_36.position

				var_126_36.forward = Vector3.New(var_126_41.x, var_126_41.y, var_126_41.z)

				local var_126_42 = var_126_36.localEulerAngles

				var_126_42.z = 0
				var_126_42.x = 0
				var_126_36.localEulerAngles = var_126_42
			end

			if arg_123_1.time_ >= var_126_37 + var_126_38 and arg_123_1.time_ < var_126_37 + var_126_38 + arg_126_0 then
				var_126_36.localPosition = Vector3.New(0, 100, 0)

				local var_126_43 = manager.ui.mainCamera.transform.position - var_126_36.position

				var_126_36.forward = Vector3.New(var_126_43.x, var_126_43.y, var_126_43.z)

				local var_126_44 = var_126_36.localEulerAngles

				var_126_44.z = 0
				var_126_44.x = 0
				var_126_36.localEulerAngles = var_126_44
			end

			local var_126_45 = 4
			local var_126_46 = 0.266666666666667

			if var_126_45 < arg_123_1.time_ and arg_123_1.time_ <= var_126_45 + arg_126_0 then
				local var_126_47 = "play"
				local var_126_48 = "music"

				arg_123_1:AudioAction(var_126_47, var_126_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_126_49 = 4.4
			local var_126_50 = 0.6

			if var_126_49 < arg_123_1.time_ and arg_123_1.time_ <= var_126_49 + arg_126_0 then
				local var_126_51 = "play"
				local var_126_52 = "music"

				arg_123_1:AudioAction(var_126_51, var_126_52, "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story.awb")
			end

			local var_126_53 = 4.575
			local var_126_54 = 0.425

			if var_126_53 < arg_123_1.time_ and arg_123_1.time_ <= var_126_53 + arg_126_0 then
				local var_126_55 = "play"
				local var_126_56 = "music"

				arg_123_1:AudioAction(var_126_55, var_126_56, "bgm_activity_1_6_story_story", "story", "bgm_activity_1_6_story_story.awb")
			end

			local var_126_57 = 0

			if var_126_57 < arg_123_1.time_ and arg_123_1.time_ <= var_126_57 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_58 = 2

			if var_126_57 <= arg_123_1.time_ and arg_123_1.time_ < var_126_57 + var_126_58 then
				local var_126_59 = (arg_123_1.time_ - var_126_57) / var_126_58
				local var_126_60 = Color.New(0, 0, 0)

				var_126_60.a = Mathf.Lerp(0, 1, var_126_59)
				arg_123_1.mask_.color = var_126_60
			end

			if arg_123_1.time_ >= var_126_57 + var_126_58 and arg_123_1.time_ < var_126_57 + var_126_58 + arg_126_0 then
				local var_126_61 = Color.New(0, 0, 0)

				var_126_61.a = 1
				arg_123_1.mask_.color = var_126_61
			end

			local var_126_62 = 2

			if var_126_62 < arg_123_1.time_ and arg_123_1.time_ <= var_126_62 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_63 = 2

			if var_126_62 <= arg_123_1.time_ and arg_123_1.time_ < var_126_62 + var_126_63 then
				local var_126_64 = (arg_123_1.time_ - var_126_62) / var_126_63
				local var_126_65 = Color.New(0, 0, 0)

				var_126_65.a = Mathf.Lerp(1, 0, var_126_64)
				arg_123_1.mask_.color = var_126_65
			end

			if arg_123_1.time_ >= var_126_62 + var_126_63 and arg_123_1.time_ < var_126_62 + var_126_63 + arg_126_0 then
				local var_126_66 = Color.New(0, 0, 0)
				local var_126_67 = 0

				arg_123_1.mask_.enabled = false
				var_126_66.a = var_126_67
				arg_123_1.mask_.color = var_126_66
			end

			local var_126_68 = 4

			if var_126_68 < arg_123_1.time_ and arg_123_1.time_ <= var_126_68 + arg_126_0 then
				arg_123_1.allBtn_.enabled = false
			end

			local var_126_69 = 2.95

			if arg_123_1.time_ >= var_126_68 + var_126_69 and arg_123_1.time_ < var_126_68 + var_126_69 + arg_126_0 then
				arg_123_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 116331030
		arg_127_1.duration_ = 11.481999999999

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play116331031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.var_.oldValueTypewriter = arg_127_1.fswtw_.percent

				arg_127_1:ShowNextGo(false)
			end

			local var_130_1 = 0
			local var_130_2 = -1
			local var_130_3 = arg_127_1:GetWordFromCfg(116331029)
			local var_130_4 = arg_127_1:FormatText(var_130_3.content)
			local var_130_5, var_130_6 = arg_127_1:GetPercentByPara(var_130_4, 1)

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

			local var_130_8 = -1
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

			local var_130_12 = 47
			local var_130_13 = 2.35
			local var_130_14 = arg_127_1:GetWordFromCfg(116331029)
			local var_130_15 = arg_127_1:FormatText(var_130_14.content)
			local var_130_16, var_130_17 = arg_127_1:GetPercentByPara(var_130_15, 2)

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

			local var_130_19 = 2.35
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
			local var_130_23 = 11.482
			local var_130_24 = manager.audio:GetVoiceLength("story_v_out_116331", "116331030", "story_v_out_116331.awb") / 1000

			if var_130_24 > 0 and var_130_23 < var_130_24 and var_130_24 + var_130_22 > arg_127_1.duration_ then
				local var_130_25 = var_130_24

				arg_127_1.duration_ = var_130_24 + var_130_22
			end

			if var_130_22 < arg_127_1.time_ and arg_127_1.time_ <= var_130_22 + arg_130_0 then
				local var_130_26 = "play"
				local var_130_27 = "voice"

				arg_127_1:AudioAction(var_130_26, var_130_27, "story_v_out_116331", "116331030", "story_v_out_116331.awb")
			end

			local var_130_28 = 0

			if var_130_28 < arg_127_1.time_ and arg_127_1.time_ <= var_130_28 + arg_130_0 then
				arg_127_1.allBtn_.enabled = false
			end

			local var_130_29 = 2.35

			if arg_127_1.time_ >= var_130_28 + var_130_29 and arg_127_1.time_ < var_130_28 + var_130_29 + arg_130_0 then
				arg_127_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 116331031
		arg_131_1.duration_ = 12.413999999999

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play116331032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.var_.oldValueTypewriter = arg_131_1.fswtw_.percent

				arg_131_1:ShowNextGo(false)
			end

			local var_134_1 = 0
			local var_134_2 = -2.53333333333333
			local var_134_3 = arg_131_1:GetWordFromCfg(116331029)
			local var_134_4 = arg_131_1:FormatText(var_134_3.content)
			local var_134_5, var_134_6 = arg_131_1:GetPercentByPara(var_134_4, 1)

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

			local var_134_8 = -2.53333333333333
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
				arg_131_1.var_.oldValueTypewriter = arg_131_1.fswtw_.percent

				arg_131_1:ShowNextGo(false)
			end

			local var_134_12 = 53
			local var_134_13 = 2.65
			local var_134_14 = arg_131_1:GetWordFromCfg(116331029)
			local var_134_15 = arg_131_1:FormatText(var_134_14.content)
			local var_134_16, var_134_17 = arg_131_1:GetPercentByPara(var_134_15, 3)

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				local var_134_18 = var_134_12 <= 0 and var_134_13 or var_134_13 * ((var_134_17 - arg_131_1.typewritterCharCountI18N) / var_134_12)

				if var_134_18 > 0 and var_134_13 < var_134_18 then
					arg_131_1.talkMaxDuration = var_134_18

					if var_134_18 + var_134_11 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_18 + var_134_11
					end
				end
			end

			local var_134_19 = 2.65
			local var_134_20 = math.max(var_134_19, arg_131_1.talkMaxDuration)

			if var_134_11 <= arg_131_1.time_ and arg_131_1.time_ < var_134_11 + var_134_20 then
				local var_134_21 = (arg_131_1.time_ - var_134_11) / var_134_20

				arg_131_1.fswtw_.percent = Mathf.Lerp(arg_131_1.var_.oldValueTypewriter, var_134_16, var_134_21)
				arg_131_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_131_1.fswtw_:SetDirty()
			end

			if arg_131_1.time_ >= var_134_11 + var_134_20 and arg_131_1.time_ < var_134_11 + var_134_20 + arg_134_0 then
				arg_131_1.fswtw_.percent = var_134_16

				arg_131_1.fswtw_:SetDirty()
				arg_131_1:ShowNextGo(true)

				arg_131_1.typewritterCharCountI18N = var_134_17
			end

			local var_134_22 = 0
			local var_134_23 = 12.414
			local var_134_24 = manager.audio:GetVoiceLength("story_v_out_116331", "116331031", "story_v_out_116331.awb") / 1000

			if var_134_24 > 0 and var_134_23 < var_134_24 and var_134_24 + var_134_22 > arg_131_1.duration_ then
				local var_134_25 = var_134_24

				arg_131_1.duration_ = var_134_24 + var_134_22
			end

			if var_134_22 < arg_131_1.time_ and arg_131_1.time_ <= var_134_22 + arg_134_0 then
				local var_134_26 = "play"
				local var_134_27 = "voice"

				arg_131_1:AudioAction(var_134_26, var_134_27, "story_v_out_116331", "116331031", "story_v_out_116331.awb")
			end

			local var_134_28 = 0

			if var_134_28 < arg_131_1.time_ and arg_131_1.time_ <= var_134_28 + arg_134_0 then
				arg_131_1.allBtn_.enabled = false
			end

			local var_134_29 = 2.65

			if arg_131_1.time_ >= var_134_28 + var_134_29 and arg_131_1.time_ < var_134_28 + var_134_29 + arg_134_0 then
				arg_131_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 116331032
		arg_135_1.duration_ = 4.229999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play116331033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.var_.oldValueTypewriter = arg_135_1.fswtw_.percent

				arg_135_1:ShowNextGo(false)
			end

			local var_138_1 = 0
			local var_138_2 = -5.26666666666667
			local var_138_3 = arg_135_1:GetWordFromCfg(116331029)
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

			local var_138_8 = -5.26666666666667
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

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.var_.oldValueTypewriter = arg_135_1.fswtw_.percent

				arg_135_1:ShowNextGo(false)
			end

			local var_138_12 = 25
			local var_138_13 = 1.25
			local var_138_14 = arg_135_1:GetWordFromCfg(116331029)
			local var_138_15 = arg_135_1:FormatText(var_138_14.content)
			local var_138_16, var_138_17 = arg_135_1:GetPercentByPara(var_138_15, 4)

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				local var_138_18 = var_138_12 <= 0 and var_138_13 or var_138_13 * ((var_138_17 - arg_135_1.typewritterCharCountI18N) / var_138_12)

				if var_138_18 > 0 and var_138_13 < var_138_18 then
					arg_135_1.talkMaxDuration = var_138_18

					if var_138_18 + var_138_11 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_18 + var_138_11
					end
				end
			end

			local var_138_19 = 1.25
			local var_138_20 = math.max(var_138_19, arg_135_1.talkMaxDuration)

			if var_138_11 <= arg_135_1.time_ and arg_135_1.time_ < var_138_11 + var_138_20 then
				local var_138_21 = (arg_135_1.time_ - var_138_11) / var_138_20

				arg_135_1.fswtw_.percent = Mathf.Lerp(arg_135_1.var_.oldValueTypewriter, var_138_16, var_138_21)
				arg_135_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_135_1.fswtw_:SetDirty()
			end

			if arg_135_1.time_ >= var_138_11 + var_138_20 and arg_135_1.time_ < var_138_11 + var_138_20 + arg_138_0 then
				arg_135_1.fswtw_.percent = var_138_16

				arg_135_1.fswtw_:SetDirty()
				arg_135_1:ShowNextGo(true)

				arg_135_1.typewritterCharCountI18N = var_138_17
			end

			local var_138_22 = 0
			local var_138_23 = 4.23
			local var_138_24 = manager.audio:GetVoiceLength("story_v_out_116331", "116331032", "story_v_out_116331.awb") / 1000

			if var_138_24 > 0 and var_138_23 < var_138_24 and var_138_24 + var_138_22 > arg_135_1.duration_ then
				local var_138_25 = var_138_24

				arg_135_1.duration_ = var_138_24 + var_138_22
			end

			if var_138_22 < arg_135_1.time_ and arg_135_1.time_ <= var_138_22 + arg_138_0 then
				local var_138_26 = "play"
				local var_138_27 = "voice"

				arg_135_1:AudioAction(var_138_26, var_138_27, "story_v_out_116331", "116331032", "story_v_out_116331.awb")
			end

			local var_138_28 = 0

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1.allBtn_.enabled = false
			end

			local var_138_29 = 1.25

			if arg_135_1.time_ >= var_138_28 + var_138_29 and arg_135_1.time_ < var_138_28 + var_138_29 + arg_138_0 then
				arg_135_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 116331033
		arg_139_1.duration_ = 11.889999999999

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play116331034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.var_.oldValueTypewriter = arg_139_1.fswtw_.percent

				arg_139_1:ShowNextGo(false)
			end

			local var_142_1 = 0
			local var_142_2 = -5.33333333333333
			local var_142_3 = arg_139_1:GetWordFromCfg(116331029)
			local var_142_4 = arg_139_1:FormatText(var_142_3.content)
			local var_142_5, var_142_6 = arg_139_1:GetPercentByPara(var_142_4, 2)

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

			local var_142_8 = -5.33333333333333
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

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.var_.oldValueTypewriter = arg_139_1.fswtw_.percent

				arg_139_1:ShowNextGo(false)
			end

			local var_142_12 = 52
			local var_142_13 = 2.6
			local var_142_14 = arg_139_1:GetWordFromCfg(116331029)
			local var_142_15 = arg_139_1:FormatText(var_142_14.content)
			local var_142_16, var_142_17 = arg_139_1:GetPercentByPara(var_142_15, 5)

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0

				local var_142_18 = var_142_12 <= 0 and var_142_13 or var_142_13 * ((var_142_17 - arg_139_1.typewritterCharCountI18N) / var_142_12)

				if var_142_18 > 0 and var_142_13 < var_142_18 then
					arg_139_1.talkMaxDuration = var_142_18

					if var_142_18 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_18 + var_142_11
					end
				end
			end

			local var_142_19 = 2.6
			local var_142_20 = math.max(var_142_19, arg_139_1.talkMaxDuration)

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_20 then
				local var_142_21 = (arg_139_1.time_ - var_142_11) / var_142_20

				arg_139_1.fswtw_.percent = Mathf.Lerp(arg_139_1.var_.oldValueTypewriter, var_142_16, var_142_21)
				arg_139_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_139_1.fswtw_:SetDirty()
			end

			if arg_139_1.time_ >= var_142_11 + var_142_20 and arg_139_1.time_ < var_142_11 + var_142_20 + arg_142_0 then
				arg_139_1.fswtw_.percent = var_142_16

				arg_139_1.fswtw_:SetDirty()
				arg_139_1:ShowNextGo(true)

				arg_139_1.typewritterCharCountI18N = var_142_17
			end

			local var_142_22 = 0
			local var_142_23 = 11.89
			local var_142_24 = manager.audio:GetVoiceLength("story_v_out_116331", "116331033", "story_v_out_116331.awb") / 1000

			if var_142_24 > 0 and var_142_23 < var_142_24 and var_142_24 + var_142_22 > arg_139_1.duration_ then
				local var_142_25 = var_142_24

				arg_139_1.duration_ = var_142_24 + var_142_22
			end

			if var_142_22 < arg_139_1.time_ and arg_139_1.time_ <= var_142_22 + arg_142_0 then
				local var_142_26 = "play"
				local var_142_27 = "voice"

				arg_139_1:AudioAction(var_142_26, var_142_27, "story_v_out_116331", "116331033", "story_v_out_116331.awb")
			end

			local var_142_28 = 0

			if var_142_28 < arg_139_1.time_ and arg_139_1.time_ <= var_142_28 + arg_142_0 then
				arg_139_1.allBtn_.enabled = false
			end

			local var_142_29 = 2.6

			if arg_139_1.time_ >= var_142_28 + var_142_29 and arg_139_1.time_ < var_142_28 + var_142_29 + arg_142_0 then
				arg_139_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 116331034
		arg_143_1.duration_ = 3.058999999999

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play116331035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.var_.oldValueTypewriter = arg_143_1.fswtw_.percent

				arg_143_1:ShowNextGo(false)
			end

			local var_146_1 = 0
			local var_146_2 = -8.13333333333333
			local var_146_3 = arg_143_1:GetWordFromCfg(116331029)
			local var_146_4 = arg_143_1:FormatText(var_146_3.content)
			local var_146_5, var_146_6 = arg_143_1:GetPercentByPara(var_146_4, 2)

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

			local var_146_8 = -8.13333333333333
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

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				arg_143_1.var_.oldValueTypewriter = arg_143_1.fswtw_.percent

				arg_143_1:ShowNextGo(false)
			end

			local var_146_12 = 21
			local var_146_13 = 1.05
			local var_146_14 = arg_143_1:GetWordFromCfg(116331029)
			local var_146_15 = arg_143_1:FormatText(var_146_14.content)
			local var_146_16, var_146_17 = arg_143_1:GetPercentByPara(var_146_15, 6)

			if var_146_11 < arg_143_1.time_ and arg_143_1.time_ <= var_146_11 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				local var_146_18 = var_146_12 <= 0 and var_146_13 or var_146_13 * ((var_146_17 - arg_143_1.typewritterCharCountI18N) / var_146_12)

				if var_146_18 > 0 and var_146_13 < var_146_18 then
					arg_143_1.talkMaxDuration = var_146_18

					if var_146_18 + var_146_11 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_18 + var_146_11
					end
				end
			end

			local var_146_19 = 1.05
			local var_146_20 = math.max(var_146_19, arg_143_1.talkMaxDuration)

			if var_146_11 <= arg_143_1.time_ and arg_143_1.time_ < var_146_11 + var_146_20 then
				local var_146_21 = (arg_143_1.time_ - var_146_11) / var_146_20

				arg_143_1.fswtw_.percent = Mathf.Lerp(arg_143_1.var_.oldValueTypewriter, var_146_16, var_146_21)
				arg_143_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_143_1.fswtw_:SetDirty()
			end

			if arg_143_1.time_ >= var_146_11 + var_146_20 and arg_143_1.time_ < var_146_11 + var_146_20 + arg_146_0 then
				arg_143_1.fswtw_.percent = var_146_16

				arg_143_1.fswtw_:SetDirty()
				arg_143_1:ShowNextGo(true)

				arg_143_1.typewritterCharCountI18N = var_146_17
			end

			local var_146_22 = 0
			local var_146_23 = 3.059
			local var_146_24 = manager.audio:GetVoiceLength("story_v_out_116331", "116331034", "story_v_out_116331.awb") / 1000

			if var_146_24 > 0 and var_146_23 < var_146_24 and var_146_24 + var_146_22 > arg_143_1.duration_ then
				local var_146_25 = var_146_24

				arg_143_1.duration_ = var_146_24 + var_146_22
			end

			if var_146_22 < arg_143_1.time_ and arg_143_1.time_ <= var_146_22 + arg_146_0 then
				local var_146_26 = "play"
				local var_146_27 = "voice"

				arg_143_1:AudioAction(var_146_26, var_146_27, "story_v_out_116331", "116331034", "story_v_out_116331.awb")
			end

			local var_146_28 = 0

			if var_146_28 < arg_143_1.time_ and arg_143_1.time_ <= var_146_28 + arg_146_0 then
				arg_143_1.allBtn_.enabled = false
			end

			local var_146_29 = 1.05

			if arg_143_1.time_ >= var_146_28 + var_146_29 and arg_143_1.time_ < var_146_28 + var_146_29 + arg_146_0 then
				arg_143_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 116331035
		arg_147_1.duration_ = 4.566999999999

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play116331036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.fswbg_:SetActive(true)
				arg_147_1.dialog_:SetActive(false)

				arg_147_1.fswtw_.percent = 0

				local var_150_1 = arg_147_1:GetWordFromCfg(116331035)
				local var_150_2 = arg_147_1:FormatText(var_150_1.content)

				arg_147_1.fswt_.text = var_150_2

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.fswt_)

				arg_147_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_147_1.fswtw_:SetDirty()

				arg_147_1.typewritterCharCountI18N = 0

				arg_147_1:ShowNextGo(false)
			end

			local var_150_3 = 0.0166666666666667

			if var_150_3 < arg_147_1.time_ and arg_147_1.time_ <= var_150_3 + arg_150_0 then
				arg_147_1.var_.oldValueTypewriter = arg_147_1.fswtw_.percent

				arg_147_1:ShowNextGo(false)
			end

			local var_150_4 = 22
			local var_150_5 = 1.46666666666667
			local var_150_6 = arg_147_1:GetWordFromCfg(116331035)
			local var_150_7 = arg_147_1:FormatText(var_150_6.content)
			local var_150_8, var_150_9 = arg_147_1:GetPercentByPara(var_150_7, 1)

			if var_150_3 < arg_147_1.time_ and arg_147_1.time_ <= var_150_3 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0

				local var_150_10 = var_150_4 <= 0 and var_150_5 or var_150_5 * ((var_150_9 - arg_147_1.typewritterCharCountI18N) / var_150_4)

				if var_150_10 > 0 and var_150_5 < var_150_10 then
					arg_147_1.talkMaxDuration = var_150_10

					if var_150_10 + var_150_3 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_10 + var_150_3
					end
				end
			end

			local var_150_11 = 1.46666666666667
			local var_150_12 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_3 <= arg_147_1.time_ and arg_147_1.time_ < var_150_3 + var_150_12 then
				local var_150_13 = (arg_147_1.time_ - var_150_3) / var_150_12

				arg_147_1.fswtw_.percent = Mathf.Lerp(arg_147_1.var_.oldValueTypewriter, var_150_8, var_150_13)
				arg_147_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_147_1.fswtw_:SetDirty()
			end

			if arg_147_1.time_ >= var_150_3 + var_150_12 and arg_147_1.time_ < var_150_3 + var_150_12 + arg_150_0 then
				arg_147_1.fswtw_.percent = var_150_8

				arg_147_1.fswtw_:SetDirty()
				arg_147_1:ShowNextGo(true)

				arg_147_1.typewritterCharCountI18N = var_150_9
			end

			local var_150_14 = 0
			local var_150_15 = 4.567
			local var_150_16 = manager.audio:GetVoiceLength("story_v_out_116331", "116331035", "story_v_out_116331.awb") / 1000

			if var_150_16 > 0 and var_150_15 < var_150_16 and var_150_16 + var_150_14 > arg_147_1.duration_ then
				local var_150_17 = var_150_16

				arg_147_1.duration_ = var_150_16 + var_150_14
			end

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				local var_150_18 = "play"
				local var_150_19 = "voice"

				arg_147_1:AudioAction(var_150_18, var_150_19, "story_v_out_116331", "116331035", "story_v_out_116331.awb")
			end

			local var_150_20 = 0

			if var_150_20 < arg_147_1.time_ and arg_147_1.time_ <= var_150_20 + arg_150_0 then
				arg_147_1.allBtn_.enabled = false
			end

			local var_150_21 = 1.48333333333333

			if arg_147_1.time_ >= var_150_20 + var_150_21 and arg_147_1.time_ < var_150_20 + var_150_21 + arg_150_0 then
				arg_147_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 116331036
		arg_151_1.duration_ = 1.175999999999

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play116331037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.var_.oldValueTypewriter = arg_151_1.fswtw_.percent

				arg_151_1:ShowNextGo(false)
			end

			local var_154_1 = 11
			local var_154_2 = 0.733333333333333
			local var_154_3 = arg_151_1:GetWordFromCfg(116331035)
			local var_154_4 = arg_151_1:FormatText(var_154_3.content)
			local var_154_5, var_154_6 = arg_151_1:GetPercentByPara(var_154_4, 2)

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

			local var_154_8 = 0.733333333333333
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
			local var_154_12 = 1.176
			local var_154_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331036", "story_v_out_116331.awb") / 1000

			if var_154_13 > 0 and var_154_12 < var_154_13 and var_154_13 + var_154_11 > arg_151_1.duration_ then
				local var_154_14 = var_154_13

				arg_151_1.duration_ = var_154_13 + var_154_11
			end

			if var_154_11 < arg_151_1.time_ and arg_151_1.time_ <= var_154_11 + arg_154_0 then
				local var_154_15 = "play"
				local var_154_16 = "voice"

				arg_151_1:AudioAction(var_154_15, var_154_16, "story_v_out_116331", "116331036", "story_v_out_116331.awb")
			end

			local var_154_17 = 0

			if var_154_17 < arg_151_1.time_ and arg_151_1.time_ <= var_154_17 + arg_154_0 then
				arg_151_1.allBtn_.enabled = false
			end

			local var_154_18 = 0.733333333333333

			if arg_151_1.time_ >= var_154_17 + var_154_18 and arg_151_1.time_ < var_154_17 + var_154_18 + arg_154_0 then
				arg_151_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 116331037
		arg_155_1.duration_ = 3.892999999999

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play116331038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.var_.oldValueTypewriter = arg_155_1.fswtw_.percent

				arg_155_1:ShowNextGo(false)
			end

			local var_158_1 = 30
			local var_158_2 = 2
			local var_158_3 = arg_155_1:GetWordFromCfg(116331035)
			local var_158_4 = arg_155_1:FormatText(var_158_3.content)
			local var_158_5, var_158_6 = arg_155_1:GetPercentByPara(var_158_4, 3)

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0

				local var_158_7 = var_158_1 <= 0 and var_158_2 or var_158_2 * ((var_158_6 - arg_155_1.typewritterCharCountI18N) / var_158_1)

				if var_158_7 > 0 and var_158_2 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end
			end

			local var_158_8 = 2
			local var_158_9 = math.max(var_158_8, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_0) / var_158_9

				arg_155_1.fswtw_.percent = Mathf.Lerp(arg_155_1.var_.oldValueTypewriter, var_158_5, var_158_10)
				arg_155_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_155_1.fswtw_:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_9 and arg_155_1.time_ < var_158_0 + var_158_9 + arg_158_0 then
				arg_155_1.fswtw_.percent = var_158_5

				arg_155_1.fswtw_:SetDirty()
				arg_155_1:ShowNextGo(true)

				arg_155_1.typewritterCharCountI18N = var_158_6
			end

			local var_158_11 = 0
			local var_158_12 = 3.893
			local var_158_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331037", "story_v_out_116331.awb") / 1000

			if var_158_13 > 0 and var_158_12 < var_158_13 and var_158_13 + var_158_11 > arg_155_1.duration_ then
				local var_158_14 = var_158_13

				arg_155_1.duration_ = var_158_13 + var_158_11
			end

			if var_158_11 < arg_155_1.time_ and arg_155_1.time_ <= var_158_11 + arg_158_0 then
				local var_158_15 = "play"
				local var_158_16 = "voice"

				arg_155_1:AudioAction(var_158_15, var_158_16, "story_v_out_116331", "116331037", "story_v_out_116331.awb")
			end

			local var_158_17 = 0

			if var_158_17 < arg_155_1.time_ and arg_155_1.time_ <= var_158_17 + arg_158_0 then
				arg_155_1.allBtn_.enabled = false
			end

			local var_158_18 = 2

			if arg_155_1.time_ >= var_158_17 + var_158_18 and arg_155_1.time_ < var_158_17 + var_158_18 + arg_158_0 then
				arg_155_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 116331038
		arg_159_1.duration_ = 6.071999999999

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play116331039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.var_.oldValueTypewriter = arg_159_1.fswtw_.percent

				arg_159_1:ShowNextGo(false)
			end

			local var_162_1 = 29
			local var_162_2 = 1.93333333333333
			local var_162_3 = arg_159_1:GetWordFromCfg(116331035)
			local var_162_4 = arg_159_1:FormatText(var_162_3.content)
			local var_162_5, var_162_6 = arg_159_1:GetPercentByPara(var_162_4, 4)

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

			local var_162_8 = 1.93333333333333
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
			local var_162_12 = 6.072
			local var_162_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331038", "story_v_out_116331.awb") / 1000

			if var_162_13 > 0 and var_162_12 < var_162_13 and var_162_13 + var_162_11 > arg_159_1.duration_ then
				local var_162_14 = var_162_13

				arg_159_1.duration_ = var_162_13 + var_162_11
			end

			if var_162_11 < arg_159_1.time_ and arg_159_1.time_ <= var_162_11 + arg_162_0 then
				local var_162_15 = "play"
				local var_162_16 = "voice"

				arg_159_1:AudioAction(var_162_15, var_162_16, "story_v_out_116331", "116331038", "story_v_out_116331.awb")
			end

			local var_162_17 = 0

			if var_162_17 < arg_159_1.time_ and arg_159_1.time_ <= var_162_17 + arg_162_0 then
				arg_159_1.allBtn_.enabled = false
			end

			local var_162_18 = 1.93333333333333

			if arg_159_1.time_ >= var_162_17 + var_162_18 and arg_159_1.time_ < var_162_17 + var_162_18 + arg_162_0 then
				arg_159_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 116331039
		arg_163_1.duration_ = 6.239999999999

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play116331040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.var_.oldValueTypewriter = arg_163_1.fswtw_.percent

				arg_163_1:ShowNextGo(false)
			end

			local var_166_1 = 29
			local var_166_2 = 1.93333333333333
			local var_166_3 = arg_163_1:GetWordFromCfg(116331035)
			local var_166_4 = arg_163_1:FormatText(var_166_3.content)
			local var_166_5, var_166_6 = arg_163_1:GetPercentByPara(var_166_4, 5)

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

			local var_166_8 = 1.93333333333333
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
			local var_166_12 = 6.24
			local var_166_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331039", "story_v_out_116331.awb") / 1000

			if var_166_13 > 0 and var_166_12 < var_166_13 and var_166_13 + var_166_11 > arg_163_1.duration_ then
				local var_166_14 = var_166_13

				arg_163_1.duration_ = var_166_13 + var_166_11
			end

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				local var_166_15 = "play"
				local var_166_16 = "voice"

				arg_163_1:AudioAction(var_166_15, var_166_16, "story_v_out_116331", "116331039", "story_v_out_116331.awb")
			end

			local var_166_17 = 0

			if var_166_17 < arg_163_1.time_ and arg_163_1.time_ <= var_166_17 + arg_166_0 then
				arg_163_1.allBtn_.enabled = false
			end

			local var_166_18 = 1.93333333333333

			if arg_163_1.time_ >= var_166_17 + var_166_18 and arg_163_1.time_ < var_166_17 + var_166_18 + arg_166_0 then
				arg_163_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 116331040
		arg_167_1.duration_ = 14.152999999999

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play116331041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.var_.oldValueTypewriter = arg_167_1.fswtw_.percent

				arg_167_1:ShowNextGo(false)
			end

			local var_170_1 = 60
			local var_170_2 = 4
			local var_170_3 = arg_167_1:GetWordFromCfg(116331035)
			local var_170_4 = arg_167_1:FormatText(var_170_3.content)
			local var_170_5, var_170_6 = arg_167_1:GetPercentByPara(var_170_4, 6)

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

			local var_170_8 = 4
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
			local var_170_12 = 14.153
			local var_170_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331040", "story_v_out_116331.awb") / 1000

			if var_170_13 > 0 and var_170_12 < var_170_13 and var_170_13 + var_170_11 > arg_167_1.duration_ then
				local var_170_14 = var_170_13

				arg_167_1.duration_ = var_170_13 + var_170_11
			end

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 then
				local var_170_15 = "play"
				local var_170_16 = "voice"

				arg_167_1:AudioAction(var_170_15, var_170_16, "story_v_out_116331", "116331040", "story_v_out_116331.awb")
			end

			local var_170_17 = 0

			if var_170_17 < arg_167_1.time_ and arg_167_1.time_ <= var_170_17 + arg_170_0 then
				arg_167_1.allBtn_.enabled = false
			end

			local var_170_18 = 4

			if arg_167_1.time_ >= var_170_17 + var_170_18 and arg_167_1.time_ < var_170_17 + var_170_18 + arg_170_0 then
				arg_167_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 116331041
		arg_171_1.duration_ = 6.593999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play116331042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.var_.oldValueTypewriter = arg_171_1.fswtw_.percent

				arg_171_1:ShowNextGo(false)
			end

			local var_174_1 = 31
			local var_174_2 = 2.06666666666667
			local var_174_3 = arg_171_1:GetWordFromCfg(116331035)
			local var_174_4 = arg_171_1:FormatText(var_174_3.content)
			local var_174_5, var_174_6 = arg_171_1:GetPercentByPara(var_174_4, 7)

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

			local var_174_8 = 2.06666666666667
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
			local var_174_12 = 6.594
			local var_174_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331041", "story_v_out_116331.awb") / 1000

			if var_174_13 > 0 and var_174_12 < var_174_13 and var_174_13 + var_174_11 > arg_171_1.duration_ then
				local var_174_14 = var_174_13

				arg_171_1.duration_ = var_174_13 + var_174_11
			end

			if var_174_11 < arg_171_1.time_ and arg_171_1.time_ <= var_174_11 + arg_174_0 then
				local var_174_15 = "play"
				local var_174_16 = "voice"

				arg_171_1:AudioAction(var_174_15, var_174_16, "story_v_out_116331", "116331041", "story_v_out_116331.awb")
			end

			local var_174_17 = 0

			if var_174_17 < arg_171_1.time_ and arg_171_1.time_ <= var_174_17 + arg_174_0 then
				arg_171_1.allBtn_.enabled = false
			end

			local var_174_18 = 2.06666666666667

			if arg_171_1.time_ >= var_174_17 + var_174_18 and arg_171_1.time_ < var_174_17 + var_174_18 + arg_174_0 then
				arg_171_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 116331042
		arg_175_1.duration_ = 2.968999999999

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play116331043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.fswbg_:SetActive(true)
				arg_175_1.dialog_:SetActive(false)

				arg_175_1.fswtw_.percent = 0

				local var_178_1 = arg_175_1:GetWordFromCfg(116331042)
				local var_178_2 = arg_175_1:FormatText(var_178_1.content)

				arg_175_1.fswt_.text = var_178_2

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.fswt_)

				arg_175_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_175_1.fswtw_:SetDirty()

				arg_175_1.typewritterCharCountI18N = 0

				arg_175_1:ShowNextGo(false)
			end

			local var_178_3 = 0.0166666666666667

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 then
				arg_175_1.var_.oldValueTypewriter = arg_175_1.fswtw_.percent

				arg_175_1:ShowNextGo(false)
			end

			local var_178_4 = 14
			local var_178_5 = 0.933333333333333
			local var_178_6 = arg_175_1:GetWordFromCfg(116331042)
			local var_178_7 = arg_175_1:FormatText(var_178_6.content)
			local var_178_8, var_178_9 = arg_175_1:GetPercentByPara(var_178_7, 1)

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				local var_178_10 = var_178_4 <= 0 and var_178_5 or var_178_5 * ((var_178_9 - arg_175_1.typewritterCharCountI18N) / var_178_4)

				if var_178_10 > 0 and var_178_5 < var_178_10 then
					arg_175_1.talkMaxDuration = var_178_10

					if var_178_10 + var_178_3 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_10 + var_178_3
					end
				end
			end

			local var_178_11 = 0.933333333333333
			local var_178_12 = math.max(var_178_11, arg_175_1.talkMaxDuration)

			if var_178_3 <= arg_175_1.time_ and arg_175_1.time_ < var_178_3 + var_178_12 then
				local var_178_13 = (arg_175_1.time_ - var_178_3) / var_178_12

				arg_175_1.fswtw_.percent = Mathf.Lerp(arg_175_1.var_.oldValueTypewriter, var_178_8, var_178_13)
				arg_175_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_175_1.fswtw_:SetDirty()
			end

			if arg_175_1.time_ >= var_178_3 + var_178_12 and arg_175_1.time_ < var_178_3 + var_178_12 + arg_178_0 then
				arg_175_1.fswtw_.percent = var_178_8

				arg_175_1.fswtw_:SetDirty()
				arg_175_1:ShowNextGo(true)

				arg_175_1.typewritterCharCountI18N = var_178_9
			end

			local var_178_14 = 0
			local var_178_15 = 2.969
			local var_178_16 = manager.audio:GetVoiceLength("story_v_out_116331", "116331042", "story_v_out_116331.awb") / 1000

			if var_178_16 > 0 and var_178_15 < var_178_16 and var_178_16 + var_178_14 > arg_175_1.duration_ then
				local var_178_17 = var_178_16

				arg_175_1.duration_ = var_178_16 + var_178_14
			end

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				local var_178_18 = "play"
				local var_178_19 = "voice"

				arg_175_1:AudioAction(var_178_18, var_178_19, "story_v_out_116331", "116331042", "story_v_out_116331.awb")
			end

			local var_178_20 = 0

			if var_178_20 < arg_175_1.time_ and arg_175_1.time_ <= var_178_20 + arg_178_0 then
				arg_175_1.allBtn_.enabled = false
			end

			local var_178_21 = 0.95

			if arg_175_1.time_ >= var_178_20 + var_178_21 and arg_175_1.time_ < var_178_20 + var_178_21 + arg_178_0 then
				arg_175_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 116331043
		arg_179_1.duration_ = 2.533999999999

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play116331044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.var_.oldValueTypewriter = arg_179_1.fswtw_.percent

				arg_179_1:ShowNextGo(false)
			end

			local var_182_1 = 19
			local var_182_2 = 1.26666666666667
			local var_182_3 = arg_179_1:GetWordFromCfg(116331042)
			local var_182_4 = arg_179_1:FormatText(var_182_3.content)
			local var_182_5, var_182_6 = arg_179_1:GetPercentByPara(var_182_4, 2)

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0

				local var_182_7 = var_182_1 <= 0 and var_182_2 or var_182_2 * ((var_182_6 - arg_179_1.typewritterCharCountI18N) / var_182_1)

				if var_182_7 > 0 and var_182_2 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end
			end

			local var_182_8 = 1.26666666666667
			local var_182_9 = math.max(var_182_8, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_0) / var_182_9

				arg_179_1.fswtw_.percent = Mathf.Lerp(arg_179_1.var_.oldValueTypewriter, var_182_5, var_182_10)
				arg_179_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_179_1.fswtw_:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_9 and arg_179_1.time_ < var_182_0 + var_182_9 + arg_182_0 then
				arg_179_1.fswtw_.percent = var_182_5

				arg_179_1.fswtw_:SetDirty()
				arg_179_1:ShowNextGo(true)

				arg_179_1.typewritterCharCountI18N = var_182_6
			end

			local var_182_11 = 0
			local var_182_12 = 2.534
			local var_182_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331043", "story_v_out_116331.awb") / 1000

			if var_182_13 > 0 and var_182_12 < var_182_13 and var_182_13 + var_182_11 > arg_179_1.duration_ then
				local var_182_14 = var_182_13

				arg_179_1.duration_ = var_182_13 + var_182_11
			end

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 then
				local var_182_15 = "play"
				local var_182_16 = "voice"

				arg_179_1:AudioAction(var_182_15, var_182_16, "story_v_out_116331", "116331043", "story_v_out_116331.awb")
			end

			local var_182_17 = 0

			if var_182_17 < arg_179_1.time_ and arg_179_1.time_ <= var_182_17 + arg_182_0 then
				arg_179_1.allBtn_.enabled = false
			end

			local var_182_18 = 1.26666666666667

			if arg_179_1.time_ >= var_182_17 + var_182_18 and arg_179_1.time_ < var_182_17 + var_182_18 + arg_182_0 then
				arg_179_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 116331044
		arg_183_1.duration_ = 2.002999999999

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play116331045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.var_.oldValueTypewriter = arg_183_1.fswtw_.percent

				arg_183_1:ShowNextGo(false)
			end

			local var_186_1 = 17
			local var_186_2 = 1.13333333333333
			local var_186_3 = arg_183_1:GetWordFromCfg(116331042)
			local var_186_4 = arg_183_1:FormatText(var_186_3.content)
			local var_186_5, var_186_6 = arg_183_1:GetPercentByPara(var_186_4, 3)

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				local var_186_7 = var_186_1 <= 0 and var_186_2 or var_186_2 * ((var_186_6 - arg_183_1.typewritterCharCountI18N) / var_186_1)

				if var_186_7 > 0 and var_186_2 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end
			end

			local var_186_8 = 1.13333333333333
			local var_186_9 = math.max(var_186_8, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_0) / var_186_9

				arg_183_1.fswtw_.percent = Mathf.Lerp(arg_183_1.var_.oldValueTypewriter, var_186_5, var_186_10)
				arg_183_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_183_1.fswtw_:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_9 and arg_183_1.time_ < var_186_0 + var_186_9 + arg_186_0 then
				arg_183_1.fswtw_.percent = var_186_5

				arg_183_1.fswtw_:SetDirty()
				arg_183_1:ShowNextGo(true)

				arg_183_1.typewritterCharCountI18N = var_186_6
			end

			local var_186_11 = 0
			local var_186_12 = 2.003
			local var_186_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331044", "story_v_out_116331.awb") / 1000

			if var_186_13 > 0 and var_186_12 < var_186_13 and var_186_13 + var_186_11 > arg_183_1.duration_ then
				local var_186_14 = var_186_13

				arg_183_1.duration_ = var_186_13 + var_186_11
			end

			if var_186_11 < arg_183_1.time_ and arg_183_1.time_ <= var_186_11 + arg_186_0 then
				local var_186_15 = "play"
				local var_186_16 = "voice"

				arg_183_1:AudioAction(var_186_15, var_186_16, "story_v_out_116331", "116331044", "story_v_out_116331.awb")
			end

			local var_186_17 = 0

			if var_186_17 < arg_183_1.time_ and arg_183_1.time_ <= var_186_17 + arg_186_0 then
				arg_183_1.allBtn_.enabled = false
			end

			local var_186_18 = 1.13333333333333

			if arg_183_1.time_ >= var_186_17 + var_186_18 and arg_183_1.time_ < var_186_17 + var_186_18 + arg_186_0 then
				arg_183_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 116331045
		arg_187_1.duration_ = 6.897999999999

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play116331046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.var_.oldValueTypewriter = arg_187_1.fswtw_.percent

				arg_187_1:ShowNextGo(false)
			end

			local var_190_1 = 33
			local var_190_2 = 2.2
			local var_190_3 = arg_187_1:GetWordFromCfg(116331042)
			local var_190_4 = arg_187_1:FormatText(var_190_3.content)
			local var_190_5, var_190_6 = arg_187_1:GetPercentByPara(var_190_4, 4)

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				local var_190_7 = var_190_1 <= 0 and var_190_2 or var_190_2 * ((var_190_6 - arg_187_1.typewritterCharCountI18N) / var_190_1)

				if var_190_7 > 0 and var_190_2 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end
			end

			local var_190_8 = 2.2
			local var_190_9 = math.max(var_190_8, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_0) / var_190_9

				arg_187_1.fswtw_.percent = Mathf.Lerp(arg_187_1.var_.oldValueTypewriter, var_190_5, var_190_10)
				arg_187_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_187_1.fswtw_:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_9 and arg_187_1.time_ < var_190_0 + var_190_9 + arg_190_0 then
				arg_187_1.fswtw_.percent = var_190_5

				arg_187_1.fswtw_:SetDirty()
				arg_187_1:ShowNextGo(true)

				arg_187_1.typewritterCharCountI18N = var_190_6
			end

			local var_190_11 = 0
			local var_190_12 = 6.898
			local var_190_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331045", "story_v_out_116331.awb") / 1000

			if var_190_13 > 0 and var_190_12 < var_190_13 and var_190_13 + var_190_11 > arg_187_1.duration_ then
				local var_190_14 = var_190_13

				arg_187_1.duration_ = var_190_13 + var_190_11
			end

			if var_190_11 < arg_187_1.time_ and arg_187_1.time_ <= var_190_11 + arg_190_0 then
				local var_190_15 = "play"
				local var_190_16 = "voice"

				arg_187_1:AudioAction(var_190_15, var_190_16, "story_v_out_116331", "116331045", "story_v_out_116331.awb")
			end

			local var_190_17 = 0

			if var_190_17 < arg_187_1.time_ and arg_187_1.time_ <= var_190_17 + arg_190_0 then
				arg_187_1.allBtn_.enabled = false
			end

			local var_190_18 = 2.2

			if arg_187_1.time_ >= var_190_17 + var_190_18 and arg_187_1.time_ < var_190_17 + var_190_18 + arg_190_0 then
				arg_187_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 116331046
		arg_191_1.duration_ = 4.762999999999

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play116331047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.var_.oldValueTypewriter = arg_191_1.fswtw_.percent

				arg_191_1:ShowNextGo(false)
			end

			local var_194_1 = 30
			local var_194_2 = 2
			local var_194_3 = arg_191_1:GetWordFromCfg(116331042)
			local var_194_4 = arg_191_1:FormatText(var_194_3.content)
			local var_194_5, var_194_6 = arg_191_1:GetPercentByPara(var_194_4, 5)

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0

				local var_194_7 = var_194_1 <= 0 and var_194_2 or var_194_2 * ((var_194_6 - arg_191_1.typewritterCharCountI18N) / var_194_1)

				if var_194_7 > 0 and var_194_2 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end
			end

			local var_194_8 = 2
			local var_194_9 = math.max(var_194_8, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_0) / var_194_9

				arg_191_1.fswtw_.percent = Mathf.Lerp(arg_191_1.var_.oldValueTypewriter, var_194_5, var_194_10)
				arg_191_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_191_1.fswtw_:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_9 and arg_191_1.time_ < var_194_0 + var_194_9 + arg_194_0 then
				arg_191_1.fswtw_.percent = var_194_5

				arg_191_1.fswtw_:SetDirty()
				arg_191_1:ShowNextGo(true)

				arg_191_1.typewritterCharCountI18N = var_194_6
			end

			local var_194_11 = 0
			local var_194_12 = 4.763
			local var_194_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331046", "story_v_out_116331.awb") / 1000

			if var_194_13 > 0 and var_194_12 < var_194_13 and var_194_13 + var_194_11 > arg_191_1.duration_ then
				local var_194_14 = var_194_13

				arg_191_1.duration_ = var_194_13 + var_194_11
			end

			if var_194_11 < arg_191_1.time_ and arg_191_1.time_ <= var_194_11 + arg_194_0 then
				local var_194_15 = "play"
				local var_194_16 = "voice"

				arg_191_1:AudioAction(var_194_15, var_194_16, "story_v_out_116331", "116331046", "story_v_out_116331.awb")
			end

			local var_194_17 = 0

			if var_194_17 < arg_191_1.time_ and arg_191_1.time_ <= var_194_17 + arg_194_0 then
				arg_191_1.allBtn_.enabled = false
			end

			local var_194_18 = 2

			if arg_191_1.time_ >= var_194_17 + var_194_18 and arg_191_1.time_ < var_194_17 + var_194_18 + arg_194_0 then
				arg_191_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 116331047
		arg_195_1.duration_ = 3.598999999999

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play116331048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.var_.oldValueTypewriter = arg_195_1.fswtw_.percent

				arg_195_1:ShowNextGo(false)
			end

			local var_198_1 = 12
			local var_198_2 = 0.8
			local var_198_3 = arg_195_1:GetWordFromCfg(116331042)
			local var_198_4 = arg_195_1:FormatText(var_198_3.content)
			local var_198_5, var_198_6 = arg_195_1:GetPercentByPara(var_198_4, 6)

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				local var_198_7 = var_198_1 <= 0 and var_198_2 or var_198_2 * ((var_198_6 - arg_195_1.typewritterCharCountI18N) / var_198_1)

				if var_198_7 > 0 and var_198_2 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end
			end

			local var_198_8 = 0.8
			local var_198_9 = math.max(var_198_8, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_0) / var_198_9

				arg_195_1.fswtw_.percent = Mathf.Lerp(arg_195_1.var_.oldValueTypewriter, var_198_5, var_198_10)
				arg_195_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_195_1.fswtw_:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_9 and arg_195_1.time_ < var_198_0 + var_198_9 + arg_198_0 then
				arg_195_1.fswtw_.percent = var_198_5

				arg_195_1.fswtw_:SetDirty()
				arg_195_1:ShowNextGo(true)

				arg_195_1.typewritterCharCountI18N = var_198_6
			end

			local var_198_11 = 0
			local var_198_12 = 3.599
			local var_198_13 = manager.audio:GetVoiceLength("story_v_out_116331", "116331047", "story_v_out_116331.awb") / 1000

			if var_198_13 > 0 and var_198_12 < var_198_13 and var_198_13 + var_198_11 > arg_195_1.duration_ then
				local var_198_14 = var_198_13

				arg_195_1.duration_ = var_198_13 + var_198_11
			end

			if var_198_11 < arg_195_1.time_ and arg_195_1.time_ <= var_198_11 + arg_198_0 then
				local var_198_15 = "play"
				local var_198_16 = "voice"

				arg_195_1:AudioAction(var_198_15, var_198_16, "story_v_out_116331", "116331047", "story_v_out_116331.awb")
			end

			local var_198_17 = 0

			if var_198_17 < arg_195_1.time_ and arg_195_1.time_ <= var_198_17 + arg_198_0 then
				arg_195_1.allBtn_.enabled = false
			end

			local var_198_18 = 0.8

			if arg_195_1.time_ >= var_198_17 + var_198_18 and arg_195_1.time_ < var_198_17 + var_198_18 + arg_198_0 then
				arg_195_1.allBtn_.enabled = true
			end
		end
	end,
	Play116331048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 116331048
		arg_199_1.duration_ = 9.916

		local var_199_0 = {
			zh = 9.383,
			ja = 9.916
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
				arg_199_0:Play116331049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = "STblack"

			if arg_199_1.bgs_[var_202_0] == nil then
				local var_202_1 = Object.Instantiate(arg_199_1.paintGo_)

				var_202_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_202_0)
				var_202_1.name = var_202_0
				var_202_1.transform.parent = arg_199_1.stage_.transform
				var_202_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_199_1.bgs_[var_202_0] = var_202_1
			end

			local var_202_2 = 2

			if var_202_2 < arg_199_1.time_ and arg_199_1.time_ <= var_202_2 + arg_202_0 then
				local var_202_3 = manager.ui.mainCamera.transform.localPosition
				local var_202_4 = Vector3.New(0, 0, 10) + Vector3.New(var_202_3.x, var_202_3.y, 0)
				local var_202_5 = arg_199_1.bgs_.STblack

				var_202_5.transform.localPosition = var_202_4
				var_202_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_202_6 = var_202_5:GetComponent("SpriteRenderer")

				if var_202_6 and var_202_6.sprite then
					local var_202_7 = (var_202_5.transform.localPosition - var_202_3).z
					local var_202_8 = manager.ui.mainCameraCom_
					local var_202_9 = 2 * var_202_7 * Mathf.Tan(var_202_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_202_10 = var_202_9 * var_202_8.aspect
					local var_202_11 = var_202_6.sprite.bounds.size.x
					local var_202_12 = var_202_6.sprite.bounds.size.y
					local var_202_13 = var_202_10 / var_202_11
					local var_202_14 = var_202_9 / var_202_12
					local var_202_15 = var_202_14 < var_202_13 and var_202_13 or var_202_14

					var_202_5.transform.localScale = Vector3.New(var_202_15, var_202_15, 0)
				end

				for iter_202_0, iter_202_1 in pairs(arg_199_1.bgs_) do
					if iter_202_0 ~= "STblack" then
						iter_202_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_202_16 = 2

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 then
				arg_199_1.fswbg_:SetActive(false)
				arg_199_1.dialog_:SetActive(false)
				arg_199_1:ShowNextGo(false)
			end

			local var_202_17 = 0

			if var_202_17 < arg_199_1.time_ and arg_199_1.time_ <= var_202_17 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_18 = 2

			if var_202_17 <= arg_199_1.time_ and arg_199_1.time_ < var_202_17 + var_202_18 then
				local var_202_19 = (arg_199_1.time_ - var_202_17) / var_202_18
				local var_202_20 = Color.New(0, 0, 0)

				var_202_20.a = Mathf.Lerp(0, 1, var_202_19)
				arg_199_1.mask_.color = var_202_20
			end

			if arg_199_1.time_ >= var_202_17 + var_202_18 and arg_199_1.time_ < var_202_17 + var_202_18 + arg_202_0 then
				local var_202_21 = Color.New(0, 0, 0)

				var_202_21.a = 1
				arg_199_1.mask_.color = var_202_21
			end

			local var_202_22 = 2

			if var_202_22 < arg_199_1.time_ and arg_199_1.time_ <= var_202_22 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_23 = 2

			if var_202_22 <= arg_199_1.time_ and arg_199_1.time_ < var_202_22 + var_202_23 then
				local var_202_24 = (arg_199_1.time_ - var_202_22) / var_202_23
				local var_202_25 = Color.New(0, 0, 0)

				var_202_25.a = Mathf.Lerp(1, 0, var_202_24)
				arg_199_1.mask_.color = var_202_25
			end

			if arg_199_1.time_ >= var_202_22 + var_202_23 and arg_199_1.time_ < var_202_22 + var_202_23 + arg_202_0 then
				local var_202_26 = Color.New(0, 0, 0)
				local var_202_27 = 0

				arg_199_1.mask_.enabled = false
				var_202_26.a = var_202_27
				arg_199_1.mask_.color = var_202_26
			end

			if arg_199_1.frameCnt_ <= 1 then
				arg_199_1.dialog_:SetActive(false)
			end

			local var_202_28 = 3.55
			local var_202_29 = 0.45

			if var_202_28 < arg_199_1.time_ and arg_199_1.time_ <= var_202_28 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0

				arg_199_1.dialog_:SetActive(true)

				local var_202_30 = LeanTween.value(arg_199_1.dialog_, 0, 1, 0.3)

				var_202_30:setOnUpdate(LuaHelper.FloatAction(function(arg_203_0)
					arg_199_1.dialogCg_.alpha = arg_203_0
				end))
				var_202_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_199_1.dialog_)
					var_202_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_199_1.duration_ = arg_199_1.duration_ + 0.3

				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_31 = arg_199_1:FormatText(StoryNameCfg[328].name)

				arg_199_1.leftNameTxt_.text = var_202_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, true)
				arg_199_1.iconController_:SetSelectedState("hero")

				arg_199_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_32 = arg_199_1:GetWordFromCfg(116331048)
				local var_202_33 = arg_199_1:FormatText(var_202_32.content)

				arg_199_1.text_.text = var_202_33

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_34 = 18
				local var_202_35 = utf8.len(var_202_33)
				local var_202_36 = var_202_34 <= 0 and var_202_29 or var_202_29 * (var_202_35 / var_202_34)

				if var_202_36 > 0 and var_202_29 < var_202_36 then
					arg_199_1.talkMaxDuration = var_202_36
					var_202_28 = var_202_28 + 0.3

					if var_202_36 + var_202_28 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_36 + var_202_28
					end
				end

				arg_199_1.text_.text = var_202_33
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331048", "story_v_out_116331.awb") ~= 0 then
					local var_202_37 = manager.audio:GetVoiceLength("story_v_out_116331", "116331048", "story_v_out_116331.awb") / 1000

					if var_202_37 + var_202_28 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_37 + var_202_28
					end

					if var_202_32.prefab_name ~= "" and arg_199_1.actors_[var_202_32.prefab_name] ~= nil then
						local var_202_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_32.prefab_name].transform, "story_v_out_116331", "116331048", "story_v_out_116331.awb")

						arg_199_1:RecordAudio("116331048", var_202_38)
						arg_199_1:RecordAudio("116331048", var_202_38)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_116331", "116331048", "story_v_out_116331.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_116331", "116331048", "story_v_out_116331.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_39 = var_202_28 + 0.3
			local var_202_40 = math.max(var_202_29, arg_199_1.talkMaxDuration)

			if var_202_39 <= arg_199_1.time_ and arg_199_1.time_ < var_202_39 + var_202_40 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_39) / var_202_40

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_39 + var_202_40 and arg_199_1.time_ < var_202_39 + var_202_40 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play116331049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 116331049
		arg_205_1.duration_ = 10.2

		local var_205_0 = {
			zh = 10.2,
			ja = 7.866
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
				arg_205_0:Play116331050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.575

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[328].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(116331049)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331049", "story_v_out_116331.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_116331", "116331049", "story_v_out_116331.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_116331", "116331049", "story_v_out_116331.awb")

						arg_205_1:RecordAudio("116331049", var_208_9)
						arg_205_1:RecordAudio("116331049", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_116331", "116331049", "story_v_out_116331.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_116331", "116331049", "story_v_out_116331.awb")
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
	Play116331050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 116331050
		arg_209_1.duration_ = 10

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play116331051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = "ST03a"

			if arg_209_1.bgs_[var_212_0] == nil then
				local var_212_1 = Object.Instantiate(arg_209_1.paintGo_)

				var_212_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_212_0)
				var_212_1.name = var_212_0
				var_212_1.transform.parent = arg_209_1.stage_.transform
				var_212_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_209_1.bgs_[var_212_0] = var_212_1
			end

			local var_212_2 = 0

			if var_212_2 < arg_209_1.time_ and arg_209_1.time_ <= var_212_2 + arg_212_0 then
				local var_212_3 = manager.ui.mainCamera.transform.localPosition
				local var_212_4 = Vector3.New(0, 0, 10) + Vector3.New(var_212_3.x, var_212_3.y, 0)
				local var_212_5 = arg_209_1.bgs_.ST03a

				var_212_5.transform.localPosition = var_212_4
				var_212_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_212_6 = var_212_5:GetComponent("SpriteRenderer")

				if var_212_6 and var_212_6.sprite then
					local var_212_7 = (var_212_5.transform.localPosition - var_212_3).z
					local var_212_8 = manager.ui.mainCameraCom_
					local var_212_9 = 2 * var_212_7 * Mathf.Tan(var_212_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_212_10 = var_212_9 * var_212_8.aspect
					local var_212_11 = var_212_6.sprite.bounds.size.x
					local var_212_12 = var_212_6.sprite.bounds.size.y
					local var_212_13 = var_212_10 / var_212_11
					local var_212_14 = var_212_9 / var_212_12
					local var_212_15 = var_212_14 < var_212_13 and var_212_13 or var_212_14

					var_212_5.transform.localScale = Vector3.New(var_212_15, var_212_15, 0)
				end

				for iter_212_0, iter_212_1 in pairs(arg_209_1.bgs_) do
					if iter_212_0 ~= "ST03a" then
						iter_212_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_212_16 = 0

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 then
				arg_209_1.mask_.enabled = true
				arg_209_1.mask_.raycastTarget = true

				arg_209_1:SetGaussion(false)
			end

			local var_212_17 = 5

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_17 then
				local var_212_18 = (arg_209_1.time_ - var_212_16) / var_212_17
				local var_212_19 = Color.New(0, 0, 0)

				var_212_19.a = Mathf.Lerp(1, 0, var_212_18)
				arg_209_1.mask_.color = var_212_19
			end

			if arg_209_1.time_ >= var_212_16 + var_212_17 and arg_209_1.time_ < var_212_16 + var_212_17 + arg_212_0 then
				local var_212_20 = Color.New(0, 0, 0)
				local var_212_21 = 0

				arg_209_1.mask_.enabled = false
				var_212_20.a = var_212_21
				arg_209_1.mask_.color = var_212_20
			end

			local var_212_22 = arg_209_1.bgs_.ST03a.transform
			local var_212_23 = 0

			if var_212_23 < arg_209_1.time_ and arg_209_1.time_ <= var_212_23 + arg_212_0 then
				arg_209_1.var_.moveOldPosST03a = var_212_22.localPosition
			end

			local var_212_24 = 0.001

			if var_212_23 <= arg_209_1.time_ and arg_209_1.time_ < var_212_23 + var_212_24 then
				local var_212_25 = (arg_209_1.time_ - var_212_23) / var_212_24
				local var_212_26 = Vector3.New(0, 1, 9)

				var_212_22.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPosST03a, var_212_26, var_212_25)
			end

			if arg_209_1.time_ >= var_212_23 + var_212_24 and arg_209_1.time_ < var_212_23 + var_212_24 + arg_212_0 then
				var_212_22.localPosition = Vector3.New(0, 1, 9)
			end

			local var_212_27 = arg_209_1.bgs_.ST03a.transform
			local var_212_28 = 0.016666666666667

			if var_212_28 < arg_209_1.time_ and arg_209_1.time_ <= var_212_28 + arg_212_0 then
				arg_209_1.var_.moveOldPosST03a = var_212_27.localPosition
			end

			local var_212_29 = 6

			if var_212_28 <= arg_209_1.time_ and arg_209_1.time_ < var_212_28 + var_212_29 then
				local var_212_30 = (arg_209_1.time_ - var_212_28) / var_212_29
				local var_212_31 = Vector3.New(0, 1, 10)

				var_212_27.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPosST03a, var_212_31, var_212_30)
			end

			if arg_209_1.time_ >= var_212_28 + var_212_29 and arg_209_1.time_ < var_212_28 + var_212_29 + arg_212_0 then
				var_212_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_212_32 = 5

			if var_212_32 < arg_209_1.time_ and arg_209_1.time_ <= var_212_32 + arg_212_0 then
				arg_209_1.allBtn_.enabled = false
			end

			local var_212_33 = 1.01666666666667

			if arg_209_1.time_ >= var_212_32 + var_212_33 and arg_209_1.time_ < var_212_32 + var_212_33 + arg_212_0 then
				arg_209_1.allBtn_.enabled = true
			end

			if arg_209_1.frameCnt_ <= 1 then
				arg_209_1.dialog_:SetActive(false)
			end

			local var_212_34 = 5
			local var_212_35 = 0.95

			if var_212_34 < arg_209_1.time_ and arg_209_1.time_ <= var_212_34 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0

				arg_209_1.dialog_:SetActive(true)

				local var_212_36 = LeanTween.value(arg_209_1.dialog_, 0, 1, 0.3)

				var_212_36:setOnUpdate(LuaHelper.FloatAction(function(arg_213_0)
					arg_209_1.dialogCg_.alpha = arg_213_0
				end))
				var_212_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_209_1.dialog_)
					var_212_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_209_1.duration_ = arg_209_1.duration_ + 0.3

				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_37 = arg_209_1:GetWordFromCfg(116331050)
				local var_212_38 = arg_209_1:FormatText(var_212_37.content)

				arg_209_1.text_.text = var_212_38

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_39 = 38
				local var_212_40 = utf8.len(var_212_38)
				local var_212_41 = var_212_39 <= 0 and var_212_35 or var_212_35 * (var_212_40 / var_212_39)

				if var_212_41 > 0 and var_212_35 < var_212_41 then
					arg_209_1.talkMaxDuration = var_212_41
					var_212_34 = var_212_34 + 0.3

					if var_212_41 + var_212_34 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_41 + var_212_34
					end
				end

				arg_209_1.text_.text = var_212_38
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_42 = var_212_34 + 0.3
			local var_212_43 = math.max(var_212_35, arg_209_1.talkMaxDuration)

			if var_212_42 <= arg_209_1.time_ and arg_209_1.time_ < var_212_42 + var_212_43 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_42) / var_212_43

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_42 + var_212_43 and arg_209_1.time_ < var_212_42 + var_212_43 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play116331051 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 116331051
		arg_215_1.duration_ = 6.966

		local var_215_0 = {
			zh = 4.266,
			ja = 6.966
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
			arg_215_1.auto_ = false
		end

		function arg_215_1.playNext_(arg_217_0)
			arg_215_1.onStoryFinished_()
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10032ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos10032ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(0, -1.1, -5.9)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10032ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = 0

			if var_218_9 < arg_215_1.time_ and arg_215_1.time_ <= var_218_9 + arg_218_0 then
				arg_215_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action8_1")
			end

			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1:PlayTimeline("10032ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_218_11 = arg_215_1.actors_["10032ui_story"]
			local var_218_12 = 0

			if var_218_12 < arg_215_1.time_ and arg_215_1.time_ <= var_218_12 + arg_218_0 and arg_215_1.var_.characterEffect10032ui_story == nil then
				arg_215_1.var_.characterEffect10032ui_story = var_218_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_13 = 0.2

			if var_218_12 <= arg_215_1.time_ and arg_215_1.time_ < var_218_12 + var_218_13 then
				local var_218_14 = (arg_215_1.time_ - var_218_12) / var_218_13

				if arg_215_1.var_.characterEffect10032ui_story then
					arg_215_1.var_.characterEffect10032ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_12 + var_218_13 and arg_215_1.time_ < var_218_12 + var_218_13 + arg_218_0 and arg_215_1.var_.characterEffect10032ui_story then
				arg_215_1.var_.characterEffect10032ui_story.fillFlat = false
			end

			local var_218_15 = 0
			local var_218_16 = 0.325

			if var_218_15 < arg_215_1.time_ and arg_215_1.time_ <= var_218_15 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_17 = arg_215_1:FormatText(StoryNameCfg[328].name)

				arg_215_1.leftNameTxt_.text = var_218_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_18 = arg_215_1:GetWordFromCfg(116331051)
				local var_218_19 = arg_215_1:FormatText(var_218_18.content)

				arg_215_1.text_.text = var_218_19

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_20 = 13
				local var_218_21 = utf8.len(var_218_19)
				local var_218_22 = var_218_20 <= 0 and var_218_16 or var_218_16 * (var_218_21 / var_218_20)

				if var_218_22 > 0 and var_218_16 < var_218_22 then
					arg_215_1.talkMaxDuration = var_218_22

					if var_218_22 + var_218_15 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_22 + var_218_15
					end
				end

				arg_215_1.text_.text = var_218_19
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116331", "116331051", "story_v_out_116331.awb") ~= 0 then
					local var_218_23 = manager.audio:GetVoiceLength("story_v_out_116331", "116331051", "story_v_out_116331.awb") / 1000

					if var_218_23 + var_218_15 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_23 + var_218_15
					end

					if var_218_18.prefab_name ~= "" and arg_215_1.actors_[var_218_18.prefab_name] ~= nil then
						local var_218_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_18.prefab_name].transform, "story_v_out_116331", "116331051", "story_v_out_116331.awb")

						arg_215_1:RecordAudio("116331051", var_218_24)
						arg_215_1:RecordAudio("116331051", var_218_24)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_116331", "116331051", "story_v_out_116331.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_116331", "116331051", "story_v_out_116331.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_25 = math.max(var_218_16, arg_215_1.talkMaxDuration)

			if var_218_15 <= arg_215_1.time_ and arg_215_1.time_ < var_218_15 + var_218_25 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_15) / var_218_25

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_15 + var_218_25 and arg_215_1.time_ < var_218_15 + var_218_25 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03a"
	},
	voices = {
		"story_v_out_116331.awb"
	}
}
