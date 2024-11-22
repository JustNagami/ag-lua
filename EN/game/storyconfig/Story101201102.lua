return {
	Play120112001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120112001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120112002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J04f"

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
				local var_4_5 = arg_1_1.bgs_.J04f

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
					if iter_4_0 ~= "J04f" then
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
			local var_4_23 = 0.133333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.433333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.9

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

				local var_4_33 = arg_1_1:GetWordFromCfg(120112001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 37
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
	Play120112002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120112002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120112003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.625

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

				local var_10_2 = arg_7_1:GetWordFromCfg(120112002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 25
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
	Play120112003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120112003
		arg_11_1.duration_ = 10.833

		local var_11_0 = {
			zh = 10.233,
			ja = 10.833
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
				arg_11_0:Play120112004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "10044ui_story"

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

			local var_14_4 = arg_11_1.actors_["10044ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos10044ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, -0.72, -6.3)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10044ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["10044ui_story"]
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 and arg_11_1.var_.characterEffect10044ui_story == nil then
				arg_11_1.var_.characterEffect10044ui_story = var_14_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_15 = 0.2

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15

				if arg_11_1.var_.characterEffect10044ui_story then
					arg_11_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 and arg_11_1.var_.characterEffect10044ui_story then
				arg_11_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				arg_11_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_14_19 = 0
			local var_14_20 = 0.775

			if var_14_19 < arg_11_1.time_ and arg_11_1.time_ <= var_14_19 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_21 = arg_11_1:FormatText(StoryNameCfg[387].name)

				arg_11_1.leftNameTxt_.text = var_14_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_22 = arg_11_1:GetWordFromCfg(120112003)
				local var_14_23 = arg_11_1:FormatText(var_14_22.content)

				arg_11_1.text_.text = var_14_23

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_24 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112003", "story_v_out_120112.awb") ~= 0 then
					local var_14_27 = manager.audio:GetVoiceLength("story_v_out_120112", "120112003", "story_v_out_120112.awb") / 1000

					if var_14_27 + var_14_19 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_19
					end

					if var_14_22.prefab_name ~= "" and arg_11_1.actors_[var_14_22.prefab_name] ~= nil then
						local var_14_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_22.prefab_name].transform, "story_v_out_120112", "120112003", "story_v_out_120112.awb")

						arg_11_1:RecordAudio("120112003", var_14_28)
						arg_11_1:RecordAudio("120112003", var_14_28)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_120112", "120112003", "story_v_out_120112.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_120112", "120112003", "story_v_out_120112.awb")
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
	Play120112004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120112004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play120112005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10044ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect10044ui_story == nil then
				arg_15_1.var_.characterEffect10044ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect10044ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10044ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect10044ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10044ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.35

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(120112004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 14
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
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_14 and arg_15_1.time_ < var_18_6 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120112005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120112005
		arg_19_1.duration_ = 3.3

		local var_19_0 = {
			zh = 2.133,
			ja = 3.3
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
				arg_19_0:Play120112006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10044ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect10044ui_story == nil then
				arg_19_1.var_.characterEffect10044ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect10044ui_story then
					arg_19_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect10044ui_story then
				arg_19_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action6_1")
			end

			local var_22_5 = 0
			local var_22_6 = 0.225

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_7 = arg_19_1:FormatText(StoryNameCfg[387].name)

				arg_19_1.leftNameTxt_.text = var_22_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_8 = arg_19_1:GetWordFromCfg(120112005)
				local var_22_9 = arg_19_1:FormatText(var_22_8.content)

				arg_19_1.text_.text = var_22_9

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_10 = 9
				local var_22_11 = utf8.len(var_22_9)
				local var_22_12 = var_22_10 <= 0 and var_22_6 or var_22_6 * (var_22_11 / var_22_10)

				if var_22_12 > 0 and var_22_6 < var_22_12 then
					arg_19_1.talkMaxDuration = var_22_12

					if var_22_12 + var_22_5 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_5
					end
				end

				arg_19_1.text_.text = var_22_9
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112005", "story_v_out_120112.awb") ~= 0 then
					local var_22_13 = manager.audio:GetVoiceLength("story_v_out_120112", "120112005", "story_v_out_120112.awb") / 1000

					if var_22_13 + var_22_5 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_5
					end

					if var_22_8.prefab_name ~= "" and arg_19_1.actors_[var_22_8.prefab_name] ~= nil then
						local var_22_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_8.prefab_name].transform, "story_v_out_120112", "120112005", "story_v_out_120112.awb")

						arg_19_1:RecordAudio("120112005", var_22_14)
						arg_19_1:RecordAudio("120112005", var_22_14)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_120112", "120112005", "story_v_out_120112.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_120112", "120112005", "story_v_out_120112.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_15 = math.max(var_22_6, arg_19_1.talkMaxDuration)

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_15 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_5) / var_22_15

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_5 + var_22_15 and arg_19_1.time_ < var_22_5 + var_22_15 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120112006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120112006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120112007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10044ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect10044ui_story == nil then
				arg_23_1.var_.characterEffect10044ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect10044ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_23_1.var_.characterEffect10044ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect10044ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_23_1.var_.characterEffect10044ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.525

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

				local var_26_9 = arg_23_1:GetWordFromCfg(120112006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 29
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
	Play120112007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120112007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play120112008(arg_27_1)
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

				local var_30_3 = arg_27_1:GetWordFromCfg(120112007)
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
	Play120112008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120112008
		arg_31_1.duration_ = 4.6

		local var_31_0 = {
			zh = 4.533,
			ja = 4.6
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
				arg_31_0:Play120112009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10044ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10044ui_story == nil then
				arg_31_1.var_.characterEffect10044ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10044ui_story then
					arg_31_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10044ui_story then
				arg_31_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_34_4 = 0

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_34_5 = 0
			local var_34_6 = 0.45

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_7 = arg_31_1:FormatText(StoryNameCfg[387].name)

				arg_31_1.leftNameTxt_.text = var_34_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(120112008)
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112008", "story_v_out_120112.awb") ~= 0 then
					local var_34_13 = manager.audio:GetVoiceLength("story_v_out_120112", "120112008", "story_v_out_120112.awb") / 1000

					if var_34_13 + var_34_5 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_5
					end

					if var_34_8.prefab_name ~= "" and arg_31_1.actors_[var_34_8.prefab_name] ~= nil then
						local var_34_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_8.prefab_name].transform, "story_v_out_120112", "120112008", "story_v_out_120112.awb")

						arg_31_1:RecordAudio("120112008", var_34_14)
						arg_31_1:RecordAudio("120112008", var_34_14)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120112", "120112008", "story_v_out_120112.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120112", "120112008", "story_v_out_120112.awb")
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
	Play120112009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120112009
		arg_35_1.duration_ = 8.8

		local var_35_0 = {
			zh = 6.466,
			ja = 8.8
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
				arg_35_0:Play120112010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_38_1 = 0
			local var_38_2 = 0.575

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_3 = arg_35_1:FormatText(StoryNameCfg[387].name)

				arg_35_1.leftNameTxt_.text = var_38_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_4 = arg_35_1:GetWordFromCfg(120112009)
				local var_38_5 = arg_35_1:FormatText(var_38_4.content)

				arg_35_1.text_.text = var_38_5

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_6 = 23
				local var_38_7 = utf8.len(var_38_5)
				local var_38_8 = var_38_6 <= 0 and var_38_2 or var_38_2 * (var_38_7 / var_38_6)

				if var_38_8 > 0 and var_38_2 < var_38_8 then
					arg_35_1.talkMaxDuration = var_38_8

					if var_38_8 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_1
					end
				end

				arg_35_1.text_.text = var_38_5
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112009", "story_v_out_120112.awb") ~= 0 then
					local var_38_9 = manager.audio:GetVoiceLength("story_v_out_120112", "120112009", "story_v_out_120112.awb") / 1000

					if var_38_9 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_9 + var_38_1
					end

					if var_38_4.prefab_name ~= "" and arg_35_1.actors_[var_38_4.prefab_name] ~= nil then
						local var_38_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_4.prefab_name].transform, "story_v_out_120112", "120112009", "story_v_out_120112.awb")

						arg_35_1:RecordAudio("120112009", var_38_10)
						arg_35_1:RecordAudio("120112009", var_38_10)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_120112", "120112009", "story_v_out_120112.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_120112", "120112009", "story_v_out_120112.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_11 = math.max(var_38_2, arg_35_1.talkMaxDuration)

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_11 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_1) / var_38_11

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_1 + var_38_11 and arg_35_1.time_ < var_38_1 + var_38_11 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120112010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120112010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play120112011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10044ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos10044ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(0, 100, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos10044ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(0, 100, 0)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = 0
			local var_42_10 = 0.075

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_11 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_12 = arg_39_1:GetWordFromCfg(120112010)
				local var_42_13 = arg_39_1:FormatText(var_42_12.content)

				arg_39_1.text_.text = var_42_13

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_14 = 3
				local var_42_15 = utf8.len(var_42_13)
				local var_42_16 = var_42_14 <= 0 and var_42_10 or var_42_10 * (var_42_15 / var_42_14)

				if var_42_16 > 0 and var_42_10 < var_42_16 then
					arg_39_1.talkMaxDuration = var_42_16

					if var_42_16 + var_42_9 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_16 + var_42_9
					end
				end

				arg_39_1.text_.text = var_42_13
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_17 = math.max(var_42_10, arg_39_1.talkMaxDuration)

			if var_42_9 <= arg_39_1.time_ and arg_39_1.time_ < var_42_9 + var_42_17 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_9) / var_42_17

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_9 + var_42_17 and arg_39_1.time_ < var_42_9 + var_42_17 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120112011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120112011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play120112012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.25

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(120112011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 10
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
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_8 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_8 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_8

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_8 and arg_43_1.time_ < var_46_0 + var_46_8 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120112012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120112012
		arg_47_1.duration_ = 3.133

		local var_47_0 = {
			zh = 3.1,
			ja = 3.133
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
				arg_47_0:Play120112013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1184ui_story"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(Asset.Load("Char/" .. var_50_0), arg_47_1.stage_.transform)

				var_50_1.name = var_50_0
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.actors_[var_50_0] = var_50_1

				local var_50_2 = var_50_1:GetComponentInChildren(typeof(CharacterEffect))

				var_50_2.enabled = true

				local var_50_3 = GameObjectTools.GetOrAddComponent(var_50_1, typeof(DynamicBoneHelper))

				if var_50_3 then
					var_50_3:EnableDynamicBone(false)
				end

				arg_47_1:ShowWeapon(var_50_2.transform, false)

				arg_47_1.var_[var_50_0 .. "Animator"] = var_50_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_47_1.var_[var_50_0 .. "Animator"].applyRootMotion = true
				arg_47_1.var_[var_50_0 .. "LipSync"] = var_50_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_50_4 = arg_47_1.actors_["1184ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1184ui_story = var_50_4.localPosition

				local var_50_6 = "1184ui_story"

				arg_47_1:ShowWeapon(arg_47_1.var_[var_50_6 .. "Animator"].transform, false)
			end

			local var_50_7 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_7 then
				local var_50_8 = (arg_47_1.time_ - var_50_5) / var_50_7
				local var_50_9 = Vector3.New(0, -0.97, -6)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1184ui_story, var_50_9, var_50_8)

				local var_50_10 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_10.x, var_50_10.y, var_50_10.z)

				local var_50_11 = var_50_4.localEulerAngles

				var_50_11.z = 0
				var_50_11.x = 0
				var_50_4.localEulerAngles = var_50_11
			end

			if arg_47_1.time_ >= var_50_5 + var_50_7 and arg_47_1.time_ < var_50_5 + var_50_7 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_50_12 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_12.x, var_50_12.y, var_50_12.z)

				local var_50_13 = var_50_4.localEulerAngles

				var_50_13.z = 0
				var_50_13.x = 0
				var_50_4.localEulerAngles = var_50_13
			end

			local var_50_14 = arg_47_1.actors_["1184ui_story"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1184ui_story == nil then
				arg_47_1.var_.characterEffect1184ui_story = var_50_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_16 = 0.2

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.characterEffect1184ui_story then
					arg_47_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1184ui_story then
				arg_47_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_50_19 = 0

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_50_20 = 0
			local var_50_21 = 0.4

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_22 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_23 = arg_47_1:GetWordFromCfg(120112012)
				local var_50_24 = arg_47_1:FormatText(var_50_23.content)

				arg_47_1.text_.text = var_50_24

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_25 = 16
				local var_50_26 = utf8.len(var_50_24)
				local var_50_27 = var_50_25 <= 0 and var_50_21 or var_50_21 * (var_50_26 / var_50_25)

				if var_50_27 > 0 and var_50_21 < var_50_27 then
					arg_47_1.talkMaxDuration = var_50_27

					if var_50_27 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_20
					end
				end

				arg_47_1.text_.text = var_50_24
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112012", "story_v_out_120112.awb") ~= 0 then
					local var_50_28 = manager.audio:GetVoiceLength("story_v_out_120112", "120112012", "story_v_out_120112.awb") / 1000

					if var_50_28 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_20
					end

					if var_50_23.prefab_name ~= "" and arg_47_1.actors_[var_50_23.prefab_name] ~= nil then
						local var_50_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_23.prefab_name].transform, "story_v_out_120112", "120112012", "story_v_out_120112.awb")

						arg_47_1:RecordAudio("120112012", var_50_29)
						arg_47_1:RecordAudio("120112012", var_50_29)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_120112", "120112012", "story_v_out_120112.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_120112", "120112012", "story_v_out_120112.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_30 = math.max(var_50_21, arg_47_1.talkMaxDuration)

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_30 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_20) / var_50_30

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_20 + var_50_30 and arg_47_1.time_ < var_50_20 + var_50_30 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120112013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120112013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120112014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1184ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1184ui_story == nil then
				arg_51_1.var_.characterEffect1184ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1184ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1184ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1184ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1184ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.3

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(120112013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 12
				local var_54_12 = utf8.len(var_54_10)
				local var_54_13 = var_54_11 <= 0 and var_54_7 or var_54_7 * (var_54_12 / var_54_11)

				if var_54_13 > 0 and var_54_7 < var_54_13 then
					arg_51_1.talkMaxDuration = var_54_13

					if var_54_13 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_13 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_10
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_14 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_14 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_14

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_14 and arg_51_1.time_ < var_54_6 + var_54_14 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play120112014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120112014
		arg_55_1.duration_ = 9

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play120112015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = "XH0106"

			if arg_55_1.bgs_[var_58_0] == nil then
				local var_58_1 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_0)
				var_58_1.name = var_58_0
				var_58_1.transform.parent = arg_55_1.stage_.transform
				var_58_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_0] = var_58_1
			end

			local var_58_2 = 2

			if var_58_2 < arg_55_1.time_ and arg_55_1.time_ <= var_58_2 + arg_58_0 then
				local var_58_3 = manager.ui.mainCamera.transform.localPosition
				local var_58_4 = Vector3.New(0, 0, 10) + Vector3.New(var_58_3.x, var_58_3.y, 0)
				local var_58_5 = arg_55_1.bgs_.XH0106

				var_58_5.transform.localPosition = var_58_4
				var_58_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_6 = var_58_5:GetComponent("SpriteRenderer")

				if var_58_6 and var_58_6.sprite then
					local var_58_7 = (var_58_5.transform.localPosition - var_58_3).z
					local var_58_8 = manager.ui.mainCameraCom_
					local var_58_9 = 2 * var_58_7 * Mathf.Tan(var_58_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_10 = var_58_9 * var_58_8.aspect
					local var_58_11 = var_58_6.sprite.bounds.size.x
					local var_58_12 = var_58_6.sprite.bounds.size.y
					local var_58_13 = var_58_10 / var_58_11
					local var_58_14 = var_58_9 / var_58_12
					local var_58_15 = var_58_14 < var_58_13 and var_58_13 or var_58_14

					var_58_5.transform.localScale = Vector3.New(var_58_15, var_58_15, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "XH0106" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_17 = 2

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Color.New(0, 0, 0)

				var_58_19.a = Mathf.Lerp(0, 1, var_58_18)
				arg_55_1.mask_.color = var_58_19
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				local var_58_20 = Color.New(0, 0, 0)

				var_58_20.a = 1
				arg_55_1.mask_.color = var_58_20
			end

			local var_58_21 = 2

			if var_58_21 < arg_55_1.time_ and arg_55_1.time_ <= var_58_21 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_22 = 2

			if var_58_21 <= arg_55_1.time_ and arg_55_1.time_ < var_58_21 + var_58_22 then
				local var_58_23 = (arg_55_1.time_ - var_58_21) / var_58_22
				local var_58_24 = Color.New(0, 0, 0)

				var_58_24.a = Mathf.Lerp(1, 0, var_58_23)
				arg_55_1.mask_.color = var_58_24
			end

			if arg_55_1.time_ >= var_58_21 + var_58_22 and arg_55_1.time_ < var_58_21 + var_58_22 + arg_58_0 then
				local var_58_25 = Color.New(0, 0, 0)
				local var_58_26 = 0

				arg_55_1.mask_.enabled = false
				var_58_25.a = var_58_26
				arg_55_1.mask_.color = var_58_25
			end

			local var_58_27 = arg_55_1.actors_["1184ui_story"].transform
			local var_58_28 = 1.966

			if var_58_28 < arg_55_1.time_ and arg_55_1.time_ <= var_58_28 + arg_58_0 then
				arg_55_1.var_.moveOldPos1184ui_story = var_58_27.localPosition
			end

			local var_58_29 = 0.001

			if var_58_28 <= arg_55_1.time_ and arg_55_1.time_ < var_58_28 + var_58_29 then
				local var_58_30 = (arg_55_1.time_ - var_58_28) / var_58_29
				local var_58_31 = Vector3.New(0, 100, 0)

				var_58_27.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1184ui_story, var_58_31, var_58_30)

				local var_58_32 = manager.ui.mainCamera.transform.position - var_58_27.position

				var_58_27.forward = Vector3.New(var_58_32.x, var_58_32.y, var_58_32.z)

				local var_58_33 = var_58_27.localEulerAngles

				var_58_33.z = 0
				var_58_33.x = 0
				var_58_27.localEulerAngles = var_58_33
			end

			if arg_55_1.time_ >= var_58_28 + var_58_29 and arg_55_1.time_ < var_58_28 + var_58_29 + arg_58_0 then
				var_58_27.localPosition = Vector3.New(0, 100, 0)

				local var_58_34 = manager.ui.mainCamera.transform.position - var_58_27.position

				var_58_27.forward = Vector3.New(var_58_34.x, var_58_34.y, var_58_34.z)

				local var_58_35 = var_58_27.localEulerAngles

				var_58_35.z = 0
				var_58_35.x = 0
				var_58_27.localEulerAngles = var_58_35
			end

			local var_58_36 = arg_55_1.bgs_.XH0106.transform
			local var_58_37 = 2

			if var_58_37 < arg_55_1.time_ and arg_55_1.time_ <= var_58_37 + arg_58_0 then
				arg_55_1.var_.moveOldPosXH0106 = var_58_36.localPosition
			end

			local var_58_38 = 0.001

			if var_58_37 <= arg_55_1.time_ and arg_55_1.time_ < var_58_37 + var_58_38 then
				local var_58_39 = (arg_55_1.time_ - var_58_37) / var_58_38
				local var_58_40 = Vector3.New(-2.5, 0, 3)

				var_58_36.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosXH0106, var_58_40, var_58_39)
			end

			if arg_55_1.time_ >= var_58_37 + var_58_38 and arg_55_1.time_ < var_58_37 + var_58_38 + arg_58_0 then
				var_58_36.localPosition = Vector3.New(-2.5, 0, 3)
			end

			local var_58_41 = arg_55_1.bgs_.XH0106.transform
			local var_58_42 = 2.034

			if var_58_42 < arg_55_1.time_ and arg_55_1.time_ <= var_58_42 + arg_58_0 then
				arg_55_1.var_.moveOldPosXH0106 = var_58_41.localPosition
			end

			local var_58_43 = 4.5

			if var_58_42 <= arg_55_1.time_ and arg_55_1.time_ < var_58_42 + var_58_43 then
				local var_58_44 = (arg_55_1.time_ - var_58_42) / var_58_43
				local var_58_45 = Vector3.New(-2.5, 0.5, 3)

				var_58_41.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosXH0106, var_58_45, var_58_44)
			end

			if arg_55_1.time_ >= var_58_42 + var_58_43 and arg_55_1.time_ < var_58_42 + var_58_43 + arg_58_0 then
				var_58_41.localPosition = Vector3.New(-2.5, 0.5, 3)
			end

			local var_58_46 = 4

			if var_58_46 < arg_55_1.time_ and arg_55_1.time_ <= var_58_46 + arg_58_0 then
				arg_55_1.allBtn_.enabled = false
			end

			local var_58_47 = 2.534

			if arg_55_1.time_ >= var_58_46 + var_58_47 and arg_55_1.time_ < var_58_46 + var_58_47 + arg_58_0 then
				arg_55_1.allBtn_.enabled = true
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_48 = 4
			local var_58_49 = 0.225

			if var_58_48 < arg_55_1.time_ and arg_55_1.time_ <= var_58_48 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_50 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_50:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_51 = arg_55_1:GetWordFromCfg(120112014)
				local var_58_52 = arg_55_1:FormatText(var_58_51.content)

				arg_55_1.text_.text = var_58_52

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_53 = 9
				local var_58_54 = utf8.len(var_58_52)
				local var_58_55 = var_58_53 <= 0 and var_58_49 or var_58_49 * (var_58_54 / var_58_53)

				if var_58_55 > 0 and var_58_49 < var_58_55 then
					arg_55_1.talkMaxDuration = var_58_55
					var_58_48 = var_58_48 + 0.3

					if var_58_55 + var_58_48 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_55 + var_58_48
					end
				end

				arg_55_1.text_.text = var_58_52
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_56 = var_58_48 + 0.3
			local var_58_57 = math.max(var_58_49, arg_55_1.talkMaxDuration)

			if var_58_56 <= arg_55_1.time_ and arg_55_1.time_ < var_58_56 + var_58_57 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_56) / var_58_57

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_56 + var_58_57 and arg_55_1.time_ < var_58_56 + var_58_57 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120112015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 120112015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play120112016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.725

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

				local var_64_2 = arg_61_1:GetWordFromCfg(120112015)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 29
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
	Play120112016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 120112016
		arg_65_1.duration_ = 13.033

		local var_65_0 = {
			zh = 6.9,
			ja = 13.033
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
				arg_65_0:Play120112017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.75

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[387].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(120112016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112016", "story_v_out_120112.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112016", "story_v_out_120112.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_120112", "120112016", "story_v_out_120112.awb")

						arg_65_1:RecordAudio("120112016", var_68_9)
						arg_65_1:RecordAudio("120112016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_120112", "120112016", "story_v_out_120112.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_120112", "120112016", "story_v_out_120112.awb")
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
	Play120112017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 120112017
		arg_69_1.duration_ = 12.066

		local var_69_0 = {
			zh = 8.866,
			ja = 12.066
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
				arg_69_0:Play120112018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.925

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[387].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(120112017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112017", "story_v_out_120112.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112017", "story_v_out_120112.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_120112", "120112017", "story_v_out_120112.awb")

						arg_69_1:RecordAudio("120112017", var_72_9)
						arg_69_1:RecordAudio("120112017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_120112", "120112017", "story_v_out_120112.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_120112", "120112017", "story_v_out_120112.awb")
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
	Play120112018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 120112018
		arg_73_1.duration_ = 7.533

		local var_73_0 = {
			zh = 4.8,
			ja = 7.533
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
				arg_73_0:Play120112019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.4

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[387].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(120112018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112018", "story_v_out_120112.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112018", "story_v_out_120112.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_120112", "120112018", "story_v_out_120112.awb")

						arg_73_1:RecordAudio("120112018", var_76_9)
						arg_73_1:RecordAudio("120112018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_120112", "120112018", "story_v_out_120112.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_120112", "120112018", "story_v_out_120112.awb")
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
	Play120112019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 120112019
		arg_77_1.duration_ = 10.2

		local var_77_0 = {
			zh = 5.333,
			ja = 10.2
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
				arg_77_0:Play120112020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.35

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[387].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(120112019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112019", "story_v_out_120112.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112019", "story_v_out_120112.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_120112", "120112019", "story_v_out_120112.awb")

						arg_77_1:RecordAudio("120112019", var_80_9)
						arg_77_1:RecordAudio("120112019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_120112", "120112019", "story_v_out_120112.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_120112", "120112019", "story_v_out_120112.awb")
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
	Play120112020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 120112020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play120112021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.15

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

				local var_84_2 = arg_81_1:GetWordFromCfg(120112020)
				local var_84_3 = arg_81_1:FormatText(var_84_2.content)

				arg_81_1.text_.text = var_84_3

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_4 = 46
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
	Play120112021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 120112021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play120112022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.8

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_2 = arg_85_1:GetWordFromCfg(120112021)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 32
				local var_88_5 = utf8.len(var_88_3)
				local var_88_6 = var_88_4 <= 0 and var_88_1 or var_88_1 * (var_88_5 / var_88_4)

				if var_88_6 > 0 and var_88_1 < var_88_6 then
					arg_85_1.talkMaxDuration = var_88_6

					if var_88_6 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_6 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_3
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_7 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_7 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_7

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_7 and arg_85_1.time_ < var_88_0 + var_88_7 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play120112022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 120112022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play120112023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.mask_.enabled = true
				arg_89_1.mask_.raycastTarget = true

				arg_89_1:SetGaussion(false)
			end

			local var_92_1 = 2

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_1 then
				local var_92_2 = (arg_89_1.time_ - var_92_0) / var_92_1
				local var_92_3 = Color.New(1, 1, 1)

				var_92_3.a = Mathf.Lerp(1, 0, var_92_2)
				arg_89_1.mask_.color = var_92_3
			end

			if arg_89_1.time_ >= var_92_0 + var_92_1 and arg_89_1.time_ < var_92_0 + var_92_1 + arg_92_0 then
				local var_92_4 = Color.New(1, 1, 1)
				local var_92_5 = 0

				arg_89_1.mask_.enabled = false
				var_92_4.a = var_92_5
				arg_89_1.mask_.color = var_92_4
			end

			local var_92_6 = 0
			local var_92_7 = 1

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				local var_92_8 = "play"
				local var_92_9 = "effect"

				arg_89_1:AudioAction(var_92_8, var_92_9, "se_story_120_00", "se_story_120_00_gun02", "")
			end

			local var_92_10 = manager.ui.mainCamera.transform
			local var_92_11 = 0

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1.var_.shakeOldPos = var_92_10.localPosition
			end

			local var_92_12 = 0.6

			if var_92_11 <= arg_89_1.time_ and arg_89_1.time_ < var_92_11 + var_92_12 then
				local var_92_13 = (arg_89_1.time_ - var_92_11) / 0.066
				local var_92_14, var_92_15 = math.modf(var_92_13)

				var_92_10.localPosition = Vector3.New(var_92_15 * 0.13, var_92_15 * 0.13, var_92_15 * 0.13) + arg_89_1.var_.shakeOldPos
			end

			if arg_89_1.time_ >= var_92_11 + var_92_12 and arg_89_1.time_ < var_92_11 + var_92_12 + arg_92_0 then
				var_92_10.localPosition = arg_89_1.var_.shakeOldPos
			end

			local var_92_16 = 0

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 then
				arg_89_1.allBtn_.enabled = false
			end

			local var_92_17 = 0.6

			if arg_89_1.time_ >= var_92_16 + var_92_17 and arg_89_1.time_ < var_92_16 + var_92_17 + arg_92_0 then
				arg_89_1.allBtn_.enabled = true
			end

			local var_92_18 = 0
			local var_92_19 = 0.05

			if var_92_18 < arg_89_1.time_ and arg_89_1.time_ <= var_92_18 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_20 = arg_89_1:GetWordFromCfg(120112022)
				local var_92_21 = arg_89_1:FormatText(var_92_20.content)

				arg_89_1.text_.text = var_92_21

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_22 = 2
				local var_92_23 = utf8.len(var_92_21)
				local var_92_24 = var_92_22 <= 0 and var_92_19 or var_92_19 * (var_92_23 / var_92_22)

				if var_92_24 > 0 and var_92_19 < var_92_24 then
					arg_89_1.talkMaxDuration = var_92_24

					if var_92_24 + var_92_18 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_24 + var_92_18
					end
				end

				arg_89_1.text_.text = var_92_21
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_25 = math.max(var_92_19, arg_89_1.talkMaxDuration)

			if var_92_18 <= arg_89_1.time_ and arg_89_1.time_ < var_92_18 + var_92_25 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_18) / var_92_25

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_18 + var_92_25 and arg_89_1.time_ < var_92_18 + var_92_25 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play120112023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 120112023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play120112024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.775

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_2 = arg_93_1:GetWordFromCfg(120112023)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 31
				local var_96_5 = utf8.len(var_96_3)
				local var_96_6 = var_96_4 <= 0 and var_96_1 or var_96_1 * (var_96_5 / var_96_4)

				if var_96_6 > 0 and var_96_1 < var_96_6 then
					arg_93_1.talkMaxDuration = var_96_6

					if var_96_6 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_6 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_3
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_7 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_7 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_7

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_7 and arg_93_1.time_ < var_96_0 + var_96_7 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play120112024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 120112024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play120112025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.4

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[7].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(120112024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 16
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_8 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_8 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_8

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_8 and arg_97_1.time_ < var_100_0 + var_100_8 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play120112025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 120112025
		arg_101_1.duration_ = 6.166

		local var_101_0 = {
			zh = 1.766,
			ja = 6.166
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
				arg_101_0:Play120112026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.15

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[387].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(120112025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112025", "story_v_out_120112.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112025", "story_v_out_120112.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_120112", "120112025", "story_v_out_120112.awb")

						arg_101_1:RecordAudio("120112025", var_104_9)
						arg_101_1:RecordAudio("120112025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_120112", "120112025", "story_v_out_120112.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_120112", "120112025", "story_v_out_120112.awb")
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
	Play120112026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 120112026
		arg_105_1.duration_ = 5.5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play120112027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_1 = 0.5

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_1 then
				local var_108_2 = (arg_105_1.time_ - var_108_0) / var_108_1
				local var_108_3 = Color.New(1, 1, 1)

				var_108_3.a = Mathf.Lerp(1, 0, var_108_2)
				arg_105_1.mask_.color = var_108_3
			end

			if arg_105_1.time_ >= var_108_0 + var_108_1 and arg_105_1.time_ < var_108_0 + var_108_1 + arg_108_0 then
				local var_108_4 = Color.New(1, 1, 1)
				local var_108_5 = 0

				arg_105_1.mask_.enabled = false
				var_108_4.a = var_108_5
				arg_105_1.mask_.color = var_108_4
			end

			local var_108_6 = 0
			local var_108_7 = 1

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				local var_108_8 = "play"
				local var_108_9 = "effect"

				arg_105_1:AudioAction(var_108_8, var_108_9, "se_story_120_00", "se_story_120_00_magicchain", "")
			end

			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1.allBtn_.enabled = false
			end

			local var_108_11 = 0.5

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 then
				arg_105_1.allBtn_.enabled = true
			end

			if arg_105_1.frameCnt_ <= 1 then
				arg_105_1.dialog_:SetActive(false)
			end

			local var_108_12 = 0.5
			local var_108_13 = 0.1

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0

				arg_105_1.dialog_:SetActive(true)

				local var_108_14 = LeanTween.value(arg_105_1.dialog_, 0, 1, 0.3)

				var_108_14:setOnUpdate(LuaHelper.FloatAction(function(arg_109_0)
					arg_105_1.dialogCg_.alpha = arg_109_0
				end))
				var_108_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_105_1.dialog_)
					var_108_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_105_1.duration_ = arg_105_1.duration_ + 0.3

				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_15 = arg_105_1:GetWordFromCfg(120112026)
				local var_108_16 = arg_105_1:FormatText(var_108_15.content)

				arg_105_1.text_.text = var_108_16

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_17 = 4
				local var_108_18 = utf8.len(var_108_16)
				local var_108_19 = var_108_17 <= 0 and var_108_13 or var_108_13 * (var_108_18 / var_108_17)

				if var_108_19 > 0 and var_108_13 < var_108_19 then
					arg_105_1.talkMaxDuration = var_108_19
					var_108_12 = var_108_12 + 0.3

					if var_108_19 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_12
					end
				end

				arg_105_1.text_.text = var_108_16
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_20 = var_108_12 + 0.3
			local var_108_21 = math.max(var_108_13, arg_105_1.talkMaxDuration)

			if var_108_20 <= arg_105_1.time_ and arg_105_1.time_ < var_108_20 + var_108_21 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_20) / var_108_21

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_20 + var_108_21 and arg_105_1.time_ < var_108_20 + var_108_21 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play120112027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120112027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play120112028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.175

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

				local var_114_2 = arg_111_1:GetWordFromCfg(120112027)
				local var_114_3 = arg_111_1:FormatText(var_114_2.content)

				arg_111_1.text_.text = var_114_3

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_4 = 47
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
	Play120112028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120112028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play120112029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.825

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

				local var_118_2 = arg_115_1:GetWordFromCfg(120112028)
				local var_118_3 = arg_115_1:FormatText(var_118_2.content)

				arg_115_1.text_.text = var_118_3

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_4 = 33
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
	Play120112029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120112029
		arg_119_1.duration_ = 2.999999999999

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play120112030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.mask_.enabled = true
				arg_119_1.mask_.raycastTarget = true

				arg_119_1:SetGaussion(false)
			end

			local var_122_1 = 2

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_1 then
				local var_122_2 = (arg_119_1.time_ - var_122_0) / var_122_1
				local var_122_3 = Color.New(1, 1, 1)

				var_122_3.a = Mathf.Lerp(1, 0, var_122_2)
				arg_119_1.mask_.color = var_122_3
			end

			if arg_119_1.time_ >= var_122_0 + var_122_1 and arg_119_1.time_ < var_122_0 + var_122_1 + arg_122_0 then
				local var_122_4 = Color.New(1, 1, 1)
				local var_122_5 = 0

				arg_119_1.mask_.enabled = false
				var_122_4.a = var_122_5
				arg_119_1.mask_.color = var_122_4
			end

			local var_122_6 = arg_119_1.bgs_.XH0106.transform
			local var_122_7 = 0

			if var_122_7 < arg_119_1.time_ and arg_119_1.time_ <= var_122_7 + arg_122_0 then
				arg_119_1.var_.moveOldPosXH0106 = var_122_6.localPosition
			end

			local var_122_8 = 3

			if var_122_7 <= arg_119_1.time_ and arg_119_1.time_ < var_122_7 + var_122_8 then
				local var_122_9 = (arg_119_1.time_ - var_122_7) / var_122_8
				local var_122_10 = Vector3.New(-2.5, 0.5, 3.5)

				var_122_6.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPosXH0106, var_122_10, var_122_9)
			end

			if arg_119_1.time_ >= var_122_7 + var_122_8 and arg_119_1.time_ < var_122_7 + var_122_8 + arg_122_0 then
				var_122_6.localPosition = Vector3.New(-2.5, 0.5, 3.5)
			end

			local var_122_11 = 2

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.allBtn_.enabled = false
			end

			local var_122_12 = 1

			if arg_119_1.time_ >= var_122_11 + var_122_12 and arg_119_1.time_ < var_122_11 + var_122_12 + arg_122_0 then
				arg_119_1.allBtn_.enabled = true
			end

			local var_122_13 = 0
			local var_122_14 = 0.175

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_15 = arg_119_1:FormatText(StoryNameCfg[387].name)

				arg_119_1.leftNameTxt_.text = var_122_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_16 = arg_119_1:GetWordFromCfg(120112029)
				local var_122_17 = arg_119_1:FormatText(var_122_16.content)

				arg_119_1.text_.text = var_122_17

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_18 = 7
				local var_122_19 = utf8.len(var_122_17)
				local var_122_20 = var_122_18 <= 0 and var_122_14 or var_122_14 * (var_122_19 / var_122_18)

				if var_122_20 > 0 and var_122_14 < var_122_20 then
					arg_119_1.talkMaxDuration = var_122_20

					if var_122_20 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_20 + var_122_13
					end
				end

				arg_119_1.text_.text = var_122_17
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112029", "story_v_out_120112.awb") ~= 0 then
					local var_122_21 = manager.audio:GetVoiceLength("story_v_out_120112", "120112029", "story_v_out_120112.awb") / 1000

					if var_122_21 + var_122_13 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_13
					end

					if var_122_16.prefab_name ~= "" and arg_119_1.actors_[var_122_16.prefab_name] ~= nil then
						local var_122_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_16.prefab_name].transform, "story_v_out_120112", "120112029", "story_v_out_120112.awb")

						arg_119_1:RecordAudio("120112029", var_122_22)
						arg_119_1:RecordAudio("120112029", var_122_22)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120112", "120112029", "story_v_out_120112.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120112", "120112029", "story_v_out_120112.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_23 = math.max(var_122_14, arg_119_1.talkMaxDuration)

			if var_122_13 <= arg_119_1.time_ and arg_119_1.time_ < var_122_13 + var_122_23 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_13) / var_122_23

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_13 + var_122_23 and arg_119_1.time_ < var_122_13 + var_122_23 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play120112030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120112030
		arg_123_1.duration_ = 7

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play120112031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 1

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				local var_126_2 = "play"
				local var_126_3 = "effect"

				arg_123_1:AudioAction(var_126_2, var_126_3, "se_story_120_00", "se_story_120_00_door_break01", "")
			end

			local var_126_4 = 0

			if var_126_4 < arg_123_1.time_ and arg_123_1.time_ <= var_126_4 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_5 = 2

			if var_126_4 <= arg_123_1.time_ and arg_123_1.time_ < var_126_4 + var_126_5 then
				local var_126_6 = (arg_123_1.time_ - var_126_4) / var_126_5
				local var_126_7 = Color.New(0, 0, 0)

				var_126_7.a = Mathf.Lerp(1, 0, var_126_6)
				arg_123_1.mask_.color = var_126_7
			end

			if arg_123_1.time_ >= var_126_4 + var_126_5 and arg_123_1.time_ < var_126_4 + var_126_5 + arg_126_0 then
				local var_126_8 = Color.New(0, 0, 0)
				local var_126_9 = 0

				arg_123_1.mask_.enabled = false
				var_126_8.a = var_126_9
				arg_123_1.mask_.color = var_126_8
			end

			local var_126_10 = "XH0106a"

			if arg_123_1.bgs_[var_126_10] == nil then
				local var_126_11 = Object.Instantiate(arg_123_1.paintGo_)

				var_126_11:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_126_10)
				var_126_11.name = var_126_10
				var_126_11.transform.parent = arg_123_1.stage_.transform
				var_126_11.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.bgs_[var_126_10] = var_126_11
			end

			local var_126_12 = 0

			if var_126_12 < arg_123_1.time_ and arg_123_1.time_ <= var_126_12 + arg_126_0 then
				local var_126_13 = manager.ui.mainCamera.transform.localPosition
				local var_126_14 = Vector3.New(0, 0, 10) + Vector3.New(var_126_13.x, var_126_13.y, 0)
				local var_126_15 = arg_123_1.bgs_.XH0106a

				var_126_15.transform.localPosition = var_126_14
				var_126_15.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_16 = var_126_15:GetComponent("SpriteRenderer")

				if var_126_16 and var_126_16.sprite then
					local var_126_17 = (var_126_15.transform.localPosition - var_126_13).z
					local var_126_18 = manager.ui.mainCameraCom_
					local var_126_19 = 2 * var_126_17 * Mathf.Tan(var_126_18.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_20 = var_126_19 * var_126_18.aspect
					local var_126_21 = var_126_16.sprite.bounds.size.x
					local var_126_22 = var_126_16.sprite.bounds.size.y
					local var_126_23 = var_126_20 / var_126_21
					local var_126_24 = var_126_19 / var_126_22
					local var_126_25 = var_126_24 < var_126_23 and var_126_23 or var_126_24

					var_126_15.transform.localScale = Vector3.New(var_126_25, var_126_25, 0)
				end

				for iter_126_0, iter_126_1 in pairs(arg_123_1.bgs_) do
					if iter_126_0 ~= "XH0106a" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_26 = arg_123_1.bgs_.XH0106a.transform
			local var_126_27 = 0

			if var_126_27 < arg_123_1.time_ and arg_123_1.time_ <= var_126_27 + arg_126_0 then
				arg_123_1.var_.moveOldPosXH0106a = var_126_26.localPosition
			end

			local var_126_28 = 0.001

			if var_126_27 <= arg_123_1.time_ and arg_123_1.time_ < var_126_27 + var_126_28 then
				local var_126_29 = (arg_123_1.time_ - var_126_27) / var_126_28
				local var_126_30 = Vector3.New(-2.5, 0, 5)

				var_126_26.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPosXH0106a, var_126_30, var_126_29)
			end

			if arg_123_1.time_ >= var_126_27 + var_126_28 and arg_123_1.time_ < var_126_27 + var_126_28 + arg_126_0 then
				var_126_26.localPosition = Vector3.New(-2.5, 0, 5)
			end

			local var_126_31 = arg_123_1.bgs_.XH0106a.transform
			local var_126_32 = 0.034

			if var_126_32 < arg_123_1.time_ and arg_123_1.time_ <= var_126_32 + arg_126_0 then
				arg_123_1.var_.moveOldPosXH0106a = var_126_31.localPosition
			end

			local var_126_33 = 4.5

			if var_126_32 <= arg_123_1.time_ and arg_123_1.time_ < var_126_32 + var_126_33 then
				local var_126_34 = (arg_123_1.time_ - var_126_32) / var_126_33
				local var_126_35 = Vector3.New(-2.5, 0, 5.5)

				var_126_31.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPosXH0106a, var_126_35, var_126_34)
			end

			if arg_123_1.time_ >= var_126_32 + var_126_33 and arg_123_1.time_ < var_126_32 + var_126_33 + arg_126_0 then
				var_126_31.localPosition = Vector3.New(-2.5, 0, 5.5)
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_36 = 2
			local var_126_37 = 0.05

			if var_126_36 < arg_123_1.time_ and arg_123_1.time_ <= var_126_36 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_38 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_38:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_39 = arg_123_1:GetWordFromCfg(120112030)
				local var_126_40 = arg_123_1:FormatText(var_126_39.content)

				arg_123_1.text_.text = var_126_40

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_41 = 2
				local var_126_42 = utf8.len(var_126_40)
				local var_126_43 = var_126_41 <= 0 and var_126_37 or var_126_37 * (var_126_42 / var_126_41)

				if var_126_43 > 0 and var_126_37 < var_126_43 then
					arg_123_1.talkMaxDuration = var_126_43
					var_126_36 = var_126_36 + 0.3

					if var_126_43 + var_126_36 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_43 + var_126_36
					end
				end

				arg_123_1.text_.text = var_126_40
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_44 = var_126_36 + 0.3
			local var_126_45 = math.max(var_126_37, arg_123_1.talkMaxDuration)

			if var_126_44 <= arg_123_1.time_ and arg_123_1.time_ < var_126_44 + var_126_45 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_44) / var_126_45

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_44 + var_126_45 and arg_123_1.time_ < var_126_44 + var_126_45 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120112031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 120112031
		arg_129_1.duration_ = 5.233

		local var_129_0 = {
			zh = 4.533,
			ja = 5.233
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
				arg_129_0:Play120112032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.35

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[36].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(120112031)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112031", "story_v_out_120112.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112031", "story_v_out_120112.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_120112", "120112031", "story_v_out_120112.awb")

						arg_129_1:RecordAudio("120112031", var_132_9)
						arg_129_1:RecordAudio("120112031", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_120112", "120112031", "story_v_out_120112.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_120112", "120112031", "story_v_out_120112.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_10 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_10 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_10

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_10 and arg_129_1.time_ < var_132_0 + var_132_10 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play120112032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 120112032
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play120112033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.55

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_2 = arg_133_1:GetWordFromCfg(120112032)
				local var_136_3 = arg_133_1:FormatText(var_136_2.content)

				arg_133_1.text_.text = var_136_3

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_4 = 22
				local var_136_5 = utf8.len(var_136_3)
				local var_136_6 = var_136_4 <= 0 and var_136_1 or var_136_1 * (var_136_5 / var_136_4)

				if var_136_6 > 0 and var_136_1 < var_136_6 then
					arg_133_1.talkMaxDuration = var_136_6

					if var_136_6 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_6 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_3
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_7 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_7 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_7

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_7 and arg_133_1.time_ < var_136_0 + var_136_7 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play120112033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 120112033
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play120112034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.475

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_2 = arg_137_1:GetWordFromCfg(120112033)
				local var_140_3 = arg_137_1:FormatText(var_140_2.content)

				arg_137_1.text_.text = var_140_3

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_4 = 19
				local var_140_5 = utf8.len(var_140_3)
				local var_140_6 = var_140_4 <= 0 and var_140_1 or var_140_1 * (var_140_5 / var_140_4)

				if var_140_6 > 0 and var_140_1 < var_140_6 then
					arg_137_1.talkMaxDuration = var_140_6

					if var_140_6 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_6 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_3
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_7 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_7 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_7

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_7 and arg_137_1.time_ < var_140_0 + var_140_7 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play120112034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 120112034
		arg_141_1.duration_ = 1.6

		local var_141_0 = {
			zh = 1.266,
			ja = 1.6
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
				arg_141_0:Play120112035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.1

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[6].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(120112034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 4
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112034", "story_v_out_120112.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112034", "story_v_out_120112.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_120112", "120112034", "story_v_out_120112.awb")

						arg_141_1:RecordAudio("120112034", var_144_9)
						arg_141_1:RecordAudio("120112034", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_120112", "120112034", "story_v_out_120112.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_120112", "120112034", "story_v_out_120112.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_10 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_10 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_10

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_10 and arg_141_1.time_ < var_144_0 + var_144_10 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play120112035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 120112035
		arg_145_1.duration_ = 6.466

		local var_145_0 = {
			zh = 6.466,
			ja = 6.3
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
				arg_145_0:Play120112036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 2

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				local var_148_1 = manager.ui.mainCamera.transform.localPosition
				local var_148_2 = Vector3.New(0, 0, 10) + Vector3.New(var_148_1.x, var_148_1.y, 0)
				local var_148_3 = arg_145_1.bgs_.XH0106a

				var_148_3.transform.localPosition = var_148_2
				var_148_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_148_4 = var_148_3:GetComponent("SpriteRenderer")

				if var_148_4 and var_148_4.sprite then
					local var_148_5 = (var_148_3.transform.localPosition - var_148_1).z
					local var_148_6 = manager.ui.mainCameraCom_
					local var_148_7 = 2 * var_148_5 * Mathf.Tan(var_148_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_148_8 = var_148_7 * var_148_6.aspect
					local var_148_9 = var_148_4.sprite.bounds.size.x
					local var_148_10 = var_148_4.sprite.bounds.size.y
					local var_148_11 = var_148_8 / var_148_9
					local var_148_12 = var_148_7 / var_148_10
					local var_148_13 = var_148_12 < var_148_11 and var_148_11 or var_148_12

					var_148_3.transform.localScale = Vector3.New(var_148_13, var_148_13, 0)
				end

				for iter_148_0, iter_148_1 in pairs(arg_145_1.bgs_) do
					if iter_148_0 ~= "XH0106a" then
						iter_148_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1.mask_.enabled = true
				arg_145_1.mask_.raycastTarget = true

				arg_145_1:SetGaussion(false)
			end

			local var_148_15 = 2

			if var_148_14 <= arg_145_1.time_ and arg_145_1.time_ < var_148_14 + var_148_15 then
				local var_148_16 = (arg_145_1.time_ - var_148_14) / var_148_15
				local var_148_17 = Color.New(0, 0, 0)

				var_148_17.a = Mathf.Lerp(0, 1, var_148_16)
				arg_145_1.mask_.color = var_148_17
			end

			if arg_145_1.time_ >= var_148_14 + var_148_15 and arg_145_1.time_ < var_148_14 + var_148_15 + arg_148_0 then
				local var_148_18 = Color.New(0, 0, 0)

				var_148_18.a = 1
				arg_145_1.mask_.color = var_148_18
			end

			local var_148_19 = 2

			if var_148_19 < arg_145_1.time_ and arg_145_1.time_ <= var_148_19 + arg_148_0 then
				arg_145_1.mask_.enabled = true
				arg_145_1.mask_.raycastTarget = true

				arg_145_1:SetGaussion(false)
			end

			local var_148_20 = 2

			if var_148_19 <= arg_145_1.time_ and arg_145_1.time_ < var_148_19 + var_148_20 then
				local var_148_21 = (arg_145_1.time_ - var_148_19) / var_148_20
				local var_148_22 = Color.New(0, 0, 0)

				var_148_22.a = Mathf.Lerp(1, 0, var_148_21)
				arg_145_1.mask_.color = var_148_22
			end

			if arg_145_1.time_ >= var_148_19 + var_148_20 and arg_145_1.time_ < var_148_19 + var_148_20 + arg_148_0 then
				local var_148_23 = Color.New(0, 0, 0)
				local var_148_24 = 0

				arg_145_1.mask_.enabled = false
				var_148_23.a = var_148_24
				arg_145_1.mask_.color = var_148_23
			end

			if arg_145_1.frameCnt_ <= 1 then
				arg_145_1.dialog_:SetActive(false)
			end

			local var_148_25 = 4
			local var_148_26 = 0.175

			if var_148_25 < arg_145_1.time_ and arg_145_1.time_ <= var_148_25 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0

				arg_145_1.dialog_:SetActive(true)

				local var_148_27 = LeanTween.value(arg_145_1.dialog_, 0, 1, 0.3)

				var_148_27:setOnUpdate(LuaHelper.FloatAction(function(arg_149_0)
					arg_145_1.dialogCg_.alpha = arg_149_0
				end))
				var_148_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_145_1.dialog_)
					var_148_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_145_1.duration_ = arg_145_1.duration_ + 0.3

				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_28 = arg_145_1:FormatText(StoryNameCfg[387].name)

				arg_145_1.leftNameTxt_.text = var_148_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_29 = arg_145_1:GetWordFromCfg(120112035)
				local var_148_30 = arg_145_1:FormatText(var_148_29.content)

				arg_145_1.text_.text = var_148_30

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_31 = 7
				local var_148_32 = utf8.len(var_148_30)
				local var_148_33 = var_148_31 <= 0 and var_148_26 or var_148_26 * (var_148_32 / var_148_31)

				if var_148_33 > 0 and var_148_26 < var_148_33 then
					arg_145_1.talkMaxDuration = var_148_33
					var_148_25 = var_148_25 + 0.3

					if var_148_33 + var_148_25 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_33 + var_148_25
					end
				end

				arg_145_1.text_.text = var_148_30
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112035", "story_v_out_120112.awb") ~= 0 then
					local var_148_34 = manager.audio:GetVoiceLength("story_v_out_120112", "120112035", "story_v_out_120112.awb") / 1000

					if var_148_34 + var_148_25 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_34 + var_148_25
					end

					if var_148_29.prefab_name ~= "" and arg_145_1.actors_[var_148_29.prefab_name] ~= nil then
						local var_148_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_29.prefab_name].transform, "story_v_out_120112", "120112035", "story_v_out_120112.awb")

						arg_145_1:RecordAudio("120112035", var_148_35)
						arg_145_1:RecordAudio("120112035", var_148_35)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_120112", "120112035", "story_v_out_120112.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_120112", "120112035", "story_v_out_120112.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_36 = var_148_25 + 0.3
			local var_148_37 = math.max(var_148_26, arg_145_1.talkMaxDuration)

			if var_148_36 <= arg_145_1.time_ and arg_145_1.time_ < var_148_36 + var_148_37 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_36) / var_148_37

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_36 + var_148_37 and arg_145_1.time_ < var_148_36 + var_148_37 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play120112036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120112036
		arg_151_1.duration_ = 2.4

		local var_151_0 = {
			zh = 2.4,
			ja = 2.066
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
				arg_151_0:Play120112037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.225

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0

				arg_151_1.dialog_:SetActive(true)

				local var_154_2 = LeanTween.value(arg_151_1.dialog_, 0, 1, 0.3)

				var_154_2:setOnUpdate(LuaHelper.FloatAction(function(arg_155_0)
					arg_151_1.dialogCg_.alpha = arg_155_0
				end))
				var_154_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_151_1.dialog_)
					var_154_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_151_1.duration_ = arg_151_1.duration_ + 0.3

				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_3 = arg_151_1:FormatText(StoryNameCfg[384].name)

				arg_151_1.leftNameTxt_.text = var_154_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_4 = arg_151_1:GetWordFromCfg(120112036)
				local var_154_5 = arg_151_1:FormatText(var_154_4.content)

				arg_151_1.text_.text = var_154_5

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_6 = 9
				local var_154_7 = utf8.len(var_154_5)
				local var_154_8 = var_154_6 <= 0 and var_154_1 or var_154_1 * (var_154_7 / var_154_6)

				if var_154_8 > 0 and var_154_1 < var_154_8 then
					arg_151_1.talkMaxDuration = var_154_8
					var_154_0 = var_154_0 + 0.3

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_5
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112036", "story_v_out_120112.awb") ~= 0 then
					local var_154_9 = manager.audio:GetVoiceLength("story_v_out_120112", "120112036", "story_v_out_120112.awb") / 1000

					if var_154_9 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_9 + var_154_0
					end

					if var_154_4.prefab_name ~= "" and arg_151_1.actors_[var_154_4.prefab_name] ~= nil then
						local var_154_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_4.prefab_name].transform, "story_v_out_120112", "120112036", "story_v_out_120112.awb")

						arg_151_1:RecordAudio("120112036", var_154_10)
						arg_151_1:RecordAudio("120112036", var_154_10)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120112", "120112036", "story_v_out_120112.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120112", "120112036", "story_v_out_120112.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_11 = var_154_0 + 0.3
			local var_154_12 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_11 <= arg_151_1.time_ and arg_151_1.time_ < var_154_11 + var_154_12 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_11) / var_154_12

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_11 + var_154_12 and arg_151_1.time_ < var_154_11 + var_154_12 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play120112037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 120112037
		arg_157_1.duration_ = 8.133

		local var_157_0 = {
			zh = 6.166,
			ja = 8.133
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
				arg_157_0:Play120112038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.9

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[384].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(120112037)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 38
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112037", "story_v_out_120112.awb") ~= 0 then
					local var_160_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112037", "story_v_out_120112.awb") / 1000

					if var_160_8 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_0
					end

					if var_160_3.prefab_name ~= "" and arg_157_1.actors_[var_160_3.prefab_name] ~= nil then
						local var_160_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_3.prefab_name].transform, "story_v_out_120112", "120112037", "story_v_out_120112.awb")

						arg_157_1:RecordAudio("120112037", var_160_9)
						arg_157_1:RecordAudio("120112037", var_160_9)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_120112", "120112037", "story_v_out_120112.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_120112", "120112037", "story_v_out_120112.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_10 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_10 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_10

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_10 and arg_157_1.time_ < var_160_0 + var_160_10 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play120112038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 120112038
		arg_161_1.duration_ = 0.999999999999

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"

			SetActive(arg_161_1.choicesGo_, true)

			for iter_162_0, iter_162_1 in ipairs(arg_161_1.choices_) do
				local var_162_0 = iter_162_0 <= 2

				SetActive(iter_162_1.go, var_162_0)
			end

			arg_161_1.choices_[1].txt.text = arg_161_1:FormatText(StoryChoiceCfg[372].name)
			arg_161_1.choices_[2].txt.text = arg_161_1:FormatText(StoryChoiceCfg[373].name)
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play120112039(arg_161_1)
			end

			if arg_163_0 == 2 then
				arg_161_0:Play120112041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.allBtn_.enabled = false
			end

			local var_164_1 = 1

			if arg_161_1.time_ >= var_164_0 + var_164_1 and arg_161_1.time_ < var_164_0 + var_164_1 + arg_164_0 then
				arg_161_1.allBtn_.enabled = true
			end
		end
	end,
	Play120112039 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 120112039
		arg_165_1.duration_ = 10.566

		local var_165_0 = {
			zh = 6.166,
			ja = 10.566
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
				arg_165_0:Play120112040(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.825

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[384].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(120112039)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112039", "story_v_out_120112.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112039", "story_v_out_120112.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_120112", "120112039", "story_v_out_120112.awb")

						arg_165_1:RecordAudio("120112039", var_168_9)
						arg_165_1:RecordAudio("120112039", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_120112", "120112039", "story_v_out_120112.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_120112", "120112039", "story_v_out_120112.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play120112040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 120112040
		arg_169_1.duration_ = 4.4

		local var_169_0 = {
			zh = 4.233,
			ja = 4.4
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
				arg_169_0:Play120112043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.425

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[384].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(120112040)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112040", "story_v_out_120112.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112040", "story_v_out_120112.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_120112", "120112040", "story_v_out_120112.awb")

						arg_169_1:RecordAudio("120112040", var_172_9)
						arg_169_1:RecordAudio("120112040", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_120112", "120112040", "story_v_out_120112.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_120112", "120112040", "story_v_out_120112.awb")
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
	Play120112043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 120112043
		arg_173_1.duration_ = 9

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play120112044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 2

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				local var_176_1 = manager.ui.mainCamera.transform.localPosition
				local var_176_2 = Vector3.New(0, 0, 10) + Vector3.New(var_176_1.x, var_176_1.y, 0)
				local var_176_3 = arg_173_1.bgs_.J04f

				var_176_3.transform.localPosition = var_176_2
				var_176_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_176_4 = var_176_3:GetComponent("SpriteRenderer")

				if var_176_4 and var_176_4.sprite then
					local var_176_5 = (var_176_3.transform.localPosition - var_176_1).z
					local var_176_6 = manager.ui.mainCameraCom_
					local var_176_7 = 2 * var_176_5 * Mathf.Tan(var_176_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_176_8 = var_176_7 * var_176_6.aspect
					local var_176_9 = var_176_4.sprite.bounds.size.x
					local var_176_10 = var_176_4.sprite.bounds.size.y
					local var_176_11 = var_176_8 / var_176_9
					local var_176_12 = var_176_7 / var_176_10
					local var_176_13 = var_176_12 < var_176_11 and var_176_11 or var_176_12

					var_176_3.transform.localScale = Vector3.New(var_176_13, var_176_13, 0)
				end

				for iter_176_0, iter_176_1 in pairs(arg_173_1.bgs_) do
					if iter_176_0 ~= "J04f" then
						iter_176_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_15 = 2

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15
				local var_176_17 = Color.New(0, 0, 0)

				var_176_17.a = Mathf.Lerp(0, 1, var_176_16)
				arg_173_1.mask_.color = var_176_17
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 then
				local var_176_18 = Color.New(0, 0, 0)

				var_176_18.a = 1
				arg_173_1.mask_.color = var_176_18
			end

			local var_176_19 = 2

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_20 = 2

			if var_176_19 <= arg_173_1.time_ and arg_173_1.time_ < var_176_19 + var_176_20 then
				local var_176_21 = (arg_173_1.time_ - var_176_19) / var_176_20
				local var_176_22 = Color.New(0, 0, 0)

				var_176_22.a = Mathf.Lerp(1, 0, var_176_21)
				arg_173_1.mask_.color = var_176_22
			end

			if arg_173_1.time_ >= var_176_19 + var_176_20 and arg_173_1.time_ < var_176_19 + var_176_20 + arg_176_0 then
				local var_176_23 = Color.New(0, 0, 0)
				local var_176_24 = 0

				arg_173_1.mask_.enabled = false
				var_176_23.a = var_176_24
				arg_173_1.mask_.color = var_176_23
			end

			if arg_173_1.frameCnt_ <= 1 then
				arg_173_1.dialog_:SetActive(false)
			end

			local var_176_25 = 4
			local var_176_26 = 0.45

			if var_176_25 < arg_173_1.time_ and arg_173_1.time_ <= var_176_25 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				arg_173_1.dialog_:SetActive(true)

				local var_176_27 = LeanTween.value(arg_173_1.dialog_, 0, 1, 0.3)

				var_176_27:setOnUpdate(LuaHelper.FloatAction(function(arg_177_0)
					arg_173_1.dialogCg_.alpha = arg_177_0
				end))
				var_176_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_173_1.dialog_)
					var_176_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_173_1.duration_ = arg_173_1.duration_ + 0.3

				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_28 = arg_173_1:GetWordFromCfg(120112043)
				local var_176_29 = arg_173_1:FormatText(var_176_28.content)

				arg_173_1.text_.text = var_176_29

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_30 = 18
				local var_176_31 = utf8.len(var_176_29)
				local var_176_32 = var_176_30 <= 0 and var_176_26 or var_176_26 * (var_176_31 / var_176_30)

				if var_176_32 > 0 and var_176_26 < var_176_32 then
					arg_173_1.talkMaxDuration = var_176_32
					var_176_25 = var_176_25 + 0.3

					if var_176_32 + var_176_25 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_32 + var_176_25
					end
				end

				arg_173_1.text_.text = var_176_29
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_33 = var_176_25 + 0.3
			local var_176_34 = math.max(var_176_26, arg_173_1.talkMaxDuration)

			if var_176_33 <= arg_173_1.time_ and arg_173_1.time_ < var_176_33 + var_176_34 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_33) / var_176_34

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_33 + var_176_34 and arg_173_1.time_ < var_176_33 + var_176_34 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play120112044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120112044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play120112045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.725

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_2 = arg_179_1:GetWordFromCfg(120112044)
				local var_182_3 = arg_179_1:FormatText(var_182_2.content)

				arg_179_1.text_.text = var_182_3

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_4 = 29
				local var_182_5 = utf8.len(var_182_3)
				local var_182_6 = var_182_4 <= 0 and var_182_1 or var_182_1 * (var_182_5 / var_182_4)

				if var_182_6 > 0 and var_182_1 < var_182_6 then
					arg_179_1.talkMaxDuration = var_182_6

					if var_182_6 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_6 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_3
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_7 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_7 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_7

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_7 and arg_179_1.time_ < var_182_0 + var_182_7 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120112045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120112045
		arg_183_1.duration_ = 2.2

		local var_183_0 = {
			zh = 2.2,
			ja = 1.999999999999
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
				arg_183_0:Play120112046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = "1075ui_story"

			if arg_183_1.actors_[var_186_0] == nil then
				local var_186_1 = Object.Instantiate(Asset.Load("Char/" .. var_186_0), arg_183_1.stage_.transform)

				var_186_1.name = var_186_0
				var_186_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_183_1.actors_[var_186_0] = var_186_1

				local var_186_2 = var_186_1:GetComponentInChildren(typeof(CharacterEffect))

				var_186_2.enabled = true

				local var_186_3 = GameObjectTools.GetOrAddComponent(var_186_1, typeof(DynamicBoneHelper))

				if var_186_3 then
					var_186_3:EnableDynamicBone(false)
				end

				arg_183_1:ShowWeapon(var_186_2.transform, false)

				arg_183_1.var_[var_186_0 .. "Animator"] = var_186_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_183_1.var_[var_186_0 .. "Animator"].applyRootMotion = true
				arg_183_1.var_[var_186_0 .. "LipSync"] = var_186_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_186_4 = arg_183_1.actors_["1075ui_story"].transform
			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1.var_.moveOldPos1075ui_story = var_186_4.localPosition
			end

			local var_186_6 = 0.001

			if var_186_5 <= arg_183_1.time_ and arg_183_1.time_ < var_186_5 + var_186_6 then
				local var_186_7 = (arg_183_1.time_ - var_186_5) / var_186_6
				local var_186_8 = Vector3.New(0, -1.055, -6.16)

				var_186_4.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1075ui_story, var_186_8, var_186_7)

				local var_186_9 = manager.ui.mainCamera.transform.position - var_186_4.position

				var_186_4.forward = Vector3.New(var_186_9.x, var_186_9.y, var_186_9.z)

				local var_186_10 = var_186_4.localEulerAngles

				var_186_10.z = 0
				var_186_10.x = 0
				var_186_4.localEulerAngles = var_186_10
			end

			if arg_183_1.time_ >= var_186_5 + var_186_6 and arg_183_1.time_ < var_186_5 + var_186_6 + arg_186_0 then
				var_186_4.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_186_11 = manager.ui.mainCamera.transform.position - var_186_4.position

				var_186_4.forward = Vector3.New(var_186_11.x, var_186_11.y, var_186_11.z)

				local var_186_12 = var_186_4.localEulerAngles

				var_186_12.z = 0
				var_186_12.x = 0
				var_186_4.localEulerAngles = var_186_12
			end

			local var_186_13 = arg_183_1.actors_["1075ui_story"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story == nil then
				arg_183_1.var_.characterEffect1075ui_story = var_186_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_15 = 0.2

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_15 then
				local var_186_16 = (arg_183_1.time_ - var_186_14) / var_186_15

				if arg_183_1.var_.characterEffect1075ui_story then
					arg_183_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story then
				arg_183_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_186_17 = 0

			if var_186_17 < arg_183_1.time_ and arg_183_1.time_ <= var_186_17 + arg_186_0 then
				arg_183_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_186_18 = 0

			if var_186_18 < arg_183_1.time_ and arg_183_1.time_ <= var_186_18 + arg_186_0 then
				arg_183_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_186_19 = 0
			local var_186_20 = 0.125

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[381].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(120112045)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 5
				local var_186_25 = utf8.len(var_186_23)
				local var_186_26 = var_186_24 <= 0 and var_186_20 or var_186_20 * (var_186_25 / var_186_24)

				if var_186_26 > 0 and var_186_20 < var_186_26 then
					arg_183_1.talkMaxDuration = var_186_26

					if var_186_26 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_26 + var_186_19
					end
				end

				arg_183_1.text_.text = var_186_23
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112045", "story_v_out_120112.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_120112", "120112045", "story_v_out_120112.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_120112", "120112045", "story_v_out_120112.awb")

						arg_183_1:RecordAudio("120112045", var_186_28)
						arg_183_1:RecordAudio("120112045", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120112", "120112045", "story_v_out_120112.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120112", "120112045", "story_v_out_120112.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_29 = math.max(var_186_20, arg_183_1.talkMaxDuration)

			if var_186_19 <= arg_183_1.time_ and arg_183_1.time_ < var_186_19 + var_186_29 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_19) / var_186_29

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_19 + var_186_29 and arg_183_1.time_ < var_186_19 + var_186_29 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120112046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120112046
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120112047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1075ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1075ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, -1.055, -6.16)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1075ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1075ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story == nil then
				arg_187_1.var_.characterEffect1075ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.2

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1075ui_story then
					local var_190_13 = Mathf.Lerp(0, 0.5, var_190_12)

					arg_187_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1075ui_story.fillRatio = var_190_13
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story then
				local var_190_14 = 0.5

				arg_187_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1075ui_story.fillRatio = var_190_14
			end

			local var_190_15 = 0
			local var_190_16 = 1.175

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_17 = arg_187_1:GetWordFromCfg(120112046)
				local var_190_18 = arg_187_1:FormatText(var_190_17.content)

				arg_187_1.text_.text = var_190_18

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_19 = 47
				local var_190_20 = utf8.len(var_190_18)
				local var_190_21 = var_190_19 <= 0 and var_190_16 or var_190_16 * (var_190_20 / var_190_19)

				if var_190_21 > 0 and var_190_16 < var_190_21 then
					arg_187_1.talkMaxDuration = var_190_21

					if var_190_21 + var_190_15 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_21 + var_190_15
					end
				end

				arg_187_1.text_.text = var_190_18
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_16, arg_187_1.talkMaxDuration)

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_15) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_15 + var_190_22 and arg_187_1.time_ < var_190_15 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120112047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120112047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120112048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.25

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(120112047)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 10
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
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_8 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_8 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_8

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_8 and arg_191_1.time_ < var_194_0 + var_194_8 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120112048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120112048
		arg_195_1.duration_ = 7.533

		local var_195_0 = {
			zh = 4.5,
			ja = 7.533
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
				arg_195_0:Play120112049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1075ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1075ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, -1.055, -6.16)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1075ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1075ui_story"]
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 and arg_195_1.var_.characterEffect1075ui_story == nil then
				arg_195_1.var_.characterEffect1075ui_story = var_198_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_11 = 0.2

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11

				if arg_195_1.var_.characterEffect1075ui_story then
					arg_195_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 and arg_195_1.var_.characterEffect1075ui_story then
				arg_195_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 then
				arg_195_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_198_15 = 0
			local var_198_16 = 0.525

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_17 = arg_195_1:FormatText(StoryNameCfg[381].name)

				arg_195_1.leftNameTxt_.text = var_198_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_18 = arg_195_1:GetWordFromCfg(120112048)
				local var_198_19 = arg_195_1:FormatText(var_198_18.content)

				arg_195_1.text_.text = var_198_19

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_20 = 21
				local var_198_21 = utf8.len(var_198_19)
				local var_198_22 = var_198_20 <= 0 and var_198_16 or var_198_16 * (var_198_21 / var_198_20)

				if var_198_22 > 0 and var_198_16 < var_198_22 then
					arg_195_1.talkMaxDuration = var_198_22

					if var_198_22 + var_198_15 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_22 + var_198_15
					end
				end

				arg_195_1.text_.text = var_198_19
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112048", "story_v_out_120112.awb") ~= 0 then
					local var_198_23 = manager.audio:GetVoiceLength("story_v_out_120112", "120112048", "story_v_out_120112.awb") / 1000

					if var_198_23 + var_198_15 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_23 + var_198_15
					end

					if var_198_18.prefab_name ~= "" and arg_195_1.actors_[var_198_18.prefab_name] ~= nil then
						local var_198_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_18.prefab_name].transform, "story_v_out_120112", "120112048", "story_v_out_120112.awb")

						arg_195_1:RecordAudio("120112048", var_198_24)
						arg_195_1:RecordAudio("120112048", var_198_24)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120112", "120112048", "story_v_out_120112.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120112", "120112048", "story_v_out_120112.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_25 = math.max(var_198_16, arg_195_1.talkMaxDuration)

			if var_198_15 <= arg_195_1.time_ and arg_195_1.time_ < var_198_15 + var_198_25 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_15) / var_198_25

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_15 + var_198_25 and arg_195_1.time_ < var_198_15 + var_198_25 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120112049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120112049
		arg_199_1.duration_ = 9.466

		local var_199_0 = {
			zh = 9.466,
			ja = 9.033
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
				arg_199_0:Play120112050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_202_2 = 0
			local var_202_3 = 1.225

			if var_202_2 < arg_199_1.time_ and arg_199_1.time_ <= var_202_2 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_4 = arg_199_1:FormatText(StoryNameCfg[381].name)

				arg_199_1.leftNameTxt_.text = var_202_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_5 = arg_199_1:GetWordFromCfg(120112049)
				local var_202_6 = arg_199_1:FormatText(var_202_5.content)

				arg_199_1.text_.text = var_202_6

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_7 = 49
				local var_202_8 = utf8.len(var_202_6)
				local var_202_9 = var_202_7 <= 0 and var_202_3 or var_202_3 * (var_202_8 / var_202_7)

				if var_202_9 > 0 and var_202_3 < var_202_9 then
					arg_199_1.talkMaxDuration = var_202_9

					if var_202_9 + var_202_2 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_9 + var_202_2
					end
				end

				arg_199_1.text_.text = var_202_6
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112049", "story_v_out_120112.awb") ~= 0 then
					local var_202_10 = manager.audio:GetVoiceLength("story_v_out_120112", "120112049", "story_v_out_120112.awb") / 1000

					if var_202_10 + var_202_2 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_10 + var_202_2
					end

					if var_202_5.prefab_name ~= "" and arg_199_1.actors_[var_202_5.prefab_name] ~= nil then
						local var_202_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_5.prefab_name].transform, "story_v_out_120112", "120112049", "story_v_out_120112.awb")

						arg_199_1:RecordAudio("120112049", var_202_11)
						arg_199_1:RecordAudio("120112049", var_202_11)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120112", "120112049", "story_v_out_120112.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120112", "120112049", "story_v_out_120112.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_12 = math.max(var_202_3, arg_199_1.talkMaxDuration)

			if var_202_2 <= arg_199_1.time_ and arg_199_1.time_ < var_202_2 + var_202_12 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_2) / var_202_12

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_2 + var_202_12 and arg_199_1.time_ < var_202_2 + var_202_12 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play120112050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120112050
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play120112051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1075ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1075ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, 100, 0)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1075ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, 100, 0)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = "1071ui_story"

			if arg_203_1.actors_[var_206_9] == nil then
				local var_206_10 = Object.Instantiate(Asset.Load("Char/" .. var_206_9), arg_203_1.stage_.transform)

				var_206_10.name = var_206_9
				var_206_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_203_1.actors_[var_206_9] = var_206_10

				local var_206_11 = var_206_10:GetComponentInChildren(typeof(CharacterEffect))

				var_206_11.enabled = true

				local var_206_12 = GameObjectTools.GetOrAddComponent(var_206_10, typeof(DynamicBoneHelper))

				if var_206_12 then
					var_206_12:EnableDynamicBone(false)
				end

				arg_203_1:ShowWeapon(var_206_11.transform, false)

				arg_203_1.var_[var_206_9 .. "Animator"] = var_206_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_203_1.var_[var_206_9 .. "Animator"].applyRootMotion = true
				arg_203_1.var_[var_206_9 .. "LipSync"] = var_206_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_206_14 = 0
			local var_206_15 = 0.75

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_16 = arg_203_1:GetWordFromCfg(120112050)
				local var_206_17 = arg_203_1:FormatText(var_206_16.content)

				arg_203_1.text_.text = var_206_17

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_18 = 30
				local var_206_19 = utf8.len(var_206_17)
				local var_206_20 = var_206_18 <= 0 and var_206_15 or var_206_15 * (var_206_19 / var_206_18)

				if var_206_20 > 0 and var_206_15 < var_206_20 then
					arg_203_1.talkMaxDuration = var_206_20

					if var_206_20 + var_206_14 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_14
					end
				end

				arg_203_1.text_.text = var_206_17
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_21 = math.max(var_206_15, arg_203_1.talkMaxDuration)

			if var_206_14 <= arg_203_1.time_ and arg_203_1.time_ < var_206_14 + var_206_21 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_14) / var_206_21

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_14 + var_206_21 and arg_203_1.time_ < var_206_14 + var_206_21 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120112051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120112051
		arg_207_1.duration_ = 11.666

		local var_207_0 = {
			zh = 5.933,
			ja = 11.666
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
				arg_207_0:Play120112052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1071ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1071ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1071ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["10044ui_story"].transform
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1.var_.moveOldPos10044ui_story = var_210_9.localPosition
			end

			local var_210_11 = 0.001

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11
				local var_210_13 = Vector3.New(0.7, -0.72, -6.3)

				var_210_9.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10044ui_story, var_210_13, var_210_12)

				local var_210_14 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_14.x, var_210_14.y, var_210_14.z)

				local var_210_15 = var_210_9.localEulerAngles

				var_210_15.z = 0
				var_210_15.x = 0
				var_210_9.localEulerAngles = var_210_15
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 then
				var_210_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_210_16 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_16.x, var_210_16.y, var_210_16.z)

				local var_210_17 = var_210_9.localEulerAngles

				var_210_17.z = 0
				var_210_17.x = 0
				var_210_9.localEulerAngles = var_210_17
			end

			local var_210_18 = arg_207_1.actors_["1071ui_story"]
			local var_210_19 = 0

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 and arg_207_1.var_.characterEffect1071ui_story == nil then
				arg_207_1.var_.characterEffect1071ui_story = var_210_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_20 = 0.2

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_20 then
				local var_210_21 = (arg_207_1.time_ - var_210_19) / var_210_20

				if arg_207_1.var_.characterEffect1071ui_story then
					arg_207_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_19 + var_210_20 and arg_207_1.time_ < var_210_19 + var_210_20 + arg_210_0 and arg_207_1.var_.characterEffect1071ui_story then
				arg_207_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_210_22 = arg_207_1.actors_["10044ui_story"]
			local var_210_23 = 0

			if var_210_23 < arg_207_1.time_ and arg_207_1.time_ <= var_210_23 + arg_210_0 and arg_207_1.var_.characterEffect10044ui_story == nil then
				arg_207_1.var_.characterEffect10044ui_story = var_210_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_24 = 0.034

			if var_210_23 <= arg_207_1.time_ and arg_207_1.time_ < var_210_23 + var_210_24 then
				local var_210_25 = (arg_207_1.time_ - var_210_23) / var_210_24

				if arg_207_1.var_.characterEffect10044ui_story then
					local var_210_26 = Mathf.Lerp(0, 0.5, var_210_25)

					arg_207_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_207_1.var_.characterEffect10044ui_story.fillRatio = var_210_26
				end
			end

			if arg_207_1.time_ >= var_210_23 + var_210_24 and arg_207_1.time_ < var_210_23 + var_210_24 + arg_210_0 and arg_207_1.var_.characterEffect10044ui_story then
				local var_210_27 = 0.5

				arg_207_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_207_1.var_.characterEffect10044ui_story.fillRatio = var_210_27
			end

			local var_210_28 = 0

			if var_210_28 < arg_207_1.time_ and arg_207_1.time_ <= var_210_28 + arg_210_0 then
				arg_207_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action4_1")
			end

			local var_210_29 = 0

			if var_210_29 < arg_207_1.time_ and arg_207_1.time_ <= var_210_29 + arg_210_0 then
				arg_207_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_210_30 = 0

			if var_210_30 < arg_207_1.time_ and arg_207_1.time_ <= var_210_30 + arg_210_0 then
				arg_207_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_210_31 = 0
			local var_210_32 = 0.625

			if var_210_31 < arg_207_1.time_ and arg_207_1.time_ <= var_210_31 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_33 = arg_207_1:FormatText(StoryNameCfg[384].name)

				arg_207_1.leftNameTxt_.text = var_210_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_34 = arg_207_1:GetWordFromCfg(120112051)
				local var_210_35 = arg_207_1:FormatText(var_210_34.content)

				arg_207_1.text_.text = var_210_35

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_36 = 25
				local var_210_37 = utf8.len(var_210_35)
				local var_210_38 = var_210_36 <= 0 and var_210_32 or var_210_32 * (var_210_37 / var_210_36)

				if var_210_38 > 0 and var_210_32 < var_210_38 then
					arg_207_1.talkMaxDuration = var_210_38

					if var_210_38 + var_210_31 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_38 + var_210_31
					end
				end

				arg_207_1.text_.text = var_210_35
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112051", "story_v_out_120112.awb") ~= 0 then
					local var_210_39 = manager.audio:GetVoiceLength("story_v_out_120112", "120112051", "story_v_out_120112.awb") / 1000

					if var_210_39 + var_210_31 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_39 + var_210_31
					end

					if var_210_34.prefab_name ~= "" and arg_207_1.actors_[var_210_34.prefab_name] ~= nil then
						local var_210_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_34.prefab_name].transform, "story_v_out_120112", "120112051", "story_v_out_120112.awb")

						arg_207_1:RecordAudio("120112051", var_210_40)
						arg_207_1:RecordAudio("120112051", var_210_40)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_120112", "120112051", "story_v_out_120112.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_120112", "120112051", "story_v_out_120112.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_41 = math.max(var_210_32, arg_207_1.talkMaxDuration)

			if var_210_31 <= arg_207_1.time_ and arg_207_1.time_ < var_210_31 + var_210_41 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_31) / var_210_41

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_31 + var_210_41 and arg_207_1.time_ < var_210_31 + var_210_41 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play120112052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120112052
		arg_211_1.duration_ = 4.6

		local var_211_0 = {
			zh = 1.999999999999,
			ja = 4.6
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
				arg_211_0:Play120112053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1071ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1071ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1071ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["10044ui_story"].transform
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1.var_.moveOldPos10044ui_story = var_214_9.localPosition
			end

			local var_214_11 = 0.001

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11
				local var_214_13 = Vector3.New(0.7, -0.72, -6.3)

				var_214_9.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10044ui_story, var_214_13, var_214_12)

				local var_214_14 = manager.ui.mainCamera.transform.position - var_214_9.position

				var_214_9.forward = Vector3.New(var_214_14.x, var_214_14.y, var_214_14.z)

				local var_214_15 = var_214_9.localEulerAngles

				var_214_15.z = 0
				var_214_15.x = 0
				var_214_9.localEulerAngles = var_214_15
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 then
				var_214_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_214_16 = manager.ui.mainCamera.transform.position - var_214_9.position

				var_214_9.forward = Vector3.New(var_214_16.x, var_214_16.y, var_214_16.z)

				local var_214_17 = var_214_9.localEulerAngles

				var_214_17.z = 0
				var_214_17.x = 0
				var_214_9.localEulerAngles = var_214_17
			end

			local var_214_18 = arg_211_1.actors_["1071ui_story"]
			local var_214_19 = 0

			if var_214_19 < arg_211_1.time_ and arg_211_1.time_ <= var_214_19 + arg_214_0 and arg_211_1.var_.characterEffect1071ui_story == nil then
				arg_211_1.var_.characterEffect1071ui_story = var_214_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_20 = 0.2

			if var_214_19 <= arg_211_1.time_ and arg_211_1.time_ < var_214_19 + var_214_20 then
				local var_214_21 = (arg_211_1.time_ - var_214_19) / var_214_20

				if arg_211_1.var_.characterEffect1071ui_story then
					local var_214_22 = Mathf.Lerp(0, 0.5, var_214_21)

					arg_211_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1071ui_story.fillRatio = var_214_22
				end
			end

			if arg_211_1.time_ >= var_214_19 + var_214_20 and arg_211_1.time_ < var_214_19 + var_214_20 + arg_214_0 and arg_211_1.var_.characterEffect1071ui_story then
				local var_214_23 = 0.5

				arg_211_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1071ui_story.fillRatio = var_214_23
			end

			local var_214_24 = arg_211_1.actors_["10044ui_story"]
			local var_214_25 = 0

			if var_214_25 < arg_211_1.time_ and arg_211_1.time_ <= var_214_25 + arg_214_0 and arg_211_1.var_.characterEffect10044ui_story == nil then
				arg_211_1.var_.characterEffect10044ui_story = var_214_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_26 = 0.2

			if var_214_25 <= arg_211_1.time_ and arg_211_1.time_ < var_214_25 + var_214_26 then
				local var_214_27 = (arg_211_1.time_ - var_214_25) / var_214_26

				if arg_211_1.var_.characterEffect10044ui_story then
					arg_211_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_25 + var_214_26 and arg_211_1.time_ < var_214_25 + var_214_26 + arg_214_0 and arg_211_1.var_.characterEffect10044ui_story then
				arg_211_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_214_28 = 0

			if var_214_28 < arg_211_1.time_ and arg_211_1.time_ <= var_214_28 + arg_214_0 then
				arg_211_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action6_1")
			end

			local var_214_29 = 0

			if var_214_29 < arg_211_1.time_ and arg_211_1.time_ <= var_214_29 + arg_214_0 then
				arg_211_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_214_30 = 0
			local var_214_31 = 0.075

			if var_214_30 < arg_211_1.time_ and arg_211_1.time_ <= var_214_30 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_32 = arg_211_1:FormatText(StoryNameCfg[387].name)

				arg_211_1.leftNameTxt_.text = var_214_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_33 = arg_211_1:GetWordFromCfg(120112052)
				local var_214_34 = arg_211_1:FormatText(var_214_33.content)

				arg_211_1.text_.text = var_214_34

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_35 = 3
				local var_214_36 = utf8.len(var_214_34)
				local var_214_37 = var_214_35 <= 0 and var_214_31 or var_214_31 * (var_214_36 / var_214_35)

				if var_214_37 > 0 and var_214_31 < var_214_37 then
					arg_211_1.talkMaxDuration = var_214_37

					if var_214_37 + var_214_30 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_37 + var_214_30
					end
				end

				arg_211_1.text_.text = var_214_34
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112052", "story_v_out_120112.awb") ~= 0 then
					local var_214_38 = manager.audio:GetVoiceLength("story_v_out_120112", "120112052", "story_v_out_120112.awb") / 1000

					if var_214_38 + var_214_30 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_38 + var_214_30
					end

					if var_214_33.prefab_name ~= "" and arg_211_1.actors_[var_214_33.prefab_name] ~= nil then
						local var_214_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_33.prefab_name].transform, "story_v_out_120112", "120112052", "story_v_out_120112.awb")

						arg_211_1:RecordAudio("120112052", var_214_39)
						arg_211_1:RecordAudio("120112052", var_214_39)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_120112", "120112052", "story_v_out_120112.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_120112", "120112052", "story_v_out_120112.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_40 = math.max(var_214_31, arg_211_1.talkMaxDuration)

			if var_214_30 <= arg_211_1.time_ and arg_211_1.time_ < var_214_30 + var_214_40 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_30) / var_214_40

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_30 + var_214_40 and arg_211_1.time_ < var_214_30 + var_214_40 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play120112053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120112053
		arg_215_1.duration_ = 3.233

		local var_215_0 = {
			zh = 2.033,
			ja = 3.233
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
				arg_215_0:Play120112054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1071ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1071ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1071ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["10044ui_story"].transform
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1.var_.moveOldPos10044ui_story = var_218_9.localPosition
			end

			local var_218_11 = 0.001

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11
				local var_218_13 = Vector3.New(0.7, -0.72, -6.3)

				var_218_9.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos10044ui_story, var_218_13, var_218_12)

				local var_218_14 = manager.ui.mainCamera.transform.position - var_218_9.position

				var_218_9.forward = Vector3.New(var_218_14.x, var_218_14.y, var_218_14.z)

				local var_218_15 = var_218_9.localEulerAngles

				var_218_15.z = 0
				var_218_15.x = 0
				var_218_9.localEulerAngles = var_218_15
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 then
				var_218_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_218_16 = manager.ui.mainCamera.transform.position - var_218_9.position

				var_218_9.forward = Vector3.New(var_218_16.x, var_218_16.y, var_218_16.z)

				local var_218_17 = var_218_9.localEulerAngles

				var_218_17.z = 0
				var_218_17.x = 0
				var_218_9.localEulerAngles = var_218_17
			end

			local var_218_18 = arg_215_1.actors_["1071ui_story"]
			local var_218_19 = 0

			if var_218_19 < arg_215_1.time_ and arg_215_1.time_ <= var_218_19 + arg_218_0 and arg_215_1.var_.characterEffect1071ui_story == nil then
				arg_215_1.var_.characterEffect1071ui_story = var_218_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_20 = 0.2

			if var_218_19 <= arg_215_1.time_ and arg_215_1.time_ < var_218_19 + var_218_20 then
				local var_218_21 = (arg_215_1.time_ - var_218_19) / var_218_20

				if arg_215_1.var_.characterEffect1071ui_story then
					arg_215_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_19 + var_218_20 and arg_215_1.time_ < var_218_19 + var_218_20 + arg_218_0 and arg_215_1.var_.characterEffect1071ui_story then
				arg_215_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_218_22 = arg_215_1.actors_["10044ui_story"]
			local var_218_23 = 0

			if var_218_23 < arg_215_1.time_ and arg_215_1.time_ <= var_218_23 + arg_218_0 and arg_215_1.var_.characterEffect10044ui_story == nil then
				arg_215_1.var_.characterEffect10044ui_story = var_218_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_24 = 0.2

			if var_218_23 <= arg_215_1.time_ and arg_215_1.time_ < var_218_23 + var_218_24 then
				local var_218_25 = (arg_215_1.time_ - var_218_23) / var_218_24

				if arg_215_1.var_.characterEffect10044ui_story then
					local var_218_26 = Mathf.Lerp(0, 0.5, var_218_25)

					arg_215_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_215_1.var_.characterEffect10044ui_story.fillRatio = var_218_26
				end
			end

			if arg_215_1.time_ >= var_218_23 + var_218_24 and arg_215_1.time_ < var_218_23 + var_218_24 + arg_218_0 and arg_215_1.var_.characterEffect10044ui_story then
				local var_218_27 = 0.5

				arg_215_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_215_1.var_.characterEffect10044ui_story.fillRatio = var_218_27
			end

			local var_218_28 = 0
			local var_218_29 = 0.25

			if var_218_28 < arg_215_1.time_ and arg_215_1.time_ <= var_218_28 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_30 = arg_215_1:FormatText(StoryNameCfg[384].name)

				arg_215_1.leftNameTxt_.text = var_218_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_31 = arg_215_1:GetWordFromCfg(120112053)
				local var_218_32 = arg_215_1:FormatText(var_218_31.content)

				arg_215_1.text_.text = var_218_32

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_33 = 10
				local var_218_34 = utf8.len(var_218_32)
				local var_218_35 = var_218_33 <= 0 and var_218_29 or var_218_29 * (var_218_34 / var_218_33)

				if var_218_35 > 0 and var_218_29 < var_218_35 then
					arg_215_1.talkMaxDuration = var_218_35

					if var_218_35 + var_218_28 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_35 + var_218_28
					end
				end

				arg_215_1.text_.text = var_218_32
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112053", "story_v_out_120112.awb") ~= 0 then
					local var_218_36 = manager.audio:GetVoiceLength("story_v_out_120112", "120112053", "story_v_out_120112.awb") / 1000

					if var_218_36 + var_218_28 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_36 + var_218_28
					end

					if var_218_31.prefab_name ~= "" and arg_215_1.actors_[var_218_31.prefab_name] ~= nil then
						local var_218_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_31.prefab_name].transform, "story_v_out_120112", "120112053", "story_v_out_120112.awb")

						arg_215_1:RecordAudio("120112053", var_218_37)
						arg_215_1:RecordAudio("120112053", var_218_37)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_120112", "120112053", "story_v_out_120112.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_120112", "120112053", "story_v_out_120112.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_38 = math.max(var_218_29, arg_215_1.talkMaxDuration)

			if var_218_28 <= arg_215_1.time_ and arg_215_1.time_ < var_218_28 + var_218_38 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_28) / var_218_38

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_28 + var_218_38 and arg_215_1.time_ < var_218_28 + var_218_38 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play120112054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120112054
		arg_219_1.duration_ = 7.333

		local var_219_0 = {
			zh = 7.333,
			ja = 5.433
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
				arg_219_0:Play120112055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.85

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[384].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(120112054)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112054", "story_v_out_120112.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112054", "story_v_out_120112.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_120112", "120112054", "story_v_out_120112.awb")

						arg_219_1:RecordAudio("120112054", var_222_9)
						arg_219_1:RecordAudio("120112054", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_120112", "120112054", "story_v_out_120112.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_120112", "120112054", "story_v_out_120112.awb")
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
	Play120112055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 120112055
		arg_223_1.duration_ = 11.7

		local var_223_0 = {
			zh = 11.7,
			ja = 8.766
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
				arg_223_0:Play120112056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action4_2")
			end

			local var_226_1 = 0
			local var_226_2 = 1.3

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_3 = arg_223_1:FormatText(StoryNameCfg[384].name)

				arg_223_1.leftNameTxt_.text = var_226_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_4 = arg_223_1:GetWordFromCfg(120112055)
				local var_226_5 = arg_223_1:FormatText(var_226_4.content)

				arg_223_1.text_.text = var_226_5

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_6 = 52
				local var_226_7 = utf8.len(var_226_5)
				local var_226_8 = var_226_6 <= 0 and var_226_2 or var_226_2 * (var_226_7 / var_226_6)

				if var_226_8 > 0 and var_226_2 < var_226_8 then
					arg_223_1.talkMaxDuration = var_226_8

					if var_226_8 + var_226_1 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_1
					end
				end

				arg_223_1.text_.text = var_226_5
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112055", "story_v_out_120112.awb") ~= 0 then
					local var_226_9 = manager.audio:GetVoiceLength("story_v_out_120112", "120112055", "story_v_out_120112.awb") / 1000

					if var_226_9 + var_226_1 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_9 + var_226_1
					end

					if var_226_4.prefab_name ~= "" and arg_223_1.actors_[var_226_4.prefab_name] ~= nil then
						local var_226_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_4.prefab_name].transform, "story_v_out_120112", "120112055", "story_v_out_120112.awb")

						arg_223_1:RecordAudio("120112055", var_226_10)
						arg_223_1:RecordAudio("120112055", var_226_10)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_120112", "120112055", "story_v_out_120112.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_120112", "120112055", "story_v_out_120112.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_11 = math.max(var_226_2, arg_223_1.talkMaxDuration)

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_11 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_1) / var_226_11

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_1 + var_226_11 and arg_223_1.time_ < var_226_1 + var_226_11 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play120112056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 120112056
		arg_227_1.duration_ = 10.166

		local var_227_0 = {
			zh = 5.066,
			ja = 10.166
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
				arg_227_0:Play120112057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.65

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[384].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(120112056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112056", "story_v_out_120112.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112056", "story_v_out_120112.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_120112", "120112056", "story_v_out_120112.awb")

						arg_227_1:RecordAudio("120112056", var_230_9)
						arg_227_1:RecordAudio("120112056", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_120112", "120112056", "story_v_out_120112.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_120112", "120112056", "story_v_out_120112.awb")
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
	Play120112057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 120112057
		arg_231_1.duration_ = 1.999999999999

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play120112058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1071ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1071ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1071ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["10044ui_story"].transform
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1.var_.moveOldPos10044ui_story = var_234_9.localPosition
			end

			local var_234_11 = 0.001

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11
				local var_234_13 = Vector3.New(0.7, -0.72, -6.3)

				var_234_9.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos10044ui_story, var_234_13, var_234_12)

				local var_234_14 = manager.ui.mainCamera.transform.position - var_234_9.position

				var_234_9.forward = Vector3.New(var_234_14.x, var_234_14.y, var_234_14.z)

				local var_234_15 = var_234_9.localEulerAngles

				var_234_15.z = 0
				var_234_15.x = 0
				var_234_9.localEulerAngles = var_234_15
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 then
				var_234_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_234_16 = manager.ui.mainCamera.transform.position - var_234_9.position

				var_234_9.forward = Vector3.New(var_234_16.x, var_234_16.y, var_234_16.z)

				local var_234_17 = var_234_9.localEulerAngles

				var_234_17.z = 0
				var_234_17.x = 0
				var_234_9.localEulerAngles = var_234_17
			end

			local var_234_18 = arg_231_1.actors_["1071ui_story"]
			local var_234_19 = 0

			if var_234_19 < arg_231_1.time_ and arg_231_1.time_ <= var_234_19 + arg_234_0 and arg_231_1.var_.characterEffect1071ui_story == nil then
				arg_231_1.var_.characterEffect1071ui_story = var_234_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_20 = 0.2

			if var_234_19 <= arg_231_1.time_ and arg_231_1.time_ < var_234_19 + var_234_20 then
				local var_234_21 = (arg_231_1.time_ - var_234_19) / var_234_20

				if arg_231_1.var_.characterEffect1071ui_story then
					local var_234_22 = Mathf.Lerp(0, 0.5, var_234_21)

					arg_231_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1071ui_story.fillRatio = var_234_22
				end
			end

			if arg_231_1.time_ >= var_234_19 + var_234_20 and arg_231_1.time_ < var_234_19 + var_234_20 + arg_234_0 and arg_231_1.var_.characterEffect1071ui_story then
				local var_234_23 = 0.5

				arg_231_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1071ui_story.fillRatio = var_234_23
			end

			local var_234_24 = arg_231_1.actors_["10044ui_story"]
			local var_234_25 = 0

			if var_234_25 < arg_231_1.time_ and arg_231_1.time_ <= var_234_25 + arg_234_0 and arg_231_1.var_.characterEffect10044ui_story == nil then
				arg_231_1.var_.characterEffect10044ui_story = var_234_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_26 = 0.2

			if var_234_25 <= arg_231_1.time_ and arg_231_1.time_ < var_234_25 + var_234_26 then
				local var_234_27 = (arg_231_1.time_ - var_234_25) / var_234_26

				if arg_231_1.var_.characterEffect10044ui_story then
					arg_231_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_25 + var_234_26 and arg_231_1.time_ < var_234_25 + var_234_26 + arg_234_0 and arg_231_1.var_.characterEffect10044ui_story then
				arg_231_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_234_28 = 0

			if var_234_28 < arg_231_1.time_ and arg_231_1.time_ <= var_234_28 + arg_234_0 then
				arg_231_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_234_29 = 0
			local var_234_30 = 0.05

			if var_234_29 < arg_231_1.time_ and arg_231_1.time_ <= var_234_29 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_31 = arg_231_1:FormatText(StoryNameCfg[387].name)

				arg_231_1.leftNameTxt_.text = var_234_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_32 = arg_231_1:GetWordFromCfg(120112057)
				local var_234_33 = arg_231_1:FormatText(var_234_32.content)

				arg_231_1.text_.text = var_234_33

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_34 = 2
				local var_234_35 = utf8.len(var_234_33)
				local var_234_36 = var_234_34 <= 0 and var_234_30 or var_234_30 * (var_234_35 / var_234_34)

				if var_234_36 > 0 and var_234_30 < var_234_36 then
					arg_231_1.talkMaxDuration = var_234_36

					if var_234_36 + var_234_29 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_36 + var_234_29
					end
				end

				arg_231_1.text_.text = var_234_33
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112057", "story_v_out_120112.awb") ~= 0 then
					local var_234_37 = manager.audio:GetVoiceLength("story_v_out_120112", "120112057", "story_v_out_120112.awb") / 1000

					if var_234_37 + var_234_29 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_37 + var_234_29
					end

					if var_234_32.prefab_name ~= "" and arg_231_1.actors_[var_234_32.prefab_name] ~= nil then
						local var_234_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_32.prefab_name].transform, "story_v_out_120112", "120112057", "story_v_out_120112.awb")

						arg_231_1:RecordAudio("120112057", var_234_38)
						arg_231_1:RecordAudio("120112057", var_234_38)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_120112", "120112057", "story_v_out_120112.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_120112", "120112057", "story_v_out_120112.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_39 = math.max(var_234_30, arg_231_1.talkMaxDuration)

			if var_234_29 <= arg_231_1.time_ and arg_231_1.time_ < var_234_29 + var_234_39 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_29) / var_234_39

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_29 + var_234_39 and arg_231_1.time_ < var_234_29 + var_234_39 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play120112058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 120112058
		arg_235_1.duration_ = 3.7

		local var_235_0 = {
			zh = 3.433,
			ja = 3.7
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
				arg_235_0:Play120112059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1071ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1071ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1071ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["10044ui_story"].transform
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 then
				arg_235_1.var_.moveOldPos10044ui_story = var_238_9.localPosition
			end

			local var_238_11 = 0.001

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11
				local var_238_13 = Vector3.New(0.7, -0.72, -6.3)

				var_238_9.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10044ui_story, var_238_13, var_238_12)

				local var_238_14 = manager.ui.mainCamera.transform.position - var_238_9.position

				var_238_9.forward = Vector3.New(var_238_14.x, var_238_14.y, var_238_14.z)

				local var_238_15 = var_238_9.localEulerAngles

				var_238_15.z = 0
				var_238_15.x = 0
				var_238_9.localEulerAngles = var_238_15
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 then
				var_238_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_238_16 = manager.ui.mainCamera.transform.position - var_238_9.position

				var_238_9.forward = Vector3.New(var_238_16.x, var_238_16.y, var_238_16.z)

				local var_238_17 = var_238_9.localEulerAngles

				var_238_17.z = 0
				var_238_17.x = 0
				var_238_9.localEulerAngles = var_238_17
			end

			local var_238_18 = arg_235_1.actors_["1071ui_story"]
			local var_238_19 = 0

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 and arg_235_1.var_.characterEffect1071ui_story == nil then
				arg_235_1.var_.characterEffect1071ui_story = var_238_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_20 = 0.2

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_20 then
				local var_238_21 = (arg_235_1.time_ - var_238_19) / var_238_20

				if arg_235_1.var_.characterEffect1071ui_story then
					arg_235_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_19 + var_238_20 and arg_235_1.time_ < var_238_19 + var_238_20 + arg_238_0 and arg_235_1.var_.characterEffect1071ui_story then
				arg_235_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_238_22 = arg_235_1.actors_["10044ui_story"]
			local var_238_23 = 0

			if var_238_23 < arg_235_1.time_ and arg_235_1.time_ <= var_238_23 + arg_238_0 and arg_235_1.var_.characterEffect10044ui_story == nil then
				arg_235_1.var_.characterEffect10044ui_story = var_238_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_24 = 0.2

			if var_238_23 <= arg_235_1.time_ and arg_235_1.time_ < var_238_23 + var_238_24 then
				local var_238_25 = (arg_235_1.time_ - var_238_23) / var_238_24

				if arg_235_1.var_.characterEffect10044ui_story then
					local var_238_26 = Mathf.Lerp(0, 0.5, var_238_25)

					arg_235_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_235_1.var_.characterEffect10044ui_story.fillRatio = var_238_26
				end
			end

			if arg_235_1.time_ >= var_238_23 + var_238_24 and arg_235_1.time_ < var_238_23 + var_238_24 + arg_238_0 and arg_235_1.var_.characterEffect10044ui_story then
				local var_238_27 = 0.5

				arg_235_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_235_1.var_.characterEffect10044ui_story.fillRatio = var_238_27
			end

			local var_238_28 = 0
			local var_238_29 = 0.275

			if var_238_28 < arg_235_1.time_ and arg_235_1.time_ <= var_238_28 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_30 = arg_235_1:FormatText(StoryNameCfg[384].name)

				arg_235_1.leftNameTxt_.text = var_238_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_31 = arg_235_1:GetWordFromCfg(120112058)
				local var_238_32 = arg_235_1:FormatText(var_238_31.content)

				arg_235_1.text_.text = var_238_32

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_33 = 11
				local var_238_34 = utf8.len(var_238_32)
				local var_238_35 = var_238_33 <= 0 and var_238_29 or var_238_29 * (var_238_34 / var_238_33)

				if var_238_35 > 0 and var_238_29 < var_238_35 then
					arg_235_1.talkMaxDuration = var_238_35

					if var_238_35 + var_238_28 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_35 + var_238_28
					end
				end

				arg_235_1.text_.text = var_238_32
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112058", "story_v_out_120112.awb") ~= 0 then
					local var_238_36 = manager.audio:GetVoiceLength("story_v_out_120112", "120112058", "story_v_out_120112.awb") / 1000

					if var_238_36 + var_238_28 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_36 + var_238_28
					end

					if var_238_31.prefab_name ~= "" and arg_235_1.actors_[var_238_31.prefab_name] ~= nil then
						local var_238_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_31.prefab_name].transform, "story_v_out_120112", "120112058", "story_v_out_120112.awb")

						arg_235_1:RecordAudio("120112058", var_238_37)
						arg_235_1:RecordAudio("120112058", var_238_37)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_120112", "120112058", "story_v_out_120112.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_120112", "120112058", "story_v_out_120112.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_38 = math.max(var_238_29, arg_235_1.talkMaxDuration)

			if var_238_28 <= arg_235_1.time_ and arg_235_1.time_ < var_238_28 + var_238_38 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_28) / var_238_38

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_28 + var_238_38 and arg_235_1.time_ < var_238_28 + var_238_38 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play120112059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 120112059
		arg_239_1.duration_ = 12.1

		local var_239_0 = {
			zh = 8.7,
			ja = 12.1
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
				arg_239_0:Play120112060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_242_1 = 0
			local var_242_2 = 1.125

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_3 = arg_239_1:FormatText(StoryNameCfg[384].name)

				arg_239_1.leftNameTxt_.text = var_242_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_4 = arg_239_1:GetWordFromCfg(120112059)
				local var_242_5 = arg_239_1:FormatText(var_242_4.content)

				arg_239_1.text_.text = var_242_5

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_6 = 45
				local var_242_7 = utf8.len(var_242_5)
				local var_242_8 = var_242_6 <= 0 and var_242_2 or var_242_2 * (var_242_7 / var_242_6)

				if var_242_8 > 0 and var_242_2 < var_242_8 then
					arg_239_1.talkMaxDuration = var_242_8

					if var_242_8 + var_242_1 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_1
					end
				end

				arg_239_1.text_.text = var_242_5
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112059", "story_v_out_120112.awb") ~= 0 then
					local var_242_9 = manager.audio:GetVoiceLength("story_v_out_120112", "120112059", "story_v_out_120112.awb") / 1000

					if var_242_9 + var_242_1 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_9 + var_242_1
					end

					if var_242_4.prefab_name ~= "" and arg_239_1.actors_[var_242_4.prefab_name] ~= nil then
						local var_242_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_4.prefab_name].transform, "story_v_out_120112", "120112059", "story_v_out_120112.awb")

						arg_239_1:RecordAudio("120112059", var_242_10)
						arg_239_1:RecordAudio("120112059", var_242_10)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_120112", "120112059", "story_v_out_120112.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_120112", "120112059", "story_v_out_120112.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_11 = math.max(var_242_2, arg_239_1.talkMaxDuration)

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_11 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_1) / var_242_11

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_1 + var_242_11 and arg_239_1.time_ < var_242_1 + var_242_11 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play120112060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 120112060
		arg_243_1.duration_ = 6.133

		local var_243_0 = {
			zh = 2.6,
			ja = 6.133
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
				arg_243_0:Play120112061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1071ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1071ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1071ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["10044ui_story"].transform
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1.var_.moveOldPos10044ui_story = var_246_9.localPosition
			end

			local var_246_11 = 0.001

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11
				local var_246_13 = Vector3.New(0.7, -0.72, -6.3)

				var_246_9.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos10044ui_story, var_246_13, var_246_12)

				local var_246_14 = manager.ui.mainCamera.transform.position - var_246_9.position

				var_246_9.forward = Vector3.New(var_246_14.x, var_246_14.y, var_246_14.z)

				local var_246_15 = var_246_9.localEulerAngles

				var_246_15.z = 0
				var_246_15.x = 0
				var_246_9.localEulerAngles = var_246_15
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 then
				var_246_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_246_16 = manager.ui.mainCamera.transform.position - var_246_9.position

				var_246_9.forward = Vector3.New(var_246_16.x, var_246_16.y, var_246_16.z)

				local var_246_17 = var_246_9.localEulerAngles

				var_246_17.z = 0
				var_246_17.x = 0
				var_246_9.localEulerAngles = var_246_17
			end

			local var_246_18 = arg_243_1.actors_["1071ui_story"]
			local var_246_19 = 0

			if var_246_19 < arg_243_1.time_ and arg_243_1.time_ <= var_246_19 + arg_246_0 and arg_243_1.var_.characterEffect1071ui_story == nil then
				arg_243_1.var_.characterEffect1071ui_story = var_246_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_20 = 0.2

			if var_246_19 <= arg_243_1.time_ and arg_243_1.time_ < var_246_19 + var_246_20 then
				local var_246_21 = (arg_243_1.time_ - var_246_19) / var_246_20

				if arg_243_1.var_.characterEffect1071ui_story then
					local var_246_22 = Mathf.Lerp(0, 0.5, var_246_21)

					arg_243_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1071ui_story.fillRatio = var_246_22
				end
			end

			if arg_243_1.time_ >= var_246_19 + var_246_20 and arg_243_1.time_ < var_246_19 + var_246_20 + arg_246_0 and arg_243_1.var_.characterEffect1071ui_story then
				local var_246_23 = 0.5

				arg_243_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1071ui_story.fillRatio = var_246_23
			end

			local var_246_24 = arg_243_1.actors_["10044ui_story"]
			local var_246_25 = 0

			if var_246_25 < arg_243_1.time_ and arg_243_1.time_ <= var_246_25 + arg_246_0 and arg_243_1.var_.characterEffect10044ui_story == nil then
				arg_243_1.var_.characterEffect10044ui_story = var_246_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_26 = 0.2

			if var_246_25 <= arg_243_1.time_ and arg_243_1.time_ < var_246_25 + var_246_26 then
				local var_246_27 = (arg_243_1.time_ - var_246_25) / var_246_26

				if arg_243_1.var_.characterEffect10044ui_story then
					arg_243_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_25 + var_246_26 and arg_243_1.time_ < var_246_25 + var_246_26 + arg_246_0 and arg_243_1.var_.characterEffect10044ui_story then
				arg_243_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_246_28 = 0

			if var_246_28 < arg_243_1.time_ and arg_243_1.time_ <= var_246_28 + arg_246_0 then
				arg_243_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action6_2")
			end

			local var_246_29 = 0

			if var_246_29 < arg_243_1.time_ and arg_243_1.time_ <= var_246_29 + arg_246_0 then
				arg_243_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_246_30 = 0
			local var_246_31 = 0.15

			if var_246_30 < arg_243_1.time_ and arg_243_1.time_ <= var_246_30 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_32 = arg_243_1:FormatText(StoryNameCfg[387].name)

				arg_243_1.leftNameTxt_.text = var_246_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_33 = arg_243_1:GetWordFromCfg(120112060)
				local var_246_34 = arg_243_1:FormatText(var_246_33.content)

				arg_243_1.text_.text = var_246_34

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_35 = 6
				local var_246_36 = utf8.len(var_246_34)
				local var_246_37 = var_246_35 <= 0 and var_246_31 or var_246_31 * (var_246_36 / var_246_35)

				if var_246_37 > 0 and var_246_31 < var_246_37 then
					arg_243_1.talkMaxDuration = var_246_37

					if var_246_37 + var_246_30 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_37 + var_246_30
					end
				end

				arg_243_1.text_.text = var_246_34
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112060", "story_v_out_120112.awb") ~= 0 then
					local var_246_38 = manager.audio:GetVoiceLength("story_v_out_120112", "120112060", "story_v_out_120112.awb") / 1000

					if var_246_38 + var_246_30 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_38 + var_246_30
					end

					if var_246_33.prefab_name ~= "" and arg_243_1.actors_[var_246_33.prefab_name] ~= nil then
						local var_246_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_33.prefab_name].transform, "story_v_out_120112", "120112060", "story_v_out_120112.awb")

						arg_243_1:RecordAudio("120112060", var_246_39)
						arg_243_1:RecordAudio("120112060", var_246_39)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_120112", "120112060", "story_v_out_120112.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_120112", "120112060", "story_v_out_120112.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_40 = math.max(var_246_31, arg_243_1.talkMaxDuration)

			if var_246_30 <= arg_243_1.time_ and arg_243_1.time_ < var_246_30 + var_246_40 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_30) / var_246_40

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_30 + var_246_40 and arg_243_1.time_ < var_246_30 + var_246_40 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play120112061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 120112061
		arg_247_1.duration_ = 8.933

		local var_247_0 = {
			zh = 5.6,
			ja = 8.933
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
				arg_247_0:Play120112062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1071ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1071ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1071ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = arg_247_1.actors_["10044ui_story"].transform
			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1.var_.moveOldPos10044ui_story = var_250_9.localPosition
			end

			local var_250_11 = 0.001

			if var_250_10 <= arg_247_1.time_ and arg_247_1.time_ < var_250_10 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_10) / var_250_11
				local var_250_13 = Vector3.New(0.7, -0.72, -6.3)

				var_250_9.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10044ui_story, var_250_13, var_250_12)

				local var_250_14 = manager.ui.mainCamera.transform.position - var_250_9.position

				var_250_9.forward = Vector3.New(var_250_14.x, var_250_14.y, var_250_14.z)

				local var_250_15 = var_250_9.localEulerAngles

				var_250_15.z = 0
				var_250_15.x = 0
				var_250_9.localEulerAngles = var_250_15
			end

			if arg_247_1.time_ >= var_250_10 + var_250_11 and arg_247_1.time_ < var_250_10 + var_250_11 + arg_250_0 then
				var_250_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_250_16 = manager.ui.mainCamera.transform.position - var_250_9.position

				var_250_9.forward = Vector3.New(var_250_16.x, var_250_16.y, var_250_16.z)

				local var_250_17 = var_250_9.localEulerAngles

				var_250_17.z = 0
				var_250_17.x = 0
				var_250_9.localEulerAngles = var_250_17
			end

			local var_250_18 = arg_247_1.actors_["1071ui_story"]
			local var_250_19 = 0

			if var_250_19 < arg_247_1.time_ and arg_247_1.time_ <= var_250_19 + arg_250_0 and arg_247_1.var_.characterEffect1071ui_story == nil then
				arg_247_1.var_.characterEffect1071ui_story = var_250_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_20 = 0.2

			if var_250_19 <= arg_247_1.time_ and arg_247_1.time_ < var_250_19 + var_250_20 then
				local var_250_21 = (arg_247_1.time_ - var_250_19) / var_250_20

				if arg_247_1.var_.characterEffect1071ui_story then
					arg_247_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_19 + var_250_20 and arg_247_1.time_ < var_250_19 + var_250_20 + arg_250_0 and arg_247_1.var_.characterEffect1071ui_story then
				arg_247_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_250_22 = arg_247_1.actors_["10044ui_story"]
			local var_250_23 = 0

			if var_250_23 < arg_247_1.time_ and arg_247_1.time_ <= var_250_23 + arg_250_0 and arg_247_1.var_.characterEffect10044ui_story == nil then
				arg_247_1.var_.characterEffect10044ui_story = var_250_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_24 = 0.2

			if var_250_23 <= arg_247_1.time_ and arg_247_1.time_ < var_250_23 + var_250_24 then
				local var_250_25 = (arg_247_1.time_ - var_250_23) / var_250_24

				if arg_247_1.var_.characterEffect10044ui_story then
					local var_250_26 = Mathf.Lerp(0, 0.5, var_250_25)

					arg_247_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_247_1.var_.characterEffect10044ui_story.fillRatio = var_250_26
				end
			end

			if arg_247_1.time_ >= var_250_23 + var_250_24 and arg_247_1.time_ < var_250_23 + var_250_24 + arg_250_0 and arg_247_1.var_.characterEffect10044ui_story then
				local var_250_27 = 0.5

				arg_247_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_247_1.var_.characterEffect10044ui_story.fillRatio = var_250_27
			end

			local var_250_28 = 0

			if var_250_28 < arg_247_1.time_ and arg_247_1.time_ <= var_250_28 + arg_250_0 then
				arg_247_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action423")
			end

			local var_250_29 = 0

			if var_250_29 < arg_247_1.time_ and arg_247_1.time_ <= var_250_29 + arg_250_0 then
				arg_247_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_250_30 = 0
			local var_250_31 = 0.575

			if var_250_30 < arg_247_1.time_ and arg_247_1.time_ <= var_250_30 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_32 = arg_247_1:FormatText(StoryNameCfg[384].name)

				arg_247_1.leftNameTxt_.text = var_250_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_33 = arg_247_1:GetWordFromCfg(120112061)
				local var_250_34 = arg_247_1:FormatText(var_250_33.content)

				arg_247_1.text_.text = var_250_34

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_35 = 23
				local var_250_36 = utf8.len(var_250_34)
				local var_250_37 = var_250_35 <= 0 and var_250_31 or var_250_31 * (var_250_36 / var_250_35)

				if var_250_37 > 0 and var_250_31 < var_250_37 then
					arg_247_1.talkMaxDuration = var_250_37

					if var_250_37 + var_250_30 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_37 + var_250_30
					end
				end

				arg_247_1.text_.text = var_250_34
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112061", "story_v_out_120112.awb") ~= 0 then
					local var_250_38 = manager.audio:GetVoiceLength("story_v_out_120112", "120112061", "story_v_out_120112.awb") / 1000

					if var_250_38 + var_250_30 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_38 + var_250_30
					end

					if var_250_33.prefab_name ~= "" and arg_247_1.actors_[var_250_33.prefab_name] ~= nil then
						local var_250_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_33.prefab_name].transform, "story_v_out_120112", "120112061", "story_v_out_120112.awb")

						arg_247_1:RecordAudio("120112061", var_250_39)
						arg_247_1:RecordAudio("120112061", var_250_39)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_120112", "120112061", "story_v_out_120112.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_120112", "120112061", "story_v_out_120112.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_40 = math.max(var_250_31, arg_247_1.talkMaxDuration)

			if var_250_30 <= arg_247_1.time_ and arg_247_1.time_ < var_250_30 + var_250_40 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_30) / var_250_40

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_30 + var_250_40 and arg_247_1.time_ < var_250_30 + var_250_40 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play120112062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120112062
		arg_251_1.duration_ = 6.433

		local var_251_0 = {
			zh = 6.433,
			ja = 2.5
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
				arg_251_0:Play120112063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.65

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[384].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(120112062)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112062", "story_v_out_120112.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112062", "story_v_out_120112.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_120112", "120112062", "story_v_out_120112.awb")

						arg_251_1:RecordAudio("120112062", var_254_9)
						arg_251_1:RecordAudio("120112062", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_120112", "120112062", "story_v_out_120112.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_120112", "120112062", "story_v_out_120112.awb")
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
	Play120112063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120112063
		arg_255_1.duration_ = 5.033

		local var_255_0 = {
			zh = 4.7,
			ja = 5.033
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
				arg_255_0:Play120112064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1071ui_story"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1071ui_story = var_258_0.localPosition
			end

			local var_258_2 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2
				local var_258_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1071ui_story, var_258_4, var_258_3)

				local var_258_5 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_5.x, var_258_5.y, var_258_5.z)

				local var_258_6 = var_258_0.localEulerAngles

				var_258_6.z = 0
				var_258_6.x = 0
				var_258_0.localEulerAngles = var_258_6
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_258_7 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_7.x, var_258_7.y, var_258_7.z)

				local var_258_8 = var_258_0.localEulerAngles

				var_258_8.z = 0
				var_258_8.x = 0
				var_258_0.localEulerAngles = var_258_8
			end

			local var_258_9 = arg_255_1.actors_["10044ui_story"].transform
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.var_.moveOldPos10044ui_story = var_258_9.localPosition
			end

			local var_258_11 = 0.001

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_10) / var_258_11
				local var_258_13 = Vector3.New(0.7, -0.72, -6.3)

				var_258_9.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10044ui_story, var_258_13, var_258_12)

				local var_258_14 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_14.x, var_258_14.y, var_258_14.z)

				local var_258_15 = var_258_9.localEulerAngles

				var_258_15.z = 0
				var_258_15.x = 0
				var_258_9.localEulerAngles = var_258_15
			end

			if arg_255_1.time_ >= var_258_10 + var_258_11 and arg_255_1.time_ < var_258_10 + var_258_11 + arg_258_0 then
				var_258_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_258_16 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_16.x, var_258_16.y, var_258_16.z)

				local var_258_17 = var_258_9.localEulerAngles

				var_258_17.z = 0
				var_258_17.x = 0
				var_258_9.localEulerAngles = var_258_17
			end

			local var_258_18 = arg_255_1.actors_["1071ui_story"]
			local var_258_19 = 0

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 and arg_255_1.var_.characterEffect1071ui_story == nil then
				arg_255_1.var_.characterEffect1071ui_story = var_258_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_20 = 0.2

			if var_258_19 <= arg_255_1.time_ and arg_255_1.time_ < var_258_19 + var_258_20 then
				local var_258_21 = (arg_255_1.time_ - var_258_19) / var_258_20

				if arg_255_1.var_.characterEffect1071ui_story then
					local var_258_22 = Mathf.Lerp(0, 0.5, var_258_21)

					arg_255_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1071ui_story.fillRatio = var_258_22
				end
			end

			if arg_255_1.time_ >= var_258_19 + var_258_20 and arg_255_1.time_ < var_258_19 + var_258_20 + arg_258_0 and arg_255_1.var_.characterEffect1071ui_story then
				local var_258_23 = 0.5

				arg_255_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1071ui_story.fillRatio = var_258_23
			end

			local var_258_24 = arg_255_1.actors_["10044ui_story"]
			local var_258_25 = 0

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 and arg_255_1.var_.characterEffect10044ui_story == nil then
				arg_255_1.var_.characterEffect10044ui_story = var_258_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_26 = 0.2

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_26 then
				local var_258_27 = (arg_255_1.time_ - var_258_25) / var_258_26

				if arg_255_1.var_.characterEffect10044ui_story then
					arg_255_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_25 + var_258_26 and arg_255_1.time_ < var_258_25 + var_258_26 + arg_258_0 and arg_255_1.var_.characterEffect10044ui_story then
				arg_255_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_258_28 = 0
			local var_258_29 = 0.475

			if var_258_28 < arg_255_1.time_ and arg_255_1.time_ <= var_258_28 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_30 = arg_255_1:FormatText(StoryNameCfg[387].name)

				arg_255_1.leftNameTxt_.text = var_258_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_31 = arg_255_1:GetWordFromCfg(120112063)
				local var_258_32 = arg_255_1:FormatText(var_258_31.content)

				arg_255_1.text_.text = var_258_32

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_33 = 19
				local var_258_34 = utf8.len(var_258_32)
				local var_258_35 = var_258_33 <= 0 and var_258_29 or var_258_29 * (var_258_34 / var_258_33)

				if var_258_35 > 0 and var_258_29 < var_258_35 then
					arg_255_1.talkMaxDuration = var_258_35

					if var_258_35 + var_258_28 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_35 + var_258_28
					end
				end

				arg_255_1.text_.text = var_258_32
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112063", "story_v_out_120112.awb") ~= 0 then
					local var_258_36 = manager.audio:GetVoiceLength("story_v_out_120112", "120112063", "story_v_out_120112.awb") / 1000

					if var_258_36 + var_258_28 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_36 + var_258_28
					end

					if var_258_31.prefab_name ~= "" and arg_255_1.actors_[var_258_31.prefab_name] ~= nil then
						local var_258_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_31.prefab_name].transform, "story_v_out_120112", "120112063", "story_v_out_120112.awb")

						arg_255_1:RecordAudio("120112063", var_258_37)
						arg_255_1:RecordAudio("120112063", var_258_37)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_120112", "120112063", "story_v_out_120112.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_120112", "120112063", "story_v_out_120112.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_38 = math.max(var_258_29, arg_255_1.talkMaxDuration)

			if var_258_28 <= arg_255_1.time_ and arg_255_1.time_ < var_258_28 + var_258_38 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_28) / var_258_38

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_28 + var_258_38 and arg_255_1.time_ < var_258_28 + var_258_38 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120112064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120112064
		arg_259_1.duration_ = 5.733

		local var_259_0 = {
			zh = 3.7,
			ja = 5.733
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
				arg_259_0:Play120112065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1071ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1071ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1071ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = arg_259_1.actors_["10044ui_story"].transform
			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1.var_.moveOldPos10044ui_story = var_262_9.localPosition
			end

			local var_262_11 = 0.001

			if var_262_10 <= arg_259_1.time_ and arg_259_1.time_ < var_262_10 + var_262_11 then
				local var_262_12 = (arg_259_1.time_ - var_262_10) / var_262_11
				local var_262_13 = Vector3.New(0.7, -0.72, -6.3)

				var_262_9.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10044ui_story, var_262_13, var_262_12)

				local var_262_14 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_14.x, var_262_14.y, var_262_14.z)

				local var_262_15 = var_262_9.localEulerAngles

				var_262_15.z = 0
				var_262_15.x = 0
				var_262_9.localEulerAngles = var_262_15
			end

			if arg_259_1.time_ >= var_262_10 + var_262_11 and arg_259_1.time_ < var_262_10 + var_262_11 + arg_262_0 then
				var_262_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_262_16 = manager.ui.mainCamera.transform.position - var_262_9.position

				var_262_9.forward = Vector3.New(var_262_16.x, var_262_16.y, var_262_16.z)

				local var_262_17 = var_262_9.localEulerAngles

				var_262_17.z = 0
				var_262_17.x = 0
				var_262_9.localEulerAngles = var_262_17
			end

			local var_262_18 = arg_259_1.actors_["1071ui_story"]
			local var_262_19 = 0

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story == nil then
				arg_259_1.var_.characterEffect1071ui_story = var_262_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_20 = 0.2

			if var_262_19 <= arg_259_1.time_ and arg_259_1.time_ < var_262_19 + var_262_20 then
				local var_262_21 = (arg_259_1.time_ - var_262_19) / var_262_20

				if arg_259_1.var_.characterEffect1071ui_story then
					arg_259_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_19 + var_262_20 and arg_259_1.time_ < var_262_19 + var_262_20 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story then
				arg_259_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_262_22 = arg_259_1.actors_["10044ui_story"]
			local var_262_23 = 0

			if var_262_23 < arg_259_1.time_ and arg_259_1.time_ <= var_262_23 + arg_262_0 and arg_259_1.var_.characterEffect10044ui_story == nil then
				arg_259_1.var_.characterEffect10044ui_story = var_262_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_24 = 0.2

			if var_262_23 <= arg_259_1.time_ and arg_259_1.time_ < var_262_23 + var_262_24 then
				local var_262_25 = (arg_259_1.time_ - var_262_23) / var_262_24

				if arg_259_1.var_.characterEffect10044ui_story then
					local var_262_26 = Mathf.Lerp(0, 0.5, var_262_25)

					arg_259_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_259_1.var_.characterEffect10044ui_story.fillRatio = var_262_26
				end
			end

			if arg_259_1.time_ >= var_262_23 + var_262_24 and arg_259_1.time_ < var_262_23 + var_262_24 + arg_262_0 and arg_259_1.var_.characterEffect10044ui_story then
				local var_262_27 = 0.5

				arg_259_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_259_1.var_.characterEffect10044ui_story.fillRatio = var_262_27
			end

			local var_262_28 = 0

			if var_262_28 < arg_259_1.time_ and arg_259_1.time_ <= var_262_28 + arg_262_0 then
				arg_259_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_2")
			end

			local var_262_29 = 0
			local var_262_30 = 0.375

			if var_262_29 < arg_259_1.time_ and arg_259_1.time_ <= var_262_29 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_31 = arg_259_1:FormatText(StoryNameCfg[384].name)

				arg_259_1.leftNameTxt_.text = var_262_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_32 = arg_259_1:GetWordFromCfg(120112064)
				local var_262_33 = arg_259_1:FormatText(var_262_32.content)

				arg_259_1.text_.text = var_262_33

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_34 = 15
				local var_262_35 = utf8.len(var_262_33)
				local var_262_36 = var_262_34 <= 0 and var_262_30 or var_262_30 * (var_262_35 / var_262_34)

				if var_262_36 > 0 and var_262_30 < var_262_36 then
					arg_259_1.talkMaxDuration = var_262_36

					if var_262_36 + var_262_29 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_36 + var_262_29
					end
				end

				arg_259_1.text_.text = var_262_33
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112064", "story_v_out_120112.awb") ~= 0 then
					local var_262_37 = manager.audio:GetVoiceLength("story_v_out_120112", "120112064", "story_v_out_120112.awb") / 1000

					if var_262_37 + var_262_29 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_37 + var_262_29
					end

					if var_262_32.prefab_name ~= "" and arg_259_1.actors_[var_262_32.prefab_name] ~= nil then
						local var_262_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_32.prefab_name].transform, "story_v_out_120112", "120112064", "story_v_out_120112.awb")

						arg_259_1:RecordAudio("120112064", var_262_38)
						arg_259_1:RecordAudio("120112064", var_262_38)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_120112", "120112064", "story_v_out_120112.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_120112", "120112064", "story_v_out_120112.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_39 = math.max(var_262_30, arg_259_1.talkMaxDuration)

			if var_262_29 <= arg_259_1.time_ and arg_259_1.time_ < var_262_29 + var_262_39 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_29) / var_262_39

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_29 + var_262_39 and arg_259_1.time_ < var_262_29 + var_262_39 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120112065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 120112065
		arg_263_1.duration_ = 8.766

		local var_263_0 = {
			zh = 5.766,
			ja = 8.766
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
				arg_263_0:Play120112066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.75

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[384].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(120112065)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 30
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112065", "story_v_out_120112.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112065", "story_v_out_120112.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_120112", "120112065", "story_v_out_120112.awb")

						arg_263_1:RecordAudio("120112065", var_266_9)
						arg_263_1:RecordAudio("120112065", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_120112", "120112065", "story_v_out_120112.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_120112", "120112065", "story_v_out_120112.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play120112066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 120112066
		arg_267_1.duration_ = 11

		local var_267_0 = {
			zh = 7.9,
			ja = 11
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play120112067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.95

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[384].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(120112066)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 38
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112066", "story_v_out_120112.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112066", "story_v_out_120112.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_120112", "120112066", "story_v_out_120112.awb")

						arg_267_1:RecordAudio("120112066", var_270_9)
						arg_267_1:RecordAudio("120112066", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_120112", "120112066", "story_v_out_120112.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_120112", "120112066", "story_v_out_120112.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play120112067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 120112067
		arg_271_1.duration_ = 1.999999999999

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play120112068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1071ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1071ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1071ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = arg_271_1.actors_["10044ui_story"].transform
			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1.var_.moveOldPos10044ui_story = var_274_9.localPosition
			end

			local var_274_11 = 0.001

			if var_274_10 <= arg_271_1.time_ and arg_271_1.time_ < var_274_10 + var_274_11 then
				local var_274_12 = (arg_271_1.time_ - var_274_10) / var_274_11
				local var_274_13 = Vector3.New(0.7, -0.72, -6.3)

				var_274_9.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos10044ui_story, var_274_13, var_274_12)

				local var_274_14 = manager.ui.mainCamera.transform.position - var_274_9.position

				var_274_9.forward = Vector3.New(var_274_14.x, var_274_14.y, var_274_14.z)

				local var_274_15 = var_274_9.localEulerAngles

				var_274_15.z = 0
				var_274_15.x = 0
				var_274_9.localEulerAngles = var_274_15
			end

			if arg_271_1.time_ >= var_274_10 + var_274_11 and arg_271_1.time_ < var_274_10 + var_274_11 + arg_274_0 then
				var_274_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_274_16 = manager.ui.mainCamera.transform.position - var_274_9.position

				var_274_9.forward = Vector3.New(var_274_16.x, var_274_16.y, var_274_16.z)

				local var_274_17 = var_274_9.localEulerAngles

				var_274_17.z = 0
				var_274_17.x = 0
				var_274_9.localEulerAngles = var_274_17
			end

			local var_274_18 = arg_271_1.actors_["1071ui_story"]
			local var_274_19 = 0

			if var_274_19 < arg_271_1.time_ and arg_271_1.time_ <= var_274_19 + arg_274_0 and arg_271_1.var_.characterEffect1071ui_story == nil then
				arg_271_1.var_.characterEffect1071ui_story = var_274_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_20 = 0.2

			if var_274_19 <= arg_271_1.time_ and arg_271_1.time_ < var_274_19 + var_274_20 then
				local var_274_21 = (arg_271_1.time_ - var_274_19) / var_274_20

				if arg_271_1.var_.characterEffect1071ui_story then
					local var_274_22 = Mathf.Lerp(0, 0.5, var_274_21)

					arg_271_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1071ui_story.fillRatio = var_274_22
				end
			end

			if arg_271_1.time_ >= var_274_19 + var_274_20 and arg_271_1.time_ < var_274_19 + var_274_20 + arg_274_0 and arg_271_1.var_.characterEffect1071ui_story then
				local var_274_23 = 0.5

				arg_271_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1071ui_story.fillRatio = var_274_23
			end

			local var_274_24 = arg_271_1.actors_["10044ui_story"]
			local var_274_25 = 0

			if var_274_25 < arg_271_1.time_ and arg_271_1.time_ <= var_274_25 + arg_274_0 and arg_271_1.var_.characterEffect10044ui_story == nil then
				arg_271_1.var_.characterEffect10044ui_story = var_274_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_26 = 0.2

			if var_274_25 <= arg_271_1.time_ and arg_271_1.time_ < var_274_25 + var_274_26 then
				local var_274_27 = (arg_271_1.time_ - var_274_25) / var_274_26

				if arg_271_1.var_.characterEffect10044ui_story then
					arg_271_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_25 + var_274_26 and arg_271_1.time_ < var_274_25 + var_274_26 + arg_274_0 and arg_271_1.var_.characterEffect10044ui_story then
				arg_271_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_274_28 = 0

			if var_274_28 < arg_271_1.time_ and arg_271_1.time_ <= var_274_28 + arg_274_0 then
				arg_271_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_274_29 = 0
			local var_274_30 = 0.05

			if var_274_29 < arg_271_1.time_ and arg_271_1.time_ <= var_274_29 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_31 = arg_271_1:FormatText(StoryNameCfg[387].name)

				arg_271_1.leftNameTxt_.text = var_274_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_32 = arg_271_1:GetWordFromCfg(120112067)
				local var_274_33 = arg_271_1:FormatText(var_274_32.content)

				arg_271_1.text_.text = var_274_33

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_34 = 2
				local var_274_35 = utf8.len(var_274_33)
				local var_274_36 = var_274_34 <= 0 and var_274_30 or var_274_30 * (var_274_35 / var_274_34)

				if var_274_36 > 0 and var_274_30 < var_274_36 then
					arg_271_1.talkMaxDuration = var_274_36

					if var_274_36 + var_274_29 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_36 + var_274_29
					end
				end

				arg_271_1.text_.text = var_274_33
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112067", "story_v_out_120112.awb") ~= 0 then
					local var_274_37 = manager.audio:GetVoiceLength("story_v_out_120112", "120112067", "story_v_out_120112.awb") / 1000

					if var_274_37 + var_274_29 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_37 + var_274_29
					end

					if var_274_32.prefab_name ~= "" and arg_271_1.actors_[var_274_32.prefab_name] ~= nil then
						local var_274_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_32.prefab_name].transform, "story_v_out_120112", "120112067", "story_v_out_120112.awb")

						arg_271_1:RecordAudio("120112067", var_274_38)
						arg_271_1:RecordAudio("120112067", var_274_38)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_120112", "120112067", "story_v_out_120112.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_120112", "120112067", "story_v_out_120112.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_39 = math.max(var_274_30, arg_271_1.talkMaxDuration)

			if var_274_29 <= arg_271_1.time_ and arg_271_1.time_ < var_274_29 + var_274_39 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_29) / var_274_39

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_29 + var_274_39 and arg_271_1.time_ < var_274_29 + var_274_39 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play120112068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 120112068
		arg_275_1.duration_ = 6.833

		local var_275_0 = {
			zh = 6.233,
			ja = 6.833
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
				arg_275_0:Play120112069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1071ui_story"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1071ui_story = var_278_0.localPosition
			end

			local var_278_2 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2
				local var_278_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1071ui_story, var_278_4, var_278_3)

				local var_278_5 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_5.x, var_278_5.y, var_278_5.z)

				local var_278_6 = var_278_0.localEulerAngles

				var_278_6.z = 0
				var_278_6.x = 0
				var_278_0.localEulerAngles = var_278_6
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_278_7 = manager.ui.mainCamera.transform.position - var_278_0.position

				var_278_0.forward = Vector3.New(var_278_7.x, var_278_7.y, var_278_7.z)

				local var_278_8 = var_278_0.localEulerAngles

				var_278_8.z = 0
				var_278_8.x = 0
				var_278_0.localEulerAngles = var_278_8
			end

			local var_278_9 = arg_275_1.actors_["10044ui_story"].transform
			local var_278_10 = 0

			if var_278_10 < arg_275_1.time_ and arg_275_1.time_ <= var_278_10 + arg_278_0 then
				arg_275_1.var_.moveOldPos10044ui_story = var_278_9.localPosition
			end

			local var_278_11 = 0.001

			if var_278_10 <= arg_275_1.time_ and arg_275_1.time_ < var_278_10 + var_278_11 then
				local var_278_12 = (arg_275_1.time_ - var_278_10) / var_278_11
				local var_278_13 = Vector3.New(0.7, -0.72, -6.3)

				var_278_9.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos10044ui_story, var_278_13, var_278_12)

				local var_278_14 = manager.ui.mainCamera.transform.position - var_278_9.position

				var_278_9.forward = Vector3.New(var_278_14.x, var_278_14.y, var_278_14.z)

				local var_278_15 = var_278_9.localEulerAngles

				var_278_15.z = 0
				var_278_15.x = 0
				var_278_9.localEulerAngles = var_278_15
			end

			if arg_275_1.time_ >= var_278_10 + var_278_11 and arg_275_1.time_ < var_278_10 + var_278_11 + arg_278_0 then
				var_278_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_278_16 = manager.ui.mainCamera.transform.position - var_278_9.position

				var_278_9.forward = Vector3.New(var_278_16.x, var_278_16.y, var_278_16.z)

				local var_278_17 = var_278_9.localEulerAngles

				var_278_17.z = 0
				var_278_17.x = 0
				var_278_9.localEulerAngles = var_278_17
			end

			local var_278_18 = arg_275_1.actors_["1071ui_story"]
			local var_278_19 = 0

			if var_278_19 < arg_275_1.time_ and arg_275_1.time_ <= var_278_19 + arg_278_0 and arg_275_1.var_.characterEffect1071ui_story == nil then
				arg_275_1.var_.characterEffect1071ui_story = var_278_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_20 = 0.2

			if var_278_19 <= arg_275_1.time_ and arg_275_1.time_ < var_278_19 + var_278_20 then
				local var_278_21 = (arg_275_1.time_ - var_278_19) / var_278_20

				if arg_275_1.var_.characterEffect1071ui_story then
					arg_275_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_19 + var_278_20 and arg_275_1.time_ < var_278_19 + var_278_20 + arg_278_0 and arg_275_1.var_.characterEffect1071ui_story then
				arg_275_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_278_22 = arg_275_1.actors_["10044ui_story"]
			local var_278_23 = 0

			if var_278_23 < arg_275_1.time_ and arg_275_1.time_ <= var_278_23 + arg_278_0 and arg_275_1.var_.characterEffect10044ui_story == nil then
				arg_275_1.var_.characterEffect10044ui_story = var_278_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_24 = 0.2

			if var_278_23 <= arg_275_1.time_ and arg_275_1.time_ < var_278_23 + var_278_24 then
				local var_278_25 = (arg_275_1.time_ - var_278_23) / var_278_24

				if arg_275_1.var_.characterEffect10044ui_story then
					local var_278_26 = Mathf.Lerp(0, 0.5, var_278_25)

					arg_275_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_275_1.var_.characterEffect10044ui_story.fillRatio = var_278_26
				end
			end

			if arg_275_1.time_ >= var_278_23 + var_278_24 and arg_275_1.time_ < var_278_23 + var_278_24 + arg_278_0 and arg_275_1.var_.characterEffect10044ui_story then
				local var_278_27 = 0.5

				arg_275_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_275_1.var_.characterEffect10044ui_story.fillRatio = var_278_27
			end

			local var_278_28 = 0
			local var_278_29 = 0.425

			if var_278_28 < arg_275_1.time_ and arg_275_1.time_ <= var_278_28 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_30 = arg_275_1:FormatText(StoryNameCfg[384].name)

				arg_275_1.leftNameTxt_.text = var_278_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_31 = arg_275_1:GetWordFromCfg(120112068)
				local var_278_32 = arg_275_1:FormatText(var_278_31.content)

				arg_275_1.text_.text = var_278_32

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_33 = 17
				local var_278_34 = utf8.len(var_278_32)
				local var_278_35 = var_278_33 <= 0 and var_278_29 or var_278_29 * (var_278_34 / var_278_33)

				if var_278_35 > 0 and var_278_29 < var_278_35 then
					arg_275_1.talkMaxDuration = var_278_35

					if var_278_35 + var_278_28 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_35 + var_278_28
					end
				end

				arg_275_1.text_.text = var_278_32
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112068", "story_v_out_120112.awb") ~= 0 then
					local var_278_36 = manager.audio:GetVoiceLength("story_v_out_120112", "120112068", "story_v_out_120112.awb") / 1000

					if var_278_36 + var_278_28 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_36 + var_278_28
					end

					if var_278_31.prefab_name ~= "" and arg_275_1.actors_[var_278_31.prefab_name] ~= nil then
						local var_278_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_31.prefab_name].transform, "story_v_out_120112", "120112068", "story_v_out_120112.awb")

						arg_275_1:RecordAudio("120112068", var_278_37)
						arg_275_1:RecordAudio("120112068", var_278_37)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_120112", "120112068", "story_v_out_120112.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_120112", "120112068", "story_v_out_120112.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_38 = math.max(var_278_29, arg_275_1.talkMaxDuration)

			if var_278_28 <= arg_275_1.time_ and arg_275_1.time_ < var_278_28 + var_278_38 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_28) / var_278_38

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_28 + var_278_38 and arg_275_1.time_ < var_278_28 + var_278_38 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play120112069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 120112069
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play120112070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1071ui_story"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1071ui_story = var_282_0.localPosition
			end

			local var_282_2 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2
				local var_282_4 = Vector3.New(0, 100, 0)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1071ui_story, var_282_4, var_282_3)

				local var_282_5 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_5.x, var_282_5.y, var_282_5.z)

				local var_282_6 = var_282_0.localEulerAngles

				var_282_6.z = 0
				var_282_6.x = 0
				var_282_0.localEulerAngles = var_282_6
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(0, 100, 0)

				local var_282_7 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_7.x, var_282_7.y, var_282_7.z)

				local var_282_8 = var_282_0.localEulerAngles

				var_282_8.z = 0
				var_282_8.x = 0
				var_282_0.localEulerAngles = var_282_8
			end

			local var_282_9 = arg_279_1.actors_["10044ui_story"].transform
			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 then
				arg_279_1.var_.moveOldPos10044ui_story = var_282_9.localPosition
			end

			local var_282_11 = 0.001

			if var_282_10 <= arg_279_1.time_ and arg_279_1.time_ < var_282_10 + var_282_11 then
				local var_282_12 = (arg_279_1.time_ - var_282_10) / var_282_11
				local var_282_13 = Vector3.New(0, 100, 0)

				var_282_9.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos10044ui_story, var_282_13, var_282_12)

				local var_282_14 = manager.ui.mainCamera.transform.position - var_282_9.position

				var_282_9.forward = Vector3.New(var_282_14.x, var_282_14.y, var_282_14.z)

				local var_282_15 = var_282_9.localEulerAngles

				var_282_15.z = 0
				var_282_15.x = 0
				var_282_9.localEulerAngles = var_282_15
			end

			if arg_279_1.time_ >= var_282_10 + var_282_11 and arg_279_1.time_ < var_282_10 + var_282_11 + arg_282_0 then
				var_282_9.localPosition = Vector3.New(0, 100, 0)

				local var_282_16 = manager.ui.mainCamera.transform.position - var_282_9.position

				var_282_9.forward = Vector3.New(var_282_16.x, var_282_16.y, var_282_16.z)

				local var_282_17 = var_282_9.localEulerAngles

				var_282_17.z = 0
				var_282_17.x = 0
				var_282_9.localEulerAngles = var_282_17
			end

			local var_282_18 = 0
			local var_282_19 = 1.15

			if var_282_18 < arg_279_1.time_ and arg_279_1.time_ <= var_282_18 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_20 = arg_279_1:GetWordFromCfg(120112069)
				local var_282_21 = arg_279_1:FormatText(var_282_20.content)

				arg_279_1.text_.text = var_282_21

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_22 = 46
				local var_282_23 = utf8.len(var_282_21)
				local var_282_24 = var_282_22 <= 0 and var_282_19 or var_282_19 * (var_282_23 / var_282_22)

				if var_282_24 > 0 and var_282_19 < var_282_24 then
					arg_279_1.talkMaxDuration = var_282_24

					if var_282_24 + var_282_18 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_24 + var_282_18
					end
				end

				arg_279_1.text_.text = var_282_21
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_25 = math.max(var_282_19, arg_279_1.talkMaxDuration)

			if var_282_18 <= arg_279_1.time_ and arg_279_1.time_ < var_282_18 + var_282_25 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_18) / var_282_25

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_18 + var_282_25 and arg_279_1.time_ < var_282_18 + var_282_25 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play120112070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 120112070
		arg_283_1.duration_ = 7.466

		local var_283_0 = {
			zh = 7.033,
			ja = 7.466
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
			arg_283_1.auto_ = false
		end

		function arg_283_1.playNext_(arg_285_0)
			arg_283_1.onStoryFinished_()
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1071ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story == nil then
				arg_283_1.var_.characterEffect1071ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.2

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1071ui_story then
					arg_283_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story then
				arg_283_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_286_4 = arg_283_1.actors_["1071ui_story"].transform
			local var_286_5 = 0

			if var_286_5 < arg_283_1.time_ and arg_283_1.time_ <= var_286_5 + arg_286_0 then
				arg_283_1.var_.moveOldPos1071ui_story = var_286_4.localPosition
			end

			local var_286_6 = 0.001

			if var_286_5 <= arg_283_1.time_ and arg_283_1.time_ < var_286_5 + var_286_6 then
				local var_286_7 = (arg_283_1.time_ - var_286_5) / var_286_6
				local var_286_8 = Vector3.New(0, -1.05, -6.2)

				var_286_4.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1071ui_story, var_286_8, var_286_7)

				local var_286_9 = manager.ui.mainCamera.transform.position - var_286_4.position

				var_286_4.forward = Vector3.New(var_286_9.x, var_286_9.y, var_286_9.z)

				local var_286_10 = var_286_4.localEulerAngles

				var_286_10.z = 0
				var_286_10.x = 0
				var_286_4.localEulerAngles = var_286_10
			end

			if arg_283_1.time_ >= var_286_5 + var_286_6 and arg_283_1.time_ < var_286_5 + var_286_6 + arg_286_0 then
				var_286_4.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_286_11 = manager.ui.mainCamera.transform.position - var_286_4.position

				var_286_4.forward = Vector3.New(var_286_11.x, var_286_11.y, var_286_11.z)

				local var_286_12 = var_286_4.localEulerAngles

				var_286_12.z = 0
				var_286_12.x = 0
				var_286_4.localEulerAngles = var_286_12
			end

			local var_286_13 = 0

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_286_14 = 0
			local var_286_15 = 0.625

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_16 = arg_283_1:FormatText(StoryNameCfg[384].name)

				arg_283_1.leftNameTxt_.text = var_286_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_17 = arg_283_1:GetWordFromCfg(120112070)
				local var_286_18 = arg_283_1:FormatText(var_286_17.content)

				arg_283_1.text_.text = var_286_18

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_19 = 25
				local var_286_20 = utf8.len(var_286_18)
				local var_286_21 = var_286_19 <= 0 and var_286_15 or var_286_15 * (var_286_20 / var_286_19)

				if var_286_21 > 0 and var_286_15 < var_286_21 then
					arg_283_1.talkMaxDuration = var_286_21

					if var_286_21 + var_286_14 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_21 + var_286_14
					end
				end

				arg_283_1.text_.text = var_286_18
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112070", "story_v_out_120112.awb") ~= 0 then
					local var_286_22 = manager.audio:GetVoiceLength("story_v_out_120112", "120112070", "story_v_out_120112.awb") / 1000

					if var_286_22 + var_286_14 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_22 + var_286_14
					end

					if var_286_17.prefab_name ~= "" and arg_283_1.actors_[var_286_17.prefab_name] ~= nil then
						local var_286_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_17.prefab_name].transform, "story_v_out_120112", "120112070", "story_v_out_120112.awb")

						arg_283_1:RecordAudio("120112070", var_286_23)
						arg_283_1:RecordAudio("120112070", var_286_23)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_120112", "120112070", "story_v_out_120112.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_120112", "120112070", "story_v_out_120112.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_24 = math.max(var_286_15, arg_283_1.talkMaxDuration)

			if var_286_14 <= arg_283_1.time_ and arg_283_1.time_ < var_286_14 + var_286_24 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_14) / var_286_24

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_14 + var_286_24 and arg_283_1.time_ < var_286_14 + var_286_24 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play120112041 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 120112041
		arg_287_1.duration_ = 6.533

		local var_287_0 = {
			zh = 5.866,
			ja = 6.533
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
				arg_287_0:Play120112042(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.625

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[384].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(120112041)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 25
				local var_290_6 = utf8.len(var_290_4)
				local var_290_7 = var_290_5 <= 0 and var_290_1 or var_290_1 * (var_290_6 / var_290_5)

				if var_290_7 > 0 and var_290_1 < var_290_7 then
					arg_287_1.talkMaxDuration = var_290_7

					if var_290_7 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_7 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_4
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112041", "story_v_out_120112.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112041", "story_v_out_120112.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_120112", "120112041", "story_v_out_120112.awb")

						arg_287_1:RecordAudio("120112041", var_290_9)
						arg_287_1:RecordAudio("120112041", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_120112", "120112041", "story_v_out_120112.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_120112", "120112041", "story_v_out_120112.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_10 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_10 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_10

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_10 and arg_287_1.time_ < var_290_0 + var_290_10 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play120112042 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 120112042
		arg_291_1.duration_ = 5.333

		local var_291_0 = {
			zh = 5.3,
			ja = 5.333
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
				arg_291_0:Play120112043(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.675

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_2 = arg_291_1:FormatText(StoryNameCfg[384].name)

				arg_291_1.leftNameTxt_.text = var_294_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_3 = arg_291_1:GetWordFromCfg(120112042)
				local var_294_4 = arg_291_1:FormatText(var_294_3.content)

				arg_291_1.text_.text = var_294_4

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_5 = 27
				local var_294_6 = utf8.len(var_294_4)
				local var_294_7 = var_294_5 <= 0 and var_294_1 or var_294_1 * (var_294_6 / var_294_5)

				if var_294_7 > 0 and var_294_1 < var_294_7 then
					arg_291_1.talkMaxDuration = var_294_7

					if var_294_7 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_7 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_4
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120112", "120112042", "story_v_out_120112.awb") ~= 0 then
					local var_294_8 = manager.audio:GetVoiceLength("story_v_out_120112", "120112042", "story_v_out_120112.awb") / 1000

					if var_294_8 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_8 + var_294_0
					end

					if var_294_3.prefab_name ~= "" and arg_291_1.actors_[var_294_3.prefab_name] ~= nil then
						local var_294_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_3.prefab_name].transform, "story_v_out_120112", "120112042", "story_v_out_120112.awb")

						arg_291_1:RecordAudio("120112042", var_294_9)
						arg_291_1:RecordAudio("120112042", var_294_9)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_120112", "120112042", "story_v_out_120112.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_120112", "120112042", "story_v_out_120112.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_10 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_10 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_10

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_10 and arg_291_1.time_ < var_294_0 + var_294_10 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J04f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0106",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0106a"
	},
	voices = {
		"story_v_out_120112.awb"
	}
}
