return {
	Play120072001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120072001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play120072002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "J03g"

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
				local var_4_5 = arg_1_1.bgs_.J03g

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
					if iter_4_0 ~= "J03g" then
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
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_16", "se_story_16_metal03", "")
			end

			local var_4_26 = 0
			local var_4_27 = 0.133333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 0.166666666666667
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_2_0_story_jingdu", "bgm_activity_2_0_story_jingdu", "bgm_activity_2_0_story_jingdu.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.05

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

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(120072001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 2
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120072002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120072002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120072003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = manager.ui.mainCamera.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.shakeOldPos = var_10_0.localPosition
			end

			local var_10_2 = 1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / 0.066
				local var_10_4, var_10_5 = math.modf(var_10_3)

				var_10_0.localPosition = Vector3.New(var_10_5 * 0.13, var_10_5 * 0.13, var_10_5 * 0.13) + arg_7_1.var_.shakeOldPos
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 then
				var_10_0.localPosition = arg_7_1.var_.shakeOldPos
			end

			local var_10_6 = 0

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.allBtn_.enabled = false
			end

			local var_10_7 = 1

			if arg_7_1.time_ >= var_10_6 + var_10_7 and arg_7_1.time_ < var_10_6 + var_10_7 + arg_10_0 then
				arg_7_1.allBtn_.enabled = true
			end

			local var_10_8 = 0
			local var_10_9 = 1

			if var_10_8 < arg_7_1.time_ and arg_7_1.time_ <= var_10_8 + arg_10_0 then
				local var_10_10 = "play"
				local var_10_11 = "effect"

				arg_7_1:AudioAction(var_10_10, var_10_11, "se_story_17", "se_story_17_boss_hawk1", "")
			end

			local var_10_12 = 0
			local var_10_13 = 0.15

			if var_10_12 < arg_7_1.time_ and arg_7_1.time_ <= var_10_12 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_14 = arg_7_1:FormatText(StoryNameCfg[68].name)

				arg_7_1.leftNameTxt_.text = var_10_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3041")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_15 = arg_7_1:GetWordFromCfg(120072002)
				local var_10_16 = arg_7_1:FormatText(var_10_15.content)

				arg_7_1.text_.text = var_10_16

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_17 = 6
				local var_10_18 = utf8.len(var_10_16)
				local var_10_19 = var_10_17 <= 0 and var_10_13 or var_10_13 * (var_10_18 / var_10_17)

				if var_10_19 > 0 and var_10_13 < var_10_19 then
					arg_7_1.talkMaxDuration = var_10_19

					if var_10_19 + var_10_12 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_19 + var_10_12
					end
				end

				arg_7_1.text_.text = var_10_16
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_20 = math.max(var_10_13, arg_7_1.talkMaxDuration)

			if var_10_12 <= arg_7_1.time_ and arg_7_1.time_ < var_10_12 + var_10_20 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_12) / var_10_20

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_12 + var_10_20 and arg_7_1.time_ < var_10_12 + var_10_20 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play120072003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120072003
		arg_11_1.duration_ = 5.2

		local var_11_0 = {
			zh = 2.7,
			ja = 5.2
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
				arg_11_0:Play120072004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1184ui_story"

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

			local var_14_4 = arg_11_1.actors_["1184ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1184ui_story = var_14_4.localPosition

				local var_14_6 = "1184ui_story"

				arg_11_1:ShowWeapon(arg_11_1.var_[var_14_6 .. "Animator"].transform, true)
			end

			local var_14_7 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_7 then
				local var_14_8 = (arg_11_1.time_ - var_14_5) / var_14_7
				local var_14_9 = Vector3.New(0, -0.97, -6)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1184ui_story, var_14_9, var_14_8)

				local var_14_10 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_10.x, var_14_10.y, var_14_10.z)

				local var_14_11 = var_14_4.localEulerAngles

				var_14_11.z = 0
				var_14_11.x = 0
				var_14_4.localEulerAngles = var_14_11
			end

			if arg_11_1.time_ >= var_14_5 + var_14_7 and arg_11_1.time_ < var_14_5 + var_14_7 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_14_12 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_12.x, var_14_12.y, var_14_12.z)

				local var_14_13 = var_14_4.localEulerAngles

				var_14_13.z = 0
				var_14_13.x = 0
				var_14_4.localEulerAngles = var_14_13
			end

			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_14_15 = 0

			if var_14_15 < arg_11_1.time_ and arg_11_1.time_ <= var_14_15 + arg_14_0 then
				arg_11_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_14_16 = arg_11_1.actors_["1184ui_story"]
			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 and arg_11_1.var_.characterEffect1184ui_story == nil then
				arg_11_1.var_.characterEffect1184ui_story = var_14_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_18 = 0.2

			if var_14_17 <= arg_11_1.time_ and arg_11_1.time_ < var_14_17 + var_14_18 then
				local var_14_19 = (arg_11_1.time_ - var_14_17) / var_14_18

				if arg_11_1.var_.characterEffect1184ui_story then
					arg_11_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_17 + var_14_18 and arg_11_1.time_ < var_14_17 + var_14_18 + arg_14_0 and arg_11_1.var_.characterEffect1184ui_story then
				arg_11_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_14_20 = 0
			local var_14_21 = 0.175

			if var_14_20 < arg_11_1.time_ and arg_11_1.time_ <= var_14_20 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_22 = arg_11_1:FormatText(StoryNameCfg[6].name)

				arg_11_1.leftNameTxt_.text = var_14_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_23 = arg_11_1:GetWordFromCfg(120072003)
				local var_14_24 = arg_11_1:FormatText(var_14_23.content)

				arg_11_1.text_.text = var_14_24

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_25 = 7
				local var_14_26 = utf8.len(var_14_24)
				local var_14_27 = var_14_25 <= 0 and var_14_21 or var_14_21 * (var_14_26 / var_14_25)

				if var_14_27 > 0 and var_14_21 < var_14_27 then
					arg_11_1.talkMaxDuration = var_14_27

					if var_14_27 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_27 + var_14_20
					end
				end

				arg_11_1.text_.text = var_14_24
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072003", "story_v_out_120072.awb") ~= 0 then
					local var_14_28 = manager.audio:GetVoiceLength("story_v_out_120072", "120072003", "story_v_out_120072.awb") / 1000

					if var_14_28 + var_14_20 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_28 + var_14_20
					end

					if var_14_23.prefab_name ~= "" and arg_11_1.actors_[var_14_23.prefab_name] ~= nil then
						local var_14_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_23.prefab_name].transform, "story_v_out_120072", "120072003", "story_v_out_120072.awb")

						arg_11_1:RecordAudio("120072003", var_14_29)
						arg_11_1:RecordAudio("120072003", var_14_29)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_120072", "120072003", "story_v_out_120072.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_120072", "120072003", "story_v_out_120072.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_30 = math.max(var_14_21, arg_11_1.talkMaxDuration)

			if var_14_20 <= arg_11_1.time_ and arg_11_1.time_ < var_14_20 + var_14_30 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_20) / var_14_30

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_20 + var_14_30 and arg_11_1.time_ < var_14_20 + var_14_30 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120072004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120072004
		arg_15_1.duration_ = 2.6

		local var_15_0 = {
			zh = 1.999999999999,
			ja = 2.6
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
				arg_15_0:Play120072005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_18_1 = 0
			local var_18_2 = 0.175

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_3 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_4 = arg_15_1:GetWordFromCfg(120072004)
				local var_18_5 = arg_15_1:FormatText(var_18_4.content)

				arg_15_1.text_.text = var_18_5

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_6 = 7
				local var_18_7 = utf8.len(var_18_5)
				local var_18_8 = var_18_6 <= 0 and var_18_2 or var_18_2 * (var_18_7 / var_18_6)

				if var_18_8 > 0 and var_18_2 < var_18_8 then
					arg_15_1.talkMaxDuration = var_18_8

					if var_18_8 + var_18_1 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_1
					end
				end

				arg_15_1.text_.text = var_18_5
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072004", "story_v_out_120072.awb") ~= 0 then
					local var_18_9 = manager.audio:GetVoiceLength("story_v_out_120072", "120072004", "story_v_out_120072.awb") / 1000

					if var_18_9 + var_18_1 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_9 + var_18_1
					end

					if var_18_4.prefab_name ~= "" and arg_15_1.actors_[var_18_4.prefab_name] ~= nil then
						local var_18_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_4.prefab_name].transform, "story_v_out_120072", "120072004", "story_v_out_120072.awb")

						arg_15_1:RecordAudio("120072004", var_18_10)
						arg_15_1:RecordAudio("120072004", var_18_10)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_120072", "120072004", "story_v_out_120072.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_120072", "120072004", "story_v_out_120072.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_11 = math.max(var_18_2, arg_15_1.talkMaxDuration)

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_11 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_1) / var_18_11

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_1 + var_18_11 and arg_15_1.time_ < var_18_1 + var_18_11 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120072005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120072005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play120072006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1184ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1184ui_story = var_22_0.localPosition

				local var_22_2 = "1184ui_story"

				arg_19_1:ShowWeapon(arg_19_1.var_[var_22_2 .. "Animator"].transform, false)
			end

			local var_22_3 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_3 then
				local var_22_4 = (arg_19_1.time_ - var_22_1) / var_22_3
				local var_22_5 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1184ui_story, var_22_5, var_22_4)

				local var_22_6 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_6.x, var_22_6.y, var_22_6.z)

				local var_22_7 = var_22_0.localEulerAngles

				var_22_7.z = 0
				var_22_7.x = 0
				var_22_0.localEulerAngles = var_22_7
			end

			if arg_19_1.time_ >= var_22_1 + var_22_3 and arg_19_1.time_ < var_22_1 + var_22_3 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_8 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_8.x, var_22_8.y, var_22_8.z)

				local var_22_9 = var_22_0.localEulerAngles

				var_22_9.z = 0
				var_22_9.x = 0
				var_22_0.localEulerAngles = var_22_9
			end

			local var_22_10 = manager.ui.mainCamera.transform
			local var_22_11 = 0

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.var_.shakeOldPos = var_22_10.localPosition
			end

			local var_22_12 = 1

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				local var_22_13 = (arg_19_1.time_ - var_22_11) / 0.066
				local var_22_14, var_22_15 = math.modf(var_22_13)

				var_22_10.localPosition = Vector3.New(var_22_15 * 0.13, var_22_15 * 0.13, var_22_15 * 0.13) + arg_19_1.var_.shakeOldPos
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 then
				var_22_10.localPosition = arg_19_1.var_.shakeOldPos
			end

			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.allBtn_.enabled = false
			end

			local var_22_17 = 1

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				arg_19_1.allBtn_.enabled = true
			end

			local var_22_18 = 0
			local var_22_19 = 1

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				local var_22_20 = "play"
				local var_22_21 = "effect"

				arg_19_1:AudioAction(var_22_20, var_22_21, "se_story_16", "se_story_16_metal02", "")
			end

			local var_22_22 = 0
			local var_22_23 = 0.05

			if var_22_22 < arg_19_1.time_ and arg_19_1.time_ <= var_22_22 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_24 = arg_19_1:GetWordFromCfg(120072005)
				local var_22_25 = arg_19_1:FormatText(var_22_24.content)

				arg_19_1.text_.text = var_22_25

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_26 = 2
				local var_22_27 = utf8.len(var_22_25)
				local var_22_28 = var_22_26 <= 0 and var_22_23 or var_22_23 * (var_22_27 / var_22_26)

				if var_22_28 > 0 and var_22_23 < var_22_28 then
					arg_19_1.talkMaxDuration = var_22_28

					if var_22_28 + var_22_22 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_22
					end
				end

				arg_19_1.text_.text = var_22_25
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_29 = math.max(var_22_23, arg_19_1.talkMaxDuration)

			if var_22_22 <= arg_19_1.time_ and arg_19_1.time_ < var_22_22 + var_22_29 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_22) / var_22_29

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_22 + var_22_29 and arg_19_1.time_ < var_22_22 + var_22_29 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120072006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120072006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120072007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.4

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

				local var_26_2 = arg_23_1:GetWordFromCfg(120072006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 56
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
	Play120072007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120072007
		arg_27_1.duration_ = 5.6

		local var_27_0 = {
			zh = 2.6,
			ja = 5.6
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
				arg_27_0:Play120072008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1184ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1184ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -0.97, -6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1184ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 then
				arg_27_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_30_11 = arg_27_1.actors_["1184ui_story"]
			local var_30_12 = 0

			if var_30_12 < arg_27_1.time_ and arg_27_1.time_ <= var_30_12 + arg_30_0 and arg_27_1.var_.characterEffect1184ui_story == nil then
				arg_27_1.var_.characterEffect1184ui_story = var_30_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_13 = 0.0166666666666667

			if var_30_12 <= arg_27_1.time_ and arg_27_1.time_ < var_30_12 + var_30_13 then
				local var_30_14 = (arg_27_1.time_ - var_30_12) / var_30_13

				if arg_27_1.var_.characterEffect1184ui_story then
					local var_30_15 = Mathf.Lerp(0, 0.5, var_30_14)

					arg_27_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1184ui_story.fillRatio = var_30_15
				end
			end

			if arg_27_1.time_ >= var_30_12 + var_30_13 and arg_27_1.time_ < var_30_12 + var_30_13 + arg_30_0 and arg_27_1.var_.characterEffect1184ui_story then
				local var_30_16 = 0.5

				arg_27_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1184ui_story.fillRatio = var_30_16
			end

			local var_30_17 = "10044ui_story"

			if arg_27_1.actors_[var_30_17] == nil then
				local var_30_18 = Object.Instantiate(Asset.Load("Char/" .. var_30_17), arg_27_1.stage_.transform)

				var_30_18.name = var_30_17
				var_30_18.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_17] = var_30_18

				local var_30_19 = var_30_18:GetComponentInChildren(typeof(CharacterEffect))

				var_30_19.enabled = true

				local var_30_20 = GameObjectTools.GetOrAddComponent(var_30_18, typeof(DynamicBoneHelper))

				if var_30_20 then
					var_30_20:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_19.transform, false)

				arg_27_1.var_[var_30_17 .. "Animator"] = var_30_19.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_17 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_17 .. "LipSync"] = var_30_19.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_21 = arg_27_1.actors_["10044ui_story"].transform
			local var_30_22 = 0

			if var_30_22 < arg_27_1.time_ and arg_27_1.time_ <= var_30_22 + arg_30_0 then
				arg_27_1.var_.moveOldPos10044ui_story = var_30_21.localPosition
			end

			local var_30_23 = 0.001

			if var_30_22 <= arg_27_1.time_ and arg_27_1.time_ < var_30_22 + var_30_23 then
				local var_30_24 = (arg_27_1.time_ - var_30_22) / var_30_23
				local var_30_25 = Vector3.New(0.7, -0.72, -6.3)

				var_30_21.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10044ui_story, var_30_25, var_30_24)

				local var_30_26 = manager.ui.mainCamera.transform.position - var_30_21.position

				var_30_21.forward = Vector3.New(var_30_26.x, var_30_26.y, var_30_26.z)

				local var_30_27 = var_30_21.localEulerAngles

				var_30_27.z = 0
				var_30_27.x = 0
				var_30_21.localEulerAngles = var_30_27
			end

			if arg_27_1.time_ >= var_30_22 + var_30_23 and arg_27_1.time_ < var_30_22 + var_30_23 + arg_30_0 then
				var_30_21.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_30_28 = manager.ui.mainCamera.transform.position - var_30_21.position

				var_30_21.forward = Vector3.New(var_30_28.x, var_30_28.y, var_30_28.z)

				local var_30_29 = var_30_21.localEulerAngles

				var_30_29.z = 0
				var_30_29.x = 0
				var_30_21.localEulerAngles = var_30_29
			end

			local var_30_30 = 0

			if var_30_30 < arg_27_1.time_ and arg_27_1.time_ <= var_30_30 + arg_30_0 then
				arg_27_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_30_31 = arg_27_1.actors_["10044ui_story"]
			local var_30_32 = 0

			if var_30_32 < arg_27_1.time_ and arg_27_1.time_ <= var_30_32 + arg_30_0 and arg_27_1.var_.characterEffect10044ui_story == nil then
				arg_27_1.var_.characterEffect10044ui_story = var_30_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_33 = 0.2

			if var_30_32 <= arg_27_1.time_ and arg_27_1.time_ < var_30_32 + var_30_33 then
				local var_30_34 = (arg_27_1.time_ - var_30_32) / var_30_33

				if arg_27_1.var_.characterEffect10044ui_story then
					arg_27_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_32 + var_30_33 and arg_27_1.time_ < var_30_32 + var_30_33 + arg_30_0 and arg_27_1.var_.characterEffect10044ui_story then
				arg_27_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_30_35 = 0

			if var_30_35 < arg_27_1.time_ and arg_27_1.time_ <= var_30_35 + arg_30_0 then
				arg_27_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_30_36 = 0
			local var_30_37 = 0.25

			if var_30_36 < arg_27_1.time_ and arg_27_1.time_ <= var_30_36 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_38 = arg_27_1:FormatText(StoryNameCfg[380].name)

				arg_27_1.leftNameTxt_.text = var_30_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_39 = arg_27_1:GetWordFromCfg(120072007)
				local var_30_40 = arg_27_1:FormatText(var_30_39.content)

				arg_27_1.text_.text = var_30_40

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_41 = 10
				local var_30_42 = utf8.len(var_30_40)
				local var_30_43 = var_30_41 <= 0 and var_30_37 or var_30_37 * (var_30_42 / var_30_41)

				if var_30_43 > 0 and var_30_37 < var_30_43 then
					arg_27_1.talkMaxDuration = var_30_43

					if var_30_43 + var_30_36 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_43 + var_30_36
					end
				end

				arg_27_1.text_.text = var_30_40
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072007", "story_v_out_120072.awb") ~= 0 then
					local var_30_44 = manager.audio:GetVoiceLength("story_v_out_120072", "120072007", "story_v_out_120072.awb") / 1000

					if var_30_44 + var_30_36 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_44 + var_30_36
					end

					if var_30_39.prefab_name ~= "" and arg_27_1.actors_[var_30_39.prefab_name] ~= nil then
						local var_30_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_39.prefab_name].transform, "story_v_out_120072", "120072007", "story_v_out_120072.awb")

						arg_27_1:RecordAudio("120072007", var_30_45)
						arg_27_1:RecordAudio("120072007", var_30_45)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_120072", "120072007", "story_v_out_120072.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_120072", "120072007", "story_v_out_120072.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_46 = math.max(var_30_37, arg_27_1.talkMaxDuration)

			if var_30_36 <= arg_27_1.time_ and arg_27_1.time_ < var_30_36 + var_30_46 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_36) / var_30_46

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_36 + var_30_46 and arg_27_1.time_ < var_30_36 + var_30_46 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120072008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120072008
		arg_31_1.duration_ = 4.233

		local var_31_0 = {
			zh = 3.533,
			ja = 4.233
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
				arg_31_0:Play120072009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_34_1 = arg_31_1.actors_["10044ui_story"]
			local var_34_2 = 0

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10044ui_story == nil then
				arg_31_1.var_.characterEffect10044ui_story = var_34_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_3 = 0.2

			if var_34_2 <= arg_31_1.time_ and arg_31_1.time_ < var_34_2 + var_34_3 then
				local var_34_4 = (arg_31_1.time_ - var_34_2) / var_34_3

				if arg_31_1.var_.characterEffect10044ui_story then
					local var_34_5 = Mathf.Lerp(0, 0.5, var_34_4)

					arg_31_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10044ui_story.fillRatio = var_34_5
				end
			end

			if arg_31_1.time_ >= var_34_2 + var_34_3 and arg_31_1.time_ < var_34_2 + var_34_3 + arg_34_0 and arg_31_1.var_.characterEffect10044ui_story then
				local var_34_6 = 0.5

				arg_31_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10044ui_story.fillRatio = var_34_6
			end

			local var_34_7 = arg_31_1.actors_["1184ui_story"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story == nil then
				arg_31_1.var_.characterEffect1184ui_story = var_34_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_9 = 0.2

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.characterEffect1184ui_story then
					arg_31_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story then
				arg_31_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_34_11 = 0
			local var_34_12 = 0.475

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_13 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_14 = arg_31_1:GetWordFromCfg(120072008)
				local var_34_15 = arg_31_1:FormatText(var_34_14.content)

				arg_31_1.text_.text = var_34_15

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_16 = 19
				local var_34_17 = utf8.len(var_34_15)
				local var_34_18 = var_34_16 <= 0 and var_34_12 or var_34_12 * (var_34_17 / var_34_16)

				if var_34_18 > 0 and var_34_12 < var_34_18 then
					arg_31_1.talkMaxDuration = var_34_18

					if var_34_18 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_11
					end
				end

				arg_31_1.text_.text = var_34_15
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072008", "story_v_out_120072.awb") ~= 0 then
					local var_34_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072008", "story_v_out_120072.awb") / 1000

					if var_34_19 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_11
					end

					if var_34_14.prefab_name ~= "" and arg_31_1.actors_[var_34_14.prefab_name] ~= nil then
						local var_34_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_14.prefab_name].transform, "story_v_out_120072", "120072008", "story_v_out_120072.awb")

						arg_31_1:RecordAudio("120072008", var_34_20)
						arg_31_1:RecordAudio("120072008", var_34_20)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120072", "120072008", "story_v_out_120072.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120072", "120072008", "story_v_out_120072.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_21 = math.max(var_34_12, arg_31_1.talkMaxDuration)

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_21 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_11) / var_34_21

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_11 + var_34_21 and arg_31_1.time_ < var_34_11 + var_34_21 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120072009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120072009
		arg_35_1.duration_ = 4.466

		local var_35_0 = {
			zh = 3,
			ja = 4.466
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
				arg_35_0:Play120072010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_38_1 = arg_35_1.actors_["10044ui_story"]
			local var_38_2 = 0

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect10044ui_story == nil then
				arg_35_1.var_.characterEffect10044ui_story = var_38_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_3 = 0.2

			if var_38_2 <= arg_35_1.time_ and arg_35_1.time_ < var_38_2 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_2) / var_38_3

				if arg_35_1.var_.characterEffect10044ui_story then
					arg_35_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_2 + var_38_3 and arg_35_1.time_ < var_38_2 + var_38_3 + arg_38_0 and arg_35_1.var_.characterEffect10044ui_story then
				arg_35_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_38_5 = arg_35_1.actors_["1184ui_story"]
			local var_38_6 = 0

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story == nil then
				arg_35_1.var_.characterEffect1184ui_story = var_38_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_7 = 0.2

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_7 then
				local var_38_8 = (arg_35_1.time_ - var_38_6) / var_38_7

				if arg_35_1.var_.characterEffect1184ui_story then
					local var_38_9 = Mathf.Lerp(0, 0.5, var_38_8)

					arg_35_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1184ui_story.fillRatio = var_38_9
				end
			end

			if arg_35_1.time_ >= var_38_6 + var_38_7 and arg_35_1.time_ < var_38_6 + var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story then
				local var_38_10 = 0.5

				arg_35_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1184ui_story.fillRatio = var_38_10
			end

			local var_38_11 = 0
			local var_38_12 = 0.325

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_13 = arg_35_1:FormatText(StoryNameCfg[380].name)

				arg_35_1.leftNameTxt_.text = var_38_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_14 = arg_35_1:GetWordFromCfg(120072009)
				local var_38_15 = arg_35_1:FormatText(var_38_14.content)

				arg_35_1.text_.text = var_38_15

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_16 = 13
				local var_38_17 = utf8.len(var_38_15)
				local var_38_18 = var_38_16 <= 0 and var_38_12 or var_38_12 * (var_38_17 / var_38_16)

				if var_38_18 > 0 and var_38_12 < var_38_18 then
					arg_35_1.talkMaxDuration = var_38_18

					if var_38_18 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_11
					end
				end

				arg_35_1.text_.text = var_38_15
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072009", "story_v_out_120072.awb") ~= 0 then
					local var_38_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072009", "story_v_out_120072.awb") / 1000

					if var_38_19 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_11
					end

					if var_38_14.prefab_name ~= "" and arg_35_1.actors_[var_38_14.prefab_name] ~= nil then
						local var_38_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_14.prefab_name].transform, "story_v_out_120072", "120072009", "story_v_out_120072.awb")

						arg_35_1:RecordAudio("120072009", var_38_20)
						arg_35_1:RecordAudio("120072009", var_38_20)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_120072", "120072009", "story_v_out_120072.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_120072", "120072009", "story_v_out_120072.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_21 = math.max(var_38_12, arg_35_1.talkMaxDuration)

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_21 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_11) / var_38_21

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_11 + var_38_21 and arg_35_1.time_ < var_38_11 + var_38_21 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120072010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120072010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play120072011(arg_39_1)
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

			local var_42_9 = arg_39_1.actors_["1184ui_story"].transform
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1.var_.moveOldPos1184ui_story = var_42_9.localPosition
			end

			local var_42_11 = 0.001

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11
				local var_42_13 = Vector3.New(0, 100, 0)

				var_42_9.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1184ui_story, var_42_13, var_42_12)

				local var_42_14 = manager.ui.mainCamera.transform.position - var_42_9.position

				var_42_9.forward = Vector3.New(var_42_14.x, var_42_14.y, var_42_14.z)

				local var_42_15 = var_42_9.localEulerAngles

				var_42_15.z = 0
				var_42_15.x = 0
				var_42_9.localEulerAngles = var_42_15
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 then
				var_42_9.localPosition = Vector3.New(0, 100, 0)

				local var_42_16 = manager.ui.mainCamera.transform.position - var_42_9.position

				var_42_9.forward = Vector3.New(var_42_16.x, var_42_16.y, var_42_16.z)

				local var_42_17 = var_42_9.localEulerAngles

				var_42_17.z = 0
				var_42_17.x = 0
				var_42_9.localEulerAngles = var_42_17
			end

			local var_42_18 = manager.ui.mainCamera.transform
			local var_42_19 = 0

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.var_.shakeOldPos = var_42_18.localPosition
			end

			local var_42_20 = 0.6

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / 0.066
				local var_42_22, var_42_23 = math.modf(var_42_21)

				var_42_18.localPosition = Vector3.New(var_42_23 * 0.13, var_42_23 * 0.13, var_42_23 * 0.13) + arg_39_1.var_.shakeOldPos
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 then
				var_42_18.localPosition = arg_39_1.var_.shakeOldPos
			end

			local var_42_24 = 0

			if var_42_24 < arg_39_1.time_ and arg_39_1.time_ <= var_42_24 + arg_42_0 then
				arg_39_1.allBtn_.enabled = false
			end

			local var_42_25 = 0.6

			if arg_39_1.time_ >= var_42_24 + var_42_25 and arg_39_1.time_ < var_42_24 + var_42_25 + arg_42_0 then
				arg_39_1.allBtn_.enabled = true
			end

			local var_42_26 = 0
			local var_42_27 = 0.6

			if var_42_26 < arg_39_1.time_ and arg_39_1.time_ <= var_42_26 + arg_42_0 then
				local var_42_28 = "play"
				local var_42_29 = "effect"

				arg_39_1:AudioAction(var_42_28, var_42_29, "se_story_17", "se_story_17_boss_hawk1", "")
			end

			local var_42_30 = 0
			local var_42_31 = 0.15

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[68].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3041")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(120072010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 6
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_38 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_38 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_38

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_38 and arg_39_1.time_ < var_42_30 + var_42_38 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120072011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120072011
		arg_43_1.duration_ = 2.366

		local var_43_0 = {
			zh = 1.9,
			ja = 2.366
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
				arg_43_0:Play120072012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.15

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[6].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(120072011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072011", "story_v_out_120072.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_120072", "120072011", "story_v_out_120072.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_120072", "120072011", "story_v_out_120072.awb")

						arg_43_1:RecordAudio("120072011", var_46_9)
						arg_43_1:RecordAudio("120072011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120072", "120072011", "story_v_out_120072.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120072", "120072011", "story_v_out_120072.awb")
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
	Play120072012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120072012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play120072013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = manager.ui.mainCamera.transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.shakeOldPos = var_50_0.localPosition
			end

			local var_50_2 = 0.6

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / 0.066
				local var_50_4, var_50_5 = math.modf(var_50_3)

				var_50_0.localPosition = Vector3.New(var_50_5 * 0.13, var_50_5 * 0.13, var_50_5 * 0.13) + arg_47_1.var_.shakeOldPos
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = arg_47_1.var_.shakeOldPos
			end

			local var_50_6 = 0

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.allBtn_.enabled = false
			end

			local var_50_7 = 0.6

			if arg_47_1.time_ >= var_50_6 + var_50_7 and arg_47_1.time_ < var_50_6 + var_50_7 + arg_50_0 then
				arg_47_1.allBtn_.enabled = true
			end

			local var_50_8 = 0
			local var_50_9 = 1

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 then
				local var_50_10 = "play"
				local var_50_11 = "effect"

				arg_47_1:AudioAction(var_50_10, var_50_11, "se_story_16", "se_story_16_metal03", "")
			end

			local var_50_12 = 0.0333333333333333
			local var_50_13 = 1

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				local var_50_14 = "play"
				local var_50_15 = "effect"

				arg_47_1:AudioAction(var_50_14, var_50_15, "se_story_16", "se_story_16_smash02", "")
			end

			local var_50_16 = 0
			local var_50_17 = 0.05

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(120072012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 2
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_17 or var_50_17 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_17 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_16 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_16
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_23 = math.max(var_50_17, arg_47_1.talkMaxDuration)

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_23 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_16) / var_50_23

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_16 + var_50_23 and arg_47_1.time_ < var_50_16 + var_50_23 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120072013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120072013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120072014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.9

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

				local var_54_2 = arg_51_1:GetWordFromCfg(120072013)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 36
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
	Play120072014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120072014
		arg_55_1.duration_ = 4.733

		local var_55_0 = {
			zh = 2.933,
			ja = 4.733
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
				arg_55_0:Play120072015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1184ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1184ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(-0.7, -0.97, -6)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1184ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = 0

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 then
				arg_55_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_58_11 = arg_55_1.actors_["1184ui_story"]
			local var_58_12 = 0

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 and arg_55_1.var_.characterEffect1184ui_story == nil then
				arg_55_1.var_.characterEffect1184ui_story = var_58_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_13 = 0.2

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_13 then
				local var_58_14 = (arg_55_1.time_ - var_58_12) / var_58_13

				if arg_55_1.var_.characterEffect1184ui_story then
					arg_55_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_12 + var_58_13 and arg_55_1.time_ < var_58_12 + var_58_13 + arg_58_0 and arg_55_1.var_.characterEffect1184ui_story then
				arg_55_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_58_15 = arg_55_1.actors_["10044ui_story"].transform
			local var_58_16 = 0

			if var_58_16 < arg_55_1.time_ and arg_55_1.time_ <= var_58_16 + arg_58_0 then
				arg_55_1.var_.moveOldPos10044ui_story = var_58_15.localPosition
			end

			local var_58_17 = 0.001

			if var_58_16 <= arg_55_1.time_ and arg_55_1.time_ < var_58_16 + var_58_17 then
				local var_58_18 = (arg_55_1.time_ - var_58_16) / var_58_17
				local var_58_19 = Vector3.New(0.7, -0.72, -6.3)

				var_58_15.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10044ui_story, var_58_19, var_58_18)

				local var_58_20 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_20.x, var_58_20.y, var_58_20.z)

				local var_58_21 = var_58_15.localEulerAngles

				var_58_21.z = 0
				var_58_21.x = 0
				var_58_15.localEulerAngles = var_58_21
			end

			if arg_55_1.time_ >= var_58_16 + var_58_17 and arg_55_1.time_ < var_58_16 + var_58_17 + arg_58_0 then
				var_58_15.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_58_22 = manager.ui.mainCamera.transform.position - var_58_15.position

				var_58_15.forward = Vector3.New(var_58_22.x, var_58_22.y, var_58_22.z)

				local var_58_23 = var_58_15.localEulerAngles

				var_58_23.z = 0
				var_58_23.x = 0
				var_58_15.localEulerAngles = var_58_23
			end

			local var_58_24 = arg_55_1.actors_["10044ui_story"]
			local var_58_25 = 0

			if var_58_25 < arg_55_1.time_ and arg_55_1.time_ <= var_58_25 + arg_58_0 and arg_55_1.var_.characterEffect10044ui_story == nil then
				arg_55_1.var_.characterEffect10044ui_story = var_58_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_26 = 0.0166666666666667

			if var_58_25 <= arg_55_1.time_ and arg_55_1.time_ < var_58_25 + var_58_26 then
				local var_58_27 = (arg_55_1.time_ - var_58_25) / var_58_26

				if arg_55_1.var_.characterEffect10044ui_story then
					local var_58_28 = Mathf.Lerp(0, 0.5, var_58_27)

					arg_55_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_55_1.var_.characterEffect10044ui_story.fillRatio = var_58_28
				end
			end

			if arg_55_1.time_ >= var_58_25 + var_58_26 and arg_55_1.time_ < var_58_25 + var_58_26 + arg_58_0 and arg_55_1.var_.characterEffect10044ui_story then
				local var_58_29 = 0.5

				arg_55_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_55_1.var_.characterEffect10044ui_story.fillRatio = var_58_29
			end

			local var_58_30 = 0

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_58_31 = 0
			local var_58_32 = 0.1

			if var_58_31 < arg_55_1.time_ and arg_55_1.time_ <= var_58_31 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_33 = arg_55_1:FormatText(StoryNameCfg[6].name)

				arg_55_1.leftNameTxt_.text = var_58_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_34 = arg_55_1:GetWordFromCfg(120072014)
				local var_58_35 = arg_55_1:FormatText(var_58_34.content)

				arg_55_1.text_.text = var_58_35

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_36 = 4
				local var_58_37 = utf8.len(var_58_35)
				local var_58_38 = var_58_36 <= 0 and var_58_32 or var_58_32 * (var_58_37 / var_58_36)

				if var_58_38 > 0 and var_58_32 < var_58_38 then
					arg_55_1.talkMaxDuration = var_58_38

					if var_58_38 + var_58_31 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_38 + var_58_31
					end
				end

				arg_55_1.text_.text = var_58_35
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072014", "story_v_out_120072.awb") ~= 0 then
					local var_58_39 = manager.audio:GetVoiceLength("story_v_out_120072", "120072014", "story_v_out_120072.awb") / 1000

					if var_58_39 + var_58_31 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_39 + var_58_31
					end

					if var_58_34.prefab_name ~= "" and arg_55_1.actors_[var_58_34.prefab_name] ~= nil then
						local var_58_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_34.prefab_name].transform, "story_v_out_120072", "120072014", "story_v_out_120072.awb")

						arg_55_1:RecordAudio("120072014", var_58_40)
						arg_55_1:RecordAudio("120072014", var_58_40)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_120072", "120072014", "story_v_out_120072.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_120072", "120072014", "story_v_out_120072.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_41 = math.max(var_58_32, arg_55_1.talkMaxDuration)

			if var_58_31 <= arg_55_1.time_ and arg_55_1.time_ < var_58_31 + var_58_41 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_31) / var_58_41

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_31 + var_58_41 and arg_55_1.time_ < var_58_31 + var_58_41 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120072015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120072015
		arg_59_1.duration_ = 2.733

		local var_59_0 = {
			zh = 2.566,
			ja = 2.733
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
				arg_59_0:Play120072016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1184ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1184ui_story == nil then
				arg_59_1.var_.characterEffect1184ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1184ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1184ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1184ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1184ui_story.fillRatio = var_62_5
			end

			local var_62_6 = arg_59_1.actors_["10044ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect10044ui_story == nil then
				arg_59_1.var_.characterEffect10044ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.2

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect10044ui_story then
					arg_59_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect10044ui_story then
				arg_59_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_62_12 = 0
			local var_62_13 = 0.3

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[380].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(120072015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072015", "story_v_out_120072.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_120072", "120072015", "story_v_out_120072.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_120072", "120072015", "story_v_out_120072.awb")

						arg_59_1:RecordAudio("120072015", var_62_21)
						arg_59_1:RecordAudio("120072015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_120072", "120072015", "story_v_out_120072.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_120072", "120072015", "story_v_out_120072.awb")
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
	Play120072016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120072016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play120072017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10044ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect10044ui_story == nil then
				arg_63_1.var_.characterEffect10044ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect10044ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_63_1.var_.characterEffect10044ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10044ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_63_1.var_.characterEffect10044ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.825

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

				local var_66_8 = arg_63_1:GetWordFromCfg(120072016)
				local var_66_9 = arg_63_1:FormatText(var_66_8.content)

				arg_63_1.text_.text = var_66_9

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_10 = 33
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
	Play120072017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120072017
		arg_67_1.duration_ = 4.8

		local var_67_0 = {
			zh = 2.6,
			ja = 4.8
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
				arg_67_0:Play120072018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_70_1 = arg_67_1.actors_["1184ui_story"]
			local var_70_2 = 0

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1184ui_story == nil then
				arg_67_1.var_.characterEffect1184ui_story = var_70_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_3 = 0.2

			if var_70_2 <= arg_67_1.time_ and arg_67_1.time_ < var_70_2 + var_70_3 then
				local var_70_4 = (arg_67_1.time_ - var_70_2) / var_70_3

				if arg_67_1.var_.characterEffect1184ui_story then
					arg_67_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_2 + var_70_3 and arg_67_1.time_ < var_70_2 + var_70_3 + arg_70_0 and arg_67_1.var_.characterEffect1184ui_story then
				arg_67_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_70_5 = 0
			local var_70_6 = 0.225

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_7 = arg_67_1:FormatText(StoryNameCfg[6].name)

				arg_67_1.leftNameTxt_.text = var_70_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_8 = arg_67_1:GetWordFromCfg(120072017)
				local var_70_9 = arg_67_1:FormatText(var_70_8.content)

				arg_67_1.text_.text = var_70_9

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_10 = 9
				local var_70_11 = utf8.len(var_70_9)
				local var_70_12 = var_70_10 <= 0 and var_70_6 or var_70_6 * (var_70_11 / var_70_10)

				if var_70_12 > 0 and var_70_6 < var_70_12 then
					arg_67_1.talkMaxDuration = var_70_12

					if var_70_12 + var_70_5 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_12 + var_70_5
					end
				end

				arg_67_1.text_.text = var_70_9
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072017", "story_v_out_120072.awb") ~= 0 then
					local var_70_13 = manager.audio:GetVoiceLength("story_v_out_120072", "120072017", "story_v_out_120072.awb") / 1000

					if var_70_13 + var_70_5 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_5
					end

					if var_70_8.prefab_name ~= "" and arg_67_1.actors_[var_70_8.prefab_name] ~= nil then
						local var_70_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_8.prefab_name].transform, "story_v_out_120072", "120072017", "story_v_out_120072.awb")

						arg_67_1:RecordAudio("120072017", var_70_14)
						arg_67_1:RecordAudio("120072017", var_70_14)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_120072", "120072017", "story_v_out_120072.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_120072", "120072017", "story_v_out_120072.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_15 = math.max(var_70_6, arg_67_1.talkMaxDuration)

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_15 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_5) / var_70_15

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_5 + var_70_15 and arg_67_1.time_ < var_70_5 + var_70_15 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play120072018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120072018
		arg_71_1.duration_ = 5

		local var_71_0 = {
			zh = 3.866,
			ja = 5
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
				arg_71_0:Play120072019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1184ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1184ui_story == nil then
				arg_71_1.var_.characterEffect1184ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1184ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1184ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1184ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1184ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_74_7 = arg_71_1.actors_["10044ui_story"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.characterEffect10044ui_story == nil then
				arg_71_1.var_.characterEffect10044ui_story = var_74_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_9 = 0.2

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.characterEffect10044ui_story then
					arg_71_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.characterEffect10044ui_story then
				arg_71_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_74_12 = 0
			local var_74_13 = 0.575

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[380].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(120072018)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 23
				local var_74_18 = utf8.len(var_74_16)
				local var_74_19 = var_74_17 <= 0 and var_74_13 or var_74_13 * (var_74_18 / var_74_17)

				if var_74_19 > 0 and var_74_13 < var_74_19 then
					arg_71_1.talkMaxDuration = var_74_19

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_16
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072018", "story_v_out_120072.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_120072", "120072018", "story_v_out_120072.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_120072", "120072018", "story_v_out_120072.awb")

						arg_71_1:RecordAudio("120072018", var_74_21)
						arg_71_1:RecordAudio("120072018", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_120072", "120072018", "story_v_out_120072.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_120072", "120072018", "story_v_out_120072.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_22 and arg_71_1.time_ < var_74_12 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play120072019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120072019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play120072020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1184ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1184ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1184ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, 100, 0)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["10044ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos10044ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10044ui_story, var_78_13, var_78_12)

				local var_78_14 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_14.x, var_78_14.y, var_78_14.z)

				local var_78_15 = var_78_9.localEulerAngles

				var_78_15.z = 0
				var_78_15.x = 0
				var_78_9.localEulerAngles = var_78_15
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 then
				var_78_9.localPosition = Vector3.New(0, 100, 0)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_9.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_9.localEulerAngles = var_78_17
			end

			local var_78_18 = 0
			local var_78_19 = 0.775

			if var_78_18 < arg_75_1.time_ and arg_75_1.time_ <= var_78_18 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_20 = arg_75_1:GetWordFromCfg(120072019)
				local var_78_21 = arg_75_1:FormatText(var_78_20.content)

				arg_75_1.text_.text = var_78_21

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_22 = 31
				local var_78_23 = utf8.len(var_78_21)
				local var_78_24 = var_78_22 <= 0 and var_78_19 or var_78_19 * (var_78_23 / var_78_22)

				if var_78_24 > 0 and var_78_19 < var_78_24 then
					arg_75_1.talkMaxDuration = var_78_24

					if var_78_24 + var_78_18 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_24 + var_78_18
					end
				end

				arg_75_1.text_.text = var_78_21
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_19, arg_75_1.talkMaxDuration)

			if var_78_18 <= arg_75_1.time_ and arg_75_1.time_ < var_78_18 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_18) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_18 + var_78_25 and arg_75_1.time_ < var_78_18 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play120072020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120072020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play120072021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.05

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[385].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3041")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(120072020)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 2
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
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_8 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_8 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_8

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_8 and arg_79_1.time_ < var_82_0 + var_82_8 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play120072021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120072021
		arg_83_1.duration_ = 5.333

		local var_83_0 = {
			zh = 4.966,
			ja = 5.333
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
				arg_83_0:Play120072022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1184ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1184ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(-0.7, -0.97, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1184ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = 0

			if var_86_9 < arg_83_1.time_ and arg_83_1.time_ <= var_86_9 + arg_86_0 then
				arg_83_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_86_11 = arg_83_1.actors_["1184ui_story"]
			local var_86_12 = 0

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 and arg_83_1.var_.characterEffect1184ui_story == nil then
				arg_83_1.var_.characterEffect1184ui_story = var_86_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_13 = 0.2

			if var_86_12 <= arg_83_1.time_ and arg_83_1.time_ < var_86_12 + var_86_13 then
				local var_86_14 = (arg_83_1.time_ - var_86_12) / var_86_13

				if arg_83_1.var_.characterEffect1184ui_story then
					arg_83_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_12 + var_86_13 and arg_83_1.time_ < var_86_12 + var_86_13 + arg_86_0 and arg_83_1.var_.characterEffect1184ui_story then
				arg_83_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_86_15 = arg_83_1.actors_["10044ui_story"].transform
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.var_.moveOldPos10044ui_story = var_86_15.localPosition
			end

			local var_86_17 = 0.001

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17
				local var_86_19 = Vector3.New(0.7, -0.72, -6.3)

				var_86_15.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10044ui_story, var_86_19, var_86_18)

				local var_86_20 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_20.x, var_86_20.y, var_86_20.z)

				local var_86_21 = var_86_15.localEulerAngles

				var_86_21.z = 0
				var_86_21.x = 0
				var_86_15.localEulerAngles = var_86_21
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				var_86_15.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_86_22 = manager.ui.mainCamera.transform.position - var_86_15.position

				var_86_15.forward = Vector3.New(var_86_22.x, var_86_22.y, var_86_22.z)

				local var_86_23 = var_86_15.localEulerAngles

				var_86_23.z = 0
				var_86_23.x = 0
				var_86_15.localEulerAngles = var_86_23
			end

			local var_86_24 = arg_83_1.actors_["10044ui_story"]
			local var_86_25 = 0

			if var_86_25 < arg_83_1.time_ and arg_83_1.time_ <= var_86_25 + arg_86_0 and arg_83_1.var_.characterEffect10044ui_story == nil then
				arg_83_1.var_.characterEffect10044ui_story = var_86_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_26 = 0.0166666666666667

			if var_86_25 <= arg_83_1.time_ and arg_83_1.time_ < var_86_25 + var_86_26 then
				local var_86_27 = (arg_83_1.time_ - var_86_25) / var_86_26

				if arg_83_1.var_.characterEffect10044ui_story then
					local var_86_28 = Mathf.Lerp(0, 0.5, var_86_27)

					arg_83_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_83_1.var_.characterEffect10044ui_story.fillRatio = var_86_28
				end
			end

			if arg_83_1.time_ >= var_86_25 + var_86_26 and arg_83_1.time_ < var_86_25 + var_86_26 + arg_86_0 and arg_83_1.var_.characterEffect10044ui_story then
				local var_86_29 = 0.5

				arg_83_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_83_1.var_.characterEffect10044ui_story.fillRatio = var_86_29
			end

			local var_86_30 = 0

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_86_31 = 0
			local var_86_32 = 0.475

			if var_86_31 < arg_83_1.time_ and arg_83_1.time_ <= var_86_31 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_33 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_34 = arg_83_1:GetWordFromCfg(120072021)
				local var_86_35 = arg_83_1:FormatText(var_86_34.content)

				arg_83_1.text_.text = var_86_35

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_36 = 19
				local var_86_37 = utf8.len(var_86_35)
				local var_86_38 = var_86_36 <= 0 and var_86_32 or var_86_32 * (var_86_37 / var_86_36)

				if var_86_38 > 0 and var_86_32 < var_86_38 then
					arg_83_1.talkMaxDuration = var_86_38

					if var_86_38 + var_86_31 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_38 + var_86_31
					end
				end

				arg_83_1.text_.text = var_86_35
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072021", "story_v_out_120072.awb") ~= 0 then
					local var_86_39 = manager.audio:GetVoiceLength("story_v_out_120072", "120072021", "story_v_out_120072.awb") / 1000

					if var_86_39 + var_86_31 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_39 + var_86_31
					end

					if var_86_34.prefab_name ~= "" and arg_83_1.actors_[var_86_34.prefab_name] ~= nil then
						local var_86_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_34.prefab_name].transform, "story_v_out_120072", "120072021", "story_v_out_120072.awb")

						arg_83_1:RecordAudio("120072021", var_86_40)
						arg_83_1:RecordAudio("120072021", var_86_40)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_120072", "120072021", "story_v_out_120072.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_120072", "120072021", "story_v_out_120072.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_41 = math.max(var_86_32, arg_83_1.talkMaxDuration)

			if var_86_31 <= arg_83_1.time_ and arg_83_1.time_ < var_86_31 + var_86_41 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_31) / var_86_41

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_31 + var_86_41 and arg_83_1.time_ < var_86_31 + var_86_41 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play120072022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 120072022
		arg_87_1.duration_ = 2.933

		local var_87_0 = {
			zh = 2.233,
			ja = 2.933
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
				arg_87_0:Play120072023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1184ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1184ui_story == nil then
				arg_87_1.var_.characterEffect1184ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1184ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1184ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1184ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1184ui_story.fillRatio = var_90_5
			end

			local var_90_6 = arg_87_1.actors_["10044ui_story"]
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 and arg_87_1.var_.characterEffect10044ui_story == nil then
				arg_87_1.var_.characterEffect10044ui_story = var_90_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_8 = 0.2

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8

				if arg_87_1.var_.characterEffect10044ui_story then
					arg_87_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 and arg_87_1.var_.characterEffect10044ui_story then
				arg_87_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_90_11 = 0
			local var_90_12 = 0.175

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_13 = arg_87_1:FormatText(StoryNameCfg[380].name)

				arg_87_1.leftNameTxt_.text = var_90_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_14 = arg_87_1:GetWordFromCfg(120072022)
				local var_90_15 = arg_87_1:FormatText(var_90_14.content)

				arg_87_1.text_.text = var_90_15

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_16 = 7
				local var_90_17 = utf8.len(var_90_15)
				local var_90_18 = var_90_16 <= 0 and var_90_12 or var_90_12 * (var_90_17 / var_90_16)

				if var_90_18 > 0 and var_90_12 < var_90_18 then
					arg_87_1.talkMaxDuration = var_90_18

					if var_90_18 + var_90_11 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_18 + var_90_11
					end
				end

				arg_87_1.text_.text = var_90_15
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072022", "story_v_out_120072.awb") ~= 0 then
					local var_90_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072022", "story_v_out_120072.awb") / 1000

					if var_90_19 + var_90_11 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_19 + var_90_11
					end

					if var_90_14.prefab_name ~= "" and arg_87_1.actors_[var_90_14.prefab_name] ~= nil then
						local var_90_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_14.prefab_name].transform, "story_v_out_120072", "120072022", "story_v_out_120072.awb")

						arg_87_1:RecordAudio("120072022", var_90_20)
						arg_87_1:RecordAudio("120072022", var_90_20)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_120072", "120072022", "story_v_out_120072.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_120072", "120072022", "story_v_out_120072.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_21 = math.max(var_90_12, arg_87_1.talkMaxDuration)

			if var_90_11 <= arg_87_1.time_ and arg_87_1.time_ < var_90_11 + var_90_21 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_11) / var_90_21

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_11 + var_90_21 and arg_87_1.time_ < var_90_11 + var_90_21 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play120072023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 120072023
		arg_91_1.duration_ = 3.033

		local var_91_0 = {
			zh = 2.333,
			ja = 3.033
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
				arg_91_0:Play120072024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_94_1 = 0
			local var_94_2 = 0.3

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_3 = arg_91_1:FormatText(StoryNameCfg[380].name)

				arg_91_1.leftNameTxt_.text = var_94_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_4 = arg_91_1:GetWordFromCfg(120072023)
				local var_94_5 = arg_91_1:FormatText(var_94_4.content)

				arg_91_1.text_.text = var_94_5

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_6 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072023", "story_v_out_120072.awb") ~= 0 then
					local var_94_9 = manager.audio:GetVoiceLength("story_v_out_120072", "120072023", "story_v_out_120072.awb") / 1000

					if var_94_9 + var_94_1 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_9 + var_94_1
					end

					if var_94_4.prefab_name ~= "" and arg_91_1.actors_[var_94_4.prefab_name] ~= nil then
						local var_94_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_4.prefab_name].transform, "story_v_out_120072", "120072023", "story_v_out_120072.awb")

						arg_91_1:RecordAudio("120072023", var_94_10)
						arg_91_1:RecordAudio("120072023", var_94_10)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_120072", "120072023", "story_v_out_120072.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_120072", "120072023", "story_v_out_120072.awb")
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
	Play120072024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 120072024
		arg_95_1.duration_ = 5

		local var_95_0 = {
			zh = 4.8,
			ja = 5
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
				arg_95_0:Play120072025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4133")
			end

			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_98_2 = arg_95_1.actors_["1184ui_story"]
			local var_98_3 = 0

			if var_98_3 < arg_95_1.time_ and arg_95_1.time_ <= var_98_3 + arg_98_0 and arg_95_1.var_.characterEffect1184ui_story == nil then
				arg_95_1.var_.characterEffect1184ui_story = var_98_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_4 = 0.2

			if var_98_3 <= arg_95_1.time_ and arg_95_1.time_ < var_98_3 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_3) / var_98_4

				if arg_95_1.var_.characterEffect1184ui_story then
					arg_95_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_3 + var_98_4 and arg_95_1.time_ < var_98_3 + var_98_4 + arg_98_0 and arg_95_1.var_.characterEffect1184ui_story then
				arg_95_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_98_6 = arg_95_1.actors_["10044ui_story"]
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 and arg_95_1.var_.characterEffect10044ui_story == nil then
				arg_95_1.var_.characterEffect10044ui_story = var_98_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_8 = 0.2

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8

				if arg_95_1.var_.characterEffect10044ui_story then
					local var_98_10 = Mathf.Lerp(0, 0.5, var_98_9)

					arg_95_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10044ui_story.fillRatio = var_98_10
				end
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 and arg_95_1.var_.characterEffect10044ui_story then
				local var_98_11 = 0.5

				arg_95_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10044ui_story.fillRatio = var_98_11
			end

			local var_98_12 = 0
			local var_98_13 = 0.65

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_14 = arg_95_1:FormatText(StoryNameCfg[6].name)

				arg_95_1.leftNameTxt_.text = var_98_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_15 = arg_95_1:GetWordFromCfg(120072024)
				local var_98_16 = arg_95_1:FormatText(var_98_15.content)

				arg_95_1.text_.text = var_98_16

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_17 = 26
				local var_98_18 = utf8.len(var_98_16)
				local var_98_19 = var_98_17 <= 0 and var_98_13 or var_98_13 * (var_98_18 / var_98_17)

				if var_98_19 > 0 and var_98_13 < var_98_19 then
					arg_95_1.talkMaxDuration = var_98_19

					if var_98_19 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_19 + var_98_12
					end
				end

				arg_95_1.text_.text = var_98_16
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072024", "story_v_out_120072.awb") ~= 0 then
					local var_98_20 = manager.audio:GetVoiceLength("story_v_out_120072", "120072024", "story_v_out_120072.awb") / 1000

					if var_98_20 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_12
					end

					if var_98_15.prefab_name ~= "" and arg_95_1.actors_[var_98_15.prefab_name] ~= nil then
						local var_98_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_15.prefab_name].transform, "story_v_out_120072", "120072024", "story_v_out_120072.awb")

						arg_95_1:RecordAudio("120072024", var_98_21)
						arg_95_1:RecordAudio("120072024", var_98_21)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_120072", "120072024", "story_v_out_120072.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_120072", "120072024", "story_v_out_120072.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_22 = math.max(var_98_13, arg_95_1.talkMaxDuration)

			if var_98_12 <= arg_95_1.time_ and arg_95_1.time_ < var_98_12 + var_98_22 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_12) / var_98_22

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_12 + var_98_22 and arg_95_1.time_ < var_98_12 + var_98_22 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play120072025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120072025
		arg_99_1.duration_ = 8.433

		local var_99_0 = {
			zh = 4.333,
			ja = 8.433
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
				arg_99_0:Play120072026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1184ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1184ui_story == nil then
				arg_99_1.var_.characterEffect1184ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1184ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1184ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1184ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1184ui_story.fillRatio = var_102_5
			end

			local var_102_6 = arg_99_1.actors_["10044ui_story"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.characterEffect10044ui_story == nil then
				arg_99_1.var_.characterEffect10044ui_story = var_102_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_8 = 0.2

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.characterEffect10044ui_story then
					arg_99_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect10044ui_story then
				arg_99_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_102_11 = 0
			local var_102_12 = 0.575

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_13 = arg_99_1:FormatText(StoryNameCfg[380].name)

				arg_99_1.leftNameTxt_.text = var_102_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_14 = arg_99_1:GetWordFromCfg(120072025)
				local var_102_15 = arg_99_1:FormatText(var_102_14.content)

				arg_99_1.text_.text = var_102_15

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_16 = 23
				local var_102_17 = utf8.len(var_102_15)
				local var_102_18 = var_102_16 <= 0 and var_102_12 or var_102_12 * (var_102_17 / var_102_16)

				if var_102_18 > 0 and var_102_12 < var_102_18 then
					arg_99_1.talkMaxDuration = var_102_18

					if var_102_18 + var_102_11 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_18 + var_102_11
					end
				end

				arg_99_1.text_.text = var_102_15
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072025", "story_v_out_120072.awb") ~= 0 then
					local var_102_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072025", "story_v_out_120072.awb") / 1000

					if var_102_19 + var_102_11 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_11
					end

					if var_102_14.prefab_name ~= "" and arg_99_1.actors_[var_102_14.prefab_name] ~= nil then
						local var_102_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_14.prefab_name].transform, "story_v_out_120072", "120072025", "story_v_out_120072.awb")

						arg_99_1:RecordAudio("120072025", var_102_20)
						arg_99_1:RecordAudio("120072025", var_102_20)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_120072", "120072025", "story_v_out_120072.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_120072", "120072025", "story_v_out_120072.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_21 = math.max(var_102_12, arg_99_1.talkMaxDuration)

			if var_102_11 <= arg_99_1.time_ and arg_99_1.time_ < var_102_11 + var_102_21 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_11) / var_102_21

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_11 + var_102_21 and arg_99_1.time_ < var_102_11 + var_102_21 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play120072026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 120072026
		arg_103_1.duration_ = 10.466

		local var_103_0 = {
			zh = 2.666,
			ja = 10.466
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
				arg_103_0:Play120072027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1184ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1184ui_story == nil then
				arg_103_1.var_.characterEffect1184ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1184ui_story then
					arg_103_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1184ui_story then
				arg_103_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["10044ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect10044ui_story == nil then
				arg_103_1.var_.characterEffect10044ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.2

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect10044ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10044ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect10044ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10044ui_story.fillRatio = var_106_9
			end

			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_106_11 = 0
			local var_106_12 = 0.3

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_13 = arg_103_1:FormatText(StoryNameCfg[6].name)

				arg_103_1.leftNameTxt_.text = var_106_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_14 = arg_103_1:GetWordFromCfg(120072026)
				local var_106_15 = arg_103_1:FormatText(var_106_14.content)

				arg_103_1.text_.text = var_106_15

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_16 = 12
				local var_106_17 = utf8.len(var_106_15)
				local var_106_18 = var_106_16 <= 0 and var_106_12 or var_106_12 * (var_106_17 / var_106_16)

				if var_106_18 > 0 and var_106_12 < var_106_18 then
					arg_103_1.talkMaxDuration = var_106_18

					if var_106_18 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_11
					end
				end

				arg_103_1.text_.text = var_106_15
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072026", "story_v_out_120072.awb") ~= 0 then
					local var_106_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072026", "story_v_out_120072.awb") / 1000

					if var_106_19 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_11
					end

					if var_106_14.prefab_name ~= "" and arg_103_1.actors_[var_106_14.prefab_name] ~= nil then
						local var_106_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_14.prefab_name].transform, "story_v_out_120072", "120072026", "story_v_out_120072.awb")

						arg_103_1:RecordAudio("120072026", var_106_20)
						arg_103_1:RecordAudio("120072026", var_106_20)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_120072", "120072026", "story_v_out_120072.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_120072", "120072026", "story_v_out_120072.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_21 = math.max(var_106_12, arg_103_1.talkMaxDuration)

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_21 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_11) / var_106_21

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_11 + var_106_21 and arg_103_1.time_ < var_106_11 + var_106_21 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play120072027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 120072027
		arg_107_1.duration_ = 9.6

		local var_107_0 = {
			zh = 4.033,
			ja = 9.6
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
				arg_107_0:Play120072028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_110_1 = 0
			local var_110_2 = 0.575

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_3 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_4 = arg_107_1:GetWordFromCfg(120072027)
				local var_110_5 = arg_107_1:FormatText(var_110_4.content)

				arg_107_1.text_.text = var_110_5

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_6 = 23
				local var_110_7 = utf8.len(var_110_5)
				local var_110_8 = var_110_6 <= 0 and var_110_2 or var_110_2 * (var_110_7 / var_110_6)

				if var_110_8 > 0 and var_110_2 < var_110_8 then
					arg_107_1.talkMaxDuration = var_110_8

					if var_110_8 + var_110_1 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_1
					end
				end

				arg_107_1.text_.text = var_110_5
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072027", "story_v_out_120072.awb") ~= 0 then
					local var_110_9 = manager.audio:GetVoiceLength("story_v_out_120072", "120072027", "story_v_out_120072.awb") / 1000

					if var_110_9 + var_110_1 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_9 + var_110_1
					end

					if var_110_4.prefab_name ~= "" and arg_107_1.actors_[var_110_4.prefab_name] ~= nil then
						local var_110_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_4.prefab_name].transform, "story_v_out_120072", "120072027", "story_v_out_120072.awb")

						arg_107_1:RecordAudio("120072027", var_110_10)
						arg_107_1:RecordAudio("120072027", var_110_10)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_120072", "120072027", "story_v_out_120072.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_120072", "120072027", "story_v_out_120072.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_11 = math.max(var_110_2, arg_107_1.talkMaxDuration)

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_11 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_1) / var_110_11

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_1 + var_110_11 and arg_107_1.time_ < var_110_1 + var_110_11 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play120072028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120072028
		arg_111_1.duration_ = 2.4

		local var_111_0 = {
			zh = 2.4,
			ja = 1.999999999999
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
				arg_111_0:Play120072029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1184ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1184ui_story == nil then
				arg_111_1.var_.characterEffect1184ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1184ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1184ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1184ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1184ui_story.fillRatio = var_114_5
			end

			local var_114_6 = arg_111_1.actors_["10044ui_story"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.characterEffect10044ui_story == nil then
				arg_111_1.var_.characterEffect10044ui_story = var_114_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_8 = 0.2

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.characterEffect10044ui_story then
					arg_111_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.characterEffect10044ui_story then
				arg_111_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_114_11 = 0
			local var_114_12 = 0.35

			if var_114_11 < arg_111_1.time_ and arg_111_1.time_ <= var_114_11 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_13 = arg_111_1:FormatText(StoryNameCfg[380].name)

				arg_111_1.leftNameTxt_.text = var_114_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_14 = arg_111_1:GetWordFromCfg(120072028)
				local var_114_15 = arg_111_1:FormatText(var_114_14.content)

				arg_111_1.text_.text = var_114_15

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_16 = 14
				local var_114_17 = utf8.len(var_114_15)
				local var_114_18 = var_114_16 <= 0 and var_114_12 or var_114_12 * (var_114_17 / var_114_16)

				if var_114_18 > 0 and var_114_12 < var_114_18 then
					arg_111_1.talkMaxDuration = var_114_18

					if var_114_18 + var_114_11 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_11
					end
				end

				arg_111_1.text_.text = var_114_15
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072028", "story_v_out_120072.awb") ~= 0 then
					local var_114_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072028", "story_v_out_120072.awb") / 1000

					if var_114_19 + var_114_11 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_19 + var_114_11
					end

					if var_114_14.prefab_name ~= "" and arg_111_1.actors_[var_114_14.prefab_name] ~= nil then
						local var_114_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_14.prefab_name].transform, "story_v_out_120072", "120072028", "story_v_out_120072.awb")

						arg_111_1:RecordAudio("120072028", var_114_20)
						arg_111_1:RecordAudio("120072028", var_114_20)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_120072", "120072028", "story_v_out_120072.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_120072", "120072028", "story_v_out_120072.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_21 = math.max(var_114_12, arg_111_1.talkMaxDuration)

			if var_114_11 <= arg_111_1.time_ and arg_111_1.time_ < var_114_11 + var_114_21 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_11) / var_114_21

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_11 + var_114_21 and arg_111_1.time_ < var_114_11 + var_114_21 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play120072029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120072029
		arg_115_1.duration_ = 7.533

		local var_115_0 = {
			zh = 3.1,
			ja = 7.533
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
				arg_115_0:Play120072030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1184ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1184ui_story == nil then
				arg_115_1.var_.characterEffect1184ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1184ui_story then
					arg_115_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1184ui_story then
				arg_115_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["10044ui_story"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect10044ui_story == nil then
				arg_115_1.var_.characterEffect10044ui_story = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.2

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect10044ui_story then
					local var_118_8 = Mathf.Lerp(0, 0.5, var_118_7)

					arg_115_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_115_1.var_.characterEffect10044ui_story.fillRatio = var_118_8
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect10044ui_story then
				local var_118_9 = 0.5

				arg_115_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_115_1.var_.characterEffect10044ui_story.fillRatio = var_118_9
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4312")
			end

			local var_118_12 = 0
			local var_118_13 = 0.25

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_14 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_15 = arg_115_1:GetWordFromCfg(120072029)
				local var_118_16 = arg_115_1:FormatText(var_118_15.content)

				arg_115_1.text_.text = var_118_16

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_17 = 10
				local var_118_18 = utf8.len(var_118_16)
				local var_118_19 = var_118_17 <= 0 and var_118_13 or var_118_13 * (var_118_18 / var_118_17)

				if var_118_19 > 0 and var_118_13 < var_118_19 then
					arg_115_1.talkMaxDuration = var_118_19

					if var_118_19 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_12
					end
				end

				arg_115_1.text_.text = var_118_16
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072029", "story_v_out_120072.awb") ~= 0 then
					local var_118_20 = manager.audio:GetVoiceLength("story_v_out_120072", "120072029", "story_v_out_120072.awb") / 1000

					if var_118_20 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_20 + var_118_12
					end

					if var_118_15.prefab_name ~= "" and arg_115_1.actors_[var_118_15.prefab_name] ~= nil then
						local var_118_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_15.prefab_name].transform, "story_v_out_120072", "120072029", "story_v_out_120072.awb")

						arg_115_1:RecordAudio("120072029", var_118_21)
						arg_115_1:RecordAudio("120072029", var_118_21)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120072", "120072029", "story_v_out_120072.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120072", "120072029", "story_v_out_120072.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_22 = math.max(var_118_13, arg_115_1.talkMaxDuration)

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_22 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_12) / var_118_22

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_12 + var_118_22 and arg_115_1.time_ < var_118_12 + var_118_22 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play120072030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120072030
		arg_119_1.duration_ = 13.433

		local var_119_0 = {
			zh = 8.6,
			ja = 13.433
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
				arg_119_0:Play120072031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_122_1 = 0
			local var_122_2 = 1.075

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_3 = arg_119_1:FormatText(StoryNameCfg[6].name)

				arg_119_1.leftNameTxt_.text = var_122_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_4 = arg_119_1:GetWordFromCfg(120072030)
				local var_122_5 = arg_119_1:FormatText(var_122_4.content)

				arg_119_1.text_.text = var_122_5

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_6 = 43
				local var_122_7 = utf8.len(var_122_5)
				local var_122_8 = var_122_6 <= 0 and var_122_2 or var_122_2 * (var_122_7 / var_122_6)

				if var_122_8 > 0 and var_122_2 < var_122_8 then
					arg_119_1.talkMaxDuration = var_122_8

					if var_122_8 + var_122_1 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_1
					end
				end

				arg_119_1.text_.text = var_122_5
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072030", "story_v_out_120072.awb") ~= 0 then
					local var_122_9 = manager.audio:GetVoiceLength("story_v_out_120072", "120072030", "story_v_out_120072.awb") / 1000

					if var_122_9 + var_122_1 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_9 + var_122_1
					end

					if var_122_4.prefab_name ~= "" and arg_119_1.actors_[var_122_4.prefab_name] ~= nil then
						local var_122_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_4.prefab_name].transform, "story_v_out_120072", "120072030", "story_v_out_120072.awb")

						arg_119_1:RecordAudio("120072030", var_122_10)
						arg_119_1:RecordAudio("120072030", var_122_10)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120072", "120072030", "story_v_out_120072.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120072", "120072030", "story_v_out_120072.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_11 = math.max(var_122_2, arg_119_1.talkMaxDuration)

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_11 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_1) / var_122_11

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_1 + var_122_11 and arg_119_1.time_ < var_122_1 + var_122_11 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play120072031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120072031
		arg_123_1.duration_ = 1.999999999999

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play120072032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1184ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1184ui_story == nil then
				arg_123_1.var_.characterEffect1184ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1184ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1184ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1184ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1184ui_story.fillRatio = var_126_5
			end

			local var_126_6 = arg_123_1.actors_["10044ui_story"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 and arg_123_1.var_.characterEffect10044ui_story == nil then
				arg_123_1.var_.characterEffect10044ui_story = var_126_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_8 = 0.2

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8

				if arg_123_1.var_.characterEffect10044ui_story then
					arg_123_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 and arg_123_1.var_.characterEffect10044ui_story then
				arg_123_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_126_11 = 0
			local var_126_12 = 0.125

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_13 = arg_123_1:FormatText(StoryNameCfg[380].name)

				arg_123_1.leftNameTxt_.text = var_126_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_14 = arg_123_1:GetWordFromCfg(120072031)
				local var_126_15 = arg_123_1:FormatText(var_126_14.content)

				arg_123_1.text_.text = var_126_15

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_16 = 5
				local var_126_17 = utf8.len(var_126_15)
				local var_126_18 = var_126_16 <= 0 and var_126_12 or var_126_12 * (var_126_17 / var_126_16)

				if var_126_18 > 0 and var_126_12 < var_126_18 then
					arg_123_1.talkMaxDuration = var_126_18

					if var_126_18 + var_126_11 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_18 + var_126_11
					end
				end

				arg_123_1.text_.text = var_126_15
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072031", "story_v_out_120072.awb") ~= 0 then
					local var_126_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072031", "story_v_out_120072.awb") / 1000

					if var_126_19 + var_126_11 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_11
					end

					if var_126_14.prefab_name ~= "" and arg_123_1.actors_[var_126_14.prefab_name] ~= nil then
						local var_126_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_14.prefab_name].transform, "story_v_out_120072", "120072031", "story_v_out_120072.awb")

						arg_123_1:RecordAudio("120072031", var_126_20)
						arg_123_1:RecordAudio("120072031", var_126_20)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_120072", "120072031", "story_v_out_120072.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_120072", "120072031", "story_v_out_120072.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_21 = math.max(var_126_12, arg_123_1.talkMaxDuration)

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_21 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_11) / var_126_21

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_11 + var_126_21 and arg_123_1.time_ < var_126_11 + var_126_21 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120072032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120072032
		arg_127_1.duration_ = 5.233

		local var_127_0 = {
			zh = 5.233,
			ja = 5
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
				arg_127_0:Play120072033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10044ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect10044ui_story == nil then
				arg_127_1.var_.characterEffect10044ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.2

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect10044ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_127_1.var_.characterEffect10044ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect10044ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_127_1.var_.characterEffect10044ui_story.fillRatio = var_130_5
			end

			local var_130_6 = 0

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_130_7 = arg_127_1.actors_["1184ui_story"]
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 and arg_127_1.var_.characterEffect1184ui_story == nil then
				arg_127_1.var_.characterEffect1184ui_story = var_130_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_9 = 0.2

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_8) / var_130_9

				if arg_127_1.var_.characterEffect1184ui_story then
					arg_127_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_8 + var_130_9 and arg_127_1.time_ < var_130_8 + var_130_9 + arg_130_0 and arg_127_1.var_.characterEffect1184ui_story then
				arg_127_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_130_11 = 0
			local var_130_12 = 0.6

			if var_130_11 < arg_127_1.time_ and arg_127_1.time_ <= var_130_11 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_13 = arg_127_1:FormatText(StoryNameCfg[6].name)

				arg_127_1.leftNameTxt_.text = var_130_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_14 = arg_127_1:GetWordFromCfg(120072032)
				local var_130_15 = arg_127_1:FormatText(var_130_14.content)

				arg_127_1.text_.text = var_130_15

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_16 = 24
				local var_130_17 = utf8.len(var_130_15)
				local var_130_18 = var_130_16 <= 0 and var_130_12 or var_130_12 * (var_130_17 / var_130_16)

				if var_130_18 > 0 and var_130_12 < var_130_18 then
					arg_127_1.talkMaxDuration = var_130_18

					if var_130_18 + var_130_11 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_18 + var_130_11
					end
				end

				arg_127_1.text_.text = var_130_15
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072032", "story_v_out_120072.awb") ~= 0 then
					local var_130_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072032", "story_v_out_120072.awb") / 1000

					if var_130_19 + var_130_11 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_19 + var_130_11
					end

					if var_130_14.prefab_name ~= "" and arg_127_1.actors_[var_130_14.prefab_name] ~= nil then
						local var_130_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_14.prefab_name].transform, "story_v_out_120072", "120072032", "story_v_out_120072.awb")

						arg_127_1:RecordAudio("120072032", var_130_20)
						arg_127_1:RecordAudio("120072032", var_130_20)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_120072", "120072032", "story_v_out_120072.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_120072", "120072032", "story_v_out_120072.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_21 = math.max(var_130_12, arg_127_1.talkMaxDuration)

			if var_130_11 <= arg_127_1.time_ and arg_127_1.time_ < var_130_11 + var_130_21 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_11) / var_130_21

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_11 + var_130_21 and arg_127_1.time_ < var_130_11 + var_130_21 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120072033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120072033
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play120072034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1184ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1184ui_story == nil then
				arg_131_1.var_.characterEffect1184ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1184ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1184ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1184ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1184ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 1.275

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_8 = arg_131_1:GetWordFromCfg(120072033)
				local var_134_9 = arg_131_1:FormatText(var_134_8.content)

				arg_131_1.text_.text = var_134_9

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_10 = 51
				local var_134_11 = utf8.len(var_134_9)
				local var_134_12 = var_134_10 <= 0 and var_134_7 or var_134_7 * (var_134_11 / var_134_10)

				if var_134_12 > 0 and var_134_7 < var_134_12 then
					arg_131_1.talkMaxDuration = var_134_12

					if var_134_12 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_12 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_9
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_13 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_13 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_13

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_13 and arg_131_1.time_ < var_134_6 + var_134_13 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120072034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120072034
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play120072035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 1.025

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

				local var_138_2 = arg_135_1:GetWordFromCfg(120072034)
				local var_138_3 = arg_135_1:FormatText(var_138_2.content)

				arg_135_1.text_.text = var_138_3

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_4 = 41
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
	Play120072035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120072035
		arg_139_1.duration_ = 7

		local var_139_0 = {
			zh = 5.766,
			ja = 7
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
				arg_139_0:Play120072036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_142_1 = arg_139_1.actors_["1184ui_story"]
			local var_142_2 = 0

			if var_142_2 < arg_139_1.time_ and arg_139_1.time_ <= var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1184ui_story == nil then
				arg_139_1.var_.characterEffect1184ui_story = var_142_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_3 = 0.2

			if var_142_2 <= arg_139_1.time_ and arg_139_1.time_ < var_142_2 + var_142_3 then
				local var_142_4 = (arg_139_1.time_ - var_142_2) / var_142_3

				if arg_139_1.var_.characterEffect1184ui_story then
					arg_139_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_2 + var_142_3 and arg_139_1.time_ < var_142_2 + var_142_3 + arg_142_0 and arg_139_1.var_.characterEffect1184ui_story then
				arg_139_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_142_5 = 0
			local var_142_6 = 0.7

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_7 = arg_139_1:FormatText(StoryNameCfg[6].name)

				arg_139_1.leftNameTxt_.text = var_142_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_8 = arg_139_1:GetWordFromCfg(120072035)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 28
				local var_142_11 = utf8.len(var_142_9)
				local var_142_12 = var_142_10 <= 0 and var_142_6 or var_142_6 * (var_142_11 / var_142_10)

				if var_142_12 > 0 and var_142_6 < var_142_12 then
					arg_139_1.talkMaxDuration = var_142_12

					if var_142_12 + var_142_5 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_12 + var_142_5
					end
				end

				arg_139_1.text_.text = var_142_9
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072035", "story_v_out_120072.awb") ~= 0 then
					local var_142_13 = manager.audio:GetVoiceLength("story_v_out_120072", "120072035", "story_v_out_120072.awb") / 1000

					if var_142_13 + var_142_5 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_13 + var_142_5
					end

					if var_142_8.prefab_name ~= "" and arg_139_1.actors_[var_142_8.prefab_name] ~= nil then
						local var_142_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_8.prefab_name].transform, "story_v_out_120072", "120072035", "story_v_out_120072.awb")

						arg_139_1:RecordAudio("120072035", var_142_14)
						arg_139_1:RecordAudio("120072035", var_142_14)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_120072", "120072035", "story_v_out_120072.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_120072", "120072035", "story_v_out_120072.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_15 = math.max(var_142_6, arg_139_1.talkMaxDuration)

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_15 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_5) / var_142_15

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_5 + var_142_15 and arg_139_1.time_ < var_142_5 + var_142_15 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120072036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120072036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play120072037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1184ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1184ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, 100, 0)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1184ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, 100, 0)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["10044ui_story"].transform
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1.var_.moveOldPos10044ui_story = var_146_9.localPosition
			end

			local var_146_11 = 0.001

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11
				local var_146_13 = Vector3.New(0, 100, 0)

				var_146_9.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10044ui_story, var_146_13, var_146_12)

				local var_146_14 = manager.ui.mainCamera.transform.position - var_146_9.position

				var_146_9.forward = Vector3.New(var_146_14.x, var_146_14.y, var_146_14.z)

				local var_146_15 = var_146_9.localEulerAngles

				var_146_15.z = 0
				var_146_15.x = 0
				var_146_9.localEulerAngles = var_146_15
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 then
				var_146_9.localPosition = Vector3.New(0, 100, 0)

				local var_146_16 = manager.ui.mainCamera.transform.position - var_146_9.position

				var_146_9.forward = Vector3.New(var_146_16.x, var_146_16.y, var_146_16.z)

				local var_146_17 = var_146_9.localEulerAngles

				var_146_17.z = 0
				var_146_17.x = 0
				var_146_9.localEulerAngles = var_146_17
			end

			local var_146_18 = 0
			local var_146_19 = 0.825

			if var_146_18 < arg_143_1.time_ and arg_143_1.time_ <= var_146_18 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_20 = arg_143_1:GetWordFromCfg(120072036)
				local var_146_21 = arg_143_1:FormatText(var_146_20.content)

				arg_143_1.text_.text = var_146_21

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_22 = 33
				local var_146_23 = utf8.len(var_146_21)
				local var_146_24 = var_146_22 <= 0 and var_146_19 or var_146_19 * (var_146_23 / var_146_22)

				if var_146_24 > 0 and var_146_19 < var_146_24 then
					arg_143_1.talkMaxDuration = var_146_24

					if var_146_24 + var_146_18 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_24 + var_146_18
					end
				end

				arg_143_1.text_.text = var_146_21
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_25 = math.max(var_146_19, arg_143_1.talkMaxDuration)

			if var_146_18 <= arg_143_1.time_ and arg_143_1.time_ < var_146_18 + var_146_25 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_18) / var_146_25

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_18 + var_146_25 and arg_143_1.time_ < var_146_18 + var_146_25 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play120072037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120072037
		arg_147_1.duration_ = 1.666

		local var_147_0 = {
			zh = 1.066,
			ja = 1.666
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
				arg_147_0:Play120072038(arg_147_1)
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

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[6].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, true)
				arg_147_1.iconController_:SetSelectedState("hero")

				arg_147_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(120072037)
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072037", "story_v_out_120072.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_120072", "120072037", "story_v_out_120072.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_120072", "120072037", "story_v_out_120072.awb")

						arg_147_1:RecordAudio("120072037", var_150_9)
						arg_147_1:RecordAudio("120072037", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120072", "120072037", "story_v_out_120072.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120072", "120072037", "story_v_out_120072.awb")
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
	Play120072038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120072038
		arg_151_1.duration_ = 6.066

		local var_151_0 = {
			zh = 3.133,
			ja = 6.066
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
				arg_151_0:Play120072039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.4

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[380].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, true)
				arg_151_1.iconController_:SetSelectedState("hero")

				arg_151_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(120072038)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072038", "story_v_out_120072.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_120072", "120072038", "story_v_out_120072.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_120072", "120072038", "story_v_out_120072.awb")

						arg_151_1:RecordAudio("120072038", var_154_9)
						arg_151_1:RecordAudio("120072038", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120072", "120072038", "story_v_out_120072.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120072", "120072038", "story_v_out_120072.awb")
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
	Play120072039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120072039
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play120072040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.075

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_2 = arg_155_1:GetWordFromCfg(120072039)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 43
				local var_158_5 = utf8.len(var_158_3)
				local var_158_6 = var_158_4 <= 0 and var_158_1 or var_158_1 * (var_158_5 / var_158_4)

				if var_158_6 > 0 and var_158_1 < var_158_6 then
					arg_155_1.talkMaxDuration = var_158_6

					if var_158_6 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_6 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_3
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_7 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_7 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_7

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_7 and arg_155_1.time_ < var_158_0 + var_158_7 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play120072040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120072040
		arg_159_1.duration_ = 3.4

		local var_159_0 = {
			zh = 1.9,
			ja = 3.4
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
				arg_159_0:Play120072041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.25

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[6].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, true)
				arg_159_1.iconController_:SetSelectedState("hero")

				arg_159_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(120072040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072040", "story_v_out_120072.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_120072", "120072040", "story_v_out_120072.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_120072", "120072040", "story_v_out_120072.awb")

						arg_159_1:RecordAudio("120072040", var_162_9)
						arg_159_1:RecordAudio("120072040", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120072", "120072040", "story_v_out_120072.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120072", "120072040", "story_v_out_120072.awb")
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
	Play120072041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120072041
		arg_163_1.duration_ = 2.166

		local var_163_0 = {
			zh = 1.333,
			ja = 2.166
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
				arg_163_0:Play120072042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.1

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[380].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, true)
				arg_163_1.iconController_:SetSelectedState("hero")

				arg_163_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(120072041)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 4
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072041", "story_v_out_120072.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_120072", "120072041", "story_v_out_120072.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_120072", "120072041", "story_v_out_120072.awb")

						arg_163_1:RecordAudio("120072041", var_166_9)
						arg_163_1:RecordAudio("120072041", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_120072", "120072041", "story_v_out_120072.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_120072", "120072041", "story_v_out_120072.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120072042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120072042
		arg_167_1.duration_ = 2.2

		local var_167_0 = {
			zh = 2.2,
			ja = 1.999999999999
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
				arg_167_0:Play120072043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1184ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1184ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(-0.7, -0.97, -6)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1184ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = 0

			if var_170_9 < arg_167_1.time_ and arg_167_1.time_ <= var_170_9 + arg_170_0 then
				arg_167_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_170_11 = arg_167_1.actors_["1184ui_story"]
			local var_170_12 = 0

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 and arg_167_1.var_.characterEffect1184ui_story == nil then
				arg_167_1.var_.characterEffect1184ui_story = var_170_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_13 = 0.2

			if var_170_12 <= arg_167_1.time_ and arg_167_1.time_ < var_170_12 + var_170_13 then
				local var_170_14 = (arg_167_1.time_ - var_170_12) / var_170_13

				if arg_167_1.var_.characterEffect1184ui_story then
					arg_167_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_12 + var_170_13 and arg_167_1.time_ < var_170_12 + var_170_13 + arg_170_0 and arg_167_1.var_.characterEffect1184ui_story then
				arg_167_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_170_15 = 0
			local var_170_16 = 0.225

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_17 = arg_167_1:FormatText(StoryNameCfg[6].name)

				arg_167_1.leftNameTxt_.text = var_170_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_18 = arg_167_1:GetWordFromCfg(120072042)
				local var_170_19 = arg_167_1:FormatText(var_170_18.content)

				arg_167_1.text_.text = var_170_19

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_20 = 9
				local var_170_21 = utf8.len(var_170_19)
				local var_170_22 = var_170_20 <= 0 and var_170_16 or var_170_16 * (var_170_21 / var_170_20)

				if var_170_22 > 0 and var_170_16 < var_170_22 then
					arg_167_1.talkMaxDuration = var_170_22

					if var_170_22 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_22 + var_170_15
					end
				end

				arg_167_1.text_.text = var_170_19
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072042", "story_v_out_120072.awb") ~= 0 then
					local var_170_23 = manager.audio:GetVoiceLength("story_v_out_120072", "120072042", "story_v_out_120072.awb") / 1000

					if var_170_23 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_23 + var_170_15
					end

					if var_170_18.prefab_name ~= "" and arg_167_1.actors_[var_170_18.prefab_name] ~= nil then
						local var_170_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_18.prefab_name].transform, "story_v_out_120072", "120072042", "story_v_out_120072.awb")

						arg_167_1:RecordAudio("120072042", var_170_24)
						arg_167_1:RecordAudio("120072042", var_170_24)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120072", "120072042", "story_v_out_120072.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120072", "120072042", "story_v_out_120072.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_25 = math.max(var_170_16, arg_167_1.talkMaxDuration)

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_25 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_15) / var_170_25

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_15 + var_170_25 and arg_167_1.time_ < var_170_15 + var_170_25 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120072043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120072043
		arg_171_1.duration_ = 6.2

		local var_171_0 = {
			zh = 3.533,
			ja = 6.2
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
				arg_171_0:Play120072044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = "1075ui_story"

			if arg_171_1.actors_[var_174_0] == nil then
				local var_174_1 = Object.Instantiate(Asset.Load("Char/" .. var_174_0), arg_171_1.stage_.transform)

				var_174_1.name = var_174_0
				var_174_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_171_1.actors_[var_174_0] = var_174_1

				local var_174_2 = var_174_1:GetComponentInChildren(typeof(CharacterEffect))

				var_174_2.enabled = true

				local var_174_3 = GameObjectTools.GetOrAddComponent(var_174_1, typeof(DynamicBoneHelper))

				if var_174_3 then
					var_174_3:EnableDynamicBone(false)
				end

				arg_171_1:ShowWeapon(var_174_2.transform, false)

				arg_171_1.var_[var_174_0 .. "Animator"] = var_174_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_171_1.var_[var_174_0 .. "Animator"].applyRootMotion = true
				arg_171_1.var_[var_174_0 .. "LipSync"] = var_174_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_174_4 = arg_171_1.actors_["1075ui_story"].transform
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 then
				arg_171_1.var_.moveOldPos1075ui_story = var_174_4.localPosition
			end

			local var_174_6 = 0.001

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6
				local var_174_8 = Vector3.New(0.7, -1.055, -6.16)

				var_174_4.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1075ui_story, var_174_8, var_174_7)

				local var_174_9 = manager.ui.mainCamera.transform.position - var_174_4.position

				var_174_4.forward = Vector3.New(var_174_9.x, var_174_9.y, var_174_9.z)

				local var_174_10 = var_174_4.localEulerAngles

				var_174_10.z = 0
				var_174_10.x = 0
				var_174_4.localEulerAngles = var_174_10
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 then
				var_174_4.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_174_11 = manager.ui.mainCamera.transform.position - var_174_4.position

				var_174_4.forward = Vector3.New(var_174_11.x, var_174_11.y, var_174_11.z)

				local var_174_12 = var_174_4.localEulerAngles

				var_174_12.z = 0
				var_174_12.x = 0
				var_174_4.localEulerAngles = var_174_12
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_174_15 = arg_171_1.actors_["1075ui_story"]
			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 and arg_171_1.var_.characterEffect1075ui_story == nil then
				arg_171_1.var_.characterEffect1075ui_story = var_174_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_17 = 0.2

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17

				if arg_171_1.var_.characterEffect1075ui_story then
					arg_171_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 and arg_171_1.var_.characterEffect1075ui_story then
				arg_171_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_174_19 = arg_171_1.actors_["1184ui_story"]
			local var_174_20 = 0

			if var_174_20 < arg_171_1.time_ and arg_171_1.time_ <= var_174_20 + arg_174_0 and arg_171_1.var_.characterEffect1184ui_story == nil then
				arg_171_1.var_.characterEffect1184ui_story = var_174_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_21 = 0.2

			if var_174_20 <= arg_171_1.time_ and arg_171_1.time_ < var_174_20 + var_174_21 then
				local var_174_22 = (arg_171_1.time_ - var_174_20) / var_174_21

				if arg_171_1.var_.characterEffect1184ui_story then
					local var_174_23 = Mathf.Lerp(0, 0.5, var_174_22)

					arg_171_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1184ui_story.fillRatio = var_174_23
				end
			end

			if arg_171_1.time_ >= var_174_20 + var_174_21 and arg_171_1.time_ < var_174_20 + var_174_21 + arg_174_0 and arg_171_1.var_.characterEffect1184ui_story then
				local var_174_24 = 0.5

				arg_171_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1184ui_story.fillRatio = var_174_24
			end

			local var_174_25 = 0
			local var_174_26 = 0.425

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_27 = arg_171_1:FormatText(StoryNameCfg[381].name)

				arg_171_1.leftNameTxt_.text = var_174_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_28 = arg_171_1:GetWordFromCfg(120072043)
				local var_174_29 = arg_171_1:FormatText(var_174_28.content)

				arg_171_1.text_.text = var_174_29

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_30 = 17
				local var_174_31 = utf8.len(var_174_29)
				local var_174_32 = var_174_30 <= 0 and var_174_26 or var_174_26 * (var_174_31 / var_174_30)

				if var_174_32 > 0 and var_174_26 < var_174_32 then
					arg_171_1.talkMaxDuration = var_174_32

					if var_174_32 + var_174_25 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_32 + var_174_25
					end
				end

				arg_171_1.text_.text = var_174_29
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072043", "story_v_out_120072.awb") ~= 0 then
					local var_174_33 = manager.audio:GetVoiceLength("story_v_out_120072", "120072043", "story_v_out_120072.awb") / 1000

					if var_174_33 + var_174_25 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_33 + var_174_25
					end

					if var_174_28.prefab_name ~= "" and arg_171_1.actors_[var_174_28.prefab_name] ~= nil then
						local var_174_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_28.prefab_name].transform, "story_v_out_120072", "120072043", "story_v_out_120072.awb")

						arg_171_1:RecordAudio("120072043", var_174_34)
						arg_171_1:RecordAudio("120072043", var_174_34)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120072", "120072043", "story_v_out_120072.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120072", "120072043", "story_v_out_120072.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_35 = math.max(var_174_26, arg_171_1.talkMaxDuration)

			if var_174_25 <= arg_171_1.time_ and arg_171_1.time_ < var_174_25 + var_174_35 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_25) / var_174_35

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_25 + var_174_35 and arg_171_1.time_ < var_174_25 + var_174_35 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play120072044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120072044
		arg_175_1.duration_ = 5.8

		local var_175_0 = {
			zh = 3.333,
			ja = 5.8
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
				arg_175_0:Play120072045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4137")
			end

			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_178_2 = arg_175_1.actors_["1184ui_story"]
			local var_178_3 = 0

			if var_178_3 < arg_175_1.time_ and arg_175_1.time_ <= var_178_3 + arg_178_0 and arg_175_1.var_.characterEffect1184ui_story == nil then
				arg_175_1.var_.characterEffect1184ui_story = var_178_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_4 = 0.2

			if var_178_3 <= arg_175_1.time_ and arg_175_1.time_ < var_178_3 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_3) / var_178_4

				if arg_175_1.var_.characterEffect1184ui_story then
					arg_175_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_3 + var_178_4 and arg_175_1.time_ < var_178_3 + var_178_4 + arg_178_0 and arg_175_1.var_.characterEffect1184ui_story then
				arg_175_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_178_6 = arg_175_1.actors_["1075ui_story"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 and arg_175_1.var_.characterEffect1075ui_story == nil then
				arg_175_1.var_.characterEffect1075ui_story = var_178_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_8 = 0.2

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_8 then
				local var_178_9 = (arg_175_1.time_ - var_178_7) / var_178_8

				if arg_175_1.var_.characterEffect1075ui_story then
					local var_178_10 = Mathf.Lerp(0, 0.5, var_178_9)

					arg_175_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1075ui_story.fillRatio = var_178_10
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_8 and arg_175_1.time_ < var_178_7 + var_178_8 + arg_178_0 and arg_175_1.var_.characterEffect1075ui_story then
				local var_178_11 = 0.5

				arg_175_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1075ui_story.fillRatio = var_178_11
			end

			local var_178_12 = 0
			local var_178_13 = 0.3

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_14 = arg_175_1:FormatText(StoryNameCfg[6].name)

				arg_175_1.leftNameTxt_.text = var_178_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_15 = arg_175_1:GetWordFromCfg(120072044)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 12
				local var_178_18 = utf8.len(var_178_16)
				local var_178_19 = var_178_17 <= 0 and var_178_13 or var_178_13 * (var_178_18 / var_178_17)

				if var_178_19 > 0 and var_178_13 < var_178_19 then
					arg_175_1.talkMaxDuration = var_178_19

					if var_178_19 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_19 + var_178_12
					end
				end

				arg_175_1.text_.text = var_178_16
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072044", "story_v_out_120072.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_120072", "120072044", "story_v_out_120072.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_120072", "120072044", "story_v_out_120072.awb")

						arg_175_1:RecordAudio("120072044", var_178_21)
						arg_175_1:RecordAudio("120072044", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120072", "120072044", "story_v_out_120072.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120072", "120072044", "story_v_out_120072.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_22 = math.max(var_178_13, arg_175_1.talkMaxDuration)

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_22 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_12) / var_178_22

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_12 + var_178_22 and arg_175_1.time_ < var_178_12 + var_178_22 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120072045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120072045
		arg_179_1.duration_ = 5.7

		local var_179_0 = {
			zh = 3,
			ja = 5.7
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
				arg_179_0:Play120072046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1075ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1075ui_story == nil then
				arg_179_1.var_.characterEffect1075ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1075ui_story then
					arg_179_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1075ui_story then
				arg_179_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_182_4 = arg_179_1.actors_["1184ui_story"]
			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 and arg_179_1.var_.characterEffect1184ui_story == nil then
				arg_179_1.var_.characterEffect1184ui_story = var_182_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_6 = 0.2

			if var_182_5 <= arg_179_1.time_ and arg_179_1.time_ < var_182_5 + var_182_6 then
				local var_182_7 = (arg_179_1.time_ - var_182_5) / var_182_6

				if arg_179_1.var_.characterEffect1184ui_story then
					local var_182_8 = Mathf.Lerp(0, 0.5, var_182_7)

					arg_179_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1184ui_story.fillRatio = var_182_8
				end
			end

			if arg_179_1.time_ >= var_182_5 + var_182_6 and arg_179_1.time_ < var_182_5 + var_182_6 + arg_182_0 and arg_179_1.var_.characterEffect1184ui_story then
				local var_182_9 = 0.5

				arg_179_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1184ui_story.fillRatio = var_182_9
			end

			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 then
				arg_179_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_182_11 = 0
			local var_182_12 = 0.575

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_13 = arg_179_1:FormatText(StoryNameCfg[381].name)

				arg_179_1.leftNameTxt_.text = var_182_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_14 = arg_179_1:GetWordFromCfg(120072045)
				local var_182_15 = arg_179_1:FormatText(var_182_14.content)

				arg_179_1.text_.text = var_182_15

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_16 = 25
				local var_182_17 = utf8.len(var_182_15)
				local var_182_18 = var_182_16 <= 0 and var_182_12 or var_182_12 * (var_182_17 / var_182_16)

				if var_182_18 > 0 and var_182_12 < var_182_18 then
					arg_179_1.talkMaxDuration = var_182_18

					if var_182_18 + var_182_11 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_18 + var_182_11
					end
				end

				arg_179_1.text_.text = var_182_15
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072045", "story_v_out_120072.awb") ~= 0 then
					local var_182_19 = manager.audio:GetVoiceLength("story_v_out_120072", "120072045", "story_v_out_120072.awb") / 1000

					if var_182_19 + var_182_11 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_19 + var_182_11
					end

					if var_182_14.prefab_name ~= "" and arg_179_1.actors_[var_182_14.prefab_name] ~= nil then
						local var_182_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_14.prefab_name].transform, "story_v_out_120072", "120072045", "story_v_out_120072.awb")

						arg_179_1:RecordAudio("120072045", var_182_20)
						arg_179_1:RecordAudio("120072045", var_182_20)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_120072", "120072045", "story_v_out_120072.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_120072", "120072045", "story_v_out_120072.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_21 = math.max(var_182_12, arg_179_1.talkMaxDuration)

			if var_182_11 <= arg_179_1.time_ and arg_179_1.time_ < var_182_11 + var_182_21 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_11) / var_182_21

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_11 + var_182_21 and arg_179_1.time_ < var_182_11 + var_182_21 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120072046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120072046
		arg_183_1.duration_ = 3.166

		local var_183_0 = {
			zh = 1.533,
			ja = 3.166
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
				arg_183_0:Play120072047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1075ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story == nil then
				arg_183_1.var_.characterEffect1075ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1075ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_5
			end

			local var_186_6 = 0
			local var_186_7 = 0.15

			if var_186_6 < arg_183_1.time_ and arg_183_1.time_ <= var_186_6 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_8 = arg_183_1:FormatText(StoryNameCfg[380].name)

				arg_183_1.leftNameTxt_.text = var_186_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, true)
				arg_183_1.iconController_:SetSelectedState("hero")

				arg_183_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_9 = arg_183_1:GetWordFromCfg(120072046)
				local var_186_10 = arg_183_1:FormatText(var_186_9.content)

				arg_183_1.text_.text = var_186_10

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_11 = 6
				local var_186_12 = utf8.len(var_186_10)
				local var_186_13 = var_186_11 <= 0 and var_186_7 or var_186_7 * (var_186_12 / var_186_11)

				if var_186_13 > 0 and var_186_7 < var_186_13 then
					arg_183_1.talkMaxDuration = var_186_13

					if var_186_13 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_13 + var_186_6
					end
				end

				arg_183_1.text_.text = var_186_10
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072046", "story_v_out_120072.awb") ~= 0 then
					local var_186_14 = manager.audio:GetVoiceLength("story_v_out_120072", "120072046", "story_v_out_120072.awb") / 1000

					if var_186_14 + var_186_6 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_14 + var_186_6
					end

					if var_186_9.prefab_name ~= "" and arg_183_1.actors_[var_186_9.prefab_name] ~= nil then
						local var_186_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_9.prefab_name].transform, "story_v_out_120072", "120072046", "story_v_out_120072.awb")

						arg_183_1:RecordAudio("120072046", var_186_15)
						arg_183_1:RecordAudio("120072046", var_186_15)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120072", "120072046", "story_v_out_120072.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120072", "120072046", "story_v_out_120072.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_16 = math.max(var_186_7, arg_183_1.talkMaxDuration)

			if var_186_6 <= arg_183_1.time_ and arg_183_1.time_ < var_186_6 + var_186_16 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_6) / var_186_16

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_6 + var_186_16 and arg_183_1.time_ < var_186_6 + var_186_16 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120072047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120072047
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120072048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.475

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_2 = arg_187_1:GetWordFromCfg(120072047)
				local var_190_3 = arg_187_1:FormatText(var_190_2.content)

				arg_187_1.text_.text = var_190_3

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_4 = 19
				local var_190_5 = utf8.len(var_190_3)
				local var_190_6 = var_190_4 <= 0 and var_190_1 or var_190_1 * (var_190_5 / var_190_4)

				if var_190_6 > 0 and var_190_1 < var_190_6 then
					arg_187_1.talkMaxDuration = var_190_6

					if var_190_6 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_6 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_3
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_7 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_7 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_7

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_7 and arg_187_1.time_ < var_190_0 + var_190_7 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120072048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120072048
		arg_191_1.duration_ = 5.666

		local var_191_0 = {
			zh = 5.666,
			ja = 2.5
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
				arg_191_0:Play120072049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1184ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1184ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0, 100, 0)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1184ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0, 100, 0)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["10044ui_story"].transform
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1.var_.moveOldPos10044ui_story = var_194_9.localPosition
			end

			local var_194_11 = 0.001

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11
				local var_194_13 = Vector3.New(-0.7, -0.72, -6.3)

				var_194_9.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10044ui_story, var_194_13, var_194_12)

				local var_194_14 = manager.ui.mainCamera.transform.position - var_194_9.position

				var_194_9.forward = Vector3.New(var_194_14.x, var_194_14.y, var_194_14.z)

				local var_194_15 = var_194_9.localEulerAngles

				var_194_15.z = 0
				var_194_15.x = 0
				var_194_9.localEulerAngles = var_194_15
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 then
				var_194_9.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_194_16 = manager.ui.mainCamera.transform.position - var_194_9.position

				var_194_9.forward = Vector3.New(var_194_16.x, var_194_16.y, var_194_16.z)

				local var_194_17 = var_194_9.localEulerAngles

				var_194_17.z = 0
				var_194_17.x = 0
				var_194_9.localEulerAngles = var_194_17
			end

			local var_194_18 = 0

			if var_194_18 < arg_191_1.time_ and arg_191_1.time_ <= var_194_18 + arg_194_0 then
				arg_191_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_194_19 = 0

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_194_20 = arg_191_1.actors_["10044ui_story"]
			local var_194_21 = 0

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 and arg_191_1.var_.characterEffect10044ui_story == nil then
				arg_191_1.var_.characterEffect10044ui_story = var_194_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_22 = 0.2

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_21) / var_194_22

				if arg_191_1.var_.characterEffect10044ui_story then
					arg_191_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_21 + var_194_22 and arg_191_1.time_ < var_194_21 + var_194_22 + arg_194_0 and arg_191_1.var_.characterEffect10044ui_story then
				arg_191_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_194_24 = arg_191_1.actors_["10044ui_story"]
			local var_194_25 = 0

			if var_194_25 < arg_191_1.time_ and arg_191_1.time_ <= var_194_25 + arg_194_0 and arg_191_1.var_.characterEffect10044ui_story == nil then
				arg_191_1.var_.characterEffect10044ui_story = var_194_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_26 = 0.2

			if var_194_25 <= arg_191_1.time_ and arg_191_1.time_ < var_194_25 + var_194_26 then
				local var_194_27 = (arg_191_1.time_ - var_194_25) / var_194_26

				if arg_191_1.var_.characterEffect10044ui_story then
					arg_191_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_25 + var_194_26 and arg_191_1.time_ < var_194_25 + var_194_26 + arg_194_0 and arg_191_1.var_.characterEffect10044ui_story then
				arg_191_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_194_28 = 0
			local var_194_29 = 0.65

			if var_194_28 < arg_191_1.time_ and arg_191_1.time_ <= var_194_28 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_30 = arg_191_1:FormatText(StoryNameCfg[380].name)

				arg_191_1.leftNameTxt_.text = var_194_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_31 = arg_191_1:GetWordFromCfg(120072048)
				local var_194_32 = arg_191_1:FormatText(var_194_31.content)

				arg_191_1.text_.text = var_194_32

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_33 = 26
				local var_194_34 = utf8.len(var_194_32)
				local var_194_35 = var_194_33 <= 0 and var_194_29 or var_194_29 * (var_194_34 / var_194_33)

				if var_194_35 > 0 and var_194_29 < var_194_35 then
					arg_191_1.talkMaxDuration = var_194_35

					if var_194_35 + var_194_28 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_35 + var_194_28
					end
				end

				arg_191_1.text_.text = var_194_32
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072048", "story_v_out_120072.awb") ~= 0 then
					local var_194_36 = manager.audio:GetVoiceLength("story_v_out_120072", "120072048", "story_v_out_120072.awb") / 1000

					if var_194_36 + var_194_28 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_36 + var_194_28
					end

					if var_194_31.prefab_name ~= "" and arg_191_1.actors_[var_194_31.prefab_name] ~= nil then
						local var_194_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_31.prefab_name].transform, "story_v_out_120072", "120072048", "story_v_out_120072.awb")

						arg_191_1:RecordAudio("120072048", var_194_37)
						arg_191_1:RecordAudio("120072048", var_194_37)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_120072", "120072048", "story_v_out_120072.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_120072", "120072048", "story_v_out_120072.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_38 = math.max(var_194_29, arg_191_1.talkMaxDuration)

			if var_194_28 <= arg_191_1.time_ and arg_191_1.time_ < var_194_28 + var_194_38 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_28) / var_194_38

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_28 + var_194_38 and arg_191_1.time_ < var_194_28 + var_194_38 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120072049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120072049
		arg_195_1.duration_ = 2.9

		local var_195_0 = {
			zh = 1.999999999999,
			ja = 2.9
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
			arg_195_1.auto_ = false
		end

		function arg_195_1.playNext_(arg_197_0)
			arg_195_1.onStoryFinished_()
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_198_1 = 0
			local var_198_2 = 0.175

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_3 = arg_195_1:FormatText(StoryNameCfg[380].name)

				arg_195_1.leftNameTxt_.text = var_198_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_4 = arg_195_1:GetWordFromCfg(120072049)
				local var_198_5 = arg_195_1:FormatText(var_198_4.content)

				arg_195_1.text_.text = var_198_5

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_6 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_120072", "120072049", "story_v_out_120072.awb") ~= 0 then
					local var_198_9 = manager.audio:GetVoiceLength("story_v_out_120072", "120072049", "story_v_out_120072.awb") / 1000

					if var_198_9 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_9 + var_198_1
					end

					if var_198_4.prefab_name ~= "" and arg_195_1.actors_[var_198_4.prefab_name] ~= nil then
						local var_198_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_4.prefab_name].transform, "story_v_out_120072", "120072049", "story_v_out_120072.awb")

						arg_195_1:RecordAudio("120072049", var_198_10)
						arg_195_1:RecordAudio("120072049", var_198_10)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120072", "120072049", "story_v_out_120072.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120072", "120072049", "story_v_out_120072.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/J03g"
	},
	voices = {
		"story_v_out_120072.awb"
	}
}
