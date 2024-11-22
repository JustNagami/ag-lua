return {
	Play318082001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 318082001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play318082002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K13f"

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
				local var_4_5 = arg_1_1.bgs_.K13f

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
					if iter_4_0 ~= "K13f" then
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
			local var_4_23 = 0.433333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.26666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 1.65

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

				local var_4_33 = arg_1_1:GetWordFromCfg(318082001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 66
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
	Play318082002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 318082002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play318082003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.125

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_2 = arg_7_1:GetWordFromCfg(318082002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 45
				local var_10_5 = utf8.len(var_10_3)
				local var_10_6 = var_10_4 <= 0 and var_10_1 or var_10_1 * (var_10_5 / var_10_4)

				if var_10_6 > 0 and var_10_1 < var_10_6 then
					arg_7_1.talkMaxDuration = var_10_6

					if var_10_6 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_6 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_3
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_7 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_7 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_7

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_7 and arg_7_1.time_ < var_10_0 + var_10_7 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play318082003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 318082003
		arg_11_1.duration_ = 10.433

		local var_11_0 = {
			zh = 5.633,
			ja = 10.433
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
				arg_11_0:Play318082004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10066ui_story"

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

			local var_14_4 = arg_11_1.actors_["10066ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos10066ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -0.99, -5.83)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10066ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["10066ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect10066ui_story == nil then
				arg_11_1.var_.characterEffect10066ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.200000002980232

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect10066ui_story then
					arg_11_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect10066ui_story then
				arg_11_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_1")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_14_19 = 0
			local var_14_20 = 0.55

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[640].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(318082003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082003", "story_v_out_318082.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_318082", "318082003", "story_v_out_318082.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_318082", "318082003", "story_v_out_318082.awb")

						arg_11_1:RecordAudio("318082003", var_14_28)
						arg_11_1:RecordAudio("318082003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_318082", "318082003", "story_v_out_318082.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_318082", "318082003", "story_v_out_318082.awb")
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
	Play318082004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 318082004
		arg_15_1.duration_ = 0.999999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"

			SetActive(arg_15_1.choicesGo_, true)

			for iter_16_0, iter_16_1 in ipairs(arg_15_1.choices_) do
				local var_16_0 = iter_16_0 <= 1

				SetActive(iter_16_1.go, var_16_0)
			end

			arg_15_1.choices_[1].txt.text = arg_15_1:FormatText(StoryChoiceCfg[642].name)
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play318082005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10066ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect10066ui_story == nil then
				arg_15_1.var_.characterEffect10066ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect10066ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10066ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect10066ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10066ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.allBtn_.enabled = false
			end

			local var_18_7 = 0.5

			if arg_15_1.time_ >= var_18_6 + var_18_7 and arg_15_1.time_ < var_18_6 + var_18_7 + arg_18_0 then
				arg_15_1.allBtn_.enabled = true
			end
		end
	end,
	Play318082005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 318082005
		arg_19_1.duration_ = 11.033

		local var_19_0 = {
			zh = 9.666,
			ja = 11.033
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
				arg_19_0:Play318082006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10066ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos10066ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, -0.99, -5.83)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10066ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["10066ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect10066ui_story == nil then
				arg_19_1.var_.characterEffect10066ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect10066ui_story then
					arg_19_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect10066ui_story then
				arg_19_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_2")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_22_15 = 0
			local var_22_16 = 1

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_17 = arg_19_1:FormatText(StoryNameCfg[640].name)

				arg_19_1.leftNameTxt_.text = var_22_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_18 = arg_19_1:GetWordFromCfg(318082005)
				local var_22_19 = arg_19_1:FormatText(var_22_18.content)

				arg_19_1.text_.text = var_22_19

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_20 = 40
				local var_22_21 = utf8.len(var_22_19)
				local var_22_22 = var_22_20 <= 0 and var_22_16 or var_22_16 * (var_22_21 / var_22_20)

				if var_22_22 > 0 and var_22_16 < var_22_22 then
					arg_19_1.talkMaxDuration = var_22_22

					if var_22_22 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_22 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_19
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082005", "story_v_out_318082.awb") ~= 0 then
					local var_22_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082005", "story_v_out_318082.awb") / 1000

					if var_22_23 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_15
					end

					if var_22_18.prefab_name ~= "" and arg_19_1.actors_[var_22_18.prefab_name] ~= nil then
						local var_22_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_18.prefab_name].transform, "story_v_out_318082", "318082005", "story_v_out_318082.awb")

						arg_19_1:RecordAudio("318082005", var_22_24)
						arg_19_1:RecordAudio("318082005", var_22_24)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_318082", "318082005", "story_v_out_318082.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_318082", "318082005", "story_v_out_318082.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_25 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_25 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_25

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_25 and arg_19_1.time_ < var_22_15 + var_22_25 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play318082006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 318082006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play318082007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10066ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10066ui_story == nil then
				arg_23_1.var_.characterEffect10066ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10066ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10066ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10066ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10066ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.475

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(318082006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 19
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_14 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_14 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_14

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_14 and arg_23_1.time_ < var_26_6 + var_26_14 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play318082007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 318082007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play318082008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.45

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

				local var_30_3 = arg_27_1:GetWordFromCfg(318082007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 18
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
	Play318082008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 318082008
		arg_31_1.duration_ = 8.533

		local var_31_0 = {
			zh = 5.8,
			ja = 8.533
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
				arg_31_0:Play318082009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "1015ui_story"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("Char/" .. var_34_0), arg_31_1.stage_.transform)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_0] = var_34_1

				local var_34_2 = var_34_1:GetComponentInChildren(typeof(CharacterEffect))

				var_34_2.enabled = true

				local var_34_3 = GameObjectTools.GetOrAddComponent(var_34_1, typeof(DynamicBoneHelper))

				if var_34_3 then
					var_34_3:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_2.transform, false)

				arg_31_1.var_[var_34_0 .. "Animator"] = var_34_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_0 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_0 .. "LipSync"] = var_34_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_4 = arg_31_1.actors_["1015ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos1015ui_story = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0.7, -1.15, -6.2)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1015ui_story, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = arg_31_1.actors_["1015ui_story"]
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 and arg_31_1.var_.characterEffect1015ui_story == nil then
				arg_31_1.var_.characterEffect1015ui_story = var_34_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_15 = 0.200000002980232

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15

				if arg_31_1.var_.characterEffect1015ui_story then
					arg_31_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 and arg_31_1.var_.characterEffect1015ui_story then
				arg_31_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_34_17 = 0

			if var_34_17 < arg_31_1.time_ and arg_31_1.time_ <= var_34_17 + arg_34_0 then
				arg_31_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_34_18 = 0

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_19 = arg_31_1.actors_["10066ui_story"].transform
			local var_34_20 = 0

			if var_34_20 < arg_31_1.time_ and arg_31_1.time_ <= var_34_20 + arg_34_0 then
				arg_31_1.var_.moveOldPos10066ui_story = var_34_19.localPosition
			end

			local var_34_21 = 0.001

			if var_34_20 <= arg_31_1.time_ and arg_31_1.time_ < var_34_20 + var_34_21 then
				local var_34_22 = (arg_31_1.time_ - var_34_20) / var_34_21
				local var_34_23 = Vector3.New(-0.7, -0.99, -5.83)

				var_34_19.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10066ui_story, var_34_23, var_34_22)

				local var_34_24 = manager.ui.mainCamera.transform.position - var_34_19.position

				var_34_19.forward = Vector3.New(var_34_24.x, var_34_24.y, var_34_24.z)

				local var_34_25 = var_34_19.localEulerAngles

				var_34_25.z = 0
				var_34_25.x = 0
				var_34_19.localEulerAngles = var_34_25
			end

			if arg_31_1.time_ >= var_34_20 + var_34_21 and arg_31_1.time_ < var_34_20 + var_34_21 + arg_34_0 then
				var_34_19.localPosition = Vector3.New(-0.7, -0.99, -5.83)

				local var_34_26 = manager.ui.mainCamera.transform.position - var_34_19.position

				var_34_19.forward = Vector3.New(var_34_26.x, var_34_26.y, var_34_26.z)

				local var_34_27 = var_34_19.localEulerAngles

				var_34_27.z = 0
				var_34_27.x = 0
				var_34_19.localEulerAngles = var_34_27
			end

			local var_34_28 = 0
			local var_34_29 = 0.65

			if var_34_28 < arg_31_1.time_ and arg_31_1.time_ <= var_34_28 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_30 = arg_31_1:FormatText(StoryNameCfg[479].name)

				arg_31_1.leftNameTxt_.text = var_34_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_31 = arg_31_1:GetWordFromCfg(318082008)
				local var_34_32 = arg_31_1:FormatText(var_34_31.content)

				arg_31_1.text_.text = var_34_32

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_33 = 26
				local var_34_34 = utf8.len(var_34_32)
				local var_34_35 = var_34_33 <= 0 and var_34_29 or var_34_29 * (var_34_34 / var_34_33)

				if var_34_35 > 0 and var_34_29 < var_34_35 then
					arg_31_1.talkMaxDuration = var_34_35

					if var_34_35 + var_34_28 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_35 + var_34_28
					end
				end

				arg_31_1.text_.text = var_34_32
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082008", "story_v_out_318082.awb") ~= 0 then
					local var_34_36 = manager.audio:GetVoiceLength("story_v_out_318082", "318082008", "story_v_out_318082.awb") / 1000

					if var_34_36 + var_34_28 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_36 + var_34_28
					end

					if var_34_31.prefab_name ~= "" and arg_31_1.actors_[var_34_31.prefab_name] ~= nil then
						local var_34_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_31.prefab_name].transform, "story_v_out_318082", "318082008", "story_v_out_318082.awb")

						arg_31_1:RecordAudio("318082008", var_34_37)
						arg_31_1:RecordAudio("318082008", var_34_37)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_318082", "318082008", "story_v_out_318082.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_318082", "318082008", "story_v_out_318082.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_38 = math.max(var_34_29, arg_31_1.talkMaxDuration)

			if var_34_28 <= arg_31_1.time_ and arg_31_1.time_ < var_34_28 + var_34_38 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_28) / var_34_38

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_28 + var_34_38 and arg_31_1.time_ < var_34_28 + var_34_38 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play318082009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 318082009
		arg_35_1.duration_ = 7

		local var_35_0 = {
			zh = 4.3,
			ja = 7
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
				arg_35_0:Play318082010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "1199ui_story"

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

			local var_38_4 = arg_35_1.actors_["1199ui_story"].transform
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.var_.moveOldPos1199ui_story = var_38_4.localPosition
			end

			local var_38_6 = 0.001

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6
				local var_38_8 = Vector3.New(0, -1.08, -5.9)

				var_38_4.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1199ui_story, var_38_8, var_38_7)

				local var_38_9 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_9.x, var_38_9.y, var_38_9.z)

				local var_38_10 = var_38_4.localEulerAngles

				var_38_10.z = 0
				var_38_10.x = 0
				var_38_4.localEulerAngles = var_38_10
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 then
				var_38_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_4.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_4.localEulerAngles = var_38_12
			end

			local var_38_13 = arg_35_1.actors_["1199ui_story"]
			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 and arg_35_1.var_.characterEffect1199ui_story == nil then
				arg_35_1.var_.characterEffect1199ui_story = var_38_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_15 = 0.200000002980232

			if var_38_14 <= arg_35_1.time_ and arg_35_1.time_ < var_38_14 + var_38_15 then
				local var_38_16 = (arg_35_1.time_ - var_38_14) / var_38_15

				if arg_35_1.var_.characterEffect1199ui_story then
					arg_35_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_14 + var_38_15 and arg_35_1.time_ < var_38_14 + var_38_15 + arg_38_0 and arg_35_1.var_.characterEffect1199ui_story then
				arg_35_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_38_17 = 0

			if var_38_17 < arg_35_1.time_ and arg_35_1.time_ <= var_38_17 + arg_38_0 then
				arg_35_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action4_1")
			end

			local var_38_18 = 0

			if var_38_18 < arg_35_1.time_ and arg_35_1.time_ <= var_38_18 + arg_38_0 then
				arg_35_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_38_19 = arg_35_1.actors_["1015ui_story"].transform
			local var_38_20 = 0

			if var_38_20 < arg_35_1.time_ and arg_35_1.time_ <= var_38_20 + arg_38_0 then
				arg_35_1.var_.moveOldPos1015ui_story = var_38_19.localPosition
			end

			local var_38_21 = 0.001

			if var_38_20 <= arg_35_1.time_ and arg_35_1.time_ < var_38_20 + var_38_21 then
				local var_38_22 = (arg_35_1.time_ - var_38_20) / var_38_21
				local var_38_23 = Vector3.New(0, 100, 0)

				var_38_19.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1015ui_story, var_38_23, var_38_22)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_19.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_19.localEulerAngles = var_38_25
			end

			if arg_35_1.time_ >= var_38_20 + var_38_21 and arg_35_1.time_ < var_38_20 + var_38_21 + arg_38_0 then
				var_38_19.localPosition = Vector3.New(0, 100, 0)

				local var_38_26 = manager.ui.mainCamera.transform.position - var_38_19.position

				var_38_19.forward = Vector3.New(var_38_26.x, var_38_26.y, var_38_26.z)

				local var_38_27 = var_38_19.localEulerAngles

				var_38_27.z = 0
				var_38_27.x = 0
				var_38_19.localEulerAngles = var_38_27
			end

			local var_38_28 = arg_35_1.actors_["1015ui_story"]
			local var_38_29 = 0

			if var_38_29 < arg_35_1.time_ and arg_35_1.time_ <= var_38_29 + arg_38_0 and arg_35_1.var_.characterEffect1015ui_story == nil then
				arg_35_1.var_.characterEffect1015ui_story = var_38_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_30 = 0.200000002980232

			if var_38_29 <= arg_35_1.time_ and arg_35_1.time_ < var_38_29 + var_38_30 then
				local var_38_31 = (arg_35_1.time_ - var_38_29) / var_38_30

				if arg_35_1.var_.characterEffect1015ui_story then
					local var_38_32 = Mathf.Lerp(0, 0.5, var_38_31)

					arg_35_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1015ui_story.fillRatio = var_38_32
				end
			end

			if arg_35_1.time_ >= var_38_29 + var_38_30 and arg_35_1.time_ < var_38_29 + var_38_30 + arg_38_0 and arg_35_1.var_.characterEffect1015ui_story then
				local var_38_33 = 0.5

				arg_35_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1015ui_story.fillRatio = var_38_33
			end

			local var_38_34 = arg_35_1.actors_["10066ui_story"].transform
			local var_38_35 = 0

			if var_38_35 < arg_35_1.time_ and arg_35_1.time_ <= var_38_35 + arg_38_0 then
				arg_35_1.var_.moveOldPos10066ui_story = var_38_34.localPosition
			end

			local var_38_36 = 0.001

			if var_38_35 <= arg_35_1.time_ and arg_35_1.time_ < var_38_35 + var_38_36 then
				local var_38_37 = (arg_35_1.time_ - var_38_35) / var_38_36
				local var_38_38 = Vector3.New(0, 100, 0)

				var_38_34.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10066ui_story, var_38_38, var_38_37)

				local var_38_39 = manager.ui.mainCamera.transform.position - var_38_34.position

				var_38_34.forward = Vector3.New(var_38_39.x, var_38_39.y, var_38_39.z)

				local var_38_40 = var_38_34.localEulerAngles

				var_38_40.z = 0
				var_38_40.x = 0
				var_38_34.localEulerAngles = var_38_40
			end

			if arg_35_1.time_ >= var_38_35 + var_38_36 and arg_35_1.time_ < var_38_35 + var_38_36 + arg_38_0 then
				var_38_34.localPosition = Vector3.New(0, 100, 0)

				local var_38_41 = manager.ui.mainCamera.transform.position - var_38_34.position

				var_38_34.forward = Vector3.New(var_38_41.x, var_38_41.y, var_38_41.z)

				local var_38_42 = var_38_34.localEulerAngles

				var_38_42.z = 0
				var_38_42.x = 0
				var_38_34.localEulerAngles = var_38_42
			end

			local var_38_43 = 0
			local var_38_44 = 0.65

			if var_38_43 < arg_35_1.time_ and arg_35_1.time_ <= var_38_43 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_45 = arg_35_1:FormatText(StoryNameCfg[84].name)

				arg_35_1.leftNameTxt_.text = var_38_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_46 = arg_35_1:GetWordFromCfg(318082009)
				local var_38_47 = arg_35_1:FormatText(var_38_46.content)

				arg_35_1.text_.text = var_38_47

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_48 = 26
				local var_38_49 = utf8.len(var_38_47)
				local var_38_50 = var_38_48 <= 0 and var_38_44 or var_38_44 * (var_38_49 / var_38_48)

				if var_38_50 > 0 and var_38_44 < var_38_50 then
					arg_35_1.talkMaxDuration = var_38_50

					if var_38_50 + var_38_43 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_50 + var_38_43
					end
				end

				arg_35_1.text_.text = var_38_47
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082009", "story_v_out_318082.awb") ~= 0 then
					local var_38_51 = manager.audio:GetVoiceLength("story_v_out_318082", "318082009", "story_v_out_318082.awb") / 1000

					if var_38_51 + var_38_43 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_51 + var_38_43
					end

					if var_38_46.prefab_name ~= "" and arg_35_1.actors_[var_38_46.prefab_name] ~= nil then
						local var_38_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_46.prefab_name].transform, "story_v_out_318082", "318082009", "story_v_out_318082.awb")

						arg_35_1:RecordAudio("318082009", var_38_52)
						arg_35_1:RecordAudio("318082009", var_38_52)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_318082", "318082009", "story_v_out_318082.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_318082", "318082009", "story_v_out_318082.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_53 = math.max(var_38_44, arg_35_1.talkMaxDuration)

			if var_38_43 <= arg_35_1.time_ and arg_35_1.time_ < var_38_43 + var_38_53 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_43) / var_38_53

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_43 + var_38_53 and arg_35_1.time_ < var_38_43 + var_38_53 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play318082010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 318082010
		arg_39_1.duration_ = 5.266

		local var_39_0 = {
			zh = 2.7,
			ja = 5.266
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
				arg_39_0:Play318082011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.375

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[84].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(318082010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 15
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082010", "story_v_out_318082.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082010", "story_v_out_318082.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_318082", "318082010", "story_v_out_318082.awb")

						arg_39_1:RecordAudio("318082010", var_42_9)
						arg_39_1:RecordAudio("318082010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_318082", "318082010", "story_v_out_318082.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_318082", "318082010", "story_v_out_318082.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_10 and arg_39_1.time_ < var_42_0 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play318082011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 318082011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play318082012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1199ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1199ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1199ui_story, var_46_4, var_46_3)

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

			local var_46_9 = arg_43_1.actors_["1199ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1199ui_story == nil then
				arg_43_1.var_.characterEffect1199ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1199ui_story then
					local var_46_13 = Mathf.Lerp(0, 0.5, var_46_12)

					arg_43_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1199ui_story.fillRatio = var_46_13
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1199ui_story then
				local var_46_14 = 0.5

				arg_43_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1199ui_story.fillRatio = var_46_14
			end

			local var_46_15 = 0
			local var_46_16 = 0.825

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_17 = arg_43_1:GetWordFromCfg(318082011)
				local var_46_18 = arg_43_1:FormatText(var_46_17.content)

				arg_43_1.text_.text = var_46_18

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_19 = 33
				local var_46_20 = utf8.len(var_46_18)
				local var_46_21 = var_46_19 <= 0 and var_46_16 or var_46_16 * (var_46_20 / var_46_19)

				if var_46_21 > 0 and var_46_16 < var_46_21 then
					arg_43_1.talkMaxDuration = var_46_21

					if var_46_21 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_18
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_22 and arg_43_1.time_ < var_46_15 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play318082012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 318082012
		arg_47_1.duration_ = 6.633

		local var_47_0 = {
			zh = 6.633,
			ja = 5.333
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
				arg_47_0:Play318082013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10066ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos10066ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(0, -0.99, -5.83)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10066ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["10066ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect10066ui_story == nil then
				arg_47_1.var_.characterEffect10066ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect10066ui_story then
					arg_47_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect10066ui_story then
				arg_47_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action6_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.6

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[640].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(318082012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 24
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_16 or var_50_16 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_16 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082012", "story_v_out_318082.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082012", "story_v_out_318082.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_318082", "318082012", "story_v_out_318082.awb")

						arg_47_1:RecordAudio("318082012", var_50_24)
						arg_47_1:RecordAudio("318082012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_318082", "318082012", "story_v_out_318082.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_318082", "318082012", "story_v_out_318082.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_25 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_25 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_25

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_25 and arg_47_1.time_ < var_50_15 + var_50_25 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play318082013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 318082013
		arg_51_1.duration_ = 3.033

		local var_51_0 = {
			zh = 3.033,
			ja = 1.999999999999
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
				arg_51_0:Play318082014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1015ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1015ui_story == nil then
				arg_51_1.var_.characterEffect1015ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1015ui_story then
					arg_51_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1015ui_story then
				arg_51_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["10066ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect10066ui_story == nil then
				arg_51_1.var_.characterEffect10066ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.200000002980232

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect10066ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_51_1.var_.characterEffect10066ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect10066ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_51_1.var_.characterEffect10066ui_story.fillRatio = var_54_9
			end

			local var_54_10 = arg_51_1.actors_["1015ui_story"].transform
			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.var_.moveOldPos1015ui_story = var_54_10.localPosition
			end

			local var_54_12 = 0.001

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_12 then
				local var_54_13 = (arg_51_1.time_ - var_54_11) / var_54_12
				local var_54_14 = Vector3.New(0.7, -1.15, -6.2)

				var_54_10.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1015ui_story, var_54_14, var_54_13)

				local var_54_15 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_15.x, var_54_15.y, var_54_15.z)

				local var_54_16 = var_54_10.localEulerAngles

				var_54_16.z = 0
				var_54_16.x = 0
				var_54_10.localEulerAngles = var_54_16
			end

			if arg_51_1.time_ >= var_54_11 + var_54_12 and arg_51_1.time_ < var_54_11 + var_54_12 + arg_54_0 then
				var_54_10.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_54_17 = manager.ui.mainCamera.transform.position - var_54_10.position

				var_54_10.forward = Vector3.New(var_54_17.x, var_54_17.y, var_54_17.z)

				local var_54_18 = var_54_10.localEulerAngles

				var_54_18.z = 0
				var_54_18.x = 0
				var_54_10.localEulerAngles = var_54_18
			end

			local var_54_19 = arg_51_1.actors_["10066ui_story"].transform
			local var_54_20 = 0

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.var_.moveOldPos10066ui_story = var_54_19.localPosition
			end

			local var_54_21 = 0.001

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_21 then
				local var_54_22 = (arg_51_1.time_ - var_54_20) / var_54_21
				local var_54_23 = Vector3.New(-0.7, -0.99, -5.83)

				var_54_19.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10066ui_story, var_54_23, var_54_22)

				local var_54_24 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_24.x, var_54_24.y, var_54_24.z)

				local var_54_25 = var_54_19.localEulerAngles

				var_54_25.z = 0
				var_54_25.x = 0
				var_54_19.localEulerAngles = var_54_25
			end

			if arg_51_1.time_ >= var_54_20 + var_54_21 and arg_51_1.time_ < var_54_20 + var_54_21 + arg_54_0 then
				var_54_19.localPosition = Vector3.New(-0.7, -0.99, -5.83)

				local var_54_26 = manager.ui.mainCamera.transform.position - var_54_19.position

				var_54_19.forward = Vector3.New(var_54_26.x, var_54_26.y, var_54_26.z)

				local var_54_27 = var_54_19.localEulerAngles

				var_54_27.z = 0
				var_54_27.x = 0
				var_54_19.localEulerAngles = var_54_27
			end

			local var_54_28 = 0

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_2")
			end

			local var_54_29 = 0
			local var_54_30 = 0.275

			if var_54_29 < arg_51_1.time_ and arg_51_1.time_ <= var_54_29 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_31 = arg_51_1:FormatText(StoryNameCfg[479].name)

				arg_51_1.leftNameTxt_.text = var_54_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_32 = arg_51_1:GetWordFromCfg(318082013)
				local var_54_33 = arg_51_1:FormatText(var_54_32.content)

				arg_51_1.text_.text = var_54_33

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_34 = 11
				local var_54_35 = utf8.len(var_54_33)
				local var_54_36 = var_54_34 <= 0 and var_54_30 or var_54_30 * (var_54_35 / var_54_34)

				if var_54_36 > 0 and var_54_30 < var_54_36 then
					arg_51_1.talkMaxDuration = var_54_36

					if var_54_36 + var_54_29 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_36 + var_54_29
					end
				end

				arg_51_1.text_.text = var_54_33
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082013", "story_v_out_318082.awb") ~= 0 then
					local var_54_37 = manager.audio:GetVoiceLength("story_v_out_318082", "318082013", "story_v_out_318082.awb") / 1000

					if var_54_37 + var_54_29 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_37 + var_54_29
					end

					if var_54_32.prefab_name ~= "" and arg_51_1.actors_[var_54_32.prefab_name] ~= nil then
						local var_54_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_32.prefab_name].transform, "story_v_out_318082", "318082013", "story_v_out_318082.awb")

						arg_51_1:RecordAudio("318082013", var_54_38)
						arg_51_1:RecordAudio("318082013", var_54_38)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_318082", "318082013", "story_v_out_318082.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_318082", "318082013", "story_v_out_318082.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_39 = math.max(var_54_30, arg_51_1.talkMaxDuration)

			if var_54_29 <= arg_51_1.time_ and arg_51_1.time_ < var_54_29 + var_54_39 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_29) / var_54_39

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_29 + var_54_39 and arg_51_1.time_ < var_54_29 + var_54_39 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play318082014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 318082014
		arg_55_1.duration_ = 8.366

		local var_55_0 = {
			zh = 5.966,
			ja = 8.366
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
				arg_55_0:Play318082015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.725

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[479].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(318082014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 29
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082014", "story_v_out_318082.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082014", "story_v_out_318082.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_318082", "318082014", "story_v_out_318082.awb")

						arg_55_1:RecordAudio("318082014", var_58_9)
						arg_55_1:RecordAudio("318082014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_318082", "318082014", "story_v_out_318082.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_318082", "318082014", "story_v_out_318082.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play318082015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 318082015
		arg_59_1.duration_ = 2.566

		local var_59_0 = {
			zh = 1.999999999999,
			ja = 2.566
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
				arg_59_0:Play318082016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10066ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story == nil then
				arg_59_1.var_.characterEffect10066ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect10066ui_story then
					arg_59_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect10066ui_story then
				arg_59_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_62_4 = 0

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action463")
			end

			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_62_6 = arg_59_1.actors_["1015ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story == nil then
				arg_59_1.var_.characterEffect1015ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.200000002980232

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect1015ui_story then
					local var_62_10 = Mathf.Lerp(0, 0.5, var_62_9)

					arg_59_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1015ui_story.fillRatio = var_62_10
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect1015ui_story then
				local var_62_11 = 0.5

				arg_59_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1015ui_story.fillRatio = var_62_11
			end

			local var_62_12 = 0
			local var_62_13 = 0.075

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[640].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(318082015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 3
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082015", "story_v_out_318082.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_318082", "318082015", "story_v_out_318082.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_318082", "318082015", "story_v_out_318082.awb")

						arg_59_1:RecordAudio("318082015", var_62_21)
						arg_59_1:RecordAudio("318082015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_318082", "318082015", "story_v_out_318082.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_318082", "318082015", "story_v_out_318082.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play318082016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 318082016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play318082017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10066ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story == nil then
				arg_63_1.var_.characterEffect10066ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect10066ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_63_1.var_.characterEffect10066ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10066ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_63_1.var_.characterEffect10066ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.675

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_8 = arg_63_1:GetWordFromCfg(318082016)
				local var_66_9 = arg_63_1:FormatText(var_66_8.content)

				arg_63_1.text_.text = var_66_9

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_10 = 27
				local var_66_11 = utf8.len(var_66_9)
				local var_66_12 = var_66_10 <= 0 and var_66_7 or var_66_7 * (var_66_11 / var_66_10)

				if var_66_12 > 0 and var_66_7 < var_66_12 then
					arg_63_1.talkMaxDuration = var_66_12

					if var_66_12 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_12 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_9
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_13 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_13 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_13

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_13 and arg_63_1.time_ < var_66_6 + var_66_13 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play318082017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 318082017
		arg_67_1.duration_ = 7.566

		local var_67_0 = {
			zh = 7.4,
			ja = 7.566
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
				arg_67_0:Play318082018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10066ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story == nil then
				arg_67_1.var_.characterEffect10066ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect10066ui_story then
					arg_67_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect10066ui_story then
				arg_67_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066actionlink/10066action437")
			end

			local var_70_6 = 0
			local var_70_7 = 0.925

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[640].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(318082017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082017", "story_v_out_318082.awb") ~= 0 then
					local var_70_14 = manager.audio:GetVoiceLength("story_v_out_318082", "318082017", "story_v_out_318082.awb") / 1000

					if var_70_14 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_14 + var_70_6
					end

					if var_70_9.prefab_name ~= "" and arg_67_1.actors_[var_70_9.prefab_name] ~= nil then
						local var_70_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_9.prefab_name].transform, "story_v_out_318082", "318082017", "story_v_out_318082.awb")

						arg_67_1:RecordAudio("318082017", var_70_15)
						arg_67_1:RecordAudio("318082017", var_70_15)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_318082", "318082017", "story_v_out_318082.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_318082", "318082017", "story_v_out_318082.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_16 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_16 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_16

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_16 and arg_67_1.time_ < var_70_6 + var_70_16 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play318082018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 318082018
		arg_71_1.duration_ = 3.033

		local var_71_0 = {
			zh = 1.999999999999,
			ja = 3.033
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
				arg_71_0:Play318082019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1199ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1199ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, -1.08, -5.9)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1199ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["1199ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and arg_71_1.var_.characterEffect1199ui_story == nil then
				arg_71_1.var_.characterEffect1199ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect1199ui_story then
					arg_71_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and arg_71_1.var_.characterEffect1199ui_story then
				arg_71_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199actionlink/1199action446")
			end

			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_74_15 = arg_71_1.actors_["10066ui_story"].transform
			local var_74_16 = 0

			if var_74_16 < arg_71_1.time_ and arg_71_1.time_ <= var_74_16 + arg_74_0 then
				arg_71_1.var_.moveOldPos10066ui_story = var_74_15.localPosition
			end

			local var_74_17 = 0.001

			if var_74_16 <= arg_71_1.time_ and arg_71_1.time_ < var_74_16 + var_74_17 then
				local var_74_18 = (arg_71_1.time_ - var_74_16) / var_74_17
				local var_74_19 = Vector3.New(0, 100, 0)

				var_74_15.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10066ui_story, var_74_19, var_74_18)

				local var_74_20 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_20.x, var_74_20.y, var_74_20.z)

				local var_74_21 = var_74_15.localEulerAngles

				var_74_21.z = 0
				var_74_21.x = 0
				var_74_15.localEulerAngles = var_74_21
			end

			if arg_71_1.time_ >= var_74_16 + var_74_17 and arg_71_1.time_ < var_74_16 + var_74_17 + arg_74_0 then
				var_74_15.localPosition = Vector3.New(0, 100, 0)

				local var_74_22 = manager.ui.mainCamera.transform.position - var_74_15.position

				var_74_15.forward = Vector3.New(var_74_22.x, var_74_22.y, var_74_22.z)

				local var_74_23 = var_74_15.localEulerAngles

				var_74_23.z = 0
				var_74_23.x = 0
				var_74_15.localEulerAngles = var_74_23
			end

			local var_74_24 = arg_71_1.actors_["10066ui_story"]
			local var_74_25 = 0

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 and arg_71_1.var_.characterEffect10066ui_story == nil then
				arg_71_1.var_.characterEffect10066ui_story = var_74_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_26 = 0.200000002980232

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				local var_74_27 = (arg_71_1.time_ - var_74_25) / var_74_26

				if arg_71_1.var_.characterEffect10066ui_story then
					local var_74_28 = Mathf.Lerp(0, 0.5, var_74_27)

					arg_71_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_71_1.var_.characterEffect10066ui_story.fillRatio = var_74_28
				end
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 and arg_71_1.var_.characterEffect10066ui_story then
				local var_74_29 = 0.5

				arg_71_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_71_1.var_.characterEffect10066ui_story.fillRatio = var_74_29
			end

			local var_74_30 = arg_71_1.actors_["1015ui_story"].transform
			local var_74_31 = 0

			if var_74_31 < arg_71_1.time_ and arg_71_1.time_ <= var_74_31 + arg_74_0 then
				arg_71_1.var_.moveOldPos1015ui_story = var_74_30.localPosition
			end

			local var_74_32 = 0.001

			if var_74_31 <= arg_71_1.time_ and arg_71_1.time_ < var_74_31 + var_74_32 then
				local var_74_33 = (arg_71_1.time_ - var_74_31) / var_74_32
				local var_74_34 = Vector3.New(0, 100, 0)

				var_74_30.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1015ui_story, var_74_34, var_74_33)

				local var_74_35 = manager.ui.mainCamera.transform.position - var_74_30.position

				var_74_30.forward = Vector3.New(var_74_35.x, var_74_35.y, var_74_35.z)

				local var_74_36 = var_74_30.localEulerAngles

				var_74_36.z = 0
				var_74_36.x = 0
				var_74_30.localEulerAngles = var_74_36
			end

			if arg_71_1.time_ >= var_74_31 + var_74_32 and arg_71_1.time_ < var_74_31 + var_74_32 + arg_74_0 then
				var_74_30.localPosition = Vector3.New(0, 100, 0)

				local var_74_37 = manager.ui.mainCamera.transform.position - var_74_30.position

				var_74_30.forward = Vector3.New(var_74_37.x, var_74_37.y, var_74_37.z)

				local var_74_38 = var_74_30.localEulerAngles

				var_74_38.z = 0
				var_74_38.x = 0
				var_74_30.localEulerAngles = var_74_38
			end

			local var_74_39 = 0
			local var_74_40 = 0.225

			if var_74_39 < arg_71_1.time_ and arg_71_1.time_ <= var_74_39 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_41 = arg_71_1:FormatText(StoryNameCfg[84].name)

				arg_71_1.leftNameTxt_.text = var_74_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_42 = arg_71_1:GetWordFromCfg(318082018)
				local var_74_43 = arg_71_1:FormatText(var_74_42.content)

				arg_71_1.text_.text = var_74_43

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_44 = 9
				local var_74_45 = utf8.len(var_74_43)
				local var_74_46 = var_74_44 <= 0 and var_74_40 or var_74_40 * (var_74_45 / var_74_44)

				if var_74_46 > 0 and var_74_40 < var_74_46 then
					arg_71_1.talkMaxDuration = var_74_46

					if var_74_46 + var_74_39 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_46 + var_74_39
					end
				end

				arg_71_1.text_.text = var_74_43
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082018", "story_v_out_318082.awb") ~= 0 then
					local var_74_47 = manager.audio:GetVoiceLength("story_v_out_318082", "318082018", "story_v_out_318082.awb") / 1000

					if var_74_47 + var_74_39 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_47 + var_74_39
					end

					if var_74_42.prefab_name ~= "" and arg_71_1.actors_[var_74_42.prefab_name] ~= nil then
						local var_74_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_42.prefab_name].transform, "story_v_out_318082", "318082018", "story_v_out_318082.awb")

						arg_71_1:RecordAudio("318082018", var_74_48)
						arg_71_1:RecordAudio("318082018", var_74_48)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_318082", "318082018", "story_v_out_318082.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_318082", "318082018", "story_v_out_318082.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_49 = math.max(var_74_40, arg_71_1.talkMaxDuration)

			if var_74_39 <= arg_71_1.time_ and arg_71_1.time_ < var_74_39 + var_74_49 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_39) / var_74_49

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_39 + var_74_49 and arg_71_1.time_ < var_74_39 + var_74_49 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play318082019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 318082019
		arg_75_1.duration_ = 1.999999999999

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play318082020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10066ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10066ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -0.99, -5.83)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10066ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["10066ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect10066ui_story == nil then
				arg_75_1.var_.characterEffect10066ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect10066ui_story then
					arg_75_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect10066ui_story then
				arg_75_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_14 = arg_75_1.actors_["1199ui_story"].transform
			local var_78_15 = 0

			if var_78_15 < arg_75_1.time_ and arg_75_1.time_ <= var_78_15 + arg_78_0 then
				arg_75_1.var_.moveOldPos1199ui_story = var_78_14.localPosition
			end

			local var_78_16 = 0.001

			if var_78_15 <= arg_75_1.time_ and arg_75_1.time_ < var_78_15 + var_78_16 then
				local var_78_17 = (arg_75_1.time_ - var_78_15) / var_78_16
				local var_78_18 = Vector3.New(0, 100, 0)

				var_78_14.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1199ui_story, var_78_18, var_78_17)

				local var_78_19 = manager.ui.mainCamera.transform.position - var_78_14.position

				var_78_14.forward = Vector3.New(var_78_19.x, var_78_19.y, var_78_19.z)

				local var_78_20 = var_78_14.localEulerAngles

				var_78_20.z = 0
				var_78_20.x = 0
				var_78_14.localEulerAngles = var_78_20
			end

			if arg_75_1.time_ >= var_78_15 + var_78_16 and arg_75_1.time_ < var_78_15 + var_78_16 + arg_78_0 then
				var_78_14.localPosition = Vector3.New(0, 100, 0)

				local var_78_21 = manager.ui.mainCamera.transform.position - var_78_14.position

				var_78_14.forward = Vector3.New(var_78_21.x, var_78_21.y, var_78_21.z)

				local var_78_22 = var_78_14.localEulerAngles

				var_78_22.z = 0
				var_78_22.x = 0
				var_78_14.localEulerAngles = var_78_22
			end

			local var_78_23 = arg_75_1.actors_["1199ui_story"]
			local var_78_24 = 0

			if var_78_24 < arg_75_1.time_ and arg_75_1.time_ <= var_78_24 + arg_78_0 and arg_75_1.var_.characterEffect1199ui_story == nil then
				arg_75_1.var_.characterEffect1199ui_story = var_78_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_25 = 0.200000002980232

			if var_78_24 <= arg_75_1.time_ and arg_75_1.time_ < var_78_24 + var_78_25 then
				local var_78_26 = (arg_75_1.time_ - var_78_24) / var_78_25

				if arg_75_1.var_.characterEffect1199ui_story then
					local var_78_27 = Mathf.Lerp(0, 0.5, var_78_26)

					arg_75_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1199ui_story.fillRatio = var_78_27
				end
			end

			if arg_75_1.time_ >= var_78_24 + var_78_25 and arg_75_1.time_ < var_78_24 + var_78_25 + arg_78_0 and arg_75_1.var_.characterEffect1199ui_story then
				local var_78_28 = 0.5

				arg_75_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1199ui_story.fillRatio = var_78_28
			end

			local var_78_29 = 0
			local var_78_30 = 0.075

			if var_78_29 < arg_75_1.time_ and arg_75_1.time_ <= var_78_29 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_31 = arg_75_1:FormatText(StoryNameCfg[640].name)

				arg_75_1.leftNameTxt_.text = var_78_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_32 = arg_75_1:GetWordFromCfg(318082019)
				local var_78_33 = arg_75_1:FormatText(var_78_32.content)

				arg_75_1.text_.text = var_78_33

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_34 = 3
				local var_78_35 = utf8.len(var_78_33)
				local var_78_36 = var_78_34 <= 0 and var_78_30 or var_78_30 * (var_78_35 / var_78_34)

				if var_78_36 > 0 and var_78_30 < var_78_36 then
					arg_75_1.talkMaxDuration = var_78_36

					if var_78_36 + var_78_29 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_36 + var_78_29
					end
				end

				arg_75_1.text_.text = var_78_33
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082019", "story_v_out_318082.awb") ~= 0 then
					local var_78_37 = manager.audio:GetVoiceLength("story_v_out_318082", "318082019", "story_v_out_318082.awb") / 1000

					if var_78_37 + var_78_29 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_37 + var_78_29
					end

					if var_78_32.prefab_name ~= "" and arg_75_1.actors_[var_78_32.prefab_name] ~= nil then
						local var_78_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_32.prefab_name].transform, "story_v_out_318082", "318082019", "story_v_out_318082.awb")

						arg_75_1:RecordAudio("318082019", var_78_38)
						arg_75_1:RecordAudio("318082019", var_78_38)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_318082", "318082019", "story_v_out_318082.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_318082", "318082019", "story_v_out_318082.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_39 = math.max(var_78_30, arg_75_1.talkMaxDuration)

			if var_78_29 <= arg_75_1.time_ and arg_75_1.time_ < var_78_29 + var_78_39 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_29) / var_78_39

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_29 + var_78_39 and arg_75_1.time_ < var_78_29 + var_78_39 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play318082020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 318082020
		arg_79_1.duration_ = 9

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play318082021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = "STblack"

			if arg_79_1.bgs_[var_82_0] == nil then
				local var_82_1 = Object.Instantiate(arg_79_1.paintGo_)

				var_82_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_82_0)
				var_82_1.name = var_82_0
				var_82_1.transform.parent = arg_79_1.stage_.transform
				var_82_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_79_1.bgs_[var_82_0] = var_82_1
			end

			local var_82_2 = 2

			if var_82_2 < arg_79_1.time_ and arg_79_1.time_ <= var_82_2 + arg_82_0 then
				local var_82_3 = manager.ui.mainCamera.transform.localPosition
				local var_82_4 = Vector3.New(0, 0, 10) + Vector3.New(var_82_3.x, var_82_3.y, 0)
				local var_82_5 = arg_79_1.bgs_.STblack

				var_82_5.transform.localPosition = var_82_4
				var_82_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_82_6 = var_82_5:GetComponent("SpriteRenderer")

				if var_82_6 and var_82_6.sprite then
					local var_82_7 = (var_82_5.transform.localPosition - var_82_3).z
					local var_82_8 = manager.ui.mainCameraCom_
					local var_82_9 = 2 * var_82_7 * Mathf.Tan(var_82_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_82_10 = var_82_9 * var_82_8.aspect
					local var_82_11 = var_82_6.sprite.bounds.size.x
					local var_82_12 = var_82_6.sprite.bounds.size.y
					local var_82_13 = var_82_10 / var_82_11
					local var_82_14 = var_82_9 / var_82_12
					local var_82_15 = var_82_14 < var_82_13 and var_82_13 or var_82_14

					var_82_5.transform.localScale = Vector3.New(var_82_15, var_82_15, 0)
				end

				for iter_82_0, iter_82_1 in pairs(arg_79_1.bgs_) do
					if iter_82_0 ~= "STblack" then
						iter_82_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_17 = 2

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17
				local var_82_19 = Color.New(0, 0, 0)

				var_82_19.a = Mathf.Lerp(0, 1, var_82_18)
				arg_79_1.mask_.color = var_82_19
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 then
				local var_82_20 = Color.New(0, 0, 0)

				var_82_20.a = 1
				arg_79_1.mask_.color = var_82_20
			end

			local var_82_21 = 2

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.mask_.enabled = true
				arg_79_1.mask_.raycastTarget = true

				arg_79_1:SetGaussion(false)
			end

			local var_82_22 = 2

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_22 then
				local var_82_23 = (arg_79_1.time_ - var_82_21) / var_82_22
				local var_82_24 = Color.New(0, 0, 0)

				var_82_24.a = Mathf.Lerp(1, 0, var_82_23)
				arg_79_1.mask_.color = var_82_24
			end

			if arg_79_1.time_ >= var_82_21 + var_82_22 and arg_79_1.time_ < var_82_21 + var_82_22 + arg_82_0 then
				local var_82_25 = Color.New(0, 0, 0)
				local var_82_26 = 0

				arg_79_1.mask_.enabled = false
				var_82_25.a = var_82_26
				arg_79_1.mask_.color = var_82_25
			end

			local var_82_27 = arg_79_1.actors_["10066ui_story"]
			local var_82_28 = 2

			if var_82_28 < arg_79_1.time_ and arg_79_1.time_ <= var_82_28 + arg_82_0 and arg_79_1.var_.characterEffect10066ui_story == nil then
				arg_79_1.var_.characterEffect10066ui_story = var_82_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_29 = 0.200000002980232

			if var_82_28 <= arg_79_1.time_ and arg_79_1.time_ < var_82_28 + var_82_29 then
				local var_82_30 = (arg_79_1.time_ - var_82_28) / var_82_29

				if arg_79_1.var_.characterEffect10066ui_story then
					local var_82_31 = Mathf.Lerp(0, 0.5, var_82_30)

					arg_79_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10066ui_story.fillRatio = var_82_31
				end
			end

			if arg_79_1.time_ >= var_82_28 + var_82_29 and arg_79_1.time_ < var_82_28 + var_82_29 + arg_82_0 and arg_79_1.var_.characterEffect10066ui_story then
				local var_82_32 = 0.5

				arg_79_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10066ui_story.fillRatio = var_82_32
			end

			local var_82_33 = arg_79_1.actors_["10066ui_story"].transform
			local var_82_34 = 2

			if var_82_34 < arg_79_1.time_ and arg_79_1.time_ <= var_82_34 + arg_82_0 then
				arg_79_1.var_.moveOldPos10066ui_story = var_82_33.localPosition
			end

			local var_82_35 = 0.001

			if var_82_34 <= arg_79_1.time_ and arg_79_1.time_ < var_82_34 + var_82_35 then
				local var_82_36 = (arg_79_1.time_ - var_82_34) / var_82_35
				local var_82_37 = Vector3.New(0, 100, 0)

				var_82_33.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10066ui_story, var_82_37, var_82_36)

				local var_82_38 = manager.ui.mainCamera.transform.position - var_82_33.position

				var_82_33.forward = Vector3.New(var_82_38.x, var_82_38.y, var_82_38.z)

				local var_82_39 = var_82_33.localEulerAngles

				var_82_39.z = 0
				var_82_39.x = 0
				var_82_33.localEulerAngles = var_82_39
			end

			if arg_79_1.time_ >= var_82_34 + var_82_35 and arg_79_1.time_ < var_82_34 + var_82_35 + arg_82_0 then
				var_82_33.localPosition = Vector3.New(0, 100, 0)

				local var_82_40 = manager.ui.mainCamera.transform.position - var_82_33.position

				var_82_33.forward = Vector3.New(var_82_40.x, var_82_40.y, var_82_40.z)

				local var_82_41 = var_82_33.localEulerAngles

				var_82_41.z = 0
				var_82_41.x = 0
				var_82_33.localEulerAngles = var_82_41
			end

			if arg_79_1.frameCnt_ <= 1 then
				arg_79_1.dialog_:SetActive(false)
			end

			local var_82_42 = 4
			local var_82_43 = 0.525

			if var_82_42 < arg_79_1.time_ and arg_79_1.time_ <= var_82_42 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				arg_79_1.dialog_:SetActive(true)

				local var_82_44 = LeanTween.value(arg_79_1.dialog_, 0, 1, 0.3)

				var_82_44:setOnUpdate(LuaHelper.FloatAction(function(arg_83_0)
					arg_79_1.dialogCg_.alpha = arg_83_0
				end))
				var_82_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_79_1.dialog_)
					var_82_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_79_1.duration_ = arg_79_1.duration_ + 0.3

				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_45 = arg_79_1:GetWordFromCfg(318082020)
				local var_82_46 = arg_79_1:FormatText(var_82_45.content)

				arg_79_1.text_.text = var_82_46

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_47 = 21
				local var_82_48 = utf8.len(var_82_46)
				local var_82_49 = var_82_47 <= 0 and var_82_43 or var_82_43 * (var_82_48 / var_82_47)

				if var_82_49 > 0 and var_82_43 < var_82_49 then
					arg_79_1.talkMaxDuration = var_82_49
					var_82_42 = var_82_42 + 0.3

					if var_82_49 + var_82_42 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_49 + var_82_42
					end
				end

				arg_79_1.text_.text = var_82_46
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_50 = var_82_42 + 0.3
			local var_82_51 = math.max(var_82_43, arg_79_1.talkMaxDuration)

			if var_82_50 <= arg_79_1.time_ and arg_79_1.time_ < var_82_50 + var_82_51 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_50) / var_82_51

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_50 + var_82_51 and arg_79_1.time_ < var_82_50 + var_82_51 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play318082021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 318082021
		arg_85_1.duration_ = 13.333

		local var_85_0 = {
			zh = 9.3,
			ja = 13.333
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
				arg_85_0:Play318082022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				local var_88_1 = manager.ui.mainCamera.transform.localPosition
				local var_88_2 = Vector3.New(0, 0, 10) + Vector3.New(var_88_1.x, var_88_1.y, 0)
				local var_88_3 = arg_85_1.bgs_.K13f

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
					if iter_88_0 ~= "K13f" then
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

				var_88_17.a = Mathf.Lerp(1, 0, var_88_16)
				arg_85_1.mask_.color = var_88_17
			end

			if arg_85_1.time_ >= var_88_14 + var_88_15 and arg_85_1.time_ < var_88_14 + var_88_15 + arg_88_0 then
				local var_88_18 = Color.New(0, 0, 0)
				local var_88_19 = 0

				arg_85_1.mask_.enabled = false
				var_88_18.a = var_88_19
				arg_85_1.mask_.color = var_88_18
			end

			local var_88_20 = arg_85_1.actors_["10066ui_story"].transform
			local var_88_21 = 2

			if var_88_21 < arg_85_1.time_ and arg_85_1.time_ <= var_88_21 + arg_88_0 then
				arg_85_1.var_.moveOldPos10066ui_story = var_88_20.localPosition
			end

			local var_88_22 = 0.001

			if var_88_21 <= arg_85_1.time_ and arg_85_1.time_ < var_88_21 + var_88_22 then
				local var_88_23 = (arg_85_1.time_ - var_88_21) / var_88_22
				local var_88_24 = Vector3.New(0, -0.99, -5.83)

				var_88_20.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10066ui_story, var_88_24, var_88_23)

				local var_88_25 = manager.ui.mainCamera.transform.position - var_88_20.position

				var_88_20.forward = Vector3.New(var_88_25.x, var_88_25.y, var_88_25.z)

				local var_88_26 = var_88_20.localEulerAngles

				var_88_26.z = 0
				var_88_26.x = 0
				var_88_20.localEulerAngles = var_88_26
			end

			if arg_85_1.time_ >= var_88_21 + var_88_22 and arg_85_1.time_ < var_88_21 + var_88_22 + arg_88_0 then
				var_88_20.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_88_27 = manager.ui.mainCamera.transform.position - var_88_20.position

				var_88_20.forward = Vector3.New(var_88_27.x, var_88_27.y, var_88_27.z)

				local var_88_28 = var_88_20.localEulerAngles

				var_88_28.z = 0
				var_88_28.x = 0
				var_88_20.localEulerAngles = var_88_28
			end

			local var_88_29 = arg_85_1.actors_["10066ui_story"].transform
			local var_88_30 = 0

			if var_88_30 < arg_85_1.time_ and arg_85_1.time_ <= var_88_30 + arg_88_0 then
				arg_85_1.var_.moveOldPos10066ui_story = var_88_29.localPosition
			end

			local var_88_31 = 0.001

			if var_88_30 <= arg_85_1.time_ and arg_85_1.time_ < var_88_30 + var_88_31 then
				local var_88_32 = (arg_85_1.time_ - var_88_30) / var_88_31
				local var_88_33 = Vector3.New(0, 100, 0)

				var_88_29.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10066ui_story, var_88_33, var_88_32)

				local var_88_34 = manager.ui.mainCamera.transform.position - var_88_29.position

				var_88_29.forward = Vector3.New(var_88_34.x, var_88_34.y, var_88_34.z)

				local var_88_35 = var_88_29.localEulerAngles

				var_88_35.z = 0
				var_88_35.x = 0
				var_88_29.localEulerAngles = var_88_35
			end

			if arg_85_1.time_ >= var_88_30 + var_88_31 and arg_85_1.time_ < var_88_30 + var_88_31 + arg_88_0 then
				var_88_29.localPosition = Vector3.New(0, 100, 0)

				local var_88_36 = manager.ui.mainCamera.transform.position - var_88_29.position

				var_88_29.forward = Vector3.New(var_88_36.x, var_88_36.y, var_88_36.z)

				local var_88_37 = var_88_29.localEulerAngles

				var_88_37.z = 0
				var_88_37.x = 0
				var_88_29.localEulerAngles = var_88_37
			end

			local var_88_38 = arg_85_1.actors_["10066ui_story"]
			local var_88_39 = 2

			if var_88_39 < arg_85_1.time_ and arg_85_1.time_ <= var_88_39 + arg_88_0 and arg_85_1.var_.characterEffect10066ui_story == nil then
				arg_85_1.var_.characterEffect10066ui_story = var_88_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_40 = 0.200000002980232

			if var_88_39 <= arg_85_1.time_ and arg_85_1.time_ < var_88_39 + var_88_40 then
				local var_88_41 = (arg_85_1.time_ - var_88_39) / var_88_40

				if arg_85_1.var_.characterEffect10066ui_story then
					arg_85_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_39 + var_88_40 and arg_85_1.time_ < var_88_39 + var_88_40 + arg_88_0 and arg_85_1.var_.characterEffect10066ui_story then
				arg_85_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_88_42 = 2

			if var_88_42 < arg_85_1.time_ and arg_85_1.time_ <= var_88_42 + arg_88_0 then
				arg_85_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action1_1")
			end

			local var_88_43 = 2

			if var_88_43 < arg_85_1.time_ and arg_85_1.time_ <= var_88_43 + arg_88_0 then
				arg_85_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_85_1.frameCnt_ <= 1 then
				arg_85_1.dialog_:SetActive(false)
			end

			local var_88_44 = 2
			local var_88_45 = 0.9

			if var_88_44 < arg_85_1.time_ and arg_85_1.time_ <= var_88_44 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				arg_85_1.dialog_:SetActive(true)

				local var_88_46 = LeanTween.value(arg_85_1.dialog_, 0, 1, 0.3)

				var_88_46:setOnUpdate(LuaHelper.FloatAction(function(arg_89_0)
					arg_85_1.dialogCg_.alpha = arg_89_0
				end))
				var_88_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_85_1.dialog_)
					var_88_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_85_1.duration_ = arg_85_1.duration_ + 0.3

				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_47 = arg_85_1:FormatText(StoryNameCfg[640].name)

				arg_85_1.leftNameTxt_.text = var_88_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_48 = arg_85_1:GetWordFromCfg(318082021)
				local var_88_49 = arg_85_1:FormatText(var_88_48.content)

				arg_85_1.text_.text = var_88_49

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_50 = 36
				local var_88_51 = utf8.len(var_88_49)
				local var_88_52 = var_88_50 <= 0 and var_88_45 or var_88_45 * (var_88_51 / var_88_50)

				if var_88_52 > 0 and var_88_45 < var_88_52 then
					arg_85_1.talkMaxDuration = var_88_52
					var_88_44 = var_88_44 + 0.3

					if var_88_52 + var_88_44 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_52 + var_88_44
					end
				end

				arg_85_1.text_.text = var_88_49
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082021", "story_v_out_318082.awb") ~= 0 then
					local var_88_53 = manager.audio:GetVoiceLength("story_v_out_318082", "318082021", "story_v_out_318082.awb") / 1000

					if var_88_53 + var_88_44 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_53 + var_88_44
					end

					if var_88_48.prefab_name ~= "" and arg_85_1.actors_[var_88_48.prefab_name] ~= nil then
						local var_88_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_48.prefab_name].transform, "story_v_out_318082", "318082021", "story_v_out_318082.awb")

						arg_85_1:RecordAudio("318082021", var_88_54)
						arg_85_1:RecordAudio("318082021", var_88_54)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_318082", "318082021", "story_v_out_318082.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_318082", "318082021", "story_v_out_318082.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_55 = var_88_44 + 0.3
			local var_88_56 = math.max(var_88_45, arg_85_1.talkMaxDuration)

			if var_88_55 <= arg_85_1.time_ and arg_85_1.time_ < var_88_55 + var_88_56 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_55) / var_88_56

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_55 + var_88_56 and arg_85_1.time_ < var_88_55 + var_88_56 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play318082022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 318082022
		arg_91_1.duration_ = 12.166

		local var_91_0 = {
			zh = 10.133,
			ja = 12.166
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
				arg_91_0:Play318082023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1.3

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[640].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(318082022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082022", "story_v_out_318082.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082022", "story_v_out_318082.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_318082", "318082022", "story_v_out_318082.awb")

						arg_91_1:RecordAudio("318082022", var_94_9)
						arg_91_1:RecordAudio("318082022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_318082", "318082022", "story_v_out_318082.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_318082", "318082022", "story_v_out_318082.awb")
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
	Play318082023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 318082023
		arg_95_1.duration_ = 12.066

		local var_95_0 = {
			zh = 11.433,
			ja = 12.066
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
				arg_95_0:Play318082024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.25

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[640].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(318082023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082023", "story_v_out_318082.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082023", "story_v_out_318082.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_318082", "318082023", "story_v_out_318082.awb")

						arg_95_1:RecordAudio("318082023", var_98_9)
						arg_95_1:RecordAudio("318082023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_318082", "318082023", "story_v_out_318082.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_318082", "318082023", "story_v_out_318082.awb")
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
	Play318082024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 318082024
		arg_99_1.duration_ = 5.633

		local var_99_0 = {
			zh = 5.633,
			ja = 5.433
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
				arg_99_0:Play318082025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_1")
			end

			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_102_2 = 0
			local var_102_3 = 0.6

			if var_102_2 < arg_99_1.time_ and arg_99_1.time_ <= var_102_2 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_4 = arg_99_1:FormatText(StoryNameCfg[640].name)

				arg_99_1.leftNameTxt_.text = var_102_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_5 = arg_99_1:GetWordFromCfg(318082024)
				local var_102_6 = arg_99_1:FormatText(var_102_5.content)

				arg_99_1.text_.text = var_102_6

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_7 = 24
				local var_102_8 = utf8.len(var_102_6)
				local var_102_9 = var_102_7 <= 0 and var_102_3 or var_102_3 * (var_102_8 / var_102_7)

				if var_102_9 > 0 and var_102_3 < var_102_9 then
					arg_99_1.talkMaxDuration = var_102_9

					if var_102_9 + var_102_2 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_9 + var_102_2
					end
				end

				arg_99_1.text_.text = var_102_6
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082024", "story_v_out_318082.awb") ~= 0 then
					local var_102_10 = manager.audio:GetVoiceLength("story_v_out_318082", "318082024", "story_v_out_318082.awb") / 1000

					if var_102_10 + var_102_2 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_10 + var_102_2
					end

					if var_102_5.prefab_name ~= "" and arg_99_1.actors_[var_102_5.prefab_name] ~= nil then
						local var_102_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_5.prefab_name].transform, "story_v_out_318082", "318082024", "story_v_out_318082.awb")

						arg_99_1:RecordAudio("318082024", var_102_11)
						arg_99_1:RecordAudio("318082024", var_102_11)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_318082", "318082024", "story_v_out_318082.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_318082", "318082024", "story_v_out_318082.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_12 = math.max(var_102_3, arg_99_1.talkMaxDuration)

			if var_102_2 <= arg_99_1.time_ and arg_99_1.time_ < var_102_2 + var_102_12 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_2) / var_102_12

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_2 + var_102_12 and arg_99_1.time_ < var_102_2 + var_102_12 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play318082025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 318082025
		arg_103_1.duration_ = 3.266

		local var_103_0 = {
			zh = 3.266,
			ja = 1.999999999999
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
				arg_103_0:Play318082026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1015ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1015ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -1.15, -6.2)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1015ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -1.15, -6.2)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1015ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1015ui_story == nil then
				arg_103_1.var_.characterEffect1015ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1015ui_story then
					arg_103_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1015ui_story then
				arg_103_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action3_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_106_15 = arg_103_1.actors_["10066ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos10066ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(-0.7, -0.99, -5.83)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10066ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(-0.7, -0.99, -5.83)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = arg_103_1.actors_["10066ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect10066ui_story == nil then
				arg_103_1.var_.characterEffect10066ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect10066ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10066ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect10066ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10066ui_story.fillRatio = var_106_29
			end

			local var_106_30 = 0
			local var_106_31 = 0.375

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_32 = arg_103_1:FormatText(StoryNameCfg[479].name)

				arg_103_1.leftNameTxt_.text = var_106_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_33 = arg_103_1:GetWordFromCfg(318082025)
				local var_106_34 = arg_103_1:FormatText(var_106_33.content)

				arg_103_1.text_.text = var_106_34

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_35 = 15
				local var_106_36 = utf8.len(var_106_34)
				local var_106_37 = var_106_35 <= 0 and var_106_31 or var_106_31 * (var_106_36 / var_106_35)

				if var_106_37 > 0 and var_106_31 < var_106_37 then
					arg_103_1.talkMaxDuration = var_106_37

					if var_106_37 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_37 + var_106_30
					end
				end

				arg_103_1.text_.text = var_106_34
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082025", "story_v_out_318082.awb") ~= 0 then
					local var_106_38 = manager.audio:GetVoiceLength("story_v_out_318082", "318082025", "story_v_out_318082.awb") / 1000

					if var_106_38 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_38 + var_106_30
					end

					if var_106_33.prefab_name ~= "" and arg_103_1.actors_[var_106_33.prefab_name] ~= nil then
						local var_106_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_33.prefab_name].transform, "story_v_out_318082", "318082025", "story_v_out_318082.awb")

						arg_103_1:RecordAudio("318082025", var_106_39)
						arg_103_1:RecordAudio("318082025", var_106_39)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_318082", "318082025", "story_v_out_318082.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_318082", "318082025", "story_v_out_318082.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_40 = math.max(var_106_31, arg_103_1.talkMaxDuration)

			if var_106_30 <= arg_103_1.time_ and arg_103_1.time_ < var_106_30 + var_106_40 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_30) / var_106_40

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_30 + var_106_40 and arg_103_1.time_ < var_106_30 + var_106_40 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play318082026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 318082026
		arg_107_1.duration_ = 9.966

		local var_107_0 = {
			zh = 9.966,
			ja = 8.433
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
				arg_107_0:Play318082027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10066ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect10066ui_story == nil then
				arg_107_1.var_.characterEffect10066ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect10066ui_story then
					arg_107_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect10066ui_story then
				arg_107_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_110_4 = 0

			if var_110_4 < arg_107_1.time_ and arg_107_1.time_ <= var_110_4 + arg_110_0 then
				arg_107_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action5_2")
			end

			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 then
				arg_107_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_6 = arg_107_1.actors_["1015ui_story"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.characterEffect1015ui_story == nil then
				arg_107_1.var_.characterEffect1015ui_story = var_110_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_8 = 0.200000002980232

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.characterEffect1015ui_story then
					local var_110_10 = Mathf.Lerp(0, 0.5, var_110_9)

					arg_107_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1015ui_story.fillRatio = var_110_10
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.characterEffect1015ui_story then
				local var_110_11 = 0.5

				arg_107_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1015ui_story.fillRatio = var_110_11
			end

			local var_110_12 = 0
			local var_110_13 = 1.1

			if var_110_12 < arg_107_1.time_ and arg_107_1.time_ <= var_110_12 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_14 = arg_107_1:FormatText(StoryNameCfg[640].name)

				arg_107_1.leftNameTxt_.text = var_110_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_15 = arg_107_1:GetWordFromCfg(318082026)
				local var_110_16 = arg_107_1:FormatText(var_110_15.content)

				arg_107_1.text_.text = var_110_16

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_17 = 44
				local var_110_18 = utf8.len(var_110_16)
				local var_110_19 = var_110_17 <= 0 and var_110_13 or var_110_13 * (var_110_18 / var_110_17)

				if var_110_19 > 0 and var_110_13 < var_110_19 then
					arg_107_1.talkMaxDuration = var_110_19

					if var_110_19 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_12
					end
				end

				arg_107_1.text_.text = var_110_16
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082026", "story_v_out_318082.awb") ~= 0 then
					local var_110_20 = manager.audio:GetVoiceLength("story_v_out_318082", "318082026", "story_v_out_318082.awb") / 1000

					if var_110_20 + var_110_12 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_12
					end

					if var_110_15.prefab_name ~= "" and arg_107_1.actors_[var_110_15.prefab_name] ~= nil then
						local var_110_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_15.prefab_name].transform, "story_v_out_318082", "318082026", "story_v_out_318082.awb")

						arg_107_1:RecordAudio("318082026", var_110_21)
						arg_107_1:RecordAudio("318082026", var_110_21)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_318082", "318082026", "story_v_out_318082.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_318082", "318082026", "story_v_out_318082.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_22 = math.max(var_110_13, arg_107_1.talkMaxDuration)

			if var_110_12 <= arg_107_1.time_ and arg_107_1.time_ < var_110_12 + var_110_22 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_12) / var_110_22

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_12 + var_110_22 and arg_107_1.time_ < var_110_12 + var_110_22 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play318082027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 318082027
		arg_111_1.duration_ = 8.866

		local var_111_0 = {
			zh = 8.233,
			ja = 8.866
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
				arg_111_0:Play318082028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.925

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[640].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(318082027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082027", "story_v_out_318082.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082027", "story_v_out_318082.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_318082", "318082027", "story_v_out_318082.awb")

						arg_111_1:RecordAudio("318082027", var_114_9)
						arg_111_1:RecordAudio("318082027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_318082", "318082027", "story_v_out_318082.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_318082", "318082027", "story_v_out_318082.awb")
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
	Play318082028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 318082028
		arg_115_1.duration_ = 12.233

		local var_115_0 = {
			zh = 6.3,
			ja = 12.233
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
				arg_115_0:Play318082029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.725

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[640].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(318082028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082028", "story_v_out_318082.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082028", "story_v_out_318082.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_318082", "318082028", "story_v_out_318082.awb")

						arg_115_1:RecordAudio("318082028", var_118_9)
						arg_115_1:RecordAudio("318082028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_318082", "318082028", "story_v_out_318082.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_318082", "318082028", "story_v_out_318082.awb")
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
	Play318082029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 318082029
		arg_119_1.duration_ = 5.4

		local var_119_0 = {
			zh = 3.8,
			ja = 5.4
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
				arg_119_0:Play318082030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1015ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1015ui_story == nil then
				arg_119_1.var_.characterEffect1015ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1015ui_story then
					arg_119_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1015ui_story then
				arg_119_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_122_4 = 0

			if var_122_4 < arg_119_1.time_ and arg_119_1.time_ <= var_122_4 + arg_122_0 then
				arg_119_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015actionlink/1015action432")
			end

			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 then
				arg_119_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_122_6 = arg_119_1.actors_["10066ui_story"]
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 and arg_119_1.var_.characterEffect10066ui_story == nil then
				arg_119_1.var_.characterEffect10066ui_story = var_122_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_8 = 0.200000002980232

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8

				if arg_119_1.var_.characterEffect10066ui_story then
					local var_122_10 = Mathf.Lerp(0, 0.5, var_122_9)

					arg_119_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_119_1.var_.characterEffect10066ui_story.fillRatio = var_122_10
				end
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 and arg_119_1.var_.characterEffect10066ui_story then
				local var_122_11 = 0.5

				arg_119_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_119_1.var_.characterEffect10066ui_story.fillRatio = var_122_11
			end

			local var_122_12 = 0
			local var_122_13 = 0.35

			if var_122_12 < arg_119_1.time_ and arg_119_1.time_ <= var_122_12 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_14 = arg_119_1:FormatText(StoryNameCfg[479].name)

				arg_119_1.leftNameTxt_.text = var_122_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_15 = arg_119_1:GetWordFromCfg(318082029)
				local var_122_16 = arg_119_1:FormatText(var_122_15.content)

				arg_119_1.text_.text = var_122_16

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_17 = 14
				local var_122_18 = utf8.len(var_122_16)
				local var_122_19 = var_122_17 <= 0 and var_122_13 or var_122_13 * (var_122_18 / var_122_17)

				if var_122_19 > 0 and var_122_13 < var_122_19 then
					arg_119_1.talkMaxDuration = var_122_19

					if var_122_19 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_19 + var_122_12
					end
				end

				arg_119_1.text_.text = var_122_16
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082029", "story_v_out_318082.awb") ~= 0 then
					local var_122_20 = manager.audio:GetVoiceLength("story_v_out_318082", "318082029", "story_v_out_318082.awb") / 1000

					if var_122_20 + var_122_12 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_12
					end

					if var_122_15.prefab_name ~= "" and arg_119_1.actors_[var_122_15.prefab_name] ~= nil then
						local var_122_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_15.prefab_name].transform, "story_v_out_318082", "318082029", "story_v_out_318082.awb")

						arg_119_1:RecordAudio("318082029", var_122_21)
						arg_119_1:RecordAudio("318082029", var_122_21)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_318082", "318082029", "story_v_out_318082.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_318082", "318082029", "story_v_out_318082.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_22 = math.max(var_122_13, arg_119_1.talkMaxDuration)

			if var_122_12 <= arg_119_1.time_ and arg_119_1.time_ < var_122_12 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_12) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_12 + var_122_22 and arg_119_1.time_ < var_122_12 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play318082030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 318082030
		arg_123_1.duration_ = 8

		local var_123_0 = {
			zh = 8,
			ja = 7.533
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
				arg_123_0:Play318082031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_2")
			end

			local var_126_1 = 0
			local var_126_2 = 1.025

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_3 = arg_123_1:FormatText(StoryNameCfg[479].name)

				arg_123_1.leftNameTxt_.text = var_126_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_4 = arg_123_1:GetWordFromCfg(318082030)
				local var_126_5 = arg_123_1:FormatText(var_126_4.content)

				arg_123_1.text_.text = var_126_5

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_6 = 41
				local var_126_7 = utf8.len(var_126_5)
				local var_126_8 = var_126_6 <= 0 and var_126_2 or var_126_2 * (var_126_7 / var_126_6)

				if var_126_8 > 0 and var_126_2 < var_126_8 then
					arg_123_1.talkMaxDuration = var_126_8

					if var_126_8 + var_126_1 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_1
					end
				end

				arg_123_1.text_.text = var_126_5
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082030", "story_v_out_318082.awb") ~= 0 then
					local var_126_9 = manager.audio:GetVoiceLength("story_v_out_318082", "318082030", "story_v_out_318082.awb") / 1000

					if var_126_9 + var_126_1 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_9 + var_126_1
					end

					if var_126_4.prefab_name ~= "" and arg_123_1.actors_[var_126_4.prefab_name] ~= nil then
						local var_126_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_4.prefab_name].transform, "story_v_out_318082", "318082030", "story_v_out_318082.awb")

						arg_123_1:RecordAudio("318082030", var_126_10)
						arg_123_1:RecordAudio("318082030", var_126_10)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_318082", "318082030", "story_v_out_318082.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_318082", "318082030", "story_v_out_318082.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_11 = math.max(var_126_2, arg_123_1.talkMaxDuration)

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_11 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_1) / var_126_11

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_1 + var_126_11 and arg_123_1.time_ < var_126_1 + var_126_11 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play318082031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 318082031
		arg_127_1.duration_ = 4.266

		local var_127_0 = {
			zh = 4.266,
			ja = 3.633
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
				arg_127_0:Play318082032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10066ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect10066ui_story == nil then
				arg_127_1.var_.characterEffect10066ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect10066ui_story then
					arg_127_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect10066ui_story then
				arg_127_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_130_4 = arg_127_1.actors_["1015ui_story"]
			local var_130_5 = 0

			if var_130_5 < arg_127_1.time_ and arg_127_1.time_ <= var_130_5 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story == nil then
				arg_127_1.var_.characterEffect1015ui_story = var_130_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_6 = 0.200000002980232

			if var_130_5 <= arg_127_1.time_ and arg_127_1.time_ < var_130_5 + var_130_6 then
				local var_130_7 = (arg_127_1.time_ - var_130_5) / var_130_6

				if arg_127_1.var_.characterEffect1015ui_story then
					local var_130_8 = Mathf.Lerp(0, 0.5, var_130_7)

					arg_127_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1015ui_story.fillRatio = var_130_8
				end
			end

			if arg_127_1.time_ >= var_130_5 + var_130_6 and arg_127_1.time_ < var_130_5 + var_130_6 + arg_130_0 and arg_127_1.var_.characterEffect1015ui_story then
				local var_130_9 = 0.5

				arg_127_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1015ui_story.fillRatio = var_130_9
			end

			local var_130_10 = 0
			local var_130_11 = 0.575

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_12 = arg_127_1:FormatText(StoryNameCfg[640].name)

				arg_127_1.leftNameTxt_.text = var_130_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_13 = arg_127_1:GetWordFromCfg(318082031)
				local var_130_14 = arg_127_1:FormatText(var_130_13.content)

				arg_127_1.text_.text = var_130_14

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_15 = 23
				local var_130_16 = utf8.len(var_130_14)
				local var_130_17 = var_130_15 <= 0 and var_130_11 or var_130_11 * (var_130_16 / var_130_15)

				if var_130_17 > 0 and var_130_11 < var_130_17 then
					arg_127_1.talkMaxDuration = var_130_17

					if var_130_17 + var_130_10 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_17 + var_130_10
					end
				end

				arg_127_1.text_.text = var_130_14
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082031", "story_v_out_318082.awb") ~= 0 then
					local var_130_18 = manager.audio:GetVoiceLength("story_v_out_318082", "318082031", "story_v_out_318082.awb") / 1000

					if var_130_18 + var_130_10 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_10
					end

					if var_130_13.prefab_name ~= "" and arg_127_1.actors_[var_130_13.prefab_name] ~= nil then
						local var_130_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_13.prefab_name].transform, "story_v_out_318082", "318082031", "story_v_out_318082.awb")

						arg_127_1:RecordAudio("318082031", var_130_19)
						arg_127_1:RecordAudio("318082031", var_130_19)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_318082", "318082031", "story_v_out_318082.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_318082", "318082031", "story_v_out_318082.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_20 = math.max(var_130_11, arg_127_1.talkMaxDuration)

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_20 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_10) / var_130_20

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_10 + var_130_20 and arg_127_1.time_ < var_130_10 + var_130_20 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play318082032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 318082032
		arg_131_1.duration_ = 17.3

		local var_131_0 = {
			zh = 10.5,
			ja = 17.3
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
				arg_131_0:Play318082033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1.15

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[640].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(318082032)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082032", "story_v_out_318082.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082032", "story_v_out_318082.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_318082", "318082032", "story_v_out_318082.awb")

						arg_131_1:RecordAudio("318082032", var_134_9)
						arg_131_1:RecordAudio("318082032", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_318082", "318082032", "story_v_out_318082.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_318082", "318082032", "story_v_out_318082.awb")
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
	Play318082033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 318082033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play318082034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10066ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect10066ui_story == nil then
				arg_135_1.var_.characterEffect10066ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect10066ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10066ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect10066ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10066ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0
			local var_138_7 = 0.5

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_8 = arg_135_1:FormatText(StoryNameCfg[7].name)

				arg_135_1.leftNameTxt_.text = var_138_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_9 = arg_135_1:GetWordFromCfg(318082033)
				local var_138_10 = arg_135_1:FormatText(var_138_9.content)

				arg_135_1.text_.text = var_138_10

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_11 = 20
				local var_138_12 = utf8.len(var_138_10)
				local var_138_13 = var_138_11 <= 0 and var_138_7 or var_138_7 * (var_138_12 / var_138_11)

				if var_138_13 > 0 and var_138_7 < var_138_13 then
					arg_135_1.talkMaxDuration = var_138_13

					if var_138_13 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_10
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_14 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_14 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_14

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_14 and arg_135_1.time_ < var_138_6 + var_138_14 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play318082034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 318082034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play318082035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 1.025

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[7].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(318082034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 41
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
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_8 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_8 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_8

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_8 and arg_139_1.time_ < var_142_0 + var_142_8 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play318082035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 318082035
		arg_143_1.duration_ = 12.233

		local var_143_0 = {
			zh = 9.366,
			ja = 12.233
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
				arg_143_0:Play318082036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10066ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect10066ui_story == nil then
				arg_143_1.var_.characterEffect10066ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect10066ui_story then
					arg_143_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect10066ui_story then
				arg_143_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_146_4 = 0

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action7_1")
			end

			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 then
				arg_143_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_146_6 = 0
			local var_146_7 = 0.95

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_8 = arg_143_1:FormatText(StoryNameCfg[640].name)

				arg_143_1.leftNameTxt_.text = var_146_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_9 = arg_143_1:GetWordFromCfg(318082035)
				local var_146_10 = arg_143_1:FormatText(var_146_9.content)

				arg_143_1.text_.text = var_146_10

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_11 = 38
				local var_146_12 = utf8.len(var_146_10)
				local var_146_13 = var_146_11 <= 0 and var_146_7 or var_146_7 * (var_146_12 / var_146_11)

				if var_146_13 > 0 and var_146_7 < var_146_13 then
					arg_143_1.talkMaxDuration = var_146_13

					if var_146_13 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_13 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_10
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082035", "story_v_out_318082.awb") ~= 0 then
					local var_146_14 = manager.audio:GetVoiceLength("story_v_out_318082", "318082035", "story_v_out_318082.awb") / 1000

					if var_146_14 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_14 + var_146_6
					end

					if var_146_9.prefab_name ~= "" and arg_143_1.actors_[var_146_9.prefab_name] ~= nil then
						local var_146_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_9.prefab_name].transform, "story_v_out_318082", "318082035", "story_v_out_318082.awb")

						arg_143_1:RecordAudio("318082035", var_146_15)
						arg_143_1:RecordAudio("318082035", var_146_15)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_318082", "318082035", "story_v_out_318082.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_318082", "318082035", "story_v_out_318082.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_16 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_16 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_16

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_16 and arg_143_1.time_ < var_146_6 + var_146_16 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play318082036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 318082036
		arg_147_1.duration_ = 9.133

		local var_147_0 = {
			zh = 7.833,
			ja = 9.133
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
				arg_147_0:Play318082037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.65

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[640].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(318082036)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082036", "story_v_out_318082.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082036", "story_v_out_318082.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_318082", "318082036", "story_v_out_318082.awb")

						arg_147_1:RecordAudio("318082036", var_150_9)
						arg_147_1:RecordAudio("318082036", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_318082", "318082036", "story_v_out_318082.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_318082", "318082036", "story_v_out_318082.awb")
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
	Play318082037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 318082037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play318082038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10066ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect10066ui_story == nil then
				arg_151_1.var_.characterEffect10066ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect10066ui_story then
					local var_154_4 = Mathf.Lerp(0, 0.5, var_154_3)

					arg_151_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_151_1.var_.characterEffect10066ui_story.fillRatio = var_154_4
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect10066ui_story then
				local var_154_5 = 0.5

				arg_151_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_151_1.var_.characterEffect10066ui_story.fillRatio = var_154_5
			end

			local var_154_6 = 0
			local var_154_7 = 0.725

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_8 = arg_151_1:FormatText(StoryNameCfg[7].name)

				arg_151_1.leftNameTxt_.text = var_154_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_9 = arg_151_1:GetWordFromCfg(318082037)
				local var_154_10 = arg_151_1:FormatText(var_154_9.content)

				arg_151_1.text_.text = var_154_10

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_11 = 29
				local var_154_12 = utf8.len(var_154_10)
				local var_154_13 = var_154_11 <= 0 and var_154_7 or var_154_7 * (var_154_12 / var_154_11)

				if var_154_13 > 0 and var_154_7 < var_154_13 then
					arg_151_1.talkMaxDuration = var_154_13

					if var_154_13 + var_154_6 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_13 + var_154_6
					end
				end

				arg_151_1.text_.text = var_154_10
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_14 = math.max(var_154_7, arg_151_1.talkMaxDuration)

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_14 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_6) / var_154_14

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_6 + var_154_14 and arg_151_1.time_ < var_154_6 + var_154_14 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play318082038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 318082038
		arg_155_1.duration_ = 7.533

		local var_155_0 = {
			zh = 7.533,
			ja = 6.133
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
				arg_155_0:Play318082039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1015ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1015ui_story == nil then
				arg_155_1.var_.characterEffect1015ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1015ui_story then
					arg_155_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1015ui_story then
				arg_155_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_158_4 = 0
			local var_158_5 = 0.7

			if var_158_4 < arg_155_1.time_ and arg_155_1.time_ <= var_158_4 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_6 = arg_155_1:FormatText(StoryNameCfg[479].name)

				arg_155_1.leftNameTxt_.text = var_158_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_7 = arg_155_1:GetWordFromCfg(318082038)
				local var_158_8 = arg_155_1:FormatText(var_158_7.content)

				arg_155_1.text_.text = var_158_8

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_9 = 28
				local var_158_10 = utf8.len(var_158_8)
				local var_158_11 = var_158_9 <= 0 and var_158_5 or var_158_5 * (var_158_10 / var_158_9)

				if var_158_11 > 0 and var_158_5 < var_158_11 then
					arg_155_1.talkMaxDuration = var_158_11

					if var_158_11 + var_158_4 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_11 + var_158_4
					end
				end

				arg_155_1.text_.text = var_158_8
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082038", "story_v_out_318082.awb") ~= 0 then
					local var_158_12 = manager.audio:GetVoiceLength("story_v_out_318082", "318082038", "story_v_out_318082.awb") / 1000

					if var_158_12 + var_158_4 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_12 + var_158_4
					end

					if var_158_7.prefab_name ~= "" and arg_155_1.actors_[var_158_7.prefab_name] ~= nil then
						local var_158_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_7.prefab_name].transform, "story_v_out_318082", "318082038", "story_v_out_318082.awb")

						arg_155_1:RecordAudio("318082038", var_158_13)
						arg_155_1:RecordAudio("318082038", var_158_13)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_318082", "318082038", "story_v_out_318082.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_318082", "318082038", "story_v_out_318082.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_14 = math.max(var_158_5, arg_155_1.talkMaxDuration)

			if var_158_4 <= arg_155_1.time_ and arg_155_1.time_ < var_158_4 + var_158_14 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_4) / var_158_14

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_4 + var_158_14 and arg_155_1.time_ < var_158_4 + var_158_14 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play318082039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 318082039
		arg_159_1.duration_ = 4.066

		local var_159_0 = {
			zh = 3.066,
			ja = 4.066
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
				arg_159_0:Play318082040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.475

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[479].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(318082039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082039", "story_v_out_318082.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082039", "story_v_out_318082.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_318082", "318082039", "story_v_out_318082.awb")

						arg_159_1:RecordAudio("318082039", var_162_9)
						arg_159_1:RecordAudio("318082039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_318082", "318082039", "story_v_out_318082.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_318082", "318082039", "story_v_out_318082.awb")
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
	Play318082040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 318082040
		arg_163_1.duration_ = 10.5

		local var_163_0 = {
			zh = 5.733,
			ja = 10.5
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
				arg_163_0:Play318082041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1199ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1199ui_story == nil then
				arg_163_1.var_.characterEffect1199ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1199ui_story then
					arg_163_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1199ui_story then
				arg_163_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_166_4 = 0

			if var_166_4 < arg_163_1.time_ and arg_163_1.time_ <= var_166_4 + arg_166_0 then
				arg_163_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/story1199/story1199action/1199action1_1")
			end

			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 then
				arg_163_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_166_6 = arg_163_1.actors_["1015ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story == nil then
				arg_163_1.var_.characterEffect1015ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.200000002980232

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1015ui_story then
					local var_166_10 = Mathf.Lerp(0, 0.5, var_166_9)

					arg_163_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1015ui_story.fillRatio = var_166_10
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1015ui_story then
				local var_166_11 = 0.5

				arg_163_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1015ui_story.fillRatio = var_166_11
			end

			local var_166_12 = arg_163_1.actors_["1199ui_story"].transform
			local var_166_13 = 0

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1.var_.moveOldPos1199ui_story = var_166_12.localPosition
			end

			local var_166_14 = 0.001

			if var_166_13 <= arg_163_1.time_ and arg_163_1.time_ < var_166_13 + var_166_14 then
				local var_166_15 = (arg_163_1.time_ - var_166_13) / var_166_14
				local var_166_16 = Vector3.New(0.7, -1.08, -5.9)

				var_166_12.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1199ui_story, var_166_16, var_166_15)

				local var_166_17 = manager.ui.mainCamera.transform.position - var_166_12.position

				var_166_12.forward = Vector3.New(var_166_17.x, var_166_17.y, var_166_17.z)

				local var_166_18 = var_166_12.localEulerAngles

				var_166_18.z = 0
				var_166_18.x = 0
				var_166_12.localEulerAngles = var_166_18
			end

			if arg_163_1.time_ >= var_166_13 + var_166_14 and arg_163_1.time_ < var_166_13 + var_166_14 + arg_166_0 then
				var_166_12.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_166_19 = manager.ui.mainCamera.transform.position - var_166_12.position

				var_166_12.forward = Vector3.New(var_166_19.x, var_166_19.y, var_166_19.z)

				local var_166_20 = var_166_12.localEulerAngles

				var_166_20.z = 0
				var_166_20.x = 0
				var_166_12.localEulerAngles = var_166_20
			end

			local var_166_21 = arg_163_1.actors_["10066ui_story"].transform
			local var_166_22 = 0

			if var_166_22 < arg_163_1.time_ and arg_163_1.time_ <= var_166_22 + arg_166_0 then
				arg_163_1.var_.moveOldPos10066ui_story = var_166_21.localPosition
			end

			local var_166_23 = 0.001

			if var_166_22 <= arg_163_1.time_ and arg_163_1.time_ < var_166_22 + var_166_23 then
				local var_166_24 = (arg_163_1.time_ - var_166_22) / var_166_23
				local var_166_25 = Vector3.New(0, 100, 0)

				var_166_21.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10066ui_story, var_166_25, var_166_24)

				local var_166_26 = manager.ui.mainCamera.transform.position - var_166_21.position

				var_166_21.forward = Vector3.New(var_166_26.x, var_166_26.y, var_166_26.z)

				local var_166_27 = var_166_21.localEulerAngles

				var_166_27.z = 0
				var_166_27.x = 0
				var_166_21.localEulerAngles = var_166_27
			end

			if arg_163_1.time_ >= var_166_22 + var_166_23 and arg_163_1.time_ < var_166_22 + var_166_23 + arg_166_0 then
				var_166_21.localPosition = Vector3.New(0, 100, 0)

				local var_166_28 = manager.ui.mainCamera.transform.position - var_166_21.position

				var_166_21.forward = Vector3.New(var_166_28.x, var_166_28.y, var_166_28.z)

				local var_166_29 = var_166_21.localEulerAngles

				var_166_29.z = 0
				var_166_29.x = 0
				var_166_21.localEulerAngles = var_166_29
			end

			local var_166_30 = arg_163_1.actors_["1015ui_story"].transform
			local var_166_31 = 0

			if var_166_31 < arg_163_1.time_ and arg_163_1.time_ <= var_166_31 + arg_166_0 then
				arg_163_1.var_.moveOldPos1015ui_story = var_166_30.localPosition
			end

			local var_166_32 = 0.001

			if var_166_31 <= arg_163_1.time_ and arg_163_1.time_ < var_166_31 + var_166_32 then
				local var_166_33 = (arg_163_1.time_ - var_166_31) / var_166_32
				local var_166_34 = Vector3.New(-0.7, -1.15, -6.2)

				var_166_30.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1015ui_story, var_166_34, var_166_33)

				local var_166_35 = manager.ui.mainCamera.transform.position - var_166_30.position

				var_166_30.forward = Vector3.New(var_166_35.x, var_166_35.y, var_166_35.z)

				local var_166_36 = var_166_30.localEulerAngles

				var_166_36.z = 0
				var_166_36.x = 0
				var_166_30.localEulerAngles = var_166_36
			end

			if arg_163_1.time_ >= var_166_31 + var_166_32 and arg_163_1.time_ < var_166_31 + var_166_32 + arg_166_0 then
				var_166_30.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_166_37 = manager.ui.mainCamera.transform.position - var_166_30.position

				var_166_30.forward = Vector3.New(var_166_37.x, var_166_37.y, var_166_37.z)

				local var_166_38 = var_166_30.localEulerAngles

				var_166_38.z = 0
				var_166_38.x = 0
				var_166_30.localEulerAngles = var_166_38
			end

			local var_166_39 = 0
			local var_166_40 = 0.625

			if var_166_39 < arg_163_1.time_ and arg_163_1.time_ <= var_166_39 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_41 = arg_163_1:FormatText(StoryNameCfg[84].name)

				arg_163_1.leftNameTxt_.text = var_166_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_42 = arg_163_1:GetWordFromCfg(318082040)
				local var_166_43 = arg_163_1:FormatText(var_166_42.content)

				arg_163_1.text_.text = var_166_43

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_44 = 25
				local var_166_45 = utf8.len(var_166_43)
				local var_166_46 = var_166_44 <= 0 and var_166_40 or var_166_40 * (var_166_45 / var_166_44)

				if var_166_46 > 0 and var_166_40 < var_166_46 then
					arg_163_1.talkMaxDuration = var_166_46

					if var_166_46 + var_166_39 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_46 + var_166_39
					end
				end

				arg_163_1.text_.text = var_166_43
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082040", "story_v_out_318082.awb") ~= 0 then
					local var_166_47 = manager.audio:GetVoiceLength("story_v_out_318082", "318082040", "story_v_out_318082.awb") / 1000

					if var_166_47 + var_166_39 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_47 + var_166_39
					end

					if var_166_42.prefab_name ~= "" and arg_163_1.actors_[var_166_42.prefab_name] ~= nil then
						local var_166_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_42.prefab_name].transform, "story_v_out_318082", "318082040", "story_v_out_318082.awb")

						arg_163_1:RecordAudio("318082040", var_166_48)
						arg_163_1:RecordAudio("318082040", var_166_48)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_318082", "318082040", "story_v_out_318082.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_318082", "318082040", "story_v_out_318082.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_49 = math.max(var_166_40, arg_163_1.talkMaxDuration)

			if var_166_39 <= arg_163_1.time_ and arg_163_1.time_ < var_166_39 + var_166_49 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_39) / var_166_49

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_39 + var_166_49 and arg_163_1.time_ < var_166_39 + var_166_49 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play318082041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 318082041
		arg_167_1.duration_ = 9.8

		local var_167_0 = {
			zh = 3.766,
			ja = 9.8
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
				arg_167_0:Play318082042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1015ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1015ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(-0.7, -1.15, -6.2)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1015ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-0.7, -1.15, -6.2)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1015ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1015ui_story == nil then
				arg_167_1.var_.characterEffect1015ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1015ui_story then
					arg_167_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1015ui_story then
				arg_167_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_170_13 = arg_167_1.actors_["1199ui_story"].transform
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				arg_167_1.var_.moveOldPos1199ui_story = var_170_13.localPosition
			end

			local var_170_15 = 0.001

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_15 then
				local var_170_16 = (arg_167_1.time_ - var_170_14) / var_170_15
				local var_170_17 = Vector3.New(0.7, -1.08, -5.9)

				var_170_13.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1199ui_story, var_170_17, var_170_16)

				local var_170_18 = manager.ui.mainCamera.transform.position - var_170_13.position

				var_170_13.forward = Vector3.New(var_170_18.x, var_170_18.y, var_170_18.z)

				local var_170_19 = var_170_13.localEulerAngles

				var_170_19.z = 0
				var_170_19.x = 0
				var_170_13.localEulerAngles = var_170_19
			end

			if arg_167_1.time_ >= var_170_14 + var_170_15 and arg_167_1.time_ < var_170_14 + var_170_15 + arg_170_0 then
				var_170_13.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_170_20 = manager.ui.mainCamera.transform.position - var_170_13.position

				var_170_13.forward = Vector3.New(var_170_20.x, var_170_20.y, var_170_20.z)

				local var_170_21 = var_170_13.localEulerAngles

				var_170_21.z = 0
				var_170_21.x = 0
				var_170_13.localEulerAngles = var_170_21
			end

			local var_170_22 = arg_167_1.actors_["1199ui_story"]
			local var_170_23 = 0

			if var_170_23 < arg_167_1.time_ and arg_167_1.time_ <= var_170_23 + arg_170_0 and arg_167_1.var_.characterEffect1199ui_story == nil then
				arg_167_1.var_.characterEffect1199ui_story = var_170_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_24 = 0.200000002980232

			if var_170_23 <= arg_167_1.time_ and arg_167_1.time_ < var_170_23 + var_170_24 then
				local var_170_25 = (arg_167_1.time_ - var_170_23) / var_170_24

				if arg_167_1.var_.characterEffect1199ui_story then
					local var_170_26 = Mathf.Lerp(0, 0.5, var_170_25)

					arg_167_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1199ui_story.fillRatio = var_170_26
				end
			end

			if arg_167_1.time_ >= var_170_23 + var_170_24 and arg_167_1.time_ < var_170_23 + var_170_24 + arg_170_0 and arg_167_1.var_.characterEffect1199ui_story then
				local var_170_27 = 0.5

				arg_167_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1199ui_story.fillRatio = var_170_27
			end

			local var_170_28 = 0
			local var_170_29 = 0.375

			if var_170_28 < arg_167_1.time_ and arg_167_1.time_ <= var_170_28 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_30 = arg_167_1:FormatText(StoryNameCfg[479].name)

				arg_167_1.leftNameTxt_.text = var_170_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_31 = arg_167_1:GetWordFromCfg(318082041)
				local var_170_32 = arg_167_1:FormatText(var_170_31.content)

				arg_167_1.text_.text = var_170_32

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_33 = 15
				local var_170_34 = utf8.len(var_170_32)
				local var_170_35 = var_170_33 <= 0 and var_170_29 or var_170_29 * (var_170_34 / var_170_33)

				if var_170_35 > 0 and var_170_29 < var_170_35 then
					arg_167_1.talkMaxDuration = var_170_35

					if var_170_35 + var_170_28 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_35 + var_170_28
					end
				end

				arg_167_1.text_.text = var_170_32
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082041", "story_v_out_318082.awb") ~= 0 then
					local var_170_36 = manager.audio:GetVoiceLength("story_v_out_318082", "318082041", "story_v_out_318082.awb") / 1000

					if var_170_36 + var_170_28 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_36 + var_170_28
					end

					if var_170_31.prefab_name ~= "" and arg_167_1.actors_[var_170_31.prefab_name] ~= nil then
						local var_170_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_31.prefab_name].transform, "story_v_out_318082", "318082041", "story_v_out_318082.awb")

						arg_167_1:RecordAudio("318082041", var_170_37)
						arg_167_1:RecordAudio("318082041", var_170_37)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_318082", "318082041", "story_v_out_318082.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_318082", "318082041", "story_v_out_318082.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_38 = math.max(var_170_29, arg_167_1.talkMaxDuration)

			if var_170_28 <= arg_167_1.time_ and arg_167_1.time_ < var_170_28 + var_170_38 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_28) / var_170_38

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_28 + var_170_38 and arg_167_1.time_ < var_170_28 + var_170_38 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play318082042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 318082042
		arg_171_1.duration_ = 11.233

		local var_171_0 = {
			zh = 8.9,
			ja = 11.233
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
				arg_171_0:Play318082043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.975

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[479].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(318082042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082042", "story_v_out_318082.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082042", "story_v_out_318082.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_318082", "318082042", "story_v_out_318082.awb")

						arg_171_1:RecordAudio("318082042", var_174_9)
						arg_171_1:RecordAudio("318082042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_318082", "318082042", "story_v_out_318082.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_318082", "318082042", "story_v_out_318082.awb")
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
	Play318082043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 318082043
		arg_175_1.duration_ = 12.533

		local var_175_0 = {
			zh = 9.033,
			ja = 12.533
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
				arg_175_0:Play318082044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1015ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1015ui_story == nil then
				arg_175_1.var_.characterEffect1015ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1015ui_story then
					arg_175_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1015ui_story then
				arg_175_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_178_4 = 0

			if var_178_4 < arg_175_1.time_ and arg_175_1.time_ <= var_178_4 + arg_178_0 then
				arg_175_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action2_1")
			end

			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 then
				arg_175_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_178_6 = 0
			local var_178_7 = 1.1

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_8 = arg_175_1:FormatText(StoryNameCfg[479].name)

				arg_175_1.leftNameTxt_.text = var_178_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_9 = arg_175_1:GetWordFromCfg(318082043)
				local var_178_10 = arg_175_1:FormatText(var_178_9.content)

				arg_175_1.text_.text = var_178_10

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_11 = 44
				local var_178_12 = utf8.len(var_178_10)
				local var_178_13 = var_178_11 <= 0 and var_178_7 or var_178_7 * (var_178_12 / var_178_11)

				if var_178_13 > 0 and var_178_7 < var_178_13 then
					arg_175_1.talkMaxDuration = var_178_13

					if var_178_13 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_13 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_10
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082043", "story_v_out_318082.awb") ~= 0 then
					local var_178_14 = manager.audio:GetVoiceLength("story_v_out_318082", "318082043", "story_v_out_318082.awb") / 1000

					if var_178_14 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_14 + var_178_6
					end

					if var_178_9.prefab_name ~= "" and arg_175_1.actors_[var_178_9.prefab_name] ~= nil then
						local var_178_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_9.prefab_name].transform, "story_v_out_318082", "318082043", "story_v_out_318082.awb")

						arg_175_1:RecordAudio("318082043", var_178_15)
						arg_175_1:RecordAudio("318082043", var_178_15)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_318082", "318082043", "story_v_out_318082.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_318082", "318082043", "story_v_out_318082.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_16 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_16 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_16

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_16 and arg_175_1.time_ < var_178_6 + var_178_16 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play318082044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 318082044
		arg_179_1.duration_ = 4.9

		local var_179_0 = {
			zh = 4.633,
			ja = 4.9
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
				arg_179_0:Play318082045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1015ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1015ui_story == nil then
				arg_179_1.var_.characterEffect1015ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1015ui_story then
					arg_179_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1015ui_story then
				arg_179_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_182_4 = 0

			if var_182_4 < arg_179_1.time_ and arg_179_1.time_ <= var_182_4 + arg_182_0 then
				arg_179_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_182_5 = 0
			local var_182_6 = 0.475

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_7 = arg_179_1:FormatText(StoryNameCfg[479].name)

				arg_179_1.leftNameTxt_.text = var_182_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_8 = arg_179_1:GetWordFromCfg(318082044)
				local var_182_9 = arg_179_1:FormatText(var_182_8.content)

				arg_179_1.text_.text = var_182_9

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_10 = 19
				local var_182_11 = utf8.len(var_182_9)
				local var_182_12 = var_182_10 <= 0 and var_182_6 or var_182_6 * (var_182_11 / var_182_10)

				if var_182_12 > 0 and var_182_6 < var_182_12 then
					arg_179_1.talkMaxDuration = var_182_12

					if var_182_12 + var_182_5 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_12 + var_182_5
					end
				end

				arg_179_1.text_.text = var_182_9
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082044", "story_v_out_318082.awb") ~= 0 then
					local var_182_13 = manager.audio:GetVoiceLength("story_v_out_318082", "318082044", "story_v_out_318082.awb") / 1000

					if var_182_13 + var_182_5 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_13 + var_182_5
					end

					if var_182_8.prefab_name ~= "" and arg_179_1.actors_[var_182_8.prefab_name] ~= nil then
						local var_182_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_8.prefab_name].transform, "story_v_out_318082", "318082044", "story_v_out_318082.awb")

						arg_179_1:RecordAudio("318082044", var_182_14)
						arg_179_1:RecordAudio("318082044", var_182_14)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_318082", "318082044", "story_v_out_318082.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_318082", "318082044", "story_v_out_318082.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_15 = math.max(var_182_6, arg_179_1.talkMaxDuration)

			if var_182_5 <= arg_179_1.time_ and arg_179_1.time_ < var_182_5 + var_182_15 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_5) / var_182_15

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_5 + var_182_15 and arg_179_1.time_ < var_182_5 + var_182_15 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play318082045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 318082045
		arg_183_1.duration_ = 5.733

		local var_183_0 = {
			zh = 3.133,
			ja = 5.733
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
				arg_183_0:Play318082046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10066ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10066ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(0, -0.99, -5.83)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10066ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["10066ui_story"]
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 and arg_183_1.var_.characterEffect10066ui_story == nil then
				arg_183_1.var_.characterEffect10066ui_story = var_186_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_11 = 0.200000002980232

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11

				if arg_183_1.var_.characterEffect10066ui_story then
					arg_183_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 and arg_183_1.var_.characterEffect10066ui_story then
				arg_183_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_186_14 = arg_183_1.actors_["1015ui_story"].transform
			local var_186_15 = 0

			if var_186_15 < arg_183_1.time_ and arg_183_1.time_ <= var_186_15 + arg_186_0 then
				arg_183_1.var_.moveOldPos1015ui_story = var_186_14.localPosition
			end

			local var_186_16 = 0.001

			if var_186_15 <= arg_183_1.time_ and arg_183_1.time_ < var_186_15 + var_186_16 then
				local var_186_17 = (arg_183_1.time_ - var_186_15) / var_186_16
				local var_186_18 = Vector3.New(0, 100, 0)

				var_186_14.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1015ui_story, var_186_18, var_186_17)

				local var_186_19 = manager.ui.mainCamera.transform.position - var_186_14.position

				var_186_14.forward = Vector3.New(var_186_19.x, var_186_19.y, var_186_19.z)

				local var_186_20 = var_186_14.localEulerAngles

				var_186_20.z = 0
				var_186_20.x = 0
				var_186_14.localEulerAngles = var_186_20
			end

			if arg_183_1.time_ >= var_186_15 + var_186_16 and arg_183_1.time_ < var_186_15 + var_186_16 + arg_186_0 then
				var_186_14.localPosition = Vector3.New(0, 100, 0)

				local var_186_21 = manager.ui.mainCamera.transform.position - var_186_14.position

				var_186_14.forward = Vector3.New(var_186_21.x, var_186_21.y, var_186_21.z)

				local var_186_22 = var_186_14.localEulerAngles

				var_186_22.z = 0
				var_186_22.x = 0
				var_186_14.localEulerAngles = var_186_22
			end

			local var_186_23 = arg_183_1.actors_["1015ui_story"]
			local var_186_24 = 0

			if var_186_24 < arg_183_1.time_ and arg_183_1.time_ <= var_186_24 + arg_186_0 and arg_183_1.var_.characterEffect1015ui_story == nil then
				arg_183_1.var_.characterEffect1015ui_story = var_186_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_25 = 0.200000002980232

			if var_186_24 <= arg_183_1.time_ and arg_183_1.time_ < var_186_24 + var_186_25 then
				local var_186_26 = (arg_183_1.time_ - var_186_24) / var_186_25

				if arg_183_1.var_.characterEffect1015ui_story then
					local var_186_27 = Mathf.Lerp(0, 0.5, var_186_26)

					arg_183_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1015ui_story.fillRatio = var_186_27
				end
			end

			if arg_183_1.time_ >= var_186_24 + var_186_25 and arg_183_1.time_ < var_186_24 + var_186_25 + arg_186_0 and arg_183_1.var_.characterEffect1015ui_story then
				local var_186_28 = 0.5

				arg_183_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1015ui_story.fillRatio = var_186_28
			end

			local var_186_29 = arg_183_1.actors_["1199ui_story"].transform
			local var_186_30 = 0

			if var_186_30 < arg_183_1.time_ and arg_183_1.time_ <= var_186_30 + arg_186_0 then
				arg_183_1.var_.moveOldPos1199ui_story = var_186_29.localPosition
			end

			local var_186_31 = 0.001

			if var_186_30 <= arg_183_1.time_ and arg_183_1.time_ < var_186_30 + var_186_31 then
				local var_186_32 = (arg_183_1.time_ - var_186_30) / var_186_31
				local var_186_33 = Vector3.New(0, 100, 0)

				var_186_29.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1199ui_story, var_186_33, var_186_32)

				local var_186_34 = manager.ui.mainCamera.transform.position - var_186_29.position

				var_186_29.forward = Vector3.New(var_186_34.x, var_186_34.y, var_186_34.z)

				local var_186_35 = var_186_29.localEulerAngles

				var_186_35.z = 0
				var_186_35.x = 0
				var_186_29.localEulerAngles = var_186_35
			end

			if arg_183_1.time_ >= var_186_30 + var_186_31 and arg_183_1.time_ < var_186_30 + var_186_31 + arg_186_0 then
				var_186_29.localPosition = Vector3.New(0, 100, 0)

				local var_186_36 = manager.ui.mainCamera.transform.position - var_186_29.position

				var_186_29.forward = Vector3.New(var_186_36.x, var_186_36.y, var_186_36.z)

				local var_186_37 = var_186_29.localEulerAngles

				var_186_37.z = 0
				var_186_37.x = 0
				var_186_29.localEulerAngles = var_186_37
			end

			local var_186_38 = 0
			local var_186_39 = 0.175

			if var_186_38 < arg_183_1.time_ and arg_183_1.time_ <= var_186_38 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_40 = arg_183_1:FormatText(StoryNameCfg[640].name)

				arg_183_1.leftNameTxt_.text = var_186_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_41 = arg_183_1:GetWordFromCfg(318082045)
				local var_186_42 = arg_183_1:FormatText(var_186_41.content)

				arg_183_1.text_.text = var_186_42

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_43 = 7
				local var_186_44 = utf8.len(var_186_42)
				local var_186_45 = var_186_43 <= 0 and var_186_39 or var_186_39 * (var_186_44 / var_186_43)

				if var_186_45 > 0 and var_186_39 < var_186_45 then
					arg_183_1.talkMaxDuration = var_186_45

					if var_186_45 + var_186_38 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_45 + var_186_38
					end
				end

				arg_183_1.text_.text = var_186_42
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082045", "story_v_out_318082.awb") ~= 0 then
					local var_186_46 = manager.audio:GetVoiceLength("story_v_out_318082", "318082045", "story_v_out_318082.awb") / 1000

					if var_186_46 + var_186_38 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_46 + var_186_38
					end

					if var_186_41.prefab_name ~= "" and arg_183_1.actors_[var_186_41.prefab_name] ~= nil then
						local var_186_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_41.prefab_name].transform, "story_v_out_318082", "318082045", "story_v_out_318082.awb")

						arg_183_1:RecordAudio("318082045", var_186_47)
						arg_183_1:RecordAudio("318082045", var_186_47)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_318082", "318082045", "story_v_out_318082.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_318082", "318082045", "story_v_out_318082.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_48 = math.max(var_186_39, arg_183_1.talkMaxDuration)

			if var_186_38 <= arg_183_1.time_ and arg_183_1.time_ < var_186_38 + var_186_48 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_38) / var_186_48

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_38 + var_186_48 and arg_183_1.time_ < var_186_38 + var_186_48 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play318082046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 318082046
		arg_187_1.duration_ = 5.733

		local var_187_0 = {
			zh = 3.033,
			ja = 5.733
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
				arg_187_0:Play318082047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.325

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[640].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(318082046)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082046", "story_v_out_318082.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082046", "story_v_out_318082.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_318082", "318082046", "story_v_out_318082.awb")

						arg_187_1:RecordAudio("318082046", var_190_9)
						arg_187_1:RecordAudio("318082046", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_318082", "318082046", "story_v_out_318082.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_318082", "318082046", "story_v_out_318082.awb")
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
	Play318082047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 318082047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play318082048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10066ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect10066ui_story == nil then
				arg_191_1.var_.characterEffect10066ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect10066ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_191_1.var_.characterEffect10066ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect10066ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_191_1.var_.characterEffect10066ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 1.15

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

				local var_194_8 = arg_191_1:GetWordFromCfg(318082047)
				local var_194_9 = arg_191_1:FormatText(var_194_8.content)

				arg_191_1.text_.text = var_194_9

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_10 = 46
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
	Play318082048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 318082048
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play318082049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.65

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[7].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(318082048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 26
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
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_8 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_8 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_8

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_8 and arg_195_1.time_ < var_198_0 + var_198_8 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play318082049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 318082049
		arg_199_1.duration_ = 8.866

		local var_199_0 = {
			zh = 6.5,
			ja = 8.866
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
				arg_199_0:Play318082050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = "K01f"

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
				local var_202_5 = arg_199_1.bgs_.K01f

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
					if iter_202_0 ~= "K01f" then
						iter_202_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_202_16 = 2

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_17 = 2

			if var_202_16 <= arg_199_1.time_ and arg_199_1.time_ < var_202_16 + var_202_17 then
				local var_202_18 = (arg_199_1.time_ - var_202_16) / var_202_17
				local var_202_19 = Color.New(0, 0, 0)

				var_202_19.a = Mathf.Lerp(1, 0, var_202_18)
				arg_199_1.mask_.color = var_202_19
			end

			if arg_199_1.time_ >= var_202_16 + var_202_17 and arg_199_1.time_ < var_202_16 + var_202_17 + arg_202_0 then
				local var_202_20 = Color.New(0, 0, 0)
				local var_202_21 = 0

				arg_199_1.mask_.enabled = false
				var_202_20.a = var_202_21
				arg_199_1.mask_.color = var_202_20
			end

			local var_202_22 = 0

			if var_202_22 < arg_199_1.time_ and arg_199_1.time_ <= var_202_22 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_23 = 2

			if var_202_22 <= arg_199_1.time_ and arg_199_1.time_ < var_202_22 + var_202_23 then
				local var_202_24 = (arg_199_1.time_ - var_202_22) / var_202_23
				local var_202_25 = Color.New(0, 0, 0)

				var_202_25.a = Mathf.Lerp(0, 1, var_202_24)
				arg_199_1.mask_.color = var_202_25
			end

			if arg_199_1.time_ >= var_202_22 + var_202_23 and arg_199_1.time_ < var_202_22 + var_202_23 + arg_202_0 then
				local var_202_26 = Color.New(0, 0, 0)

				var_202_26.a = 1
				arg_199_1.mask_.color = var_202_26
			end

			local var_202_27 = "1049ui_story"

			if arg_199_1.actors_[var_202_27] == nil then
				local var_202_28 = Object.Instantiate(Asset.Load("Char/" .. var_202_27), arg_199_1.stage_.transform)

				var_202_28.name = var_202_27
				var_202_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_199_1.actors_[var_202_27] = var_202_28

				local var_202_29 = var_202_28:GetComponentInChildren(typeof(CharacterEffect))

				var_202_29.enabled = true

				local var_202_30 = GameObjectTools.GetOrAddComponent(var_202_28, typeof(DynamicBoneHelper))

				if var_202_30 then
					var_202_30:EnableDynamicBone(false)
				end

				arg_199_1:ShowWeapon(var_202_29.transform, false)

				arg_199_1.var_[var_202_27 .. "Animator"] = var_202_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_199_1.var_[var_202_27 .. "Animator"].applyRootMotion = true
				arg_199_1.var_[var_202_27 .. "LipSync"] = var_202_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_202_31 = arg_199_1.actors_["1049ui_story"].transform
			local var_202_32 = 2

			if var_202_32 < arg_199_1.time_ and arg_199_1.time_ <= var_202_32 + arg_202_0 then
				arg_199_1.var_.moveOldPos1049ui_story = var_202_31.localPosition
			end

			local var_202_33 = 0.001

			if var_202_32 <= arg_199_1.time_ and arg_199_1.time_ < var_202_32 + var_202_33 then
				local var_202_34 = (arg_199_1.time_ - var_202_32) / var_202_33
				local var_202_35 = Vector3.New(0, -1.2, -6)

				var_202_31.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1049ui_story, var_202_35, var_202_34)

				local var_202_36 = manager.ui.mainCamera.transform.position - var_202_31.position

				var_202_31.forward = Vector3.New(var_202_36.x, var_202_36.y, var_202_36.z)

				local var_202_37 = var_202_31.localEulerAngles

				var_202_37.z = 0
				var_202_37.x = 0
				var_202_31.localEulerAngles = var_202_37
			end

			if arg_199_1.time_ >= var_202_32 + var_202_33 and arg_199_1.time_ < var_202_32 + var_202_33 + arg_202_0 then
				var_202_31.localPosition = Vector3.New(0, -1.2, -6)

				local var_202_38 = manager.ui.mainCamera.transform.position - var_202_31.position

				var_202_31.forward = Vector3.New(var_202_38.x, var_202_38.y, var_202_38.z)

				local var_202_39 = var_202_31.localEulerAngles

				var_202_39.z = 0
				var_202_39.x = 0
				var_202_31.localEulerAngles = var_202_39
			end

			local var_202_40 = arg_199_1.actors_["1049ui_story"]
			local var_202_41 = 2

			if var_202_41 < arg_199_1.time_ and arg_199_1.time_ <= var_202_41 + arg_202_0 and arg_199_1.var_.characterEffect1049ui_story == nil then
				arg_199_1.var_.characterEffect1049ui_story = var_202_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_42 = 0.200000002980232

			if var_202_41 <= arg_199_1.time_ and arg_199_1.time_ < var_202_41 + var_202_42 then
				local var_202_43 = (arg_199_1.time_ - var_202_41) / var_202_42

				if arg_199_1.var_.characterEffect1049ui_story then
					arg_199_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_41 + var_202_42 and arg_199_1.time_ < var_202_41 + var_202_42 + arg_202_0 and arg_199_1.var_.characterEffect1049ui_story then
				arg_199_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_202_44 = 2

			if var_202_44 < arg_199_1.time_ and arg_199_1.time_ <= var_202_44 + arg_202_0 then
				arg_199_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_202_45 = 2

			if var_202_45 < arg_199_1.time_ and arg_199_1.time_ <= var_202_45 + arg_202_0 then
				arg_199_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_202_46 = 0
			local var_202_47 = 0.433333333333333

			if var_202_46 < arg_199_1.time_ and arg_199_1.time_ <= var_202_46 + arg_202_0 then
				local var_202_48 = "play"
				local var_202_49 = "music"

				arg_199_1:AudioAction(var_202_48, var_202_49, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_202_50 = 1.83333333333333
			local var_202_51 = 1

			if var_202_50 < arg_199_1.time_ and arg_199_1.time_ <= var_202_50 + arg_202_0 then
				local var_202_52 = "play"
				local var_202_53 = "music"

				arg_199_1:AudioAction(var_202_52, var_202_53, "bgm_activity_2_4_story_forest", "bgm_activity_2_4_story_forest", "bgm_activity_2_4_story_forest.awb")
			end

			local var_202_54 = 0

			if var_202_54 < arg_199_1.time_ and arg_199_1.time_ <= var_202_54 + arg_202_0 then
				arg_199_1.screenFilterGo_:SetActive(true)

				arg_199_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_202_55 = 4

			if var_202_54 <= arg_199_1.time_ and arg_199_1.time_ < var_202_54 + var_202_55 then
				local var_202_56 = (arg_199_1.time_ - var_202_54) / var_202_55

				arg_199_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_202_56)
			end

			if arg_199_1.time_ >= var_202_54 + var_202_55 and arg_199_1.time_ < var_202_54 + var_202_55 + arg_202_0 then
				arg_199_1.screenFilterEffect_.weight = 1
			end

			local var_202_57 = arg_199_1.actors_["10066ui_story"].transform
			local var_202_58 = 2

			if var_202_58 < arg_199_1.time_ and arg_199_1.time_ <= var_202_58 + arg_202_0 then
				arg_199_1.var_.moveOldPos10066ui_story = var_202_57.localPosition
			end

			local var_202_59 = 0.001

			if var_202_58 <= arg_199_1.time_ and arg_199_1.time_ < var_202_58 + var_202_59 then
				local var_202_60 = (arg_199_1.time_ - var_202_58) / var_202_59
				local var_202_61 = Vector3.New(0, 100, 0)

				var_202_57.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10066ui_story, var_202_61, var_202_60)

				local var_202_62 = manager.ui.mainCamera.transform.position - var_202_57.position

				var_202_57.forward = Vector3.New(var_202_62.x, var_202_62.y, var_202_62.z)

				local var_202_63 = var_202_57.localEulerAngles

				var_202_63.z = 0
				var_202_63.x = 0
				var_202_57.localEulerAngles = var_202_63
			end

			if arg_199_1.time_ >= var_202_58 + var_202_59 and arg_199_1.time_ < var_202_58 + var_202_59 + arg_202_0 then
				var_202_57.localPosition = Vector3.New(0, 100, 0)

				local var_202_64 = manager.ui.mainCamera.transform.position - var_202_57.position

				var_202_57.forward = Vector3.New(var_202_64.x, var_202_64.y, var_202_64.z)

				local var_202_65 = var_202_57.localEulerAngles

				var_202_65.z = 0
				var_202_65.x = 0
				var_202_57.localEulerAngles = var_202_65
			end

			if arg_199_1.frameCnt_ <= 1 then
				arg_199_1.dialog_:SetActive(false)
			end

			local var_202_66 = 4
			local var_202_67 = 0.375

			if var_202_66 < arg_199_1.time_ and arg_199_1.time_ <= var_202_66 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0

				arg_199_1.dialog_:SetActive(true)

				local var_202_68 = LeanTween.value(arg_199_1.dialog_, 0, 1, 0.3)

				var_202_68:setOnUpdate(LuaHelper.FloatAction(function(arg_203_0)
					arg_199_1.dialogCg_.alpha = arg_203_0
				end))
				var_202_68:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_199_1.dialog_)
					var_202_68:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_199_1.duration_ = arg_199_1.duration_ + 0.3

				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_69 = arg_199_1:FormatText(StoryNameCfg[562].name)

				arg_199_1.leftNameTxt_.text = var_202_69

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_70 = arg_199_1:GetWordFromCfg(318082049)
				local var_202_71 = arg_199_1:FormatText(var_202_70.content)

				arg_199_1.text_.text = var_202_71

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_72 = 15
				local var_202_73 = utf8.len(var_202_71)
				local var_202_74 = var_202_72 <= 0 and var_202_67 or var_202_67 * (var_202_73 / var_202_72)

				if var_202_74 > 0 and var_202_67 < var_202_74 then
					arg_199_1.talkMaxDuration = var_202_74
					var_202_66 = var_202_66 + 0.3

					if var_202_74 + var_202_66 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_74 + var_202_66
					end
				end

				arg_199_1.text_.text = var_202_71
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082049", "story_v_out_318082.awb") ~= 0 then
					local var_202_75 = manager.audio:GetVoiceLength("story_v_out_318082", "318082049", "story_v_out_318082.awb") / 1000

					if var_202_75 + var_202_66 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_75 + var_202_66
					end

					if var_202_70.prefab_name ~= "" and arg_199_1.actors_[var_202_70.prefab_name] ~= nil then
						local var_202_76 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_70.prefab_name].transform, "story_v_out_318082", "318082049", "story_v_out_318082.awb")

						arg_199_1:RecordAudio("318082049", var_202_76)
						arg_199_1:RecordAudio("318082049", var_202_76)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_318082", "318082049", "story_v_out_318082.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_318082", "318082049", "story_v_out_318082.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_77 = var_202_66 + 0.3
			local var_202_78 = math.max(var_202_67, arg_199_1.talkMaxDuration)

			if var_202_77 <= arg_199_1.time_ and arg_199_1.time_ < var_202_77 + var_202_78 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_77) / var_202_78

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_77 + var_202_78 and arg_199_1.time_ < var_202_77 + var_202_78 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play318082050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 318082050
		arg_205_1.duration_ = 13.9

		local var_205_0 = {
			zh = 11,
			ja = 13.9
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
				arg_205_0:Play318082051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = "S0601"

			if arg_205_1.bgs_[var_208_0] == nil then
				local var_208_1 = Object.Instantiate(arg_205_1.paintGo_)

				var_208_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_208_0)
				var_208_1.name = var_208_0
				var_208_1.transform.parent = arg_205_1.stage_.transform
				var_208_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_205_1.bgs_[var_208_0] = var_208_1
			end

			local var_208_2 = 2

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				local var_208_3 = manager.ui.mainCamera.transform.localPosition
				local var_208_4 = Vector3.New(0, 0, 10) + Vector3.New(var_208_3.x, var_208_3.y, 0)
				local var_208_5 = arg_205_1.bgs_.S0601

				var_208_5.transform.localPosition = var_208_4
				var_208_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_208_6 = var_208_5:GetComponent("SpriteRenderer")

				if var_208_6 and var_208_6.sprite then
					local var_208_7 = (var_208_5.transform.localPosition - var_208_3).z
					local var_208_8 = manager.ui.mainCameraCom_
					local var_208_9 = 2 * var_208_7 * Mathf.Tan(var_208_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_208_10 = var_208_9 * var_208_8.aspect
					local var_208_11 = var_208_6.sprite.bounds.size.x
					local var_208_12 = var_208_6.sprite.bounds.size.y
					local var_208_13 = var_208_10 / var_208_11
					local var_208_14 = var_208_9 / var_208_12
					local var_208_15 = var_208_14 < var_208_13 and var_208_13 or var_208_14

					var_208_5.transform.localScale = Vector3.New(var_208_15, var_208_15, 0)
				end

				for iter_208_0, iter_208_1 in pairs(arg_205_1.bgs_) do
					if iter_208_0 ~= "S0601" then
						iter_208_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_208_16 = 2

			if var_208_16 < arg_205_1.time_ and arg_205_1.time_ <= var_208_16 + arg_208_0 then
				arg_205_1.mask_.enabled = true
				arg_205_1.mask_.raycastTarget = true

				arg_205_1:SetGaussion(false)
			end

			local var_208_17 = 2

			if var_208_16 <= arg_205_1.time_ and arg_205_1.time_ < var_208_16 + var_208_17 then
				local var_208_18 = (arg_205_1.time_ - var_208_16) / var_208_17
				local var_208_19 = Color.New(0, 0, 0)

				var_208_19.a = Mathf.Lerp(1, 0, var_208_18)
				arg_205_1.mask_.color = var_208_19
			end

			if arg_205_1.time_ >= var_208_16 + var_208_17 and arg_205_1.time_ < var_208_16 + var_208_17 + arg_208_0 then
				local var_208_20 = Color.New(0, 0, 0)
				local var_208_21 = 0

				arg_205_1.mask_.enabled = false
				var_208_20.a = var_208_21
				arg_205_1.mask_.color = var_208_20
			end

			local var_208_22 = 0

			if var_208_22 < arg_205_1.time_ and arg_205_1.time_ <= var_208_22 + arg_208_0 then
				arg_205_1.mask_.enabled = true
				arg_205_1.mask_.raycastTarget = true

				arg_205_1:SetGaussion(false)
			end

			local var_208_23 = 2

			if var_208_22 <= arg_205_1.time_ and arg_205_1.time_ < var_208_22 + var_208_23 then
				local var_208_24 = (arg_205_1.time_ - var_208_22) / var_208_23
				local var_208_25 = Color.New(0, 0, 0)

				var_208_25.a = Mathf.Lerp(0, 1, var_208_24)
				arg_205_1.mask_.color = var_208_25
			end

			if arg_205_1.time_ >= var_208_22 + var_208_23 and arg_205_1.time_ < var_208_22 + var_208_23 + arg_208_0 then
				local var_208_26 = Color.New(0, 0, 0)

				var_208_26.a = 1
				arg_205_1.mask_.color = var_208_26
			end

			local var_208_27 = arg_205_1.actors_["1049ui_story"].transform
			local var_208_28 = 2

			if var_208_28 < arg_205_1.time_ and arg_205_1.time_ <= var_208_28 + arg_208_0 then
				arg_205_1.var_.moveOldPos1049ui_story = var_208_27.localPosition
			end

			local var_208_29 = 0.001

			if var_208_28 <= arg_205_1.time_ and arg_205_1.time_ < var_208_28 + var_208_29 then
				local var_208_30 = (arg_205_1.time_ - var_208_28) / var_208_29
				local var_208_31 = Vector3.New(0, 100, 0)

				var_208_27.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1049ui_story, var_208_31, var_208_30)

				local var_208_32 = manager.ui.mainCamera.transform.position - var_208_27.position

				var_208_27.forward = Vector3.New(var_208_32.x, var_208_32.y, var_208_32.z)

				local var_208_33 = var_208_27.localEulerAngles

				var_208_33.z = 0
				var_208_33.x = 0
				var_208_27.localEulerAngles = var_208_33
			end

			if arg_205_1.time_ >= var_208_28 + var_208_29 and arg_205_1.time_ < var_208_28 + var_208_29 + arg_208_0 then
				var_208_27.localPosition = Vector3.New(0, 100, 0)

				local var_208_34 = manager.ui.mainCamera.transform.position - var_208_27.position

				var_208_27.forward = Vector3.New(var_208_34.x, var_208_34.y, var_208_34.z)

				local var_208_35 = var_208_27.localEulerAngles

				var_208_35.z = 0
				var_208_35.x = 0
				var_208_27.localEulerAngles = var_208_35
			end

			local var_208_36 = arg_205_1.actors_["1049ui_story"]
			local var_208_37 = 2

			if var_208_37 < arg_205_1.time_ and arg_205_1.time_ <= var_208_37 + arg_208_0 and arg_205_1.var_.characterEffect1049ui_story == nil then
				arg_205_1.var_.characterEffect1049ui_story = var_208_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_38 = 0.200000002980232

			if var_208_37 <= arg_205_1.time_ and arg_205_1.time_ < var_208_37 + var_208_38 then
				local var_208_39 = (arg_205_1.time_ - var_208_37) / var_208_38

				if arg_205_1.var_.characterEffect1049ui_story then
					arg_205_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_37 + var_208_38 and arg_205_1.time_ < var_208_37 + var_208_38 + arg_208_0 and arg_205_1.var_.characterEffect1049ui_story then
				arg_205_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_208_40 = 2

			if var_208_40 < arg_205_1.time_ and arg_205_1.time_ <= var_208_40 + arg_208_0 then
				arg_205_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_208_41 = 2

			if var_208_41 < arg_205_1.time_ and arg_205_1.time_ <= var_208_41 + arg_208_0 then
				arg_205_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_205_1.frameCnt_ <= 1 then
				arg_205_1.dialog_:SetActive(false)
			end

			local var_208_42 = 4
			local var_208_43 = 0.775

			if var_208_42 < arg_205_1.time_ and arg_205_1.time_ <= var_208_42 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0

				arg_205_1.dialog_:SetActive(true)

				local var_208_44 = LeanTween.value(arg_205_1.dialog_, 0, 1, 0.3)

				var_208_44:setOnUpdate(LuaHelper.FloatAction(function(arg_209_0)
					arg_205_1.dialogCg_.alpha = arg_209_0
				end))
				var_208_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_205_1.dialog_)
					var_208_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_205_1.duration_ = arg_205_1.duration_ + 0.3

				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_45 = arg_205_1:FormatText(StoryNameCfg[562].name)

				arg_205_1.leftNameTxt_.text = var_208_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, true)
				arg_205_1.iconController_:SetSelectedState("hero")

				arg_205_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_46 = arg_205_1:GetWordFromCfg(318082050)
				local var_208_47 = arg_205_1:FormatText(var_208_46.content)

				arg_205_1.text_.text = var_208_47

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_48 = 31
				local var_208_49 = utf8.len(var_208_47)
				local var_208_50 = var_208_48 <= 0 and var_208_43 or var_208_43 * (var_208_49 / var_208_48)

				if var_208_50 > 0 and var_208_43 < var_208_50 then
					arg_205_1.talkMaxDuration = var_208_50
					var_208_42 = var_208_42 + 0.3

					if var_208_50 + var_208_42 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_50 + var_208_42
					end
				end

				arg_205_1.text_.text = var_208_47
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082050", "story_v_out_318082.awb") ~= 0 then
					local var_208_51 = manager.audio:GetVoiceLength("story_v_out_318082", "318082050", "story_v_out_318082.awb") / 1000

					if var_208_51 + var_208_42 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_51 + var_208_42
					end

					if var_208_46.prefab_name ~= "" and arg_205_1.actors_[var_208_46.prefab_name] ~= nil then
						local var_208_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_46.prefab_name].transform, "story_v_out_318082", "318082050", "story_v_out_318082.awb")

						arg_205_1:RecordAudio("318082050", var_208_52)
						arg_205_1:RecordAudio("318082050", var_208_52)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_318082", "318082050", "story_v_out_318082.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_318082", "318082050", "story_v_out_318082.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_53 = var_208_42 + 0.3
			local var_208_54 = math.max(var_208_43, arg_205_1.talkMaxDuration)

			if var_208_53 <= arg_205_1.time_ and arg_205_1.time_ < var_208_53 + var_208_54 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_53) / var_208_54

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_53 + var_208_54 and arg_205_1.time_ < var_208_53 + var_208_54 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play318082051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 318082051
		arg_211_1.duration_ = 3.9

		local var_211_0 = {
			zh = 3.9,
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
				arg_211_0:Play318082052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.475

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[562].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, true)
				arg_211_1.iconController_:SetSelectedState("hero")

				arg_211_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(318082051)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082051", "story_v_out_318082.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082051", "story_v_out_318082.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_318082", "318082051", "story_v_out_318082.awb")

						arg_211_1:RecordAudio("318082051", var_214_9)
						arg_211_1:RecordAudio("318082051", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_318082", "318082051", "story_v_out_318082.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_318082", "318082051", "story_v_out_318082.awb")
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
	Play318082052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 318082052
		arg_215_1.duration_ = 11.266

		local var_215_0 = {
			zh = 9.833,
			ja = 11.266
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
				arg_215_0:Play318082053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = "S0602"

			if arg_215_1.bgs_[var_218_0] == nil then
				local var_218_1 = Object.Instantiate(arg_215_1.paintGo_)

				var_218_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_218_0)
				var_218_1.name = var_218_0
				var_218_1.transform.parent = arg_215_1.stage_.transform
				var_218_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_215_1.bgs_[var_218_0] = var_218_1
			end

			local var_218_2 = 2

			if var_218_2 < arg_215_1.time_ and arg_215_1.time_ <= var_218_2 + arg_218_0 then
				local var_218_3 = manager.ui.mainCamera.transform.localPosition
				local var_218_4 = Vector3.New(0, 0, 10) + Vector3.New(var_218_3.x, var_218_3.y, 0)
				local var_218_5 = arg_215_1.bgs_.S0602

				var_218_5.transform.localPosition = var_218_4
				var_218_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_218_6 = var_218_5:GetComponent("SpriteRenderer")

				if var_218_6 and var_218_6.sprite then
					local var_218_7 = (var_218_5.transform.localPosition - var_218_3).z
					local var_218_8 = manager.ui.mainCameraCom_
					local var_218_9 = 2 * var_218_7 * Mathf.Tan(var_218_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_218_10 = var_218_9 * var_218_8.aspect
					local var_218_11 = var_218_6.sprite.bounds.size.x
					local var_218_12 = var_218_6.sprite.bounds.size.y
					local var_218_13 = var_218_10 / var_218_11
					local var_218_14 = var_218_9 / var_218_12
					local var_218_15 = var_218_14 < var_218_13 and var_218_13 or var_218_14

					var_218_5.transform.localScale = Vector3.New(var_218_15, var_218_15, 0)
				end

				for iter_218_0, iter_218_1 in pairs(arg_215_1.bgs_) do
					if iter_218_0 ~= "S0602" then
						iter_218_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_218_16 = 2

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				arg_215_1.mask_.enabled = true
				arg_215_1.mask_.raycastTarget = true

				arg_215_1:SetGaussion(false)
			end

			local var_218_17 = 2

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_17 then
				local var_218_18 = (arg_215_1.time_ - var_218_16) / var_218_17
				local var_218_19 = Color.New(0, 0, 0)

				var_218_19.a = Mathf.Lerp(1, 0, var_218_18)
				arg_215_1.mask_.color = var_218_19
			end

			if arg_215_1.time_ >= var_218_16 + var_218_17 and arg_215_1.time_ < var_218_16 + var_218_17 + arg_218_0 then
				local var_218_20 = Color.New(0, 0, 0)
				local var_218_21 = 0

				arg_215_1.mask_.enabled = false
				var_218_20.a = var_218_21
				arg_215_1.mask_.color = var_218_20
			end

			local var_218_22 = 0

			if var_218_22 < arg_215_1.time_ and arg_215_1.time_ <= var_218_22 + arg_218_0 then
				arg_215_1.mask_.enabled = true
				arg_215_1.mask_.raycastTarget = true

				arg_215_1:SetGaussion(false)
			end

			local var_218_23 = 2

			if var_218_22 <= arg_215_1.time_ and arg_215_1.time_ < var_218_22 + var_218_23 then
				local var_218_24 = (arg_215_1.time_ - var_218_22) / var_218_23
				local var_218_25 = Color.New(0, 0, 0)

				var_218_25.a = Mathf.Lerp(0, 1, var_218_24)
				arg_215_1.mask_.color = var_218_25
			end

			if arg_215_1.time_ >= var_218_22 + var_218_23 and arg_215_1.time_ < var_218_22 + var_218_23 + arg_218_0 then
				local var_218_26 = Color.New(0, 0, 0)

				var_218_26.a = 1
				arg_215_1.mask_.color = var_218_26
			end

			if arg_215_1.frameCnt_ <= 1 then
				arg_215_1.dialog_:SetActive(false)
			end

			local var_218_27 = 4
			local var_218_28 = 0.75

			if var_218_27 < arg_215_1.time_ and arg_215_1.time_ <= var_218_27 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0

				arg_215_1.dialog_:SetActive(true)

				local var_218_29 = LeanTween.value(arg_215_1.dialog_, 0, 1, 0.3)

				var_218_29:setOnUpdate(LuaHelper.FloatAction(function(arg_219_0)
					arg_215_1.dialogCg_.alpha = arg_219_0
				end))
				var_218_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_215_1.dialog_)
					var_218_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_215_1.duration_ = arg_215_1.duration_ + 0.3

				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_30 = arg_215_1:FormatText(StoryNameCfg[562].name)

				arg_215_1.leftNameTxt_.text = var_218_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_31 = arg_215_1:GetWordFromCfg(318082052)
				local var_218_32 = arg_215_1:FormatText(var_218_31.content)

				arg_215_1.text_.text = var_218_32

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_33 = 30
				local var_218_34 = utf8.len(var_218_32)
				local var_218_35 = var_218_33 <= 0 and var_218_28 or var_218_28 * (var_218_34 / var_218_33)

				if var_218_35 > 0 and var_218_28 < var_218_35 then
					arg_215_1.talkMaxDuration = var_218_35
					var_218_27 = var_218_27 + 0.3

					if var_218_35 + var_218_27 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_35 + var_218_27
					end
				end

				arg_215_1.text_.text = var_218_32
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082052", "story_v_out_318082.awb") ~= 0 then
					local var_218_36 = manager.audio:GetVoiceLength("story_v_out_318082", "318082052", "story_v_out_318082.awb") / 1000

					if var_218_36 + var_218_27 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_36 + var_218_27
					end

					if var_218_31.prefab_name ~= "" and arg_215_1.actors_[var_218_31.prefab_name] ~= nil then
						local var_218_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_31.prefab_name].transform, "story_v_out_318082", "318082052", "story_v_out_318082.awb")

						arg_215_1:RecordAudio("318082052", var_218_37)
						arg_215_1:RecordAudio("318082052", var_218_37)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_318082", "318082052", "story_v_out_318082.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_318082", "318082052", "story_v_out_318082.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_38 = var_218_27 + 0.3
			local var_218_39 = math.max(var_218_28, arg_215_1.talkMaxDuration)

			if var_218_38 <= arg_215_1.time_ and arg_215_1.time_ < var_218_38 + var_218_39 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_38) / var_218_39

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_38 + var_218_39 and arg_215_1.time_ < var_218_38 + var_218_39 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play318082053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 318082053
		arg_221_1.duration_ = 10.8

		local var_221_0 = {
			zh = 8.566,
			ja = 10.8
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
				arg_221_0:Play318082054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = "S0603"

			if arg_221_1.bgs_[var_224_0] == nil then
				local var_224_1 = Object.Instantiate(arg_221_1.paintGo_)

				var_224_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_224_0)
				var_224_1.name = var_224_0
				var_224_1.transform.parent = arg_221_1.stage_.transform
				var_224_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_221_1.bgs_[var_224_0] = var_224_1
			end

			local var_224_2 = 2

			if var_224_2 < arg_221_1.time_ and arg_221_1.time_ <= var_224_2 + arg_224_0 then
				local var_224_3 = manager.ui.mainCamera.transform.localPosition
				local var_224_4 = Vector3.New(0, 0, 10) + Vector3.New(var_224_3.x, var_224_3.y, 0)
				local var_224_5 = arg_221_1.bgs_.S0603

				var_224_5.transform.localPosition = var_224_4
				var_224_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_224_6 = var_224_5:GetComponent("SpriteRenderer")

				if var_224_6 and var_224_6.sprite then
					local var_224_7 = (var_224_5.transform.localPosition - var_224_3).z
					local var_224_8 = manager.ui.mainCameraCom_
					local var_224_9 = 2 * var_224_7 * Mathf.Tan(var_224_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_224_10 = var_224_9 * var_224_8.aspect
					local var_224_11 = var_224_6.sprite.bounds.size.x
					local var_224_12 = var_224_6.sprite.bounds.size.y
					local var_224_13 = var_224_10 / var_224_11
					local var_224_14 = var_224_9 / var_224_12
					local var_224_15 = var_224_14 < var_224_13 and var_224_13 or var_224_14

					var_224_5.transform.localScale = Vector3.New(var_224_15, var_224_15, 0)
				end

				for iter_224_0, iter_224_1 in pairs(arg_221_1.bgs_) do
					if iter_224_0 ~= "S0603" then
						iter_224_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_224_16 = 0

			if var_224_16 < arg_221_1.time_ and arg_221_1.time_ <= var_224_16 + arg_224_0 then
				arg_221_1.mask_.enabled = true
				arg_221_1.mask_.raycastTarget = true

				arg_221_1:SetGaussion(false)
			end

			local var_224_17 = 2

			if var_224_16 <= arg_221_1.time_ and arg_221_1.time_ < var_224_16 + var_224_17 then
				local var_224_18 = (arg_221_1.time_ - var_224_16) / var_224_17
				local var_224_19 = Color.New(0, 0, 0)

				var_224_19.a = Mathf.Lerp(0, 1, var_224_18)
				arg_221_1.mask_.color = var_224_19
			end

			if arg_221_1.time_ >= var_224_16 + var_224_17 and arg_221_1.time_ < var_224_16 + var_224_17 + arg_224_0 then
				local var_224_20 = Color.New(0, 0, 0)

				var_224_20.a = 1
				arg_221_1.mask_.color = var_224_20
			end

			local var_224_21 = 2

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 then
				arg_221_1.mask_.enabled = true
				arg_221_1.mask_.raycastTarget = true

				arg_221_1:SetGaussion(false)
			end

			local var_224_22 = 2

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_22 then
				local var_224_23 = (arg_221_1.time_ - var_224_21) / var_224_22
				local var_224_24 = Color.New(0, 0, 0)

				var_224_24.a = Mathf.Lerp(1, 0, var_224_23)
				arg_221_1.mask_.color = var_224_24
			end

			if arg_221_1.time_ >= var_224_21 + var_224_22 and arg_221_1.time_ < var_224_21 + var_224_22 + arg_224_0 then
				local var_224_25 = Color.New(0, 0, 0)
				local var_224_26 = 0

				arg_221_1.mask_.enabled = false
				var_224_25.a = var_224_26
				arg_221_1.mask_.color = var_224_25
			end

			if arg_221_1.frameCnt_ <= 1 then
				arg_221_1.dialog_:SetActive(false)
			end

			local var_224_27 = 4
			local var_224_28 = 0.55

			if var_224_27 < arg_221_1.time_ and arg_221_1.time_ <= var_224_27 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0

				arg_221_1.dialog_:SetActive(true)

				local var_224_29 = LeanTween.value(arg_221_1.dialog_, 0, 1, 0.3)

				var_224_29:setOnUpdate(LuaHelper.FloatAction(function(arg_225_0)
					arg_221_1.dialogCg_.alpha = arg_225_0
				end))
				var_224_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_221_1.dialog_)
					var_224_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_221_1.duration_ = arg_221_1.duration_ + 0.3

				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_30 = arg_221_1:FormatText(StoryNameCfg[562].name)

				arg_221_1.leftNameTxt_.text = var_224_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_31 = arg_221_1:GetWordFromCfg(318082053)
				local var_224_32 = arg_221_1:FormatText(var_224_31.content)

				arg_221_1.text_.text = var_224_32

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_33 = 22
				local var_224_34 = utf8.len(var_224_32)
				local var_224_35 = var_224_33 <= 0 and var_224_28 or var_224_28 * (var_224_34 / var_224_33)

				if var_224_35 > 0 and var_224_28 < var_224_35 then
					arg_221_1.talkMaxDuration = var_224_35
					var_224_27 = var_224_27 + 0.3

					if var_224_35 + var_224_27 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_35 + var_224_27
					end
				end

				arg_221_1.text_.text = var_224_32
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082053", "story_v_out_318082.awb") ~= 0 then
					local var_224_36 = manager.audio:GetVoiceLength("story_v_out_318082", "318082053", "story_v_out_318082.awb") / 1000

					if var_224_36 + var_224_27 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_36 + var_224_27
					end

					if var_224_31.prefab_name ~= "" and arg_221_1.actors_[var_224_31.prefab_name] ~= nil then
						local var_224_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_31.prefab_name].transform, "story_v_out_318082", "318082053", "story_v_out_318082.awb")

						arg_221_1:RecordAudio("318082053", var_224_37)
						arg_221_1:RecordAudio("318082053", var_224_37)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_318082", "318082053", "story_v_out_318082.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_318082", "318082053", "story_v_out_318082.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_38 = var_224_27 + 0.3
			local var_224_39 = math.max(var_224_28, arg_221_1.talkMaxDuration)

			if var_224_38 <= arg_221_1.time_ and arg_221_1.time_ < var_224_38 + var_224_39 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_38) / var_224_39

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_38 + var_224_39 and arg_221_1.time_ < var_224_38 + var_224_39 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play318082054 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 318082054
		arg_227_1.duration_ = 5.966

		local var_227_0 = {
			zh = 4.4,
			ja = 5.966
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
				arg_227_0:Play318082055(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.45

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[562].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, true)
				arg_227_1.iconController_:SetSelectedState("hero")

				arg_227_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1049")

				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(318082054)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082054", "story_v_out_318082.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082054", "story_v_out_318082.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_318082", "318082054", "story_v_out_318082.awb")

						arg_227_1:RecordAudio("318082054", var_230_9)
						arg_227_1:RecordAudio("318082054", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_318082", "318082054", "story_v_out_318082.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_318082", "318082054", "story_v_out_318082.awb")
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
	Play318082055 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 318082055
		arg_231_1.duration_ = 15.766

		local var_231_0 = {
			zh = 10,
			ja = 15.766
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
				arg_231_0:Play318082056(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 2

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				local var_234_1 = manager.ui.mainCamera.transform.localPosition
				local var_234_2 = Vector3.New(0, 0, 10) + Vector3.New(var_234_1.x, var_234_1.y, 0)
				local var_234_3 = arg_231_1.bgs_.K01f

				var_234_3.transform.localPosition = var_234_2
				var_234_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_234_4 = var_234_3:GetComponent("SpriteRenderer")

				if var_234_4 and var_234_4.sprite then
					local var_234_5 = (var_234_3.transform.localPosition - var_234_1).z
					local var_234_6 = manager.ui.mainCameraCom_
					local var_234_7 = 2 * var_234_5 * Mathf.Tan(var_234_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_234_8 = var_234_7 * var_234_6.aspect
					local var_234_9 = var_234_4.sprite.bounds.size.x
					local var_234_10 = var_234_4.sprite.bounds.size.y
					local var_234_11 = var_234_8 / var_234_9
					local var_234_12 = var_234_7 / var_234_10
					local var_234_13 = var_234_12 < var_234_11 and var_234_11 or var_234_12

					var_234_3.transform.localScale = Vector3.New(var_234_13, var_234_13, 0)
				end

				for iter_234_0, iter_234_1 in pairs(arg_231_1.bgs_) do
					if iter_234_0 ~= "K01f" then
						iter_234_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_234_14 = 2

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1.mask_.enabled = true
				arg_231_1.mask_.raycastTarget = true

				arg_231_1:SetGaussion(false)
			end

			local var_234_15 = 2

			if var_234_14 <= arg_231_1.time_ and arg_231_1.time_ < var_234_14 + var_234_15 then
				local var_234_16 = (arg_231_1.time_ - var_234_14) / var_234_15
				local var_234_17 = Color.New(0, 0, 0)

				var_234_17.a = Mathf.Lerp(1, 0, var_234_16)
				arg_231_1.mask_.color = var_234_17
			end

			if arg_231_1.time_ >= var_234_14 + var_234_15 and arg_231_1.time_ < var_234_14 + var_234_15 + arg_234_0 then
				local var_234_18 = Color.New(0, 0, 0)
				local var_234_19 = 0

				arg_231_1.mask_.enabled = false
				var_234_18.a = var_234_19
				arg_231_1.mask_.color = var_234_18
			end

			local var_234_20 = 0

			if var_234_20 < arg_231_1.time_ and arg_231_1.time_ <= var_234_20 + arg_234_0 then
				arg_231_1.mask_.enabled = true
				arg_231_1.mask_.raycastTarget = true

				arg_231_1:SetGaussion(false)
			end

			local var_234_21 = 2

			if var_234_20 <= arg_231_1.time_ and arg_231_1.time_ < var_234_20 + var_234_21 then
				local var_234_22 = (arg_231_1.time_ - var_234_20) / var_234_21
				local var_234_23 = Color.New(0, 0, 0)

				var_234_23.a = Mathf.Lerp(0, 1, var_234_22)
				arg_231_1.mask_.color = var_234_23
			end

			if arg_231_1.time_ >= var_234_20 + var_234_21 and arg_231_1.time_ < var_234_20 + var_234_21 + arg_234_0 then
				local var_234_24 = Color.New(0, 0, 0)

				var_234_24.a = 1
				arg_231_1.mask_.color = var_234_24
			end

			local var_234_25 = arg_231_1.actors_["1049ui_story"].transform
			local var_234_26 = 2

			if var_234_26 < arg_231_1.time_ and arg_231_1.time_ <= var_234_26 + arg_234_0 then
				arg_231_1.var_.moveOldPos1049ui_story = var_234_25.localPosition
			end

			local var_234_27 = 0.001

			if var_234_26 <= arg_231_1.time_ and arg_231_1.time_ < var_234_26 + var_234_27 then
				local var_234_28 = (arg_231_1.time_ - var_234_26) / var_234_27
				local var_234_29 = Vector3.New(0, -1.2, -6)

				var_234_25.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1049ui_story, var_234_29, var_234_28)

				local var_234_30 = manager.ui.mainCamera.transform.position - var_234_25.position

				var_234_25.forward = Vector3.New(var_234_30.x, var_234_30.y, var_234_30.z)

				local var_234_31 = var_234_25.localEulerAngles

				var_234_31.z = 0
				var_234_31.x = 0
				var_234_25.localEulerAngles = var_234_31
			end

			if arg_231_1.time_ >= var_234_26 + var_234_27 and arg_231_1.time_ < var_234_26 + var_234_27 + arg_234_0 then
				var_234_25.localPosition = Vector3.New(0, -1.2, -6)

				local var_234_32 = manager.ui.mainCamera.transform.position - var_234_25.position

				var_234_25.forward = Vector3.New(var_234_32.x, var_234_32.y, var_234_32.z)

				local var_234_33 = var_234_25.localEulerAngles

				var_234_33.z = 0
				var_234_33.x = 0
				var_234_25.localEulerAngles = var_234_33
			end

			local var_234_34 = arg_231_1.actors_["1049ui_story"]
			local var_234_35 = 2

			if var_234_35 < arg_231_1.time_ and arg_231_1.time_ <= var_234_35 + arg_234_0 and arg_231_1.var_.characterEffect1049ui_story == nil then
				arg_231_1.var_.characterEffect1049ui_story = var_234_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_36 = 0.200000002980232

			if var_234_35 <= arg_231_1.time_ and arg_231_1.time_ < var_234_35 + var_234_36 then
				local var_234_37 = (arg_231_1.time_ - var_234_35) / var_234_36

				if arg_231_1.var_.characterEffect1049ui_story then
					arg_231_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_35 + var_234_36 and arg_231_1.time_ < var_234_35 + var_234_36 + arg_234_0 and arg_231_1.var_.characterEffect1049ui_story then
				arg_231_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_234_38 = 2

			if var_234_38 < arg_231_1.time_ and arg_231_1.time_ <= var_234_38 + arg_234_0 then
				arg_231_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			if arg_231_1.frameCnt_ <= 1 then
				arg_231_1.dialog_:SetActive(false)
			end

			local var_234_39 = 4
			local var_234_40 = 0.8

			if var_234_39 < arg_231_1.time_ and arg_231_1.time_ <= var_234_39 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0

				arg_231_1.dialog_:SetActive(true)

				local var_234_41 = LeanTween.value(arg_231_1.dialog_, 0, 1, 0.3)

				var_234_41:setOnUpdate(LuaHelper.FloatAction(function(arg_235_0)
					arg_231_1.dialogCg_.alpha = arg_235_0
				end))
				var_234_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_231_1.dialog_)
					var_234_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_231_1.duration_ = arg_231_1.duration_ + 0.3

				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_42 = arg_231_1:FormatText(StoryNameCfg[562].name)

				arg_231_1.leftNameTxt_.text = var_234_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_43 = arg_231_1:GetWordFromCfg(318082055)
				local var_234_44 = arg_231_1:FormatText(var_234_43.content)

				arg_231_1.text_.text = var_234_44

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_45 = 32
				local var_234_46 = utf8.len(var_234_44)
				local var_234_47 = var_234_45 <= 0 and var_234_40 or var_234_40 * (var_234_46 / var_234_45)

				if var_234_47 > 0 and var_234_40 < var_234_47 then
					arg_231_1.talkMaxDuration = var_234_47
					var_234_39 = var_234_39 + 0.3

					if var_234_47 + var_234_39 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_47 + var_234_39
					end
				end

				arg_231_1.text_.text = var_234_44
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082055", "story_v_out_318082.awb") ~= 0 then
					local var_234_48 = manager.audio:GetVoiceLength("story_v_out_318082", "318082055", "story_v_out_318082.awb") / 1000

					if var_234_48 + var_234_39 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_48 + var_234_39
					end

					if var_234_43.prefab_name ~= "" and arg_231_1.actors_[var_234_43.prefab_name] ~= nil then
						local var_234_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_43.prefab_name].transform, "story_v_out_318082", "318082055", "story_v_out_318082.awb")

						arg_231_1:RecordAudio("318082055", var_234_49)
						arg_231_1:RecordAudio("318082055", var_234_49)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_318082", "318082055", "story_v_out_318082.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_318082", "318082055", "story_v_out_318082.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_50 = var_234_39 + 0.3
			local var_234_51 = math.max(var_234_40, arg_231_1.talkMaxDuration)

			if var_234_50 <= arg_231_1.time_ and arg_231_1.time_ < var_234_50 + var_234_51 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_50) / var_234_51

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_50 + var_234_51 and arg_231_1.time_ < var_234_50 + var_234_51 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play318082056 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 318082056
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play318082057(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1049ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1049ui_story == nil then
				arg_237_1.var_.characterEffect1049ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1049ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1049ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1049ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1049ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0
			local var_240_7 = 0.85

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[7].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(318082056)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 34
				local var_240_12 = utf8.len(var_240_10)
				local var_240_13 = var_240_11 <= 0 and var_240_7 or var_240_7 * (var_240_12 / var_240_11)

				if var_240_13 > 0 and var_240_7 < var_240_13 then
					arg_237_1.talkMaxDuration = var_240_13

					if var_240_13 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_13 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_10
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_14 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_14 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_14

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_14 and arg_237_1.time_ < var_240_6 + var_240_14 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play318082057 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 318082057
		arg_241_1.duration_ = 6

		local var_241_0 = {
			zh = 2.4,
			ja = 6
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
				arg_241_0:Play318082058(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1049ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1049ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0, -1.2, -6)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1049ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = arg_241_1.actors_["1049ui_story"]
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 and arg_241_1.var_.characterEffect1049ui_story == nil then
				arg_241_1.var_.characterEffect1049ui_story = var_244_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_11 = 0.200000002980232

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11

				if arg_241_1.var_.characterEffect1049ui_story then
					arg_241_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 and arg_241_1.var_.characterEffect1049ui_story then
				arg_241_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_244_13 = 0

			if var_244_13 < arg_241_1.time_ and arg_241_1.time_ <= var_244_13 + arg_244_0 then
				arg_241_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action6_1")
			end

			local var_244_14 = 0

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 then
				arg_241_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_244_15 = 0
			local var_244_16 = 0.325

			if var_244_15 < arg_241_1.time_ and arg_241_1.time_ <= var_244_15 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_17 = arg_241_1:FormatText(StoryNameCfg[562].name)

				arg_241_1.leftNameTxt_.text = var_244_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_18 = arg_241_1:GetWordFromCfg(318082057)
				local var_244_19 = arg_241_1:FormatText(var_244_18.content)

				arg_241_1.text_.text = var_244_19

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_20 = 13
				local var_244_21 = utf8.len(var_244_19)
				local var_244_22 = var_244_20 <= 0 and var_244_16 or var_244_16 * (var_244_21 / var_244_20)

				if var_244_22 > 0 and var_244_16 < var_244_22 then
					arg_241_1.talkMaxDuration = var_244_22

					if var_244_22 + var_244_15 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_22 + var_244_15
					end
				end

				arg_241_1.text_.text = var_244_19
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082057", "story_v_out_318082.awb") ~= 0 then
					local var_244_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082057", "story_v_out_318082.awb") / 1000

					if var_244_23 + var_244_15 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_23 + var_244_15
					end

					if var_244_18.prefab_name ~= "" and arg_241_1.actors_[var_244_18.prefab_name] ~= nil then
						local var_244_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_18.prefab_name].transform, "story_v_out_318082", "318082057", "story_v_out_318082.awb")

						arg_241_1:RecordAudio("318082057", var_244_24)
						arg_241_1:RecordAudio("318082057", var_244_24)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_318082", "318082057", "story_v_out_318082.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_318082", "318082057", "story_v_out_318082.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_25 = math.max(var_244_16, arg_241_1.talkMaxDuration)

			if var_244_15 <= arg_241_1.time_ and arg_241_1.time_ < var_244_15 + var_244_25 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_15) / var_244_25

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_15 + var_244_25 and arg_241_1.time_ < var_244_15 + var_244_25 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play318082058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 318082058
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play318082059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1049ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1049ui_story == nil then
				arg_245_1.var_.characterEffect1049ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1049ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1049ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1049ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1049ui_story.fillRatio = var_248_5
			end

			local var_248_6 = 0
			local var_248_7 = 0.7

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[7].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(318082058)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 28
				local var_248_12 = utf8.len(var_248_10)
				local var_248_13 = var_248_11 <= 0 and var_248_7 or var_248_7 * (var_248_12 / var_248_11)

				if var_248_13 > 0 and var_248_7 < var_248_13 then
					arg_245_1.talkMaxDuration = var_248_13

					if var_248_13 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_10
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_14 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_14 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_14

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_14 and arg_245_1.time_ < var_248_6 + var_248_14 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play318082059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 318082059
		arg_249_1.duration_ = 15.066

		local var_249_0 = {
			zh = 12.7,
			ja = 15.066
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
				arg_249_0:Play318082060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1049ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1049ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, -1.2, -6)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1049ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1049ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1049ui_story == nil then
				arg_249_1.var_.characterEffect1049ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1049ui_story then
					arg_249_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect1049ui_story then
				arg_249_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action6_2")
			end

			local var_252_15 = 0
			local var_252_16 = 1.525

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_17 = arg_249_1:FormatText(StoryNameCfg[562].name)

				arg_249_1.leftNameTxt_.text = var_252_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_18 = arg_249_1:GetWordFromCfg(318082059)
				local var_252_19 = arg_249_1:FormatText(var_252_18.content)

				arg_249_1.text_.text = var_252_19

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_20 = 61
				local var_252_21 = utf8.len(var_252_19)
				local var_252_22 = var_252_20 <= 0 and var_252_16 or var_252_16 * (var_252_21 / var_252_20)

				if var_252_22 > 0 and var_252_16 < var_252_22 then
					arg_249_1.talkMaxDuration = var_252_22

					if var_252_22 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_22 + var_252_15
					end
				end

				arg_249_1.text_.text = var_252_19
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082059", "story_v_out_318082.awb") ~= 0 then
					local var_252_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082059", "story_v_out_318082.awb") / 1000

					if var_252_23 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_23 + var_252_15
					end

					if var_252_18.prefab_name ~= "" and arg_249_1.actors_[var_252_18.prefab_name] ~= nil then
						local var_252_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_18.prefab_name].transform, "story_v_out_318082", "318082059", "story_v_out_318082.awb")

						arg_249_1:RecordAudio("318082059", var_252_24)
						arg_249_1:RecordAudio("318082059", var_252_24)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_318082", "318082059", "story_v_out_318082.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_318082", "318082059", "story_v_out_318082.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_25 = math.max(var_252_16, arg_249_1.talkMaxDuration)

			if var_252_15 <= arg_249_1.time_ and arg_249_1.time_ < var_252_15 + var_252_25 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_15) / var_252_25

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_15 + var_252_25 and arg_249_1.time_ < var_252_15 + var_252_25 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play318082060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 318082060
		arg_253_1.duration_ = 10.633

		local var_253_0 = {
			zh = 8.366,
			ja = 10.633
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
				arg_253_0:Play318082061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1049ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1049ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0, -1.2, -6)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1049ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = 0

			if var_256_9 < arg_253_1.time_ and arg_253_1.time_ <= var_256_9 + arg_256_0 then
				arg_253_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action5_1")
			end

			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 then
				arg_253_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_256_11 = 0
			local var_256_12 = 0.9

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_13 = arg_253_1:FormatText(StoryNameCfg[562].name)

				arg_253_1.leftNameTxt_.text = var_256_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_14 = arg_253_1:GetWordFromCfg(318082060)
				local var_256_15 = arg_253_1:FormatText(var_256_14.content)

				arg_253_1.text_.text = var_256_15

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_16 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082060", "story_v_out_318082.awb") ~= 0 then
					local var_256_19 = manager.audio:GetVoiceLength("story_v_out_318082", "318082060", "story_v_out_318082.awb") / 1000

					if var_256_19 + var_256_11 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_19 + var_256_11
					end

					if var_256_14.prefab_name ~= "" and arg_253_1.actors_[var_256_14.prefab_name] ~= nil then
						local var_256_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_14.prefab_name].transform, "story_v_out_318082", "318082060", "story_v_out_318082.awb")

						arg_253_1:RecordAudio("318082060", var_256_20)
						arg_253_1:RecordAudio("318082060", var_256_20)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_318082", "318082060", "story_v_out_318082.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_318082", "318082060", "story_v_out_318082.awb")
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
	Play318082061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 318082061
		arg_257_1.duration_ = 13.8

		local var_257_0 = {
			zh = 8.633,
			ja = 13.8
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
				arg_257_0:Play318082062(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1049ui_story"].transform
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				arg_257_1.var_.moveOldPos1049ui_story = var_260_0.localPosition
			end

			local var_260_2 = 0.001

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2
				local var_260_4 = Vector3.New(0, -1.2, -6)

				var_260_0.localPosition = Vector3.Lerp(arg_257_1.var_.moveOldPos1049ui_story, var_260_4, var_260_3)

				local var_260_5 = manager.ui.mainCamera.transform.position - var_260_0.position

				var_260_0.forward = Vector3.New(var_260_5.x, var_260_5.y, var_260_5.z)

				local var_260_6 = var_260_0.localEulerAngles

				var_260_6.z = 0
				var_260_6.x = 0
				var_260_0.localEulerAngles = var_260_6
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 then
				var_260_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_260_7 = manager.ui.mainCamera.transform.position - var_260_0.position

				var_260_0.forward = Vector3.New(var_260_7.x, var_260_7.y, var_260_7.z)

				local var_260_8 = var_260_0.localEulerAngles

				var_260_8.z = 0
				var_260_8.x = 0
				var_260_0.localEulerAngles = var_260_8
			end

			local var_260_9 = 0
			local var_260_10 = 0.9

			if var_260_9 < arg_257_1.time_ and arg_257_1.time_ <= var_260_9 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_11 = arg_257_1:FormatText(StoryNameCfg[562].name)

				arg_257_1.leftNameTxt_.text = var_260_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_12 = arg_257_1:GetWordFromCfg(318082061)
				local var_260_13 = arg_257_1:FormatText(var_260_12.content)

				arg_257_1.text_.text = var_260_13

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_14 = 36
				local var_260_15 = utf8.len(var_260_13)
				local var_260_16 = var_260_14 <= 0 and var_260_10 or var_260_10 * (var_260_15 / var_260_14)

				if var_260_16 > 0 and var_260_10 < var_260_16 then
					arg_257_1.talkMaxDuration = var_260_16

					if var_260_16 + var_260_9 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_16 + var_260_9
					end
				end

				arg_257_1.text_.text = var_260_13
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082061", "story_v_out_318082.awb") ~= 0 then
					local var_260_17 = manager.audio:GetVoiceLength("story_v_out_318082", "318082061", "story_v_out_318082.awb") / 1000

					if var_260_17 + var_260_9 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_17 + var_260_9
					end

					if var_260_12.prefab_name ~= "" and arg_257_1.actors_[var_260_12.prefab_name] ~= nil then
						local var_260_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_12.prefab_name].transform, "story_v_out_318082", "318082061", "story_v_out_318082.awb")

						arg_257_1:RecordAudio("318082061", var_260_18)
						arg_257_1:RecordAudio("318082061", var_260_18)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_318082", "318082061", "story_v_out_318082.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_318082", "318082061", "story_v_out_318082.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_19 = math.max(var_260_10, arg_257_1.talkMaxDuration)

			if var_260_9 <= arg_257_1.time_ and arg_257_1.time_ < var_260_9 + var_260_19 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_9) / var_260_19

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_9 + var_260_19 and arg_257_1.time_ < var_260_9 + var_260_19 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play318082062 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 318082062
		arg_261_1.duration_ = 14.966

		local var_261_0 = {
			zh = 14.966,
			ja = 14.7
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
				arg_261_0:Play318082063(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1049ui_story"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1049ui_story = var_264_0.localPosition
			end

			local var_264_2 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2
				local var_264_4 = Vector3.New(0, -1.2, -6)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1049ui_story, var_264_4, var_264_3)

				local var_264_5 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_5.x, var_264_5.y, var_264_5.z)

				local var_264_6 = var_264_0.localEulerAngles

				var_264_6.z = 0
				var_264_6.x = 0
				var_264_0.localEulerAngles = var_264_6
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_264_7 = manager.ui.mainCamera.transform.position - var_264_0.position

				var_264_0.forward = Vector3.New(var_264_7.x, var_264_7.y, var_264_7.z)

				local var_264_8 = var_264_0.localEulerAngles

				var_264_8.z = 0
				var_264_8.x = 0
				var_264_0.localEulerAngles = var_264_8
			end

			local var_264_9 = 0
			local var_264_10 = 1.425

			if var_264_9 < arg_261_1.time_ and arg_261_1.time_ <= var_264_9 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_11 = arg_261_1:FormatText(StoryNameCfg[562].name)

				arg_261_1.leftNameTxt_.text = var_264_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_12 = arg_261_1:GetWordFromCfg(318082062)
				local var_264_13 = arg_261_1:FormatText(var_264_12.content)

				arg_261_1.text_.text = var_264_13

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_14 = 57
				local var_264_15 = utf8.len(var_264_13)
				local var_264_16 = var_264_14 <= 0 and var_264_10 or var_264_10 * (var_264_15 / var_264_14)

				if var_264_16 > 0 and var_264_10 < var_264_16 then
					arg_261_1.talkMaxDuration = var_264_16

					if var_264_16 + var_264_9 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_16 + var_264_9
					end
				end

				arg_261_1.text_.text = var_264_13
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082062", "story_v_out_318082.awb") ~= 0 then
					local var_264_17 = manager.audio:GetVoiceLength("story_v_out_318082", "318082062", "story_v_out_318082.awb") / 1000

					if var_264_17 + var_264_9 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_17 + var_264_9
					end

					if var_264_12.prefab_name ~= "" and arg_261_1.actors_[var_264_12.prefab_name] ~= nil then
						local var_264_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_12.prefab_name].transform, "story_v_out_318082", "318082062", "story_v_out_318082.awb")

						arg_261_1:RecordAudio("318082062", var_264_18)
						arg_261_1:RecordAudio("318082062", var_264_18)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_318082", "318082062", "story_v_out_318082.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_318082", "318082062", "story_v_out_318082.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_19 = math.max(var_264_10, arg_261_1.talkMaxDuration)

			if var_264_9 <= arg_261_1.time_ and arg_261_1.time_ < var_264_9 + var_264_19 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_9) / var_264_19

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_9 + var_264_19 and arg_261_1.time_ < var_264_9 + var_264_19 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play318082063 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 318082063
		arg_265_1.duration_ = 15.833

		local var_265_0 = {
			zh = 15.833,
			ja = 14.433
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
				arg_265_0:Play318082064(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1049ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1049ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(0, -1.2, -6)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1049ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = 0
			local var_268_10 = 1.775

			if var_268_9 < arg_265_1.time_ and arg_265_1.time_ <= var_268_9 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_11 = arg_265_1:FormatText(StoryNameCfg[562].name)

				arg_265_1.leftNameTxt_.text = var_268_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_12 = arg_265_1:GetWordFromCfg(318082063)
				local var_268_13 = arg_265_1:FormatText(var_268_12.content)

				arg_265_1.text_.text = var_268_13

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_14 = 71
				local var_268_15 = utf8.len(var_268_13)
				local var_268_16 = var_268_14 <= 0 and var_268_10 or var_268_10 * (var_268_15 / var_268_14)

				if var_268_16 > 0 and var_268_10 < var_268_16 then
					arg_265_1.talkMaxDuration = var_268_16

					if var_268_16 + var_268_9 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_16 + var_268_9
					end
				end

				arg_265_1.text_.text = var_268_13
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082063", "story_v_out_318082.awb") ~= 0 then
					local var_268_17 = manager.audio:GetVoiceLength("story_v_out_318082", "318082063", "story_v_out_318082.awb") / 1000

					if var_268_17 + var_268_9 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_17 + var_268_9
					end

					if var_268_12.prefab_name ~= "" and arg_265_1.actors_[var_268_12.prefab_name] ~= nil then
						local var_268_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_12.prefab_name].transform, "story_v_out_318082", "318082063", "story_v_out_318082.awb")

						arg_265_1:RecordAudio("318082063", var_268_18)
						arg_265_1:RecordAudio("318082063", var_268_18)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_318082", "318082063", "story_v_out_318082.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_318082", "318082063", "story_v_out_318082.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_19 = math.max(var_268_10, arg_265_1.talkMaxDuration)

			if var_268_9 <= arg_265_1.time_ and arg_265_1.time_ < var_268_9 + var_268_19 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_9) / var_268_19

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_9 + var_268_19 and arg_265_1.time_ < var_268_9 + var_268_19 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play318082064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 318082064
		arg_269_1.duration_ = 13.833

		local var_269_0 = {
			zh = 4.666,
			ja = 13.833
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
				arg_269_0:Play318082065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1049ui_story"].transform
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 then
				arg_269_1.var_.moveOldPos1049ui_story = var_272_0.localPosition
			end

			local var_272_2 = 0.001

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2
				local var_272_4 = Vector3.New(0, -1.2, -6)

				var_272_0.localPosition = Vector3.Lerp(arg_269_1.var_.moveOldPos1049ui_story, var_272_4, var_272_3)

				local var_272_5 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_5.x, var_272_5.y, var_272_5.z)

				local var_272_6 = var_272_0.localEulerAngles

				var_272_6.z = 0
				var_272_6.x = 0
				var_272_0.localEulerAngles = var_272_6
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 then
				var_272_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_272_7 = manager.ui.mainCamera.transform.position - var_272_0.position

				var_272_0.forward = Vector3.New(var_272_7.x, var_272_7.y, var_272_7.z)

				local var_272_8 = var_272_0.localEulerAngles

				var_272_8.z = 0
				var_272_8.x = 0
				var_272_0.localEulerAngles = var_272_8
			end

			local var_272_9 = 0
			local var_272_10 = 0.475

			if var_272_9 < arg_269_1.time_ and arg_269_1.time_ <= var_272_9 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_11 = arg_269_1:FormatText(StoryNameCfg[562].name)

				arg_269_1.leftNameTxt_.text = var_272_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_12 = arg_269_1:GetWordFromCfg(318082064)
				local var_272_13 = arg_269_1:FormatText(var_272_12.content)

				arg_269_1.text_.text = var_272_13

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_14 = 19
				local var_272_15 = utf8.len(var_272_13)
				local var_272_16 = var_272_14 <= 0 and var_272_10 or var_272_10 * (var_272_15 / var_272_14)

				if var_272_16 > 0 and var_272_10 < var_272_16 then
					arg_269_1.talkMaxDuration = var_272_16

					if var_272_16 + var_272_9 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_16 + var_272_9
					end
				end

				arg_269_1.text_.text = var_272_13
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082064", "story_v_out_318082.awb") ~= 0 then
					local var_272_17 = manager.audio:GetVoiceLength("story_v_out_318082", "318082064", "story_v_out_318082.awb") / 1000

					if var_272_17 + var_272_9 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_17 + var_272_9
					end

					if var_272_12.prefab_name ~= "" and arg_269_1.actors_[var_272_12.prefab_name] ~= nil then
						local var_272_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_12.prefab_name].transform, "story_v_out_318082", "318082064", "story_v_out_318082.awb")

						arg_269_1:RecordAudio("318082064", var_272_18)
						arg_269_1:RecordAudio("318082064", var_272_18)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_318082", "318082064", "story_v_out_318082.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_318082", "318082064", "story_v_out_318082.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_19 = math.max(var_272_10, arg_269_1.talkMaxDuration)

			if var_272_9 <= arg_269_1.time_ and arg_269_1.time_ < var_272_9 + var_272_19 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_9) / var_272_19

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_9 + var_272_19 and arg_269_1.time_ < var_272_9 + var_272_19 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play318082065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 318082065
		arg_273_1.duration_ = 9

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play318082066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 2

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				local var_276_1 = manager.ui.mainCamera.transform.localPosition
				local var_276_2 = Vector3.New(0, 0, 10) + Vector3.New(var_276_1.x, var_276_1.y, 0)
				local var_276_3 = arg_273_1.bgs_.K13f

				var_276_3.transform.localPosition = var_276_2
				var_276_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_276_4 = var_276_3:GetComponent("SpriteRenderer")

				if var_276_4 and var_276_4.sprite then
					local var_276_5 = (var_276_3.transform.localPosition - var_276_1).z
					local var_276_6 = manager.ui.mainCameraCom_
					local var_276_7 = 2 * var_276_5 * Mathf.Tan(var_276_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_276_8 = var_276_7 * var_276_6.aspect
					local var_276_9 = var_276_4.sprite.bounds.size.x
					local var_276_10 = var_276_4.sprite.bounds.size.y
					local var_276_11 = var_276_8 / var_276_9
					local var_276_12 = var_276_7 / var_276_10
					local var_276_13 = var_276_12 < var_276_11 and var_276_11 or var_276_12

					var_276_3.transform.localScale = Vector3.New(var_276_13, var_276_13, 0)
				end

				for iter_276_0, iter_276_1 in pairs(arg_273_1.bgs_) do
					if iter_276_0 ~= "K13f" then
						iter_276_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_276_14 = 2

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				arg_273_1.mask_.enabled = true
				arg_273_1.mask_.raycastTarget = true

				arg_273_1:SetGaussion(false)
			end

			local var_276_15 = 2

			if var_276_14 <= arg_273_1.time_ and arg_273_1.time_ < var_276_14 + var_276_15 then
				local var_276_16 = (arg_273_1.time_ - var_276_14) / var_276_15
				local var_276_17 = Color.New(0, 0, 0)

				var_276_17.a = Mathf.Lerp(1, 0, var_276_16)
				arg_273_1.mask_.color = var_276_17
			end

			if arg_273_1.time_ >= var_276_14 + var_276_15 and arg_273_1.time_ < var_276_14 + var_276_15 + arg_276_0 then
				local var_276_18 = Color.New(0, 0, 0)
				local var_276_19 = 0

				arg_273_1.mask_.enabled = false
				var_276_18.a = var_276_19
				arg_273_1.mask_.color = var_276_18
			end

			local var_276_20 = 0

			if var_276_20 < arg_273_1.time_ and arg_273_1.time_ <= var_276_20 + arg_276_0 then
				arg_273_1.mask_.enabled = true
				arg_273_1.mask_.raycastTarget = true

				arg_273_1:SetGaussion(false)
			end

			local var_276_21 = 2

			if var_276_20 <= arg_273_1.time_ and arg_273_1.time_ < var_276_20 + var_276_21 then
				local var_276_22 = (arg_273_1.time_ - var_276_20) / var_276_21
				local var_276_23 = Color.New(0, 0, 0)

				var_276_23.a = Mathf.Lerp(0, 1, var_276_22)
				arg_273_1.mask_.color = var_276_23
			end

			if arg_273_1.time_ >= var_276_20 + var_276_21 and arg_273_1.time_ < var_276_20 + var_276_21 + arg_276_0 then
				local var_276_24 = Color.New(0, 0, 0)

				var_276_24.a = 1
				arg_273_1.mask_.color = var_276_24
			end

			local var_276_25 = arg_273_1.actors_["1049ui_story"].transform
			local var_276_26 = 2

			if var_276_26 < arg_273_1.time_ and arg_273_1.time_ <= var_276_26 + arg_276_0 then
				arg_273_1.var_.moveOldPos1049ui_story = var_276_25.localPosition
			end

			local var_276_27 = 0.001

			if var_276_26 <= arg_273_1.time_ and arg_273_1.time_ < var_276_26 + var_276_27 then
				local var_276_28 = (arg_273_1.time_ - var_276_26) / var_276_27
				local var_276_29 = Vector3.New(0, 100, 0)

				var_276_25.localPosition = Vector3.Lerp(arg_273_1.var_.moveOldPos1049ui_story, var_276_29, var_276_28)

				local var_276_30 = manager.ui.mainCamera.transform.position - var_276_25.position

				var_276_25.forward = Vector3.New(var_276_30.x, var_276_30.y, var_276_30.z)

				local var_276_31 = var_276_25.localEulerAngles

				var_276_31.z = 0
				var_276_31.x = 0
				var_276_25.localEulerAngles = var_276_31
			end

			if arg_273_1.time_ >= var_276_26 + var_276_27 and arg_273_1.time_ < var_276_26 + var_276_27 + arg_276_0 then
				var_276_25.localPosition = Vector3.New(0, 100, 0)

				local var_276_32 = manager.ui.mainCamera.transform.position - var_276_25.position

				var_276_25.forward = Vector3.New(var_276_32.x, var_276_32.y, var_276_32.z)

				local var_276_33 = var_276_25.localEulerAngles

				var_276_33.z = 0
				var_276_33.x = 0
				var_276_25.localEulerAngles = var_276_33
			end

			local var_276_34 = arg_273_1.actors_["1049ui_story"]
			local var_276_35 = 2

			if var_276_35 < arg_273_1.time_ and arg_273_1.time_ <= var_276_35 + arg_276_0 and arg_273_1.var_.characterEffect1049ui_story == nil then
				arg_273_1.var_.characterEffect1049ui_story = var_276_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_36 = 0.200000002980232

			if var_276_35 <= arg_273_1.time_ and arg_273_1.time_ < var_276_35 + var_276_36 then
				local var_276_37 = (arg_273_1.time_ - var_276_35) / var_276_36

				if arg_273_1.var_.characterEffect1049ui_story then
					local var_276_38 = Mathf.Lerp(0, 0.5, var_276_37)

					arg_273_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1049ui_story.fillRatio = var_276_38
				end
			end

			if arg_273_1.time_ >= var_276_35 + var_276_36 and arg_273_1.time_ < var_276_35 + var_276_36 + arg_276_0 and arg_273_1.var_.characterEffect1049ui_story then
				local var_276_39 = 0.5

				arg_273_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1049ui_story.fillRatio = var_276_39
			end

			local var_276_40 = 0
			local var_276_41 = 0.433333333333333

			if var_276_40 < arg_273_1.time_ and arg_273_1.time_ <= var_276_40 + arg_276_0 then
				local var_276_42 = "play"
				local var_276_43 = "music"

				arg_273_1:AudioAction(var_276_42, var_276_43, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_276_44 = 2.03400000184774
			local var_276_45 = 0.733333333333333

			if var_276_44 < arg_273_1.time_ and arg_273_1.time_ <= var_276_44 + arg_276_0 then
				local var_276_46 = "play"
				local var_276_47 = "music"

				arg_273_1:AudioAction(var_276_46, var_276_47, "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten", "bgm_activity_2_10_story_reiten.awb")
			end

			local var_276_48 = 2

			if var_276_48 < arg_273_1.time_ and arg_273_1.time_ <= var_276_48 + arg_276_0 then
				arg_273_1.screenFilterGo_:SetActive(false)
			end

			local var_276_49 = 0.0166666666666667

			if var_276_48 <= arg_273_1.time_ and arg_273_1.time_ < var_276_48 + var_276_49 then
				local var_276_50 = (arg_273_1.time_ - var_276_48) / var_276_49

				arg_273_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_276_50)
			end

			if arg_273_1.time_ >= var_276_48 + var_276_49 and arg_273_1.time_ < var_276_48 + var_276_49 + arg_276_0 then
				arg_273_1.screenFilterEffect_.weight = 0
			end

			if arg_273_1.frameCnt_ <= 1 then
				arg_273_1.dialog_:SetActive(false)
			end

			local var_276_51 = 4
			local var_276_52 = 0.875

			if var_276_51 < arg_273_1.time_ and arg_273_1.time_ <= var_276_51 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0

				arg_273_1.dialog_:SetActive(true)

				local var_276_53 = LeanTween.value(arg_273_1.dialog_, 0, 1, 0.3)

				var_276_53:setOnUpdate(LuaHelper.FloatAction(function(arg_277_0)
					arg_273_1.dialogCg_.alpha = arg_277_0
				end))
				var_276_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_273_1.dialog_)
					var_276_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_273_1.duration_ = arg_273_1.duration_ + 0.3

				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_54 = arg_273_1:FormatText(StoryNameCfg[7].name)

				arg_273_1.leftNameTxt_.text = var_276_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_55 = arg_273_1:GetWordFromCfg(318082065)
				local var_276_56 = arg_273_1:FormatText(var_276_55.content)

				arg_273_1.text_.text = var_276_56

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_57 = 32
				local var_276_58 = utf8.len(var_276_56)
				local var_276_59 = var_276_57 <= 0 and var_276_52 or var_276_52 * (var_276_58 / var_276_57)

				if var_276_59 > 0 and var_276_52 < var_276_59 then
					arg_273_1.talkMaxDuration = var_276_59
					var_276_51 = var_276_51 + 0.3

					if var_276_59 + var_276_51 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_59 + var_276_51
					end
				end

				arg_273_1.text_.text = var_276_56
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_60 = var_276_51 + 0.3
			local var_276_61 = math.max(var_276_52, arg_273_1.talkMaxDuration)

			if var_276_60 <= arg_273_1.time_ and arg_273_1.time_ < var_276_60 + var_276_61 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_60) / var_276_61

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_60 + var_276_61 and arg_273_1.time_ < var_276_60 + var_276_61 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play318082066 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 318082066
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play318082067(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 1.025

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[7].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(318082066)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 41
				local var_282_6 = utf8.len(var_282_4)
				local var_282_7 = var_282_5 <= 0 and var_282_1 or var_282_1 * (var_282_6 / var_282_5)

				if var_282_7 > 0 and var_282_1 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_4
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_8 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_8 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_8

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_8 and arg_279_1.time_ < var_282_0 + var_282_8 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play318082067 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 318082067
		arg_283_1.duration_ = 6.533

		local var_283_0 = {
			zh = 2.166,
			ja = 6.533
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
				arg_283_0:Play318082068(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10066ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos10066ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(0, -0.99, -5.83)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos10066ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(0, -0.99, -5.83)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = arg_283_1.actors_["10066ui_story"]
			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 and arg_283_1.var_.characterEffect10066ui_story == nil then
				arg_283_1.var_.characterEffect10066ui_story = var_286_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_11 = 0.200000002980232

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_11 then
				local var_286_12 = (arg_283_1.time_ - var_286_10) / var_286_11

				if arg_283_1.var_.characterEffect10066ui_story then
					arg_283_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_10 + var_286_11 and arg_283_1.time_ < var_286_10 + var_286_11 + arg_286_0 and arg_283_1.var_.characterEffect10066ui_story then
				arg_283_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_286_13 = 0

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_1")
			end

			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 then
				arg_283_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_286_15 = 0
			local var_286_16 = 0.2

			if var_286_15 < arg_283_1.time_ and arg_283_1.time_ <= var_286_15 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_17 = arg_283_1:FormatText(StoryNameCfg[640].name)

				arg_283_1.leftNameTxt_.text = var_286_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_18 = arg_283_1:GetWordFromCfg(318082067)
				local var_286_19 = arg_283_1:FormatText(var_286_18.content)

				arg_283_1.text_.text = var_286_19

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_20 = 8
				local var_286_21 = utf8.len(var_286_19)
				local var_286_22 = var_286_20 <= 0 and var_286_16 or var_286_16 * (var_286_21 / var_286_20)

				if var_286_22 > 0 and var_286_16 < var_286_22 then
					arg_283_1.talkMaxDuration = var_286_22

					if var_286_22 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_22 + var_286_15
					end
				end

				arg_283_1.text_.text = var_286_19
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082067", "story_v_out_318082.awb") ~= 0 then
					local var_286_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082067", "story_v_out_318082.awb") / 1000

					if var_286_23 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_23 + var_286_15
					end

					if var_286_18.prefab_name ~= "" and arg_283_1.actors_[var_286_18.prefab_name] ~= nil then
						local var_286_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_18.prefab_name].transform, "story_v_out_318082", "318082067", "story_v_out_318082.awb")

						arg_283_1:RecordAudio("318082067", var_286_24)
						arg_283_1:RecordAudio("318082067", var_286_24)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_318082", "318082067", "story_v_out_318082.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_318082", "318082067", "story_v_out_318082.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_25 = math.max(var_286_16, arg_283_1.talkMaxDuration)

			if var_286_15 <= arg_283_1.time_ and arg_283_1.time_ < var_286_15 + var_286_25 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_15) / var_286_25

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_15 + var_286_25 and arg_283_1.time_ < var_286_15 + var_286_25 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play318082068 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 318082068
		arg_287_1.duration_ = 12.766

		local var_287_0 = {
			zh = 6.633,
			ja = 12.766
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
				arg_287_0:Play318082069(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_290_1 = 0
			local var_290_2 = 0.75

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_3 = arg_287_1:FormatText(StoryNameCfg[640].name)

				arg_287_1.leftNameTxt_.text = var_290_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_4 = arg_287_1:GetWordFromCfg(318082068)
				local var_290_5 = arg_287_1:FormatText(var_290_4.content)

				arg_287_1.text_.text = var_290_5

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_6 = 30
				local var_290_7 = utf8.len(var_290_5)
				local var_290_8 = var_290_6 <= 0 and var_290_2 or var_290_2 * (var_290_7 / var_290_6)

				if var_290_8 > 0 and var_290_2 < var_290_8 then
					arg_287_1.talkMaxDuration = var_290_8

					if var_290_8 + var_290_1 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_1
					end
				end

				arg_287_1.text_.text = var_290_5
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082068", "story_v_out_318082.awb") ~= 0 then
					local var_290_9 = manager.audio:GetVoiceLength("story_v_out_318082", "318082068", "story_v_out_318082.awb") / 1000

					if var_290_9 + var_290_1 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_9 + var_290_1
					end

					if var_290_4.prefab_name ~= "" and arg_287_1.actors_[var_290_4.prefab_name] ~= nil then
						local var_290_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_4.prefab_name].transform, "story_v_out_318082", "318082068", "story_v_out_318082.awb")

						arg_287_1:RecordAudio("318082068", var_290_10)
						arg_287_1:RecordAudio("318082068", var_290_10)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_318082", "318082068", "story_v_out_318082.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_318082", "318082068", "story_v_out_318082.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_11 = math.max(var_290_2, arg_287_1.talkMaxDuration)

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_11 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_1) / var_290_11

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_1 + var_290_11 and arg_287_1.time_ < var_290_1 + var_290_11 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play318082069 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 318082069
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play318082070(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10066ui_story"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.characterEffect10066ui_story == nil then
				arg_291_1.var_.characterEffect10066ui_story = var_294_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_2 = 0.200000002980232

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.characterEffect10066ui_story then
					local var_294_4 = Mathf.Lerp(0, 0.5, var_294_3)

					arg_291_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_291_1.var_.characterEffect10066ui_story.fillRatio = var_294_4
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.characterEffect10066ui_story then
				local var_294_5 = 0.5

				arg_291_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_291_1.var_.characterEffect10066ui_story.fillRatio = var_294_5
			end

			local var_294_6 = 0
			local var_294_7 = 1.25

			if var_294_6 < arg_291_1.time_ and arg_291_1.time_ <= var_294_6 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_8 = arg_291_1:GetWordFromCfg(318082069)
				local var_294_9 = arg_291_1:FormatText(var_294_8.content)

				arg_291_1.text_.text = var_294_9

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_10 = 50
				local var_294_11 = utf8.len(var_294_9)
				local var_294_12 = var_294_10 <= 0 and var_294_7 or var_294_7 * (var_294_11 / var_294_10)

				if var_294_12 > 0 and var_294_7 < var_294_12 then
					arg_291_1.talkMaxDuration = var_294_12

					if var_294_12 + var_294_6 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_12 + var_294_6
					end
				end

				arg_291_1.text_.text = var_294_9
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_13 = math.max(var_294_7, arg_291_1.talkMaxDuration)

			if var_294_6 <= arg_291_1.time_ and arg_291_1.time_ < var_294_6 + var_294_13 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_6) / var_294_13

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_6 + var_294_13 and arg_291_1.time_ < var_294_6 + var_294_13 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play318082070 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 318082070
		arg_295_1.duration_ = 14.666

		local var_295_0 = {
			zh = 7.166,
			ja = 14.666
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
				arg_295_0:Play318082071(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10066ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect10066ui_story == nil then
				arg_295_1.var_.characterEffect10066ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect10066ui_story then
					arg_295_1.var_.characterEffect10066ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect10066ui_story then
				arg_295_1.var_.characterEffect10066ui_story.fillFlat = false
			end

			local var_298_4 = 0

			if var_298_4 < arg_295_1.time_ and arg_295_1.time_ <= var_298_4 + arg_298_0 then
				arg_295_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/story10066/story10066action/10066action4_2")
			end

			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 then
				arg_295_1:PlayTimeline("10066ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_298_6 = 0
			local var_298_7 = 0.8

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_8 = arg_295_1:FormatText(StoryNameCfg[640].name)

				arg_295_1.leftNameTxt_.text = var_298_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_9 = arg_295_1:GetWordFromCfg(318082070)
				local var_298_10 = arg_295_1:FormatText(var_298_9.content)

				arg_295_1.text_.text = var_298_10

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_11 = 32
				local var_298_12 = utf8.len(var_298_10)
				local var_298_13 = var_298_11 <= 0 and var_298_7 or var_298_7 * (var_298_12 / var_298_11)

				if var_298_13 > 0 and var_298_7 < var_298_13 then
					arg_295_1.talkMaxDuration = var_298_13

					if var_298_13 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_13 + var_298_6
					end
				end

				arg_295_1.text_.text = var_298_10
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082070", "story_v_out_318082.awb") ~= 0 then
					local var_298_14 = manager.audio:GetVoiceLength("story_v_out_318082", "318082070", "story_v_out_318082.awb") / 1000

					if var_298_14 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_14 + var_298_6
					end

					if var_298_9.prefab_name ~= "" and arg_295_1.actors_[var_298_9.prefab_name] ~= nil then
						local var_298_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_9.prefab_name].transform, "story_v_out_318082", "318082070", "story_v_out_318082.awb")

						arg_295_1:RecordAudio("318082070", var_298_15)
						arg_295_1:RecordAudio("318082070", var_298_15)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_318082", "318082070", "story_v_out_318082.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_318082", "318082070", "story_v_out_318082.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_16 = math.max(var_298_7, arg_295_1.talkMaxDuration)

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_16 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_6) / var_298_16

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_6 + var_298_16 and arg_295_1.time_ < var_298_6 + var_298_16 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play318082071 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 318082071
		arg_299_1.duration_ = 6.533

		local var_299_0 = {
			zh = 6.533,
			ja = 6
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
				arg_299_0:Play318082072(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.65

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[640].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(318082071)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 26
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082071", "story_v_out_318082.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082071", "story_v_out_318082.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_318082", "318082071", "story_v_out_318082.awb")

						arg_299_1:RecordAudio("318082071", var_302_9)
						arg_299_1:RecordAudio("318082071", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_318082", "318082071", "story_v_out_318082.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_318082", "318082071", "story_v_out_318082.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play318082072 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 318082072
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play318082073(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["10066ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect10066ui_story == nil then
				arg_303_1.var_.characterEffect10066ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.200000002980232

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect10066ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect10066ui_story.fillFlat = true
					arg_303_1.var_.characterEffect10066ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect10066ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect10066ui_story.fillFlat = true
				arg_303_1.var_.characterEffect10066ui_story.fillRatio = var_306_5
			end

			local var_306_6 = 0
			local var_306_7 = 0.675

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_8 = arg_303_1:FormatText(StoryNameCfg[7].name)

				arg_303_1.leftNameTxt_.text = var_306_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_9 = arg_303_1:GetWordFromCfg(318082072)
				local var_306_10 = arg_303_1:FormatText(var_306_9.content)

				arg_303_1.text_.text = var_306_10

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_11 = 27
				local var_306_12 = utf8.len(var_306_10)
				local var_306_13 = var_306_11 <= 0 and var_306_7 or var_306_7 * (var_306_12 / var_306_11)

				if var_306_13 > 0 and var_306_7 < var_306_13 then
					arg_303_1.talkMaxDuration = var_306_13

					if var_306_13 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_13 + var_306_6
					end
				end

				arg_303_1.text_.text = var_306_10
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_14 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_14 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_14

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_14 and arg_303_1.time_ < var_306_6 + var_306_14 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play318082073 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 318082073
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play318082074(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["10066ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos10066ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, 100, 0)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos10066ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, 100, 0)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = 0
			local var_310_10 = 0.475

			if var_310_9 < arg_307_1.time_ and arg_307_1.time_ <= var_310_9 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_11 = arg_307_1:FormatText(StoryNameCfg[7].name)

				arg_307_1.leftNameTxt_.text = var_310_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_12 = arg_307_1:GetWordFromCfg(318082073)
				local var_310_13 = arg_307_1:FormatText(var_310_12.content)

				arg_307_1.text_.text = var_310_13

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_14 = 19
				local var_310_15 = utf8.len(var_310_13)
				local var_310_16 = var_310_14 <= 0 and var_310_10 or var_310_10 * (var_310_15 / var_310_14)

				if var_310_16 > 0 and var_310_10 < var_310_16 then
					arg_307_1.talkMaxDuration = var_310_16

					if var_310_16 + var_310_9 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_16 + var_310_9
					end
				end

				arg_307_1.text_.text = var_310_13
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_17 = math.max(var_310_10, arg_307_1.talkMaxDuration)

			if var_310_9 <= arg_307_1.time_ and arg_307_1.time_ < var_310_9 + var_310_17 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_9) / var_310_17

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_9 + var_310_17 and arg_307_1.time_ < var_310_9 + var_310_17 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play318082074 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 318082074
		arg_311_1.duration_ = 11.233

		local var_311_0 = {
			zh = 5.233,
			ja = 11.233
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
				arg_311_0:Play318082075(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.75

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[73].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, true)
				arg_311_1.iconController_:SetSelectedState("hero")

				arg_311_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(318082074)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082074", "story_v_out_318082.awb") ~= 0 then
					local var_314_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082074", "story_v_out_318082.awb") / 1000

					if var_314_8 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_8 + var_314_0
					end

					if var_314_3.prefab_name ~= "" and arg_311_1.actors_[var_314_3.prefab_name] ~= nil then
						local var_314_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_3.prefab_name].transform, "story_v_out_318082", "318082074", "story_v_out_318082.awb")

						arg_311_1:RecordAudio("318082074", var_314_9)
						arg_311_1:RecordAudio("318082074", var_314_9)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_318082", "318082074", "story_v_out_318082.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_318082", "318082074", "story_v_out_318082.awb")
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
	Play318082075 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 318082075
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play318082076(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 0.925

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_2 = arg_315_1:GetWordFromCfg(318082075)
				local var_318_3 = arg_315_1:FormatText(var_318_2.content)

				arg_315_1.text_.text = var_318_3

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_4 = 37
				local var_318_5 = utf8.len(var_318_3)
				local var_318_6 = var_318_4 <= 0 and var_318_1 or var_318_1 * (var_318_5 / var_318_4)

				if var_318_6 > 0 and var_318_1 < var_318_6 then
					arg_315_1.talkMaxDuration = var_318_6

					if var_318_6 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_6 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_3
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_7 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_7 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_7

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_7 and arg_315_1.time_ < var_318_0 + var_318_7 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play318082076 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 318082076
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play318082077(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = "1093ui_story"

			if arg_319_1.actors_[var_322_0] == nil then
				local var_322_1 = Object.Instantiate(Asset.Load("Char/" .. var_322_0), arg_319_1.stage_.transform)

				var_322_1.name = var_322_0
				var_322_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_319_1.actors_[var_322_0] = var_322_1

				local var_322_2 = var_322_1:GetComponentInChildren(typeof(CharacterEffect))

				var_322_2.enabled = true

				local var_322_3 = GameObjectTools.GetOrAddComponent(var_322_1, typeof(DynamicBoneHelper))

				if var_322_3 then
					var_322_3:EnableDynamicBone(false)
				end

				arg_319_1:ShowWeapon(var_322_2.transform, false)

				arg_319_1.var_[var_322_0 .. "Animator"] = var_322_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_319_1.var_[var_322_0 .. "Animator"].applyRootMotion = true
				arg_319_1.var_[var_322_0 .. "LipSync"] = var_322_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_322_4 = arg_319_1.actors_["1093ui_story"].transform
			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 then
				arg_319_1.var_.moveOldPos1093ui_story = var_322_4.localPosition
			end

			local var_322_6 = 0.001

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_6 then
				local var_322_7 = (arg_319_1.time_ - var_322_5) / var_322_6
				local var_322_8 = Vector3.New(0, -1.11, -5.88)

				var_322_4.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1093ui_story, var_322_8, var_322_7)

				local var_322_9 = manager.ui.mainCamera.transform.position - var_322_4.position

				var_322_4.forward = Vector3.New(var_322_9.x, var_322_9.y, var_322_9.z)

				local var_322_10 = var_322_4.localEulerAngles

				var_322_10.z = 0
				var_322_10.x = 0
				var_322_4.localEulerAngles = var_322_10
			end

			if arg_319_1.time_ >= var_322_5 + var_322_6 and arg_319_1.time_ < var_322_5 + var_322_6 + arg_322_0 then
				var_322_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_322_11 = manager.ui.mainCamera.transform.position - var_322_4.position

				var_322_4.forward = Vector3.New(var_322_11.x, var_322_11.y, var_322_11.z)

				local var_322_12 = var_322_4.localEulerAngles

				var_322_12.z = 0
				var_322_12.x = 0
				var_322_4.localEulerAngles = var_322_12
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_322_15 = 0
			local var_322_16 = 0.3

			if var_322_15 < arg_319_1.time_ and arg_319_1.time_ <= var_322_15 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_17 = arg_319_1:FormatText(StoryNameCfg[7].name)

				arg_319_1.leftNameTxt_.text = var_322_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_18 = arg_319_1:GetWordFromCfg(318082076)
				local var_322_19 = arg_319_1:FormatText(var_322_18.content)

				arg_319_1.text_.text = var_322_19

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_20 = 12
				local var_322_21 = utf8.len(var_322_19)
				local var_322_22 = var_322_20 <= 0 and var_322_16 or var_322_16 * (var_322_21 / var_322_20)

				if var_322_22 > 0 and var_322_16 < var_322_22 then
					arg_319_1.talkMaxDuration = var_322_22

					if var_322_22 + var_322_15 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_22 + var_322_15
					end
				end

				arg_319_1.text_.text = var_322_19
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_23 = math.max(var_322_16, arg_319_1.talkMaxDuration)

			if var_322_15 <= arg_319_1.time_ and arg_319_1.time_ < var_322_15 + var_322_23 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_15) / var_322_23

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_15 + var_322_23 and arg_319_1.time_ < var_322_15 + var_322_23 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play318082077 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 318082077
		arg_323_1.duration_ = 2.333

		local var_323_0 = {
			zh = 1.033,
			ja = 2.333
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
				arg_323_0:Play318082078(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.075

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_2 = arg_323_1:FormatText(StoryNameCfg[36].name)

				arg_323_1.leftNameTxt_.text = var_326_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, true)
				arg_323_1.iconController_:SetSelectedState("hero")

				arg_323_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_3 = arg_323_1:GetWordFromCfg(318082077)
				local var_326_4 = arg_323_1:FormatText(var_326_3.content)

				arg_323_1.text_.text = var_326_4

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082077", "story_v_out_318082.awb") ~= 0 then
					local var_326_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082077", "story_v_out_318082.awb") / 1000

					if var_326_8 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_8 + var_326_0
					end

					if var_326_3.prefab_name ~= "" and arg_323_1.actors_[var_326_3.prefab_name] ~= nil then
						local var_326_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_3.prefab_name].transform, "story_v_out_318082", "318082077", "story_v_out_318082.awb")

						arg_323_1:RecordAudio("318082077", var_326_9)
						arg_323_1:RecordAudio("318082077", var_326_9)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_318082", "318082077", "story_v_out_318082.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_318082", "318082077", "story_v_out_318082.awb")
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
	Play318082078 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 318082078
		arg_327_1.duration_ = 3.233

		local var_327_0 = {
			zh = 3.233,
			ja = 3.166
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
				arg_327_0:Play318082079(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1093ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1093ui_story == nil then
				arg_327_1.var_.characterEffect1093ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1093ui_story then
					arg_327_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1093ui_story then
				arg_327_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_330_4 = 0

			if var_330_4 < arg_327_1.time_ and arg_327_1.time_ <= var_330_4 + arg_330_0 then
				arg_327_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action448")
			end

			local var_330_5 = 0

			if var_330_5 < arg_327_1.time_ and arg_327_1.time_ <= var_330_5 + arg_330_0 then
				arg_327_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_330_6 = arg_327_1.actors_["10066ui_story"].transform
			local var_330_7 = 0

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 then
				arg_327_1.var_.moveOldPos10066ui_story = var_330_6.localPosition
			end

			local var_330_8 = 0.001

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_8 then
				local var_330_9 = (arg_327_1.time_ - var_330_7) / var_330_8
				local var_330_10 = Vector3.New(0, 100, 0)

				var_330_6.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos10066ui_story, var_330_10, var_330_9)

				local var_330_11 = manager.ui.mainCamera.transform.position - var_330_6.position

				var_330_6.forward = Vector3.New(var_330_11.x, var_330_11.y, var_330_11.z)

				local var_330_12 = var_330_6.localEulerAngles

				var_330_12.z = 0
				var_330_12.x = 0
				var_330_6.localEulerAngles = var_330_12
			end

			if arg_327_1.time_ >= var_330_7 + var_330_8 and arg_327_1.time_ < var_330_7 + var_330_8 + arg_330_0 then
				var_330_6.localPosition = Vector3.New(0, 100, 0)

				local var_330_13 = manager.ui.mainCamera.transform.position - var_330_6.position

				var_330_6.forward = Vector3.New(var_330_13.x, var_330_13.y, var_330_13.z)

				local var_330_14 = var_330_6.localEulerAngles

				var_330_14.z = 0
				var_330_14.x = 0
				var_330_6.localEulerAngles = var_330_14
			end

			local var_330_15 = 0
			local var_330_16 = 0.4

			if var_330_15 < arg_327_1.time_ and arg_327_1.time_ <= var_330_15 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_17 = arg_327_1:FormatText(StoryNameCfg[73].name)

				arg_327_1.leftNameTxt_.text = var_330_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_18 = arg_327_1:GetWordFromCfg(318082078)
				local var_330_19 = arg_327_1:FormatText(var_330_18.content)

				arg_327_1.text_.text = var_330_19

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_20 = 16
				local var_330_21 = utf8.len(var_330_19)
				local var_330_22 = var_330_20 <= 0 and var_330_16 or var_330_16 * (var_330_21 / var_330_20)

				if var_330_22 > 0 and var_330_16 < var_330_22 then
					arg_327_1.talkMaxDuration = var_330_22

					if var_330_22 + var_330_15 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_22 + var_330_15
					end
				end

				arg_327_1.text_.text = var_330_19
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082078", "story_v_out_318082.awb") ~= 0 then
					local var_330_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082078", "story_v_out_318082.awb") / 1000

					if var_330_23 + var_330_15 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_23 + var_330_15
					end

					if var_330_18.prefab_name ~= "" and arg_327_1.actors_[var_330_18.prefab_name] ~= nil then
						local var_330_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_18.prefab_name].transform, "story_v_out_318082", "318082078", "story_v_out_318082.awb")

						arg_327_1:RecordAudio("318082078", var_330_24)
						arg_327_1:RecordAudio("318082078", var_330_24)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_318082", "318082078", "story_v_out_318082.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_318082", "318082078", "story_v_out_318082.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_25 = math.max(var_330_16, arg_327_1.talkMaxDuration)

			if var_330_15 <= arg_327_1.time_ and arg_327_1.time_ < var_330_15 + var_330_25 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_15) / var_330_25

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_15 + var_330_25 and arg_327_1.time_ < var_330_15 + var_330_25 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play318082079 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 318082079
		arg_331_1.duration_ = 9.666

		local var_331_0 = {
			zh = 6.9,
			ja = 9.666
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
				arg_331_0:Play318082080(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_334_1 = 0
			local var_334_2 = 0.975

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_3 = arg_331_1:FormatText(StoryNameCfg[73].name)

				arg_331_1.leftNameTxt_.text = var_334_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_4 = arg_331_1:GetWordFromCfg(318082079)
				local var_334_5 = arg_331_1:FormatText(var_334_4.content)

				arg_331_1.text_.text = var_334_5

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_6 = 39
				local var_334_7 = utf8.len(var_334_5)
				local var_334_8 = var_334_6 <= 0 and var_334_2 or var_334_2 * (var_334_7 / var_334_6)

				if var_334_8 > 0 and var_334_2 < var_334_8 then
					arg_331_1.talkMaxDuration = var_334_8

					if var_334_8 + var_334_1 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_8 + var_334_1
					end
				end

				arg_331_1.text_.text = var_334_5
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082079", "story_v_out_318082.awb") ~= 0 then
					local var_334_9 = manager.audio:GetVoiceLength("story_v_out_318082", "318082079", "story_v_out_318082.awb") / 1000

					if var_334_9 + var_334_1 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_9 + var_334_1
					end

					if var_334_4.prefab_name ~= "" and arg_331_1.actors_[var_334_4.prefab_name] ~= nil then
						local var_334_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_4.prefab_name].transform, "story_v_out_318082", "318082079", "story_v_out_318082.awb")

						arg_331_1:RecordAudio("318082079", var_334_10)
						arg_331_1:RecordAudio("318082079", var_334_10)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_318082", "318082079", "story_v_out_318082.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_318082", "318082079", "story_v_out_318082.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_11 = math.max(var_334_2, arg_331_1.talkMaxDuration)

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_11 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_1) / var_334_11

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_1 + var_334_11 and arg_331_1.time_ < var_334_1 + var_334_11 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play318082080 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 318082080
		arg_335_1.duration_ = 4.966

		local var_335_0 = {
			zh = 4.5,
			ja = 4.966
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
				arg_335_0:Play318082081(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.6

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[73].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(318082080)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082080", "story_v_out_318082.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082080", "story_v_out_318082.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_318082", "318082080", "story_v_out_318082.awb")

						arg_335_1:RecordAudio("318082080", var_338_9)
						arg_335_1:RecordAudio("318082080", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_318082", "318082080", "story_v_out_318082.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_318082", "318082080", "story_v_out_318082.awb")
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
	Play318082081 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 318082081
		arg_339_1.duration_ = 6

		local var_339_0 = {
			zh = 3.266,
			ja = 6
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
				arg_339_0:Play318082082(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1093ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1093ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, 100, 0)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1093ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, 100, 0)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1093ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1093ui_story == nil then
				arg_339_1.var_.characterEffect1093ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1093ui_story then
					local var_342_13 = Mathf.Lerp(0, 0.5, var_342_12)

					arg_339_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1093ui_story.fillRatio = var_342_13
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1093ui_story then
				local var_342_14 = 0.5

				arg_339_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1093ui_story.fillRatio = var_342_14
			end

			local var_342_15 = 0
			local var_342_16 = 0.45

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[644].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, true)
				arg_339_1.iconController_:SetSelectedState("hero")

				arg_339_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(318082081)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 18
				local var_342_21 = utf8.len(var_342_19)
				local var_342_22 = var_342_20 <= 0 and var_342_16 or var_342_16 * (var_342_21 / var_342_20)

				if var_342_22 > 0 and var_342_16 < var_342_22 then
					arg_339_1.talkMaxDuration = var_342_22

					if var_342_22 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_15
					end
				end

				arg_339_1.text_.text = var_342_19
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082081", "story_v_out_318082.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082081", "story_v_out_318082.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_out_318082", "318082081", "story_v_out_318082.awb")

						arg_339_1:RecordAudio("318082081", var_342_24)
						arg_339_1:RecordAudio("318082081", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_318082", "318082081", "story_v_out_318082.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_318082", "318082081", "story_v_out_318082.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_25 = math.max(var_342_16, arg_339_1.talkMaxDuration)

			if var_342_15 <= arg_339_1.time_ and arg_339_1.time_ < var_342_15 + var_342_25 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_15) / var_342_25

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_15 + var_342_25 and arg_339_1.time_ < var_342_15 + var_342_25 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play318082082 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 318082082
		arg_343_1.duration_ = 8.7

		local var_343_0 = {
			zh = 4.7,
			ja = 8.7
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
				arg_343_0:Play318082083(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.625

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_2 = arg_343_1:FormatText(StoryNameCfg[644].name)

				arg_343_1.leftNameTxt_.text = var_346_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, true)
				arg_343_1.iconController_:SetSelectedState("hero")

				arg_343_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_3 = arg_343_1:GetWordFromCfg(318082082)
				local var_346_4 = arg_343_1:FormatText(var_346_3.content)

				arg_343_1.text_.text = var_346_4

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082082", "story_v_out_318082.awb") ~= 0 then
					local var_346_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082082", "story_v_out_318082.awb") / 1000

					if var_346_8 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_8 + var_346_0
					end

					if var_346_3.prefab_name ~= "" and arg_343_1.actors_[var_346_3.prefab_name] ~= nil then
						local var_346_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_3.prefab_name].transform, "story_v_out_318082", "318082082", "story_v_out_318082.awb")

						arg_343_1:RecordAudio("318082082", var_346_9)
						arg_343_1:RecordAudio("318082082", var_346_9)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_318082", "318082082", "story_v_out_318082.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_318082", "318082082", "story_v_out_318082.awb")
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
	Play318082083 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 318082083
		arg_347_1.duration_ = 10.733

		local var_347_0 = {
			zh = 4.433,
			ja = 10.733
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
				arg_347_0:Play318082084(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 0.625

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[644].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, true)
				arg_347_1.iconController_:SetSelectedState("hero")

				arg_347_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(318082083)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082083", "story_v_out_318082.awb") ~= 0 then
					local var_350_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082083", "story_v_out_318082.awb") / 1000

					if var_350_8 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_8 + var_350_0
					end

					if var_350_3.prefab_name ~= "" and arg_347_1.actors_[var_350_3.prefab_name] ~= nil then
						local var_350_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_3.prefab_name].transform, "story_v_out_318082", "318082083", "story_v_out_318082.awb")

						arg_347_1:RecordAudio("318082083", var_350_9)
						arg_347_1:RecordAudio("318082083", var_350_9)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_318082", "318082083", "story_v_out_318082.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_318082", "318082083", "story_v_out_318082.awb")
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
	Play318082084 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 318082084
		arg_351_1.duration_ = 5.266

		local var_351_0 = {
			zh = 5.266,
			ja = 5
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
				arg_351_0:Play318082085(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1049ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1049ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0, -1.2, -6)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1049ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = arg_351_1.actors_["1049ui_story"]
			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 and arg_351_1.var_.characterEffect1049ui_story == nil then
				arg_351_1.var_.characterEffect1049ui_story = var_354_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_11 = 0.200000002980232

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_11 then
				local var_354_12 = (arg_351_1.time_ - var_354_10) / var_354_11

				if arg_351_1.var_.characterEffect1049ui_story then
					arg_351_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_10 + var_354_11 and arg_351_1.time_ < var_354_10 + var_354_11 + arg_354_0 and arg_351_1.var_.characterEffect1049ui_story then
				arg_351_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_354_13 = 0

			if var_354_13 < arg_351_1.time_ and arg_351_1.time_ <= var_354_13 + arg_354_0 then
				arg_351_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				arg_351_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_354_15 = 0
			local var_354_16 = 0.675

			if var_354_15 < arg_351_1.time_ and arg_351_1.time_ <= var_354_15 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_17 = arg_351_1:FormatText(StoryNameCfg[562].name)

				arg_351_1.leftNameTxt_.text = var_354_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_18 = arg_351_1:GetWordFromCfg(318082084)
				local var_354_19 = arg_351_1:FormatText(var_354_18.content)

				arg_351_1.text_.text = var_354_19

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_20 = 27
				local var_354_21 = utf8.len(var_354_19)
				local var_354_22 = var_354_20 <= 0 and var_354_16 or var_354_16 * (var_354_21 / var_354_20)

				if var_354_22 > 0 and var_354_16 < var_354_22 then
					arg_351_1.talkMaxDuration = var_354_22

					if var_354_22 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_22 + var_354_15
					end
				end

				arg_351_1.text_.text = var_354_19
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082084", "story_v_out_318082.awb") ~= 0 then
					local var_354_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082084", "story_v_out_318082.awb") / 1000

					if var_354_23 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_23 + var_354_15
					end

					if var_354_18.prefab_name ~= "" and arg_351_1.actors_[var_354_18.prefab_name] ~= nil then
						local var_354_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_18.prefab_name].transform, "story_v_out_318082", "318082084", "story_v_out_318082.awb")

						arg_351_1:RecordAudio("318082084", var_354_24)
						arg_351_1:RecordAudio("318082084", var_354_24)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_318082", "318082084", "story_v_out_318082.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_318082", "318082084", "story_v_out_318082.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_25 = math.max(var_354_16, arg_351_1.talkMaxDuration)

			if var_354_15 <= arg_351_1.time_ and arg_351_1.time_ < var_354_15 + var_354_25 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_15) / var_354_25

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_15 + var_354_25 and arg_351_1.time_ < var_354_15 + var_354_25 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play318082085 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 318082085
		arg_355_1.duration_ = 6.333

		local var_355_0 = {
			zh = 4.866,
			ja = 6.333
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
				arg_355_0:Play318082086(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1049ui_story"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos1049ui_story = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(0, 100, 0)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1049ui_story, var_358_4, var_358_3)

				local var_358_5 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_5.x, var_358_5.y, var_358_5.z)

				local var_358_6 = var_358_0.localEulerAngles

				var_358_6.z = 0
				var_358_6.x = 0
				var_358_0.localEulerAngles = var_358_6
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(0, 100, 0)

				local var_358_7 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_7.x, var_358_7.y, var_358_7.z)

				local var_358_8 = var_358_0.localEulerAngles

				var_358_8.z = 0
				var_358_8.x = 0
				var_358_0.localEulerAngles = var_358_8
			end

			local var_358_9 = arg_355_1.actors_["1049ui_story"]
			local var_358_10 = 0

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 and arg_355_1.var_.characterEffect1049ui_story == nil then
				arg_355_1.var_.characterEffect1049ui_story = var_358_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_11 = 0.200000002980232

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_11 then
				local var_358_12 = (arg_355_1.time_ - var_358_10) / var_358_11

				if arg_355_1.var_.characterEffect1049ui_story then
					local var_358_13 = Mathf.Lerp(0, 0.5, var_358_12)

					arg_355_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1049ui_story.fillRatio = var_358_13
				end
			end

			if arg_355_1.time_ >= var_358_10 + var_358_11 and arg_355_1.time_ < var_358_10 + var_358_11 + arg_358_0 and arg_355_1.var_.characterEffect1049ui_story then
				local var_358_14 = 0.5

				arg_355_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1049ui_story.fillRatio = var_358_14
			end

			local var_358_15 = 0
			local var_358_16 = 0.275

			if var_358_15 < arg_355_1.time_ and arg_355_1.time_ <= var_358_15 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_17 = arg_355_1:FormatText(StoryNameCfg[644].name)

				arg_355_1.leftNameTxt_.text = var_358_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, true)
				arg_355_1.iconController_:SetSelectedState("hero")

				arg_355_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_18 = arg_355_1:GetWordFromCfg(318082085)
				local var_358_19 = arg_355_1:FormatText(var_358_18.content)

				arg_355_1.text_.text = var_358_19

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_20 = 11
				local var_358_21 = utf8.len(var_358_19)
				local var_358_22 = var_358_20 <= 0 and var_358_16 or var_358_16 * (var_358_21 / var_358_20)

				if var_358_22 > 0 and var_358_16 < var_358_22 then
					arg_355_1.talkMaxDuration = var_358_22

					if var_358_22 + var_358_15 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_22 + var_358_15
					end
				end

				arg_355_1.text_.text = var_358_19
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082085", "story_v_out_318082.awb") ~= 0 then
					local var_358_23 = manager.audio:GetVoiceLength("story_v_out_318082", "318082085", "story_v_out_318082.awb") / 1000

					if var_358_23 + var_358_15 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_23 + var_358_15
					end

					if var_358_18.prefab_name ~= "" and arg_355_1.actors_[var_358_18.prefab_name] ~= nil then
						local var_358_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_18.prefab_name].transform, "story_v_out_318082", "318082085", "story_v_out_318082.awb")

						arg_355_1:RecordAudio("318082085", var_358_24)
						arg_355_1:RecordAudio("318082085", var_358_24)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_318082", "318082085", "story_v_out_318082.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_318082", "318082085", "story_v_out_318082.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_25 = math.max(var_358_16, arg_355_1.talkMaxDuration)

			if var_358_15 <= arg_355_1.time_ and arg_355_1.time_ < var_358_15 + var_358_25 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_15) / var_358_25

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_15 + var_358_25 and arg_355_1.time_ < var_358_15 + var_358_25 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play318082086 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 318082086
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play318082087(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.4

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[7].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(318082086)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 16
				local var_362_6 = utf8.len(var_362_4)
				local var_362_7 = var_362_5 <= 0 and var_362_1 or var_362_1 * (var_362_6 / var_362_5)

				if var_362_7 > 0 and var_362_1 < var_362_7 then
					arg_359_1.talkMaxDuration = var_362_7

					if var_362_7 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_7 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_4
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_8 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_8 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_8

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_8 and arg_359_1.time_ < var_362_0 + var_362_8 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play318082087 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 318082087
		arg_363_1.duration_ = 5.866

		local var_363_0 = {
			zh = 2.466,
			ja = 5.866
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
				arg_363_0:Play318082088(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 0.25

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_2 = arg_363_1:FormatText(StoryNameCfg[644].name)

				arg_363_1.leftNameTxt_.text = var_366_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, true)
				arg_363_1.iconController_:SetSelectedState("hero")

				arg_363_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_3 = arg_363_1:GetWordFromCfg(318082087)
				local var_366_4 = arg_363_1:FormatText(var_366_3.content)

				arg_363_1.text_.text = var_366_4

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_5 = 10
				local var_366_6 = utf8.len(var_366_4)
				local var_366_7 = var_366_5 <= 0 and var_366_1 or var_366_1 * (var_366_6 / var_366_5)

				if var_366_7 > 0 and var_366_1 < var_366_7 then
					arg_363_1.talkMaxDuration = var_366_7

					if var_366_7 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_7 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_4
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082087", "story_v_out_318082.awb") ~= 0 then
					local var_366_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082087", "story_v_out_318082.awb") / 1000

					if var_366_8 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_8 + var_366_0
					end

					if var_366_3.prefab_name ~= "" and arg_363_1.actors_[var_366_3.prefab_name] ~= nil then
						local var_366_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_3.prefab_name].transform, "story_v_out_318082", "318082087", "story_v_out_318082.awb")

						arg_363_1:RecordAudio("318082087", var_366_9)
						arg_363_1:RecordAudio("318082087", var_366_9)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_318082", "318082087", "story_v_out_318082.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_318082", "318082087", "story_v_out_318082.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_10 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_10 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_10

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_10 and arg_363_1.time_ < var_366_0 + var_366_10 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play318082088 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 318082088
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play318082089(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0
			local var_370_1 = 1.025

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_2 = arg_367_1:GetWordFromCfg(318082088)
				local var_370_3 = arg_367_1:FormatText(var_370_2.content)

				arg_367_1.text_.text = var_370_3

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_4 = 41
				local var_370_5 = utf8.len(var_370_3)
				local var_370_6 = var_370_4 <= 0 and var_370_1 or var_370_1 * (var_370_5 / var_370_4)

				if var_370_6 > 0 and var_370_1 < var_370_6 then
					arg_367_1.talkMaxDuration = var_370_6

					if var_370_6 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_6 + var_370_0
					end
				end

				arg_367_1.text_.text = var_370_3
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_7 = math.max(var_370_1, arg_367_1.talkMaxDuration)

			if var_370_0 <= arg_367_1.time_ and arg_367_1.time_ < var_370_0 + var_370_7 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_0) / var_370_7

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_0 + var_370_7 and arg_367_1.time_ < var_370_0 + var_370_7 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play318082089 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 318082089
		arg_371_1.duration_ = 13.3

		local var_371_0 = {
			zh = 5,
			ja = 13.3
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
				arg_371_0:Play318082090(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.8

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_2 = arg_371_1:FormatText(StoryNameCfg[644].name)

				arg_371_1.leftNameTxt_.text = var_374_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, true)
				arg_371_1.iconController_:SetSelectedState("hero")

				arg_371_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_3 = arg_371_1:GetWordFromCfg(318082089)
				local var_374_4 = arg_371_1:FormatText(var_374_3.content)

				arg_371_1.text_.text = var_374_4

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_5 = 32
				local var_374_6 = utf8.len(var_374_4)
				local var_374_7 = var_374_5 <= 0 and var_374_1 or var_374_1 * (var_374_6 / var_374_5)

				if var_374_7 > 0 and var_374_1 < var_374_7 then
					arg_371_1.talkMaxDuration = var_374_7

					if var_374_7 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_7 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_4
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082089", "story_v_out_318082.awb") ~= 0 then
					local var_374_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082089", "story_v_out_318082.awb") / 1000

					if var_374_8 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_8 + var_374_0
					end

					if var_374_3.prefab_name ~= "" and arg_371_1.actors_[var_374_3.prefab_name] ~= nil then
						local var_374_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_3.prefab_name].transform, "story_v_out_318082", "318082089", "story_v_out_318082.awb")

						arg_371_1:RecordAudio("318082089", var_374_9)
						arg_371_1:RecordAudio("318082089", var_374_9)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_318082", "318082089", "story_v_out_318082.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_318082", "318082089", "story_v_out_318082.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_10 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_10 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_10

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_10 and arg_371_1.time_ < var_374_0 + var_374_10 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play318082090 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 318082090
		arg_375_1.duration_ = 3.866

		local var_375_0 = {
			zh = 3.233,
			ja = 3.866
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
			arg_375_1.auto_ = false
		end

		function arg_375_1.playNext_(arg_377_0)
			arg_375_1.onStoryFinished_()
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 0.425

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[644].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, true)
				arg_375_1.iconController_:SetSelectedState("hero")

				arg_375_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(318082090)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 17
				local var_378_6 = utf8.len(var_378_4)
				local var_378_7 = var_378_5 <= 0 and var_378_1 or var_378_1 * (var_378_6 / var_378_5)

				if var_378_7 > 0 and var_378_1 < var_378_7 then
					arg_375_1.talkMaxDuration = var_378_7

					if var_378_7 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_7 + var_378_0
					end
				end

				arg_375_1.text_.text = var_378_4
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318082", "318082090", "story_v_out_318082.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_318082", "318082090", "story_v_out_318082.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_318082", "318082090", "story_v_out_318082.awb")

						arg_375_1:RecordAudio("318082090", var_378_9)
						arg_375_1:RecordAudio("318082090", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_318082", "318082090", "story_v_out_318082.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_318082", "318082090", "story_v_out_318082.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_10 = math.max(var_378_1, arg_375_1.talkMaxDuration)

			if var_378_0 <= arg_375_1.time_ and arg_375_1.time_ < var_378_0 + var_378_10 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_0) / var_378_10

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_0 + var_378_10 and arg_375_1.time_ < var_378_0 + var_378_10 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K13f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K01f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0601",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0602",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0603"
	},
	voices = {
		"story_v_out_318082.awb"
	}
}
